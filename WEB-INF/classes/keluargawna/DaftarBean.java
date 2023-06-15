package keluargawna;

import javax.ejb.*;
import keluargawna.Individu_sudapunya;
import javax.ejb.*;
import java.util.*;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class DaftarBean implements SessionBean
{
 SessionContext sessionContext;
  String no_kk,nik;
 private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "DaftarBean.class");
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
  public Vector daftarKeluarga(String no_kk, String nik)
  {

    Vector ve=null;
    String sql="";
    Statement st=null;
    ConnectorDB con_db=null;
    Connection con=null;
    ResultSet rs=null;


    this.no_kk = no_kk;
    this.nik = nik;
  try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();

    if (con!=null)
             {
               st = con.createStatement();
               sql = "select * from daftar_keluarga where no_kk=" + no_kk;
               rs = st.executeQuery(sql);
               System.out.println(sql);
               ve = new Vector();

                if (rs != null) {
                while (rs.next()) {
  Individu_sudapunya new_record = new Individu_sudapunya(rs.getString("NIK"),
                                                      rs.getString("NAMA_LGKP"),
                                                      rs.getString("STAT_HBKEL"),
                                                      rs.getString("NO_KK"),
                                                      rs.getString("ALAMAT"),
                                                      rs.getString("NO_RT"),
                                                      rs.getString("NO_RW"),
                                                      rs.getString("DUSUN"),
                                                      rs.getString("KODE_POS"),
                                                      rs.getString("TELP"),rs.getString("nama_prop"),
                                                      rs.getString("nama_kab"),rs.getString("nama_kec"),
                                                      rs.getString("nama_kel"));

ve.addElement(new_record);

                     }
               }

               rs.close();
               st.close();
               con.close();
             }
   }
   catch(Exception e)
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