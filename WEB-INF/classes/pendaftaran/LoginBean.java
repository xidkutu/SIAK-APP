package pendaftaran;

import javax.ejb.*;

import java.util.Vector;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;

import java.util.ResourceBundle;
import java.util.Locale;
import java.io.*;

public class LoginBean implements SessionBean,java.io.Serializable
{
  private SessionContext sessionContext;
  Connection  conn =null;
  private SiakWriter siakWriter;

public void ejbCreate() throws CreateException
   {

try{

       ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
       String path = res.getString("BEAN_PATH");
       siakWriter = new SiakWriter(path, "LoginBean.class");
}catch(Exception err)
     {

     }
}

  public void ejbRemove()
  {
  }

  public void ejbActivate() {
    /**@todo Complete this method*/
  }

  public void ejbPassivate() {
    /**@todo Complete this method*/
  }

  public void setSessionContext(SessionContext sessionContext) {
    this.sessionContext = sessionContext;
  }

public SessionContext getSessionContext()
  {
          return(sessionContext);
//          SessionContext obj;
//          (Login)obj.getEJBLocalHome().remove()
  }

 public UserInfo1 validate(String login, String pwd)
  {
    UserInfo1 info = null;

    String select,log = null,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,
        s15,s16,s17,s18,s19,s20,s21,s23,s24,s25,s26,s27,s28="",s29="";
     java.util.Date s22;
     int i = 0;
     //Statement stmt = null;
     PreparedStatement stmt=null;
     ResultSet rs = null;
     String sql="";
  select="SELECT * from user_login_info where user_id=? and password=?";
  try
    {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      stmt = conn.prepareStatement(select);
      stmt.setString(1,login.trim());
      stmt.setString(2,pwd.trim());
      rs = stmt.executeQuery();

      if (rs.next())
      {
        s1 = rs.getString(1);
        s2 = rs.getString(2);
        s3 = rs.getString(3);
        s4 = rs.getString(4);
        s5 = rs.getString(5);
        s6 = rs.getString(6);
        s7 = rs.getString(7);
        s8 = rs.getString(8);
        s9 = rs.getString(9);
        s10 = rs.getString(10);
        s11 = rs.getString(11);
        s12 = rs.getString(12);
        s13 = rs.getString(13);
        s14 = rs.getString(14);
        s15 = rs.getString(15);
        s16 = rs.getString(16);
        s17 = rs.getString(17);
        s18 = rs.getString(18);
        s19 = rs.getString(19);
        s20 = rs.getString(20);
        s21 = rs.getString(21);
        s22 = rs.getDate(22);
        s23 = rs.getString(23);
        s24 = rs.getString(24);
        s25 = rs.getString(25);
        s26 = rs.getString(26);
        s27 = rs.getString(27);
        s28 = rs.getString(28);
        s29 = rs.getString(29);
        info = new UserInfo1(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
                             s11,s12,s13,s14,s15,s16,s17,s18,
                             s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29);
        rs.close();
        stmt.close();
        conn.close();
        rs=null;
        stmt=null;
        conn=null;
      }
   }
    catch (Exception ee)
    {
        siakWriter.writeFile(ee);
      info = null;
     ee.printStackTrace();
    }
    finally
    {
      try {
          if (rs != null) rs.close();
        }catch(Exception a1){
                siakWriter.writeFile(a1);
        }

      try{
         if (stmt != null) stmt.close();
        }catch(Exception b1){
                siakWriter.writeFile(b1);
        }

      try{
         if (conn != null) conn.close();
        }catch(Exception c1){
        siakWriter.writeFile(c1);
        }
    }
if (info!=null)
    return info;
  else
    return null;
  }

public UserInfo1 validate(String login)
   {
     UserInfo1 info = null;

     String select,log = null,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,
         s15,s16,s17,s18,s19,s20,s21,s23,s24,s25,s26,s27,s28="",s29="";
      java.util.Date s22;
      int i = 0;
      //Statement stmt = null;
      PreparedStatement stmt=null;
      ResultSet rs = null;
      String sql="";
   select="SELECT * from user_login_info where user_id=?";
   try
     {
       ConnectorDB connectorDb = new ConnectorDB();
       conn = connectorDb.getConnection();
       stmt=conn.prepareStatement(select);
       stmt.setString(1,login.trim());
       rs = stmt.executeQuery(select);

    if (rs.next())
       {
         s1 = rs.getString(1);
         s2 = rs.getString(2);
         s3 = rs.getString(3);
         s4 = rs.getString(4);
         s5 = rs.getString(5);
         s6 = rs.getString(6);
         s7 = rs.getString(7);
         s8 = rs.getString(8);
         s9 = rs.getString(9);
         s10 = rs.getString(10);
         s11 = rs.getString(11);
         s12 = rs.getString(12);
         s13 = rs.getString(13);
         s14 = rs.getString(14);
         s15 = rs.getString(15);
         s16 = rs.getString(16);
         s17 = rs.getString(17);
         s18 = rs.getString(18);
         s19 = rs.getString(19);
         s20 = rs.getString(20);
         s21 = rs.getString(21);
         s22 = rs.getDate(22);
         s23 = rs.getString(23);
         s24 = rs.getString(24);
         s25 = rs.getString(25);
         s26 = rs.getString(26);
         s27 = rs.getString(27);
         s28 = rs.getString(28);
         s29 = rs.getString(29);
         info = new UserInfo1(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,
                              s11,s12,s13,s14,s15,s16,s17,s18,
                              s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29);
         rs.close();
         stmt.close();
         conn.close();
         rs=null;
         stmt=null;
         conn=null;
       }
    }
     catch (Exception ee)
     {
         siakWriter.writeFile(ee);
       info = null;
      ee.printStackTrace();
     }
     finally
     {
       try {
           if (rs != null) rs.close();
         }catch(Exception a1){
                 siakWriter.writeFile(a1);
         }

       try{
          if (stmt != null) stmt.close();
         }catch(Exception b1){
                 siakWriter.writeFile(b1);
         }

       try{
          if (conn != null) conn.close();
         }catch(Exception c1){
         siakWriter.writeFile(c1);
         }
     }
 if (info!=null)
     return info;
   else
     return null;
}

public Vector list(String no_prop, String no_kab, String no_kec)
  {
    Vector v = new Vector();
    String select=null,no_kel,nama_kel;
    ResultSet rslist=null;
    PreparedStatement stlist=null;
    select = "SELECT to_char(no_kel,'0000'),nama_kel FROM setup_kel"
    +" where no_prop=? and no_kab=? and no_kec=?";
    try
    {
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn = connectorDb.getConnection();
      //stlist = conn.createStatement();
      stlist=conn.prepareStatement(select);
      stlist.setString(1,no_prop);
      stlist.setString(2,no_kab);
      stlist.setString(3,no_kec);

      rslist = stlist.executeQuery(select);

      while(rslist.next())
      {
        no_kel = rslist.getString(1);
        v.addElement( (Object) no_kel);
        nama_kel = rslist.getString(2);
        v.addElement((Object)nama_kel);
      }
      rslist.close();
      stlist.close();
      conn.close();
      rslist=null;
      stlist=null;
      conn=null;
    }
    catch(Exception e)
    {

    }
    finally
    {
      try {
          if (rslist != null) rslist.close();
        }catch(Exception a1){}

      try{
         if (stlist != null) stlist.close();
        }catch(Exception b1){}

      try{
         if (conn != null) conn.close();
        }catch(Exception c1){}
    }

    return v;
  }

  public boolean insertUserReg(Vector v)
  {
 java.text.SimpleDateFormat dt_fmt=new  java.text.SimpleDateFormat("dd-MMM-yyyy");

    boolean b = false;
    String dd,mm,yy,date;
    int l1=0,l2=0,l3=0;

    dd = v.elementAt(3).toString();
    mm = v.elementAt(4).toString();
    yy = v.elementAt(5).toString();

    l1 = Integer.parseInt(v.elementAt(3).toString());//dd
    l2 = Integer.parseInt(v.elementAt(4).toString());//mm
    l3 = Integer.parseInt(v.elementAt(5).toString()); //year

    date=dd+"-"+mm+"-"+yy;
    CallableStatement cs=null;

    try
    {
           ConnectorDB connectorDb = new ConnectorDB();
           Connection conn = connectorDb.getConnection();
           cs = conn.prepareCall("{call user_register(?,?,?,?,?,?,?,?,?,?,?,?)}");

        cs.setString(1,v.elementAt(13).toString());
        cs.setString(2 ,v.elementAt(0).toString());
        cs.setString(3 ,v.elementAt(1).toString());
        cs.setString(4 ,v.elementAt(2).toString());
        cs.setDate(5,new java.sql.Date(l3-1900,l2-1,l1));
        cs.setString(6 ,v.elementAt(6).toString());
        cs.setString(7 ,v.elementAt(7).toString());
        cs.setString(8 ,v.elementAt(8).toString());
        cs.setString(9 ,v.elementAt(9).toString());
        cs.setString(10 ,v.elementAt(10).toString());
        cs.setString(11 ,v.elementAt(11).toString());
        cs.setString(12 ,v.elementAt(12).toString());
        cs.execute();
        b=true;
        cs.close();
        conn.close();
        cs=null;
        conn=null;
      }
      catch (Exception ee) {
        ee.printStackTrace();
            b=false;
       }
       finally
       {
         try {
             if (cs != null) cs.close();
           }catch(Exception a1){}

         try{
            if (conn != null) conn.close();
           }catch(Exception c1){}
       }
    return b;
  }
  public boolean ubahPwd(String user,String old_pwd, String new_pwd)
  {
    boolean b = false;
    String select=null, update=null;
    int i = 0;
    PreparedStatement stlist=null;

    update = "UPDATE user_master set password=toolkit.encrypt(?) where user_id=? and password=toolkit.encrypt(?)";

    try
    {
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn = connectorDb.getConnection();
      stlist=conn.prepareStatement(update);
      stlist.setString(1,new_pwd);
      stlist.setString(2,user);
      stlist.setString(3,old_pwd);
      i = stlist.executeUpdate();

      if(i == 1)  b = true;
       stlist.close();
      stlist=null;
      conn.close();
      conn=null;
    }
    catch(Exception e)
    {
      b = false;
    }
    finally
    {
      try{
         if (stlist != null) stlist.close();
        }catch(Exception b1){}

      try{
         if (conn != null) conn.close();
        }catch(Exception c1){}
    }

    return b;
  }
}
