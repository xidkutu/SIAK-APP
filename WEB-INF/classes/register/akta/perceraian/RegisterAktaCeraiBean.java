package register.akta.perceraian;

import javax.ejb.*;
import siaktools.logwriter.SiakWriter;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import oracle.jdbc.driver.*;

public class RegisterAktaCeraiBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector retrieveData(Vector vNoAktaCerai) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;

     String dasar_hkm_crai = "", ini_day = "", ini_date = "", current_month = "", current_year = "", current_time = "";
     String nik_suami = "", wargn_suami = "", nama_lgkp_suami = "", tmpt_lahir_suami = "", umur_suami = "", jenis_pkrjn = "", agama_suami = "";
     String alamat_suami = "", rt_suami = "", rw_suami = "", propnama_suami = "", kabnama_suami = "", kecnama_suami = "", kelnama_suami = "";
     String nik_istri = "", wargn_istri = "", nama_lgkp_istri = "", tmpt_lahir_istri = "", umur_istri = "", jenis_pkrjn_istri = "";
     String agama_istri = "", alamat_istri = "", rt_istri = "", rw_istri = "", propnama_istri = "", kabnama_istri = "", kecnama_istri = "";
     String kelnama_istri = "", lbg_pngadil_kel_kep = "", tmpt_lbg_pngadil = "", tgl_srt_kep_dt = "", tgl_srt_kep_mm = "", tgl_srt_kep_yy = "";
     String no_kep_pngadil = "", kawin_dt = "", kawin_month = "", kawin_year = "", tmpt_ctt_kwn = "", tgl_srt_ket_dt = "", tgl_srt_ket_mm = "";
     String tgl_srt_ket_yy = "", no_srt_ket_pn = "", tgl_ctk_ktakta = "", no_prop = "", no_kab = "", nama_prop = "", nama_kab = "";
     String nama_pelpor= "",umur_pelpor= "",pkrjn_perlpor= "",alamat_pelpor= "",rt_pelpor= "",rw_pelpor= "";
     String kel_pelpor= "",kec_pelpor= "",kab_pelpor= "",prop_pelpor= "";
     String no_akta_kwn="";
    for(int i=0;i<vNoAktaCerai.size();i++)
     {
       System.out.println("vNoAktaCerai in BEAN" + vNoAktaCerai.elementAt(i));
     }

    try
    {
      conn = connectorDb.getConnection();

      for (int i = 0; i < vNoAktaCerai.size(); i++)
      {
        String query = "begin ? := get_akta_cerai(?); end;";

        stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
         System.out.println("vNoAktaCerai.elementAt(i).toString().trim() !!!" + vNoAktaCerai.elementAt(i).toString().trim());
        stmt.setString(2, vNoAktaCerai.elementAt(i).toString().trim());

// execute and retrieve the result set
        stmt.execute();
        rs = (ResultSet)stmt.getObject(1);
        RegisterPerceraianObject obj = null;

// print the results

       while (rs.next())
        {
          no_akta_kwn=rs.getString("NO_AKTA_KWN");
          dasar_hkm_crai = rs.getString("DASAR_HKM_CRAI");
          ini_day = rs.getString("INI_DAY");
          ini_date = rs.getString("INI_DATE");
          current_month = rs.getString("CURRENT_MONTH");
          current_year = rs.getString("CURRENT_YEAR");
          current_time = rs.getString("CURRENT_TIME");
          nik_suami = rs.getString("NIK_SUAMI");
          wargn_suami = rs.getString("WARGN_SUAMI");
          nama_lgkp_suami = rs.getString("NAMA_LGKP_SUAMI");
          /*
          tmpt_lahir_suami = rs.getString("TMPT_LAHIR_SUAMI");
          umur_suami = rs.getString("UMUR_SUAMI");
          jenis_pkrjn = rs.getString("JENIS_PKRJN");
          agama_suami = rs.getString("AGAMA_SUAMI");
          alamat_suami = rs.getString("ALAMAT_SUAMI");
          rt_suami = rs.getString("RT_SUAMI");
          rw_suami = rs.getString("RW_SUAMI");
          propnama_suami = rs.getString("PROPNAMA_SUAMI");
          kabnama_suami = rs.getString("KABNAMA_SUAMI");
          kecnama_suami = rs.getString("KECNAMA_SUAMI");
          kelnama_suami = rs.getString("KELNAMA_SUAMI");
          */
          nik_istri = rs.getString("NIK_ISTRI");
          wargn_istri = rs.getString("WARGN_ISTRI");
          nama_lgkp_istri = rs.getString("NAMA_LGKP_ISTRI");
          /*
          tmpt_lahir_istri = rs.getString("TMPT_LAHIR_ISTRI");
          umur_istri = rs.getString("UMUR_ISTRI");
          jenis_pkrjn_istri = rs.getString("JENIS_PKRJN_ISTRI");

          agama_istri = rs.getString("AGAMA_ISTRI");
          alamat_istri = rs.getString("ALAMAT_ISTRI");
          rt_istri = rs.getString("RT_ISTRI");
          rw_istri = rs.getString("RW_ISTRI");
          propnama_istri = rs.getString("PROPNAMA_ISTRI");
          kabnama_istri = rs.getString("KABNAMA_ISTRI");
          kecnama_istri = rs.getString("KECNAMA_ISTRI");
          kelnama_istri = rs.getString("KELNAMA_ISTRI");
          */
          lbg_pngadil_kel_kep = rs.getString("LBG_PNGADIL_KEL_KEP");
          tmpt_lbg_pngadil = rs.getString("TMPT_LBG_PNGADIL");
          tgl_srt_kep_dt = rs.getString("TGL_SRT_KEP_DT");
          tgl_srt_kep_mm = rs.getString("TGL_SRT_KEP_MM");
          tgl_srt_kep_yy = rs.getString("TGL_SRT_KEP_YY");
          no_kep_pngadil = rs.getString("NO_KEP_PNGADIL");
          kawin_dt = rs.getString("KAWIN_DT");
          kawin_month = rs.getString("KAWIN_MONTH");
          kawin_year = rs.getString("KAWIN_YEAR");
          tmpt_ctt_kwn = rs.getString("TMPT_CTT_KWN");
          tgl_srt_ket_dt = rs.getString("TGL_SRT_KET_DT");
          tgl_srt_ket_mm = rs.getString("TGL_SRT_KET_MM");
          tgl_srt_ket_yy = rs.getString("TGL_SRT_KET_YY");
          no_srt_ket_pn = rs.getString("NO_SRT_KET_PN");
          tgl_ctk_ktakta = rs.getString("TGL_CTK_KTAKTA");
          no_prop = rs.getString("NO_PROP");
          no_kab = rs.getString("NO_KAB");
          nama_prop = rs.getString("NAMA_PROP");
          nama_kab = rs.getString("NAMA_KAB");

          nama_pelpor=rs.getString("NAMA_PELPOR");
          umur_pelpor=rs.getString("UMUR_PELPOR");
          pkrjn_perlpor=rs.getString("PEKERJAAN_PELPOR");
          alamat_pelpor=rs.getString("ALAMAT_PELPOR");
          rt_pelpor=rs.getString("RT_PELPOR");
          rw_pelpor=rs.getString("RW_PERLPOR");
          kel_pelpor=rs.getString("KEL_PELPOR");
          kec_pelpor=rs.getString("KEC_PELPOR");
          kab_pelpor=rs.getString("KAB_PELPOR");
          prop_pelpor=rs.getString("PROP_PELPOR");
          obj = new RegisterPerceraianObject(vNoAktaCerai.elementAt(i).toString().trim(),no_akta_kwn,dasar_hkm_crai,
                                              ini_day, ini_date, current_month, current_year,
                                              current_time,  nik_suami, wargn_suami,
                                              nama_lgkp_suami, tmpt_lahir_suami,
                                              umur_suami, jenis_pkrjn, agama_suami,
                                              alamat_suami, rt_suami, rw_suami,
                                              propnama_suami, kabnama_suami,
                                              kecnama_suami, kelnama_suami,
                                              nik_istri, wargn_istri, nama_lgkp_istri,
                                              tmpt_lahir_istri, umur_istri,
                                              jenis_pkrjn_istri,  agama_istri, alamat_istri,
                                              rt_istri, rw_istri, propnama_istri,
                                              kabnama_istri, kecnama_istri,
                                              kelnama_istri, lbg_pngadil_kel_kep, tmpt_lbg_pngadil,
                                              tgl_srt_kep_dt, tgl_srt_kep_mm, tgl_srt_kep_yy,
                                              no_kep_pngadil, kawin_dt, kawin_month,
                                              kawin_year, tmpt_ctt_kwn, tgl_srt_ket_dt,
                                              tgl_srt_ket_mm,  tgl_srt_ket_yy, no_srt_ket_pn,
                                              tgl_ctk_ktakta, no_prop, no_kab, nama_prop,
                                              nama_kab,
                                              nama_pelpor,umur_pelpor,pkrjn_perlpor,alamat_pelpor,rt_pelpor,rw_pelpor,
                                              kel_pelpor,kec_pelpor,kab_pelpor,prop_pelpor);

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