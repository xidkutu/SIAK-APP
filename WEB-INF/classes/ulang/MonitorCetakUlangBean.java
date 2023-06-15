package ulang;

import javax.ejb.*;
import com.db.connection.*;
import java.sql.*;
import java.util.*;
import ulang.*;

public class MonitorCetakUlangBean implements SessionBean {
  SessionContext sessionContext;
  public void ejbCreate() throws CreateException {
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
  public void addCetakUlangAction(String dokumen, String field, Vector list, String authBy, String authTo, java.util.Date authDate) {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    Statement st = null, st2 = null;;
    Vector result = new Vector();

    conn = connectorDb.getConnection();

    try {
      try {
        st = conn.createStatement();
        String sql = "";
        UlangObject obj = null;
        String itemAuth = "";
        System.out.println("dokumen="+dokumen);
        System.out.println("dokumen yang dicetak="+list.size());

        if ((dokumen.equals("KK_WNI")) || (dokumen.equals("KK_WNA"))) {
          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM DATA_KELUARGA WHERE "+field+"="+list.elementAt(i).toString().trim();
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);
            if (rs.next()) {
              itemAuth = itemAuth + "NO_KK " + rs.getString("NO_KK");
              /*
              itemAuth = itemAuth + ", NAMA_KEP " + rs.getString("NAMA_KEP");
              itemAuth = itemAuth + ", ALAMAT " + rs.getString("ALAMAT");
              itemAuth = itemAuth + ", NO_RT " + rs.getString("NO_RT");
              itemAuth = itemAuth + ", NO_RW " + rs.getString("NO_RW");
              itemAuth = itemAuth + ", DUSUN " + rs.getString("DUSUN");
              itemAuth = itemAuth + ", KODE_POS " + rs.getString("KODE_POS");
              itemAuth = itemAuth + ", TELP " + rs.getString("TELP");
              itemAuth = itemAuth + ", ALS_PRMOHON " + rs.getString("ALS_PRMOHON");
              itemAuth = itemAuth + ", ALS_NUMPANG " + rs.getString("ALS_NUMPANG");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", NO_KEC " + rs.getString("NO_KEC");
              itemAuth = itemAuth + ", NO_KEL " + rs.getString("NO_KEL");
              itemAuth = itemAuth + ", USERID " + rs.getString("USERID");
              itemAuth = itemAuth + ", TGL_INSERTION " + rs.getString("TGL_INSERTION");
              itemAuth = itemAuth + ", TGL_UPDATION " + rs.getString("TGL_UPDATION");
*/
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else if ((dokumen.equals("kutipan_akta_kelahiran")) || (dokumen.equals("register_akta_kelahiran"))) {
          /*
monitorBean.addCetakUlangAction("kutipan_akta_kelahiran", "NO_AKTA_LAHIR", vAkta, authBy, authTo, authDate);
monitorBean.addCetakUlangAction("register_akta_kelahiran", "NIK_BAYI", vNik, authBy, authTo, authDate);
*/
          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM CATAT_LAHIR WHERE "+field+"='"+list.elementAt(i).toString().trim()+"'";
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);

            if (rs.next()) {
              itemAuth = itemAuth + "NIK_BAYI " + rs.getString("NIK_BAYI");
              /*
              itemAuth = itemAuth + ", TMPT_DILHR " + rs.getString("TMPT_DILHR");
              itemAuth = itemAuth + ", PUKUL_LHR " + rs.getString("PUKUL_LHR");
              itemAuth = itemAuth + ", WKT_PKL_LHR " + rs.getString("WKT_PKL_LHR");
              itemAuth = itemAuth + ", JENIS_KLAHIR " + rs.getString("JENIS_KLAHIR");
              itemAuth = itemAuth + ", ANAK_KE_LAHIR " + rs.getString("ANAK_KE_LAHIR");
              itemAuth = itemAuth + ", PNLNG_BAYI " + rs.getString("PNLNG_BAYI");
              itemAuth = itemAuth + ", BRT_BAYI " + rs.getString("BRT_BAYI");
              itemAuth = itemAuth + ", NIK_IBU " + rs.getString("NIK_IBU");
              itemAuth = itemAuth + ", NAMA_IBU " + rs.getString("NAMA_IBU");
              itemAuth = itemAuth + ", TGL_LHR_IBU " + rs.getString("TGL_LHR_IBU");
              itemAuth = itemAuth + ", JENIS_PKRJN_IBU " + rs.getString("JENIS_PKRJN_IBU");
              itemAuth = itemAuth + ", ALAMAT_IBU " + rs.getString("ALAMAT_IBU");
              itemAuth = itemAuth + ", NO_RT_IBU " + rs.getString("NO_RT_IBU");
              itemAuth = itemAuth + ", NO_RW_IBU " + rs.getString("NO_RW_IBU");
              itemAuth = itemAuth + ", DUSUN_IBU " + rs.getString("DUSUN_IBU");
              itemAuth = itemAuth + ", KODEPOS_IBU " + rs.getString("KODEPOS_IBU");
              itemAuth = itemAuth + ", TELP_IBU " + rs.getString("TELP_IBU");
              itemAuth = itemAuth + ", NAMA_KEL_IBU " + rs.getString("NAMA_KEL_IBU");
              itemAuth = itemAuth + ", NO_KEL_IBU " + rs.getString("NO_KEL_IBU");
              itemAuth = itemAuth + ", NO_KEC_IBU " + rs.getString("NO_KEC_IBU");
              itemAuth = itemAuth + ", NO_KAB_IBU " + rs.getString("NO_KAB_IBU");
              itemAuth = itemAuth + ", NO_PROP_IBU " + rs.getString("NO_PROP_IBU");
              itemAuth = itemAuth + ", KWRNGRN_IBU " + rs.getString("KWRNGRN_IBU");
              itemAuth = itemAuth + ", KETRUNAN_IBU " + rs.getString("KETRUNAN_IBU");
              itemAuth = itemAuth + ", BANGSA_IBU " + rs.getString("BANGSA_IBU");
              itemAuth = itemAuth + ", TGL_CTT_KWN_IBU " + rs.getString("TGL_CTT_KWN_IBU");
              itemAuth = itemAuth + ", NIK_AYH " + rs.getString("NIK_AYH");
              itemAuth = itemAuth + ", NAMA_AYH " + rs.getString("NAMA_AYH");
              itemAuth = itemAuth + ", TGL_LHIR_AYH " + rs.getString("TGL_LHIR_AYH");
              itemAuth = itemAuth + ", JENIS_PKRJN_AYH " + rs.getString("JENIS_PKRJN_AYH");
              itemAuth = itemAuth + ", ALAMAT_AYH " + rs.getString("ALAMAT_AYH");
              itemAuth = itemAuth + ", NO_RT_AYH " + rs.getString("NO_RT_AYH");
              itemAuth = itemAuth + ", NO_RW_AYH " + rs.getString("NO_RW_AYH");
              itemAuth = itemAuth + ", DUSUN_AYH " + rs.getString("DUSUN_AYH");
              itemAuth = itemAuth + ", KODEPOS_AYH " + rs.getString("KODEPOS_AYH");
              itemAuth = itemAuth + ", TELP_AYH " + rs.getString("TELP_AYH");
              itemAuth = itemAuth + ", NO_KEL_AYH " + rs.getString("NO_KEL_AYH");
              itemAuth = itemAuth + ", NO_KEC_AYH " + rs.getString("NO_KEC_AYH");
              itemAuth = itemAuth + ", NO_KAB_AYH " + rs.getString("NO_KAB_AYH");
              itemAuth = itemAuth + ", NO_PROP_AYH " + rs.getString("NO_PROP_AYH");
              itemAuth = itemAuth + ", KWRNGRN_AYH " + rs.getString("KWRNGRN_AYH");
              itemAuth = itemAuth + ", KETRUNAN_AYH " + rs.getString("KETRUNAN_AYH");
              itemAuth = itemAuth + ", BANGSA_AYH " + rs.getString("BANGSA_AYH");
              itemAuth = itemAuth + ", TGL_CTT_KWN_AYH " + rs.getString("TGL_CTT_KWN_AYH");
              itemAuth = itemAuth + ", NIK_PLPOR " + rs.getString("NIK_PLPOR");
              itemAuth = itemAuth + ", TGL_MLPOR " + rs.getString("TGL_MLPOR");
              itemAuth = itemAuth + ", NIK_SKSI1 " + rs.getString("NIK_SKSI1");
              itemAuth = itemAuth + ", NIK_SKSI2 " + rs.getString("NIK_SKSI2");
              itemAuth = itemAuth + ", JENIS_DFT_LHR " + rs.getString("JENIS_DFT_LHR");
              itemAuth = itemAuth + ", DSRHK_CTTLHR " + rs.getString("DSRHK_CTTLHR");
              itemAuth = itemAuth + ", PSYRATAN_LHR " + rs.getString("PSYRATAN_LHR");
                  */
              itemAuth = itemAuth + ", NO_AKTA_LAHIR " + rs.getString("NO_AKTA_LAHIR");
              /*
              itemAuth = itemAuth + ", TGL_AKTA_LHR " + rs.getString("TGL_AKTA_LHR");
              itemAuth = itemAuth + ", NAMA_KEP_DES " + rs.getString("NAMA_KEP_DES");
              itemAuth = itemAuth + ", NIP_LRH " + rs.getString("NIP_LRH");
              itemAuth = itemAuth + ", NAMA_PET_REG " + rs.getString("NAMA_PET_REG");
              itemAuth = itemAuth + ", NIP_PET_REG " + rs.getString("NIP_PET_REG");
              itemAuth = itemAuth + ", TGL_CTK_KTAKTA " + rs.getString("TGL_CTK_KTAKTA");
              itemAuth = itemAuth + ", NAMA_PET_ENTRI " + rs.getString("NAMA_PET_ENTRI");
              itemAuth = itemAuth + ", NIP_PET_ENTRI " + rs.getString("NIP_PET_ENTRI");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", NO_KEC " + rs.getString("NO_KEC");
              itemAuth = itemAuth + ", NO_KEL " + rs.getString("NO_KEL");
              itemAuth = itemAuth + ", FLAG_KEC " + rs.getString("FLAG_KEC");
              itemAuth = itemAuth + ", TGL_ENTRI " + rs.getString("TGL_ENTRI");
              itemAuth = itemAuth + ", TGL_UPDATION " + rs.getString("TGL_UPDATION");
              itemAuth = itemAuth + ", USER_ID " + rs.getString("USER_ID");
                  */
              System.out.println("itemAuth="+itemAuth);
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else if ((dokumen.equals("kutipan_akta_kematian")) || (dokumen.equals("register_akta_kematian"))) {
          //monitorBean.addCetakUlangAction("kutipan_akta_kematian", "NO_AKTA_MATI", vAkta, authBy, authTo, authDate);
          //monitorBean.addCetakUlangAction("register_akta_kematian", "NIK_JNSAH", vNik, authBy, authTo, authDate);
          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM CATAT_MATI WHERE "+field+"='"+list.elementAt(i).toString().trim()+"'";
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);

            if (rs.next()) {
              itemAuth = itemAuth + "NIK_JNSAH " + rs.getString("NIK_JNSAH");
              /*
              itemAuth = itemAuth + ", KWRNGRN_JNSAH " + rs.getString("KWRNGRN_JNSAH");
              itemAuth = itemAuth + ", KTRUNAN_JNSAH " + rs.getString("KTRUNAN_JNSAH");
              itemAuth = itemAuth + ", ANAK_KE " + rs.getString("ANAK_KE");
              itemAuth = itemAuth + ", TGL_MATI " + rs.getString("TGL_MATI");
              itemAuth = itemAuth + ", PUKUL " + rs.getString("PUKUL");
              itemAuth = itemAuth + ", WKT_PUKUL " + rs.getString("WKT_PUKUL");
              itemAuth = itemAuth + ", SBAB_MATI " + rs.getString("SBAB_MATI");
              itemAuth = itemAuth + ", TMPT_MATI " + rs.getString("TMPT_MATI");
              itemAuth = itemAuth + ", YG_MNERANG " + rs.getString("YG_MNERANG");
              itemAuth = itemAuth + ", PNETAP_PN " + rs.getString("PNETAP_PN");
              itemAuth = itemAuth + ", NO_PNETAP " + rs.getString("NO_PNETAP");
              itemAuth = itemAuth + ", TGL_PNETAP " + rs.getString("TGL_PNETAP");
              itemAuth = itemAuth + ", NIK_IBU " + rs.getString("NIK_IBU");
              itemAuth = itemAuth + ", KWRNGRN_IBU " + rs.getString("KWRNGRN_IBU");
              itemAuth = itemAuth + ", NAMA_LGKP_IBU " + rs.getString("NAMA_LGKP_IBU");
              itemAuth = itemAuth + ", TGL_LHR_IBU " + rs.getString("TGL_LHR_IBU");
              itemAuth = itemAuth + ", JENIS_PKRJN_IBU " + rs.getString("JENIS_PKRJN_IBU");
              itemAuth = itemAuth + ", ALAMAT_IBU " + rs.getString("ALAMAT_IBU");
              itemAuth = itemAuth + ", NO_RT_IBU " + rs.getString("NO_RT_IBU");
              itemAuth = itemAuth + ", NO_RW_IBU " + rs.getString("NO_RW_IBU");
              itemAuth = itemAuth + ", DUSUN_IBU " + rs.getString("DUSUN_IBU");
              itemAuth = itemAuth + ", KODEPOS_IBU " + rs.getString("KODEPOS_IBU");
              itemAuth = itemAuth + ", TELP_IBU " + rs.getString("TELP_IBU");
              itemAuth = itemAuth + ", NO_PROP_IBU " + rs.getString("NO_PROP_IBU");
              itemAuth = itemAuth + ", NO_KAB_IBU " + rs.getString("NO_KAB_IBU");
              itemAuth = itemAuth + ", NO_KEC_IBU " + rs.getString("NO_KEC_IBU");
              itemAuth = itemAuth + ", NO_KEL_IBU " + rs.getString("NO_KEL_IBU");
              itemAuth = itemAuth + ", NIK_AYH " + rs.getString("NIK_AYH");
              itemAuth = itemAuth + ", KWRNGRN_AYH " + rs.getString("KWRNGRN_AYH");
              itemAuth = itemAuth + ", NAMA_LGKP_AYH " + rs.getString("NAMA_LGKP_AYH");
              itemAuth = itemAuth + ", TGL_LHIR_AYH " + rs.getString("TGL_LHIR_AYH");
              itemAuth = itemAuth + ", JENIS_PKRJN_AYH " + rs.getString("JENIS_PKRJN_AYH");
              itemAuth = itemAuth + ", ALAMAT_AYH " + rs.getString("ALAMAT_AYH");
              itemAuth = itemAuth + ", NO_RT_AYH " + rs.getString("NO_RT_AYH");
              itemAuth = itemAuth + ", DUSUN_AYH " + rs.getString("DUSUN_AYH");
              itemAuth = itemAuth + ", NO_RW_AYH " + rs.getString("NO_RW_AYH");
              itemAuth = itemAuth + ", KODEPOS_AYH " + rs.getString("KODEPOS_AYH");
              itemAuth = itemAuth + ", TELP_AYH " + rs.getString("TELP_AYH");
              itemAuth = itemAuth + ", NO_PROP_AYH " + rs.getString("NO_PROP_AYH");
              itemAuth = itemAuth + ", NO_KAB_AYH " + rs.getString("NO_KAB_AYH");
              itemAuth = itemAuth + ", NO_KEC_AYH " + rs.getString("NO_KEC_AYH");
              itemAuth = itemAuth + ", NO_KEL_AYH " + rs.getString("NO_KEL_AYH");
              itemAuth = itemAuth + ", NIK_PLPOR " + rs.getString("NIK_PLPOR");
              itemAuth = itemAuth + ", KWRNGRN_PLPOR " + rs.getString("KWRNGRN_PLPOR");
              itemAuth = itemAuth + ", TGL_MLPOR " + rs.getString("TGL_MLPOR");
              itemAuth = itemAuth + ", NIK_SKSI1 " + rs.getString("NIK_SKSI1");
              itemAuth = itemAuth + ", KWRNGRN_SKSI1 " + rs.getString("KWRNGRN_SKSI1");
              itemAuth = itemAuth + ", NIK_SKSI2 " + rs.getString("NIK_SKSI2");
              itemAuth = itemAuth + ", KWRNGRN_SKSI2 " + rs.getString("KWRNGRN_SKSI2");
              itemAuth = itemAuth + ", JENIS_DFT_LHR " + rs.getString("JENIS_DFT_LHR");
              itemAuth = itemAuth + ", DASAR_HKM_MATI " + rs.getString("DASAR_HKM_MATI");
              itemAuth = itemAuth + ", PSYRATAN_MT " + rs.getString("PSYRATAN_MT");
*/
              itemAuth = itemAuth + ", NO_AKTA_MATI " + rs.getString("NO_AKTA_MATI");
              /*
              itemAuth = itemAuth + ", TGL_AKTA_MATI " + rs.getString("TGL_AKTA_MATI");
              itemAuth = itemAuth + ", NAMA_KEP_DES " + rs.getString("NAMA_KEP_DES");
              itemAuth = itemAuth + ", NIP_LRH " + rs.getString("NIP_LRH");
              itemAuth = itemAuth + ", NAMA_PET_REG " + rs.getString("NAMA_PET_REG");
              itemAuth = itemAuth + ", NIP_PET_REG " + rs.getString("NIP_PET_REG");
              itemAuth = itemAuth + ", TGL_CTK_KTAKTA " + rs.getString("TGL_CTK_KTAKTA");
              itemAuth = itemAuth + ", NAMA_PET_ENTRI " + rs.getString("NAMA_PET_ENTRI");
              itemAuth = itemAuth + ", NIP_PET_ENTRI " + rs.getString("NIP_PET_ENTRI");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", NO_KEC " + rs.getString("NO_KEC");
              itemAuth = itemAuth + ", NO_KEL " + rs.getString("NO_KEL");
              itemAuth = itemAuth + ", FLAG_KEC " + rs.getString("FLAG_KEC");
              itemAuth = itemAuth + ", TGL_ENTRI " + rs.getString("TGL_ENTRI");
              itemAuth = itemAuth + ", TGL_UPDATION " + rs.getString("TGL_UPDATION");
              itemAuth = itemAuth + ", USER_ID " + rs.getString("USER_ID");
*/
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else if ((dokumen.equals("kutipan_akta_perceraian")) || (dokumen.equals("register_akta_perceraian"))) {
          //monitorBean.addCetakUlangAction("kutipan_akta_perceraian", "NO_AKTA_CRAI", vAkta, authBy, authTo, authDate);
          //monitorBean.addCetakUlangAction("register_akta_perceraian", "NO_AKTA_CRAI", vAkta, authBy, authTo, authDate);
          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM CATAT_CERAI WHERE "+field+"='"+list.elementAt(i).toString().trim()+"'";
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);

            if (rs.next()) {
              /*
              itemAuth = itemAuth + "NIK_SUAMI " + rs.getString("NIK_SUAMI");
              itemAuth = itemAuth + ", KWRNGRN_SUAMI " + rs.getString("KWRNGRN_SUAMI");
              itemAuth = itemAuth + ", KTRUNAN_SUAMI " + rs.getString("KTRUNAN_SUAMI");
              itemAuth = itemAuth + ", STAT_KWN_SBLM_NKH_SUAMI " + rs.getString("STAT_KWN_SBLM_NKH_SUAMI");
              itemAuth = itemAuth + ", CRAI_KE " + rs.getString("CRAI_KE");
              itemAuth = itemAuth + ", KWN_KE_SUAMI " + rs.getString("KWN_KE_SUAMI");
              itemAuth = itemAuth + ", ISTRI_KE " + rs.getString("ISTRI_KE");
              itemAuth = itemAuth + ", NIK_ISTRI " + rs.getString("NIK_ISTRI");
              itemAuth = itemAuth + ", KWRNGRN_ISTRI " + rs.getString("KWRNGRN_ISTRI");
              itemAuth = itemAuth + ", KTRUNAN_ISTRI " + rs.getString("KTRUNAN_ISTRI");
              itemAuth = itemAuth + ", STAT_KWN_SBLM_NKH_ISTRI " + rs.getString("STAT_KWN_SBLM_NKH_ISTRI");
              itemAuth = itemAuth + ", KWN_KE_ISTRI " + rs.getString("KWN_KE_ISTRI");
              itemAuth = itemAuth + ", JML_ANK " + rs.getString("JML_ANK");
              itemAuth = itemAuth + ", YG_BTGUNG_PMEL_ANK " + rs.getString("YG_BTGUNG_PMEL_ANK");
              itemAuth = itemAuth + ", YG_AJU_CRAI " + rs.getString("YG_AJU_CRAI");

              itemAuth = itemAuth + ", NO_AKTA_KWN " + rs.getString("NO_AKTA_KWN");
*/
              itemAuth = itemAuth + "NO_AKTA_KWN " + rs.getString("NO_AKTA_KWN");
              /*
              itemAuth = itemAuth + ", TGL_AKTA_KWN " + rs.getString("TGL_AKTA_KWN");
              itemAuth = itemAuth + ", TMPT_CTT_KWN " + rs.getString("TMPT_CTT_KWN");
              itemAuth = itemAuth + ", NO_SRT_KET_PN " + rs.getString("NO_SRT_KET_PN");
              itemAuth = itemAuth + ", TGL_SRT_KET_PN " + rs.getString("TGL_SRT_KET_PN");
              itemAuth = itemAuth + ", NO_KEP_PNGADIL " + rs.getString("NO_KEP_PNGADIL");
              itemAuth = itemAuth + ", TGL_SRT_KEP_PNGADIL " + rs.getString("TGL_SRT_KEP_PNGADIL");
              itemAuth = itemAuth + ", LBG_PNGADIL_KEL_KEP " + rs.getString("LBG_PNGADIL_KEL_KEP");
              itemAuth = itemAuth + ", TMPT_LBG_PNGADIL " + rs.getString("TMPT_LBG_PNGADIL");
              itemAuth = itemAuth + ", SBAB_CRAI " + rs.getString("SBAB_CRAI");
              itemAuth = itemAuth + ", TGL_DRAFT_CRAI_DRLN " + rs.getString("TGL_DRAFT_CRAI_DRLN");
              itemAuth = itemAuth + ", DASAR_HKM_CRAI " + rs.getString("DASAR_HKM_CRAI");
              itemAuth = itemAuth + ", NO_AKTA_CRAI " + rs.getString("NO_AKTA_CRAI");
              itemAuth = itemAuth + ", TGL_AKTA_CRAI " + rs.getString("TGL_AKTA_CRAI");
              itemAuth = itemAuth + ", TGL_CTK_KTAKTA " + rs.getString("TGL_CTK_KTAKTA");
              itemAuth = itemAuth + ", NAMA_PET_REG " + rs.getString("NAMA_PET_REG");
              itemAuth = itemAuth + ", NIP_PET_REG " + rs.getString("NIP_PET_REG");
              itemAuth = itemAuth + ", TGL_ENTRI " + rs.getString("TGL_ENTRI");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", NIK_PLAPOR " + rs.getString("NIK_PLAPOR");
              itemAuth = itemAuth + ", KWRNGRN_PLAPOR " + rs.getString("KWRNGRN_PLAPOR");
              itemAuth = itemAuth + ", TGL_MLAPOR " + rs.getString("TGL_MLAPOR");
*/
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else if ((dokumen.equals("kutipan_akta_perkawinan")) || (dokumen.equals("register_akta_perkawinan"))) {
          //monitorBean.addCetakUlangAction("kutipan_akta_perkawinan", "NO_AKTA_KWN", vAkta, authBy, authTo, authDate);
          //monitorBean.addCetakUlangAction("register_akta_perkawinan", "NO_AKTA_KWN", vAkta, authBy, authTo, authDate);
          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM CATAT_KAWIN WHERE "+field+"='"+list.elementAt(i).toString().trim()+"'";
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);

            if (rs.next()) {
              /*
              itemAuth = itemAuth + "NIK_SUAMI " + rs.getString("NIK_SUAMI");
              itemAuth = itemAuth + ", KWRNGRN_SUAMI " + rs.getString("KWRNGRN_SUAMI");
              itemAuth = itemAuth + ", KTRUNAN_SUAMI " + rs.getString("KTRUNAN_SUAMI");
              itemAuth = itemAuth + ", KWN_KE_SUAMI " + rs.getString("KWN_KE_SUAMI");
              itemAuth = itemAuth + ", ISTRI_KE " + rs.getString("ISTRI_KE");
              itemAuth = itemAuth + ", NIK_AYH_DR_SUAMI " + rs.getString("NIK_AYH_DR_SUAMI");
              itemAuth = itemAuth + ", KWRNGRN_AYH_SUAMI " + rs.getString("KWRNGRN_AYH_SUAMI");
              itemAuth = itemAuth + ", NAMA_AYH_SUAMI " + rs.getString("NAMA_AYH_SUAMI");
              itemAuth = itemAuth + ", TGL_LHR_AYH_SUAMI " + rs.getString("TGL_LHR_AYH_SUAMI");
              itemAuth = itemAuth + ", JENIS_PKRJN_AYH_SUAMI " + rs.getString("JENIS_PKRJN_AYH_SUAMI");
              itemAuth = itemAuth + ", ALAMAT_AYH_SUAMI " + rs.getString("ALAMAT_AYH_SUAMI");
              itemAuth = itemAuth + ", RT_AYH_SUAMI " + rs.getString("RT_AYH_SUAMI");
              itemAuth = itemAuth + ", RW_AYH_SUAMI " + rs.getString("RW_AYH_SUAMI");
              itemAuth = itemAuth + ", DUSUN_AYH_SUAMI " + rs.getString("DUSUN_AYH_SUAMI");
              itemAuth = itemAuth + ", KPOS_AYH_SUAMI " + rs.getString("KPOS_AYH_SUAMI");
              itemAuth = itemAuth + ", TLP_AYH_SUAMI " + rs.getString("TLP_AYH_SUAMI");
              itemAuth = itemAuth + ", NO_PROP_AYH_SUAMI " + rs.getString("NO_PROP_AYH_SUAMI");
              itemAuth = itemAuth + ", NO_KAB_AYH_SUAMI " + rs.getString("NO_KAB_AYH_SUAMI");
              itemAuth = itemAuth + ", NO_KEC_AYH_SUAMI " + rs.getString("NO_KEC_AYH_SUAMI");
              itemAuth = itemAuth + ", NO_KEL_AYH_SUAMI " + rs.getString("NO_KEL_AYH_SUAMI");
              itemAuth = itemAuth + ", NIK_IBU_DR_SUAMI " + rs.getString("NIK_IBU_DR_SUAMI");
              itemAuth = itemAuth + ", KWRNGRN_IBU_SUAMI " + rs.getString("KWRNGRN_IBU_SUAMI");
              itemAuth = itemAuth + ", NAMA_IBU_SUAMI " + rs.getString("NAMA_IBU_SUAMI");
              itemAuth = itemAuth + ", TGL_LHR_IBU_SUAMI " + rs.getString("TGL_LHR_IBU_SUAMI");
              itemAuth = itemAuth + ", JENIS_PKRJN_IBU_SUAMI " + rs.getString("JENIS_PKRJN_IBU_SUAMI");
              itemAuth = itemAuth + ", ALAMAT_IBU_SUAMI " + rs.getString("ALAMAT_IBU_SUAMI");
              itemAuth = itemAuth + ", RT_IBU_SUAMI " + rs.getString("RT_IBU_SUAMI");
              itemAuth = itemAuth + ", RW_IBU_SUAMI " + rs.getString("RW_IBU_SUAMI");
              itemAuth = itemAuth + ", DUSUN_IBU_SUAMI " + rs.getString("DUSUN_IBU_SUAMI");
              itemAuth = itemAuth + ", KPOS_IBU_SUAMI " + rs.getString("KPOS_IBU_SUAMI");
              itemAuth = itemAuth + ", TLP_IBU_SUAMI " + rs.getString("TLP_IBU_SUAMI");
              itemAuth = itemAuth + ", NO_PROP_IBU_SUAMI " + rs.getString("NO_PROP_IBU_SUAMI");
              itemAuth = itemAuth + ", NO_KAB_IBU_SUAMI " + rs.getString("NO_KAB_IBU_SUAMI");
              itemAuth = itemAuth + ", NO_KEC_IBU_SUAMI " + rs.getString("NO_KEC_IBU_SUAMI");
              itemAuth = itemAuth + ", NO_KEL_IBU_SUAMI " + rs.getString("NO_KEL_IBU_SUAMI");
              itemAuth = itemAuth + ", NIK_ISTRI " + rs.getString("NIK_ISTRI");
              itemAuth = itemAuth + ", KWRNGRN_ISTRI " + rs.getString("KWRNGRN_ISTRI");
              itemAuth = itemAuth + ", KTRUNAN_ISTRI " + rs.getString("KTRUNAN_ISTRI");
              itemAuth = itemAuth + ", KWN_KE_ISTRI " + rs.getString("KWN_KE_ISTRI");
              itemAuth = itemAuth + ", NIK_AYH_DR_ISTRI " + rs.getString("NIK_AYH_DR_ISTRI");
              itemAuth = itemAuth + ", KWRNGRN_AYH_DR_ISTRI " + rs.getString("KWRNGRN_AYH_DR_ISTRI");
              itemAuth = itemAuth + ", NAMA_AYH_ISTRI " + rs.getString("NAMA_AYH_ISTRI");
              itemAuth = itemAuth + ", TGL_LHR_AYH_ISTRI " + rs.getString("TGL_LHR_AYH_ISTRI");
              itemAuth = itemAuth + ", TGL_LHR_AYH_ISTRI " + rs.getString("TGL_LHR_AYH_ISTRI");
              itemAuth = itemAuth + ", JENIS_PKRJN_AYH_ISTRI " + rs.getString("JENIS_PKRJN_AYH_ISTRI");
              itemAuth = itemAuth + ", ALAMAT_AYH_ISTRI " + rs.getString("ALAMAT_AYH_ISTRI");
              itemAuth = itemAuth + ", RT_AYH_ISTRI " + rs.getString("RT_AYH_ISTRI");
              itemAuth = itemAuth + ", RW_AYH_ISTRI " + rs.getString("RW_AYH_ISTRI");
              itemAuth = itemAuth + ", DUSUN_AYH_ISTRI " + rs.getString("DUSUN_AYH_ISTRI");
              itemAuth = itemAuth + ", KPOS_AYH_ISTRI " + rs.getString("KPOS_AYH_ISTRI");
              itemAuth = itemAuth + ", TLP_AYH_ISTRI " + rs.getString("TLP_AYH_ISTRI");
              itemAuth = itemAuth + ", NO_PROP_AYH_ISTRI " + rs.getString("NO_PROP_AYH_ISTRI");
              itemAuth = itemAuth + ", NO_KAB_AYH_ISTRI " + rs.getString("NO_KAB_AYH_ISTRI");
              itemAuth = itemAuth + ", NO_KEC_AYH_ISTRI " + rs.getString("NO_KEC_AYH_ISTRI");
              itemAuth = itemAuth + ",  NO_KEL_AYH_ISTRI " + rs.getString("NO_KEL_AYH_ISTRI");
              itemAuth = itemAuth + ", NIK_IBU_DR_ISTRI " + rs.getString("NIK_IBU_DR_ISTRI");
              itemAuth = itemAuth + ", KWRNGRN_IBU_DR_ISTRI " + rs.getString("KWRNGRN_IBU_DR_ISTRI");
              itemAuth = itemAuth + ", NAMA_IBU_ISTRI " + rs.getString("NAMA_IBU_ISTRI");
              itemAuth = itemAuth + ", TGL_LHR_IBU_ISTRI " + rs.getString("TGL_LHR_IBU_ISTRI");
              itemAuth = itemAuth + ", JENIS_PKRJN_IBU_ISTRI " + rs.getString("JENIS_PKRJN_IBU_ISTRI");
              itemAuth = itemAuth + ", ALAMAT_IBU_ISTRI " + rs.getString("ALAMAT_IBU_ISTRI");
              itemAuth = itemAuth + ", RT_IBU_ISTRI " + rs.getString("RT_IBU_ISTRI");
              itemAuth = itemAuth + ", RW_IBU_ISTRI " + rs.getString("RW_IBU_ISTRI");
              itemAuth = itemAuth + ", DUSUN_IBU_ISTRI " + rs.getString("DUSUN_IBU_ISTRI");
              itemAuth = itemAuth + ", KPOS_IBU_ISTRI " + rs.getString("KPOS_IBU_ISTRI");
              itemAuth = itemAuth + ", TLP_IBU_ISTRI " + rs.getString("TLP_IBU_ISTRI");
              itemAuth = itemAuth + ", NO_PROP_IBU_ISTRI " + rs.getString("NO_PROP_IBU_ISTRI");
              itemAuth = itemAuth + ", NO_KAB_IBU_ISTRI " + rs.getString("NO_KAB_IBU_ISTRI");
              itemAuth = itemAuth + ", NO_KEC_IBU_ISTRI " + rs.getString("NO_KEC_IBU_ISTRI");
              itemAuth = itemAuth + ", NO_KEL_IBU_ISTRI " + rs.getString("NO_KEL_IBU_ISTRI");
              itemAuth = itemAuth + ", NIK_SKSI1 " + rs.getString("NIK_SKSI1");
              itemAuth = itemAuth + ", KWRNGRN_SKSI1 " + rs.getString("KWRNGRN_SKSI1");
              itemAuth = itemAuth + ", NIK_SKSI2 " + rs.getString("NIK_SKSI2");
              itemAuth = itemAuth + ", KWRNGRN_SKSI2 " + rs.getString("KWRNGRN_SKSI2");
              itemAuth = itemAuth + ", TGL_PEMBKTAN_KWN " + rs.getString("TGL_PEMBKTAN_KWN");
              itemAuth = itemAuth + ", JAM " + rs.getString("JAM");
              itemAuth = itemAuth + ", TGL_MLAPOR " + rs.getString("TGL_MLAPOR");
              itemAuth = itemAuth + ", TDUK_AGAMA " + rs.getString("TDUK_AGAMA");
              itemAuth = itemAuth + ", NAMA_TMPT_PNESAH " + rs.getString("NAMA_TMPT_PNESAH");
              itemAuth = itemAuth + ", KET_NAMA_TMPT_PNESAH " + rs.getString("KET_NAMA_TMPT_PNESAH");
              itemAuth = itemAuth + ", NAMA_PMKA_AGAMA " + rs.getString("NAMA_PMKA_AGAMA");
              itemAuth = itemAuth + ", ALAMAT_PMKA_AGAMA " + rs.getString("ALAMAT_PMKA_AGAMA");
              itemAuth = itemAuth + ", RT_PMKA_AGAMA " + rs.getString("RT_PMKA_AGAMA");
              itemAuth = itemAuth + ", RW_PMKA_AGAMA " + rs.getString("RW_PMKA_AGAMA");
              itemAuth = itemAuth + ", DUSUN_PMKA_AGAMA " + rs.getString("DUSUN_PMKA_AGAMA");
              itemAuth = itemAuth + ", KPOS_PMKA_AGAMA " + rs.getString("KPOS_PMKA_AGAMA");
              itemAuth = itemAuth + ", TLP_PMKA_AGAMA " + rs.getString("TLP_PMKA_AGAMA");
              itemAuth = itemAuth + ", NO_PROP_PMKA_AGAMA " + rs.getString("NO_PROP_PMKA_AGAMA");
              itemAuth = itemAuth + ", NO_KAB_PMKA_AGAMA " + rs.getString("NO_KAB_PMKA_AGAMA");
              itemAuth = itemAuth + ", NO_KEC_PMKA_AGAMA " + rs.getString("NO_KEC_PMKA_AGAMA");
              itemAuth = itemAuth + ", NO_KEL_PMKA_AGAMA " + rs.getString("NO_KEL_PMKA_AGAMA");
              itemAuth = itemAuth + ", TGL_DFT_KWN_LN " + rs.getString("TGL_DFT_KWN_LN");
              itemAuth = itemAuth + ", IJN_DUT_KWN_WNA " + rs.getString("IJN_DUT_KWN_WNA");
              itemAuth = itemAuth + ", DSRHK_CTTLKWN " + rs.getString("DSRHK_CTTLKWN");
              itemAuth = itemAuth + ", PSYRAT " + rs.getString("PSYRAT");

              itemAuth = itemAuth + ", NO_AKTA_KWN " + rs.getString("NO_AKTA_KWN");
                  */
              itemAuth = itemAuth + "NO_AKTA_KWN " + rs.getString("NO_AKTA_KWN");
              /*
              itemAuth = itemAuth + ", TGL_AKTA_KWN " + rs.getString("TGL_AKTA_KWN");
              itemAuth = itemAuth + ", TGL_CTK_KTAKTA " + rs.getString("TGL_CTK_KTAKTA");
              itemAuth = itemAuth + ", NAMA_KEP_DES " + rs.getString("NAMA_KEP_DES");
              itemAuth = itemAuth + ", NIP_LRH " + rs.getString("NIP_LRH");
              itemAuth = itemAuth + ", NAMA_PET_REG " + rs.getString("NAMA_PET_REG");
              itemAuth = itemAuth + ", NAMA_PLPOR " + rs.getString("NAMA_PLPOR");
              itemAuth = itemAuth + ", TGL_ENTRI " + rs.getString("TGL_ENTRI");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", STAT_SEBEL_SUAMI " + rs.getString("STAT_SEBEL_SUAMI");
              itemAuth = itemAuth + ", STAT_SEBEL_ISTRI " + rs.getString("STAT_SEBEL_ISTRI");
*/
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else if ((dokumen.equals("biodata_WNI")) || (dokumen.equals("KTP_WNI"))) {
          //monitorBean.addCetakUlangAction("biodata_WNI", "NIK", vNik, authBy, authTo, authDate);
          //monitorBean.addCetakUlangAction("KTP_WNI", "NIK", vNik, authBy, authTo, authDate);
          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM BIODATA_WNI WHERE "+field+"="+list.elementAt(i).toString().trim();
            if ((dokumen.equals("KTP_WNI")))
              sql = "SELECT * FROM BIODATA_WNI WHERE "+field+"="+ ( (ktp.wni.InfoKTP) (list.elementAt(i))).getNik().trim();
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);

            if (rs.next()) {
              itemAuth = itemAuth + "NIK " + rs.getString("NIK");
              /*
              itemAuth = itemAuth + ", NO_KTP " + rs.getString("NO_KTP");
              itemAuth = itemAuth + ", TMPT_SBL " + rs.getString("TMPT_SBL");
              itemAuth = itemAuth + ", NO_PASPOR " + rs.getString("NO_PASPOR");
              itemAuth = itemAuth + ", TGL_AKH_PASPOR " + rs.getString("TGL_AKH_PASPOR");
              itemAuth = itemAuth + ", NAMA_LGKP " + rs.getString("NAMA_LGKP");
              itemAuth = itemAuth + ", JENIS_KLMIN " + rs.getString("JENIS_KLMIN");
              itemAuth = itemAuth + ", TMPT_LHR " + rs.getString("TMPT_LHR");
              itemAuth = itemAuth + ", TGL_LHR " + rs.getString("TGL_LHR");
              itemAuth = itemAuth + ", AKTA_LHR " + rs.getString("AKTA_LHR");
              itemAuth = itemAuth + ", NO_AKTA_LHR " + rs.getString("NO_AKTA_LHR");
              itemAuth = itemAuth + ", GOL_DRH " + rs.getString("GOL_DRH");
              itemAuth = itemAuth + ", AGAMA " + rs.getString("AGAMA");
              itemAuth = itemAuth + ", STAT_KWN " + rs.getString("STAT_KWN");
              itemAuth = itemAuth + ", AKTA_KWN " + rs.getString("AKTA_KWN");
              itemAuth = itemAuth + ", NO_AKTA_KWN " + rs.getString("NO_AKTA_KWN");
              itemAuth = itemAuth + ", TGL_KWN " + rs.getString("TGL_KWN");
              itemAuth = itemAuth + ", AKTA_CRAI " + rs.getString("AKTA_CRAI");
              itemAuth = itemAuth + ", NO_AKTA_CRAI " + rs.getString("NO_AKTA_CRAI");
              itemAuth = itemAuth + ", TGL_CRAI " + rs.getString("TGL_CRAI");
              itemAuth = itemAuth + ", STAT_HBKEL " + rs.getString("STAT_HBKEL");
              itemAuth = itemAuth + ", KLAIN_FSK " + rs.getString("KLAIN_FSK");
              itemAuth = itemAuth + ", PNYDNG_CCT " + rs.getString("PNYDNG_CCT");
              itemAuth = itemAuth + ", PDDK_AKH " + rs.getString("PDDK_AKH");
              itemAuth = itemAuth + ", JENIS_PKRJN " + rs.getString("JENIS_PKRJN");
              itemAuth = itemAuth + ", NIK_IBU " + rs.getString("NIK_IBU");
              itemAuth = itemAuth + ", NAMA_LGKP_IBU " + rs.getString("NAMA_LGKP_IBU");
              itemAuth = itemAuth + ", NIK_AYAH " + rs.getString("NIK_AYAH");
              itemAuth = itemAuth + ", NAMA_LGKP_AYAH " + rs.getString("NAMA_LGKP_AYAH");
              itemAuth = itemAuth + ", NAMA_KET_RT " + rs.getString("NAMA_KET_RT");
              itemAuth = itemAuth + ", NAMA_KET_RW " + rs.getString("NAMA_KET_RW");
              itemAuth = itemAuth + ", NAMA_PET_REG " + rs.getString("NAMA_PET_REG");
              itemAuth = itemAuth + ", NIP_PET_REG " + rs.getString("NIP_PET_REG");
              itemAuth = itemAuth + ", NAMA_PET_ENTRI " + rs.getString("NAMA_PET_ENTRI");
              itemAuth = itemAuth + ", NIP_PET_ENTRI " + rs.getString("NIP_PET_ENTRI");
              itemAuth = itemAuth + ", TGL_ENTRI " + rs.getString("TGL_ENTRI");
              itemAuth = itemAuth + ", NO_KK " + rs.getString("NO_KK");
              itemAuth = itemAuth + ", JENIS_BNTU " + rs.getString("JENIS_BNTU");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", NO_KEC " + rs.getString("NO_KEC");
              itemAuth = itemAuth + ", NO_KEL " + rs.getString("NO_KEL");
              itemAuth = itemAuth + ", STAT_HIDUP " + rs.getString("STAT_HIDUP");
              itemAuth = itemAuth + ", TGL_UBAH " + rs.getString("TGL_UBAH");
              itemAuth = itemAuth + ", TGL_CETAK_KTP " + rs.getString("TGL_CETAK_KTP");
              itemAuth = itemAuth + ", TGL_GANTI_KTP " + rs.getString("TGL_GANTI_KTP");
              itemAuth = itemAuth + ", TGL_PJG_KTP " + rs.getString("TGL_PJG_KTP");
              itemAuth = itemAuth + ", STAT_KTP " + rs.getString("STAT_KTP");
              itemAuth = itemAuth + ", ALS_NUMPANG " + rs.getString("ALS_NUMPANG");
*/
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else if ((dokumen.equals("biodata_WNA")) || (dokumen.equals("KTP_WNA"))) {
          //monitorBean.addCetakUlangAction("biodata_WNA", "NIK", vNik, authBy, authTo, authDate);
          //monitorBean.addCetakUlangAction("KTP_WNA", "NIK", vNik, authBy, authTo, authDate);

          for (int i = 0; i < list.size(); i++) {
            sql = "SELECT * FROM BIODATA_WNA WHERE "+field+"="+list.elementAt(i).toString().trim().substring(1);
            if ((dokumen.equals("KTP_WNA")))
              sql = "SELECT * FROM BIODATA_WNA WHERE "+field+"="+ ( (ktp.wni.InfoKTP) (list.elementAt(i))).getNik().trim().substring(1);
            System.out.println(sql);
            ResultSet rs = null;
            itemAuth = "";
            rs = st.executeQuery(sql);

            if (rs.next()) {
              itemAuth = itemAuth + "NIK " + rs.getString("NIK");
              /*
              itemAuth = itemAuth + ", NAMA_KLRGA " + rs.getString("NAMA_KLRGA");
              itemAuth = itemAuth + ", NAMA_PERTMA " + rs.getString("NAMA_PERTMA");
              itemAuth = itemAuth + ", JENIS_KLMIN " + rs.getString("JENIS_KLMIN");
              itemAuth = itemAuth + ", TMPT_LHR " + rs.getString("TMPT_LHR");
              itemAuth = itemAuth + ", TGL_LHR " + rs.getString("TGL_LHR");
              itemAuth = itemAuth + ", KWRNGRN " + rs.getString("KWRNGRN");
              itemAuth = itemAuth + ", AGAMA " + rs.getString("AGAMA");
              itemAuth = itemAuth + ", GOL_DRH " + rs.getString("GOL_DRH");
              itemAuth = itemAuth + ", STAT_KWN " + rs.getString("STAT_KWN");
              itemAuth = itemAuth + ", PDDK_AKH " + rs.getString("PDDK_AKH");
              itemAuth = itemAuth + ", JENIS_PKRJN " + rs.getString("JENIS_PKRJN");
              itemAuth = itemAuth + ", ALAMAT_SPSOR " + rs.getString("ALAMAT_SPSOR");
              itemAuth = itemAuth + ", NO_RT " + rs.getString("NO_RT");
              itemAuth = itemAuth + ", NO_RW " + rs.getString("NO_RW");
              itemAuth = itemAuth + ", KODEPOS " + rs.getString("KODEPOS");
              itemAuth = itemAuth + ", TELEPON " + rs.getString("TELEPON");
              itemAuth = itemAuth + ", DATNG_DARI " + rs.getString("DATNG_DARI");
              itemAuth = itemAuth + ", TUJUAN_DTNG " + rs.getString("TUJUAN_DTNG");
              itemAuth = itemAuth + ", NO_PASPOR " + rs.getString("NO_PASPOR");
              itemAuth = itemAuth + ", TGL_PASPOR " + rs.getString("TGL_PASPOR");
              itemAuth = itemAuth + ", TGL_AKH_PASPOR " + rs.getString("TGL_AKH_PASPOR");
              itemAuth = itemAuth + ", NAMA_SPSOR " + rs.getString("NAMA_SPSOR");
              itemAuth = itemAuth + ", TIPE_SPSOR " + rs.getString("TIPE_SPSOR");
              itemAuth = itemAuth + ", DOK_IMGR " + rs.getString("DOK_IMGR");
              itemAuth = itemAuth + ", NO_DOK " + rs.getString("NO_DOK");
              itemAuth = itemAuth + ", TMPT_DTBIT " + rs.getString("TMPT_DTBIT");
              itemAuth = itemAuth + ", TGL_DTBIT " + rs.getString("TGL_DTBIT");
              itemAuth = itemAuth + ", TGL_AKH_DOK " + rs.getString("TGL_AKH_DOK");
              itemAuth = itemAuth + ", TMPT_DTNG_PERT " + rs.getString("TMPT_DTNG_PERT");
              itemAuth = itemAuth + ", TGL_DTNG_PERT " + rs.getString("TGL_DTNG_PERT");
              itemAuth = itemAuth + ", NO_STLD " + rs.getString("NO_STLD");
              itemAuth = itemAuth + ", TGL_DFT " + rs.getString("TGL_DFT");
              itemAuth = itemAuth + ", NAMA_DIN " + rs.getString("NAMA_DIN");
              itemAuth = itemAuth + ", NAMA_KEP_DIN " + rs.getString("NAMA_KEP_DIN");
              itemAuth = itemAuth + ", NIP_KEP_DIN " + rs.getString("NIP_KEP_DIN");
              itemAuth = itemAuth + ", NAMA_PET_ENTRI " + rs.getString("NAMA_PET_ENTRI");
              itemAuth = itemAuth + ", NIP_PET_ENTRI " + rs.getString("NIP_PET_ENTRI");
              itemAuth = itemAuth + ", TGL_ENTRI " + rs.getString("TGL_ENTRI");
              itemAuth = itemAuth + ", NO_KK " + rs.getString("NO_KK");
              itemAuth = itemAuth + ", NO_PROP " + rs.getString("NO_PROP");
              itemAuth = itemAuth + ", NO_KAB " + rs.getString("NO_KAB");
              itemAuth = itemAuth + ", STAT_KTP " + rs.getString("STAT_KTP");
              itemAuth = itemAuth + ", STAT_HIDUP " + rs.getString("STAT_HIDUP");
              itemAuth = itemAuth + ", TGL_UBAH " + rs.getString("TGL_UBAH");
              itemAuth = itemAuth + ", NO_KEC " + rs.getString("NO_KEC");
              itemAuth = itemAuth + ", NO_KEL " + rs.getString("NO_KEL");
              itemAuth = itemAuth + ", STAT_HBKEL " + rs.getString("STAT_HBKEL");
              itemAuth = itemAuth + ", TGL_CETAK_KTP " + rs.getString("TGL_CETAK_KTP");
              itemAuth = itemAuth + ", TGL_GANTI_KTP " + rs.getString("TGL_GANTI_KTP");
              itemAuth = itemAuth + ", TGL_PJG_KTP " + rs.getString("TGL_PJG_KTP");
              itemAuth = itemAuth + ", ALS_NUMPANG " + rs.getString("ALS_NUMPANG");
*/
              saveForMonitorCetakUlang(conn, authBy, authTo, itemAuth, dokumen, authDate);
            }
          }
        } else {
          throw new Exception("Unkown Document Type");
        }
      }
      finally {
        if (st != null) {
          st.close();
          st = null;
        }

        if (conn != null) {
          conn.close();
          conn = null;
        }
      }
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }

  }

  public Vector findAllCetakUlang() {
    Vector result = new Vector();
    String sql = "SELECT * FROM  MONITOR_CETAK_ULANG ORDER BY ITEM_AUTH ASC, DATE_AUTH  DESC";

    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement st = null;

    conn = connectorDb.getConnection();

    try {
      try {
        st = conn.createStatement();
        System.out.println(sql);
        rs = st.executeQuery(sql);
        while (rs.next()) {
          //AUTH_BY, AUTH_TO, ITEM_AUTH, DATE_AUTH, JENIS_DOC, COUNT_CETAK
          UlangObject temp = new UlangObject();
          temp.setAuthBy(rs.getString("AUTH_BY"));
          temp.setAuthTo(rs.getString("AUTH_TO"));
          temp.setItemAuth(rs.getString("ITEM_AUTH"));
          temp.setDateAuth(rs.getDate("DATE_AUTH"));
          temp.setJenisDoc(rs.getString("JENIS_DOC"));
          temp.setCountCetak(rs.getInt("COUNT_CETAK"));
          result.add(temp);
        }
      }
      finally {
        if (rs != null) {
          rs.close();
          rs = null;
        }

        if (st != null) {
          st.close();
          st = null;
        }

        if (conn != null) {
          conn.close();
          conn = null;
        }
      }
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }

    return result;
  }

  private void saveForMonitorCetakUlang(Connection conn, String authBy,  String authTo, String itemAuth, String dokumen, java.util.Date authDate)  throws Exception {

        UlangObject obj = new UlangObject();
        obj.setAuthBy(authBy);
        obj.setAuthTo(authTo);
        obj.setDateAuth(authDate);
        obj.setItemAuth(itemAuth);
        obj.setJenisDoc(dokumen);

        Statement st = null, st2 = null;
        ResultSet rs2 = null;

        try {
          System.out.println("obj.getAuthBy()="+obj.getAuthBy());
          System.out.println("obj.getAuthTo()="+obj.getAuthTo());
          System.out.println("obj.getItemAuth()="+obj.getItemAuth());
          System.out.println("obj.getDateAuth()="+obj.getDateAuth());
          String sql2 =
              "INSERT INTO MONITOR_CETAK_ULANG(AUTH_BY, AUTH_TO, ITEM_AUTH, DATE_AUTH, JENIS_DOC) " +
              "VALUES('" + obj.getAuthBy() + "','" + obj.getAuthTo() + "','" +
              obj.getItemAuth() + "', to_date('" +
              new java.sql.Date(obj.getDateAuth().getTime()).toString() + " " +
              obj.getDateAuth().getHours() + ":" + obj.getDateAuth().getMinutes() +
              ":" + obj.getDateAuth().getSeconds() +
              "', 'yyyy-mm-dd hh24:mi:ss'),'" +
              obj.getJenisDoc() + "')";
          System.out.println(sql2);

          String sql1 =
              "SELECT DISTINCT COUNT(*) FROM MONITOR_CETAK_ULANG WHERE JENIS_DOC='" +
              obj.getJenisDoc() + "' AND ITEM_AUTH='" + obj.getItemAuth()+"'";
          System.out.println(sql1);
          st2 = conn.createStatement();

          rs2 = st2.executeQuery(sql1);
          System.out.println("1");
          if (rs2.next()) {

            int ulang = rs2.getInt(1) + 1;

            String sql3 = "UPDATE MONITOR_CETAK_ULANG SET COUNT_CETAK=" + ulang +
                " WHERE JENIS_DOC='" + obj.getJenisDoc() + "' AND ITEM_AUTH ='" + obj.getItemAuth()+"'";

            System.out.println(sql3);
            st = conn.createStatement();
            int count = st.executeUpdate(sql2);
            System.out.println("2");
            if (count > 0) {
              st.executeUpdate(sql3);
              System.out.println("3");
            }
          }
        } finally {
          try {
            st.close();
            st = null;
          }
          catch (Exception ex1) {
          }
          try {
            st2.close();
          }
          catch (Exception ex2) {
            st2 = null;
          }
        }

  }


}