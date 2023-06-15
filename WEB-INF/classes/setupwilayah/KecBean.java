package setupwilayah;

import javax.ejb.*;
import java.sql.*;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class KecBean implements SessionBean
{
  private SiakWriter siakWriter;
  SessionContext sessionContext;
  ConnectorDB con_db;
  Connection con;
  Statement st;
  String sql;
  ResultSet rs;
  boolean b;
  int no_prop,no_kab,no_kec,i;
  String nama_kec;

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
  public boolean setKec(int a,int b,int c,String d)
  {
    this.no_prop = a;
    this.no_kab = b;
    this.no_kec = c;
    this.nama_kec = d;
    int i = 0;

  try
  {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();
      st = con.createStatement();
      rs = st.executeQuery("select * from setup_kec where no_kec=" + no_kec + " and no_kab=" + no_kab + " and no_prop=" + no_prop);

      if (! (rs.next())) {
          i = st.executeUpdate(
              "insert into setup_kec(no_kec,nama_kec,no_kab,no_prop) values(" +
              no_kec + ",'" + nama_kec + "'," + no_kab + "," + no_prop + ")");
        }
        rs.close();
        st.close();
        con.close();
      } catch (Exception err) { siakWriter.writeFile(err); }
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
         if (con!=null) con.close();
         }catch(Exception z){siakWriter.writeFile(z);}
      }

  if (i > 0)
      return true;
    else
      return false;

    }
}
