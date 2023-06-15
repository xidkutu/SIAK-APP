package viewbiodata;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;

import siaktools.logwriter.SiakWriter;

import biodata.*;

public class ViewCetakBiodataBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  private String nik="",nama_lgkp="",tmpt_lhr="",tgl_lhr="",jenis_klmin="",gol_drh="",agama="",
      pddk_akh="",jenis_pkrjn="",pnydng_cct="",stat_kwn="",stat_hbkel="",nik_ibu="",
      nama_lgkp_ibu="",nik_ayah="",nama_lgkp_ayah="",tmpt_sbl="",alamat="",no_kk="",
      no_paspor="",tgl_akh_paspor="",no_akta_lhr="",no_akta_kwn="",tgl_kwn="",
      no_akta_cerai="",tgl_cerai="",systgl="",nip_pej="",nama_pej="";
  private String no_rt="",no_rw="", dusun="",kode_pos="",telp="",nama_prop="",nama_kab="",nama_kec="",nama_kel="";
  private String no_ktp="";

  public Vector retrieveData(Vector vNik) throws RemoteException
  {
   Vector vData = new Vector();
   Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs=null ;
    Statement stmt = null;
    String query = "";
    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      for(int i=0;i<vNik.size();i++)
      {
        /* query = "SELECT * FROM VW_INDIVIDU_WNI WHERE NIK=" +
            vNik.elementAt(i).toString().trim(); */
        query="SELECT /*+ ORDERED INDEX (a SYS_C003713) INDEX (b IDXALAMATKK) USE_NL (b)*/";
query=query+"     a.nik, UPPER (a.nama_lgkp) nama_lgkp,";
query=query+"            UPPER (a.tmpt_lhr) tmpt_lhr, TO_CHAR (a.tgl_lhr, 'dd-mm-yyyy') tgl_lhr,";
query=query+"            DECODE (a.jenis_klmin, 1, 'LAKI-LAKI', 2, 'PEREMPUAN') jenis_klmin,";
query=query+"            DECODE (a.gol_drh,";
query=query+"                    1, 'A',";
query=query+"                    2, 'B',";
query=query+"                    3, 'AB',";
query=query+"                    4, 'O',";
query=query+"                    5, 'A+',";
query=query+"                    6, 'A',";
query=query+"                    7, 'B+',";
query=query+"                    8, 'B-',";
query=query+"                    9, 'AB+',";
query=query+"                    10, 'AB-',";
query=query+"                    11, 'O+',";
query=query+"                    12, 'O-'";
query=query+"                   ) gol_drh,";
query=query+"            UPPER (a.agama) agama,";
query=query+"            DECODE (a.pddk_akh,";
query=query+"                    1, 'TIDAK/BELUM SEKOLAH',";
query=query+"                    2, 'TIDAK TAMAT SD/SEDERAJAT',";
query=query+"                    3, 'TAMAT SD/SEDERAJAT',";
query=query+"                    4, 'SLTP/SEDERAJAT',";
query=query+"                    5, 'SLTA/SEDERAJAT',";
query=query+"                    6, 'DIPLOMA I/II',";
query=query+"                    7, 'AKADEMI/DIPLOMA III/S. MUDA',";
query=query+"                    8, 'DIPLOMA IV/STRATA I',";
query=query+"                    9, 'STRATA II',";
query=query+"                    10, 'STRATA III'";
query=query+"                   ) pddk_akh,";
query=query+"            UPPER (siakoff.getpkrjn (a.jenis_pkrjn)) jenis_pkrjn,";
query=query+"            DECODE (a.pnydng_cct,";
query=query+"                    1, 'CACAT FISIK',";
query=query+"                    2, 'CACAT NETRA',";
query=query+"                    3, 'CACAT RUNGU/WICARA',";
query=query+"                    4, 'CACAT MENTAL/JIWA',";
query=query+"                    5, 'CACAT FISIK DAN MENTAL',";
query=query+"                    6, 'CACAT LAINNYA'";
query=query+"                   ) pnydng_cct,";
query=query+"            DECODE (a.stat_kwn,";
query=query+"                    1, 'BELUM KAWIN',";
query=query+"                    2, 'KAWIN',";
query=query+"                    3, 'CERAI HIDUP',";
query=query+"                    4, 'CERAI MATI'";
query=query+"                   ) stat_kwn,";
query=query+"            DECODE (a.stat_hbkel,";
query=query+"                    1, 'KEPALA KELUARGA',";
query=query+"                    2, 'SUAMI',";
query=query+"                    3, 'ISTRI',";
query=query+"                    4, 'ANAK',";
query=query+"                    5, 'MENANTU',";
query=query+"                    6, 'CUCU',";
query=query+"                    7, 'ORANGTUA',";
query=query+"                    8, 'MERTUA',";
query=query+"                    9, 'FAMILI LAIN',";
query=query+"                    10, 'PEMBANTU',";
query=query+"                    11, 'LAINNYA'";
query=query+"                   ) stat_hbkel,";
query=query+"            DECODE (a.nik_ibu,";
query=query+"                    '0', '-',";
query=query+"                    NULL, '-',";
query=query+"                    TO_CHAR (a.nik_ibu, '0000000000000000')";
query=query+"                   ) nik_ibu,";
query=query+"            UPPER (a.nama_lgkp_ibu) nama_lgkp_ibu,";
query=query+"            DECODE (a.nik_ayah,";
query=query+"                    '0', '-',";
query=query+"                    NULL, '-',";
query=query+"                    TO_CHAR (a.nik_ayah, '0000000000000000')";
query=query+"                   ) nik_ayah,";
query=query+"            UPPER (a.nama_lgkp_ayah) nama_lgkp_ayah,";
query=query+"            UPPER (NVL (a.tmpt_sbl, '-')) tmpt_sbl, UPPER (b.alamat) alamat,";
query=query+"            DECODE (b.no_rt,";
query=query+"                    NULL, '-',";
query=query+"                    0, '-',";
query=query+"                    TRIM (TO_CHAR (b.no_rt, '000'))";
query=query+"                   ) no_rt,";
query=query+"            DECODE (b.no_rw,";
query=query+"                    NULL, '-',";
query=query+"                    0, '-',";
query=query+"                    TRIM (TO_CHAR (b.no_rw, '000'))";

query=query+"                   ) no_rw,";
query=query+"            NVL (b.dusun, '-') dusun,";
query=query+"            DECODE (b.kode_pos, NULL, '-', 0, '-', b.kode_pos) kode_pos,";
query=query+"            NVL (b.telp, '-') telp,";
query=query+"            UPPER (siakoff.getnamaprop (a.no_prop)) nama_prop,";
query=query+"            UPPER (siakoff.getnamakab (a.no_kab, a.no_prop)) nama_kab,";
query=query+"            UPPER (siakoff.getnamakec (a.no_kec, a.no_kab, a.no_prop)) nama_kec,";
query=query+"            UPPER (siakoff.getnamakel (a.no_kel, a.no_kec, a.no_kab, a.no_prop)";
query=query+"                  ) nama_kel,";
query=query+"            NVL (TO_CHAR (a.no_kk, '0000000000000000'), '-') no_kk,";
query=query+"            DECODE (a.no_paspor, NULL, '-', 0, '-', a.no_paspor) no_paspor,";
query=query+"            DECODE (a.tgl_akh_paspor,";
query=query+"                    NULL, '-',";
query=query+"                    TO_CHAR (a.tgl_akh_paspor, 'dd-mm-yyyy')";
query=query+"                   ) tgl_akh_paspor,";
query=query+"            DECODE (a.no_akta_lhr, NULL, '-', 0, '-', a.no_akta_lhr) no_akta_lhr,";
query=query+"            DECODE (a.no_akta_kwn, NULL, '-', 0, '-', a.no_akta_kwn) no_akta_kwn,";
query=query+"            DECODE (a.tgl_kwn,";
query=query+"                    NULL, '-',";
query=query+"                    TO_CHAR (a.tgl_kwn, 'dd-mm-yyyy')";
query=query+"                   ) tgl_kwn,";
query=query+"            DECODE (a.no_akta_crai,";
query=query+"                    NULL, '-',";
query=query+"                    0, '-',";
query=query+"                    a.no_akta_crai";
query=query+"                   ) no_akta_crai,";
query=query+"            DECODE (a.tgl_crai,";
query=query+"                    NULL, '-',";
query=query+"                    TO_CHAR (a.tgl_crai, 'dd-mm-yyyy')";
query=query+"                   ) tgl_crai,";
query=query+"            TO_CHAR (SYSDATE, 'dd-mm-yyyy') systgl";
query=query+"       FROM biodata_wni a, data_keluarga b";
query=query+"      WHERE a.nik =" + vNik.elementAt(i).toString().trim();
query=query+"        AND a.no_kk = b.no_kk";

        System.out.println(query);

        rs = stmt.executeQuery(query.trim());
        BiodataWNIObject obj = null;

          while (rs.next())
          {
            no_kk = rs.getString("NO_KK");
            nama_lgkp = rs.getString("NAMA_LGKP");
            tmpt_lhr = rs.getString("TMPT_LHR");
            tgl_lhr = rs.getString("TGL_LHR");
            jenis_klmin = rs.getString("JENIS_KLMIN");
            gol_drh = rs.getString("GOL_DRH");
            agama = rs.getString("AGAMA");
            pddk_akh = rs.getString("PDDK_AKH");
            jenis_pkrjn = rs.getString("JENIS_PKRJN");
            pnydng_cct = rs.getString("PNYDNG_CCT");
            stat_kwn = rs.getString("STAT_KWN");
            stat_hbkel = rs.getString("STAT_HBKEL");
            nik_ibu = rs.getString("NIK_IBU");
            nama_lgkp_ibu = rs.getString("NAMA_LGKP_IBU");
            nik_ayah = rs.getString("NIK_AYAH");
            nama_lgkp_ayah = rs.getString("NAMA_LGKP_AYAH");
            tmpt_sbl = rs.getString("TMPT_SBL");
            alamat = rs.getString("ALAMAT");
            no_rt=rs.getString("NO_RT");
            no_rw=rs.getString("NO_RW");
            dusun=rs.getString("DUSUN");
            kode_pos=rs.getString("KODE_POS");
            telp=rs.getString("TELP");
            nama_prop=rs.getString("NAMA_PROP");
            nama_kab=rs.getString("NAMA_KAB");
            nama_kec=rs.getString("NAMA_KEC");
            nama_kel=rs.getString("NAMA_KEL");
            no_paspor = rs.getString("NO_PASPOR");
            tgl_akh_paspor = rs.getString("TGL_AKH_PASPOR");
            no_akta_lhr = rs.getString("NO_AKTA_LHR");
            no_akta_kwn = rs.getString("NO_AKTA_KWN");
            tgl_kwn = rs.getString("TGL_KWN");
            no_akta_cerai = rs.getString("NO_AKTA_CRAI");
            tgl_cerai = rs.getString("TGL_CRAI");
            systgl = rs.getString("SYSTGL");

            obj = new BiodataWNIObject(nik, nama_lgkp, tmpt_lhr, tgl_lhr,
                                       jenis_klmin, gol_drh, agama,
                                       pddk_akh, jenis_pkrjn, pnydng_cct,
                                       stat_kwn, stat_hbkel, nik_ibu,
                                       nama_lgkp_ibu, nik_ayah, nama_lgkp_ayah,
                                       tmpt_sbl, alamat, no_rt,no_rw,dusun,kode_pos,telp,nama_prop,
                                       nama_kab,nama_kec,nama_kel,no_kk,
                                       no_paspor, tgl_akh_paspor, no_akta_lhr,
                                       no_akta_kwn, tgl_kwn,
                                       no_akta_cerai, tgl_cerai,
                                       systgl);
            vData.addElement(obj);

          }
          if(rs!=null) rs.close();

      }
      stmt.close();
      conn.close();
    }
    catch(Exception e)
    {
      e.printStackTrace();
      siakWriter.writeFile(e);
    }

    finally
    {
         try {
           if (rs != null)
             rs.close();
           if (stmt != null)
             stmt.close();
         }
         catch (Exception e)
         {
           siakWriter.writeFile(e);
         }
         try {
            if (conn != null)
              conn.close();
          }
          catch (Exception e)
          {
            siakWriter.writeFile(e);
          }
      }
      return vData;
  }

  public Vector retrieveDataP4B(Vector vNik) throws RemoteException
  {
     Vector vDataP4B = new Vector();
      Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs=null ;
    PreparedStatement stmt = null;
    String query = "";
    try
    {
      conn = connectorDb.getConnection();

      for(int i=0;i<vNik.size();i++)
      {
        //query = "SELECT * FROM VW_INDIVIDU_WNI_P4B WHERE NIK=" +
        query = " SELECT TO_CHAR(a.nik,'0000000000000000') nik, " +
            " UPPER(a.nama_lgkp) nama_lgkp,(a.no_ktp) no_ktp, " +
            " UPPER(a.TMPT_LHR) TMPT_LHR,TO_CHAR(a.TGL_LHR,'dd-mm-yyyy') TGL_LHR, " +
            " DECODE(a.JENIS_KLMIN,1,'LAKI-LAKI',2,'PEREMPUAN') JENIS_KLMIN, " +
            " DECODE(a.GOL_DRH,1,'A',2,'B',3,'AB',4,'O',5,'A+',6,'A',7,'B+',8,'B-',9,'AB+',10,'AB-',11,'O+',12,'O-') GOL_DRH," +
            " DECODE(to_char(a.agama), '1', 'ISLAM', '2', 'KRISTEN', '3', 'KATHOLIK', '4', 'HINDU', '5', 'BUDHA', '6', 'LAINNYA', a.agama) agama," +
            " DECODE(a.PDDK_AKH,1,'TIDAK/BELUM SEKOLAH',2,'TIDAK TAMAT SD/SEDERAJAT'," +
            " 3,'TAMAT SD/SEDERAJAT',4,'SLTP/SEDERAJAT',5,'SLTA/SEDERAJAT',6,'DIPLOMA I/II'," +
            " 7,'AKADEMI/DIPLOMA III/S. MUDA',8,'DIPLOMA IV/STRATA I'," +
            " 9,'STRATA II',10,'STRATA III') PDDK_AKH," +
            " DECODE(a.JENIS_PKRJN,1,'PELAJAR/MAHASISWA', " +
            " 2,'MENGURUS RUMAH TANGGA', 3,'PENSIUNAN', " +
            " 4,'BELUM/TIDAK BEKERJA',5,'PETANI/PEKEBUN', " +
            " 6,'PETERNAK', 7,'NELAYAN/PERIKANAN', " +
            " 8,'INDUSTRI', 9,'KONSTRUKSI',10,'PERDAGANGAN', " +
            " 11,'TRANSPORTASI', 12,'PEGAWAI NEGERI SIPIL',13,'TENTARA NASIONAL INDONESIA'," +
            " 14,'KEPOLISIAN R.I.',  15,'JASA LAINNYA',  16,'LAINNYA') JENIS_PKRJN, " +
            " DECODE(a.PNYDNG_CCT,1,'CACAT FISIK',2,'CACAT NETRA',3,'CACAT RUNGU/WICARA',4,'CACAT MENTAL/JIWA',5,'CACAT FISIK DAN MENTAL',6,'CACAT LAINNYA') PNYDNG_CCT," +
            " DECODE(a.STAT_KWN,1,'BELUM KAWIN',  2,'KAWIN', " +
            " 3,'CERAI HIDUP',  4,'CERAI MATI') STAT_KWN, " +
            " DECODE(a.STAT_HBKEL,1,'KEPALA KELUARGA',2, 'SUAMI',3,'ISTRI', 4, 'ANAK',5,'MENANTU',6," +
            " 'CUCU',7,'ORANGTUA',8,'MERTUA',9,'FAMILI LAIN',10,'PEMBANTU', 11,'LAINNYA') stat_hbkel," +
            " DECODE(a.nik_ibu ,'0','-',NULL,'-',TO_CHAR(a.nik_ibu,'0000000000000000')) nik_ibu," +
            " UPPER(a.NAMA_LGKP_IBU) NAMA_LGKP_IBU, DECODE(a.NIK_AYAH ,'0','-',NULL,'-',TO_CHAR(a.NIK_AYAH,'0000000000000000')) NIK_AYAH," +
            " UPPER(a.NAMA_LGKP_AYAH) NAMA_LGKP_AYAH, UPPER(NVL(a.TMPT_SBL,'-')) TMPT_SBL, " +
            " UPPER(b.almt_t) alamat,  b.rt_t  no_rt, " +
            " b.rw_t  no_rw,  UPPER(NVL(b.dusun_t,'-'))  dusun, " +
            " DECODE(b.kode_pos_t,NULL,'-',0,'-',b.kode_pos_t) KODE_POS," +
            " NVL(b.telp_t,'-') TELP," +
            " UPPER(Getnamaprop(a.no_prop)) nama_prop, UPPER(Getnamakab(a.no_kab,a.no_prop)) nama_kab," +
            " UPPER(Getnamakec(a.no_kec,a.no_kab,a.no_prop)) nama_kec," +
            " UPPER(Getnamakel(a.no_kel,a.no_kec,a.no_kab,a.no_prop)) nama_kel," +
            " NVL(TO_CHAR(a.no_kk,'0000000000000000'),'-') no_kk, " +
            " DECODE(a.NO_PASPOR,NULL,'-',0,'-',a.NO_PASPOR) NO_PASPOR," +
            " DECODE(a.TGL_AKH_PASPOR,NULL,'-',TO_CHAR(a.TGL_AKH_PASPOR,'dd-mm-yyyy')) TGL_AKH_PASPOR," +
            " DECODE(a.NO_AKTA_LHR,NULL,'-',0,'-',a.NO_AKTA_LHR) NO_AKTA_LHR, " +
            " DECODE(a.NO_AKTA_KWN,NULL,'-',0,'-',a.NO_AKTA_KWN) NO_AKTA_KWN, " +
            " DECODE(a.TGL_KWN,NULL,'-',TO_CHAR(a.TGL_KWN,'dd-mm-yyyy'))  TGL_KWN , " +
            " DECODE(a.NO_AKTA_CRAI,NULL,'-',0,'-',a.NO_AKTA_CRAI) NO_AKTA_CRAI, " +
            " DECODE(a.TGL_CRAI,NULL,'-',TO_CHAR(a.TGL_CRAI,'dd-mm-yyyy')) TGL_CRAI , " +
            " TO_CHAR(SYSDATE,'dd-mm-yyyy') systgl " +
            " FROM BIODATA_WNI_P4B a,TABLE(GetalmtpivotP4b(a.no_kk)) b " +
            " where a.nik= " + vNik.elementAt(i).toString().trim();

//        System.out.println(query);

        stmt = conn.prepareStatement(query);
        rs = stmt.executeQuery();

        BiodataWNIP4BObject obj = null;

          while (rs.next())
          {
            no_kk = rs.getString("NO_KK");
            nama_lgkp = rs.getString("NAMA_LGKP");
            no_ktp = rs.getString("NO_KTP");
            tmpt_lhr = rs.getString("TMPT_LHR");
            tgl_lhr = rs.getString("TGL_LHR");
            jenis_klmin = rs.getString("JENIS_KLMIN");
            gol_drh = rs.getString("GOL_DRH");
            agama = rs.getString("AGAMA");
            pddk_akh = rs.getString("PDDK_AKH");
            jenis_pkrjn = rs.getString("JENIS_PKRJN");
            pnydng_cct = rs.getString("PNYDNG_CCT");
            stat_kwn = rs.getString("STAT_KWN");
            stat_hbkel = rs.getString("STAT_HBKEL");
            nik_ibu = rs.getString("NIK_IBU");
            nama_lgkp_ibu = rs.getString("NAMA_LGKP_IBU");
            nik_ayah = rs.getString("NIK_AYAH");
            nama_lgkp_ayah = rs.getString("NAMA_LGKP_AYAH");
            tmpt_sbl = rs.getString("TMPT_SBL");
            alamat = rs.getString("ALAMAT");
            no_rt=rs.getString("NO_RT");
            no_rw=rs.getString("NO_RW");
            dusun=rs.getString("DUSUN");
            kode_pos=rs.getString("KODE_POS");
            telp=rs.getString("TELP");
            nama_prop=rs.getString("NAMA_PROP");
            nama_kab=rs.getString("NAMA_KAB");
            nama_kec=rs.getString("NAMA_KEC");
            nama_kel=rs.getString("NAMA_KEL");
            no_paspor = rs.getString("NO_PASPOR");
            tgl_akh_paspor = rs.getString("TGL_AKH_PASPOR");
            no_akta_lhr = rs.getString("NO_AKTA_LHR");
            no_akta_kwn = rs.getString("NO_AKTA_KWN");
            tgl_kwn = rs.getString("TGL_KWN");
            no_akta_cerai = rs.getString("NO_AKTA_CRAI");
            tgl_cerai = rs.getString("TGL_CRAI");
            systgl = rs.getString("SYSTGL");

            obj = new biodata.BiodataWNIP4BObject(nik, nama_lgkp, no_ktp, tmpt_lhr, tgl_lhr,
                                       jenis_klmin, gol_drh, agama,
                                       pddk_akh, jenis_pkrjn, pnydng_cct,
                                       stat_kwn, stat_hbkel, nik_ibu,
                                       nama_lgkp_ibu, nik_ayah, nama_lgkp_ayah,
                                       tmpt_sbl, alamat, no_rt, no_rw,dusun,kode_pos,telp,nama_prop,
                                       nama_kab,nama_kec,nama_kel,no_kk,
                                       no_paspor, tgl_akh_paspor, no_akta_lhr,
                                       no_akta_kwn, tgl_kwn,
                                       no_akta_cerai, tgl_cerai,
                                       systgl);
            vDataP4B.addElement(obj);

          }
          if(rs!=null) rs.close();

      }
      stmt.close();
      conn.close();
    }
    catch(Exception e)
    {
      e.printStackTrace();
      siakWriter.writeFile(e);
    }

    finally
    {
         try {
           if (rs != null)
             rs.close();
           if (stmt != null)
             stmt.close();
         }
         catch (Exception e)
         {
           siakWriter.writeFile(e);
         }
         try {
            if (conn != null)
              conn.close();
          }
          catch (Exception e)
          {
            siakWriter.writeFile(e);
          }
      }
      return vDataP4B;
  }


  public void ejbRemove()
  {
    System.out.println("#INSIDE ViewCetakBiodataBean ejbRemove() CALLED---REMOVEEE---#");
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
}