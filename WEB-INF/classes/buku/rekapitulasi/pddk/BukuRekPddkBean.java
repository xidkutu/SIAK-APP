package buku.rekapitulasi.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.DataKelurahan;
import siaktools.logwriter.SiakWriter;
import oracle.jdbc.driver.*;

public class BukuRekPddkBean implements SessionBean
{

  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  public Vector getDataBukuPerkembanganPenduduk(String no_prop, String no_kab,
                                            String no_kec) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    CallableStatement stmt = null;
    BukuRekapPddkObject bukuObj = null;


 try
    {
      conn = connectorDb.getConnection();
      String query = "begin ? := get_Rekap(?,?,?); end;";
      stmt = conn.prepareCall(query);
// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, no_kec.trim());
      stmt.execute();
      rs = (ResultSet)stmt.getObject(1);
      String lakiwni="", peremwni="", lakiwna="", peremwna="", lahirlakiwni="", lahirperemwni="",
          lahirlakiwna="", lahirperemwna="", matilakiwni="", matiperemwni="", matilakiwna="", matiperemwna="",
          pindahlakiwni="", pindahperemwni="", pindahlakiwna="", pindahperemwna="", datanglakiwni="",datangperemwni="",
          datanglakiwna="", datangperemwna="";
      String nama_kel = "";

      while(rs.next())
      {
        nama_kel = rs.getString("NAMA_KEL");
        lakiwni = rs.getString("LAKIWNI");
        peremwni = rs.getString("PEREMWNI");
        lakiwna = rs.getString("LAKIWNA");
        peremwna = rs.getString("PEREMWNA");
        lahirlakiwni = rs.getString("LAHIRLAKIWNI");
        lahirperemwni = rs.getString("LAHIRPEREMWNI");
        lahirlakiwna = rs.getString("LAHIRLAKIWNA");
        lahirperemwna = rs.getString("LAHIRPEREMWNA");
        matilakiwni = rs.getString("MATILAKIWNI");
        matiperemwni = rs.getString("MATIPEREMWNI");
        matilakiwna = rs.getString("MATILAKIWNA");
        matiperemwna = rs.getString("MATIPEREMWNA");
        pindahlakiwni = rs.getString("PINDAHLAKIWNI");
        pindahperemwni = rs.getString("PINDAHPEREMWNI");
        pindahlakiwna = rs.getString("PINDAHLAKIWNA");
        pindahperemwna = rs.getString("PINDAHPEREMWNA");
        datanglakiwni = rs.getString("DATANGLAKIWNI");
        datangperemwni = rs.getString("DATANGPEREMWNI");
        datanglakiwna = rs.getString("DATANGLAKIWNA");
        datangperemwna = rs.getString("DATANGPEREMWNA");

        bukuObj = new BukuRekapPddkObject( nama_kel, lakiwni, peremwni, lakiwna, peremwna, lahirlakiwni, lahirperemwni,
                                              lahirlakiwna, lahirperemwna,
                                              matilakiwni, matiperemwni,
                                              matilakiwna, matiperemwna,
                                              pindahlakiwni, pindahperemwni,
                                              pindahlakiwna, pindahperemwna,
                                              datanglakiwni, datangperemwni,
                                              datanglakiwna, datangperemwna);
         vData.addElement(bukuObj);
      }
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

  /*
  public String getSysdate() throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String sysdate = "";

    try
    {
      conn = connectorDb.getConnection();

      ps = conn.prepareStatement("select to_char(sysdate,'dd-mon-yyyy') from dual".toUpperCase());
      rs = ps.executeQuery();
      while(rs.next())
      {
        sysdate=rs.getString(1);
      }

      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      if(conn!=null) conn.close();
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
        if (ps != null)
          ps.close();
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
    return sysdate;
  }
  */

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, this.getClass().getName());
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