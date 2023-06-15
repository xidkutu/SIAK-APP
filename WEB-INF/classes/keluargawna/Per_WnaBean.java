package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class Per_WnaBean implements SessionBean {
  SessionContext sessionContext;
  Vector ve;
  String nik;
  String sql;
  Statement st;
  ConnectorDB con_db;
  Connection con;
  ResultSet rs;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "Per_WnaBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

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

  public Vector getBiodataWna(String nik, String no_prop, String no_kab)
  {
    this.nik = nik;
  try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();

     if (con!=null)
             {
               st = con.createStatement();

               sql = "select * from vw_biodata_wna where nik=" + this.nik+" and no_prop="+no_prop
              +" and no_kab="+no_kab;

               rs = st.executeQuery(sql);
               ve = new Vector();
                if (rs != null) {
                while ( rs.next()) {
                Individu new_record = new Individu(rs.getString("NIK"),
                                                                      rs.getString("NAMA_KLRGA"),
                                                                      rs.getString("NAMA_PERTMA"),
                                                                      rs.getString("JENIS_KLMIN"),
                                                                      rs.getString("TMPT_LHR"),
                                                                      rs.getString("DD_TGL_LAHIR"),
                                                                      rs.getString("MM_TGL_LAHIR"),
                                                                      rs.getString("YY_TGL_LAHIR"),
                                                                      rs.getString("KWRNGRN"),
                                                                      rs.getString("AGAMA"),
                                                                      rs.getString("GOL_DRH"),
                                                                      rs.getString("STAT_KWN"),
                                                                      rs.getString("PDDK_AKH"),
                                                                      rs.getString("JENIS_PKRJN"),
                                                                      rs.getString("ALAMAT_SPSOR"),
                                                                      rs.getString("NO_RT"),
                                                                      rs.getString("NO_RW"),
                                                                      rs.getString("KODEPOS"),
                                                                      rs.getString("TELEPON"),
                                                                      rs.getString("DATNG_DARI"),
                                                                      rs.getString("TUJUAN_DTNG"),
                                                                      rs.getString("NO_PASPOR"),
                                                                      rs.getString("DD_TGL_PASPOR"),
                                                                      rs.getString("MM_TGL_PASPOR"),
                                                                      rs.getString("YY_TGL_PASPOR"),
                                                                      rs.getString("DD_TGL_AKH_PASPOR"),
                                                                      rs.getString("MM_TGL_AKH_PASPOR"),
                                                                      rs.getString("YY_TGL_AKH_PASPOR"),
                                                                      rs.getString("NAMA_SPSOR"),
                                                                      rs.getString("TIPE_SPSOR"),
                                                                      rs.getString("DOK_IMGR"),
                                                                      rs.getString("NO_DOK"),
                                                                      rs.getString("TMPT_DTBIT"),
                                                                      rs.getString("DD_TGL_DTBIT"),
                                                                      rs.getString("MM_TGL_DTBIT"),
                                                                      rs.getString("YY_TGL_DTBIT"),
                                                                      rs.getString("DD_TGL_AKH_DOK"),
                                                                      rs.getString("MM_TGL_AKH_DOK"),
                                                                      rs.getString("YY_TGL_AKH_DOK"),
                                                                      rs.getString("TMPT_DTNG_PERT"),
                                                                      rs.getString("DD_TGL_DTNG_PERT"),
                                                                      rs.getString("MM_TGL_DTNG_PERT"),
                                                                      rs.getString("YY_TGL_DTNG_PERT"),
                                                                      rs.getString("NO_STLD"),
                                                                      rs.getString("DD_TGL_DFT"),
                                                                      rs.getString("MM_TGL_DFT"),
                                                                      rs.getString("YY_TGL_DFT"),
                                                                      rs.getString("NAMA_DIN"),
                                                                      rs.getString("NAMA_KEP_DIN"),
                                                                      rs.getString("NIP_KEP_DIN"),
                                                                      rs.getString("NAMA_PET_ENTRI"),
                                                                      rs.getString("NIP_PET_ENTRI"),
                                                                      rs.getString("TGL_ENTRI"),
                                                                      rs.getString("NO_KK"),
                                                                      rs.getString("NAMA_KEP"),
                                                                      rs.getString("ALAMAT"),
                                                                      rs.getString("STAT_HBKEL"),
                                                                      rs.getString("NO_KEC"),
                                                                      rs.getString("NAMAKEC"),
                                                                      rs.getString("NO_KEL"),
                                                                      rs.getString("NAMAKEL"),
                                                                      rs.getString("pflag"),
                                                                      rs.getString("cflag")
                                                                      );

ve.addElement(new_record);

              }
               }

               rs.close();
               st.close();
               con.close();
             }
   }catch(Exception e)
   {
     siakWriter.writeFile(e);
     System.out.println("Error in Per_WnaBean=" + e.toString());
   }

   finally{
     try {
               if (rs != null)
                 rs.close();
             }  catch (Exception x) {siakWriter.writeFile(x);}

            try{
              if (st!=null) st.close();
              }catch(Exception y){siakWriter.writeFile(y);}

               try{
              if (con!=null) con.close();
              }catch(Exception z){siakWriter.writeFile(z);}
           }
  return ve;
 }

}