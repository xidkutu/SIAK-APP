package daftar;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;

import pendaftaran.*;

public class PenggunaBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector getDataPengguna(String no_prop, String no_kab, String no_kec) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    String query="";

    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      if( ( no_prop==null || no_prop.trim().equals("") ) && ( no_kab==null||no_kab.trim().equals("") ) && ( no_kec==null || no_kec.trim().equals("") ) )
      {
        query = "SELECT * FROM VW_USER_PASSWORD WHERE NO_PROP is null AND NO_KAB is null AND NO_KEC is null";
      }
      else if( ( no_prop!=null || !no_prop.trim().equals("") ) &&(no_kab==null||no_kab.trim().equals("")) && (no_kec==null || no_kec.trim().equals("")) )
      {
        query = "SELECT * FROM VW_USER_PASSWORD WHERE NO_PROP="+no_prop+" AND NO_KAB is null AND NO_KEC is null";
      }
      else if( ( no_prop!=null || !no_prop.trim().equals("") ) &&(no_kab!=null||!no_kab.trim().equals("")) && ( no_kec==null|| no_kec.trim().equals("")) )
      {
        query = "SELECT * FROM VW_USER_PASSWORD WHERE NO_PROP="+no_prop+" AND NO_KAB="+no_kab+" AND NO_KEC is null";
      }
      else
      {
        query = "SELECT * FROM VW_USER_PASSWORD WHERE NO_PROP="+no_prop+" AND NO_KAB="+no_kab+" AND NO_KEC="+no_kec;
      }

      System.out.println(query);

      rs = stmt.executeQuery(query);
      String nama_pengguna="",kata_kunci="",level_id="",division="";

      while(rs.next())
      {
        nama_pengguna = rs.getString("NAMA_PENGGUNA");
        kata_kunci = rs.getString("KATA_KUNCI");
        level_id =  rs.getString("LEVEL_ID");
        division = rs.getString("DIVISION");

        PenggunaObject obj = new PenggunaObject( nama_pengguna, kata_kunci, level_id, division );
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
  public boolean resetLogin(Login home) throws RemoteException
  {
    try
    {
     home.remove();
      return true;
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

    return false;
  }
  public boolean changeStatus(String user_id, String currentStatus) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    Statement stmt = null;
    String query="";
    int result = 0;

    if(currentStatus.trim().equals("Y"))
    {
      currentStatus="N";
    }
    else
    {
      currentStatus="Y";
    }
    try
    {
      query="UPDATE USER_MASTER SET USER_STATUS='"+currentStatus+"' WHERE USER_ID='"
          +user_id.trim()+"'";

      conn = connectorDb.getConnection();
      stmt = conn.createStatement();
      result = stmt.executeUpdate(query);

      stmt.close();
      conn.close();
      stmt = null;
      conn = null;
      return true;
    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    finally
    {
      try {
        if (stmt != null)
          stmt.close();
      }
      catch (Exception e) {
        siakWriter.writeFile(e);
      }
      try {
        if (conn != null)
          conn.close();
      }
      catch (Exception e) {
        siakWriter.writeFile(e);
      }
    }
      return false;
  }
  public boolean deleteDataAdministrasiPengguna(String user_id) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    Statement stmt = null;
    String query="";
    int result = 0;

    try
    {
      query="DELETE FROM USER_MASTER WHERE USER_ID='"+user_id.trim()+"'";
      System.out.println(query);
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();
      result = stmt.executeUpdate(query);
      stmt.close();
      conn.close();
      stmt = null;
      conn = null;
      return true;
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

    return false;
  }
  public Vector getDataAdministrasiPengguna(String no_prop, String no_kab, String no_kec) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    String query="";

    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      if( ( no_prop==null || no_prop.trim().equals("") ) && ( no_kab==null||no_kab.trim().equals("") ) && ( no_kec==null || no_kec.trim().equals("") ) )
      {
        query = "SELECT * FROM VW_USER_ADMINISTRASI WHERE NO_PROP is null AND NO_KAB is null AND NO_KEC is null";
      }
      else if( ( no_prop!=null || !no_prop.trim().equals("") ) &&(no_kab==null||no_kab.trim().equals("")) && (no_kec==null || no_kec.trim().equals("")) )
      {
        query = "SELECT * FROM VW_USER_ADMINISTRASI WHERE NO_PROP="+no_prop+" AND NO_KAB is null AND NO_KEC is null";
      }
      else if( ( no_prop!=null || !no_prop.trim().equals("") ) &&(no_kab!=null||!no_kab.trim().equals("")) && ( no_kec==null|| no_kec.trim().equals("")) )
      {
        query = "SELECT * FROM VW_USER_ADMINISTRASI WHERE NO_PROP="+no_prop+" AND NO_KAB="+no_kab+" AND NO_KEC is null";
      }
      else
      {
        query = "SELECT * FROM VW_USER_ADMINISTRASI WHERE NO_PROP="+no_prop+" AND NO_KAB="+no_kab+" AND NO_KEC="+no_kec;
      }

      System.out.println(query);

      rs = stmt.executeQuery(query);
      String nama_pengguna="", nama_lengkap=""
                        , nip="", tmpt_tgl="",  jenis_klmin="",  golongan=""
                        ,  jabatan="",  nama_kantor="",  alamat_telp="", status="";

      while(rs.next())
      {
        nama_pengguna = rs.getString("NAMA_PENGGUNA");
        nama_lengkap = rs.getString("NAMA_LGKP");
        nip =  rs.getString("NIP");
        tmpt_tgl = rs.getString("TMPT_TGL");
        jenis_klmin = rs.getString("JENIS_KLMIN");
        golongan = rs.getString("GOLOGAN");
        jabatan= rs.getString("JABATAN");
        nama_kantor= rs.getString("NAMA_KANTOR");
        alamat_telp = rs.getString("ALAMAT_TELP");
        status = rs.getString("STATUS");

        PenggunaObject obj = new PenggunaObject( nama_pengguna, nama_lengkap
                        , nip, tmpt_tgl,  jenis_klmin,  golongan
                        ,  jabatan,  nama_kantor,  alamat_telp, status );
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