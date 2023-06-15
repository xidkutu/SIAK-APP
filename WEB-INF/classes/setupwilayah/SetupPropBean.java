package setupwilayah;

import javax.ejb.*;
import java.sql.*;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class SetupPropBean implements SessionBean {
  SessionContext sessionContext;
  ConnectorDB con_db;
  Connection con;
  Statement st;
  ResultSet rs;

  int no_prop;
  String nama_prop;
  boolean b,flag;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "KabBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

    /**@todo Complete this method*/
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
  public boolean postPropinsi(int a, String str)
  {

    this.no_prop = a;
    this.nama_prop = str;
    int i = 0;

    try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();
      st = con.createStatement();
      //rs= st.executeQuery("select * from setup_prop where no_prop='"+no_prop+"'");
      rs= st.executeQuery("select * from setup_prop where no_prop='"+no_prop+"' or nama_prop= '"+nama_prop+"'");

      if(!(rs.next()))
      {
         i = st.executeUpdate("insert into setup_prop values('" + no_prop +"','" + nama_prop + "')");
         flag=true;
      }
      else
      {
        flag=false;
      }
      st.close();
      rs.close();
   }catch(Exception e)  { siakWriter.writeFile(e);}
    finally
     {
       try{
           if(con!=null) { con.close();}
       }catch(Exception e1){ siakWriter.writeFile(e1); }

       try{
         if(st!=null) {st.close();}
       }catch(Exception e2){ siakWriter.writeFile(e2); }

       try{
         if(rs!=null) {rs.close();}
             }catch(Exception e3){ siakWriter.writeFile(e3); }
     }
      //System.out.println("flag value "+flag);
      return flag;

  }
}
