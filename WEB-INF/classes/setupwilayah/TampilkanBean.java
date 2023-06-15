package setupwilayah;

import java.util.*;
import javax.ejb.*;
import java.sql.*;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class TampilkanBean implements SessionBean {
  SessionContext sessionContext;
  String sql;
  Connection con;
  ConnectorDB con_db;
  Statement st;
  ResultSet rs;
  Vector v;
  int i;
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
  public Vector noProf()
  {
    try
       {
         con_db = new ConnectorDB();
         con = ConnectorDB.getConnection();
         st = con.createStatement();
         rs = st.executeQuery("select to_char(no_prop,'00') nop,nama_prop from setup_prop order by no_prop");
         v = new Vector();
           while (rs.next())
           {
             v.add((Object) rs.getString("nop"));
             v.add((Object) rs.getString("nama_prop"));

            }
            rs.close();
            st.close();
       }
        catch(Exception e)
       {
         siakWriter.writeFile(e);
       }
       finally
          {
          try{
            if (rs!=null) rs.close();
          }catch(Exception d) {siakWriter.writeFile(d);}
          try{
            if(st!=null) st.close();
          }catch(Exception b){siakWriter.writeFile(b);}
          try{
            if (con!=null) con.close();
          }catch(Exception c){siakWriter.writeFile(c);}
          }
       return v;
      }
}
