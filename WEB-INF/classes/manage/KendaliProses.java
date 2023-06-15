package manage;

import java.io.*;
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

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class KendaliProses implements Serializable {
  public KendaliProses() {
  }
  public void InsertKendali(Vector v) {
    boolean b = false;
    ServiceEntity updateWni = null;
   // BiodataWni updateRemote = null;
    //BiodataWniHome updateHome = null;
    String tgl1 = "", tgl2 = "", tgl3 = "",tgl4="";
   // DataKeluarga remote = null;
   // DataKeluargaHome home = null;
    String sysDate = null;
    Connection conn = null;
    CallableStatement cs = null;

    //sysDate = getTrimData(v.elementAt(39));
    try{
        ConnectorDB connectorDb = new ConnectorDB();
        conn = connectorDb.getConnection();
        //cs = conn.prepareCall("{? = call INS_NK1(?,?,?)}");
        //--s                                                 10                  20                   30              38
        cs = conn.prepareCall("{call INS_NK2(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        //cs.registerOutParameter(1, java.sql.Types.VARCHAR);
        //cs.registerOutParameter(1, java.sql.Types.NUMERIC);
        String tglsatu="";
        String tgldua="";
        System.out.println("==============================");
        System.out.println("======insert master kendali===");
        System.out.println("==============39===============");
        System.out.println("0 "+v.elementAt(0));
        System.out.println("Prop "+ Integer.parseInt(v.elementAt(42).toString()));
        System.out.println("Kab "+ Integer.parseInt(v.elementAt(43).toString()));
        cs.setInt(1,Integer.parseInt(v.elementAt(42).toString()));
        System.out.println("1 "+v.elementAt(1));
        cs.setInt(2,Integer.parseInt(v.elementAt(43).toString()));
        System.out.println("2 "+v.elementAt(2));
        cs.setString(3,v.elementAt(0).toString());
        System.out.println("Surat MDN "+v.elementAt(0).toString());
        System.out.println("3 "+v.elementAt(3));
        tglsatu = v.elementAt(1)+"-"+v.elementAt(2)+"-"+v.elementAt(3);
        System.out.println("tglsatu " + tglsatu);
        cs.setString(4,tglsatu);
        //cs.setString(4,"");
        System.out.println("4 "+v.elementAt(4));
        cs.setString(5,v.elementAt(4).toString());
        System.out.println("SRT ASL "+v.elementAt(4).toString());
        System.out.println("5 "+v.elementAt(5));
        System.out.println("6 "+v.elementAt(6));
        System.out.println("7 "+v.elementAt(7));
        tgldua = v.elementAt(5)+"-"+v.elementAt(6)+"-"+v.elementAt(7);
        System.out.println("tgldua " + tgldua);
        cs.setString(6,tgldua);
        //cs.setString(6,"");
        System.out.println("8 "+v.elementAt(8));
        if (v.elementAt(8).equals("KTP")) {
          System.out.println("9 A KTP "+Integer.parseInt(v.elementAt(9).toString()));
          System.out.println("10 B KTP "+Integer.parseInt(v.elementAt(10).toString()));
          System.out.println("11 P KTP "+Integer.parseInt(v.elementAt(11).toString()));
          cs.setInt(7,Integer.parseInt(v.elementAt(9).toString()));
          cs.setInt(8,Integer.parseInt(v.elementAt(10).toString()));
          cs.setInt(9,Integer.parseInt(v.elementAt(11).toString()));
          //cs.setInt(10,Integer.parseInt(v.elementAt(11).toString()));

        }
        else {
          System.out.println("9 A KTP"+"");
          System.out.println("10 B KTP"+"");
          System.out.println("11 P KTP"+"");
          cs.setInt(7,0);
          cs.setInt(8,0);
          cs.setInt(9,0);
          //cs.setInt(10,1);
        }

        System.out.println("==============12 - 30===============");
        System.out.println("12"+v.elementAt(12));
        if (v.elementAt(12).equals("KK")) {
          System.out.println("13" + v.elementAt(13));
          System.out.println("14" + v.elementAt(14));
          System.out.println("15" + v.elementAt(15));
          cs.setInt(10,Integer.parseInt(v.elementAt(13).toString()));
          cs.setInt(11,Integer.parseInt(v.elementAt(14).toString()));
          cs.setInt(12,Integer.parseInt(v.elementAt(15).toString()));
          //cs.setInt(10,Integer.parseInt(v.elementAt(11).toString()));

        }
        else {
          System.out.println("13 "+"");
          System.out.println("14 "+"");
          System.out.println("15 "+"");
          cs.setInt(10,0);
          cs.setInt(11,0);
          cs.setInt(12,0);

        }
        System.out.println("16"+v.elementAt(16));
        if (v.elementAt(16).equals("KAL")) {
          System.out.println("17" + v.elementAt(17));
          System.out.println("18" + v.elementAt(18));
          System.out.println("19" + v.elementAt(19));
          cs.setInt(13,Integer.parseInt(v.elementAt(17).toString()));
          cs.setInt(14,Integer.parseInt(v.elementAt(18).toString()));
          cs.setInt(15,Integer.parseInt(v.elementAt(19).toString()));

        }
        else {
          System.out.println("17 "+"");
          System.out.println("18 "+"");
          System.out.println("19 "+"");
          cs.setInt(13,0);
          cs.setInt(14,0);
          cs.setInt(15,0);

        }
        System.out.println("20"+v.elementAt(20));
         if (v.elementAt(20).equals("KAM")) {
           System.out.println("21" + v.elementAt(21));
           System.out.println("22" + v.elementAt(22));
           System.out.println("23" + v.elementAt(23));
           cs.setInt(16,Integer.parseInt(v.elementAt(21).toString()));
          cs.setInt(17,Integer.parseInt(v.elementAt(22).toString()));
          cs.setInt(18,Integer.parseInt(v.elementAt(23).toString()));

         }
        else {
          System.out.println("21 "+"");
          System.out.println("22 "+"");
          System.out.println("23 "+"");
          cs.setInt(16,0);
          cs.setInt(17,0);
          cs.setInt(18,0);

        }
        System.out.println("24"+v.elementAt(24));
        if (v.elementAt(24).equals("KAC")) {
          System.out.println("25" + v.elementAt(25));
          System.out.println("26" + v.elementAt(26));
          System.out.println("27" + v.elementAt(27));
          cs.setInt(19,Integer.parseInt(v.elementAt(25).toString()));
          cs.setInt(20,Integer.parseInt(v.elementAt(26).toString()));
          cs.setInt(21,Integer.parseInt(v.elementAt(27).toString()));

        }
        else {
          System.out.println("25 "+"");
          System.out.println("26 "+"");
          System.out.println("27 "+"");
          cs.setInt(19,0);
          cs.setInt(20,0);
          cs.setInt(21,0);
        }
        System.out.println("28"+v.elementAt(28));
        if (v.elementAt(28).equals("KAW")) {
          System.out.println("29" + v.elementAt(29));
          System.out.println("30" + v.elementAt(30));
          System.out.println("31" + v.elementAt(31));
          cs.setInt(22,Integer.parseInt(v.elementAt(29).toString()));
          cs.setInt(23,Integer.parseInt(v.elementAt(30).toString()));
          cs.setInt(24,Integer.parseInt(v.elementAt(31).toString()));

        }
        else {
          System.out.println("29 "+"");
          System.out.println("30 "+"");
          System.out.println("31 "+"");
          cs.setInt(22,0);
          cs.setInt(23,0);
          cs.setInt(24,0);

        }
        System.out.println("==============31 - 38===============");
        System.out.println("32"+v.elementAt(32));
         if (v.elementAt(32).equals("KAP")) {
           System.out.println("33" + Integer.parseInt(v.elementAt(33).toString()));
           System.out.println("34" + v.elementAt(34));
           System.out.println("35" + v.elementAt(35));
           cs.setInt(25,Integer.parseInt(v.elementAt(33).toString()));
          cs.setInt(26,Integer.parseInt(v.elementAt(34).toString()));
          cs.setInt(27,Integer.parseInt(v.elementAt(35).toString()));

         }
         else {
          System.out.println("33 "+"");
          System.out.println("34 "+"");
          System.out.println("35 "+"");
          cs.setInt(25,0);
          cs.setInt(26,0);
          cs.setInt(27,0);

         }
        System.out.println("36"+v.elementAt(36).toString());
        cs.setString(28,v.elementAt(36).toString());
        System.out.println("37"+v.elementAt(37).toString());
        cs.setString(29,v.elementAt(37).toString());
        System.out.println("38"+v.elementAt(38).toString());
        cs.setString(30,v.elementAt(38).toString());
        System.out.println("39"+v.elementAt(39).toString());
        cs.setString(31,v.elementAt(39).toString());
        //cs.setString(31,"");
        System.out.println("40"+v.elementAt(40));
        System.out.println("41"+v.elementAt(41).toString());
        cs.setString(32,v.elementAt(41).toString());
        //cs.setString(32,"");
        cs.setString(33,"Y");
        cs.setString(34,"Y");
        cs.setString(35,"Y");
        cs.setString(36,"Y");
        cs.setString(37,"Y");
        cs.setString(38,"Y");

        cs.execute();
        System.out.println("==============================");
        System.out.println("===master kendali terbaharui==");
        System.out.println("==============================");

        //returnval1 = cs.getString(1); //Returned NIK
      }catch(Exception nikerr)
      {
        nikerr.printStackTrace();
      }

  }
  public int CekKendali(String nk_prop, String nk_kab) {
    int nil_ret=0;
    String sql_pil="";
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement stmt = null;
    try {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      System.out.println("Cek Kendali <from servlet>");
      sql_pil = "SELECT COUNT(*) HIT FROM SETUP_NK WHERE " +
          "NO_PROP = ? AND NO_KAB = ?";
      stmt = conn.prepareStatement(sql_pil);
      stmt.setString(1,nk_prop.trim());
      stmt.setString(2,nk_kab.trim());
      rs = stmt.executeQuery();
      while (rs.next())
      {
      nil_ret = rs.getInt("HIT");
      }
      rs.close();
      rs = null;
      stmt.close();
      stmt = null;
      conn.close();


    }
    catch(Exception nerr) {
      nerr.printStackTrace();
    }
    return nil_ret;
  }
  public Vector GetDataKendali(String deProp, String deKab) {
     Vector vData = new Vector();
     ConnectorDB connectorDb = new ConnectorDB();
     KendaliProsesObject obj = null;
     Connection conn = null;
     ResultSet rs = null;
     CallableStatement stmt = null;
     String query = "";
     Statement st = null;
     conn = connectorDb.getConnection();
     try
  {
      query = "begin ? := get_kendali(?,?); end;";
      stmt = conn.prepareCall(query);
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
      stmt.setString(2, deProp.trim());
      stmt.setString(3, deKab.trim());
      stmt.execute();
      //===
      rs = (ResultSet)stmt.getObject(1);
      while (rs.next()) {
        String PNO_PROP           = rs.getString("NO_PROP");
        String PNO_KAB = rs.getString("NO_KAB");
        String PNO_SRT_MDN = rs.getString("NO_SRT_MDN");
        String PTGL_SRT_MDN = rs.getString("TGL_SRT_MDN");
        String PNO_SRT_ASL = rs.getString("NO_SRT_ASL");
        String PTGL_SRT_ASL = rs.getString("TGL_SRT_ASL");
        //String PKTP_START = rs.getString("KTP_START");
        int lktp_start = rs.getInt("KTP_START");
        String PKTP_START = String.valueOf(lktp_start);
        String PKTP_END = rs.getString("KTP_END");
        String PIDX_KTP = rs.getString("IDX_KTP");
        System.out.println("PKTP_START : "+lktp_start);
        System.out.println("PKTP_START : "+PKTP_START);
        System.out.println("PKTP_END : "+PKTP_END);
        System.out.println("PIDX_KTP : "+PIDX_KTP);
        String PKK_START = rs.getString("KK_START");
        String PKK_END = rs.getString("KK_END");
        String PIDX_KK = rs.getString("IDX_KK");
        String PLAHIR_START = rs.getString("LAHIR_START");
        String PLAHIR_END = rs.getString("LAHIR_END");
        String PIDX_LAHIR = rs.getString("IDX_LAHIR");
        String PKWN_START = rs.getString("KWN_START");
        String PKWN_END = rs.getString("KWN_END");
        String PIDX_KWN = rs.getString("IDX_KWN");
        String PCRI_START = rs.getString("CRI_START");
        String PCRI_END = rs.getString("CRI_END");
        String PIDX_CRI = rs.getString("IDX_CRI");
        String PMTI_START = rs.getString("MTI_START");
        String PMTI_END = rs.getString("MTI_END");
        String PIDX_MTI = rs.getString("IDX_MTI");
        String PPNG_ANK_START = rs.getString("PNG_ANK_START");
        String PPNG_ANK_END = rs.getString("PNG_ANK_END");
        String PIDX_PNG_ANK = rs.getString("IDX_PNG_ANK");
        String PNAMA_PET_OTO = rs.getString("NAMA_PET_OTO");
        String PNIP_PET_OTO = rs.getString("NIP_PET_OTO");
        String PJAB_OTO = rs.getString("JAB_OTO");
        String PUSER_ID = rs.getString("USER_ID");
        String PTGL_ENTRY = rs.getString("TGL_ENTRY");
        String PSTAT_KTP = rs.getString("STAT_KTP");
        String PSTAT_KK = rs.getString("STAT_KK");
        String PSTAT_LAHIR = rs.getString("STAT_LAHIR");
        String PSTAT_KWN = rs.getString("STAT_KWN");
        String PSTAT_CRI = rs.getString("STAT_CRI");
        String PSTAT_MTI = rs.getString("STAT_MTI");
        String PSTAT_PNG = rs.getString("STAT_PNG");
        String PNK_MAX = rs.getString("NK_MAX");

        obj = new KendaliProsesObject(PNO_PROP, PNO_KAB, PNO_SRT_MDN, PTGL_SRT_MDN, PNO_SRT_ASL, PTGL_SRT_ASL, PKTP_START, PKTP_END,
                                      PIDX_KTP, PKK_START, PKK_END, PIDX_KK,
                                      PLAHIR_START, PLAHIR_END, PIDX_LAHIR,
                                      PKWN_START, PKWN_END,
                                      PIDX_KWN, PCRI_START, PCRI_END, PIDX_CRI,
                                      PMTI_START, PMTI_END, PIDX_MTI,
                                      PPNG_ANK_START, PPNG_ANK_END,
                                      PIDX_PNG_ANK, PNAMA_PET_OTO, PNIP_PET_OTO,
                                      PJAB_OTO, PUSER_ID, PTGL_ENTRY, PSTAT_KTP,
                                      PSTAT_KK,
                                      PSTAT_LAHIR, PSTAT_KWN, PSTAT_CRI,
                                      PSTAT_MTI, PSTAT_PNG, PNK_MAX);
        vData.addElement(obj);
      }

  } catch (Exception epRr) {
      epRr.printStackTrace();
  }
     return vData;
  }
  public String getNomorKendali(String noProp, String noKab, String noKk) {
    String deNoKendali="0";
    ConnectorDB connectorDb = new ConnectorDB();
    KendaliProsesObject obj = null;
    Connection conn = null;
    ResultSet rs = null;
    CallableStatement stmt = null;
    String query = "";
    Statement st = null;
    String hslQuery = "";
    conn = connectorDb.getConnection();
    try
  {
      query = "begin ? := getkkkendali(?,?,?); end;";
      stmt = conn.prepareCall(query);
      stmt.registerOutParameter(1, OracleTypes.CHAR);
      stmt.setString(2, noProp.trim());
      stmt.setString(3, noKab.trim());
      stmt.setString(4, noKk.trim());
      stmt.execute();
      //===
      //rs = (ResultSet)stmt.getObject(1);
      hslQuery = stmt.getObject(1).toString();
      deNoKendali = hslQuery;


  } catch (Exception epRr) {
      epRr.printStackTrace();
  }

    //--hasil
    return deNoKendali;
  }
  public String getNomorKtpKendali(String noProp, String noKab, String noKtp, String moCetak) {
    String deNoKendali="0";
    ConnectorDB connectorDb = new ConnectorDB();
    KendaliProsesObject obj = null;
    Connection conn = null;
    ResultSet rs = null;
    CallableStatement stmt = null;
    String query = "";
    Statement st = null;
    String hslQuery = "";
    conn = connectorDb.getConnection();
    try
  {
      query = "begin ? := Getktpkendali(?,?,?,?); end;";
      stmt = conn.prepareCall(query);
      stmt.registerOutParameter(1, OracleTypes.CHAR);
      stmt.setString(2, noProp.trim());
      stmt.setString(3, noKab.trim());
      stmt.setString(4, noKtp.trim());
      stmt.setString(5, moCetak.trim());
      stmt.execute();
      //===
      //rs = (ResultSet)stmt.getObject(1);
      hslQuery = stmt.getObject(1).toString();
      deNoKendali = hslQuery;


  } catch (Exception epRr) {
      epRr.printStackTrace();
  }

    //--hasil
    return deNoKendali;
  }

}