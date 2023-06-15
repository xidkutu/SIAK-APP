package buku.ubahkepkel.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.DataKelurahan;
import siaktools.logwriter.SiakWriter;

import oracle.jdbc.driver.*;

public class BukuUbahKepkelBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;


  public Vector getDataBukuUbahKepkelPenduduk(String no_prop, String no_kab,
                                            String no_kec) throws RemoteException
  {
    Connection conn=null;
    Vector vData = new Vector();
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    CallableStatement stmt = null;

    try
    {
      conn = connectorDb.getConnection();

      String query = "begin ? := get_rekap_kk(?,?,?); end;";

      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, no_kec.trim());

// execute and retrieve the result set
      stmt.execute();
      rs = (ResultSet)stmt.getObject(1);
      String nama_kel="", tambahkk="", pengukk="", jumlahk="";
      while(rs.next())
      {
        nama_kel = rs.getString("NAMA_KEL");
        tambahkk = rs.getString("TAMBAHKK");
        pengukk = rs.getString("PENGUKK");
        jumlahk = rs.getString("JUMLAHK");

        BukuUbahKepkelObject bukuObj = new BukuUbahKepkelObject(nama_kel,tambahkk,pengukk,jumlahk);

        vData.addElement(bukuObj);
      }
      if(rs!=null) rs.close();
      if(stmt!=null) stmt.close();
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