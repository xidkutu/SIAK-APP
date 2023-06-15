package setupwilayah;

import javax.ejb.*;
import java.sql.*;
import java.util.*;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class TemkecBean implements SessionBean
{
  SessionContext sessionContext;
  Vector v;
  Connection con;
  ConnectorDB con_db;
  Statement st;
  ResultSet rs;
  String a,b;
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
  public Vector show(String prop, String kab)
  {
    try {
         con_db = new ConnectorDB();
         con = ConnectorDB.getConnection();
         st = con.createStatement();
         rs = st.executeQuery(
          "select to_char(no_kec,'00') kc,nama_kec from setup_kec where no_prop=" + prop +
          " and no_kab=" + kab + " order by no_kec");
      v = new Vector();

      while (rs.next()) {
        v.add( (Object) rs.getString("kc"));
        v.add( (Object) rs.getString("nama_kec"));
      }
      rs.close();
      st.close();
      con.close();
  }
  catch (Exception e)
  {
     siakWriter.writeFile(e);
      System.out.println("Error = " + e);
    }

finally
    {
      try {
        if (rs != null)
          rs.close();
      }  catch (Exception x) { siakWriter.writeFile(x);}

     try{
       if (st!=null) st.close();
       }catch(Exception y){ siakWriter.writeFile(y);}

        try{
       if (con!=null) con.close();
       }catch(Exception z){ siakWriter.writeFile(z);}
    }
   return v;
  }

}
