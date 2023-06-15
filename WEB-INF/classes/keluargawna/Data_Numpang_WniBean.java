package keluargawna;

import javax.ejb.*;
import javax.ejb.*;
import java.util.*;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class Data_Numpang_WniBean implements SessionBean {
  SessionContext sessionContext;
  Vector ve;
  String no_kk,nik;
  String sql;
  Statement st;
  ConnectorDB con_db;
  Connection con;
  ResultSet rs;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "Data_Numpang_WniBean.class");
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
  public Vector numpangKeluarga(String no_kk, String nik)
 {
   this.no_kk = no_kk;
   this.nik = nik;
   System.out.println(this.no_kk+"  "+this.nik);
 try
   {
     con_db = new ConnectorDB();
     con = ConnectorDB.getConnection();

    if (con!=null)
            {
              st = con.createStatement();
              sql = "select * from numpang_keluarga_wni where no_kk=" + no_kk;
              rs = st.executeQuery(sql);
              System.out.println(sql);
              ve = new Vector();
               if (rs != null) {
               while (rs.next()) {
Individu_Mumpang new_record = new Individu_Mumpang(rs.getString("NIK"),
                                                     rs.getString("NAMA_LGKP"),
                                                     rs.getString("STAT_HBKEL"),
                                                     rs.getString("NO_KK"),
                                                     rs.getString("NAMA_KEP"),
                                                     rs.getString("ALAMAT"),
                                                     rs.getString("NO_RT"),
                                                     rs.getString("NO_RW"),
                                                     rs.getString("DUSUN"),
                                                     rs.getString("KODE_POS"),
                                                     rs.getString("TELP"));

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
     System.out.println("Error in Bean=" + e.toString());
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

public java.util.Vector getListHubugan()
     {
 java.util.Vector vt=new java.util.Vector();
   vt.addElement("Kepala Keluarga/Head of Family");
   vt.addElement("Suami");
   vt.addElement("Istri");
   vt.addElement("Anak");
   vt.addElement("Menantu");
   vt.addElement("Cucu");
   vt.addElement("OrangTua");
   vt.addElement("Mertua");
   vt.addElement("Famili Lain");
   vt.addElement("Pembantu");
   vt.addElement("Lainnya");
  return(vt);
   }
}