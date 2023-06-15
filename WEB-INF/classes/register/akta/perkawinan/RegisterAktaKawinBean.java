package register.akta.perkawinan;

import javax.ejb.*;
import siaktools.logwriter.SiakWriter;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import oracle.jdbc.driver.*;

public class RegisterAktaKawinBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

 public Vector getPersyaratanKawin(String no_persyaratan) throws RemoteException
  {
    StringTokenizer st = new StringTokenizer(no_persyaratan, ",");
    String token = "";

    Vector vPersyaratan = new Vector();
    if(vPersyaratan.size()>0) vPersyaratan.removeAllElements();

    Hashtable hPersyaratan = new Hashtable();

    hPersyaratan.put( new Integer(1), "Surat Bukti Perkawinan Agama" );
    hPersyaratan.put( new Integer(2),"Akta Kelahiran" );
    hPersyaratan.put( new Integer(3),"Surat keterangan dari Desa/Kelurahan" );
    hPersyaratan.put( new Integer(4), "Copy KTP/KK yang Dilegalisir Kades/Lurah" );
    hPersyaratan.put( new Integer(5),"Surat Bukti Kewarganegaraan RI" );
    hPersyaratan.put( new Integer(6),"Surat Ganti Nama" );
    hPersyaratan.put( new Integer(7), "Pas Foto Berdampingan 4x6" );
    hPersyaratan.put( new Integer(8),"Akta Kelahiran Anak yang Akan Diakui" );
    hPersyaratan.put( new Integer(9),"Akta Perceraian/Kematian, jika sudah pernah kawin" );
    hPersyaratan.put( new Integer(10), "Ijin dari Komandan bagi Anggota ABRI" );
    hPersyaratan.put( new Integer(11),"Paspor" );
    hPersyaratan.put( new Integer(12),"STMD dari Kepolisian" );
    hPersyaratan.put( new Integer(13), "Surat Kedutaan/Konsul/Perwakilan Negara Asing Bersangkutan" );
    hPersyaratan.put( new Integer(14),"SKK dari Imigrasi" );
    hPersyaratan.put( new Integer(15),"Copy Surat Baptis" );

    int number = 0;

    while(st.hasMoreTokens())
    {
        token = st.nextToken();
        number = Integer.parseInt(token);

        vPersyaratan.addElement(hPersyaratan.get( new Integer(token) ).toString());
    }

    return vPersyaratan;
  }

public Vector retrieveData(Vector vNoAktaKawin) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;
    String nik_suami= "", nik_istri= "", dsrhk_cttlhr= "";
    String m_ini_day= "", m_current_date= "", m_current_month= "", m_current_year= "", m_current_time= "";
    String persyaratan_bayi= "", kwrngrn_suami= "", nama_lgkp_suami= "", tmpt_lahir_suami= "";
    String tgl_lhr_day_suami= "", tgl_lhr_string_dd_suami= "", tgl_lhr_string_mm_suami= "";
    String tgl_lhr_string_yy_suami= "", agama_suami= "", alamat_suami= "", rt_suami= "", rw_suami= "", propnama_suami= "";
    String kabnama_suami= "", kecnama_suami= "", kelnama_suami= "", kwrngrn_istri= "", nama_lgkp_istri= "", sebel_istri= "";
    String tmpt_lahir_istri= "", tgl_lhr_day_istri= "", tgl_lhr_string_dd_istri= "", tgl_lhr_string_mm_istri= "";
    String tgl_lhr_string_yy_istri= "", agama_istri= "", alamat_istri= "", rt_istri= "", rw_istri= "", propnama_istri= "";
    String kabnama_istri= "", kecnama_istri= "", kelnama_istri= "", nama_ayah_suami= "", umur_ayah_suami= "", pekerjaan_ayah_suami= "";
    String alamat_ayah= "", rt_ayah_suami= "", rw_ayah_suami= "", kel_ayah_suami= "", kec_ayah_suami= "", kab_ayah_suami= "", prop_ayah_suami= "";
    String nama_ibu_suami= "", umur_ibu_suami= "", pekerjaan_ibu_suami= "", alamat_ibu_suami= "", rt_ibu_suami= "";
    String rw_ibu_suami= "", kel_ibu_suami= "", kec_ibu_sami= "", kab_ibu_suami= "", prop_ibu_suami= "", nama_ayah_istri= "";
    String umur_ayah_istri= "", pekerjaan_ayah_istri= "", alamat_ayah_istri= "", rt_ayah_istri= "", rw_ayah_istri= "";
    String kel_ayah_istri= "", kec_ayah_istri= "", kab_ayah_istri= "", prop_ayah_istri= "", nama_ibu_istri= "";
    String umur_ibu_istri= "", pekerjaan_ibu_istri= "", alamat_ibu_istri= "", rt_ibu_istri= "";
    String rw_ibu_istri= "", kel_ibu_istri= "", kec_ibu_istri= "", kab_ibu_istri= "", prop_ibu_istri= "";
    String nama_pmka= "", alamat_pmka= "", rt_pmka= "", rw_pmka= "", prop_pmka= "", kab_pmka= "", kec_pmka= "", kel_pmka= "", nama_saksi1= "";
    String umur_saksi1= "", pekerjaan_saksi1= "", alamat_saksi1= "", rt_saksi1= "", rw_saksi1= "", kel_saksi1= "", kec_saksi1= "", kab_saksi1= "";
    String prop_saksi1= "", nama_saksi2= "", umur_saksi2= "", pekerjaan_saksi2= "", alamat_saksi2= "", rt_saksi2= "", rw_saksi2= "";
    String kel_saksi2= "", kec_saksi2= "", kab_saksi2= "", prop_saksi2= "", tgl_cetak_akta= "";
    String umur_suami= "", pekarjan_suami= "", m_agama_ayah_suami= "", m_agama_ibu_suami= "",
        m_umur_istri= "", m_pekarjan_istri= "", m_agama_ayah_istri= "", m_agama_ibu_istri= "";
    String KWN_DATE="",KWN_MONTH="",KWN_YEAR="";
    String tiduk_agama="", sebel_suami="", agama_saksi1="", agama_saksi2="";
    String NAMA_TMPT_PNESAH="",KET_NAMA_TMPT_PNESAH="";
try
    {
      conn = connectorDb.getConnection();
for (int i = 0; i < vNoAktaKawin.size();i++)
      {
        String query = "begin ? := get_akta_kawin(?); end;";
        stmt = conn.prepareCall(query);
// register the type of the out param - an Oracle specific type
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
         stmt.setString(2, vNoAktaKawin.elementAt(i).toString().trim());
// execute and retrieve the result set
        stmt.execute();
        rs = (ResultSet)stmt.getObject(1);
        RegisterPerkawinanObject obj = null;
// print the results
  while (rs.next())
        {
          nik_suami = rs.getString("NIK_SUAMI");
          nik_istri = rs.getString("NIK_ISTRI");
          dsrhk_cttlhr = rs.getString("DSRHK_CTTLHR");
          m_ini_day = rs.getString("M_INI_DAY");
          m_current_date = rs.getString("M_CURRENT_DATE");
          m_current_month = rs.getString("M_CURRENT_MONTH");
          m_current_year = rs.getString("M_CURRENT_YEAR");
          m_current_time = rs.getString("M_CURRENT_TIME");
          persyaratan_bayi = rs.getString("PERSYARATAN_BAYI");
          kwrngrn_suami = rs.getString("KWRNGRN_SUAMI");
          nama_lgkp_suami = rs.getString("NAMA_LGKP_SUAMI");
          tmpt_lahir_suami = rs.getString("TMPT_LAHIR_SUAMI");
          tgl_lhr_day_suami = rs.getString("TGL_LHR_DAY_SUAMI");
          tgl_lhr_string_dd_suami = rs.getString("TGL_LHR_STRING_DD_SUAMI");
          tgl_lhr_string_mm_suami = rs.getString("TGL_LHR_STRING_MM_SUAMI");
          tgl_lhr_string_yy_suami = rs.getString("TGL_LHR_STRING_YY_SUAMI");
          agama_suami = rs.getString("AGAMA_SUAMI");
          alamat_suami = rs.getString("ALAMAT_SUAMI");
          rt_suami = rs.getString("RT_SUAMI");
          rw_suami = rs.getString("RW_SUAMI");
          propnama_suami = rs.getString("PROPNAMA_SUAMI");
          kabnama_suami = rs.getString("KABNAMA_SUAMI");
          kecnama_suami = rs.getString("KECNAMA_SUAMI");
          kelnama_suami = rs.getString("KELNAMA_SUAMI");
          kwrngrn_istri = rs.getString("KWRNGRN_ISTRI");
          nama_lgkp_istri = rs.getString("NAMA_LGKP_ISTRI");
          sebel_istri = rs.getString("SEBEL_ISTRI");
          tmpt_lahir_istri = rs.getString("TMPT_LAHIR_ISTRI");
          tgl_lhr_day_istri = rs.getString("TGL_LHR_DAY_ISTRI");
          tgl_lhr_string_dd_istri = rs.getString("TGL_LHR_STRING_DD_ISTRI");
          tgl_lhr_string_mm_istri = rs.getString("TGL_LHR_STRING_MM_ISTRI");
          tgl_lhr_string_yy_istri = rs.getString("TGL_LHR_STRING_YY_ISTRI");
          agama_istri = rs.getString("AGAMA_ISTRI");
          alamat_istri = rs.getString("ALAMAT_ISTRI");
          rt_istri = rs.getString("RT_ISTRI");
          rw_istri = rs.getString("RW_ISTRI");
          propnama_istri = rs.getString("PROPNAMA_ISTRI");
          kabnama_istri = rs.getString("KABNAMA_ISTRI");
          kecnama_istri = rs.getString("KECNAMA_ISTRI");
          kelnama_istri = rs.getString("KELNAMA_ISTRI");
          nama_ayah_suami = rs.getString("NAMA_AYAH_SUAMI");
          umur_ayah_suami = rs.getString("UMUR_AYAH_SUAMI");
          pekerjaan_ayah_suami = rs.getString("PEKERJAAN_AYAH_SUAMI");
          alamat_ayah = rs.getString("ALAMAT_AYAH");
          rt_ayah_suami = rs.getString("RT_AYAH_SUAMI");
          rw_ayah_suami = rs.getString("RW_AYAH_SUAMI");
          kel_ayah_suami = rs.getString("KEL_AYAH_SUAMI");
          kec_ayah_suami = rs.getString("KEC_AYAH_SUAMI");
          kab_ayah_suami = rs.getString("KAB_AYAH_SUAMI");
          prop_ayah_suami = rs.getString("PROP_AYAH_SUAMI");
          nama_ibu_suami = rs.getString("NAMA_IBU_SUAMI");
          umur_ibu_suami = rs.getString("UMUR_IBU_SUAMI");
          pekerjaan_ibu_suami = rs.getString("PEKERJAAN_IBU_SUAMI");
          alamat_ibu_suami = rs.getString("ALAMAT_IBU_SUAMI");
          rt_ibu_suami = rs.getString("RT_IBU_SUAMI");
          rw_ibu_suami = rs.getString("RW_IBU_SUAMI");
          kel_ibu_suami = rs.getString("KEL_IBU_SUAMI");
          kec_ibu_sami = rs.getString("KEC_IBU_SAMI");
          kab_ibu_suami = rs.getString("KAB_IBU_SUAMI");
          prop_ibu_suami = rs.getString("PROP_IBU_SUAMI");
          nama_ayah_istri = rs.getString("NAMA_AYAH_ISTRI");
          umur_ayah_istri = rs.getString("UMUR_AYAH_ISTRI");
          pekerjaan_ayah_istri = rs.getString("PEKERJAAN_AYAH_ISTRI");
          alamat_ayah_istri = rs.getString("ALAMAT_AYAH_ISTRI");
          rt_ayah_istri = rs.getString("RT_AYAH_ISTRI");
          rw_ayah_istri = rs.getString("RW_AYAH_ISTRI");
          kel_ayah_istri = rs.getString("KEL_AYAH_ISTRI");
          kec_ayah_istri = rs.getString("KEC_AYAH_ISTRI");
          kab_ayah_istri = rs.getString("KAB_AYAH_ISTRI");
          prop_ayah_istri = rs.getString("PROP_AYAH_ISTRI");

          nama_ibu_istri = rs.getString("NAMA_IBU_ISTRI");
          umur_ibu_istri= rs.getString("UMUR_IBU_ISTRI");
          pekerjaan_ibu_istri= rs.getString("PEKERJAAN_IBU_ISTRI");
          alamat_ibu_istri= rs.getString("ALAMAT_IBU_ISTRI");
          rt_ibu_istri= rs.getString("RT_IBU_ISTRI");
          rw_ibu_istri= rs.getString("RW_IBU_ISTRI");
          kel_ibu_istri= rs.getString("KEL_IBU_ISTRI");
          kec_ibu_istri= rs.getString("KEC_IBU_ISTRI");
          kab_ibu_istri= rs.getString("KAB_IBU_ISTRI");
          prop_ibu_istri= rs.getString("PROP_IBU_ISTRI");
          nama_pmka= rs.getString("NAMA_PMKA");
          KWN_DATE=rs.getString("KWN_DATE");
          KWN_MONTH=rs.getString("KWN_MONTH");
          KWN_YEAR=rs.getString("KWN_YEAR");
          NAMA_TMPT_PNESAH =rs.getString("NAMA_TMPT_PNESAH");
          KET_NAMA_TMPT_PNESAH =rs.getString("KET_NAMA_TMPT_PNESAH");

          /*alamat_pmka= rs.getString("ALAMAT_PMKA");
          rt_pmka= rs.getString("RT_PMKA");
          rw_pmka= rs.getString("RW_PMKA");
          prop_pmka= rs.getString("PROP_PMKA");
          kab_pmka= rs.getString("KAB_PMKA");
          kec_pmka= rs.getString("KEC_PMKA");
          kel_pmka= rs.getString("KEL_PMKA");
          */
          nama_saksi1=rs.getString("NAMA_SAKSI1");
          umur_saksi1= rs.getString("UMUR_SAKSI1");
          pekerjaan_saksi1= rs.getString("PEKERJAAN_SAKSI1");
          alamat_saksi1= rs.getString("ALAMAT_SAKSI1");
          rt_saksi1= rs.getString("RT_SAKSI1");
          rw_saksi1= rs.getString("RW_SAKSI1");
          kel_saksi1= rs.getString("KEL_SAKSI1");
          kec_saksi1= rs.getString("KEC_SAKSI1");
          kab_saksi1= rs.getString("KAB_SAKSI1");
          prop_saksi1= rs.getString("PROP_SAKSI1");
          nama_saksi2= rs.getString("NAMA_SAKSI2");
          umur_saksi2= rs.getString("UMUR_SAKSI2");
          pekerjaan_saksi2= rs.getString("PEKERJAAN_SAKSI2");
          alamat_saksi2= rs.getString("ALAMAT_SAKSI2");
          rt_saksi2= rs.getString("RT_SAKSI2");
          rw_saksi2= rs.getString("RW_SAKSI2");
          kel_saksi2= rs.getString("KEL_SAKSI2");
          kec_saksi2= rs.getString("KEC_SAKSI2");
          kab_saksi2= rs.getString("KAB_SAKSI2");
          prop_saksi2= rs.getString("PROP_SAKSI2");
          tgl_cetak_akta= rs.getString("TGL_CETAK_AKTA");

          umur_suami =rs.getString("UMUR_SUAMI");
          pekarjan_suami= rs.getString("PEKARJAN_SUAMI");
          m_agama_ayah_suami =rs.getString("M_AGAMA_AYAH_SUAMI");
          m_agama_ibu_suami=rs.getString("M_AGAMA_IBU_SUAMI");
          m_umur_istri=rs.getString("M_UMUR_ISTRI");
          m_pekarjan_istri=rs.getString("M_PEKARJAN_ISTRI");
          m_agama_ayah_istri=rs.getString("M_AGAMA_AYAH_ISTRI");
          m_agama_ibu_istri=rs.getString("M_AGAMA_IBU_ISTRI");

          tiduk_agama = rs.getString("TIDUK_AGAMA");
          sebel_suami = rs.getString("SEBEL_SUAMI");
          agama_saksi1 = rs.getString("AGAMA_SAKSI1");
          agama_saksi2 = rs.getString("AGAMA_SAKSI2");

          obj = new RegisterPerkawinanObject( vNoAktaKawin.elementAt(i).toString().trim(), nik_suami, nik_istri, dsrhk_cttlhr,
                                   m_ini_day, m_current_date, m_current_month, m_current_year, m_current_time,
                                   persyaratan_bayi, kwrngrn_suami, nama_lgkp_suami, tmpt_lahir_suami,
                                   tgl_lhr_day_suami, tgl_lhr_string_dd_suami, tgl_lhr_string_mm_suami,
                                   tgl_lhr_string_yy_suami, agama_suami, alamat_suami, rt_suami, rw_suami, propnama_suami,
                                   kabnama_suami, kecnama_suami, kelnama_suami, kwrngrn_istri, nama_lgkp_istri, sebel_istri,
                                   tmpt_lahir_istri, tgl_lhr_day_istri, tgl_lhr_string_dd_istri, tgl_lhr_string_mm_istri,
                                   tgl_lhr_string_yy_istri, agama_istri, alamat_istri, rt_istri, rw_istri, propnama_istri,
                                   kabnama_istri, kecnama_istri, kelnama_istri, nama_ayah_suami, umur_ayah_suami, pekerjaan_ayah_suami,
                                   alamat_ayah, rt_ayah_suami, rw_ayah_suami, kel_ayah_suami, kec_ayah_suami, kab_ayah_suami, prop_ayah_suami,
                                   nama_ibu_suami, umur_ibu_suami, pekerjaan_ibu_suami, alamat_ibu_suami, rt_ibu_suami,
                                   rw_ibu_suami, kel_ibu_suami, kec_ibu_sami, kab_ibu_suami, prop_ibu_suami, nama_ayah_istri,
                                   umur_ayah_istri, pekerjaan_ayah_istri, alamat_ayah_istri, rt_ayah_istri, rw_ayah_istri,
                                   kel_ayah_istri, kec_ayah_istri, kab_ayah_istri, prop_ayah_istri, nama_ibu_istri,
                                   umur_ibu_istri, pekerjaan_ibu_istri, alamat_ibu_istri, rt_ibu_istri,
                                   rw_ibu_istri, kel_ibu_istri, kec_ibu_istri, kab_ibu_istri, prop_ibu_istri,
                                   nama_pmka,KWN_DATE, KWN_MONTH,KWN_YEAR,
                                   NAMA_TMPT_PNESAH,
                                   KET_NAMA_TMPT_PNESAH,
                                   nama_saksi1,
                                   umur_saksi1, pekerjaan_saksi1, alamat_saksi1, rt_saksi1, rw_saksi1, kel_saksi1, kec_saksi1, kab_saksi1,
                                   prop_saksi1, nama_saksi2, umur_saksi2, pekerjaan_saksi2, alamat_saksi2, rt_saksi2, rw_saksi2,
                                   kel_saksi2, kec_saksi2, kab_saksi2, prop_saksi2, tgl_cetak_akta,
                                   umur_suami, pekarjan_suami, m_agama_ayah_suami, m_agama_ibu_suami,
                                   m_umur_istri, m_pekarjan_istri, m_agama_ayah_istri, m_agama_ibu_istri,
                                   tiduk_agama, sebel_suami, agama_saksi1, agama_saksi2);

          vData.addElement(obj);
        }
        if (rs != null)
          rs.close();

        stmt.close();
      }
      conn.close();
    }
    catch (Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
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