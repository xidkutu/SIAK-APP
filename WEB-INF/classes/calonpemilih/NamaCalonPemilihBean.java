package calonpemilih;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.DataKelurahan;

import siaktools.logwriter.SiakWriter;
import jmlpddk.agama.InfoWilayah;
import jmlpddk.agama.ListProp;
import jmlpddk.agama.ListKab;
import jmlpddk.agama.ListKec;
import jmlpddk.agama.ListKel;

public class NamaCalonPemilihBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector getDataCalonPemilih(String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String query ="";
    String condition="";
    String statKawinDanUsiaCondition = " AND ((FLOOR(MONTHS_BETWEEN(SYSDATE, TGL_LHR)/12)>=17) OR (STAT_KWN>1))";
    Vector vData = new Vector();
    query = "select "+
        "to_char(nik) nik, " +
        "nama_lgkp, " +
        "tmpt_lhr||'/'||tgl_lhr TmpTglLhr, " +
        "decode(jenis_klmin,1,'Laki-Laki',2,'Perempuan') jenis_klmin, " +
        "decode(PNYDNG_CCT,5,'Ada','Tidak Ada') PNYDNG_CCT, " +
        " upper(getPkrjn(JENIS_PKRJN)) JENIS_PKRJN," +
        "decode(PDDK_AKH,1,'Tidak/Belum Sekolah',2,'Tidak Tamat SD/Sederajat',3,'Tamat SD /Sederajat',4, " +
        "'SLTP/Sederajat',5,'SLTA/Sederajat',6,'Diploma I/II',7,'Akademi/Diploma III/s.muda',8, " +
        "'Diploma IV/Strata I',9,'Strata II',10,'Strata III') PDDK_AKH " +
        " from biodata_wni where ";
 try
  {
    conn = connectorDb.getConnection();
    if( (no_kab==null && no_kec==null && no_kel==null)
        || ( no_kab.trim().equals("")&&no_kec.trim().equals("")&&no_kel.trim().equals("") ) )
    {
      condition= " no_prop=?";
      query=query+ condition + statKawinDanUsiaCondition;
      ps = conn.prepareStatement(query);
      ps.setString(1,no_prop);
    }
    else if( (no_kab!=null && no_kec==null && no_kel==null)||
             (!no_kab.trim().equals("")&& no_kec.trim().equals("")) && no_kel.trim().equals("") )
    {
      condition=" no_prop=? and no_kab=?";
      query=query+ condition + statKawinDanUsiaCondition;
      ps = conn.prepareStatement(query);
      ps.setString(1,no_prop);
      ps.setString(2,no_kab);
    }
    else if (no_kab!=null && no_kec!=null && no_kel==null ||
             (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && no_kel.trim().equals(""))
    {
       condition=" no_prop=? and no_kab=? and no_kec=?";
       query=query+ condition + statKawinDanUsiaCondition;
       ps = conn.prepareStatement(query);
       ps.setString(1,no_prop);
       ps.setString(2,no_kab);
       ps.setString(3,no_kec);
    }
    else if(no_kab!=null && no_kec!=null && no_kel!=null ||
             (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && !no_kel.trim().equals(""))
    {
      condition=" no_prop=? and no_kab=? and no_kec=? and no_kel=?";
      query=query+ condition + statKawinDanUsiaCondition;
      ps = conn.prepareStatement(query);
      ps.setString(1,no_prop);
      ps.setString(2,no_kab);
      ps.setString(3,no_kec);
      ps.setString(4,no_kel);
    }
      rs = ps.executeQuery();
      String nik="", nama_lgkp="", tmptgllhr="", jenis_klmin="", pnydng_cc="", jenis_pkrjn="", pddk_akh="";
  while(rs.next())
     {
        NamaCalonPemilihObject obj = null;
        nik = rs.getString("NIK");
        nama_lgkp = rs.getString("NAMA_LGKP");
        tmptgllhr = rs.getString("TMPTGLLHR");
        jenis_klmin = rs.getString("JENIS_KLMIN");
        pnydng_cc = rs.getString("PNYDNG_CCT");
        jenis_pkrjn = rs.getString("JENIS_PKRJN");
        pddk_akh = rs.getString("PDDK_AKH");
        obj = new NamaCalonPemilihObject( nik,  nama_lgkp, tmptgllhr,
                                 jenis_klmin, pnydng_cc, jenis_pkrjn, pddk_akh);
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
  public Vector getDataCalonPemilihFor(String no_prop, String no_kab, String no_kec, String no_kel) {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String query ="";
    String condition="";
    String umur_usia="";
    String nikah="";
    String klmin_de="";
    String alamat="";
    String statKawinDanUsiaCondition = " AND ((FLOOR(MONTHS_BETWEEN(SYSDATE, a.TGL_LHR)/12)>=17) OR (a.STAT_KWN>1))";
    Vector vData = new Vector();
    query = "select "+
        "to_char(a.nik) nik, " +
        "a.nama_lgkp, " +
        "a.tmpt_lhr||'/'||a.tgl_lhr TmpTglLhr, " +
        "decode(a.jenis_klmin,1,'Laki-Laki',2,'Perempuan') jenis_klmin, " +
        "decode(a.PNYDNG_CCT,5,'Ada','Tidak Ada') PNYDNG_CCT, " +
        " upper(getPkrjn(a.JENIS_PKRJN)) JENIS_PKRJN," +
        "decode(a.PDDK_AKH,1,'Tidak/Belum Sekolah',2,'Tidak Tamat SD/Sederajat',3,'Tamat SD /Sederajat',4, " +
        "'SLTP/Sederajat',5,'SLTA/Sederajat',6,'Diploma I/II',7,'Akademi/Diploma III/s.muda',8, " +
        "'Diploma IV/Strata I',9,'Strata II',10,'Strata III') PDDK_AKH ," +
        "decode(a.stat_kwn,1,'B',2,'S','P') stat_kwn," +
        "decode(a.jenis_klmin,1,'LK',2,'PR') jenis_klmin2," +
        "FLOOR(MONTHS_BETWEEN(SYSDATE, a.TGL_LHR)/12) umur, " +
        "b.alamat " +
        " from biodata_wni a, data_keluarga b where a.NO_KK=b.NO_KK and ";
 try
  {
    conn = connectorDb.getConnection();
    if( (no_kab==null && no_kec==null && no_kel==null)
        || ( no_kab.trim().equals("")&&no_kec.trim().equals("")&&no_kel.trim().equals("") ) )
    {
      condition= " a.no_prop=?";
      query=query+ condition + statKawinDanUsiaCondition;
      ps = conn.prepareStatement(query);
      ps.setString(1,no_prop);
    }
    else if( (no_kab!=null && no_kec==null && no_kel==null)||
             (!no_kab.trim().equals("")&& no_kec.trim().equals("")) && no_kel.trim().equals("") )
    {
      condition=" a.no_prop=? and a.no_kab=?";
      query=query+ condition + statKawinDanUsiaCondition;
      ps = conn.prepareStatement(query);
      ps.setString(1,no_prop);
      ps.setString(2,no_kab);
    }
    else if (no_kab!=null && no_kec!=null && no_kel==null ||
             (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && no_kel.trim().equals(""))
    {
       condition=" a.no_prop=? and a.no_kab=? and a.no_kec=?";
       query=query+ condition + statKawinDanUsiaCondition;
       ps = conn.prepareStatement(query);
       ps.setString(1,no_prop);
       ps.setString(2,no_kab);
       ps.setString(3,no_kec);
    }
    else if(no_kab!=null && no_kec!=null && no_kel!=null ||
             (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && !no_kel.trim().equals(""))
    {
      condition=" a.no_prop=? and a.no_kab=? and a.no_kec=? and a.no_kel=?";
      query=query+ condition + statKawinDanUsiaCondition;
      ps = conn.prepareStatement(query);
      ps.setString(1,no_prop);
      ps.setString(2,no_kab);
      ps.setString(3,no_kec);
      ps.setString(4,no_kel);
    }
      System.out.println(query);
      rs = ps.executeQuery();
      String nik="", nama_lgkp="", tmptgllhr="", jenis_klmin="", pnydng_cc="", jenis_pkrjn="", pddk_akh="";
  while(rs.next())
     {
        NamaCalonPemilihObject obj = null;
        nik = rs.getString("NIK");
        nama_lgkp = rs.getString("NAMA_LGKP");
        tmptgllhr = rs.getString("TMPTGLLHR");
        jenis_klmin = rs.getString("JENIS_KLMIN");
        pnydng_cc = rs.getString("PNYDNG_CCT");
        jenis_pkrjn = rs.getString("JENIS_PKRJN");
        pddk_akh = rs.getString("PDDK_AKH");
        umur_usia = rs.getString("umur");
        nikah = rs.getString("stat_kwn");
        klmin_de = rs.getString("jenis_klmin2");
        alamat = rs.getString("alamat");
        obj = new NamaCalonPemilihObject( nik,  nama_lgkp, tmptgllhr,
                                 jenis_klmin, pnydng_cc, jenis_pkrjn, pddk_akh,
                                 umur_usia,nikah,klmin_de,alamat,"");
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

  public void ejbCreate() throws CreateException {
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