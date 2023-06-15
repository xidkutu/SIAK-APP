package daftar;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;

public class KunciOtoritasBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector getDataKunciOtoritas(String no_prop, String no_kab, String no_kec) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    String query="";
    String now="", kunci_otoritas="", nama_pengguna="", nama_lgkp="", level_id="", division="",
        nama_kantor="", alamat_telp="";
    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      if (( no_prop==null || no_prop.trim().equals("") ) && ( no_kab==null||no_kab.trim().equals("") ) && ( no_kec==null || no_kec.trim().equals("") ) )
      {
        query = "SELECT * FROM VW_USER_AUTHKEY WHERE NO_PROP is null AND NO_KAB is null AND NO_KEC is null";
      }
      else if( ( no_prop!=null || !no_prop.trim().equals("") ) &&(no_kab==null||no_kab.trim().equals("")) && (no_kec==null || no_kec.trim().equals("")) )
      {
        query = "SELECT * FROM VW_USER_AUTHKEY WHERE NO_PROP="+no_prop+" AND NO_KAB is null AND NO_KEC is null";
      }
      else if( ( no_prop!=null || !no_prop.trim().equals("") ) &&(no_kab!=null||!no_kab.trim().equals("")) && ( no_kec==null|| no_kec.trim().equals("")) )
      {
        query = "SELECT * FROM VW_USER_AUTHKEY WHERE NO_PROP="+no_prop+" AND NO_KAB="+no_kab+" AND NO_KEC is null";
      }
      else
      {
        query = "SELECT * FROM VW_USER_AUTHKEY WHERE NO_PROP=" + no_prop +
            " AND NO_KAB=" + no_kab + " AND NO_KEC=" + no_kec;
      }
      System.out.println(query);

      rs = stmt.executeQuery(query);
      while(rs.next())
      {
        now = rs.getString("NOW");
        kunci_otoritas = rs.getString("KUNCI_OTORITAS");
        nama_pengguna =  rs.getString("NAMA_PENGGUNA");
        nama_lgkp = rs.getString("NAMA_LGKP");
        level_id = rs.getString("LEVEL_ID");
        division = rs.getString("DIVISION");
        nama_kantor = rs.getString("NAMA_KANTOR");
        alamat_telp = rs.getString("ALAMAT_TELP");

        KunciOtoritasObject obj = new KunciOtoritasObject( now, kunci_otoritas, nama_pengguna,
                              nama_lgkp, level_id, division,
                              nama_kantor, alamat_telp);
        vData.addElement(obj);
      }
      rs.close();
      stmt.close();
      conn.close();
      rs=null;
      stmt=null;
      conn=null;
    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    finally
    {
      try
      {
        if (rs != null)
          rs.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (stmt != null)
          stmt.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
    }
    return vData;
  }
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "LampidBean.class");
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
}