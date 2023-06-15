package manage;
import java.io.*;
import java.net.URL;
import java.util.Vector;
import com.db.connection.*;
import java.sql.*;

/*Custom Designed User Activity Repository for User Action Progress*/
/*Rajesh*/
/*05 Mei 2004*/
public class UserRepository{
public synchronized static boolean addUser(String uid,String remoteip)
   {
     boolean flag=false;
     ConnectorDB con = null;
     Connection db = null;
     ResultSet rs = null;
     PreparedStatement ps = null;
     try{
       UserRepository.destroyUser(uid,true);
       con = new ConnectorDB();
       db = con.getConnection();
       if (db != null) {
         ps = db.prepareStatement(
             "select user_id from active_users where user_id='" + uid.trim() + "'");
         rs = ps.executeQuery();
         if (rs.next())
         {
           flag=false;
         }
         else
         {
           db.prepareStatement("insert into active_users(user_id,in_date,in_time,timout,remote_ip) values('" + uid + "',sysdate,to_char(sysdate,'hh:mi:ss PM'),0,'"+ remoteip + "')").execute();
           flag=true;
         }
       }
     }catch(Exception err)
     {
       flag=false;
       err.printStackTrace();
     }
     finally{
       try{
         rs.close();
       }catch(Exception err){}
       try{
         ps.close();
       }catch(Exception err1){}
       try{
         db.close();
       }catch(Exception err2){}
       try{
         con.closeConnection();
       }catch(Exception err3){}
     }
return flag;
 }

public synchronized static String getUserStatus(String uid)
       {
         String res="0";
         try{
           if (searchUser(uid)) res="1";
         }catch(Exception err2)
         {
           err2.printStackTrace();
           res= "0";
         }
 return res;
  }

private synchronized static boolean searchUser(String uid)
   {
     boolean flag=false;
     ConnectorDB con = null;
     Connection db = null;
     ResultSet rs = null;
     PreparedStatement ps = null;
     try{
      con = new ConnectorDB();
      db = con.getConnection();
            if (db != null) {
         ps = db.prepareStatement(
            "select user_id from active_users where user_id='" + uid + "'" + " and timout=0");
         rs = ps.executeQuery();
         if (rs.next()) {
           //if (rs.getString("user_id").trim().indexOf("reset")>0) flag = false;
           flag = true;
         }
       }
     }    catch (Exception erp)
       {
         erp.printStackTrace();
         flag=false;
       }
       finally{
         try{
                 rs.close();
               }catch(Exception err){}
               try{
                 ps.close();
               }catch(Exception err1){}
               try{
                 db.close();
               }catch(Exception err2){}
               try{
                 con.closeConnection();
               }catch(Exception err3){}
       }
    return  flag;
 }

 public synchronized static boolean destroyUser(String uid,boolean kill)
      {
     ConnectorDB con = null;
     Connection db = null;
     boolean flag=false;
     String sql="";
         try{
           con = new ConnectorDB();
           db=con.getConnection();

           if (kill)
           sql="delete from active_users where user_id='" + uid + "' and timout=1";
           else
           sql="delete from active_users where user_id='" + uid + "'";


        if (db.createStatement().executeUpdate(sql)>0)
             flag=true;
         }catch(Exception err1)
         {
           err1.printStackTrace();
           flag=false;
         }
        finally{
          try{
        db.close();
      }catch(Exception err2){}
      try{
        con.closeConnection();
      }catch(Exception err3){}
    }
    return flag;
  }

public synchronized static boolean updateTimeoutUser(String uid)
  {
    ConnectorDB con = null;
    Connection db = null;
    boolean flag=false;
    PreparedStatement ps = null;
    ResultSet rs=null;
       try{
          con = new ConnectorDB();
          db=con.getConnection();
          ps = db.prepareStatement(
          "select RECVRY_FLAG from active_users where user_id='" + uid + "' and RECVRY_FLAG=1");
          rs = ps.executeQuery();

           if (rs.next())
           db.createStatement().executeUpdate("update active_users set RECVRY_FLAG=null where user_id='" + uid + "' and RECVRY_FLAG=1");
            else
           db.createStatement().executeUpdate("update active_users set TIMOUT=1 where user_id='" + uid + "' and RECVRY_FLAG is null");

        }catch(Exception err1)
        {
          err1.printStackTrace();
          flag=false;
        }
       finally{
         try{
           rs.close();
           ps.close();
           db.close();
     }catch(Exception err2){try{
         db.close();
       }catch(Exception err){}
             }
   }
   return flag;
 }

public synchronized static int isTimeOut(String uid)
    {
      int pos=0;
      ConnectorDB con = null;
      Connection db = null;
      ResultSet rs = null;
      PreparedStatement ps = null;
      try{
       con = new ConnectorDB();
       db = con.getConnection();
                 if (db != null) {
          ps = db.prepareStatement(
              "select timout from active_users where user_id='" + uid + "'");
          rs = ps.executeQuery();
          if (rs.next()) {
            pos=rs.getInt("timout");
          }
        }
      }    catch (Exception erp)
        {
          erp.printStackTrace();
          pos=2;
        }
        finally{
          try{
                  rs.close();
                }catch(Exception err){}
                try{
                  ps.close();
                }catch(Exception err1){}
                try{
                  db.close();
                }catch(Exception err2){}
                try{
                  con.closeConnection();
                }catch(Exception err3){}
        }
     return  pos;
  }

public synchronized static boolean updateUserRecovered(String uid)
    {
      ConnectorDB con = null;
      Connection db = null;
      boolean flag=false;
         try{
            con = new ConnectorDB();
            db=con.getConnection();
            db.createStatement().executeUpdate("update active_users set RECVRY_FLAG=1 where user_id='" + uid + "'");
          }catch(Exception err1)
          {
            err1.printStackTrace();
            flag=false;
          }
         finally{
           try{
             db.close();
       }catch(Exception err2){try{
           db.close();
         }catch(Exception err){}
               }
     }
     return flag;
   }

}


