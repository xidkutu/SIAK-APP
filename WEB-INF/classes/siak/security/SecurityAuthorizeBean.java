package siak.security;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;
import oracle.jdbc.driver.*;

public class SecurityAuthorizeBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public boolean authorizeUser(Vector user_auth_id , String user_auth_by) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    CallableStatement stmt = null;
    try
    {
      conn = connectorDb.getConnection();
      for (int i = 0; i < user_auth_id.size(); i++)
      {
        String query = "{call user_authorze(?,?)}";
        stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
// set the in param
        stmt.setString(1, user_auth_id.elementAt(i).toString().trim());
        stmt.setString(2, user_auth_by);
// execute and retrieve the result set
        stmt.execute();
      }
      if(stmt!=null) stmt.close();
      if(conn!=null) conn.close();
      stmt=null;
      conn=null;
      return true;
    }
    catch(Exception e)
    {
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
        e.printStackTrace();
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    }
    return false;
  }
public SecurityObject getDataPenggunaUser(String user_id) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    String query = "";
    Connection conn=null;

    String nama_lgkp="", nip="", tmpt_lhr="",
    tgl_lhr="", jenis_klmn="", gologan="",
    pengkat="", jabatan="", nama_kantor="",
    alamat_kantor="", telp="";

    SecurityObject obj=null;
    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      query = "SELECT * FROM VW_REGISTER_INFO WHERE USER_ID='"+user_id+"'";
      System.out.println(query);
      rs = stmt.executeQuery(query);

      while(rs.next())
      {
         nama_lgkp =rs.getString("NAMA_LGKP");
         nip=rs.getString("NIP");
         tmpt_lhr=rs.getString("TMPT_LHR");
         tgl_lhr=rs.getString("TGL_LHR");
         jenis_klmn=rs.getString("JENIS_KLMN");
         gologan =rs.getString("GOLOGAN");
         pengkat =rs.getString("PENGKAT");
         jabatan=rs.getString("JABATAN");
         nama_kantor=rs.getString("NAMA_KANTOR");
         alamat_kantor=rs.getString("ALAMAT_KANTOR");
         telp=rs.getString("TELP");
         user_id=rs.getString("USER_ID");

         obj = new SecurityObject( nama_lgkp,  nip,  tmpt_lhr,
                                   tgl_lhr,  jenis_klmn,  gologan,
                         pengkat,  jabatan,  nama_kantor,
                         alamat_kantor,  telp,  user_id);
      }
      rs.close();
      rs = null;
      stmt.close();
      stmt = null;
      conn.close();
      conn = null;
  }
  catch(Exception e)
  {
    e.printStackTrace();
    siakWriter.writeFile(e);
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
      e.printStackTrace();
    }
    try
    {
      if (stmt != null)
        stmt.close();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    try
    {
      if (conn != null)
        conn.close();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
  }
  return obj;
  }
  public Vector getDaftarPengguna(int level, String divisi,String no_prop,
                                  String no_kab, String no_kec) throws RemoteException
  {
    Vector vData = new Vector();

    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    String query = "";
    Connection conn=null;

    try
    {
      conn = connectorDb.getConnection();

      stmt = conn.createStatement();
      System.out.println("no_prop: "+no_prop);
      System.out.println("no_kab: "+no_kab);
      System.out.println("no_kec: "+no_kec);
System.out.println("divisi: "+divisi);
      if(level==1 && divisi.trim().equals("Supervisor"))
      {
        query = "select * from vw_dftr_perstuju_user where level_id=2 and div_id=4 and no_prop="+no_prop+" and no_kab is null and no_kec is null";
      }
      else if(level==1 && divisi.trim().equals("Umum"))
      {
        query="select * from vw_dftr_perstuju_user where level_id = 1 and div_id=1 and no_prop is null  and no_kab is null and no_kec is null";
      }
      else if(level==2 && divisi.trim().equals("Supervisor") && (no_kab==null||no_kab.trim().equals("")) )
      {
        query = "select * from vw_dftr_perstuju_user where level_id = 3 and div_id = 4 and no_prop ="+no_prop+" and no_kab is null and no_kec is null";
      }
      else if(level==2 && divisi.trim().equals("Supervisor") && (no_kab!=null && !no_kab.trim().equals("")) )
      {
        query = "select * from vw_dftr_perstuju_user where level_id = 3 and div_id = 4 and no_prop ="+no_prop+" and no_kab="+no_kab+" and no_kec is null";
      }
      else if(level==2 && divisi.trim().equals("Umum"))
      {
        query = "select * from vw_dftr_perstuju_user where level_id = 2 and div_id = 1 and no_prop ="+no_prop+" and no_kab is null and no_kec is null";
      }
      else if(level==3 && divisi.trim().equals("Supervisor") && (no_kec==null||no_kec.trim().equals("")) )
      {
        query = "select * from vw_dftr_perstuju_user where level_id=3 and div_id in(5,6) and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec is null";
      }
      else if(level==3 && divisi.trim().equals("Supervisor") && (no_kec!=null||!no_kec.trim().equals("")) )
      {
        query = "select * from vw_dftr_perstuju_user where level_id=4 and div_id=5 and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec ="+no_kec;
      }
      else if(level==3 && divisi.trim().equals("Operator") && (no_kec==null||no_kec.trim().equals("")) )
      {
      query = "select * from vw_dftr_perstuju_user where level_id=3 and div_id in(2,3) and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec is null";
      }
      else if(level==3 && divisi.trim().equals("Operator") && (no_kec!=null||!no_kec.trim().equals("")) )
      {
      query = "select * from vw_dftr_perstuju_user where level_id=4 and div_id in(2,3) and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec ="+no_kec;
      }
    else if(level==3 && divisi.trim().equals("Umum") && (no_kec==null||no_kec.trim().equals("")) )
    {
    query = "select * from vw_dftr_perstuju_user where level_id=3 and div_id=1 and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec is null";
    }
    else if(level==3 && divisi.trim().equals("Umum") && (no_kec!=null||!no_kec.trim().equals("")) )
    {
    query = "select * from vw_dftr_perstuju_user where level_id=4 and div_id=1 and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec ="+no_kec;
    }

      System.out.println(query+"-->>");
      rs = stmt.executeQuery(query);
      String nama_lgkp="", user_id="",nip="",division="";

      while(rs.next())
      {
        nama_lgkp = rs.getString("NAMA_LGKP");
        user_id = rs.getString("USER_ID");
        nip = rs.getString("NIP");
        division = rs.getString("DIVISION");

        SecurityObject obj = new SecurityObject(user_id, nama_lgkp, nip,division);
        vData.addElement(obj);
      }

      rs.close();
      rs =null;
      stmt.close();
      stmt = null;
      conn.close();
      conn = null;
    }
    catch(Exception e)
    {
      e.printStackTrace();
      siakWriter.writeFile(e);
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
        e.printStackTrace();
      }
      try
      {
        if (stmt != null)
          stmt.close();
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch(Exception e)
      {
        e.printStackTrace();
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

