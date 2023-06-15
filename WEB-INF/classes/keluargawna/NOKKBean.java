package keluargawna;

import javax.ejb.*;
import java.sql.*;
import java.util.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class NOKKBean implements SessionBean {
  SessionContext sessionContext;
  String no_prop,no_kab,no_kec,no_kel,no_kk;
  String sql,sql1,sql2,sql3,str,s,ss,sss,dd,mm,yy;


  boolean flag;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "NOKKBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

  }
  public void ejbRemove() {
    /**@todo Complete this method*/
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

  public Vector verifyNik(String a)
    {
        Vector v=null;
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn=null;
      Statement st=null;
      String sql="";
      ResultSet rs=null;
   try
     {
       conn = connectorDb.getConnection();
       System.out.println("inside the veryify");
       st = conn.createStatement();
       sql ="select to_char(NIK,'0000000000000000') NIK,NAMA_PERTMA,NO_PASPOR,STAT_HBKEL from biodata_wna  where no_kk='" + a + "'";
       rs = st.executeQuery(sql);
       v = new Vector();
       if (rs != null)
       {
         while (rs.next())
         {

           v.add((Object) rs.getString("NIK"));
           v.add((Object) rs.getString("NAMA_PERTMA"));
           v.add((Object) rs.getString("NO_PASPOR"));
           v.add((Object) rs.getString("STAT_HBKEL"));
         }
      }
      rs.close();
      st.close();
      conn.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
   finally
         {
           try {
             if (rs != null)
               rs.close();
           }  catch (Exception x) {siakWriter.writeFile(x);}

          try{
            if (st!=null) st.close();
            }catch(Exception y){siakWriter.writeFile(y);}

             try{
            if (conn!=null) conn.close();
            }catch(Exception z){siakWriter.writeFile(z);}
         }
     return v;
    }


/*New Version of VerifyNik function for adding wilyah info also 2-Apr-2004*/

public Vector verifyNikNew(String a,String no_prop,String no_kab,String no_kec,String no_kel)
      {
          Vector v=null;
        ConnectorDB connectorDb = new ConnectorDB();
        Connection conn=null;
        Statement st=null;
        String sql="";
        ResultSet rs=null;
     try
       {
         conn = connectorDb.getConnection();
         System.out.println("inside the veryify");
         st = conn.createStatement();
         sql ="select to_char(NIK,'0000000000000000') NIK,NAMA_PERTMA,NO_PASPOR,STAT_HBKEL from biodata_wna  where no_kk=" + a + " and no_prop="+ no_prop + " and no_kab=" + no_kab + " and no_kec=" + no_kec + "  and no_kel=" + no_kel;
         rs = st.executeQuery(sql);
         v = new Vector();
         if (rs != null)
         {
           while (rs.next())
           {

             v.add((Object) rs.getString("NIK"));
             v.add((Object) rs.getString("NAMA_PERTMA"));
             v.add((Object) rs.getString("NO_PASPOR"));
             v.add((Object) rs.getString("STAT_HBKEL"));
           }
        }
        rs.close();
        st.close();
        conn.close();
        }
        catch(Exception e)
        {
          siakWriter.writeFile(e);
        }
     finally
           {
             try {
               if (rs != null)
                 rs.close();
             }  catch (Exception x) {siakWriter.writeFile(x);}

            try{
              if (st!=null) st.close();
              }catch(Exception y){siakWriter.writeFile(y);}

               try{
              if (conn!=null) conn.close();
              }catch(Exception z){siakWriter.writeFile(z);}
           }
       return v;
      }

public String verifyKKNew(String a,String no_prop,String no_kab,String no_kec,String no_kel)
      {
            ConnectorDB connectorDb = new ConnectorDB();
            Connection conn=null;
            Statement st= null;
            ResultSet rs = null;
            String str="",sql1="";
        try
           {
             conn = connectorDb.getConnection();
             st = conn.createStatement();

             str="1 - Kepala Keluarga/Head of Family";
             sql1="select STAT_HBKEL from biodata_wna  where no_kk=" +a + " and no_prop="+ no_prop + " and no_kab=" + no_kab + " and no_kec=" + no_kec + "  and no_kel=" + no_kel;

             rs = st.executeQuery(sql1);

             while(rs.next())
             {
               if(rs.getInt(1)==1)
               {
                flag=true;
               }
             }
             rs.close();
             st.close();
             conn.close();
             }
             catch(Exception e)
             {
               siakWriter.writeFile(e);
             }
         finally
          {
            try {
              if (rs != null) rs.close();
            }  catch (Exception x) {siakWriter.writeFile(x);}

           try{
             if (st!=null) st.close();
             }catch(Exception y){siakWriter.writeFile(y);}

              try{
             if (conn!=null) conn.close();
             }catch(Exception z){siakWriter.writeFile(z);}
          }

           if (flag)
           {
             return null;
           }
           else
           {
             return str;
           }
      }





public String verifyKK(String a)
{
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn=null;
      Statement st= null;
      ResultSet rs = null;
      String str="",sql1="";
  try
     {
       conn = connectorDb.getConnection();
       st = conn.createStatement();

       str="1 - Kepala Keluarga/Head of Family";
       sql1="select STAT_HBKEL from biodata_wna  where no_kk='" +a + "'";

       rs = st.executeQuery(sql1);

       while(rs.next())
       {
         if(rs.getInt(1)==1)
         {
          flag=true;
         }
       }
       rs.close();
       st.close();
       conn.close();
       }
       catch(Exception e)
       {
         siakWriter.writeFile(e);
       }
   finally
    {
      try {
        if (rs != null) rs.close();
      }  catch (Exception x) {siakWriter.writeFile(x);}

     try{
       if (st!=null) st.close();
       }catch(Exception y){siakWriter.writeFile(y);}

        try{
       if (conn!=null) conn.close();
       }catch(Exception z){siakWriter.writeFile(z);}
    }

     if (flag)
     {
       return null;
     }
     else
     {
       return str;
     }
}

}