package keluargawna;

import javax.ejb.*;
import java.sql.*;
import java.util.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class GetNokkBean implements SessionBean {
  SessionContext sessionContext;
  String sql;

  Vector v;
  boolean flag;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "GetNokkBean.class");
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

  public Vector Gnokk(String a)
    {
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn=null;
      ResultSet rs = null;
      Statement st = null;

    try
     {
       conn = connectorDb.getConnection();
       st = conn.createStatement();

       sql ="select  NO_KK,NAMA_KEP,ALAMAT from data_keluarga where no_kk='" +a + "'";
       rs = st.executeQuery(sql);
       v = new Vector();
       if (rs != null)
       {
         while (rs.next())
         {

           v.add((Object) rs.getString("NO_KK"));
           v.add((Object) rs.getString("NAMA_KEP"));
           v.add((Object) rs.getString("ALAMAT"));
          }
      }
      rs.close();
      st.close();
      conn.close();
   }catch(Exception ee){
     siakWriter.writeFile(ee);
         System.out.println("Error in GetNokkBean:"+ee.toString());}
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

/*Function Added Newly*/
    public Vector GnokkNew(String no_kk,String no_prop,String no_kab,String no_kec,String no_kel)
      {
        ConnectorDB connectorDb = new ConnectorDB();
        Connection conn=null;
        ResultSet rs = null;
        Statement st = null;

      try
       {
         conn = connectorDb.getConnection();
         st = conn.createStatement();
         sql ="select  NO_KK,NAMA_KEP,ALAMAT from data_keluarga where no_kk=" + no_kk + " and no_prop="+ no_prop + "  and no_kab=" + no_kab + " and no_kec=" + no_kec + " and no_kel=" + no_kel;
         rs = st.executeQuery(sql);
         v = new Vector();
         if (rs != null)
         {
           while (rs.next())
           {

             v.add((Object) rs.getString("NO_KK"));
             v.add((Object) rs.getString("NAMA_KEP"));
             v.add((Object) rs.getString("ALAMAT"));
            }
        }
        rs.close();
        st.close();
        conn.close();
     }catch(Exception ee){
       siakWriter.writeFile(ee);
           System.out.println("Error in GetNokkBean:"+ee.toString());}
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

}