package kepemilikan.aktalahirdanktp;

import javax.ejb.*;

import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import java.util.*;
import siaktools.logwriter.SiakWriter;

public class AktaLahirDanKTPBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector getDataKepemilikanAktaLahirDanKTP() throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    String query = "select "+
        "getNamaProp(a.no_prop) Nama_Prop, a.Jumlah , a.AdaLahir ,b.count1 Wajib, " +
        "(b.KTpAda1) Telah, " +
        "(b.KTPTida1) Belum " +
        "from " +
        "(select count(nik) Jumlah , count(decode(AKTA_LHR,1,1)) AdaLahir,no_prop " +
        "from biodata_wni group by no_prop) a, " +
        "(select " +
        "count(nik) count1, " +
        "count(decode(STAT_KTP,1,1)) KTpAda1, " +
        "count(decode(STAT_KTP,0,1)) KTPTida1, " +
        "no_prop " +
        "from biodata_wni " +
        "where (FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) >= 17 " +
        "OR (FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) < 17 and stat_kwn in(2,3,4))) " +
        "GROUP BY NO_PROP) b";

    Vector vData = new Vector();

    try
    {
      conn = connectorDb.getConnection();

      ps = conn.prepareStatement(query);
      rs = ps.executeQuery();
      String nama_prop="", jumlah_penduduk="", ada_akta_lahir="", wajib_memiliki_ktp="";
      String telah_memiliki_ktp="", belum_memiliki_ktp="";

      while(rs.next())
      {
        AktaLahirDanKtpObject obj = null;
        nama_prop = rs.getString("NAMA_PROP");
        jumlah_penduduk = rs.getString("JUMLAH");
        ada_akta_lahir = rs.getString("ADALAHIR");
        wajib_memiliki_ktp = rs.getString("WAJIB");
        telah_memiliki_ktp = rs.getString("TELAH");
        belum_memiliki_ktp = rs.getString("BELUM");

        obj = new AktaLahirDanKtpObject( nama_prop, jumlah_penduduk, ada_akta_lahir
                               , wajib_memiliki_ktp
                               , telah_memiliki_ktp, belum_memiliki_ktp);
        vData.addElement(obj);
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
    return vData;
  }
  public String getSysdate() throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String sysdate = "";
    Connection conn=null;
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