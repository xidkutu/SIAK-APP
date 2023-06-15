package pendaftaran;

import java.math.*;
import java.sql.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;

import com.db.connection.*;
import oracle.jdbc.driver.*;
import siaktools.logwriter.SiakWriter;
import java.util.ResourceBundle;
import java.util.Locale;
import java.io.*;


public class WNIBiodataBean
    implements SessionBean {
  SessionContext sessionContext;
//  String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13=null,s14,s15;
  //String nama_kep,alamat,dusun,str,no_prop,no_kab,no_kec,no_kel,no_kk,no_rt,no_rw,kodepos,telp;
  String sql;
  String   sss =null;
  BigDecimal newVal = null;
 private SiakWriter siakWriter;
  public Vector getDataIndividu(String no_kk) {
    Vector vData = new Vector();
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;

try {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      st = conn.createStatement();

      rs = st.executeQuery(
          "select NAMA_LGKP,TMPT_LHR,to_char(TGL_LHR,'dd-mm-yyyy'),NIK_IBU,NAMA_LGKP_IBU"
          + " from biodata_wni where no_kk=" + no_kk);

      while (rs.next()) {
        vData.addElement(rs.getString(1));
        vData.addElement(rs.getString(2));
        vData.addElement(rs.getString(3));
        vData.addElement(rs.getString(4));
        vData.addElement(rs.getString(5));
      }
      rs.close();
      st.close();
      conn.close();
      rs = null;
      st = null;
      conn = null;
    }

    catch (Exception e) {
      e.printStackTrace();
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
      }
      catch (Exception e1) {}

      try {
        if (st != null) {
          st.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }
    return vData;
  }

  public void ejbCreate() throws CreateException {
/*    try
     {
       ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                              Locale.getDefault());
       String path = res.getString("BEAN_PATH");
       //System.out.println("PATH= "+path);
       siakWriter = new SiakWriter(path, this.getClass().getName());
     }  catch(Exception e)
     {
       e.printStackTrace();
     }
  */
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

//********* BUSINESS LOGICS IMPLEMENTATION *********
   public String sysDate() {
     ConnectorDB connectorDb = new ConnectorDB();
     Connection conn = null;
     String select;
     String d = "";
     long l = 0;

     select = "SELECT sysdate from dual";
     Statement stDate = null;
     ResultSet rsDate = null;
     try {
       conn = connectorDb.getConnection();
       stDate = conn.createStatement();
       rsDate = stDate.executeQuery(select);

       while (rsDate.next()) {
         d = rsDate.getString(1);
       }
       rsDate.close();
       stDate.close();
       conn.close();
       rsDate = null;
       stDate = null;
       conn = null;
     }
     catch (Exception e) {
       //System.out.println("Exception in SysDate = " + e);
     }
     finally {
       try {
         if (rsDate != null) {
           rsDate.close();
         }
       }
       catch (Exception e1) {}

       try {
         if (stDate != null) {
           stDate.close();
         }
       }
       catch (Exception e3) {}

       try {
         if (conn != null) {
           conn.close();
         }
       }
       catch (Exception e4) {}
     }
     return d;
   }

  public Vector list(String a) {
    Vector v = new Vector();
    String select, s7, s8, s9, s10, s11, s12, s13, s14, s15;

    select = "select * from vw_daftar_anggota where nok=" + a;
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;

    ResultSet rs = null;
    Statement stmt = null;

    try {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();
      rs = stmt.executeQuery(select);

      while (rs.next()) {
        s7 = rs.getString("NIK");
        v.addElement( (Object) s7);
        s8 = rs.getString("NAMA_LGKP");
        v.addElement( (Object) s8);
        s10 = rs.getString("JENIS_KLMIN");
        v.addElement( (Object) s10);
        s11 = rs.getString("TMPT_LHR");
        v.addElement( (Object) s11);
        s12 = rs.getString("TGL_LHR");
        v.addElement( (Object) s12);
        s9 = rs.getString("STAT_HBKEL");
        v.addElement( (Object) s9);
        s13 = rs.getString("NIK_IBU");

        if (s13 != null) {
          v.addElement( (Object) s13);
        }
        else {
          s13 = "-";
          v.addElement( (Object) s13);
        }
        s14 = rs.getString("NAMA_LGKP_IBU");
        v.addElement( (Object) s14);
        s15 = rs.getString("NO_PASPOR");
        v.addElement( (Object) s15);
      }

      stmt.close();
      rs.close();
      conn.close();
      stmt = null;
      rs = null;
      conn = null;
    }
    catch (Exception ee) {
      //System.out.println("Exception = " + ee);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
      }
      catch (Exception e1) {}

      try {
        if (stmt != null) {
          stmt.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }

    return v;
  }

  public UserInfo2 compare_KKID1(String str) {
    String s1 = "";
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;

    ResultSet rsnew = null;
    Statement stnew = null;

    UserInfo2 info = null;

    try {
      conn = connectorDb.getConnection();
      stnew = conn.createStatement();

      rsnew = stnew.executeQuery("SELECT to_char(NO_KK,'0000000000000000')"
                                 + " from data_keluarga where no_kk=" + str);

      if (rsnew.next()) {
        s1 = rsnew.getString(1);
        info = new UserInfo2(s1);
      }
      else {
        info = null;
      }
      rsnew.close();
      stnew.close();
      conn.close();
      rsnew = null;
      stnew = null;
      conn = null;
    }
    catch (Exception ee) {
      //System.out.println("Exception in WNIBiodataBean : " + ee);
    }
    finally {
      try {
        if (rsnew != null) {
          rsnew.close();
        }
      }
      catch (Exception e1) {}

      try {
        if (stnew != null) {
          stnew.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }

    return info;
  }

  public UserInfo compare_KKID(String str) {
    String s1, s2, s3, s4;
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;

    ResultSet rs = null;
    Statement st = null;

    UserInfo info = null;

    try {
      conn = connectorDb.getConnection();
      st = conn.createStatement();
      rs = st.executeQuery("SELECT to_char(NO_KK,'0000000000000000'),NAMA_KEP,ALAMAT FROM DATA_KELUARGA WHERE NO_KK=" +
                           str);

      if (rs.next()) {
        s1 = rs.getString(1);
        s2 = rs.getString(2);
        s3 = rs.getString(3);
        info = new UserInfo(s1, s2, s3);
      }
      else {
        info = null;
      }
      rs.close();
      st.close();
      conn.close();
      rs = null;
      st = null;
      conn = null;
    }
    catch (Exception ee) {
      //System.out.println("Exception in WNIBiodataBean : " + ee);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
      }
      catch (Exception e1) {}

      try {
        if (st != null) {
          st.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }

    return info;
  }

  public UserInfo compare_KKID(String no_prop, String no_kab, String no_kec, String no_kel, String no_kk) {
    String s1, s2, s3, s4;
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;

    ResultSet rs = null;
    Statement st = null;

    UserInfo info = null;

    try {
      conn = connectorDb.getConnection();
      st = conn.createStatement();
      rs = st.executeQuery("SELECT to_char(NO_KK,'0000000000000000'),NAMA_KEP,ALAMAT FROM DATA_KELUARGA WHERE NO_KK=" + no_kk + " and no_prop=" + no_prop + " and no_kab=" + no_kab + " and no_kec= " + no_kec + " and no_kel=" + no_kel);

      if (rs.next()) {
        s1 = rs.getString(1);
        s2 = rs.getString(2);
        s3 = rs.getString(3);
        info = new UserInfo(s1, s2, s3);
      }
      else {
        info = null;
      }
      rs.close();
      st.close();
      conn.close();
      rs = null;
      st = null;
      conn = null;
    }
    catch (Exception ee) {
      //System.out.println("Exception in WNIBiodataBean : " + ee);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
      }
      catch (Exception e1) {}

      try {
        if (st != null) {
          st.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }

    return info;
  }


  //********* BUSINESS LOGICS IMPLEMENTATION USING ENTITY BEANS *********

   //********** Insertion in Data Keluarga Table **************

    private String getConcatNik(Vector v) {
      String nik_total = "", str_prop = "", str_kab = "", str_kec = "",
          str_kel = "", str_dd = "", str_mm = "", str_yy1 = "", str_yy = "";
      int dd;
      String s1 = "";

      str_prop = (String) v.elementAt(43);
      str_kab = (String) v.elementAt(44);
      str_kec = (String) v.elementAt(45);
      str_kel = (String) v.elementAt(46);

      s1 = getTrimData(v.elementAt(6));

      str_dd = getTrimData(v.elementAt(8));

      if (s1.equals("2")) {
        dd = Integer.parseInt(str_dd);
        dd = dd + 40;
        str_dd = toString().valueOf(dd);
      }
      str_mm = getTrimData(v.elementAt(9));
      str_yy1 = getTrimData(v.elementAt(10));
      str_yy = str_yy1.substring(2, 4);
      nik_total = str_prop + str_kab + str_kec + str_dd + str_mm + str_yy;
      return (nik_total);
    }


private String getConcatNik(String wilayah, String jeniskl, String ddlhr, String mmlhr, String yylhr) {
     String nik_total = "", str_dd = "", str_yy = "";
      int dd=0;
     if (jeniskl.equals("2")) {
        dd = Integer.parseInt(ddlhr);
        dd = dd + 40;
        str_dd = toString().valueOf(dd);
      }
      str_yy = yylhr.substring(2, 4);
      nik_total = wilayah + str_dd + mmlhr + str_yy;
      return (nik_total);
   }


  public java.lang.String kepalaKaluarga(Vector v1) {
    String nama_kep, alamat, dusun, str, no_prop, no_kab, no_kec, no_kel, no_kk,
        no_rt, no_rw, kodepos, telp;

    no_prop = getTrimData(v1.elementAt(0));
    no_kab = getTrimData(v1.elementAt(1));
    no_kec = getTrimData(v1.elementAt(2));
    no_kel = getTrimData(v1.elementAt(3));

    nama_kep = getTrimData(v1.elementAt(4));
    alamat = getTrimData(v1.elementAt(5));
    no_rt = getTrimData("0", v1.elementAt(6));
    no_rw = getTrimData("0", v1.elementAt(7));
    dusun = getTrimData(v1.elementAt(8));
    kodepos = getTrimData(v1.elementAt(9));
    telp = getTrimData(v1.elementAt(10));
    ServiceEntity wniFactory;
    DataKeluarga remote = null;
    DataKeluargaHome home = null;
    String sysDate = null;

    sysDate = sysDate();

    CallableStatement cs = null;
    Connection con = null;
    boolean b = false;
    String returnval = null, nokk;
    int i = 0;

    try {
      ConnectorDB connectorDb = new ConnectorDB();
      con = connectorDb.getConnection();
      sss = no_prop + no_kab + no_kec;
      cs = con.prepareCall("{? = call getkk(?)}");
      cs.registerOutParameter(1, java.sql.Types.VARCHAR);
      cs.setString(2, sss);
      cs.execute();
      returnval = cs.getString(1);
      cs.close();
      con.close();
      cs = null;
      con = null;
    }
    catch (Exception ee) {
      //System.out.println("Exception in Select : " + ee);
    }
    finally {
      try {
        if (cs != null) {
          cs.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (con != null) {
          con.close();
        }
      }
      catch (Exception e4) {}
    }

    try {
      wniFactory = ServiceEntity.getInstance();
      home = (DataKeluargaHome) wniFactory.lookup("DataKeluarga",
                                                  DataKeluargaHome.class);

      if (home != null) {

        remote = home.create(getTrimBigDecimalData(returnval), nama_kep,
                             alamat, getTrimBigDecimalData(no_rt),
                             getTrimBigDecimalData(no_rw), dusun,
                             getTrimBigDecimalData(kodepos),
                             telp, new BigDecimal("0"),
                             new BigDecimal("0"),
                             getTrimBigDecimalData(no_prop),
                             getTrimBigDecimalData(no_kab),
                             getTrimBigDecimalData(no_kec),
                             getTrimBigDecimalData(no_kel),
                             new BigDecimal("0"),
                             sysDate,
                             null,
                             "N", "N");
        remote = home.findByPrimaryKey(getTrimBigDecimalData(returnval));
        if (remote != null) {
          newVal = remote.getNoKk();
        }
        b = true;
      }
      else {
        b = false;
      }
    }
    catch (Exception err) {
      //System.out.println("Error from Facade DataKeluarga" + err.toString());

    }
    return returnval;
  }

//Parameter 1 of type Vector  for DataKeluarga
//Parameter 2 of type Vector  for BiodataWNI

  public java.lang.String kepalaKaluarga(Vector v2, Vector v) {
    String nama_kep, alamat, dusun, str, no_prop, no_kab, no_kec, no_kel, no_kk,
        no_rt, no_rw, kodepos, telp;
    String nik_total = "";
    Connection conn = null;
    ServiceEntity wniFactory;
    DataKeluarga remote = null;
    DataKeluargaHome home = null;
    String sysDate = null;
    CallableStatement cs = null;
    no_prop = getTrimData(v2.elementAt(0));
    no_kab = getTrimData(v2.elementAt(1));
    no_kec = getTrimData(v2.elementAt(2));
    no_kel = getTrimData(v2.elementAt(3));
    nama_kep = getTrimData(v2.elementAt(4));
    alamat = getTrimData(v2.elementAt(5));
    no_rt = getTrimData(v2.elementAt(6));
    no_rw = getTrimData(v2.elementAt(7));
    dusun = getTrimData(v2.elementAt(8));
    kodepos = getTrimData(v2.elementAt(9));
    telp = getTrimData(v2.elementAt(10));
    sysDate = getTrimData(v.elementAt(49));
    boolean b = false;
    String successNoKk = null, successNik = null, returnval = null, returnval1 = null,
        nokk;
    int i = 0;
 try {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      sss = no_prop + no_kab + no_kec;
      cs = conn.prepareCall("{? = call getkk(?)}");
      cs.registerOutParameter(1, java.sql.Types.VARCHAR);
      cs.setString(2, sss);
      cs.execute();
      returnval = cs.getString(1); //Returned Nomor KK
      nik_total = getConcatNik(v);
      cs = conn.prepareCall("{? = call getNik(?)}");
      cs.registerOutParameter(1, java.sql.Types.VARCHAR);
      cs.setString(2, nik_total);
      cs.execute();
      returnval1 = cs.getString(1); //Returned NIK
      cs.close();
      conn.close();
      cs = null;
      conn = null;
      wniFactory = ServiceEntity.getInstance();
      home = (DataKeluargaHome) wniFactory.lookup("DataKeluarga",
                                                  DataKeluargaHome.class);
      if (home != null) {
        remote = home.create(getTrimBigDecimalData(returnval1),
                             getTrimBigDecimalData(returnval), nama_kep,
                             alamat, getTrimBigDecimalData(no_rt),
                             getTrimBigDecimalData(no_rw), dusun,
                             getTrimBigDecimalData(kodepos),
                             telp, new BigDecimal("0"),
                             new BigDecimal("0"),
                             getTrimBigDecimalData(no_prop),
                             getTrimBigDecimalData(no_kab),
                             getTrimBigDecimalData(no_kec),
                             getTrimBigDecimalData(no_kel),
                             new BigDecimal("0"),
                             sysDate,
                             null,
                             "N", "N", v);
        successNoKk = returnval;
        successNik = returnval1;
      }
    }
    catch (Exception ee) {
      try{
        ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                              Locale.getDefault());
        String bean_path = res.getString("BEAN_PATH");

        siaktools.logwriter.SiakWriter wr = new siaktools.logwriter.SiakWriter(bean_path);
        wr.writeFile(ee);
      }catch(Exception ferr)
      {

      }
    }
    finally {
      try {
        if (cs != null) {
          cs.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }
    return successNoKk.concat(successNik.trim()).trim();
  }

  //Function for Date Concatination

  private String getSiakDate(String dd, String mm, String yy) {
    if ( (dd == null || dd.trim().equals("") || dd.trim().equals("0")) ||
        (mm == null || mm.trim().equals("") || mm.trim().equals("0"))
        || (yy == null || yy.trim().equals("") || yy.trim().equals("0"))) {
      return null;
    }
    return (dd.trim() + "-" + mm.trim() + "-" + yy.trim());
  }


public BioSiak getBioSiak(String no_prop, String no_kab, String no_kec, String no_kel, String nik)
  {
 BioSiak record = null;
 Connection conn = null;
 PreparedStatement st = null;
 ResultSet rs = null;
String sql = "SELECT  TO_CHAR(a.nik,'0000000000000000') NIK,a.NO_KTP,nvl(a.TMPT_SBL,'-') TMPT_SBL, nvl(a.NO_PASPOR,'-') NO_PASPOR,nvl(to_char(a.TGL_AKH_PASPOR,'dd-mm-yyyy'),'-') TGL_AKH_PASPOR,a.NAMA_LGKP,a.JENIS_KLMIN," +
     " nvl(a.TMPT_LHR,'-') TMPT_LHR, nvl(to_char(a.TGL_LHR,'dd-mm-yyyy'),'-') TGL_LHR ,a.AKTA_LHR,nvl(a.NO_AKTA_LHR,'-') NO_AKTA_LHR, a.GOL_DRH,a.AGAMA,a.STAT_KWN," +
     " a.AKTA_KWN,nvl(a.NO_AKTA_KWN,'-') NO_AKTA_KWN,nvl(to_char(a.TGL_KWN,'dd-mm-yyyy'),'-') TGL_KWN, a.AKTA_CRAI,nvl(a.NO_AKTA_CRAI,'-') NO_AKTA_CRAI, nvl(to_char(a.TGL_CRAI,'dd-mm-yyyy'),'-') TGL_CRAI," +
     " a.STAT_HBKEL,a.KLAIN_FSK,a.PNYDNG_CCT,a.PDDK_AKH,a.JENIS_PKRJN,NVL(TO_CHAR(a.NIK_IBU),' ') NIK_IBU, " +
     " a.NAMA_LGKP_IBU,nvl(to_char(a.NIK_AYAH),' ') NIK_AYAH, a.NAMA_LGKP_AYAH,a.NAMA_KET_RT,a.NAMA_KET_RW," +
     " a.NAMA_PET_REG,nvl(to_char(a.NIP_PET_REG),' ') NIP_PET_REG, a.NAMA_PET_ENTRI,a.NIP_PET_ENTRI,to_char(a.TGL_ENTRI,'dd-mm-yyyy') TGL_ENTRI," +
     " to_char(a.NO_KK,'0000000000000000') NO_KK,a.NO_PROP,a.NO_KAB,a.NO_KEC,a.NO_KEL," +
     " b.NAMA_KEP,b.ALMT_T alamat,b.RT_T no_rt,b.RW_T no_rw,NVL(b.DUSUN_T,'-') dusun," +
     " DECODE(b.KODE_POS_T,NULL,' ',0,' ',b.kode_pos_T) KODE_POS, a.cflag, " +
     " NVL(b.TELP_T,'-') TELP FROM  BIODATA_WNI a, TABLE(Getalmtpivot(a.NO_KK)) b " +
     " where a.nik="+ nik + " and a.no_prop=" + no_prop + " and a.no_kab=" + no_kab + " and a.no_kec=" + no_kec + " and a.no_kel=" + no_kel;

////System.out.println(sql);

//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found

try {
   ConnectorDB connectorDb = new ConnectorDB();
   conn = connectorDb.getConnection();
   st = conn.prepareStatement(sql);
   rs=st.executeQuery();

if  (rs.next())
     {
  if (rs.getString("cflag").equals("Y"))
       {
         //record=new BioSiak();
         //record.setAcknowldge("Y");
         record = new BioSiak(rs.getString("NO_KK"),
                                  rs.getString("NAMA_KEP"),
                                  rs.getString("alamat"),
                                  rs.getString("no_rt"),
                                  rs.getString("no_rw"),
                                  rs.getString("dusun"),
                                  rs.getString("KODE_POS"),
                                  rs.getString("TELP"),
                                  rs.getString("NIK"),
                                  rs.getString("NO_KTP"),
                                  rs.getString("TMPT_SBL"),
                                  rs.getString("NO_PASPOR"),
                                  rs.getString("TGL_AKH_PASPOR"),
                                  rs.getString("NAMA_LGKP"),
                                  rs.getString("JENIS_KLMIN"),
                                  rs.getString("TMPT_LHR"),
                                  rs.getString("TGL_LHR"),
                                  rs.getString("AKTA_LHR"),
                                  rs.getString("NO_AKTA_LHR"),
                                  rs.getString("GOL_DRH"),
                                  rs.getString("AGAMA"),
                                  rs.getString("STAT_KWN"),
                                  rs.getString("AKTA_KWN"),
                                  rs.getString("NO_AKTA_KWN"),
                                  rs.getString("TGL_KWN"),
                                  rs.getString("AKTA_CRAI"),
                                  rs.getString("NO_AKTA_CRAI"),
                                  rs.getString("TGL_CRAI"),
                                  rs.getString("STAT_HBKEL"),
                                  rs.getString("KLAIN_FSK"),
                                  rs.getString("PNYDNG_CCT"),
                                  rs.getString("PDDK_AKH"),
                                  rs.getString("JENIS_PKRJN"),
                                  rs.getString("NIK_IBU"),
                                  rs.getString("NAMA_LGKP_IBU"),
                                  rs.getString("NIK_AYAH"),
                                  rs.getString("NAMA_LGKP_AYAH"),
                                  rs.getString("NAMA_KET_RT"),
                                  rs.getString("NAMA_KET_RW"),
                                  rs.getString("NAMA_PET_REG"),
                                  rs.getString("NIP_PET_REG"),
                                  rs.getString("NAMA_PET_ENTRI"),
                                  rs.getString("NIP_PET_ENTRI"),
                                  rs.getString("TGL_ENTRI"));
                                  record.setAcknowldge("N");

       }
  else if(rs.getString("cflag").equals("N"))
      {
        record = new BioSiak(rs.getString("NO_KK"),
                                  rs.getString("NAMA_KEP"),
                                  rs.getString("alamat"),
                                  rs.getString("no_rt"),
                                  rs.getString("no_rw"),
                                  rs.getString("dusun"),
                                  rs.getString("KODE_POS"),
                                  rs.getString("TELP"),
                                  rs.getString("NIK"),
                                  rs.getString("NO_KTP"),
                                  rs.getString("TMPT_SBL"),
                                  rs.getString("NO_PASPOR"),
                                  rs.getString("TGL_AKH_PASPOR"),
                                  rs.getString("NAMA_LGKP"),
                                  rs.getString("JENIS_KLMIN"),
                                  rs.getString("TMPT_LHR"),
                                  rs.getString("TGL_LHR"),
                                  rs.getString("AKTA_LHR"),
                                  rs.getString("NO_AKTA_LHR"),
                                  rs.getString("GOL_DRH"),
                                  rs.getString("AGAMA"),
                                  rs.getString("STAT_KWN"),
                                  rs.getString("AKTA_KWN"),
                                  rs.getString("NO_AKTA_KWN"),
                                  rs.getString("TGL_KWN"),
                                  rs.getString("AKTA_CRAI"),
                                  rs.getString("NO_AKTA_CRAI"),
                                  rs.getString("TGL_CRAI"),
                                  rs.getString("STAT_HBKEL"),
                                  rs.getString("KLAIN_FSK"),
                                  rs.getString("PNYDNG_CCT"),
                                  rs.getString("PDDK_AKH"),
                                  rs.getString("JENIS_PKRJN"),
                                  rs.getString("NIK_IBU"),
                                  rs.getString("NAMA_LGKP_IBU"),
                                  rs.getString("NIK_AYAH"),
                                  rs.getString("NAMA_LGKP_AYAH"),
                                  rs.getString("NAMA_KET_RT"),
                                  rs.getString("NAMA_KET_RW"),
                                  rs.getString("NAMA_PET_REG"),
                                  rs.getString("NIP_PET_REG"),
                                  rs.getString("NAMA_PET_ENTRI"),
                                  rs.getString("NIP_PET_ENTRI"),
                                  rs.getString("TGL_ENTRI"));
                                  record.setAcknowldge("N");
      }
     }
     else {
       record = new BioSiak();
       record.setAcknowldge("F");
     }
     rs.close();
     st.close();
     conn.close();
 }catch(Exception ex)
 {
   //siakWriter.writeFile(ex);
    ex.printStackTrace();
    record=new BioSiak();
    record.setAcknowldge("E");
 }

finally {
   try {
     if (rs != null) {
       rs.close();
     }
   }
   catch (Exception e1) {}

   try {
     if (st != null) {
       st.close();
     }
   }
   catch (Exception e3) {}

   try {
     if (conn != null) {
       conn.close();
     }
   }
   catch (Exception e4) {}
 }

return record;
}


public BioSiak getBioSiak(String nik)
    {
   BioSiak record = null;
   Connection conn = null;
   PreparedStatement st = null;
   ResultSet rs = null;
  String sql = "SELECT  TO_CHAR(a.nik,'0000000000000000') NIK,a.NO_KTP,nvl(a.TMPT_SBL,'-') TMPT_SBL, nvl(a.NO_PASPOR,'-') NO_PASPOR,nvl(to_char(a.TGL_AKH_PASPOR,'dd-mm-yyyy'),'-') TGL_AKH_PASPOR,a.NAMA_LGKP,a.JENIS_KLMIN," +
       " nvl(a.TMPT_LHR,'-') TMPT_LHR, nvl(to_char(a.TGL_LHR,'dd-mm-yyyy'),'-') TGL_LHR ,a.AKTA_LHR,nvl(a.NO_AKTA_LHR,'-') NO_AKTA_LHR, a.GOL_DRH,a.AGAMA,a.STAT_KWN," +
       " a.AKTA_KWN,nvl(a.NO_AKTA_KWN,'-') NO_AKTA_KWN,nvl(to_char(a.TGL_KWN,'dd-mm-yyyy'),'-') TGL_KWN, a.AKTA_CRAI,nvl(a.NO_AKTA_CRAI,'-') NO_AKTA_CRAI, nvl(to_char(a.TGL_CRAI,'dd-mm-yyyy'),'-') TGL_CRAI," +
       " a.STAT_HBKEL,a.KLAIN_FSK,a.PNYDNG_CCT,a.PDDK_AKH,a.JENIS_PKRJN,NVL(TO_CHAR(a.NIK_IBU),' ') NIK_IBU, " +
       " a.NAMA_LGKP_IBU,nvl(to_char(a.NIK_AYAH),' ') NIK_AYAH, a.NAMA_LGKP_AYAH,a.NAMA_KET_RT,a.NAMA_KET_RW," +
       " a.NAMA_PET_REG,nvl(to_char(a.NIP_PET_REG),' ') NIP_PET_REG, a.NAMA_PET_ENTRI,a.NIP_PET_ENTRI,to_char(a.TGL_ENTRI,'dd-mm-yyyy') TGL_ENTRI," +
       " to_char(a.NO_KK,'0000000000000000') NO_KK,a.NO_PROP,a.NO_KAB,a.NO_KEC,a.NO_KEL,getNamaProp(a.NO_PROP) nama_prop,getNamaKab(a.NO_PROP,a.NO_KAB) nama_kab,getNamaKec(a.NO_PROP,a.NO_KAB,a.NO_KEC) nama_kec,getNamaKel(a.NO_PROP,a.NO_KAB,a.NO_KEC,a.NO_KEL) nama_kel" +
       " b.NAMA_KEP,b.ALMT_T alamat,b.RT_T no_rt,b.RW_T no_rw,NVL(b.DUSUN_T,'-') dusun," +
       " DECODE(b.KODE_POS_T,NULL,' ',0,' ',b.kode_pos_T) KODE_POS, a.cflag, " +
       " NVL(b.TELP_T,'-') TELP FROM  BIODATA_WNI a, TABLE(Getalmtpivot(a.NO_KK)) b " +
       " where a.nik="+ nik;
//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found

  try {
     ConnectorDB connectorDb = new ConnectorDB();
     conn = connectorDb.getConnection();
     st = conn.prepareStatement(sql);
     rs=st.executeQuery();

  if  (rs.next())
       {
    if (rs.getString("cflag").equals("Y"))
         {
           record=new BioSiak();
           record.setAcknowldge("Y");
         }
    else if(rs.getString("cflag").equals("N"))
        {
                                    record = new BioSiak(rs.getString("NO_KK"),
                                    rs.getString("NAMA_KEP"),
                                    rs.getString("alamat"),
                                    rs.getString("no_rt"),
                                    rs.getString("no_rw"),
                                    rs.getString("dusun"),
                                    rs.getString("KODE_POS"),
                                    rs.getString("TELP"),
                                    rs.getString("NIK"),
                                    rs.getString("NO_KTP"),
                                    rs.getString("TMPT_SBL"),
                                    rs.getString("NO_PASPOR"),
                                    rs.getString("TGL_AKH_PASPOR"),
                                    rs.getString("NAMA_LGKP"),
                                    rs.getString("JENIS_KLMIN"),
                                    rs.getString("TMPT_LHR"),
                                    rs.getString("TGL_LHR"),
                                    rs.getString("AKTA_LHR"),
                                    rs.getString("NO_AKTA_LHR"),
                                    rs.getString("GOL_DRH"),
                                    rs.getString("AGAMA"),
                                    rs.getString("STAT_KWN"),
                                    rs.getString("AKTA_KWN"),
                                    rs.getString("NO_AKTA_KWN"),
                                    rs.getString("TGL_KWN"),
                                    rs.getString("AKTA_CRAI"),
                                    rs.getString("NO_AKTA_CRAI"),
                                    rs.getString("TGL_CRAI"),
                                    rs.getString("STAT_HBKEL"),
                                    rs.getString("KLAIN_FSK"),
                                    rs.getString("PNYDNG_CCT"),
                                    rs.getString("PDDK_AKH"),
                                    rs.getString("JENIS_PKRJN"),
                                    rs.getString("NIK_IBU"),
                                    rs.getString("NAMA_LGKP_IBU"),
                                    rs.getString("NIK_AYAH"),
                                    rs.getString("NAMA_LGKP_AYAH"),
                                    rs.getString("NAMA_KET_RT"),
                                    rs.getString("NAMA_KET_RW"),
                                    rs.getString("NAMA_PET_REG"),
                                    rs.getString("NIP_PET_REG"),
                                    rs.getString("NAMA_PET_ENTRI"),
                                    rs.getString("NIP_PET_ENTRI"),
                                    rs.getString("TGL_ENTRI"));

                                   record.setNo_prop(rs.getString("no_prop"));
                                   record.setNo_kab(rs.getString("no_kab"));
                                   record.setNo_kec(rs.getString("no_kec"));
                                   record.setNo_kel(rs.getString("no_kel"));
                                   record.setPropNama(rs.getString("nama_prop"));
                                   record.setKabNama(rs.getString("nama_kab"));
                                   record.setKecNama(rs.getString("nama_kec"));
                                   record.setKelNama(rs.getString("nama_kel"));
                                   record.setAcknowldge("N");
        }
       }
       else {
         record = new BioSiak();
         record.setAcknowldge("F");
       }
       rs.close();
       st.close();
       conn.close();
   }catch(Exception ex)
   {
     //siakWriter.writeFile(ex);
      ex.printStackTrace();
      record=new BioSiak();
      record.setAcknowldge("E");
   }

  finally {
     try {
       if (rs != null) {
         rs.close();
       }
     }
     catch (Exception e1) {}

     try {
       if (st != null) {
         st.close();
       }
     }
     catch (Exception e3) {}

     try {
       if (conn != null) {
         conn.close();
       }
     }
     catch (Exception e4) {}
   }

  return record;
  }


  //********** Insertion in Biodata WNI Table **************

/*Insertion function before connection leak message from the production server*/
/*   public String insert(Vector v, String newkk) {

     Vector v1 = new Vector();
     int i = 0, prop = 0, kab = 0, kec = 0, j = 0, k1 = 0, dd;
     String nik_no, kkno;
     ServiceEntity wniFactory;
     BiodataWni remote = null;
     BiodataWniHome home = null;
     ConnectorDB connectorDb = new ConnectorDB();
     Connection conn = null;
     CallableStatement cs = null;
     String returnval = null;
     DataKeluarga remote1 = null;
     DataKeluargaHome home1 = null;

     boolean b = false;

     int l1 = 0, l2 = 0, l3 = 0, l4 = 0, l5 = 0, l6 = 0, l7 = 0, l8 = 0, l9 = 0,
         l10 = 0, l11 = 0, l12 = 0, l13 = 0, l14 = 0, l15 = 0;

     String sysDate = null;

     v1 = v;

     sysDate = getTrimData(v1.elementAt(49));
     //System.out.println("System Date=" + sysDate);

     String select, ss = null, str_prop = null, str_kab = null, str_kec = null,
         str_kel = null, str_dd, str_mm, str_yy, str_yy1, nik_total = null;
     String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
         s16, s17;
     String tgl1 = "", tgl2 = "", tgl3 = "", tgl4 = "";

     // Tanggal Berakhir Paspor
     tgl1 = getSiakDate(getTrimData(v1.elementAt(2)),
                        getTrimData(v1.elementAt(3)),
                        getTrimData(v1.elementAt(4)));
     //Tanggal Lahir
     tgl2 = getSiakDate(getTrimData(v1.elementAt(8)),
                        getTrimData(v1.elementAt(9)),
                        getTrimData(v1.elementAt(10)));
     //Tanggal Perkawinan
     tgl3 = getSiakDate(getTrimData(v1.elementAt(18)),
                        getTrimData(v1.elementAt(19)),
                        getTrimData(v1.elementAt(20)));
     //Tanggal Perceraian
     tgl4 = getSiakDate(getTrimData(v1.elementAt(23)),
                        getTrimData(v1.elementAt(24)),
                        getTrimData(v1.elementAt(25)));

     s1 = getTrimData(v1.elementAt(6));
     s2 = getTrimData(v1.elementAt(11));
     s3 = getTrimData(v1.elementAt(13));
     s4 = getTrimData(v1.elementAt(15));
     s5 = getTrimData(v1.elementAt(16));
     s6 = getTrimData(v1.elementAt(21));
     s7 = getTrimData(v1.elementAt(26));
     s8 = getTrimData(v1.elementAt(27));
     s9 = getTrimData(v1.elementAt(28));
     s10 = getTrimData(v1.elementAt(29));
     s11 = getTrimData(v1.elementAt(30));
     s12 = getTrimData(v1.elementAt(31));
     s13 = getTrimData(v1.elementAt(33));
     s14 = getTrimData(v1.elementAt(38));
     s17 = getTrimData(v1.elementAt(42));

     try {
        str_prop = (String) v1.elementAt(43);
        str_kab = (String) v1.elementAt(44);
        str_kec = (String) v1.elementAt(45);
        str_kel = (String) v1.elementAt(46);

        str_dd = v1.elementAt(8).toString();

        if (s1.equals("2")) {
          dd = Integer.parseInt(str_dd);
          dd = dd + 40;
          str_dd = toString().valueOf(dd);
        }

        str_mm = v1.elementAt(9).toString();
        str_yy1 = v1.elementAt(10).toString();
        str_yy = str_yy1.substring(2, 4);

//      nik_total = str_prop + str_kab + str_kec + str_dd + str_mm + str_yy;
       nik_total = getConcatNik(v1);

       str_prop = (String) v.elementAt(43); //Getting Noporp,nokan,nokec,nokel
       str_kab = (String) v.elementAt(44);
       str_kec = (String) v.elementAt(45);
       str_kel = (String) v.elementAt(46);

       l1 = (v1.elementAt(2).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(2).toString()); // dd
       l2 = (v1.elementAt(3).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(3).toString()); // month
       l3 = (v1.elementAt(4).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(4).toString()); // year

       l4 = Integer.parseInt(v1.elementAt(8).toString()); //dd
       l5 = Integer.parseInt(v1.elementAt(9).toString()); //mm
       l6 = Integer.parseInt(v1.elementAt(10).toString()); //year

       l7 = (v1.elementAt(18).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(18).toString()); //dd
       l8 = (v1.elementAt(19).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(19).toString()); //mm
       l9 = (v1.elementAt(20).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(20).toString()); //yy

       l10 = (v1.elementAt(23).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(23).toString()); //dd
       l11 = (v1.elementAt(24).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(24).toString()); //mm
       l12 = (v1.elementAt(25).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(25).toString()); //yy

       conn = connectorDb.getConnection();
       cs = conn.prepareCall("{? = call getNik(?)}");
       cs.registerOutParameter(1, java.sql.Types.VARCHAR);
       cs.setString(2, nik_total);
       cs.execute();
       returnval = cs.getString(1);
       cs.close();
       conn.close();
       cs = null;
       conn = null;
     }
     catch (Exception ee) {
       //System.out.println("Exception in Select WNI : " + ee);
       ee.printStackTrace();
     }
     finally {
       try {
         if (cs != null) {
           cs.close();
         }
       }
       catch (Exception e3) {}

       try {
         if (conn != null) {
           conn.close();
         }
       }
       catch (Exception e4) {}
     }

     try {
       wniFactory = ServiceEntity.getInstance();
       home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);

       if (home != null) {
         remote = home.create(getTrimBigDecimalData(returnval),
                              getTrimData(v1.elementAt(0)),
                              getTrimData(v1.elementAt(47)),
                              getTrimData(v1.elementAt(1)),
                              tgl1, getTrimData(v1.elementAt(5)),
                              getTrimBigDecimalData(s1),
                              getTrimData(v1.elementAt(7)),
                              tgl2,
                              getTrimBigDecimalData(s2),
                              getTrimData(v1.elementAt(12)),
                              getTrimBigDecimalData(s3),
                              (getTrimData(v1.elementAt(14)).toString().equals(
             "Lainnya")) ? getTrimData(v1.elementAt(48)) :
                              getTrimData(v1.elementAt(14)),
                              getTrimBigDecimalData(s4),
                              getTrimBigDecimalData(s5),
                              getTrimData(v1.elementAt(17)),
                              tgl3,
                              getTrimBigDecimalData(s6),
                              getTrimData(v1.elementAt(22)),
                              tgl4,
                              getTrimBigDecimalData(s7),
                              getTrimBigDecimalData(s8),
                              getTrimBigDecimalData(s9),
                              getTrimBigDecimalData(s10),
                              getTrimBigDecimalData(s11),
                              getTrimBigDecimalData(s12),
                              getTrimData(v1.elementAt(32)),
                              getTrimBigDecimalData(s13),
                              getTrimData(v1.elementAt(34)),
                              getTrimData(v1.elementAt(35)),
                              getTrimData(v1.elementAt(36)),
                              getTrimData(v1.elementAt(37)),
                              getTrimBigDecimalData(s14),
                              getTrimData(v1.elementAt(50)),
                              getTrimBigDecimalData(getTrimData(v1.elementAt(51))),
                              sysDate,
                              getTrimBigDecimalData(newkk), new BigDecimal("0"),
                              getTrimBigDecimalData(str_prop),
                              getTrimBigDecimalData(str_kab),
                              getTrimBigDecimalData(str_kec),
                              getTrimBigDecimalData(str_kel),
                              new BigDecimal("0"), null,
                              null,
                              null,
                              null,
                              new BigDecimal("0"), new BigDecimal("0"), "N",
                              "N");

         b = true;
       }
       else {
         b = false;
       }
     }
     catch (Exception err) {
       //System.out.println("Error from Facade WNI" + err.toString());

     }
     return returnval;
   }
*/

public String insert(Vector v, String newkk) {
     Vector v1 = new Vector();
     int i = 0, prop = 0, kab = 0, kec = 0, j = 0, k1 = 0, dd;
     String nik_no, kkno;
     ServiceEntity wniFactory;
     BiodataWni remote = null;
     BiodataWniHome home = null;
     ConnectorDB connectorDb = new ConnectorDB();
     Connection conn = null;
     CallableStatement cs = null;
     String returnval = null;
     DataKeluarga remote1 = null;
     DataKeluargaHome home1 = null;

     boolean b = false;

     int l1 = 0, l2 = 0, l3 = 0, l4 = 0, l5 = 0, l6 = 0, l7 = 0, l8 = 0, l9 = 0,
         l10 = 0, l11 = 0, l12 = 0, l13 = 0, l14 = 0, l15 = 0;

     String sysDate = null;

     v1 = v;

     sysDate = getTrimData(v1.elementAt(49));
     //System.out.println("System Date=" + sysDate);

     String select, ss = null, str_prop = null, str_kab = null, str_kec = null,
         str_kel = null, str_dd, str_mm, str_yy, str_yy1, nik_total = null;
     String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
         s16, s17;
     String tgl1 = "", tgl2 = "", tgl3 = "", tgl4 = "";
   try {
     // Tanggal Berakhir Paspor
     tgl1 = getSiakDate(getTrimData(v1.elementAt(2)),
                        getTrimData(v1.elementAt(3)),
                        getTrimData(v1.elementAt(4)));
     //Tanggal Lahir
     tgl2 = getSiakDate(getTrimData(v1.elementAt(8)),
                        getTrimData(v1.elementAt(9)),
                        getTrimData(v1.elementAt(10)));
     //Tanggal Perkawinan
     tgl3 = getSiakDate(getTrimData(v1.elementAt(18)),
                        getTrimData(v1.elementAt(19)),
                        getTrimData(v1.elementAt(20)));
     //Tanggal Perceraian
     tgl4 = getSiakDate(getTrimData(v1.elementAt(23)),
                        getTrimData(v1.elementAt(24)),
                        getTrimData(v1.elementAt(25)));

     s1 = getTrimData(v1.elementAt(6));
     s2 = getTrimData(v1.elementAt(11));
     s3 = getTrimData(v1.elementAt(13));
     s4 = getTrimData(v1.elementAt(15));
     s5 = getTrimData(v1.elementAt(16));
     s6 = getTrimData(v1.elementAt(21));
     s7 = getTrimData(v1.elementAt(26));
     s8 = getTrimData(v1.elementAt(27));
     s9 = getTrimData(v1.elementAt(28));
     s10 = getTrimData(v1.elementAt(29));
     s11 = getTrimData(v1.elementAt(30));
     s12 = getTrimData(v1.elementAt(31));
     s13 = getTrimData(v1.elementAt(33));
     s14 = getTrimData(v1.elementAt(38));
     s17 = getTrimData(v1.elementAt(42));


       /* str_prop = (String) v1.elementAt(43);
        str_kab = (String) v1.elementAt(44);
        str_kec = (String) v1.elementAt(45);
        str_kel = (String) v1.elementAt(46);

        str_dd = v1.elementAt(8).toString();

        if (s1.equals("2")) {
          dd = Integer.parseInt(str_dd);
          dd = dd + 40;
          str_dd = toString().valueOf(dd);
        }

        str_mm = v1.elementAt(9).toString();
        str_yy1 = v1.elementAt(10).toString();
        str_yy = str_yy1.substring(2, 4);
        */
//      nik_total = str_prop + str_kab + str_kec + str_dd + str_mm + str_yy;
       nik_total = getConcatNik(v1);

       str_prop = (String) v.elementAt(43); //Getting Noporp,nokan,nokec,nokel
       str_kab = (String) v.elementAt(44);
       str_kec = (String) v.elementAt(45);
       str_kel = (String) v.elementAt(46);

       l1 = (v1.elementAt(2).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(2).toString()); // dd
       l2 = (v1.elementAt(3).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(3).toString()); // month
       l3 = (v1.elementAt(4).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(4).toString()); // year

       l4 = Integer.parseInt(v1.elementAt(8).toString()); //dd
       l5 = Integer.parseInt(v1.elementAt(9).toString()); //mm
       l6 = Integer.parseInt(v1.elementAt(10).toString()); //year

       l7 = (v1.elementAt(18).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(18).toString()); //dd
       l8 = (v1.elementAt(19).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(19).toString()); //mm
       l9 = (v1.elementAt(20).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(20).toString()); //yy

       l10 = (v1.elementAt(23).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(23).toString()); //dd
       l11 = (v1.elementAt(24).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(24).toString()); //mm
       l12 = (v1.elementAt(25).toString().equals("")) ? 0 :
           Integer.parseInt(v1.elementAt(25).toString()); //yy

       conn = connectorDb.getConnection();
       cs = conn.prepareCall("{? = call getNik(?)}");
       cs.registerOutParameter(1, java.sql.Types.VARCHAR);
       cs.setString(2, nik_total);
       cs.execute();
       returnval = cs.getString(1);
  //     cs.close();
//       conn.close();
//       cs = null;
//       conn = null;

       wniFactory = ServiceEntity.getInstance();
       home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);

       if (home != null) {
         remote = home.create(getTrimBigDecimalData(returnval),
                              getTrimData(v1.elementAt(0)),
                              getTrimData(v1.elementAt(47)),
                              getTrimData(v1.elementAt(1)),
                              tgl1, getTrimData(v1.elementAt(5)),
                              getTrimBigDecimalData(s1),
                              getTrimData(v1.elementAt(7)),
                              tgl2,
                              getTrimBigDecimalData(s2),
                              getTrimData(v1.elementAt(12)),
                              getTrimBigDecimalData(s3),
                              (getTrimData(v1.elementAt(14)).toString().equals(
             "Lainnya")) ? getTrimData(v1.elementAt(48)) :
                              getTrimData(v1.elementAt(14)),
                              getTrimBigDecimalData(s4),
                              getTrimBigDecimalData(s5),
                              getTrimData(v1.elementAt(17)),
                              tgl3,
                              getTrimBigDecimalData(s6),
                              getTrimData(v1.elementAt(22)),
                              tgl4,
                              getTrimBigDecimalData(s7),
                              getTrimBigDecimalData(s8),
                              getTrimBigDecimalData(s9),
                              getTrimBigDecimalData(s10),
                              getTrimBigDecimalData(s11),
                              getTrimBigDecimalData(s12),
                              getTrimData(v1.elementAt(32)),
                              getTrimBigDecimalData(s13),
                              getTrimData(v1.elementAt(34)),
                              getTrimData(v1.elementAt(35)),
                              getTrimData(v1.elementAt(36)),
                              getTrimData(v1.elementAt(37)),
                              getTrimBigDecimalData(s14),
                              getTrimData(v1.elementAt(50)),
                              getTrimBigDecimalData(getTrimData(v1.elementAt(51))),
                              sysDate,
                              getTrimBigDecimalData(newkk), new BigDecimal("0"),
                              getTrimBigDecimalData(str_prop),
                              getTrimBigDecimalData(str_kab),
                              getTrimBigDecimalData(str_kec),
                              getTrimBigDecimalData(str_kel),
                              new BigDecimal("0"), null,
                              null,
                              null,
                              null,
                              new BigDecimal("0"), new BigDecimal("0"), "N",
                              "N");

         b = true;
       }
       else {
         b = false;
       }
     }
     catch (Exception err) {
       //System.out.println("Error from Facade WNI" + err.toString());
     }
finally {
 try {
        cs.close();
 }
 catch (Exception e3) {}

 try {
        conn.close();
 }
 catch (Exception e4) {}
}
   return returnval;
}


public java.util.Vector listKk(java.lang.String nokk, java.lang.String nik) {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;

    Vector v = new Vector();
    String select, s7, s8, s9, s10, s11, s12, s13, s14;

    /*    select = "select to_char(NIK,'0000000000000000'),"
            + "upper(NAMA_LGKP,JENIS_KLMIN,TMPT_LHR,to_char(TGL_LHR,'dd-mm-yyyy'),STAT_HBKEL,NIK_IBU,NAMA_LGKP_IBU "
            + "from biodata_wni where no_kk="+nokk+" and nik="+nik;
     */
    select = "select trim(nik),NAMA_LGKP,JENIS_KLMIN,TMPT_LHR,TGL_LHR,STAT_HBKEL,NIK_IBU,NAMA_LGKP_IBU from VW_INDIVIDU_WNI where "
        + " trim(nik)=" + nik.trim() + " and trim(no_kk)=" + nokk.trim();
    try {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();
      rs = stmt.executeQuery(select);

      while (rs.next()) {
        s7 = rs.getString(1);
        v.addElement( (Object) s7);
        s8 = rs.getString(2);
        v.addElement( (Object) s8);
        s10 = rs.getString(3);
        v.addElement( (Object) s10);
        s11 = rs.getString(4);
        v.addElement( (Object) s11);
        s12 = rs.getString(5);
        v.addElement( (Object) s12);
        s9 = rs.getString(6);
        v.addElement( (Object) s9);
        s13 = rs.getString(7);
        //System.out.println("S13 = " + s13);

        if (s13 != null) {
          v.addElement( (Object) s13);
        }
        else {
          s13 = "-";
          v.addElement( (Object) s13);
        }
        s14 = rs.getString(8);
        v.addElement( (Object) s14);
      }
      stmt.close();
      rs.close();
      conn.close();
      stmt = null;
      rs = null;
      conn = null;
    }
    catch (Exception ee) {
      //System.out.println("Exception = " + ee);
    }

    finally {
      try {
        if (rs != null) {
          rs.close();
        }
      }
      catch (Exception e1) {}

      try {
        if (stmt != null) {
          stmt.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }

    return v;
}

/*  public Vector list(String a)
    {
      ServiceEntity wniFactory;
      BiodataWni remote = null;
      BiodataWniHome home = null;
      BigDecimal val = new BigDecimal(a);

      Vector v = new Vector();
      String s7,s8,s9,s10,s11,s12,s13,s14;

      try
      {

        wniFactory = ServiceEntity.getInstance();
   home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);

        if (home != null) {
          //System.out.println("Look Up Made in WNI List");
        remote = home.findByNoKk(val);
        }

        if(remote != null)
        {
         s7 = remote.getNik().toString();
         v.addElement( (Object) s7);
         s8 = remote.getNamaLgkp();
         v.addElement( (Object) s8);
         s10 = remote.getJenisKlmin().toString();
         v.addElement( (Object) s10);
         s11 = remote.getTmptLhr();
         v.addElement( (Object) s11);
         s12 = remote.getTglLhr().toString();
         v.addElement( (Object) s12);
         s13 = remote.getStatHbkel().toString();

         if(s13 != null)
          {
            v.addElement( (Object) s13);
          }
          else
          {
            s13="-";
            v.addElement( (Object) s13);
          }
          s14 = remote.getNamaLgkpIbu();
           v.addElement( (Object) s14);
        }
     }
      catch (Exception ee)
      {
        //System.out.println("Exception = " + ee);
      }

      for(int k = 0; k < v.size(); k++)
      {
        //System.out.println("Vector["+k+"]"+ v.elementAt(k));
      }

      return v;
    }*/

public BioDataObj getData(String nik) {
    BioDataObj record = null;
    ServiceEntity data;
    BiodataWni remoteWni = null;
    BiodataWniHome remoteHome;
    DataKeluarga remoteData = null;
    DataKeluargaHome homeData = null;

    try {
      data = ServiceEntity.getInstance();
      remoteHome = (BiodataWniHome) data.lookup("BiodataWni", BiodataWniHome.class);

      homeData = (DataKeluargaHome) data.lookup("DataKeluarga",
                                                DataKeluargaHome.class);

      if (remoteHome != null) {
        if (remoteHome.findByPrimaryKey(getTrimBigDecimalData(nik)) != null) {
          remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(nik));
        }
        else {
          remoteWni = null;
        }

      }

      if (homeData != null) {
        //System.out.println("Look Up Made in DataKeluarga in WNI");
      }

      if (remoteWni == null) {
        record = null;
      }
      else {
        remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(remoteWni.
            getNoKk()));
        record = new BioDataObj(remoteData.getNamaKep(), remoteData.getAlamat(),
                                remoteData.getNoRt(), remoteData.getNoRw(),
                                remoteData.getDusun(), remoteData.getKodePos(),
                                remoteData.getTelp(),
                                remoteWni.getNik(), remoteWni.getNoKtp(),
                                remoteWni.getTmptSbl(),
                                remoteWni.getNoPaspor(),
                                remoteWni.getTglAkhPaspor(),
                                remoteWni.getNamaLgkp(),
                                remoteWni.getJenisKlmin(), remoteWni.getTmptLhr(),
                                remoteWni.getTglLhr(), remoteWni.getAktaLhr(),
                                remoteWni.getNoAktaLhr(),
                                remoteWni.getGolDrh(), remoteWni.getAgama(),
                                remoteWni.getStatKwn(),
                                remoteWni.getAktaKwn(), remoteWni.getNoAktaKwn(),
                                remoteWni.getTglKwn(),
                                remoteWni.getAktaCrai(),
                                remoteWni.getNoAktaCrai(), remoteWni.getTglCrai(),
                                remoteWni.getStatHbkel(), remoteWni.getKlainFsk(),
                                remoteWni.getPnydngCct(),
                                remoteWni.getPddkAkh(), remoteWni.getJenisPkrjn(),
                                remoteWni.getNikIbu(),
                                remoteWni.getNamaLgkpIbu(),
                                remoteWni.getNikAyah(),
                                remoteWni.getNamaLgkpAyah(),
                                remoteWni.getNamaKetRt(),
                                remoteWni.getNamaKetRw(),
                                remoteWni.getNamaPetReg(),
                                remoteWni.getNipPetReg(),
                                remoteWni.getNamaPetEntri(),
                                remoteWni.getNipPetEntri(),
                                remoteWni.getTglEntri(), remoteWni.getNoKk(),
                                remoteWni.getJenisBntu(),
                                remoteWni.getNoProp(), remoteWni.getNoKab(),
                                remoteWni.getNoKec(), remoteWni.getNoKel(),
                                remoteWni.getStatHidup(), remoteWni.getTglUbah(),
                                remoteWni.getTglCetakKtp(),
                                remoteWni.getTglGantiKtp(),
                                remoteWni.getTglPjgKtp(), remoteWni.getStatKtp(),
                                remoteWni.getAlsNumpang(), remoteWni.getCflag());
      }
    }
    catch (Exception err) {
      record = null;
      //System.out.println("Error from Facade WNI Data" + err.toString());
    }

    return record;
  }

public boolean updateWni(Vector v) {
    boolean b = false;
    ServiceEntity updateWni = null;
    BiodataWni updateRemote = null;
    BiodataWniHome updateHome = null;
    String tgl1 = "", tgl2 = "", tgl3 = "",tgl4="";
    DataKeluarga remote = null;
    DataKeluargaHome home = null;
    String sysDate = null;
    Connection conn = null;
    CallableStatement cs = null;

    sysDate = getTrimData(v.elementAt(39));
    //Tanggal Berakhir Paspor

    tgl1 = getSiakDate(getTrimData(v.elementAt(5)), getTrimData(v.elementAt(6)),
                       getTrimData(v.elementAt(7)));
    //Tanggal Kawin
    tgl2=getSiakDate(getTrimData(v.elementAt(16)), getTrimData(v.elementAt(17)),
                       getTrimData(v.elementAt(18)));
      //Tanggal Cerai
    tgl3=getSiakDate(getTrimData(v.elementAt(21)), getTrimData(v.elementAt(22)),
                       getTrimData(v.elementAt(23)));
      //Tanggal Lahir
    tgl4=getSiakDate(getTrimData(v.elementAt(40)), getTrimData(v.elementAt(41)),
                       getTrimData(v.elementAt(42)));
try {
      updateWni = ServiceEntity.getInstance();
      updateHome = (BiodataWniHome) updateWni.lookup("BiodataWni",
          BiodataWniHome.class);
      if (updateHome != null) {
        updateRemote = updateHome.findByPrimaryKey(getTrimBigDecimalData(v.
            elementAt(0)));
      }
if (updateRemote != null) {

if (v.elementAt(44).toString().equals("2"))
     {
String  returnval1="";
       try{
         ConnectorDB connectorDb = new ConnectorDB();
         conn = connectorDb.getConnection();
         cs = conn.prepareCall("{? = call getNik(?)}");
         cs.registerOutParameter(1, java.sql.Types.VARCHAR);
         cs.setString(2,
                      getConcatNik(getTrimData(v.elementAt(40)),
                                   getTrimData(v.elementAt(41)),
                                   getTrimData(v.elementAt(42)),
                                   getTrimData(v.elementAt(43)),
                                   updateRemote.getNik().toString().
                                   substring(0, 5)));
         cs.execute();
         returnval1 = cs.getString(1); //Returned NIK
       }catch(Exception nikerr)
       {
         nikerr.printStackTrace();
       }
       updateRemote.setNik(new BigDecimal(returnval1));
       updateRemote.setTglLhr(tgl4);
}

if (! (parseData(getTrimData(v.elementAt(1))).equals("N"))) {
      updateRemote.setNamaLgkp(getTrimData(v.elementAt(1)));
    }
       if (! (parseData(getTrimData(v.elementAt(2))).equals("N"))) {
          updateRemote.setNoKtp(getTrimData(v.elementAt(2)));
        }
        if (! (parseData(getTrimData(v.elementAt(3))).equals("N"))) {
          updateRemote.setTmptSbl(getTrimData(v.elementAt(3)));
        }
        if (! (parseData(getTrimData(v.elementAt(4))).equals("N"))) {
          updateRemote.setNoPaspor(getTrimData(v.elementAt(4)));
        }
        if (tgl1 != null) {
          updateRemote.setTglAkhPaspor(tgl1);
        }
        if (! (parseData(getTrimData(v.elementAt(8))).equals("N"))) {
           updateRemote.setTmptLhr(getTrimData(v.elementAt(8)));
         }

       if (! (parseData(getTrimData(v.elementAt(9))).equals("N"))) {
          updateRemote.setAktaLhr(getTrimBigDecimalData(v.elementAt(9)));
        }

        if (! (parseData(getTrimData(v.elementAt(10))).equals("N"))) {
          updateRemote.setNoAktaLhr(getTrimData(v.elementAt(10)));
        }

        if (! (parseData(getTrimData(v.elementAt(11))).equals("N"))) {
          updateRemote.setGolDrh(getTrimBigDecimalData(v.elementAt(11)));
        }

        if (! (parseData(getTrimData(v.elementAt(12))).equals("N"))) {
          updateRemote.setAgama(getTrimData(v.elementAt(12)));
        }
        if (! (parseData(getTrimData(v.elementAt(13))).equals("N"))) {
          updateRemote.setStatKwn(getTrimBigDecimalData(v.elementAt(13)));
        }

        if (! (parseData(getTrimData(v.elementAt(14))).equals("N"))) {
          updateRemote.setAktaKwn(getTrimBigDecimalData(v.elementAt(14)));
        }

        if (! (parseData(getTrimData(v.elementAt(15))).equals("N"))) {
          updateRemote.setNoAktaKwn(getTrimData(v.elementAt(15)));
        }
        if (tgl2 != null) {
          updateRemote.setTglKwn(tgl2);
        }

        if (! (parseData(getTrimData(v.elementAt(19))).equals("N"))) {
          updateRemote.setAktaCrai(getTrimBigDecimalData(v.elementAt(19)));
        }

        if (! (parseData(getTrimData(v.elementAt(20))).equals("N"))) {
          updateRemote.setNoAktaCrai(getTrimData(v.elementAt(20)));
        }

        if (tgl3 != null) {
          updateRemote.setTglCrai(tgl3);
        }

        if (! (parseData(getTrimData(v.elementAt(24))).equals("N"))) {
          updateRemote.setStatHbkel(getTrimBigDecimalData(v.elementAt(24)));
        }

        if (! (parseData(getTrimData(v.elementAt(25))).equals("N"))) {
          updateRemote.setKlainFsk(getTrimBigDecimalData(v.elementAt(25)));
        }

        if (! (parseData(getTrimData(v.elementAt(26))).equals("N"))) {
          updateRemote.setPnydngCct(getTrimBigDecimalData(v.elementAt(26)));
        }

        if (! (parseData(getTrimData(v.elementAt(27))).equals("N"))) {
          updateRemote.setPddkAkh(getTrimBigDecimalData(v.elementAt(27)));
        }

        if (! (parseData(getTrimData(v.elementAt(28))).equals("N"))) {
          updateRemote.setJenisPkrjn(getTrimBigDecimalData(v.elementAt(28)));
        }

        if (! (parseData(getTrimData(v.elementAt(29))).equals("N"))) {
          updateRemote.setNikIbu(getTrimBigDecimalData(v.elementAt(29)));
        }
        if (! (parseData(getTrimData(v.elementAt(30))).equals("N"))) {
                updateRemote.setNamaLgkpIbu(getTrimData(v.elementAt(30)));
            }
            if (! (parseData(getTrimData(v.elementAt(31))).equals("N"))) {
              updateRemote.setNikAyah(getTrimBigDecimalData(v.elementAt(31)));
            }
            if (! (parseData(getTrimData(v.elementAt(32))).equals("N"))) {
                    updateRemote.setNamaLgkpAyah(getTrimData(v.elementAt(32)));
                }

                if (! (parseData(getTrimData(v.elementAt(33))).equals("N"))) {
                        updateRemote.setNamaKetRt(getTrimData(v.elementAt(33)));
                    }
                    if (! (parseData(getTrimData(v.elementAt(34))).equals("N"))) {
                            updateRemote.setNamaKetRw(getTrimData(v.elementAt(34)));
                        }
                        if (! (parseData(getTrimData(v.elementAt(35))).equals("N"))) {
                                updateRemote.setNamaPetReg(getTrimData(v.elementAt(35)));
                            }
                            if (! (parseData(getTrimData(v.elementAt(36))).equals("N"))) {
                                    updateRemote.setNipPetReg(getTrimBigDecimalData(v.elementAt(36)));
                                }

                                if (! (parseData(getTrimData(v.elementAt(37))).equals("N"))) {
                                       updateRemote.setNamaPetEntri(getTrimData(v.elementAt(37)));
                                     }
                                     //System.out.println("Step17");
                                     if (! (parseData(getTrimData(v.elementAt(38))).equals("N"))) {
                                       updateRemote.setNipPetEntri(getTrimBigDecimalData(v.elementAt(38)));
                                     }
        updateRemote.setTglUbah(sysDate);
        updateRemote.setCflag("Y");
       home = (DataKeluargaHome) updateWni.lookup("DataKeluarga",
            DataKeluargaHome.class);
        remote = home.findByPrimaryKey(updateRemote.getNoKk());
        if (remote != null) {

          if (getTrimData(updateRemote.getStatHbkel()).equals("1")) {
            remote.setNamaKep(getTrimData(v.elementAt(1)));
          }
          remote.setCflag("Y");
          remote.setPflag("N");
        }
        remote = null;
        b = true;
      }
    }
    catch (Exception err) {
      err.printStackTrace();
      //System.out.println("Error from Facade Wni Update" + err.toString());

    }
    finally {
        try {
            cs.close();
        }
        catch (Exception err) {
        }
        try {
               conn.close();
        }
        catch (Exception err) {}
      }
    return b;
}

  private String parseData(String strvalue) {
    if ( (strvalue != null) && (! (strvalue.trim().equals(""))) &&
        (! (strvalue.trim().equals("0")))) {
      //System.out.println("Inside return value");
      return strvalue;
    }
    //System.out.println("outside return value N");
    return "N";
  }

  public WniWnaObj getMatiKec(String nik1, String nik2, String nik3, String nik4, int levelID) {
    try {
      ServiceEntity factory = ServiceEntity.getInstance();
      CatatMatiHome catatMatiHome = (CatatMatiHome) factory.lookup(
          "CatatMati", CatatMatiHome.class);
      if (levelID>=4 && catatMatiHome.findByPrimaryKey(getTrimBigDecimalData(nik1)) != null) {
        return null;
      }
    }
    catch (NamingException ex) {
      ex.printStackTrace();
    }
    catch (Exception ex) {
    }
    return getDataAnakOrangtuaDanPelapor(nik1, nik2, nik3, nik4);
  }

  //****************  Data Reterival for WNA, WNI and DataKeluarga *********

   public WniWnaObj getDataKlr(String nik1, String nik2, String nik3, String nik4, int levelID) {
     if (levelID>=4 && isDataKelahiranExist(nik1))
       return null;
     WniWnaObj wniWnaRecord = getDataAnakOrangtuaDanPelapor(nik1, nik2, nik3, nik4);
     return wniWnaRecord;
   }

  public String getNamaProp(String no_prop) {
    Connection conn = null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;
    String returnval = "";

    try {
      conn = connectorDb.getConnection();


      String query = "begin ? := getnamaprop(?); end;";

      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.VARCHAR);
// set the in param
      stmt.setString(2, no_prop.trim());

// execute and retrieve the result set
      stmt.execute();
      returnval = stmt.getString(1);
      //System.out.println(

      stmt.close();
      conn.close();
    }
    catch (Exception e) {
      //System.out.println("ERROR IN getNamaProp");
      e.printStackTrace();
    }
    finally {
      try {
        if (stmt != null) {
          stmt.close();
        }
      }
      catch (Exception err) {
      }

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception err) {}

    }
    return returnval;
  }

  public String getNamaKab(String no_prop, String no_kab) {
    Connection conn = null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;
    String returnval = "";
    try {
      conn = connectorDb.getConnection();


      String query = "begin ? := getnamakab(?,?); end;";

      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.VARCHAR);
// set the in param
      stmt.setString(2, no_kab.trim());
      stmt.setString(3, no_prop.trim());

// execute and retrieve the result set
      stmt.execute();
      returnval = stmt.getString(1);
      //System.out.println(
      stmt.close();
      conn.close();
    }
    catch (Exception e) {
      //System.out.println("ERROR IN getNamaKab");
      e.printStackTrace();
    }
    return returnval;
  }

  public String getNamaKec(String no_prop, String no_kab, String no_kec) {
    Connection conn = null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;
    String returnval = "";
    try {
      conn = connectorDb.getConnection();


      String query = "begin ? := getnamakec(?,?,?); end;";

      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.VARCHAR);
// set the in param
      stmt.setString(2, no_kec.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, no_prop.trim());
// execute and retrieve the result set
      stmt.execute();
      returnval = stmt.getString(1);
      //System.out.println(

      stmt.close();
      conn.close();
    }
    catch (Exception e) {
      //System.out.println("ERROR IN getNamaKec");
      e.printStackTrace();
    }
    return returnval;
  }

  public String getNamaKel(String no_prop, String no_kab, String no_kec, String no_kel) {
    Connection conn = null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;
    String returnval = "";
    try {
      conn = connectorDb.getConnection();


      String query = "begin ? := getnamakel(?,?,?,?); end;";

      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.VARCHAR);
// set the in param
      stmt.setString(2, no_kel.trim());
      //System.out.println("GET NAMA KEL no_kel: " + no_kel);
      stmt.setString(3, no_kec.trim());
      //System.out.println("GET NAMA KEL no_kec: " + no_kec);
      stmt.setString(4, no_kab.trim());
      //System.out.println("GET NAMA KEL no_kab: " + no_kab);
      stmt.setString(5, no_prop.trim());
      //System.out.println("GET NAMA KEL no_prop: " + no_prop);
// execute and retrieve the result set
      stmt.execute();
      returnval = stmt.getString(1);
      //System.out.println("GET NAMA KEL returnval: " + returnval);

      //System.out.println(
      stmt.close();
      conn.close();
    }
    catch (Exception e) {
      //System.out.println("ERROR IN getNamaKel");
      e.printStackTrace();
    }
    return returnval;
  }

  // ********** Function to insert data into catat_lahir table ********

  public java.util.Vector insertLahir(Vector v1) {
    int i = 0, j = 0, k1 = 0, dd, mm, yy;
    ServiceEntity wniFactory;

    BiodataWni remote = null;
    BiodataWniHome home = null;

    BiodataWna remoteWna = null;
    BiodataWnaHome homeWna = null;

    CatatLahir remoteCatat = null;
    CatatLahirHome homeCatat = null;

    int l1 = 0, l2 = 0, l3 = 0, l4 = 0, l5 = 0, l6 = 0, l7 = 0, l8 = 0, l9 = 0,
        l10 = 0, l11 = 0, l12 = 0, l13 = 0, l14 = 0, l15 = 0;

    java.lang.String sysDate = null;
    sysDate = sysDate();

    String nik = "", nik_ibu = "", nik_ayh = "", nik_plpr = "";
    String w1 = "", w2 = "", w3 = "0", w4 = "", wtotal = "";
    String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
        s16, s17;
    String tgl1 = "", tgl2 = "", tgl3 = "", tgl4 = "", tgl5 = "";

    try {
      wniFactory = ServiceEntity.getInstance();
      if (wniFactory != null) {
        homeCatat = (CatatLahirHome) wniFactory.lookup("CatatLahir",
            CatatLahirHome.class);
      }
    }
    catch (NamingException ex) {
      ex.printStackTrace();
      wniFactory = null;
      homeCatat = null;
      return null;
    }

    //bayi Checking

    if (getTrimData(v1.elementAt(0)).startsWith("A")) {
      nik = getTrimData(v1.elementAt(0)).substring(1, 17);
      w1 = "2";
    }
    else {
      nik = getTrimData(v1.elementAt(0));
      w1 = "1";
    }

    try {
      if (homeCatat.findByPrimaryKey(nik) != null) {
        return null;
      }
    }
    catch (Exception ex1) {}

    s1 = getTrimData(v1.elementAt(2));
    s2 = getTrimData(v1.elementAt(3));

    s3 = s1 + ":" + s2; //pukul

    s4 = getTrimData(v1.elementAt(8));
    s5 = getTrimData(v1.elementAt(19));
    s6 = getTrimData(v1.elementAt(20));
    s7 = getTrimData(v1.elementAt(21));
    s8 = getTrimData(v1.elementAt(22));
    s9 = getTrimData(v1.elementAt(28));
    s10 = getTrimData(v1.elementAt(42));
    s11 = getTrimData(v1.elementAt(43));
    s12 = getTrimData(v1.elementAt(44));
    s13 = getTrimData(v1.elementAt(45));
    s14 = getTrimData(v1.elementAt(51));

    try {

      //System.out.println("test1");
      try{
        l1 = Integer.parseInt(v1.elementAt(12).toString()); //dd
      l2 = Integer.parseInt(v1.elementAt(13).toString()); //mm
      l3 = Integer.parseInt(v1.elementAt(14).toString()); //year
      }catch(Exception err)
      {

      }
      //System.out.println("test2");
try{
      l4 = (getTrimData(v1.elementAt(29)).equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(29).toString()); //dd
      l5 = (getTrimData(v1.elementAt(30)).equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(30).toString()); //mm
      l6 = (getTrimData(v1.elementAt(31)).equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(31).toString()); //yy
    }catch(Exception err)
        {

        }
try{
      //System.out.println("test3");
      l7 = Integer.parseInt(v1.elementAt(35).toString()); //dd
      l8 = Integer.parseInt(v1.elementAt(36).toString()); //mm
      l9 = Integer.parseInt(v1.elementAt(37).toString()); //yy
    }catch(Exception err)
          {

          }
try{
      //System.out.println("test4");
      l10 = (getTrimData(v1.elementAt(52)).equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(52).toString()); //dd
      l11 = (getTrimData(v1.elementAt(53)).equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(53).toString()); //mm
      l12 = (getTrimData(v1.elementAt(54)).equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(54).toString()); //yy*/
    }catch(Exception err)
          {

          }
try{
      //System.out.println("test5");
      l13 = Integer.parseInt(v1.elementAt(58).toString()); // dd
      l14 = Integer.parseInt(v1.elementAt(59).toString()); // month
      l15 = Integer.parseInt(v1.elementAt(60).toString()); // year
    }catch(Exception err)
          {

          }
try{
      //System.out.println("tgl1 :" + v1.elementAt(12) + " bln :" +                         v1.elementAt(13) + " thn :" + v1.elementAt(14));
      tgl1 = getSiakDate(getTrimData(v1.elementAt(12)),
                         getTrimData(v1.elementAt(13)),
                         getTrimData(v1.elementAt(14)));
      //System.out.println("tgl1=" + tgl1);
      //Tanggal Lahir
    }catch(Exception err)
          {

          }
try{
      //System.out.println("tgl2 :" + v1.elementAt(29) + " bln :" +                         v1.elementAt(30) + " thn :" + v1.elementAt(31));
      tgl2 = getSiakDate(getTrimData(v1.elementAt(29)),
                         getTrimData(v1.elementAt(30)),
                         getTrimData(v1.elementAt(31)));
      //System.out.println("tgl2=" + tgl2);
      //Tanggal Perkawinan
    }catch(Exception err)
          {

          }
try{
      //System.out.println("tgl3 :" + v1.elementAt(35) + " bln :" +                         v1.elementAt(36) + " thn :" + v1.elementAt(37));
      tgl3 = getSiakDate(getTrimData(v1.elementAt(35)),
                         getTrimData(v1.elementAt(36)),
                         getTrimData(v1.elementAt(37)));
      //System.out.println("tgl3=" + tgl3);
      //Tanggal Perceraian
    }catch(Exception err)
          {

          }
try{
      //System.out.println("tgl4 :" + v1.elementAt(52) + " bln :" +                         v1.elementAt(53) + " thn :" + v1.elementAt(54));
      tgl4 = getSiakDate(getTrimData(v1.elementAt(52)),
                         getTrimData(v1.elementAt(53)),
                         getTrimData(v1.elementAt(54)));
      //System.out.println("tgl4=" + tgl4);
      //Tanggal 4
    }catch(Exception err)
          {

          }
try{
      //System.out.println("tgl5 :" + v1.elementAt(58) + " bln :" +                         v1.elementAt(59) + " thn :" + v1.elementAt(60));
      tgl5 = getSiakDate(getTrimData(v1.elementAt(58)),
                         getTrimData(v1.elementAt(59)),
                         getTrimData(v1.elementAt(60)));
      //System.out.println("tgl5=" + tgl5);
    }catch(Exception err)
          {

          }

    }
    catch (Exception ee) {
      System.out.println("Error in Date parsing");
      //System.out.println("Exception in Select WNI : " + ee);
    }

    try {

      //  home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);
      //  homeWna=(BiodataWnaHome) wniFactory.lookup("BiodataWna", BiodataWnaHome.class);

      /// nik ibu
      //System.out.println("NIK IBU=" + getTrimData(v1.elementAt(10)));

      if (getTrimData(v1.elementAt(10)).equals("") ||
          getTrimData(v1.elementAt(10)).equals("0")) {
        //System.out.println("Ibu entered empty");
        nik_ibu = "";
        w2 = getTrimData(v1.elementAt(9));
      }
      else if (getTrimData(v1.elementAt(10)).startsWith("A") &&
               getTrimData(v1.elementAt(10)).trim().length() == 17) {
        //System.out.println("Ibu entered WNA");
        nik_ibu = v1.elementAt(10).toString().substring(1).trim();
        homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna",
            BiodataWnaHome.class);
        remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik_ibu));
        remoteWna.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(16)));
        w2 = "2";
      }
      else if (!getTrimData(v1.elementAt(10)).startsWith("A") &&
               getTrimData(v1.elementAt(10)).length() == 16) {
        //System.out.println("Ibu entered WNI");
        nik_ibu = getTrimData(v1.elementAt(10)).trim();
        home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);
        remote = home.findByPrimaryKey(getTrimBigDecimalData(nik_ibu));
        remote.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(15)));
        w2 = "1";
      }
      // nik ayah
      if (getTrimData(v1.elementAt(33)).trim().equals("0") ||
          getTrimData(v1.elementAt(33)).trim().equals("")) {
        //System.out.println("Ayah entered empty");
        nik_ayh = "";
        w3 = (getTrimData(v1.elementAt(32)).equals(""))?"0":getTrimData(v1.elementAt(32));
      }
      else if (v1.elementAt(33) != null &&
               getTrimData(v1.elementAt(33)).startsWith("A") &&
               getTrimData(v1.elementAt(33)).trim().length() == 17) {
        //System.out.println("Ayah entered WNA");
        nik_ayh = getTrimData(v1.elementAt(33)).substring(1, 17);
        if (homeWna == null) {
          homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna",
              BiodataWnaHome.class);
        }
        remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik_ayh));
        remoteWna.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(39)));
//        w3=getTrimData(v1.elementAt(32));
        w3 = "2";
      }
      else if (v1.elementAt(33) != null &&
               !getTrimData(v1.elementAt(33)).startsWith("A") &&
               getTrimData(v1.elementAt(33)).trim().length() == 16) {
        //System.out.println("Ayah entered WNI");
        nik_ayh = getTrimData(v1.elementAt(33)).trim();
        if (home == null) {
          home = (BiodataWniHome) wniFactory.lookup("BiodataWni",
              BiodataWniHome.class);
        }
        remote = home.findByPrimaryKey(getTrimBigDecimalData(nik_ayh));
        remote.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(38)));
//        w3=getTrimData(v1.elementAt(32));
        w3 = "1";
      }
      // nik pelapor

      if (getTrimData(v1.elementAt(55)).startsWith("A")) {
        //System.out.println("Nik Pelapor entered WNA");
        nik_plpr = getTrimData(v1.elementAt(55)).substring(1, 17);
        if (homeWna == null) {
          homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna",
              BiodataWnaHome.class);
        }
        remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik_plpr));
        //System.out.println("v1.elementAt(57)).trim(): " +                           getTrimData(v1.elementAt(57)).trim());
        remoteWna.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(57)));
        w4 = "2";
      }
      else {
        //System.out.println("Nik Pelapor entered WNI");
        nik_plpr = getTrimData(v1.elementAt(55));
        if (home == null) {
          home = (BiodataWniHome) wniFactory.lookup("BiodataWni",
              BiodataWniHome.class);
        }
        remote = home.findByPrimaryKey(getTrimBigDecimalData(nik_plpr));
        //System.out.println("Find By Primary Key pelapor WNI");
        remote.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(56)));
        w4 = "1";
      }
      wtotal = w1 + w2 + w3 + w4; //bayi+ibu+ayah+pelapor
      if (homeCatat != null) {
        remoteCatat = homeCatat.create(nik,
                                       getTrimBigDecimalData(v1.elementAt(1)),
                                       s3, getTrimBigDecimalData(v1.elementAt(4)),
                                       getTrimBigDecimalData(v1.elementAt(5)),
                                       getTrimBigDecimalData(v1.elementAt(6)),
                                       getTrimBigDecimalData(v1.elementAt(7)),
                                       s4, nik_ibu,
                                       getTrimData(v1.elementAt(11)),
                                       tgl1,
                                       (getTrimData(v1.elementAt(9)).equals("1")) ?
                                       getTrimBigDecimalData(v1.elementAt(15)) :
                                       getTrimBigDecimalData(v1.elementAt(16)),
                                       getTrimData(v1.elementAt(17)),
                                       getTrimBigDecimalData(v1.elementAt(18)),
                                       getTrimBigDecimalData(s5), s6,
                                       getTrimBigDecimalData(s7), s8, "",
                                       getTrimData(v1.elementAt(26)),
                                       getTrimData(v1.elementAt(25)),
                                       getTrimData(v1.elementAt(24)),
                                       getTrimData(v1.elementAt(23)),
                                       getTrimBigDecimalData(wtotal),
                                       getTrimBigDecimalData(v1.elementAt(27)),
                                       s9, tgl2,
                                       nik_ayh,
                                       getTrimData(v1.elementAt(34)),
                                       tgl3,
                                       (getTrimData(v1.elementAt(32)).equals(
            "1")) ? getTrimBigDecimalData(v1.elementAt(38)) :
                                       getTrimBigDecimalData(v1.elementAt(39)),
                                       getTrimData(v1.elementAt(40)),
                                       getTrimBigDecimalData(v1.elementAt(41)),
                                       getTrimBigDecimalData(s10), s11,
                                       getTrimBigDecimalData(s12), s13,

                                       getTrimData(v1.elementAt(49)),
                                       getTrimData(v1.elementAt(48)),
                                       getTrimData(v1.elementAt(47)),
                                       getTrimData(v1.elementAt(46)),

                                       getTrimBigDecimalData(v1.elementAt(32)),
                                       getTrimBigDecimalData(v1.elementAt(50)),
                                       s14, tgl4,
                                       nik_plpr,
                                       tgl5,
                                       new BigDecimal("0"),
                                       getTrimBigDecimalData(v1.elementAt(61)),
                                       getTrimBigDecimalData(v1.elementAt(62)),
                                       getTrimBigDecimalData(v1.elementAt(63)),
                                       getTrimData(v1.elementAt(64)),
                                       "N", "N");

      }
      else {
        v1 = null;
      }
    }
    catch (Exception err) {
      v1 = null;
      //System.out.println("Error from Facade Catat Lahir: " + err.toString());
      err.printStackTrace();
    }
    return v1;
  }

  public pendaftaran.KabNikData getLahirData(String nikBayi, String nikSaksi1, String nikSaksi2) throws CapilException {
    KabNikData nikData = new KabNikData();
    ServiceEntity data = null;
    BiodataWni remoteWni = null;
    BiodataWniHome remoteHome = null;
    BiodataWna remoteWna = null;
    BiodataWnaHome wnaHome = null;
    CatatLahir remoteCatat = null;
    CatatLahirHome homeCatat = null;
    DataKeluarga remoteData = null;
    DataKeluargaHome homeData = null;
 try {
      data = ServiceEntity.getInstance();
      homeData = (DataKeluargaHome) data.lookup("DataKeluarga",
                                                DataKeluargaHome.class);
      homeCatat = (CatatLahirHome) data.lookup("CatatLahir", CatatLahirHome.class);

      //bayi wni

        if (nikBayi != null && !nikBayi.trim().startsWith("A")) { //WNI
          //bayi
            try {
              remoteCatat = homeCatat.findByPrimaryKey(nikBayi.trim());
              try {
                remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                    BiodataWniHome.class);
                remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                    remoteCatat.getNikBayi()));
                remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                    remoteWni.getNoKk()));
                nikData.setRecordBayi(setRecordBayiWni(remoteCatat, remoteWni));
                if (nikData.getRecordBayi().getNoAktaLahir() != null && !"".equals(nikData.getRecordBayi().getNoAktaLahir())) {
                  throw new CapilException("Data Kelahiran Sudah Dicatat!");
                }
              }
              catch (Exception ex) {
                if (ex instanceof CapilException) {
                  throw ex;
                }
                nikData.setRecordBayi(null);
              }
              //bayi
              //pelapor
              String kewarganegaraanPelapor = "";
              kewarganegaraanPelapor = getTrimData(remoteCatat.getKwrngrnIbu()).
                  trim().substring(3, 4);

              if (kewarganegaraanPelapor.trim().equals("1")) {
                System.out.println("Pelapor WNI Yes");
                if (remoteHome == null) {
                  remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                      BiodataWniHome.class);
                }
                try {
                  remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                      remoteCatat.getNikPlpor()));
                  nikData.setRecordPelapor(setRecordPelaporWni(remoteData,
                      remoteWni));

                }
                catch (Exception ex2) {
                  nikData.setRecordPelapor(null);
                }
              }
              else if (kewarganegaraanPelapor.equals("2")) {
                wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                    BiodataWnaHome.class);
                try {
                  remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                      remoteCatat.getNikPlpor()));
                  nikData.setRecordPelapor(setRecordPelaporWna(remoteData,
                      remoteWna));
                }
                catch (Exception ex3) {
                  nikData.setRecordPelapor(null);
                  //System.out.println("NIK PELAPOR " + remoteCatat.getNikPlpor() +                                     " TIDAK ADA");
                }
              }
              //pelapor
              //System.out.println(2350);
            }
            catch (Exception ex1) {
              //System.out.println(2351);
              try {
                remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                    BiodataWniHome.class);
                remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(nikBayi));
                remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                    remoteWni.getNoKk()));
                LahiObject temp =  new LahiObject();
                temp.setNikBayi(nikBayi);
                temp.setJenisKlmin(remoteWni.getJenisKlmin());
                temp.setTglLhr(DayFormatter.formatDate(remoteWni.getTglLhr()));
                temp.setNamaLgkp(remoteWni.getNamaLgkp());
                temp.setTmptLhr(remoteWni.getTmptLhr());

                nikData.setRecordBayi(temp);
                nikData.setRecordPelapor(null);
              } catch (Exception ex) {
                nikData.setRecordBayi(null);
                nikData.setRecordPelapor(null);
                //System.out.println("NIK BAYI " + nikBayi + " TIDAK ADA");
              }
            }
              //System.out.println(2373);

            SaksiObject saksiRecord = new SaksiObject();
            nikData.setRecordSaksi(saksiRecord);
            //saksi 1
            try {
              if (nikSaksi1 != null && !nikSaksi1.trim().startsWith("A")) {
                                System.out.println("Saksi 1 WNI Yes");
                if (remoteHome == null) {
                  remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                      BiodataWniHome.class);
                }
                try {
                  //System.out.println("Before Error BARU!!!!!!!!!!!!!!");
                  remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi1));
                  nikData.getRecordSaksi().setSaksi1Record(setSaksi1RecordWni(nikSaksi1,
                      remoteWni, remoteData));
                }
                catch (Exception ex4) {
                  //System.out.println("In Error BARU!!!!!!!!!!!!!!");
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI I " + nikSaksi1 +                                     " TIDAK ADA");
                }
              }
              else if (nikSaksi1 != null && nikSaksi1.trim().startsWith("A")) {
                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);
                }
                try {
                  remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi1.substring(1)));
                  nikData.getRecordSaksi().setSaksi1Record(setSaksi1RecordWna(nikSaksi1,
                      remoteWna, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI I WNA " + nikSaksi1 +                                     " TIDAK ADA");
                }
              }
            }
            catch (Exception ex7) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI I WNA " + nikSaksi1 +                                     " SALAH");
            }
            //saksi 1
              //System.out.println(2423);

            //saksi 2
            try {
              if (nikSaksi2 != null && !nikSaksi2.trim().startsWith("A")) {
                                System.out.println("Saksi2 WNI Yes");
                if (remoteHome == null) {
                  remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                      BiodataWniHome.class);
                }
                try {
                  remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi2));
                  nikData.getRecordSaksi().setSaksi2Record(setSaksi2RecordWni(nikSaksi2,
                      remoteWni, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI II " + nikSaksi2 +                                     " TIDAK ADA");
                }
              }
              else if (nikSaksi2 != null && nikSaksi2.trim().startsWith("A")) {
                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);
                }
                try {
                  remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi2.substring(1)));
                  nikData.getRecordSaksi().setSaksi2Record(setSaksi2RecordWna(nikSaksi2,
                      remoteWna, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI II WNA " + nikSaksi2 +                                     " TIDAK ADA");
                }
              }
            }
            catch (Exception ex8) {
                  nikData.getRecordSaksi().setSaksi2Record(null);
                  //System.out.println("NIK SAKSI II WNA " + nikSaksi2 +                                     " SALAH");

            }
            //saksi 2
              //System.out.println(2469);

            //saksi
          } else if (nikBayi != null && nikBayi.trim().startsWith("A")) { //bayi wna
              //System.out.println(2473);

            //bayi
            try {
              nikBayi = nikBayi.substring(1);
              remoteCatat = homeCatat.findByPrimaryKey(nikBayi.trim());
              try {

                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);
                }
                remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                    remoteCatat.getNikBayi()));
                remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                    remoteWna.getNoKk()));
                nikData.setRecordBayi(setRecordBayiWna(remoteCatat, remoteWna));
                //System.out.println("NoAktaLahir=" +                                   nikData.getRecordBayi().getNoAktaLahir());
                if (nikData.getRecordBayi().getNoAktaLahir() != null || !"".equals(nikData.getRecordBayi().getNoAktaLahir())) {
                  throw new CapilException("Data Kelahiran Sudah Dicatat!");
                }

                //bayi
              }
              catch (Exception ex5) {
                //System.out.println(2465);
                if (ex5 instanceof CapilException) {
                  throw ex5;
                }
                nikData.setRecordBayi(null);
                //System.out.println("NIK BAYI WNA " + nikBayi + " TIDAK ADA");
              }
              //System.out.println(2506);

              //pelapor
              String kewarganegaraanPelapor = getTrimData(remoteCatat.
                  getKwrngrnIbu()).
                  trim().substring(3, 4);

              if (kewarganegaraanPelapor.equals("1")) {
                if (remoteHome == null) {
                  remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                      BiodataWniHome.class);
                }
                try {
                  remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                      remoteCatat.getNikPlpor()));
                  nikData.setRecordPelapor(setRecordPelaporWni(remoteData,
                      remoteWni));
                }
                catch (Exception ex4) {
                  nikData.setRecordPelapor(null);
                  //System.out.println("NIK PELAPOR " + remoteCatat.getNikPlpor() +                                     " TIDAK ADA");
                }
              }
              else if (kewarganegaraanPelapor.equals("2")) {
                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);

                }
                try {
                  remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                      remoteCatat.getNikPlpor()));
                  nikData.setRecordPelapor(setRecordPelaporWna(remoteData,
                      remoteWna));
                }
                catch (Exception ex4) {
                  nikData.setRecordPelapor(null);
                  //System.out.println("NIK PELAPOR WNA " +                           remoteCatat.getNikPlpor() +          " TIDAK ADA");
                }
              }
              //pelapor
              //System.out.println(2550);
            }
            catch (Exception ex6) {
              //System.out.println(2553);
              if (ex6 instanceof CapilException) throw ex6;
                //System.out.println(2517);
              try {
                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);
                }
                //System.out.println("getTrimBigDecimalData(nikBayi)="+getTrimBigDecimalData(nikBayi));
                remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nikBayi));
                //System.out.println("getTrimBigDecimalData(remoteWna.getNoKk())="+getTrimBigDecimalData(remoteWna.getNoKk()));
                remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                    remoteWna.getNoKk()));

                LahiObject temp = new LahiObject();
                temp.setNikBayi(nikBayi);
                temp.setJenisKlmin(remoteWna.getJenisKlmin());
                temp.setTglLhr(DayFormatter.formatDate(remoteWna.getTglLhr()));
                temp.setNamaLgkp(remoteWna.getNamaPertma());
                temp.setTmptLhr(remoteWna.getTmptLhr());
                nikData.setRecordBayi(temp);
                nikData.setRecordPelapor(null);
              }
              catch (Exception ex5) {
                nikData.setRecordBayi(null);
                nikData.setRecordPelapor(null);
                //System.out.println("NIK BAYI WNA " + nikBayi + " TIDAK ADA");
              }
            }
              //System.out.println(2582);

            //saksi
            SaksiObject saksiRecord = new SaksiObject();
            nikData.setRecordSaksi(saksiRecord);
            //saksi 1
            try {
              if (nikSaksi1 != null && !nikSaksi1.trim().startsWith("A")) {
                if (remoteHome == null) {
                  remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                      BiodataWniHome.class);

                }
                try {
                  remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi1));
                  nikData.getRecordSaksi().setSaksi1Record(setSaksi1RecordWni(nikSaksi1,
                      remoteWni, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI I " + nikSaksi1 +                                     " TIDAK ADA");
                }
              }
              else if (nikSaksi1 != null && nikSaksi1.trim().startsWith("A")) {
                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);
                }
                try {
                  remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi1.substring(1)));
                  nikData.getRecordSaksi().setSaksi1Record(setSaksi1RecordWna(nikSaksi1,
                      remoteWna, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI I WNA " + nikSaksi1 +                                     " TIDAK ADA");
                }
              }
            }
            catch (Exception ex9) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI I WNA " + nikSaksi1 +                                     " SALAH");
            }
            //saksi 1
              //System.out.println(2630);

            //saksi 2
            try {
              if (nikSaksi2 != null && !nikSaksi2.trim().startsWith("A")) {
                if (remoteHome == null) {
                  remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                      BiodataWniHome.class);
                }
                try {
                  remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi2));
                  nikData.getRecordSaksi().setSaksi2Record(setSaksi2RecordWni(nikSaksi2,
                      remoteWni, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI II " + nikSaksi2 +                                     " TIDAK ADA");
                }
              }
              else if (nikSaksi2 != null && nikSaksi2.trim().startsWith("A")) {
                if (wnaHome == null) {
                  wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                      BiodataWnaHome.class);

                }
                try {
                  remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                      nikSaksi2.substring(1)));
                  nikData.getRecordSaksi().setSaksi2Record(setSaksi2RecordWna(nikSaksi2,
                      remoteWna, remoteData));
                }
                catch (Exception ex4) {
                  nikData.getRecordSaksi().setSaksi1Record(null);
                  //System.out.println("NIK SAKSI II WNA " + nikSaksi2 +                                     " TIDAK ADA");
                }
              }
            }
            catch (Exception ex10) {
                  nikData.getRecordSaksi().setSaksi2Record(null);
                  //System.out.println("NIK SAKSI II WNA " + nikSaksi2 +                                     " SALAH");

            }
            //saksi 2
              //System.out.println(2678);
            //saksi
        }

    }
    catch (Exception err) {
      if (err instanceof CapilException) throw (CapilException)err;
//      nikData = null;
      //System.out.println("Error from Facade Lahir Data" + err.toString());
      err.printStackTrace();
    }

    return nikData;
  }

  public SaksiObject getSaksiData(String s1, String s2) {
    String nik1, nik2, nik1A = null, nik2A = null;

    nik1 = s1;
    nik2 = s2;

    // ******** Decalartion for lookup ***********

    ServiceEntity data;

    // ****** Declaration of Set of objects for WNI data *********

    Saksi1Object record = null;
    Saksi2Object record1 = null;

    // ****** Declaration Set of objects for WNA data *********

    Saksi1Object3 records = null;
    Saksi2Object4 record11 = null;

    // ****** Declaration of remote objects for WNI data *********

    BiodataWni remoteWni = null;
    BiodataWniHome remoteHome = null;

    // ****** Declaration of remote objects for WNA data *********

    BiodataWna remoteWna = null;
    BiodataWnaHome wnaHome = null;

    // ****** Declaration of remote objects for Data Keluarga Data *********

    DataKeluarga remoteData = null;
    DataKeluargaHome homeData = null;

    // ****** Declaration of main value objects for string WNI/WNA data *********

    SaksiObject klrRecord = null;

    //**************** Check for prefix A for WNA NIK from the JSP request *****************

    if (nik1.startsWith("A")) {
      nik1A = nik1.substring(1, 17);
      nik1 = null;
    }
    if (nik2.startsWith("A")) {
      nik2A = nik2.substring(1, 17);
      nik2 = null;
    }

    try {
      data = ServiceEntity.getInstance();
      //   remoteHome = (BiodataWniHome)data.lookup("BiodataWni",BiodataWniHome.class);
      //   wnaHome = (BiodataWnaHome)data.lookup("BiodataWna",BiodataWnaHome.class);
      homeData = (DataKeluargaHome) data.lookup("DataKeluarga",
                                                DataKeluargaHome.class);

      //**************** Check for WNI NIK1 *****************

      try {
        if (nik1 == null) {
          record = null;
        }
        else {
          remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
              BiodataWniHome.class);
          remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(nik1));
          remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
              remoteWni.
              getNoKk()));
          record = new Saksi1Object(remoteWni.getNamaLgkp(),
                                    remoteWni.getAgama(),
                                    remoteWni.getJenisPkrjn(),
                                    remoteWni.getTglLhr(),
                                    remoteWni.getTmptLhr(),
                                    remoteData.getAlamat(),
                                    remoteData.getDusun(),
                                    remoteData.getTelp(),
                                    remoteData.getNoRt(),
                                    remoteData.getNoRw(),
                                    remoteData.getKodePos(),
                                    remoteData.getNoKk(),
                                    remoteWni.getPddkAkh(),
                                    remoteWni.getStatKwn());
        }
      }
      catch (Exception n1) {
        record = null;
        //System.out.println("Exception in Nik1 = " + n1);
      }

      //**************** Check for WNI NIK2 *****************

       try {
         if (nik2 == null) {
           record1 = null;
         }
         else {
           if (remoteHome == null) {
             remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                 BiodataWniHome.class);
           }
           remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(nik2));
           remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
               remoteWni.
               getNoKk()));

           record1 = new Saksi2Object(remoteWni.getNamaLgkp(),
                                      remoteWni.getAgama(),
                                      remoteWni.getJenisPkrjn(),
                                      remoteWni.getTglLhr(),
                                      remoteWni.getTmptLhr(),
                                      remoteData.getAlamat(),
                                      remoteData.getDusun(),
                                      remoteData.getTelp(),
                                      remoteData.getNoRt(),
                                      remoteData.getNoRw(),
                                      remoteData.getKodePos(),
                                      remoteData.getNoKk(),
                                      remoteWni.getPddkAkh(),
                                      remoteWni.getStatKwn());

         }
       }
       catch (Exception n2) {
         record1 = null;
         //System.out.println("Exception in Nik2 = " + n2);
       }

      //**************** Check for WNA NIK1A *****************

       try {
         if (nik1A == null) {
           records = null;
         }
         else {
           wnaHome = (BiodataWnaHome) data.lookup("BiodataWna", BiodataWnaHome.class);
           remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik1A));
           remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
               remoteWna.
               getNoKk()));
           records = new Saksi1Object3(remoteWna.getNamaPertma(),
                                       remoteWna.getAgama(),
                                       remoteWna.getJenisPkrjn(),
                                       remoteWna.getTglLhr(),
                                       remoteWna.getTmptLhr(),
                                       remoteData.getAlamat(),
                                       remoteData.getDusun(),
                                       remoteData.getTelp(),
                                       remoteData.getNoRt(),
                                       remoteData.getNoRw(),
                                       remoteData.getKodePos(),
                                       remoteData.getNoKk(),
                                       remoteWna.getPddkAkh(),
                                       remoteWna.getStatKwn(),
                                       remoteWna.getKwrngrn());
         }
       }
       catch (Exception n1A) {
         records = null;
         //System.out.println("Exception in Nik1A = " + n1A);
       }

      //**************** Check for WNA NIK2A *****************

       try {
         if (nik2A == null) {
           record11 = null;
         }
         else {
           if (wnaHome == null) {
             wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                 BiodataWnaHome.class);
           }
           remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik2A));
           remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
               remoteWna.
               getNoKk()));

           record11 = new Saksi2Object4(remoteWna.getNamaPertma(),
                                        remoteWna.getAgama(),
                                        remoteWna.getJenisPkrjn(),
                                        remoteWna.getTglLhr(),
                                        remoteWna.getTmptLhr(),
                                        remoteData.getAlamat(),
                                        remoteData.getDusun(),
                                        remoteData.getTelp(),
                                        remoteData.getNoRt(),
                                        remoteData.getNoRw(),
                                        remoteData.getKodePos(),
                                        remoteData.getNoKk(),
                                        remoteWna.getPddkAkh(),
                                        remoteWna.getStatKwn(),
                                        remoteWna.getKwrngrn());

         }

       }
       catch (Exception n2A) {
         record11 = null;
         //System.out.println("Exception in Nik2A = " + n2A);
       }

      //**************** Store set of records in Wni/WNA Value Object *****************

       klrRecord = new SaksiObject(record, record1, records, record11);

    }
    catch (Exception err) {
      record = null;
      //System.out.println("Error from Facade WNI Data" + err.toString());
    }
    return klrRecord;
  }

  // ********* updation for Saksi1, Sakshi2 *************

  public Vector updateLahir(Vector v) {
    boolean b = false;
    ServiceEntity updateLahir = null;
    CatatLahir remoteCatat = null;
    CatatLahirHome homeCatat = null;
    BiodataWni remote = null;
    BiodataWniHome home = null;

    BiodataWna remoteWna = null;
    BiodataWnaHome wnaHome = null;
    String kwrngra = "";
    Vector v1 = new Vector();

    String join = null, no_prop, no_kab, no_akta_lahir, num, jeni_akta = null,
        returnval = null, nik = null, niksaksi1, niksaksi2;
    String w1, w2, wtotal;
    String sysDate = null;

    //System.out.println("UPDATE LAHIR v.size()-1= " + (v.size() - 1));

    int lastElement = v.size() - 1;

    if (v.elementAt(lastElement) != null) {
      sysDate = v.elementAt(lastElement).toString();//DayFormatter.formatDate(getTrimData(v.elementAt(lastElement))); //Sysdate date changed by Rajesh
    }

    //System.out.println("UPDATE LAHIR sysDate= " + sysDate);

    for (int i = 0; i < v.size(); i++) {
      //System.out.println("In UpdateLahir Bean V[" + i + "]=" + v.elementAt(i));
    }

    if (getTrimData(v.elementAt(7)).equals("1")) {
      jeni_akta = "CLU";
    }
    if (getTrimData(v.elementAt(7)).equals("2")) {
      jeni_akta = "CLI";
    }
    if (getTrimData(v.elementAt(7)).equals("3")) {
      jeni_akta = "CLD";
    }

    join = getTrimData(v.elementAt(9));

    try {
      updateLahir = ServiceEntity.getInstance();
      homeCatat = (CatatLahirHome) updateLahir.lookup("CatatLahir",
          CatatLahirHome.class);
      //    home = (BiodataWniHome)updateLahir.lookup("BiodataWni",BiodataWniHome.class);
      //   wnaHome=(BiodataWnaHome) updateLahir.lookup("BiodataWna", BiodataWnaHome.class);

      if (getTrimData(v.elementAt(0)).startsWith("A")) {
        nik = getTrimData(v.elementAt(0)).substring(1, 17);
      }
      else {
        nik = getTrimData(v.elementAt(0));
      }
      //System.out.println("nik=" + nik);
      remoteCatat = homeCatat.findByPrimaryKey(getTrimData(nik));

      //System.out.println("NIK after REMOPTE CATAT: " + nik);

      if (getTrimData(v.elementAt(1)).startsWith("A")) {
        niksaksi1 = getTrimData(v.elementAt(1)).substring(1, 17);
        w1 = "2";
      }
      else {
        niksaksi1 = getTrimData(v.elementAt(1));
        w1 = "1";
      }
      if (getTrimData(v.elementAt(4)).startsWith("A")) {
        niksaksi2 = getTrimData(v.elementAt(4)).substring(1, 17);
        w2 = "2";
      }
      else {
        niksaksi2 = getTrimData(v.elementAt(4));
        w2 = "1";
      }

      wtotal = w1 + w2;

      no_prop = getTrimData(remoteCatat.getNoProp());
      no_kab = getTrimData(remoteCatat.getNoKab());

      no_prop = (no_prop.length() != 2) ? "0" + no_prop : no_prop;
      no_kab = (no_kab.length() != 2) ? "0" + no_kab : no_kab;

      no_akta_lahir = no_prop + no_kab + jeni_akta;

      Connection conn = null;
      CallableStatement cs = null;

      try {
        ConnectorDB connectorDb = new ConnectorDB();

        conn = connectorDb.getConnection();
        cs = conn.prepareCall("{? = call getnolhr(?)}");
        cs.registerOutParameter(1, java.sql.Types.VARCHAR);
        cs.setString(2, no_akta_lahir);
        cs.execute();
        returnval = cs.getString(1);
        //System.out.println("returnval: " + returnval);
        cs.close();
        conn.close();
        cs = null;
        conn = null;
      }
      catch (Exception seq) {
        //System.out.println("Exception in updateLahir = " + seq);
        seq.printStackTrace();
      }
      finally {
        try {
          if (cs != null) {
            cs.close();
          }
        }
        catch (Exception e3) {}

        try {
          if (conn != null) {
            conn.close();
          }
        }
        catch (Exception e4) {}
      }

      if (remoteCatat != null) {
        //System.out.println("WTOTAL: " + wtotal);
        //System.out.println("remoteCatat.getKwrngrnIbu(): " +                           remoteCatat.getKwrngrnIbu());
        //System.out.println("WARGANEGARA IBU TOTAL: " +                           getTrimData(remoteCatat.getKwrngrnIbu()) + wtotal);

        if (getTrimData(remoteCatat.getKwrngrnIbu()).length() > 6) {
          //System.out.println("if(remoteCatat.getKwrngrnIbu()).length()>6)");

          kwrngra = getTrimData(getTrimData(remoteCatat.getKwrngrnIbu()).trim().
                                substring(0, 4));
          kwrngra = kwrngra + getTrimData(wtotal);

          remoteCatat.setKwrngrnIbu(getTrimBigDecimalData(kwrngra));
        }
        else if (getTrimData(remoteCatat.getKwrngrnIbu()).length() == 4) {
          //System.out.println(              "else if(remoteCatat.getKwrngrnIbu()).length()==4)");
          kwrngra = getTrimData(remoteCatat.getKwrngrnIbu());
          kwrngra = kwrngra + getTrimData(wtotal);
          remoteCatat.setKwrngrnIbu(getTrimBigDecimalData(kwrngra));
        }

        //System.out.println("niksaksi1: " + niksaksi1);
        //System.out.println("niksaksi2: " + niksaksi2);

        remoteCatat.setNikSksi1(getTrimData(null, niksaksi1));
        remoteCatat.setNikSksi2(getTrimData(null, niksaksi2));
        remoteCatat.setJenisDftLhr(getTrimBigDecimalData(v.elementAt(7)));

//       //System.out.println("NEW BigDecimal(v.elementAt(7)).trim())= "+new BigDecimal(v.elementAt(7)).trim()));

        remoteCatat.setDsrhkCttlhr(getTrimBigDecimalData(v.elementAt(8)));

        //     //System.out.println("NEW BigDecimal(v.elementAt(8)).trim())= "+new BigDecimal(v.elementAt(8)).trim()));

        remoteCatat.setNoAktaLahir(getTrimData(null, returnval));
        remoteCatat.setTglAktaLhr(getTrimData(null, sysDate));

        //System.out.println("sysDate.trim()= " + sysDate.trim());
        remoteCatat.setNamaKepDes(getTrimData(null, v.elementAt(9)));

//       //System.out.println("v.elementAt(10)): "+v.elementAt(10)));
        remoteCatat.setNipLrh( (getTrimBigDecimalData(v.elementAt(10))));

//       //System.out.println("NEW BigDecimal(v.elementAt(10)).trim())= "+new BigDecimal(v.elementAt(10)).trim()));

        remoteCatat.setNamaPetReg(getTrimData(null, v.elementAt(11)));

//       //System.out.println("v.elementAt(12)): "+v.elementAt(12)));
        remoteCatat.setNipPetReg(getTrimBigDecimalData(v.elementAt(12)));

//       //System.out.println("NEW BigDecimal(v.elementAt(12)).trim())= "+new BigDecimal(v.elementAt(12)).trim()));

        String prsyratan;

        if (getTrimData(null, v.elementAt(13)) != null) {
          prsyratan = getTrimData(remoteCatat.getPsyratanLhr());

          for (int i = 13; i < v.size() - 2; i++) {

            if ( (prsyratan != null) && !prsyratan.trim().equals("")) {
              prsyratan = prsyratan + "," + getTrimData(v.elementAt(i));
            }
            else {
              prsyratan = getTrimData(v.elementAt(i));
            }
          }
          remoteCatat.setPsyratanLhr(getTrimData(null, prsyratan));
        }

        if (getTrimData(null, remoteCatat.getNoAktaLahir()) != null) {
          v1.addElement(getTrimData(remoteCatat.getNoAktaLahir()));
        }
        v1.addElement(getTrimData(remoteCatat.getNamaIbu()));

        if (getTrimData(v.elementAt(0)).startsWith("A")) {
          nik = getTrimData(v.elementAt(0)).substring(1, 17);
          wnaHome = (BiodataWnaHome) updateLahir.lookup("BiodataWna",
              BiodataWnaHome.class);
          remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik));
          //System.out.println("STEP 1, remoteWna= " + remoteWna);
        }
        else {
          nik = getTrimData(v.elementAt(0));
          home = (BiodataWniHome) updateLahir.lookup("BiodataWni",
              BiodataWniHome.class);
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik));
          //System.out.println("STEP 1, remote= " + remote);
          remote.setAktaLhr(new BigDecimal("1"));
          //System.out.println("returnval=" + returnval);
          remote.setNoAktaLhr(getTrimData(null, returnval));
        }

        if (getTrimData(getTrimData(v.elementAt(1))).startsWith("A")) {
          niksaksi1 = getTrimData(v.elementAt(1)).substring(1, 17);

          //System.out.println("STEP 2, niksaksi1= " + niksaksi1);

          if (wnaHome == null) {
            wnaHome = (BiodataWnaHome) updateLahir.lookup("BiodataWna",
                BiodataWnaHome.class);
          }
          remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(niksaksi1));

          //System.out.println("STEP 3");
          //System.out.println("getTrimBigDecimalData(v.elementAt(3))= " +                             getTrimBigDecimalData(v.elementAt(3)));

          remoteWna.setJenisPkrjn(getTrimBigDecimalData(v.elementAt(3)));
        }
        else {
          niksaksi1 = getTrimData(v.elementAt(1));
          //System.out.println("STEP 2, niksaksi1 wni= " + niksaksi1);
          if (home == null) {
            home = (BiodataWniHome) updateLahir.lookup("BiodataWni",
                BiodataWniHome.class);
          }
          remote = home.findByPrimaryKey(getTrimBigDecimalData(niksaksi1));
          //System.out.println("STEP 4");
          remote.setJenisPkrjn(getTrimBigDecimalData(v.elementAt(2)));

          //System.out.println("v.elementAt(2)).trim()= " +                             getTrimData(v.elementAt(2)).trim());
        }
        if (getTrimData(v.elementAt(4)).startsWith("A")) {
          if (getTrimData(null, v.elementAt(4)) != null) {
            niksaksi2 = getTrimData(v.elementAt(4)).substring(1, 17);
          }
          //System.out.println("STEP 6, niksaksi2= " + niksaksi2);

          if (wnaHome == null) {
            wnaHome = (BiodataWnaHome) updateLahir.lookup("BiodataWna",
                BiodataWnaHome.class);

          }
          remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(niksaksi2));
          //System.out.println("STEP 7");
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(v.elementAt(6)));
          //System.out.println("v.elementAt(6)).trim()= " +                             getTrimData(v.elementAt(6)).trim());
        }
        else {
          if (getTrimData(null, v.elementAt(4)) != null) {
            niksaksi2 = getTrimData(v.elementAt(4));
          }
          //System.out.println("STEP 6, niksaksi2= " + niksaksi2);
          if (home == null) {
            home = (BiodataWniHome) updateLahir.lookup("BiodataWni",
                BiodataWniHome.class);
          }
          remote = home.findByPrimaryKey(getTrimBigDecimalData(niksaksi2));
          //System.out.println("STEP 7");
          remote.setJenisPkrjn(getTrimBigDecimalData(v.elementAt(5)));
          //System.out.println("v.elementAt(5)).trim()= " + v.elementAt(5));
        }
      }
      else {
        v1 = null;
      }
    }
    catch (Exception err) {
      v1 = null;
      //System.out.println("Error from Facade Lahir Update" + err.toString());
      err.printStackTrace();
    }
    return v1;
  }

  // ********** Function to insert data into catat_mati table ********

  public boolean insertMati(Vector v1) {
    int i = 0, j = 0, k1 = 0, dd, mm, yy;
    boolean b = false;
    ServiceEntity wniFactory;
    BiodataWni remote = null;
    BiodataWniHome home = null;
    BiodataWna remoteWna = null;
    BiodataWnaHome homeWna = null;
    CatatMati remoteCatat = null;
    CatatMatiHome homeCatat = null;
    String returnval = null;
    int l1 = 0, l2 = 0, l3 = 0, l4 = 0, l5 = 0, l6 = 0, l7 = 0, l8 = 0, l9 = 0,
        l10 = 0, l11 = 0, l12 = 0, l13 = 0, l14 = 0, l15 = 0;
    String sysDate = null;
    //System.out.println("v1.size()-1= " + (v1.size() - 1));
    int lastElement = v1.size() - 1;
    if (v1.elementAt(lastElement) != null) {
      sysDate = getTrimData(v1.elementAt(lastElement)).trim();
    }
    //System.out.println("INSERT MATI sysDate= " + sysDate);

    String nik, nik_ibu, nik_ayh, nik_plpr;
    String w1, w2, w3, w4;
    String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14 = null;
    String tgl1 = "", tgl2 = "", tgl3 = "", tgl4 = "", tgl5 = "";
    // nik_jnsah

    if (getTrimData(v1.elementAt(0)).startsWith("A")) {
      nik = getTrimData(v1.elementAt(0)).substring(1, 17);
      w1 = "2";
    }
    else {
      nik = getTrimData(v1.elementAt(0));
      w1 = "1";
    }

    s1 = getTrimData(v1.elementAt(6));
    s2 = getTrimData(v1.elementAt(7));

    s3 = s1 + ":" + s2;

    s4 = getTrimData(v1.elementAt(12));
    s5 = getTrimData(v1.elementAt(13));
    s6 = getTrimData(v1.elementAt(27));
    s7 = getTrimData(v1.elementAt(28));
    s8 = getTrimData(v1.elementAt(29));
    s9 = getTrimData(v1.elementAt(30));
    s10 = getTrimData(v1.elementAt(45));
    s11 = getTrimData(v1.elementAt(46));
    s12 = getTrimData(v1.elementAt(47));
    s13 = getTrimData(v1.elementAt(48));

    try {

      l1 = Integer.parseInt(getTrimData("0", v1.elementAt(3))); //dd
      l2 = Integer.parseInt(getTrimData("0", v1.elementAt(4))); //mm
      l3 = Integer.parseInt(getTrimData("0", v1.elementAt(5))); //year

      l4 = (v1.elementAt(14)).equals("") ? 0 :
          Integer.parseInt(getTrimData("0", v1.elementAt(14))); //dd
      l5 = (v1.elementAt(15)).equals("") ? 0 :
          Integer.parseInt(getTrimData("0", v1.elementAt(15))); //mm
      l6 = (v1.elementAt(16)).equals("") ? 0 :
          Integer.parseInt(getTrimData("0", v1.elementAt(16))); //yy

      l7 = Integer.parseInt(getTrimData("0", v1.elementAt(20))); //dd
      l8 = Integer.parseInt(getTrimData("0", v1.elementAt(21))); //mm
      l9 = Integer.parseInt(getTrimData("0", v1.elementAt(22))); //yy

      l10 = Integer.parseInt(getTrimData("0", v1.elementAt(38))); // dd
      l11 = Integer.parseInt(getTrimData("0", v1.elementAt(39))); // month
      l12 = Integer.parseInt(getTrimData("0", v1.elementAt(40))); // year

      l13 = Integer.parseInt(getTrimData("0", v1.elementAt(56))); // dd
      l14 = Integer.parseInt(getTrimData("0", v1.elementAt(57))); // month
      l15 = Integer.parseInt(getTrimData("0", v1.elementAt(58))); // year

      tgl1 = getSiakDate(getTrimData(v1.elementAt(3)),
                         getTrimData(v1.elementAt(4)),
                         getTrimData(v1.elementAt(5)));
      //Tanggal Lahir
      tgl2 = getSiakDate(getTrimData(v1.elementAt(14)),
                         getTrimData(v1.elementAt(15)),
                         getTrimData(v1.elementAt(16)));
      //Tanggal Perkawinan
      tgl3 = getSiakDate(getTrimData(v1.elementAt(20)),
                         getTrimData(v1.elementAt(21)),
                         getTrimData(v1.elementAt(22)));
      //Tanggal Perceraian
      tgl4 = getSiakDate(getTrimData(v1.elementAt(38)),
                         getTrimData(v1.elementAt(39)),
                         getTrimData(v1.elementAt(40)));
      //Tanggal 5
      tgl5 = getSiakDate(getTrimData(v1.elementAt(56)),
                         getTrimData(v1.elementAt(57)),
                         getTrimData(v1.elementAt(58)));

    }
    catch (Exception ee) {
      //System.out.println("Exception in mati date manipulation : " + ee);
      ee.printStackTrace();
    }

    try {
      wniFactory = ServiceEntity.getInstance();
      //    home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);
      //    homeWna=(BiodataWnaHome) wniFactory.lookup("BiodataWna", BiodataWnaHome.class);

      homeCatat = (CatatMatiHome) wniFactory.lookup("CatatMati",
          CatatMatiHome.class);

      /// nik ibu

      if (getTrimData(v1.elementAt(18)).equals("") || getTrimData(v1.elementAt(18)).equals("0")) {
        nik_ibu = "";
        w2 = getTrimData(v1.elementAt(17));
      }

      else if (getTrimData(v1.elementAt(18)).startsWith("A")) {
        nik_ibu = getTrimData(v1.elementAt(18)).substring(1, 17);
        homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna",
            BiodataWnaHome.class);
        remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik_ibu));
        remoteWna.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(24)));
        w2 = getTrimData(v1.elementAt(17));
      }
      else {
        nik_ibu = getTrimData(v1.elementAt(18));
        home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);
        remote = home.findByPrimaryKey(getTrimBigDecimalData(nik_ibu));
        remote.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(23)));
        w2 = getTrimData(v1.elementAt(17));
      }
      //System.out.println("nik_ibu="+nik_ibu);
      // nik ayah

      if (getTrimData(v1.elementAt(36)).equals("") || getTrimData(v1.elementAt(36)).equals("0")) {
        nik_ayh = "";
        w3 = getTrimData(v1.elementAt(35));
      }
      else if (getTrimData(v1.elementAt(36)).startsWith("A")) {
        nik_ayh = getTrimData(v1.elementAt(36)).substring(1, 17);
        if (homeWna == null) {
          homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna",
              BiodataWnaHome.class);
        }
        remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik_ayh));
        remoteWna.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(42)));
        w3 = getTrimData(v1.elementAt(35));
      }
      else {
        nik_ayh = getTrimData(v1.elementAt(36));
        if (home == null) {
          home = (BiodataWniHome) wniFactory.lookup("BiodataWni",
              BiodataWniHome.class);
        }
        remote = home.findByPrimaryKey(getTrimBigDecimalData(nik_ayh));
        remote.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(41)));
        w3 = getTrimData(v1.elementAt(35));
      }
      //System.out.println("nik_ayh="+nik_ayh);
      // nik pelapor

      if (getTrimData(v1.elementAt(53)).startsWith("A")) {
        nik_plpr = getTrimData(v1.elementAt(53)).substring(1, 17);
        if (homeWna == null) {
          homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna",
              BiodataWnaHome.class);
        }
        remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik_plpr));
        remoteWna.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(55)));
        w4 = "2";
      }
      else {
        nik_plpr = getTrimData(v1.elementAt(53));
        if (home == null) {
          home = (BiodataWniHome) wniFactory.lookup("BiodataWni",
              BiodataWniHome.class);
        }
        remote = home.findByPrimaryKey(getTrimBigDecimalData(nik_plpr));
        remote.setJenisPkrjn(getTrimBigDecimalData(v1.elementAt(54)));
        w4 = "1";
      }

      if (homeCatat != null) {
        //System.out.println("No RW=" + s6);
        remoteCatat = homeCatat.create(getTrimBigDecimalData(nik),
                                       getTrimBigDecimalData(w1),
                                       getTrimBigDecimalData(v1.elementAt(1)),
                                       getTrimBigDecimalData(v1.elementAt(2)),
                                       tgl1, s3,
                                       getTrimBigDecimalData(v1.elementAt(8)),
                                       getTrimBigDecimalData(v1.elementAt(9)),
                                       getTrimData(v1.elementAt(10)),
                                       getTrimBigDecimalData(v1.elementAt(11)),
                                       s4, s5, tgl2,
                                       getTrimBigDecimalData(nik_ibu),
                                       getTrimBigDecimalData(w2),
                                       getTrimData(v1.elementAt(19)),
                                       tgl3,
                                       (getTrimData(v1.elementAt(17)).equals(
            "1")) ? getTrimBigDecimalData(v1.elementAt(23)) :
                                       getTrimBigDecimalData(v1.elementAt(24)),
                                       getTrimData(v1.elementAt(25)),
                                       getTrimBigDecimalData(v1.elementAt(26)),
                                       getTrimBigDecimalData(s6), s7,
                                       getTrimBigDecimalData(s8), s9,
                                       getTrimData(v1.elementAt(31)),
                                       getTrimData(v1.elementAt(32)),
                                       getTrimData(v1.elementAt(33)),
                                       getTrimData(v1.elementAt(34)),

                                       getTrimBigDecimalData(nik_ayh),
                                       getTrimBigDecimalData(w3),
                                       getTrimData(v1.elementAt(37)),
                                       tgl4,
                                       (getTrimData("0", v1.elementAt(35)).
                                        equals("1")) ?
                                       getTrimBigDecimalData(v1.elementAt(41)) :
                                       getTrimBigDecimalData(v1.elementAt(42)),
                                       getTrimData(v1.elementAt(43)),
                                       getTrimBigDecimalData(v1.elementAt(44)),
                                       s11,
                                       getTrimBigDecimalData(s10),
                                       getTrimBigDecimalData(s12), s13,

                                       getTrimData(v1.elementAt(49)),
                                       getTrimData(v1.elementAt(50)),
                                       getTrimData(v1.elementAt(51)),
                                       getTrimData(v1.elementAt(52)),

                                       getTrimBigDecimalData(nik_plpr),
                                       getTrimBigDecimalData(w4),
                                       tgl5,
                                       getTrimBigDecimalData(v1.elementAt(59)),
                                       getTrimBigDecimalData(v1.elementAt(60)),
                                       getTrimBigDecimalData(v1.elementAt(61)));
        /*,
         new BigDecimal("0"),new BigDecimal("0"),
         new BigDecimal("0"), new BigDecimal("0"),
         new BigDecimal("0"),new BigDecimal("0"),
         "", "",new java.sql.Date(0,0,0),"",
                                                new BigDecimal("0"),"",
         new BigDecimal("0"),new java.sql.Date(0,0,0),
                                                "",new BigDecimal("0"),
         new BigDecimal(v1.elementAt(59))),
         new BigDecimal(v1.elementAt(60))),
         new BigDecimal(v1.elementAt(61))),
         new BigDecimal("0"),new BigDecimal("0"),
         new java.sql.Date(sysDate.getYear(),sysDate.getMonth(), sysDate.getDate()),
         new java.sql.Date(sysDate.getYear(),sysDate.getMonth(), sysDate.getDate()),
         new BigDecimal("100"), "N", "N");*/

        b = true;

      }
      else {
        b = false;
      }
    }
    catch (Exception err) {
      b = false;
      //System.out.println("Error from Facade Catat Mati" + err.toString());
      err.printStackTrace();

    }
    return b;
  }

  public pendaftaran.MatiKabData getMatiData(String nik, String nikSaksi1, String nikSaksi2) {

  //  MatiObject lahirRecord = null;
  //  PelaporNikMatiData record = null;
  //  MatiKabData nikData = null;
    ServiceEntity data = null;
    BiodataWni remoteWni = null;
    BiodataWniHome remoteHome = null;
    BiodataWna remoteWna = null;
    BiodataWnaHome wnaHome = null;
    CatatMati remoteCatat = null;
    CatatMatiHome homeCatat = null;
    DataKeluarga remoteData = null;
    DataKeluargaHome homeData = null;
    String nikA = null;

 //   Saksi1Object saksi1Obj = null;
 //   Saksi2Object saksi2Obj = null;
//    SaksiObject saksiObject = null;

    //System.out.println("MATI NIK= " + nik);

    if (nik != null && nik.trim().startsWith("A")) {
      nikA = nik.substring(1, 17);
      nik = null;
    }

    MatiKabData kematianData = new MatiKabData();
    try {
      data = ServiceEntity.getInstance();

      //   remoteHome = (BiodataWniHome)data.lookup("BiodataWni",BiodataWniHome.class);
      homeData = (DataKeluargaHome) data.lookup("DataKeluarga",
                                                DataKeluargaHome.class);
      homeCatat = (CatatMatiHome) data.lookup("CatatMati", CatatMatiHome.class);
      //    wnaHome = (BiodataWnaHome)data.lookup("BiodataWna",BiodataWnaHome.class);



      //jenazah
      try {
        if (nik != null && !"".equals(nik)) {
          try {
            remoteCatat = homeCatat.findByPrimaryKey(getTrimBigDecimalData(nik)); //1
            remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                BiodataWniHome.class);

            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                  remoteCatat.getNikJnsah())); //2
              //System.out.println("#remoteWni.getNoKk()).trim()= " +                                 (remoteWni.getNoKk()));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWni.getNoKk())); //3
              //System.out.println("remoteCatat.getNoPropAyh(): " +                                 remoteCatat.getNoPropAyh());
              kematianData.setRecordJnsah(setRecordJenazahWni(remoteCatat,
                  remoteWni, remoteData));
            }
            catch (Exception ex) {
              kematianData.setRecordJnsah(null);
              //System.out.println("NIK JENAZAH " + nik + " TIDAK ADA");
            }
          }
          catch (Exception ex2) {
             try {
                remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                  BiodataWniHome.class);
                remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(nik)); //2
                //System.out.println("#remoteWni.getNoKk()).trim()= " +                                   (remoteWni.getNoKk()));
                remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                    remoteWni.getNoKk())); //3
                MatiObject temp =new MatiObject();
                temp.setNikJnsah(getTrimBigDecimalData(nik));
                temp.setJenisPkrjn(getTrimBigDecimalData(remoteWni.getJenisPkrjn()));
                temp.setJenisKlmin(getTrimBigDecimalData(remoteWni.getJenisKlmin()));
                temp.setTglLhr(DayFormatter.formatDate(remoteWni.getTglLhr()));
                temp.setTglLhr(getTrimData(remoteWni.getNamaLgkp()));
                temp.setTglLhr(getTrimData(remoteWni.getTmptLhr()));
                temp.setTglLhr(getTrimData(remoteData.getAlamat()));
                temp.setTglLhr(getTrimData(remoteData.getDusun()));
                temp.setTglLhr(getTrimData(remoteData.getTelp()));
                temp.setTglLhr(getTrimData(remoteData.getNoRt()));
                temp.setTglLhr(getTrimData(remoteData.getNoRw()));
                temp.setTglLhr(getTrimData(remoteData.getKodePos()));
                kematianData.setRecordJnsah(temp);
              }
              catch (Exception ex) {
                kematianData.setRecordJnsah(null);
                //System.out.println("NIK JENAZAH " + nik + " TIDAK ADA");
              }
          }
        } else if (nikA!=null) {

          try {
            remoteCatat = homeCatat.findByPrimaryKey(getTrimBigDecimalData(nikA)); //1
            wnaHome = (BiodataWnaHome) data.lookup("BiodataWna", BiodataWnaHome.class);
            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                  remoteCatat.getNikJnsah())); //2
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWna.getNoKk())); //3
              kematianData.setRecordJnsah(setRecordJenazahWna(remoteCatat,
                  remoteWna, remoteData));
            }
            catch (Exception ex) {
              kematianData.setRecordJnsah(null);
              //System.out.println("NIK JENAZAH WNA " + remoteCatat.getNikJnsah() +                                 " TIDAK ADA");
            }
          }
          catch (Exception ex3) {
             try {
                wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                  BiodataWnaHome.class);
                remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nikA)); //2
                //System.out.println("#remoteWna.getNoKk()).trim()= " +                                   (remoteWna.getNoKk()));
                remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                    remoteWna.getNoKk())); //3
                MatiObject temp =new MatiObject();
                temp.setNikJnsah(getTrimBigDecimalData(nik));
                temp.setJenisPkrjn(getTrimBigDecimalData(remoteWna.getJenisPkrjn()));
                temp.setJenisKlmin(getTrimBigDecimalData(remoteWna.getJenisKlmin()));
                temp.setTglLhr(DayFormatter.formatDate(remoteWna.getTglLhr()));
                temp.setTglLhr(getTrimData(remoteWna.getNamaPertma()));
                temp.setTglLhr(getTrimData(remoteWna.getTmptLhr()));
                temp.setTglLhr(getTrimData(remoteData.getAlamat()));
                temp.setTglLhr(getTrimData(remoteData.getDusun()));
                temp.setTglLhr(getTrimData(remoteData.getTelp()));
                temp.setTglLhr(getTrimData(remoteData.getNoRt()));
                temp.setTglLhr(getTrimData(remoteData.getNoRw()));
                temp.setTglLhr(getTrimData(remoteData.getKodePos()));
                kematianData.setRecordJnsah(temp);
              }
              catch (Exception ex) {
                kematianData.setRecordJnsah(null);
                //System.out.println("NIK JENAZAH " + nik + " TIDAK ADA");
              }

          }
        }
      }
      catch (Exception wniNik) {
        kematianData.setRecordJnsah(null);
        wniNik.printStackTrace();
      }
      //jenazah

      //pelapor
      if (remoteCatat!=null) {
        if (new BigDecimal("2").equals(remoteCatat.getKwrngrnPlpor())) {
          //System.out.println("GET MATI DATA remoteCatat.getNikPlpor()= " +                             remoteCatat.getNikPlpor());
          if (wnaHome == null) {
            wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                BiodataWnaHome.class);
          }
          try {
            remoteWna = wnaHome.findByPrimaryKey(remoteCatat.getNikPlpor()); //4
            kematianData.setRecordPelapor(setRecordPelaporKematianWna(remoteWna,
                remoteData));
          }
          catch (Exception ex) {
            kematianData.setRecordJnsah(null);
            //System.out.println("NIK PELAPOR " + remoteCatat.getNikPlpor() +                               " TIDAK ADA");
          }
        }
        else if (remoteCatat.getKwrngrnPlpor().equals(new BigDecimal("1"))) {
          if (remoteHome == null) {
            remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                BiodataWniHome.class);
          }
          try {
            remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                remoteCatat.getNikPlpor())); //5
            kematianData.setRecordPelapor(setRecordPelaporKematianWni(remoteWni,
                remoteData));
          }
          catch (Exception ex) {
            kematianData.setRecordPelapor(null);
            //System.out.println("NIK PELAPOR " + remoteCatat.getNikPlpor() +                               " TIDAK ADA");
          }
        }
      }
      //pelapor

      //saksi
      SaksiObject saksiObject = new SaksiObject();
      try {
        //saksi I
        if (nikSaksi1 != null && nikSaksi1.trim().startsWith("A")) {
          if (wnaHome == null) {
            wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                BiodataWnaHome.class);
          }
          try {
            remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                nikSaksi1.substring(1))); //6
            saksiObject.setSaksi1Record(setSaksi1RecordWna(nikSaksi1.
                substring(1), remoteWna, remoteData));
          }
          catch (Exception ex) {
            saksiObject.setSaksi1Record(null);
            //System.out.println("NIK SAKSI I WNA " + nikSaksi1.substring(1) + " TIDAK ADA");
          }
        }
        else {
          if (remoteHome == null) {
            remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                BiodataWniHome.class);
          }
          try {
            remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                nikSaksi1)); //7
            saksiObject.setSaksi1Record(setSaksi1RecordWni(nikSaksi1,
                remoteWni, remoteData));
          }
          catch (Exception ex) {
            saksiObject.setSaksi1Record(null);
            //System.out.println("NIK SAKSI I " + nikSaksi1 + " TIDAK ADA");
          }
        }
        //saksi I

        //saksi II
        if (nikSaksi2 != null && nikSaksi2.trim().startsWith("A")) {
          if (wnaHome == null) {
            wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                BiodataWnaHome.class);
          }
          try {
            remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(
                nikSaksi2.substring(1))); //8
            saksiObject.setSaksi2Record(setSaksi2RecordWna(nikSaksi2.
                substring(1), remoteWna, remoteData));
          }
          catch (Exception ex) {
            saksiObject.setSaksi2Record(null);
            //System.out.println("NIK SAKSI II WNA " + nikSaksi2.substring(1) + " TIDAK ADA");
          }
        } else if (nikSaksi2 != null && nikSaksi2.length() == 16) {
          if (remoteHome == null) {
            remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                BiodataWniHome.class);
          }
          try {
            remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                nikSaksi2)); //9 //8
            saksiObject.setSaksi2Record(setSaksi2RecordWni(nikSaksi2,
                remoteWni, remoteData));
          }
          catch (Exception ex) {
            saksiObject.setSaksi2Record(null);
            //System.out.println("NIK SAKSI II " + nikSaksi2 + " TIDAK ADA");
          }
        }
        //saksi II
        kematianData.setRecordSaksi(saksiObject);
      }
      catch (Exception ex1) {
        kematianData.setRecordSaksi(null);
        ex1.printStackTrace();
      }
      //saksi
    }
    catch (Exception err) {
      kematianData = null;
      err.printStackTrace();
    }

    return kematianData;
  }

  // ********* updation for Saksi1, Sakshi2 Mati*************

 public Vector updateMati(Vector v) {
    boolean b = false;
    ServiceEntity updateLahir = null;
    CatatMati remoteCatat = null;
    CatatMatiHome homeCatat = null;
    BiodataWni remoteWni = null;
    BiodataWniHome homeWni = null;
    BiodataWna remoteWna = null;
    BiodataWnaHome homeWna = null;
    BiodataMati remoteMati = null;
    BiodataMatiHome homeMati = null;
    DataKeluarga remoteData = null;
    DataKeluargaHome homeData = null;
    Connection conn = null;
    CallableStatement cs = null,cs1=null;
    ResultSet rs = null;
    Statement st = null;
    Vector v1 = new Vector();
    int count = 0;
    String stat_hbkel = null;
    String join = null, no_prop, no_kab, no_akta_mati, num, jeni_akta = null,
        returnval = null, nik = null, niksaksi1, niksaksi2, w1, w2, nikWni = null,
        nikWna = null;
    String sysDate = null, no_kk = null;
    int lastElement = v.size() - 1;
    if (v.elementAt(lastElement) != null) {
      sysDate = getTrimData(v.elementAt(lastElement)).trim();
    }

    if (getTrimData(v.elementAt(7)).trim().equals("1")) {
      jeni_akta = "CMU";
    }
    if (getTrimData(v.elementAt(7)).trim().equals("2")) {
      jeni_akta = "CMI";
    }
    if (getTrimData(v.elementAt(7)).trim().equals("3")) {
      jeni_akta = "CMD";
    }

    try {

      updateLahir = ServiceEntity.getInstance();
      homeCatat = (CatatMatiHome) updateLahir.lookup("CatatMati",
          CatatMatiHome.class);

      if (homeCatat != null) {

        if (getTrimData(v.elementAt(0)).startsWith("A")) {
          nik = getTrimData(v.elementAt(0)).substring(1, 17);
          nikWna = nik;
        }
        else {
          nik = getTrimData(v.elementAt(0));
          nikWni = nik;
        }

        remoteCatat = homeCatat.findByPrimaryKey(getTrimBigDecimalData(nik));


      }
      if (getTrimData(v.elementAt(1)).startsWith("A")) {
        niksaksi1 = getTrimData(v.elementAt(1)).substring(1, 17);
        w1 = "2";
      }
      else {
        niksaksi1 = getTrimData(v.elementAt(1));
        w1 = "1";
      }

      if (getTrimData(v.elementAt(4)).startsWith("A")) {
        niksaksi2 = getTrimData(v.elementAt(4)).substring(1, 17);
        w2 = "2";
      }
      else {
        niksaksi2 = getTrimData(v.elementAt(4));
        w2 = "1";
      }
      no_prop = getTrimData(remoteCatat.getNoProp());
      no_kab = getTrimData(remoteCatat.getNoKab());
      no_prop = (no_prop.length() != 2) ? "0" + no_prop : no_prop;
      no_kab = (no_kab.length() != 2) ? "0" + no_kab : no_kab;
      no_akta_mati = no_prop + no_kab + jeni_akta;
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      cs = conn.prepareCall("{? = call getnomti(?)}");
      cs.registerOutParameter(1, java.sql.Types.VARCHAR);
      cs.setString(2, no_akta_mati);
      cs.execute();
      returnval = cs.getString(1);
      cs.close();
      cs = null;


      if (remoteCatat != null) {
        remoteCatat.setNikSksi1(getTrimBigDecimalData(niksaksi1));

        remoteCatat.setKwrngrnSksi1(getTrimBigDecimalData(w1));

        remoteCatat.setNikSksi2(getTrimBigDecimalData(niksaksi2));

        remoteCatat.setKwrngrnSksi2(getTrimBigDecimalData(w2));


        remoteCatat.setJenisDftLhr(getTrimBigDecimalData(v.elementAt(7)));

        remoteCatat.setDasarHkmMati(getTrimBigDecimalData(v.elementAt(8)));

        remoteCatat.setNoAktaMati(returnval.trim());

        remoteCatat.setTglAktaMati(sysDate.trim());
        remoteCatat.setNamaKepDes(getTrimData(v.elementAt(9)).trim());


        if (getTrimData(v.elementAt(10)) != null &&
            !getTrimData(v.elementAt(10)).trim().equals("")) {
          remoteCatat.setNipLrh(getTrimBigDecimalData(v.elementAt(10)));
        }


        remoteCatat.setNamaPetReg(getTrimData(v.elementAt(11)).trim());


        remoteCatat.setNipPetReg(getTrimBigDecimalData(v.elementAt(12)));



        String prsytan = remoteCatat.getPsyratanMt();

        if (getTrimData(v.elementAt(13)) != null) {
          for (int i = 13; i <= v.size() - 2; i++) {
            if (prsytan != null && !prsytan.trim().equals("")) {
              prsytan = prsytan + "," + getTrimData(v.elementAt(i)).trim();
            }
            else {
              prsytan = getTrimData(v.elementAt(i)).trim();
            }
          }
          remoteCatat.setPsyratanMt(prsytan.trim());
          remoteCatat.setPflag("N");
          remoteCatat.setCflag("N");

        }
        v1.addElement(remoteCatat.getNoAktaMati().trim());
        v1.addElement(remoteCatat.getNamaLgkpIbu().trim());
try {
if (nikWni!=null)
{
         cs1 = conn.prepareCall("{? = call cleanupmati(?)}");
         cs1.registerOutParameter(1, java.sql.Types.VARCHAR);
         cs1.setString(2, nikWni);
         cs1.execute();
         returnval = cs1.getString(1);
         cs1.close();
         cs1 = null;
}

if (nikWna!=null)
{
                cs1 = conn.prepareCall("{? = call cleanupmatiwna(?)}");
                cs1.registerOutParameter(1, java.sql.Types.VARCHAR);
                cs1.setString(2, nikWna);
                cs1.execute();
                returnval = cs1.getString(1);
                cs1.close();
                cs1 = null;
}
        }
        catch (Exception ex) {
          ex.printStackTrace();
        }
  }
      else {
        v1 = null;
      }

      if (conn != null) {
        conn.close();
      }
      conn = null;
    }
    catch (Exception err) {
      v1 = null;
      //System.out.println("Error from Facade Mati Update" + err.toString());
      err.printStackTrace();
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
      }
      catch (Exception e1) {}
      try {
        if (st != null) {
          st.close();
        }
      }
      catch (Exception e2) {}

      try {
        if (cs != null) {
          cs.close();
        }
      }
      catch (Exception e3) {}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e4) {}
    }

    return v1;
  }


public int IsJenasahExists(String nik_jenasah)
  {
    Connection conn = null;
    PreparedStatement pr=null;
    ResultSet rs=null;
    int result=1;
    try{
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      pr=conn.prepareStatement("select NIK_JNSAH,NO_AKTA_MATI from catat_mati where NIK_JNSAH=?");
      pr.setString(1,nik_jenasah);
      rs=pr.executeQuery();

      if (rs.next())
      {
        result=2;
        if (rs.getString("NO_AKTA_MATI")!=null)
        {
          result=3;
        }
      }
    }catch(Exception dberr)
    {

    }
    finally {
       try {
         if (rs != null) {
           rs.close();
         }
       }
       catch (Exception e1) {}
       try {
         if (pr != null) {
           pr.close();
         }
       }
       catch (Exception e2) {}
       try {
         if (conn != null) {
           conn.close();
         }
       }
       catch (Exception e4) {}
     }
return result;
  }

public Vector matiInsertKabupaten(Vector insertVector, Vector updateVector)
  {
    Vector updVector=null;
    boolean result=false;
    try{
      result = insertMati(insertVector);
      if (result) {
        updVector = updateMati(updateVector);
      }
    }catch(Exception kaberr)
    {
      updVector=null;
    }
    return updVector;
  }

  // ******** Reterieval of Data for Kawin *************
  public KawinObject getKawinData(String nik1, String nik2, String nik3, String nik4, String nik5, String nik6, String nik7, String nik8) throws CapilException {
    KawinObject record = null;
    WniWnaObj record1 = null, record2 = null;
    record1 = getDataAnakOrangtuaDanPelapor(nik1, nik2, nik3, nik4);
    record2 = getDataAnakOrangtuaDanPelapor(nik5, nik6, nik7, nik8);
    //System.out.println("NIK Calon Istri "+nik5);
    if (getStatusKawin(nik5)==2) { //kawin
      throw new CapilException("Calon istri masih terikat perkawinan");
    }

    record = new KawinObject(record1, record2);

    return record;
  }

  private String getFmtCode(String code) {
    if ( (code != null) && (!code.trim().equals(""))) {
      if (code.length() == 1) {
        return ("0".trim() + code.trim());
      }
      return code.trim();
    }
    return "";
  }

  private String getNik(String nik) {
    if ( (nik != null) && (!nik.trim().equals("")) && (!nik.trim().equals("0"))) {
      if (nik.trim().startsWith("A")) {
        return nik.trim().substring(1, 17);
      }
      return nik;
    }
    return "";
  }

// ********** Function to insert data into catat_kawin table ********
  public String insertKawin(Vector v1) {
     String noAktaKwn = null;
     boolean b = false;
     ServiceEntity wniFactory;
     CatatKawin remoteCatat = null;
     CatatKawinHome homeCatat = null;
     Connection conn = null;
     CallableStatement cs = null;
     String returnval = null, doc_per = "";
     String param_no_akta = null;
     String nik_istri = getTrimData(v1.elementAt(41));
    {
       try {
         ConnectorDB connectorDb = new ConnectorDB();
         conn = connectorDb.getConnection();
         param_no_akta = (getFmtCode(getTrimData(v1.elementAt(121))).trim() +
                          getFmtCode(getTrimData(v1.elementAt(122))).trim() +
                          "CPK");

         try {
           cs = conn.prepareCall("{? = call getnokwn(?)}");
           cs.registerOutParameter(1, java.sql.Types.VARCHAR);
           cs.setString(2, param_no_akta.trim());
           cs.execute();
           returnval = cs.getString(1);
           cs.close();
           conn.close();
           cs = null;
           conn = null;
         }
         catch (Exception seq) {
           //System.out.println("Exception in NoAktaKwn = " + seq);
         }
         finally {
           try {
             if (cs != null) {
               cs.close();
             }
           }
           catch (Exception e3) {}
           try {
             if (conn != null) {
               conn.close();
             }
           }
           catch (Exception e4) {}
         }
         String daftarAnak = (String)v1.elementAt(125);

         if (getTrimData(v1.elementAt(126)) != null) {
           for (int a = 126; a < v1.size(); a++) {
             doc_per = doc_per + "," + getTrimData(v1.elementAt(a));
           }
         }
      wniFactory = ServiceEntity.getInstance();
      homeCatat = (CatatKawinHome) wniFactory.lookup("CatatKawin",
      CatatKawinHome.class);
         try {
           remoteCatat = homeCatat.create(v1, returnval, daftarAnak, doc_per);
           noAktaKwn = remoteCatat.getNoAktaKwn();
         }
         catch (Exception sql) {
           //System.out.println("In create " + sql);
           sql.printStackTrace();
         }
       }
       catch (Exception err) {
         //System.out.println("Error from Facade Catat Kawin" + err.toString());
         err.printStackTrace();
       }
     }
     return noAktaKwn;
}


// ********** Function to insert data into Perceraian table ********

public SaksiObject getCeraiData(String nik1, String nik2, String nik3) throws CapilException {

    Connection conn = null;
    boolean foundbio=false;
    int wnsu=0,wnis=0;
    CallableStatement cs=null;
    // ******** Decalartion for lookup ***********
    String result=null;
    ServiceEntity data;
    BiodataWni remoteWni = null;
    BiodataWniHome remoteHome;
     String no_akta_kwn = null, tgl_akta_kwn = null;
    // ****** Declaration of remote objects for WNA data *********

    BiodataWna remoteWna = null;
    BiodataWnaHome wnaHome;

    // ****** Declaration of remote objects for Data Keluarga Data *********

    DataKeluarga remoteData = null;
    DataKeluargaHome homeData = null;

    // ****** Declaration of remote objects for Kawin data *********

    CatatKawin remoteKawin = null;
    CatatKawinHome homeKawin = null;
    //**************** Check for prefix A for WNA NIK from the JSP request *****************

    SaksiObject ceraiObj = null;

    try {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      String nikSuami = "", nikIstri = "";

      if (nik1 != null && nik1.trim().startsWith("A")) {
        nikSuami = nik1.trim().substring(1);
      }
      else {
        nikSuami = nik1;
        wnsu=1;
      }
      if (nik2 != null && nik2.trim().startsWith("A")) {
        nikIstri = nik2.trim().substring(1);
      }
      else {
        nikIstri = nik2;
        wnis=1;
      }
      cs = conn.prepareCall("{? = call Getkawindata(?,?,?,?)}");
      cs.registerOutParameter(1, java.sql.Types.VARCHAR);
      cs.setString(2, nikSuami);
      cs.setString(3, nikIstri);
      cs.setInt(4,wnsu);
      cs.setInt(5,wnis);
      cs.execute();
      result = cs.getString(1);
      cs.close();
      conn.close();
      cs=null;
      conn = null;

     if (!result.equals("-"))
      {
     foundbio=true;
     try{
       java.util.StringTokenizer tokens = new java.util.StringTokenizer(
           result, "limit");
       ceraiObj = new SaksiObject();
       ceraiObj.setNo_akta_kwn(tokens.nextToken());
       ceraiObj.setTgl_akta_kwn(tokens.nextToken());
     }catch(Exception errtoken)
     {

     }
      }

if (foundbio) {
        data = ServiceEntity.getInstance();
        remoteHome = null;
        wnaHome = null;
        homeData = (DataKeluargaHome) data.lookup("DataKeluarga",
                                                  DataKeluargaHome.class);

        //**************** Check for WNI NIK1 *****************
        try {

          if (nik1.startsWith("A")) {
            nik1 = nik1.substring(1, 17);
            wnaHome = (BiodataWnaHome) data.lookup("BiodataWna", BiodataWnaHome.class);
            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik1));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWna.getNoKk()));
              ceraiObj.setSaksi1Record3(setSaksiRecord3(remoteWna, remoteData));
            }
            catch (Exception ex) {
              //System.out.println("NIK SUAMI WNA "+ nik1 +" TIDAK ADA");
              ceraiObj.setSaksi1Record3(null);
            }
          }
          else {
            remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                BiodataWniHome.class);
            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                  nik1));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWni.
                  getNoKk()));
              ceraiObj.setSaksi1Record(setSaksiRecord1(remoteWni, remoteData));
            }
            catch (Exception ex) {
              //System.out.println("NIK SUAMI "+ nik1 +" TIDAK ADA");
              ceraiObj.setSaksi1Record(null);
            }
          }
        }
        catch (Exception err) {
          err.printStackTrace();
        }

        try {
          if (nik2.startsWith("A")) {
            nik2 = nik2.substring(1, 17);
            if (wnaHome == null) {
              wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                  BiodataWnaHome.class);
            }
            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik2));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWna.
                  getNoKk()));
              ceraiObj.setSaksi2Record4(setSaksiRecord4(remoteWna, remoteData));
            }
            catch (Exception ex) {
              //System.out.println("NIK ISTRI WNA "+ nik2 +" TIDAK ADA");
              ceraiObj.setSaksi2Record4(null);
            }
          }
          else {
            if (remoteHome == null) {
              remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                  BiodataWniHome.class);
            }
            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                  nik2));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWni.
                  getNoKk()));
              ceraiObj.setSaksi2Record(setSaksiRecord2(remoteWni, remoteData));
            }
            catch (Exception ex) {
              //System.out.println("NIK ISTRI "+ nik2 +" TIDAK ADA");
              ceraiObj.setSaksi2Record(null);
            }
          }
        }
        catch (Exception err2) {
          err2.printStackTrace();
        }

        try {

          if (nik3 != null && !nik3.trim().startsWith("A")) {
            //System.out.println("pelapor WNI Enter");
            if (remoteHome == null) {
              remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                  BiodataWniHome.class);
            }
            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                  nik3));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteData.getNoKk()));
              ceraiObj.setPelaporWni(setKelahiranRecordPelaporWni(remoteWni, remoteData));
            }
            catch (Exception ex) {
              //System.out.println("NIK PELAPOR "+ nik3 +" TIDAK ADA");
              ceraiObj.setPelaporWni(null);
            }
          } else if (nik3 != null && nik3.trim().startsWith("A")) {
            //System.out.println("pelapor WNA Enter");
            nik3 = nik3.trim().substring(1);
            if (wnaHome == null) {
              wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                  BiodataWnaHome.class);
            }
            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik3));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWna.
                  getNoKk()));
              ceraiObj.setPelaporWna(setKelahiranRecordPelaporWna(remoteWna, remoteData));
            }
            catch (Exception ex) {
              //System.out.println("NIK ISTRI WNA "+ nik2 +" TIDAK ADA");
              ceraiObj.setPelaporWna(null);
            }
          }
        }
        catch (Exception n4) {
          n4.printStackTrace();
        }
      }
    }
    catch (Exception e) {
      ceraiObj = null;
      if (e instanceof CapilException) {
        throw (CapilException)e;
      }
      e.printStackTrace();
    }
    finally {

      try {
  if (cs != null) {
    cs.close();
  }
}
catch (Exception e) {
  e.printStackTrace();
}

      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e) {
        e.printStackTrace();
      }
    }
    return ceraiObj;
  }

  public String insertCerai(Vector v1) throws CapilException {
    String noAktaCerai = null;
    ServiceEntity wniFactory;
    CatatCerai remoteCatat = null;
    CatatCeraiHome homeCatat = null;

    Connection conn = null;
    CallableStatement cs = null;
    String returnval = null, no_prop, no_kab, no_akta_cerai_param;
    int statKawinIstri = 0;
    try {
      wniFactory = ServiceEntity.getInstance();
      String nikIstri = (v1.elementAt(9) == null ? "" :
                         v1.elementAt(9).toString());

      if (!"".equals(nikIstri)) {
        if (!nikIstri.startsWith("A")) {
          BiodataWniHome homeWni = (BiodataWniHome) wniFactory.lookup(
              "BiodataWni", BiodataWniHome.class);
          try {
            BiodataWni wni = homeWni.findByPrimaryKey(getTrimBigDecimalData(
                nikIstri));
            DataKeluargaHome home = (DataKeluargaHome) wniFactory.lookup(
                "DataKeluarga", DataKeluargaHome.class);
            statKawinIstri = getTrimBigDecimalData(setKelahiranRecordIbuWni(wni,
                                     home.findByPrimaryKey(
                                     getTrimBigDecimalData(wni.getNoKk()))).getStatKwn()).intValue();
          }
          catch (Exception ex) {
            ex.printStackTrace();

          }
        }
        else {
          BiodataWnaHome homeWna = (BiodataWnaHome) wniFactory.lookup(
              "BiodataWna", BiodataWnaHome.class);
          try {
            BiodataWna wna = homeWna.findByPrimaryKey(getTrimBigDecimalData(
                nikIstri));
            DataKeluargaHome home = (DataKeluargaHome) wniFactory.lookup(
                "DataKeluarga", DataKeluargaHome.class);
            statKawinIstri = getTrimBigDecimalData(setKelahiranRecordIbuWna(wna,
                home.findByPrimaryKey(
                getTrimBigDecimalData(wna.getNoKk()))).getStatKwn()).intValue();
            if (statKawinIstri==4) statKawinIstri = 0;

          }
          catch (Exception ex) {
            ex.printStackTrace();
            throw new CapilException("Status Istri masih cerai tidak bisa cerai lagi");
          }
        }
      }



      if (statKawinIstri>2) {
        throw new CapilException(
            "Status Istri masih cerai tidak bisa cerai lagi");
      }


      no_prop = getFmtCode(getTrimData(v1.elementAt(40)));
      no_kab = getFmtCode(getTrimData(v1.elementAt(41)));
      no_akta_cerai_param = no_prop + no_kab + "CPC";

      try {
        ConnectorDB connectorDb = new ConnectorDB();
        conn = connectorDb.getConnection();
        cs = conn.prepareCall("{? = call getnocri(?)}");
        cs.registerOutParameter(1, java.sql.Types.VARCHAR);
        cs.setString(2, no_akta_cerai_param);
        cs.execute();
        returnval = cs.getString(1);
        cs.close();
        conn.close();
        cs = null;
        conn = null;
        homeCatat = (CatatCeraiHome) wniFactory.lookup("CatatCerai",
            CatatCeraiHome.class);

        if (homeCatat != null) {
          remoteCatat = homeCatat.create(v1, returnval);
          noAktaCerai = remoteCatat.getNoAktaCrai();
          String noAktaKawin = remoteCatat.getNoAktaKwn();
          try{
            if (noAktaKawin != null && !noAktaKawin.trim().equals("")) {
              CatatKawinHome kawinHome = (CatatKawinHome) wniFactory.lookup(
                  "CatatKawin", CatatKawinHome.class);
              CatatKawin kawin = kawinHome.findByPrimaryKey(noAktaKawin);
              kawin.setCflag("Y");
            }
          }catch(Exception err)
          {

          }

        }
        else {
          noAktaCerai = null;
        }
      }
      catch (Exception err) {
        noAktaCerai = null;
        //System.out.println("Error from Facade Catat Cerai" + err.toString());
        err.printStackTrace();

      }
    }
    catch (Exception ex1) {
      if (ex1 instanceof CapilException)
        throw (CapilException)ex1;
        noAktaCerai = null;
        //System.out.println("Error from Facade Catat Cerai" + ex1.toString());
        ex1.printStackTrace();

      }
    return noAktaCerai;
}

  /*
        //added private function by Yopie
        private BigDecimal getTrimDataDecimal(BigDecimal trimdata)
        {
          if (trimdata!=null) return trimdata;
          return new BigDecimal("0");
        }
   */
  //end added private function by Yopie
  /*
         private boolean valueDecimalFinder(String data)
    {
      if ((data!=null) && (!data.trim().equals("0")) && (!data.trim().equals("null")) && (!data.trim().equals("")))
   return true;
      return false;
    }*/

  private int getJenisKelamin(String nik) {
    int jenisKelamin = 0;

    String temp = nik;
    if (temp !=null && temp.startsWith("A")) {
      temp = temp.substring(1);
      //System.out.println("[6,8]=" + temp.trim().substring(6, 8));
    }

    if (temp != null && !temp.trim().equals("")) {
      jenisKelamin = ( (Integer.parseInt(temp.substring(6, 8)) <= 31) ? 1 : 2);
    }
    return jenisKelamin;
  }
  public BioDataObj getDataIbu(String nik) {
    BioDataObj obj = getData(nik);
    BigDecimal nikIbu = obj.getNikIbu();
    if (nikIbu!=null && "".equals(nikIbu.toString().trim())) {
      return getData(nikIbu.toString());
    }
    return null;
  }
  public BioDataObj getDataAyah(String nik) {
    BioDataObj obj = getData(nik);
    BigDecimal nikAyah = obj.getNikAyah();
    if (nikAyah!=null && "".equals(nikAyah.toString().trim())) {
      return getData(nikAyah.toString());
    }
    return null;

  }

  private static String getTrimData(Object trimdata) {
    if ((trimdata != null) && !trimdata.toString().trim().equals("0")) {
      return trimdata.toString().trim();
    }
    return "";
  }

  private static String getTrimData(String val, Object trimdata) {
    if (trimdata != null) {
      if (trimdata.toString().length() == 1) {
        return trimdata.toString();
      }
      if (trimdata.toString().length() > 1) {
        return trimdata.toString().trim();
      }
    }
    return val;
  }

  private static BigDecimal getTrimBigDecimalData(Object trimdata) {
    try {
      if (trimdata != null && !trimdata.toString().equals("")) {
        //kalo ada value
        if (trimdata.toString().startsWith("A")) {
          return new BigDecimal(trimdata.toString().substring(1).trim());
        }
        return new BigDecimal(trimdata.toString().trim());
      }
      if (trimdata != null && trimdata.toString().equals("0")) {
        //kalo 0
        return null;
      }
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    //null ""
    return null;
  }

  private LahiObject setRecordBayiWni(CatatLahir remoteCatat, BiodataWni remoteWni) {
    return new LahiObject(remoteCatat.getNikBayi(),
                                       remoteCatat.getTmptDilhr(),
                                       remoteCatat.getPukulLhr(),
                                       remoteCatat.getWktPklLhr(),
                                       remoteCatat.getJenisKlahir(),
                                       remoteCatat.getAnakKeLahir(),
                                       remoteCatat.getPnlngBayi(),
                                       remoteCatat.getBrtBayi(),
                                       remoteCatat.getNikIbu(),
                                       remoteCatat.getNamaIbu(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglLhrIbu()),
                                       remoteCatat.getJenisPkrjnIbu(),
                                       remoteCatat.getAlamatIbu(),
                                       remoteCatat.getNoRtIbu(),
                                       remoteCatat.getNoRwIbu(),
                                       remoteCatat.getDusunIbu(),
                                       remoteCatat.getKodeposIbu(),
                                       remoteCatat.getTelpIbu(),
                                       remoteCatat.getNamaKelIbu(),
                                       remoteCatat.getNoKelIbu(),
                                       remoteCatat.getNoKecIbu(),
                                       remoteCatat.getNoKabIbu(),
                                       remoteCatat.getNoPropIbu(),
                                       remoteCatat.getKwrngrnIbu(),
                                       remoteCatat.getKetrunanIbu(),
                                       remoteCatat.getBangsaIbu(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglCttKwnIbu()),
                                       remoteCatat.getNikAyh(),
                                       remoteCatat.getNamaAyh(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglLhirAyh()),
                                       remoteCatat.getJenisPkrjnAyh(),
                                       remoteCatat.getAlamatAyh(),
                                       remoteCatat.getNoRtAyh(),
                                       remoteCatat.getNoRwAyh(),
                                       remoteCatat.getDusunAyh(),
                                       remoteCatat.getKodeposAyh(),
                                       remoteCatat.getTelpAyh(),
                                       remoteCatat.getNoKelAyh(),
                                       remoteCatat.getNoKecAyh(),
                                       remoteCatat.getNoKabAyh(),
                                       remoteCatat.getNoPropAyh(),
                                       remoteCatat.getKwrngrnAyh(),
                                       remoteCatat.getKetrunanAyh(),
                                       remoteCatat.getBangsaAyh(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglCttKwnAyh()),
                                       remoteCatat.getNikPlpor(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglMlpor()),
                                       remoteCatat.getNikSksi1(),
                                       remoteCatat.getNikSksi2(),
                                       remoteCatat.getJenisDftLhr(),
                                       remoteCatat.getDsrhkCttlhr(),
                                       remoteCatat.getPsyratanLhr(),
                                       remoteCatat.getNoAktaLahir(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglAktaLhr()),
                                       remoteCatat.getNamaKepDes(),
                                       remoteCatat.getNipLrh(),
                                       remoteCatat.getNamaPetReg(),
                                       remoteCatat.getNipPetReg(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglCtkKtakta()),
                                       remoteCatat.getNamaPetEntri(),
                                       remoteCatat.getNipPetEntri(),
                                       remoteCatat.getNoProp(),
                                       remoteCatat.getNoKab(),
                                       remoteCatat.getNoKec(),
                                       remoteCatat.getNoKel(),
                                       remoteCatat.getFlagKec(),
                                       DayFormatter.formatDate(remoteCatat.
              getTglEntri()),
                                       DayFormatter.formatDate(remoteCatat.
              getTglUpdation()),
                                       remoteCatat.getUserId(),
                                       remoteCatat.getCflag(),
                                       remoteCatat.getPflag(),
                                       remoteWni.getJenisKlmin(),
                                       DayFormatter.formatDate(remoteWni.
              getTglLhr()),
                                       remoteWni.getNamaLgkp(),
                                       remoteWni.getTmptLhr());

  }

  private LahiObject setRecordBayiWna(CatatLahir remoteCatat, BiodataWna remoteWna) {
    return new LahiObject(remoteCatat.getNikBayi(),
                          remoteCatat.getTmptDilhr(),
                          remoteCatat.getPukulLhr(),
                          remoteCatat.getWktPklLhr(),
                          remoteCatat.getJenisKlahir(),
                          remoteCatat.getAnakKeLahir(),
                          remoteCatat.getPnlngBayi(),
                          remoteCatat.getBrtBayi(),
                          remoteCatat.getNikIbu(),
                          remoteCatat.getNamaIbu(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglLhrIbu()),
                          remoteCatat.getJenisPkrjnIbu(),
                          remoteCatat.getAlamatIbu(),
                          remoteCatat.getNoRtIbu(),
                          remoteCatat.getNoRwIbu(),
                          remoteCatat.getDusunIbu(),
                          remoteCatat.getKodeposIbu(),
                          remoteCatat.getTelpIbu(),
                          remoteCatat.getNamaKelIbu(),
                          remoteCatat.getNoKelIbu(),
                          remoteCatat.getNoKecIbu(),
                          remoteCatat.getNoKabIbu(),
                          remoteCatat.getNoPropIbu(),
                          remoteCatat.getKwrngrnIbu(),
                          remoteCatat.getKetrunanIbu(),
                          remoteCatat.getBangsaIbu(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglCttKwnIbu()),
                          remoteCatat.getNikAyh(),
                          remoteCatat.getNamaAyh(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglLhirAyh()),
                          remoteCatat.getJenisPkrjnAyh(),
                          remoteCatat.getAlamatAyh(),
                          remoteCatat.getNoRtAyh(),
                          remoteCatat.getNoRwAyh(),
                          remoteCatat.getDusunAyh(),
                          remoteCatat.getKodeposAyh(),
                          remoteCatat.getTelpAyh(),
                          remoteCatat.getNoKelAyh(),
                          remoteCatat.getNoKecAyh(),
                          remoteCatat.getNoKabAyh(),
                          remoteCatat.getNoPropAyh(),
                          remoteCatat.getKwrngrnAyh(),
                          remoteCatat.getKetrunanAyh(),
                          remoteCatat.getBangsaAyh(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglCttKwnAyh()),
                          remoteCatat.getNikPlpor(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglMlpor()),
                          remoteCatat.getNikSksi1(),
                          remoteCatat.getNikSksi2(),
                          remoteCatat.getJenisDftLhr(),
                          remoteCatat.getDsrhkCttlhr(),
                          remoteCatat.getPsyratanLhr(),
                          remoteCatat.getNoAktaLahir(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglAktaLhr()),
                          remoteCatat.getNamaKepDes(),
                          remoteCatat.getNipLrh(),
                          remoteCatat.getNamaPetReg(),
                          remoteCatat.getNipPetReg(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglCtkKtakta()),
                          remoteCatat.getNamaPetEntri(),
                          remoteCatat.getNipPetEntri(),
                          remoteCatat.getNoProp(),
                          remoteCatat.getNoKab(),
                          remoteCatat.getNoKec(),
                          remoteCatat.getNoKel(),
                          remoteCatat.getFlagKec(),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglEntri()),
                          DayFormatter.formatDate(remoteCatat.
                                                  getTglUpdation()),
                          remoteCatat.getUserId(),
                          remoteCatat.getCflag(),
                          remoteCatat.getPflag(),
                          remoteWna.getJenisKlmin(),
                          DayFormatter.formatDate(remoteWna.
                                                  getTglLhr()),
                          remoteWna.getNamaPertma(),
                          remoteWna.getTmptLhr());
  }


  private PelaporNikData setRecordPelaporWni(DataKeluarga remoteData, BiodataWni remoteWni) {
    return new PelaporNikData(remoteWni.getNamaLgkp(),
                                          remoteWni.getJenisPkrjn(),
                                          DayFormatter.formatDate(remoteWni.getTglLhr()),
                                          remoteData.getAlamat(),
                                          remoteData.getDusun(),
                                          remoteData.getTelp(),
                                          remoteData.getNoRt(),
                                          remoteData.getNoRw(),
                                          remoteData.getKodePos());

  }

  private PelaporNikData setRecordPelaporWna(DataKeluarga remoteData, BiodataWna remoteWna) {
    return new PelaporNikData(remoteWna.getNamaPertma(),
                                          remoteWna.getJenisPkrjn(),
                                          DayFormatter.formatDate(remoteWna.
                  getTglLhr()),
                                          remoteData.getAlamat(),
                                          remoteData.getDusun(),
                                          remoteData.getTelp(),
                                          remoteData.getNoRt(),
                                          remoteData.getNoRw(),
                                          remoteData.getKodePos());

  }

  private Saksi1Object setSaksi1RecordWni(String nikSaksi1, BiodataWni remoteWni, DataKeluarga remoteData) {
    return new Saksi1Object(nikSaksi1.trim(), remoteWni.getNamaLgkp(),
                                         remoteWni.getTmptLhr(),
                                         DayFormatter.
                                         formatDate(remoteWni.getTglLhr()),
                                         remoteData.getAlamat(),
                                         remoteWni.getAgama(),
                                         remoteWni.getJenisPkrjn(),
                                         remoteData.getNoRt(),
                                         remoteData.getNoRw(),
                                         remoteData.getDusun(),
                                         remoteData.getKodePos(),
                                         remoteData.getTelp(), "1");

  }

  private Saksi1Object setSaksi1RecordWna(String nikSaksi1, BiodataWna remoteWna, DataKeluarga remoteData) {
    return new Saksi1Object(nikSaksi1.trim(),
                                           remoteWna.getNamaPertma(),
                                           remoteWna.getTmptLhr(),
                                           DayFormatter.
                                           formatDate(remoteWna.getTglLhr()),
                                           remoteData.getAlamat(),
                                           remoteWna.getAgama(),
                                           remoteWna.getJenisPkrjn(),
                                           remoteData.getNoRt(),
                                           remoteData.getNoRw(),
                                           remoteData.getDusun(),
                                           remoteData.getKodePos(),
                                           remoteData.getTelp(), "2");


  }

  private Saksi2Object setSaksi2RecordWni(String nikSaksi2, BiodataWni remoteWni, DataKeluarga remoteData) {
    return new Saksi2Object(nikSaksi2.trim(),
                                         remoteWni.getNamaLgkp(),
                                         remoteWni.getTmptLhr(),
                                         DayFormatter.
                                         formatDate(remoteWni.getTglLhr()),
                                         remoteData.getAlamat(),
                                         remoteWni.getAgama(),
                                         remoteWni.getJenisPkrjn(),
                                         remoteData.getNoRt(),
                                         remoteData.getNoRw(),
                                         remoteData.getDusun(),
                                         remoteData.getKodePos(),
                                         remoteData.getTelp(), "1");


  }

  private Saksi2Object setSaksi2RecordWna(String nikSaksi2, BiodataWna remoteWna, DataKeluarga remoteData) {
    return new Saksi2Object(nikSaksi2.trim(),
                                         remoteWna.getNamaPertma(),
                                         remoteWna.getTmptLhr(),
                                         DayFormatter.
                                         formatDate(remoteWna.getTglLhr()),
                                         remoteData.getAlamat(),
                                         remoteWna.getAgama(),
                                         remoteWna.getJenisPkrjn(),
                                         remoteData.getNoRt(),
                                         remoteData.getNoRw(),
                                         remoteData.getDusun(),
                                         remoteData.getKodePos(),
                                         remoteData.getTelp(), "2");

  }

  private BayiData setKelahiranRecordBayiWni(BiodataWni remoteWni, DataKeluarga remoteData) {
    BayiData bayi = new BayiData(remoteWni.getNik().toString(),
                        remoteWni.getNamaLgkp(),
                        remoteWni.getJenisKlmin().toString(),
                        remoteWni.getTmptLhr(),
                        DayFormatter.formatDate(remoteWni.getTglLhr()),
                        remoteWni.getNoProp().toString(),
                        remoteWni.getNoKab().toString(),
                        remoteWni.getNoKec().toString(),
                        remoteWni.getNoKel().toString(),
                        remoteData.getAlamat(),
                        remoteData.getNoRt().toString(),
                        getTrimData(remoteData.getNoRw()),
                        remoteWni.getAgama(),
                        remoteWni.getNoKk().toString(),
                        remoteWni.getStatKwn().toString(),
                        getTrimData(remoteWni.getPddkAkh()),
                        remoteWni.getJenisPkrjn().toString(),
                        remoteData.getDusun(),
                        getTrimData(remoteData.getKodePos()),
                        remoteData.getTelp());
    bayi.setKwrngra("INDONESIA");
    return bayi;
  }


  private BayiDataWna setKelahiranRecordBayiWna(BiodataWna remoteWna, DataKeluarga remoteData) {
    return new BayiDataWna(remoteWna.getNik().toString(),
                                      remoteWna.getJenisKlmin().toString(),
                                      remoteWna.getJenisPkrjn().toString(),
                                      remoteWna.getNoKk().toString(),
                                      remoteWna.getNoProp().toString(),
                                      remoteWna.getNoKab().toString(),
                                      remoteWna.getNoKec().toString(),
                                      remoteWna.getNoKel().toString(),
                                      DayFormatter.formatDate(remoteWna.getTglLhr()),
                                      remoteWna.getNamaPertma(),
                                      remoteWna.getTmptLhr(),
                                      remoteData.getAlamat(),
                                      remoteData.getDusun(), remoteData.getTelp(),
                                      remoteData.getNoRt().toString(),
                                      getTrimData(remoteData.getNoRw()),
                                      getTrimData(remoteWna.getKodepos()),
                                      remoteWna.getKwrngrn(),
                                      getTrimData(remoteWna.getPddkAkh()),
                                      remoteWna.getAgama(),
                                      getTrimData(remoteWna.getStatKwn()));


  }


  private IbuData setKelahiranRecordIbuWni(BiodataWni remoteWni, DataKeluarga remoteData) {
    return new IbuData(remoteWni.getNik().toString(),
                       remoteWni.getNamaLgkp(),
                       remoteWni.getJenisKlmin().toString(),
                       remoteData.getAlamat(),
                       remoteData.getNoRt().toString(),
                       getTrimData(remoteData.getNoRw()),
                       getTrimData(remoteData.getDusun()),
                       getTrimData(remoteData.getKodePos()),
                       getTrimData(remoteData.getTelp()),
                       DayFormatter.formatDate(remoteWni.
                                               getTglLhr()),
                       remoteWni.getStatKwn().toString(),
                       DayFormatter.formatDate(remoteWni.getTglKwn()),
                       remoteWni.getStatHbkel().toString(),
                       remoteWni.getJenisPkrjn().toString(),
                       remoteWni.getNoKk().toString(),
                       getNamaProp(remoteWni.getNoProp().toString()),
                       getNamaKab(remoteWni.getNoProp().toString(),
                                  remoteWni.getNoKab().toString()),
                       getNamaKec(remoteWni.getNoProp().toString(),
                                  remoteWni.getNoKab().toString(),
                                  remoteWni.getNoKec().toString()),
                       getNamaKel(remoteWni.getNoProp().toString(),
                                  getTrimData(remoteWni.getNoKab().toString()),
                                  remoteWni.getNoKec().toString(),
                                  remoteWni.getNoKel().toString()),
                       remoteWni.getAgama(), remoteWni.getTmptLhr());

  }

  private IbuDataWna setKelahiranRecordIbuWna(BiodataWna remoteWna, DataKeluarga remoteData) {
    //System.out.println("remoteWna.getNoKk()): " + remoteWna.getNoKk());
    //System.out.println("remoteData.getAlamat(): " +                       remoteData.getAlamat());
    //System.out.println("remoteData.getDusun(): " +                       remoteData.getDusun());
    //System.out.println("remoteData.getNoRt(): " + remoteData.getNoRt());
    //System.out.println("remoteData.getNoRw(): " + remoteData.getNoRw());
    //System.out.println("remoteData.getTelp(): " + remoteData.getTelp());
    //System.out.println("remoteData.getKodePos(): " +                       remoteData.getKodePos());
    //System.out.println("remoteWna.getAgama(): " + remoteWna.getAgama());

    return new IbuDataWna(remoteWna.getNik().toString(), "2",
                          remoteWna.getJenisPkrjn().toString(),
                          remoteWna.getNoKk().toString(),
                          getNamaProp(remoteWna.getNoProp().toString()),
                          getNamaKab(remoteWna.getNoProp().toString(),
                                     remoteWna.getNoKab().toString()),
                          getNamaKec(remoteWna.getNoProp().toString(),
                                     remoteWna.getNoKab().toString(),
                                     remoteWna.getNoKec().toString()),
                         getNamaKel(remoteWna.getNoProp().toString(),
                                    remoteWna.getNoKab().toString(),
                                    remoteWna.getNoKec().toString(),
                                    remoteWna.getNoKel().toString()),
                          DayFormatter.formatDate(remoteWna.getTglLhr()),
                          remoteWna.getNamaPertma(),
                          remoteWna.getTmptLhr(),
                          remoteData.getAlamat(),
                          getTrimData(remoteData.getDusun()),
                          getTrimData(remoteData.getTelp()),
                          remoteData.getNoRt().toString(),
                          getTrimData(remoteData.getNoRw()),
                          getTrimData(remoteData.getKodePos()),
                          remoteWna.getAgama(), remoteWna.getStatKwn().toString());
  }


  private AyahData setKelahiranRecordAyahWni(BiodataWni remoteWni, DataKeluarga remoteData) {
    return new AyahData(remoteData.getAlamat(),
                                         remoteData.getNoRt().toString(),
                                         getTrimData(remoteData.getNoRw()),
                                         getTrimData(remoteData.getDusun()),
                                         getTrimData(remoteData.getKodePos()),
                                         getTrimData(remoteData.getTelp()),
                                         remoteWni.getNik().toString(),
                                         getTrimData(remoteWni.getNamaLgkp()),
                                         getTrimData(remoteWni.getTmptLhr()),
                                         getTrimData(DayFormatter.formatDate(
                      remoteWni.getTglLhr())),
                                         remoteWni.getStatKwn().toString(),
                                         getTrimData(DayFormatter.formatDate(
                      remoteWni.getTglKwn())),
                                         remoteWni.getStatHbkel().toString(),
                                         remoteWni.getJenisPkrjn().toString(),
                                         remoteWni.getNoKk().toString(),
                                         getNamaProp(remoteWni.getNoProp().
                      toString()),
                                         getNamaKab(remoteWni.getNoProp().
                                                    toString(),
                                                    remoteWni.getNoKab().toString()),
                                         getNamaKec(remoteWni.getNoProp().
                                                    toString(),
                                                    remoteWni.getNoKab().toString(),
                                                    remoteWni.getNoKec().toString()),
                                         getNamaKel(remoteWni.getNoProp().
                                                    toString(),
                                                    remoteWni.getNoKab().toString(),
                                                    remoteWni.getNoKec().toString(),
                                                    remoteWni.getNoKel().toString()),
                                        remoteWni.getAgama());


  }

  private boolean isDataKelahiranExist(String nik1) {
    try {
       ServiceEntity factory = ServiceEntity.getInstance();
       CatatLahirHome catatLahirHome = (CatatLahirHome) factory.lookup(
           "CatatLahir", CatatLahirHome.class);
       //System.out.println("NIK BAYI =" + nik1);

       if (nik1!=null && nik1.startsWith("A")) {
         if (catatLahirHome.findByPrimaryKey(nik1.substring(1).trim()) != null) {
           //System.out.println("NIK BAYI SUDAH ADA!!!");
           return true;
         }

       } else {
         if (catatLahirHome.findByPrimaryKey(nik1.trim()) != null) {
           //System.out.println("NIK BAYI SUDAH ADA!!!");
           return true;
         }
       }
     }
     catch (NamingException ex) {
       ex.printStackTrace();
     }
     catch (Exception ex) {
     }
     return false;
  }

  private AyahDataWna setKelahiranRecordAyahWna(BiodataWna remoteWna, DataKeluarga remoteData) {
    //System.out.println("remoteWna.getNoProp()=" + remoteWna.getNoProp());
    //System.out.println("getNamaProp(remoteWna.getNoProp()))=" + getNamaProp(getTrimData("0",remoteWna.getNoProp())));
    //System.out.println("remoteWna.getNoKab()=" + remoteWna.getNoKab());
    //System.out.println("remoteWna.getNoKec()=" + remoteWna.getNoKec());
    //System.out.println("remoteWna.getNoKel()=" + remoteWna.getNoKel());

    return new AyahDataWna(remoteWna.getNik(), new BigDecimal("1"),
                           remoteWna.getJenisPkrjn(),
                           remoteWna.getNoKk(),
                           //modification
                           getNamaProp(remoteWna.getNoProp().toString()),
                           getNamaKab(remoteWna.getNoProp().toString(),
                           remoteWna.getNoKab().toString()),
                           getNamaKec(remoteWna.getNoProp().toString(),
                           remoteWna.getNoKab().toString(),
                           remoteWna.getNoKec().toString()),
                           getNamaKel(remoteWna.getNoProp().toString(),
                           remoteWna.getNoKab().toString(),
                           remoteWna.getNoKec().toString(),
                           remoteWna.getNoKel().toString()),
                           //end modification
                           getTrimData(DayFormatter.formatDate(remoteWna.getTglLhr())),
                           remoteWna.getNamaPertma(),
                           remoteWna.getTmptLhr(),
                           remoteData.getAlamat(),
                           getTrimData(remoteData.getDusun()),
                           getTrimData(remoteData.getTelp()),
                           remoteData.getNoRt(),
                           getTrimBigDecimalData(remoteData.getNoRw()),
                           getTrimBigDecimalData(remoteData.getKodePos()),
                           getTrimData(remoteWna.getAgama()));
  }

  private PelaporData setKelahiranRecordPelaporWni(BiodataWni remoteWni, DataKeluarga remoteData) {
    return new PelaporData(
                  remoteWni.getNik().toString(),
                  remoteWni.getNamaLgkp(),
                  DayFormatter.formatDate(remoteWni.getTglLhr()),
                  getTrimData(remoteWni.getJenisPkrjn()),
                  remoteData.getAlamat(), remoteData.getNoRt().toString(),
                  getTrimData(remoteData.getNoRw()),
                  getTrimData(remoteData.getDusun()),
                  getTrimData(remoteData.getKodePos()),
                  getTrimData(remoteData.getTelp()),
                  remoteWni.getNoProp().toString(),
                  remoteWni.getNoKab().toString(),
                  remoteWni.getNoKec().toString(),
                  remoteWni.getNoKel().toString(),
                   remoteWni.getAgama(), remoteWni.getTmptLhr());



  }

  private PelaporDataWna setKelahiranRecordPelaporWna(BiodataWna remoteWna, DataKeluarga remoteData) {
    //System.out.println("remoteWna.getNik()): " + getTrimData(remoteWna.getNik()));
    //System.out.println("remoteWna.getNamaPertma(): " + remoteWna.getNamaPertma());
    //System.out.println("DayFormatter.formatDate(remoteWna.getTglLhr()): " + DayFormatter.formatDate(remoteWna.getTglLhr()));
    //System.out.println("remoteWna.getJenisPkrjn()): " + getTrimData(remoteWna.getJenisPkrjn()));
    //System.out.println("remoteData.getAlamat(): " + remoteData.getAlamat());
    //System.out.println("remoteData.getNoRt()): " + getTrimData(remoteData.getNoRt()));
    //System.out.println("remoteData.getNoRw()): " + getTrimData(remoteData.getNoRw()));
    //System.out.println("remoteData.getKodePos()): " + remoteData.getKodePos());
    //System.out.println("remoteData.getTelp(): " + remoteData.getTelp());
    //System.out.println("remoteWna.getNoProp()): " + remoteWna.getNoProp());
    //System.out.println("remoteWna.getNoKab()): " + remoteWna.getNoKab());
    //System.out.println("remoteWna.getNoKec()): " + remoteWna.getNoKec());
    //System.out.println("remoteWna.getNoKel()): " + remoteWna.getNoKel());

     return new PelaporDataWna(
                     remoteWna.getNik().toString(),
                     remoteWna.getJenisKlmin().toString(),
                     remoteWna.getJenisPkrjn().toString(),
                     remoteWna.getNoKk().toString(),
                     getNamaProp(remoteWna.getNoProp().toString()),
                     getNamaKab(remoteWna.getNoProp().toString(),
                                remoteWna.getNoKab().toString()),
                     getNamaKec(remoteWna.getNoProp().toString(),
                                remoteWna.getNoKab().toString(),
                                remoteWna.getNoKec().toString()),
                     getNamaKel(remoteWna.getNoProp().toString(),
                                remoteWna.getNoKab().toString(),
                                remoteWna.getNoKec().toString(),
                                remoteWna.getNoKel().toString()),
                     DayFormatter.formatDate(remoteWna.getTglLhr()),
                     remoteWna.getNamaPertma(),
                     remoteWna.getTmptLhr(), remoteData.getAlamat(),
                     remoteData.getDusun(),
                     remoteData.getTelp(), remoteData.getNoRt().toString(),
                     getTrimData(remoteData.getNoRw()),
                     getTrimData(remoteData.getKodePos()),
                     remoteWna.getAgama());


  }

  private WniWnaObj getDataAnakOrangtuaDanPelapor(String nik1, String nik2, String nik3, String nik4) {

     if (nik1 != null && (nik1.trim().equals("") || nik1.trim().equals("0"))) {
       nik1 = null;
     }

     if (nik2 != null && (nik2.trim().equals("") || nik2.trim().equals("0"))) {
       nik2 = null;
     }

     if (nik3 != null && (nik3.trim().equals("") || nik3.trim().equals("0"))) {
       nik3 = null;
     }
     if (nik4 != null && (nik4.trim().equals("") || nik4.trim().equals("0"))) {
       nik4 = null;
     }


     BiodataWniHome remoteHome = null;
     BiodataWni remoteWni = null;
     BiodataWnaHome wnaHome = null;
     BiodataWna remoteWna = null;

     KelahiranObj kelahiranWni = null; KelahiranWnaObj kelahiranWna = null;
     try {
       ServiceEntity data = ServiceEntity.getInstance();
       DataKeluargaHome homeData = (DataKeluargaHome) data.lookup("DataKeluarga",
           DataKeluargaHome.class);
       DataKeluarga remoteData = null;
       //**************** Check for WNI NIK1 *****************
       kelahiranWni = new KelahiranObj();
       kelahiranWna = new KelahiranWnaObj();
       //bayi
       try {
         if (nik1 != null && !nik1.trim().startsWith("A")) {
           remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
               BiodataWniHome.class);
           //System.out.println("Nik Bayi WNI Enter");

           try {
             remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                 nik1));
             remoteData = homeData.findByPrimaryKey(remoteWni.getNoKk());
             kelahiranWni.setRecord1(setKelahiranRecordBayiWni(remoteWni,
                 remoteData));
           }
           catch (Exception ex1) {
             ex1.printStackTrace();
             //System.out.println("NIK BAYI " + nik1 + " TIDAK ADA");
             kelahiranWni.setRecord1(null);
           }
         }
         else if (nik1 != null && nik1.trim().startsWith("A")) {
           wnaHome = (BiodataWnaHome) data.lookup("BiodataWna", BiodataWnaHome.class);
           //System.out.println("Nilk Bayi WNA Enter");
           try {
             nik1 = nik1.trim().substring(1);
             remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik1));
             remoteData = homeData.findByPrimaryKey(remoteWna.getNoKk());
             kelahiranWna.setRecord1(setKelahiranRecordBayiWna(remoteWna,
                 remoteData));
           }
           catch (Exception ex1) {
             ex1.printStackTrace();
             //System.out.println("NIK BAYI WNA " + nik1 + " TIDAK ADA");
             kelahiranWna.setRecord1(null);
           }
         }
       }
       catch (Exception ex2) {
         ex2.printStackTrace();
         kelahiranWni.setRecord1(null);
         kelahiranWna.setRecord1(null);
       }
       //bayi

       //**************** Check for WNI NIK2 *****************
        //ibu
        try {
          if (nik2 != null && !nik2.trim().startsWith("A") &&
              getJenisKelamin(nik2) == 2) {
            //System.out.println("Nilk Ibu WNI Enter");
            if (remoteHome == null) {
              remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                  BiodataWniHome.class);
            }

            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                  nik2));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWni.getNoKk()));
              kelahiranWni.setRecord2(setKelahiranRecordIbuWni(remoteWni,
                  remoteData));
            }
            catch (Exception ex1) {
             ex1.printStackTrace();
              //System.out.println("NIK IBU " + nik2 + " TIDAK ADA");
              kelahiranWni.setRecord2(null);
            }
          }
          else if (nik2 != null && nik2.trim().startsWith("A") &&
                   getJenisKelamin(nik2) == 2) {
            //System.out.println("Nilk Ibu WNA Enter");
            nik2 = nik2.substring(1);
            //System.out.println("nik2: " + nik2);
            if (wnaHome == null) {
              wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                  BiodataWnaHome.class);
            }
            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik2));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWna.getNoKk()));
              kelahiranWna.setRecord2(setKelahiranRecordIbuWna(remoteWna,
                  remoteData));
            }
            catch (Exception ex1) {
             ex1.printStackTrace();
              //System.out.println("NIK IBU WNA " + nik2 + " TIDAK ADA");
              kelahiranWna.setRecord2(null);
            }
          }
          else {
            //System.out.println("NIK IBU " + nik2 + " SALAH");
          }
        }
        catch (Exception ex3) {
          kelahiranWni.setRecord2(null);
          kelahiranWna.setRecord2(null);
          ex3.printStackTrace();
        }
       //ibu

       //**************** Check for WNI NIK3 *****************
        //ayah

        try {

          if (nik3 != null && !nik3.trim().startsWith("A") &&
              getJenisKelamin(nik3) == 1) {
            //System.out.println("Nilk Ayah WNI Enter");
            if (remoteHome == null) {
              remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                  BiodataWniHome.class);
            }

            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(nik3));
              remoteData = homeData.findByPrimaryKey(getTrimBigDecimalData(
                  remoteWni.getNoKk()));
              kelahiranWni.setRecord3(setKelahiranRecordAyahWni(remoteWni,
                  remoteData));
            }
            catch (Exception ex1) {
             ex1.printStackTrace();
              //System.out.println("NIK AYAH " + nik3 + " TIDAK ADA");
              kelahiranWni.setRecord3(null);
            }
          }
          else if (nik3 != null && nik3.trim().startsWith("A") &&
                   getJenisKelamin(nik3) == 1) {
            //System.out.println("Nilk Ayah WNA Enter");
            nik3 = nik3.trim().substring(1);
            //System.out.println("nik3: " + nik3);
            if (wnaHome == null) {
              wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                  BiodataWnaHome.class);

            }

            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik3));
              remoteData = homeData.findByPrimaryKey(remoteWna.getNoKk());
              kelahiranWna.setRecord3(setKelahiranRecordAyahWna(remoteWna,
                  remoteData));
            }
            catch (Exception ex1) {
             ex1.printStackTrace();
              //System.out.println("NIK AYAH WNA " + nik3 + " TIDAK ADA");
              kelahiranWna.setRecord3(null);
            }
          }
          else {
            //System.out.println("NIK AYAH " + nik3 + " SALAH");
          }
        }
        catch (Exception ex3) {
          kelahiranWni.setRecord3(null);
          kelahiranWna.setRecord3(null);
          ex3.printStackTrace();
        }

       //**************** Check for WNI NIK4 *****************
        //pelapor

       try {
          if (nik4 != null && !nik4.trim().startsWith("A")) {
            //System.out.println("pelapor WNI Enter");
            if (remoteHome == null) {
              remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                  BiodataWniHome.class);
            }

            try {
              remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                  nik4));
              remoteData = homeData.findByPrimaryKey(remoteWni.getNoKk());
              kelahiranWni.setRecord4(setKelahiranRecordPelaporWni(remoteWni, remoteData));
            } catch (Exception ex1) {
             ex1.printStackTrace();
              //System.out.println("NIK PELAPOR "+ nik4 +" TIDAK ADA");
              kelahiranWni.setRecord4(null);
            }
          }
          else if (nik4 != null && nik4.trim().startsWith("A")) {
            //System.out.println("pelapor WNA Enter");
            nik4 = nik4.trim().substring(1);
            if (wnaHome == null) {
              wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                  BiodataWnaHome.class);

            }

            try {
              remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik4));
              remoteData = homeData.findByPrimaryKey(remoteWna.getNoKk());
              kelahiranWna.setRecord4(setKelahiranRecordPelaporWna(remoteWna,
                  remoteData));
            }
            catch (Exception ex1) {
             ex1.printStackTrace();
              //System.out.println("NIK PELAPOR WNA " + nik4 + " TIDAK ADA");
              kelahiranWna.setRecord4(null);
            }
          } else {
            //System.out.println("NIK PELAPOR " + nik4 + " SALAH");
          }
        }
        catch (Exception ex3) {
          kelahiranWni.setRecord4(null);
          kelahiranWna.setRecord4(null);
          ex3.printStackTrace();
        }

     }
     catch (Exception ex) {
       ex.printStackTrace();
       return null;
     }




          return new WniWnaObj(kelahiranWni, kelahiranWna);

   }



  private Saksi1Object3 setSaksiRecord3(BiodataWna remoteWna, DataKeluarga remoteData) {
    return new Saksi1Object3(remoteWna.getNamaPertma(),
                                        remoteWna.getAgama(),
                                        remoteWna.getJenisPkrjn(),
                                        DayFormatter.formatDate(remoteWna.
                getTglLhr()),
                                        remoteWna.getTmptLhr(),
                                        remoteData.getAlamat(),
                                        remoteData.getDusun(),
                                        remoteData.getTelp(),
                                        remoteData.getNoRt(),
                                        remoteData.getNoRw(),
                                        remoteData.getKodePos(),
                                        remoteData.getNoKk(),
                                        remoteWna.getPddkAkh(),
                                        remoteWna.getStatKwn(),
                                        "2");
  }

  private Saksi1Object setSaksiRecord1(BiodataWni remoteWni, DataKeluarga remoteData) {
    return new Saksi1Object(remoteWni.getNamaLgkp(),
                                        remoteWni.getAgama(),
                                        remoteWni.getJenisPkrjn(),
                                        DayFormatter.formatDate(remoteWni.
                  getTglLhr()),
                                        remoteWni.getTmptLhr(),
                                        remoteData.getAlamat(),
                                        remoteData.getDusun(),
                                        remoteData.getTelp(),
                                        remoteData.getNoRt(),
                                        remoteData.getNoRw(),
                                        remoteData.getKodePos(),
                                        remoteData.getNoKk(),
                                        remoteWni.getPddkAkh(),
                                        remoteWni.getStatKwn());

  }

  private Saksi2Object4 setSaksiRecord4(BiodataWna remoteWna, DataKeluarga remoteData) {
    return new Saksi2Object4(remoteWna.getNamaPertma(),
                                           remoteWna.getAgama(),
                                           remoteWna.getJenisPkrjn(),
                                           DayFormatter.formatDate(remoteWna.
                  getTglLhr()),
                                           remoteWna.getTmptLhr(),
                                           remoteData.getAlamat(),
                                           remoteData.getDusun(),
                                           remoteData.getTelp(),
                                           remoteData.getNoRt(),
                                           remoteData.getNoRw(),
                                           remoteData.getKodePos(),
                                           remoteData.getNoKk(),
                                           remoteWna.getPddkAkh(),
                                           remoteWna.getStatKwn(),
                                           "2");

  }

  private Saksi2Object setSaksiRecord2(BiodataWni remoteWni, DataKeluarga remoteData) {
    return new Saksi2Object(remoteWni.getNamaLgkp(),
                                       remoteWni.getAgama(),
                                       remoteWni.getJenisPkrjn(),
                                       DayFormatter.formatDate(remoteWni.
                getTglLhr()),
                                       remoteWni.getTmptLhr(),
                                       remoteData.getAlamat(),
                                       remoteData.getDusun(),
                                       remoteData.getTelp(),
                                       remoteData.getNoRt(),
                                       remoteData.getNoRw(),
                                       remoteData.getKodePos(),
                                       remoteData.getNoKk(),
                                       remoteWni.getPddkAkh(),
                                       remoteWni.getStatKwn());


  }

 private MatiObject setRecordJenazahWni(CatatMati remoteCatat, BiodataWni remoteWni, DataKeluarga remoteData) {
   return new MatiObject(getTrimBigDecimalData(remoteCatat.getNikJnsah()), remoteWni.getJenisPkrjn(),
                                         remoteCatat.getKwrngrnJnsah(),
                                         remoteCatat.getKtrunanJnsah(),
                                         remoteCatat.getAnakKe(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglMati()),
                                         remoteCatat.getPukul(),
                                         remoteCatat.getWktPukul(),
                                         remoteCatat.getSbabMati(),
                                         remoteCatat.getTmptMati(),
                                         remoteCatat.getYgMnerang(),
                                         remoteCatat.getPnetapPn(),
                                         remoteCatat.getNoPnetap(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglPnetap()),
                                         remoteCatat.getNikIbu(),
                                         remoteCatat.getKwrngrnIbu(),
                                         remoteCatat.getNamaLgkpIbu(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglLhrIbu()),
                                         remoteCatat.getJenisPkrjnIbu(),
                                         remoteCatat.getAlamatIbu(),
                                         remoteCatat.getNoRtIbu(),
                                         remoteCatat.getNoRwIbu(),
                                         remoteCatat.getDusunIbu(),
                                         remoteCatat.getKodeposIbu(),
                                         remoteCatat.getTelpIbu(),
                                         remoteCatat.getNoPropIbu(),
                                         remoteCatat.getNoKabIbu(),
                                         remoteCatat.getNoKecIbu(),
                                         remoteCatat.getNoKelIbu(),
                                         remoteCatat.getNikAyh(),
                                         remoteCatat.getKwrngrnAyh(),
                                         remoteCatat.getNamaLgkpAyh(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglLhrAyh()),
                                         remoteCatat.getJenisPkrjnAyh(),
                                         remoteCatat.getAlamatAyh(),
                                         remoteCatat.getNoRtAyh(),
                                         remoteCatat.getDusunAyh(),
                                         remoteCatat.getNoRwAyh(),
                                         remoteCatat.getKodeposAyh(),
                                         remoteCatat.getTelpAyh(),
                                         remoteCatat.getNoPropAyh(),
                                         remoteCatat.getNoKabAyh(),
                                         remoteCatat.getNoKecAyh(),
                                         remoteCatat.getNoKelAyh(),
                                         remoteCatat.getNikPlpor(),
                                         remoteCatat.getKwrngrnPlpor(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglMlpor()),
                                         remoteCatat.getNikSksi1(),
                                         remoteCatat.getKwrngrnSksi1(),
                                         remoteCatat.getNikSksi2(),
                                         remoteCatat.getKwrngrnSksi2(),
                                         remoteCatat.getJenisDftLhr(),
                                         remoteCatat.getDasarHkmMati(),
                                         remoteCatat.getPsyratanMt(),
                                         remoteCatat.getNoAktaMati(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglAktaMati()),
                                         remoteCatat.getNamaKepDes(),
                                         remoteCatat.getNipLrh(),
                                         remoteCatat.getNamaPetReg(),
                                         remoteCatat.getNipPetReg(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglCtkKtakta()),
                                         remoteCatat.getNamaPetEntri(),
                                         remoteCatat.getNipPetEntri(),
                                         remoteCatat.getNoProp(),
                                         remoteCatat.getNoKab(),
                                         remoteCatat.getNoKec(),
                                         remoteCatat.getNoKel(),
                                         remoteCatat.getFlagKec(),
                                         DayFormatter.formatDate(remoteCatat.
                getTglEntri()),
                                         DayFormatter.formatDate(remoteCatat.
                getTglUpdation()),
                                         remoteCatat.getUserId(),
                                         remoteCatat.getCflag(),
                                         remoteCatat.getPflag(),
                                         remoteWni.getJenisKlmin(),
                                         DayFormatter.formatDate(remoteWni.
                getTglLhr()),
                                         remoteWni.getNamaLgkp(),
                                         remoteWni.getTmptLhr(),
                                         remoteData.getAlamat(),
                                         remoteData.getDusun(),
                                         remoteData.getTelp(),
                                         remoteData.getNoRt(),
                                         remoteData.getNoRw(),
                                         remoteData.getKodePos(), null);

 }

 private MatiObject setRecordJenazahWna(CatatMati remoteCatat, BiodataWna remoteWna, DataKeluarga remoteData) {
   return new MatiObject(remoteCatat.getNikJnsah(), remoteWna.getJenisPkrjn(),
                  remoteCatat.getKwrngrnJnsah(),
                  remoteCatat.getKtrunanJnsah(),
                  remoteCatat.getAnakKe(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglMati()),
                  remoteCatat.getPukul(),
                  remoteCatat.getWktPukul(),
                  remoteCatat.getSbabMati(),
                  remoteCatat.getTmptMati(),
                  remoteCatat.getYgMnerang(),
                  remoteCatat.getPnetapPn(),
                  remoteCatat.getNoPnetap(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglPnetap()),
                  remoteCatat.getNikIbu(),
                  remoteCatat.getKwrngrnIbu(),
                  remoteCatat.getNamaLgkpIbu(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglLhrIbu()),
                  remoteCatat.getJenisPkrjnIbu(),
                  remoteCatat.getAlamatIbu(),
                  remoteCatat.getNoRtIbu(),
                  remoteCatat.getNoRwIbu(),
                  remoteCatat.getDusunIbu(),
                  remoteCatat.getKodeposIbu(),
                  remoteCatat.getTelpIbu(),
                  remoteCatat.getNoPropIbu(),
                  remoteCatat.getNoKabIbu(),
                  remoteCatat.getNoKecIbu(),
                  remoteCatat.getNoKelIbu(),
                  remoteCatat.getNikAyh(),
                  remoteCatat.getKwrngrnAyh(),
                  remoteCatat.getNamaLgkpAyh(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglLhrAyh()),
                  remoteCatat.getJenisPkrjnAyh(),
                  remoteCatat.getAlamatAyh(),
                  remoteCatat.getNoRtAyh(),
                  remoteCatat.getDusunAyh(),
                  remoteCatat.getNoRwAyh(),
                  remoteCatat.getKodeposAyh(),
                  remoteCatat.getTelpAyh(),
                  remoteCatat.getNoPropAyh(),
                  remoteCatat.getNoKabAyh(),
                  remoteCatat.getNoKecAyh(),
                  remoteCatat.getNoKelAyh(),
                  remoteCatat.getNikPlpor(),
                  remoteCatat.getKwrngrnPlpor(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglMlpor()),
                  remoteCatat.getNikSksi1(),
                  remoteCatat.getKwrngrnSksi1(),
                  remoteCatat.getNikSksi2(),
                  remoteCatat.getKwrngrnSksi2(),
                  remoteCatat.getJenisDftLhr(),
                  remoteCatat.getDasarHkmMati(),
                  remoteCatat.getPsyratanMt(),
                  remoteCatat.getNoAktaMati(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglAktaMati()),
                  remoteCatat.getNamaKepDes(),
                  remoteCatat.getNipLrh(),
                  remoteCatat.getNamaPetReg(),
                  remoteCatat.getNipPetReg(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglCtkKtakta()),
                  remoteCatat.getNamaPetEntri(),
                  remoteCatat.getNipPetEntri(),
                  remoteCatat.getNoProp(),
                  remoteCatat.getNoKab(),
                  remoteCatat.getNoKec(),
                  remoteCatat.getNoKel(),
                  remoteCatat.getFlagKec(),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglEntri()),
                  DayFormatter.formatDate(remoteCatat.
                                          getTglUpdation()),
                  remoteCatat.getUserId(),
                  remoteCatat.getCflag(),
                  remoteCatat.getPflag(),
                  remoteWna.getJenisKlmin(),
                  DayFormatter.formatDate(remoteWna.
                                          getTglLhr()),
                  remoteWna.getNamaPertma(),
                  remoteWna.getTmptLhr(),
                  remoteData.getAlamat(),
                  remoteData.getDusun(),
                  remoteData.getTelp(),
                  remoteData.getNoRt(),
                  remoteData.getNoRw(),
                  remoteData.getKodePos(),
                  remoteWna.getKwrngrn());
 }


 private PelaporNikMatiData setRecordPelaporKematianWna(BiodataWna remoteWna, DataKeluarga remoteData) {
   return new PelaporNikMatiData(remoteWna.getNamaPertma(),
                                 remoteWna.getJenisPkrjn(),
                                 DayFormatter.formatDate(remoteWna.getTglLhr()),
                                 remoteData.getAlamat(),
                                 remoteData.getDusun(),
                                 remoteData.getTelp(),
                                 remoteData.getNoRt(),
                                 remoteData.getNoRw(),
                                 remoteData.getKodePos());
 }

 private PelaporNikMatiData setRecordPelaporKematianWni(BiodataWni remoteWni, DataKeluarga remoteData) {
   return new PelaporNikMatiData(remoteWni.getNamaLgkp(),
                                               remoteWni.getJenisPkrjn(),
                                               DayFormatter.formatDate(remoteWni.
                   getTglLhr()),
                                               remoteData.getAlamat(),
                                               remoteData.getDusun(),
                                               remoteData.getTelp(),
                                               remoteData.getNoRt(),
                                               remoteData.getNoRw(),
                                               remoteData.getKodePos());

 }

 private int getStatusKawin(String nik) {
    if (nik != null && (nik.trim().equals("") || nik.trim().equals("0"))) {
      nik = null;
    }

    BiodataWniHome remoteHome = null;
    BiodataWni remoteWni = null;
    BiodataWnaHome wnaHome = null;
    BiodataWna remoteWna = null;
    try {
      ServiceEntity data = ServiceEntity.getInstance();
       //ibu
       try {
         //System.out.println("getJenisKelamin(nik2)=" + getJenisKelamin(nik));
         if (nik != null && !nik.trim().startsWith("A") &&
             getJenisKelamin(nik) == 2) {
           if (remoteHome == null) {
             remoteHome = (BiodataWniHome) data.lookup("BiodataWni",
                 BiodataWniHome.class);
           }

           try {
             remoteWni = remoteHome.findByPrimaryKey(getTrimBigDecimalData(
                 nik));
             return remoteWni.getStatKwn().intValue();
           }
           catch (Exception ex1) {
            ex1.printStackTrace();
             //System.out.println("NIK " + nik + " TIDAK ADA");
           }
         }
         else if (nik != null && nik.trim().startsWith("A") &&
                  getJenisKelamin(nik) == 2) {
           nik = nik.substring(1);
           if (wnaHome == null) {
             wnaHome = (BiodataWnaHome) data.lookup("BiodataWna",
                 BiodataWnaHome.class);
           }
           try {
             remoteWna = wnaHome.findByPrimaryKey(getTrimBigDecimalData(nik));
             int stat = remoteWna.getStatKwn().intValue();
             if (stat==1) stat=2;
             else if (stat==2) stat=1;
             return stat;
           }
           catch (Exception ex1) {
            ex1.printStackTrace();
             //System.out.println("NIK WNA " + nik + " TIDAK ADA");
           }
         }
         else {
           //System.out.println("NIK  " + nik + " SALAH");
         }
       }
       catch (Exception ex3) {
         ex3.printStackTrace();
       }
      //ibu
    } catch (Exception ex) {
      ex.printStackTrace();
    }
    return 0;


 }
  public BioSiak getBioPdk(String nik) {
    BioSiak record = null;
   Connection conn = null;
   PreparedStatement st = null;
   ResultSet rs = null;

  String sql = "SELECT  TO_CHAR(a.nik,'0000000000000000') NIK,a.NO_KTP,nvl(a.TMPT_SBL,'-') TMPT_SBL, nvl(a.NO_PASPOR,'-') NO_PASPOR,nvl(to_char(a.TGL_AKH_PASPOR,'dd-mm-yyyy'),'-') TGL_AKH_PASPOR,a.NAMA_LGKP,a.JENIS_KLMIN," +
       " nvl(a.TMPT_LHR,'-') TMPT_LHR, nvl(to_char(a.TGL_LHR,'dd-mm-yyyy'),'-') TGL_LHR ,a.AKTA_LHR,nvl(a.NO_AKTA_LHR,'-') NO_AKTA_LHR, a.GOL_DRH,a.AGAMA,a.STAT_KWN," +
       " a.AKTA_KWN,nvl(a.NO_AKTA_KWN,'-') NO_AKTA_KWN,nvl(to_char(a.TGL_KWN,'dd-mm-yyyy'),'-') TGL_KWN, a.AKTA_CRAI,nvl(a.NO_AKTA_CRAI,'-') NO_AKTA_CRAI, nvl(to_char(a.TGL_CRAI,'dd-mm-yyyy'),'-') TGL_CRAI," +
       " a.STAT_HBKEL,a.KLAIN_FSK,a.PNYDNG_CCT,a.PDDK_AKH,a.JENIS_PKRJN,NVL(TO_CHAR(a.NIK_IBU),' ') NIK_IBU, " +
       " a.NAMA_LGKP_IBU,nvl(to_char(a.NIK_AYAH),' ') NIK_AYAH, a.NAMA_LGKP_AYAH,a.NAMA_KET_RT,a.NAMA_KET_RW," +
       " a.NAMA_PET_REG,nvl(to_char(a.NIP_PET_REG),' ') NIP_PET_REG, a.NAMA_PET_ENTRI,a.NIP_PET_ENTRI,to_char(a.TGL_ENTRI,'dd-mm-yyyy') TGL_ENTRI," +
       " to_char(a.NO_KK,'0000000000000000') NO_KK,a.NO_PROP,a.NO_KAB,a.NO_KEC,a.NO_KEL,getNamaProp(a.NO_PROP) nama_prop,getNamaKab(a.NO_PROP,a.NO_KAB) nama_kab,getNamaKec(a.NO_PROP,a.NO_KAB,a.NO_KEC) nama_kec,getNamaKel(a.NO_PROP,a.NO_KAB,a.NO_KEC,a.NO_KEL) nama_kel" +
       " b.NAMA_KEP,b.ALMT_T alamat,b.RT_T no_rt,b.RW_T no_rw,NVL(b.DUSUN_T,'-') dusun," +
       " DECODE(b.KODE_POS_T,NULL,' ',0,' ',b.kode_pos_T) KODE_POS, a.cflag, " +
       " NVL(b.TELP_T,'-') TELP FROM  BIODATA_WNI a, TABLE(Getalmtpivot(a.NO_KK)) b " +
       " where a.nik="+ nik;

//sql baru
   sql= "select NIK, PDDKN, PDDKN_LAMA, GELAR_DPN, GELAR_BLK, GELAR_TMPL," +
   "IJAZAH_NO, TO_CHAR(IJAZAH_TGL) IJAZAH_TGL, IJAZAH_INS, IJAZAH_TTD, PTG_NAMA, PTG_NIP," +
   "ENTRI_NAMA, ENTRI_NIP, TO_CHAR(ENTRI_DATE) ENTRI_DATE from bwni_pddk where nik=" + nik + "";

//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found

  try {
     ConnectorDB connectorDb = new ConnectorDB();
     conn = connectorDb.getConnection();
     st = conn.prepareStatement(sql);
     rs=st.executeQuery();

  if  (rs.next())
       {
                  record = new BioSiak(rs.getString("NIK"),
              rs.getString("PDDKN"),
              rs.getString("PDDKN_LAMA"),
              rs.getString("GELAR_DPN"),
              rs.getString("GELAR_BLK"),
              rs.getString("GELAR_TMPL"),
              rs.getString("IJAZAH_NO"),
              rs.getString("IJAZAH_TGL"),
              rs.getString("IJAZAH_INS"),
              rs.getString("IJAZAH_TTD"),
              rs.getString("PTG_NAMA"),
              rs.getString("PTG_NIP"),
              rs.getString("ENTRI_NAMA"),
              rs.getString("ENTRI_NIP"),
              rs.getString("ENTRI_DATE"));

              record.setAcknowldge("N");

       }
       else {
         record = new BioSiak();
         record.setAcknowldge("F");
       }
       rs.close();
       st.close();
       conn.close();
   }catch(Exception ex)
   {
     //siakWriter.writeFile(ex);
      ex.printStackTrace();
      record=new BioSiak();
      record.setAcknowldge("E");
   }

  finally {
     try {
       if (rs != null) {
         rs.close();
       }
     }
     catch (Exception e1) {}

     try {
       if (st != null) {
         st.close();
       }
     }
     catch (Exception e3) {}

     try {
       if (conn != null) {
         conn.close();
       }
     }
     catch (Exception e4) {}
   }

  return record;

  }
  public void insert_pdkn(Vector v) {
    boolean b = false;
    ServiceEntity updateWni = null;
    BiodataWni updateRemote = null;
    BiodataWniHome updateHome = null;
    String tgl1 = "", tgl2 = "", tgl3 = "",tgl4="";
    DataKeluarga remote = null;
    DataKeluargaHome home = null;
    String sysDate = null;
    Connection conn = null;
    CallableStatement cs = null;

    //sysDate = getTrimData(v.elementAt(39));
    try{
        ConnectorDB connectorDb = new ConnectorDB();
        conn = connectorDb.getConnection();
        cs = conn.prepareCall("{? = call INS_BWNI_PDKN(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        //cs.registerOutParameter(1, java.sql.Types.VARCHAR);
        cs.registerOutParameter(1, java.sql.Types.NUMERIC);
        System.out.println("==============================");
        System.out.println("=======insert pdkn ejb========");
        System.out.println("==============================");
        System.out.println(getTrimData(v.elementAt(0)));
        System.out.println(getTrimData(v.elementAt(1)));
        System.out.println(getTrimData(v.elementAt(2)));
        System.out.println(getTrimData(v.elementAt(3)));
        System.out.println(getTrimData(v.elementAt(4)));
        System.out.println(getTrimData(v.elementAt(5)));
        System.out.println(getTrimData(v.elementAt(6)));
        System.out.println(getTrimData(v.elementAt(7)));
        String deIjazah_tgl="";
        String deIjazah_tglDD="";
        String deIjazah_tglMM="";
        String deIjazah_tglYYYY="";
        String deGelar_tmpl="";
        deIjazah_tglDD=getTrimData(v.elementAt(7));
        deIjazah_tglMM=getTrimData(v.elementAt(8));
        deIjazah_tglYYYY=getTrimData(v.elementAt(9));
        if (deIjazah_tglDD.length()==1){
          deIjazah_tglDD="0"+deIjazah_tglDD;
        }
        if (deIjazah_tglMM.length()==1){
          deIjazah_tglMM="0"+deIjazah_tglMM;
        }
        if (deIjazah_tglYYYY.length()==2){
          deIjazah_tglYYYY="00"+deIjazah_tglYYYY;
        }
        deIjazah_tgl = deIjazah_tglDD+"/"+deIjazah_tglMM+"/"+deIjazah_tglYYYY;
        System.out.println("Tanggal Ijazah"+deIjazah_tgl);
        deGelar_tmpl = getTrimData(v.elementAt(5));
        if (deGelar_tmpl.trim().equals("T")) {
          deGelar_tmpl="0";
        }
        else {
          deGelar_tmpl="1";
        }

        //cs.setString(2,getTrimData(v.elementAt(0)));
        String deNik=getTrimData(v.elementAt(0));
        int nuNik=0;
        //nuNik = Integer.parseInt(deNik);
        //cs.setInt(2,9999999);
        //untuk Nik
        cs.setString(2,getTrimData(v.elementAt(0)));
        cs.setString(3,getTrimData(v.elementAt(1)));
        //cs.setInt(3,9);
        System.out.println("3 -- " + getTrimData(v.elementAt(1)));
        cs.setString(4,getTrimData(v.elementAt(2)));
        //cs.setInt(4,9);
        System.out.println("3 -- " + getTrimData(v.elementAt(2)));
        cs.setString(5,getTrimData(v.elementAt(3)));
        cs.setString(6,getTrimData(v.elementAt(4)));
        cs.setString(7,deGelar_tmpl);
        //cs.setInt(7,1);
        cs.setString(8,getTrimData(v.elementAt(6)));
        cs.setString(9,deIjazah_tgl);
        //cs.setString(9,null); //ijazah tanggal
        cs.setString(10,getTrimData(v.elementAt(10)));
        cs.setString(11,getTrimData(v.elementAt(11)));
        cs.setString(12,getTrimData(v.elementAt(12)));
        cs.setString(13,getTrimData(v.elementAt(13)));
        cs.setString(14,null);
        cs.setInt(15,999999999);
        cs.setString(16,null);
        cs.execute();
        //returnval1 = cs.getString(1); //Returned NIK
      }catch(Exception nikerr)
      {
        nikerr.printStackTrace();
      }

  }
  public BioSiak getBioPkjrn(String nik) {
    BioSiak record = null;
   Connection conn = null;
   PreparedStatement st = null;
   ResultSet rs = null;

//sql baru
   String sql= "SELECT NIK, PKRJN, PKRJN_LAMA, SK_NO, TO_CHAR(SK_TGL,'dd/mm/yyyy') SK_TGL, SK_INS, SK_TTD," +
       "PTG_NAMA, PTG_NIP, ENTRI_NAMA, ENTRI_NIP, TO_CHAR(ENTRI_DATE, 'dd/mm/yyyy')ENTRI_DATE " +
       "FROM BWNI_PKRJN where nik = " + nik + "";

//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found

  try {
     ConnectorDB connectorDb = new ConnectorDB();
     conn = connectorDb.getConnection();
     st = conn.prepareStatement(sql);
     rs=st.executeQuery();

  if  (rs.next())
       {
                  record = new BioSiak(rs.getString("NIK"),
              rs.getString("PKRJN"),
              rs.getString("PKRJN_LAMA"),
              rs.getString("SK_NO"),
              rs.getString("SK_TGL"),
              rs.getString("SK_INS"),
              rs.getString("SK_TTD"),
              rs.getString("PTG_NAMA"),
              rs.getString("PTG_NIP"),
              rs.getString("ENTRI_NAMA"),
              rs.getString("ENTRI_NIP"),
              rs.getString("ENTRI_DATE"));

              record.setAcknowldge("N");

       }
       else {
         record = new BioSiak();
         record.setAcknowldge("F");
       }
       rs.close();
       st.close();
       conn.close();
   }catch(Exception ex)
   {
     //siakWriter.writeFile(ex);
      ex.printStackTrace();
      record=new BioSiak();
      record.setAcknowldge("E");
   }

  finally {
     try {
       if (rs != null) {
         rs.close();
       }
     }
     catch (Exception e1) {}

     try {
       if (st != null) {
         st.close();
       }
     }
     catch (Exception e3) {}

     try {
       if (conn != null) {
         conn.close();
       }
     }
     catch (Exception e4) {}
   }

  return record;

  }
  public void insert_pkrjn(Vector v) {
    boolean b = false;
   ServiceEntity updateWni = null;
   BiodataWni updateRemote = null;
   BiodataWniHome updateHome = null;
   String tgl1 = "", tgl2 = "", tgl3 = "",tgl4="";
   DataKeluarga remote = null;
   DataKeluargaHome home = null;
   String sysDate = null;
   Connection connde = null;
   CallableStatement csde = null;

   //sysDate = getTrimData(v.elementAt(39));
   try{
       ConnectorDB connectorDb = new ConnectorDB();
       connde = connectorDb.getConnection();
       csde = connde.prepareCall("{call INS_BWNI_PKRJN(?,?,?,?,?,?,?,?,?,?,?,?)}");
       //cs.registerOutParameter(1, java.sql.Types.VARCHAR);
       //csde.registerOutParameter(1, java.sql.Types.NUMERIC);
       System.out.println("==============================");
       System.out.println("=======insert pkrjn ejb========");
       System.out.println("==============================");

       String deSK_tgl="";
       String deSK_tglDD="";
       String deSK_tglMM="";
       String deSK_tglYYYY="";
       String deGelar_tmpl="";
       deSK_tglDD=getTrimData(v.elementAt(4));
       deSK_tglMM=getTrimData(v.elementAt(5));
       deSK_tglYYYY=getTrimData(v.elementAt(6));
       if (deSK_tglDD.length()==1){
         deSK_tglDD="0"+deSK_tglDD;
       }
       if (deSK_tglMM.length()==1){
         deSK_tglMM="0"+deSK_tglMM;
       }
       if (deSK_tglYYYY.length()==2){
         deSK_tglYYYY="00"+deSK_tglYYYY;
       }
       deSK_tgl = deSK_tglDD+"/"+deSK_tglMM+"/"+deSK_tglYYYY;
       System.out.println("Tanggal SK "+deSK_tgl);

       //cs.setString(2,getTrimData(v.elementAt(0)));
       String deNik=getTrimData(v.elementAt(0));
       int nuNik=0;
       //untuk Nik
       csde.setString(1,getTrimData(v.elementAt(0)));
       System.out.println("1 nik "+getTrimData(v.elementAt(0)));
       csde.setString(2,getTrimData(v.elementAt(1)));
       System.out.println("2 pkrjn "+getTrimData(v.elementAt(1)));
       csde.setString(3,getTrimData(v.elementAt(2)));
       System.out.println("3 pkrjn lama "+getTrimData(v.elementAt(2)));
       csde.setString(4,getTrimData(v.elementAt(3)));
       System.out.println("4 sk_no "+getTrimData(v.elementAt(3)));
       //sk_tgl deSK_tgl
       csde.setString(5,deSK_tgl);
       //cs.setString(7,sk_ins);
       csde.setString(6,getTrimData(v.elementAt(7)));
       csde.setString(7,getTrimData(v.elementAt(8)));
       System.out.println("sk ins"+getTrimData(v.elementAt(7)));
       System.out.println("sk ttd"+getTrimData(v.elementAt(8)));
       //cs.setString(9,"'"+deIjazah_tgl+"'");
       csde.setString(8,getTrimData(v.elementAt(9))); //pet nama
       csde.setString(9,getTrimData(v.elementAt(10)));
       System.out.println("1 ptg nama "+getTrimData(v.elementAt(9)));
       System.out.println("1 ptg nip "+getTrimData(v.elementAt(10)));
       csde.setString(10,"DATA");
       csde.setString(11,"999999999");
       csde.setString(12,"01/01/2005");
       csde.execute();
       //String returnval1 = csde.getString(1); //Returned NIK
       //System.out.println("Hasil "+returnval1);
     }catch(Exception nikerr)
     {
       nikerr.printStackTrace();
     }
     finally {


     try {
       if (connde != null) {
         connde.close();
       }
     }
     catch (Exception e4) {}
   }


  }
}
