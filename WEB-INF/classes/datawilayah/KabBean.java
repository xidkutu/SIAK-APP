/*This Bean Save Data for Kabupaten*/
/*Folling methods*/

package datawilayah;

import javax.ejb.*;
import java.sql.*;
import java.util.Vector;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class KabBean implements SessionBean
{
  private SessionContext sessionContext;

  private int no_prop,no_kab,prop,kab;
  private String nama_kab,select,insert,kabnama,nama_prop,select1;
  private Vector v;
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

/*To check a kabupaten exists within one propinsi*/

  public boolean checkPropinsi(int a, String str, int b)
  {
    ConnectorDB connect = new ConnectorDB();

    this.no_kab = a;
    this.nama_kab = str;
    this.no_prop = b;
    int i = 0;
    Connection conn=null;
    Statement st = null;
    ResultSet rs = null;
    try
    {
      select = "SELECT * FROM setup_kab where no_prop="+no_prop +" and no_kab="+no_kab;
      conn = connect.getConnection();

      st = conn.createStatement();
      rs = st.executeQuery(select);
      int count = 0;

      while(rs.next())
      {
        count++;
        no_prop = rs.getInt(1);
        nama_prop = rs.getString(2);
        no_prop = rs.getInt(3);
      }
      if(count != 1)
      {
        insert = "INSERT INTO SETUP_KAB(NO_KAB,NAMA_KAB,NO_PROP) VALUES("+
            no_kab+",'"+nama_kab+"',"+no_prop+")";
        System.out.println(insert);
        i = st.executeUpdate(insert);
      }

      rs.close();
      st.close();
      conn.close();

    }
    catch (Exception e)
    {
      e.printStackTrace();
      siakWriter.writeFile(e);
    }
    finally
    {
      try {
          if (rs != null) rs.close();
        }
        catch(Exception a1)
        {
          siakWriter.writeFile(a1);
        }

      try
      {
         if (st != null) st.close();
        }
        catch(Exception b1)
        {
          siakWriter.writeFile(b1);
        }

      try{
         if (conn != null) conn.close();
        }
        catch(Exception c1)
        {
          siakWriter.writeFile(c1);
        }
    }

    if (i == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

/*To List all the kabupaten within one propinsi*/

  public Vector list(String prop)
  {
    v = new Vector();
    ConnectorDB connect = new ConnectorDB();
    int no_prop = Integer.parseInt(prop);
    Connection conn=null;
    Statement st1 = null;
    ResultSet rs1 = null;

    try
    {
      conn = connect.getConnection();
      select1 = "SELECT to_char(no_kab,'00'),nama_kab FROM setup_kab where no_prop="+no_prop+" order by no_kab";
      st1 = conn.createStatement();

      rs1 = st1.executeQuery(select1);

      while(rs1.next())
      {
        v.addElement((Object)rs1.getString(1));
        v.addElement((Object)rs1.getString(2));
      }
      rs1.close();
      st1.close();
      conn.close();
    }
    catch(Exception e)
    {
      System.out.println("Exception in Select_Kab : " + e);
      siakWriter.writeFile(e);
    }
    finally
    {
      try {
          if (rs1 != null) rs1.close();
        }
        catch(Exception a1)
        {
          siakWriter.writeFile(a1);
        }

      try{
         if (st1 != null) st1.close();
        }
        catch(Exception b1)
        {
          siakWriter.writeFile(b1);
        }

      try{
         if (conn != null) conn.close();
        }
        catch(Exception c1)
        {
          siakWriter.writeFile(c1);
        }
    }
    return (v);
  }
}
