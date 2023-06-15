package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class KeluargaWnaBean implements SessionBean {
  SessionContext sessionContext;
  Vector ve;
  String no_kk;
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
      siakWriter = new SiakWriter(path, "KeluargaWnaBean.class");
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

  public Vector daftarKeluarga(String no_kk)
  {
    this.no_kk = no_kk.trim() ;

  try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();

    if (con!=null)
             {
               st = con.createStatement();
               sql = "select * from daftar_keluarga_wna where no_kk=" + no_kk;
               rs = st.executeQuery(sql);
               //System.out.println(sql);
               ve = new Vector();

                if (rs != null) {

           while (rs.next()) {
  Individu_SudapunyaWna new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                      rs.getString("NAMA_PERTMA"),
                                                      rs.getString("STAT_HBKEL"),
                                                      rs.getString("NO_KK"),
                                                      rs.getString("NAMA_KEP"),
                                                      rs.getString("ALAMAT"),
                                                      rs.getString("NO_RT"),
                                                      rs.getString("NO_RW"),
                                                      rs.getString("DUSUN"),
                                                      rs.getString("KODE_POS"),
                                                      rs.getString("TELP"),
                                                      rs.getString("NO_PROP"),
                                                      rs.getString("NO_KAB"),
                                                      rs.getString("NO_KEC"),
                                                      rs.getString("NO_KEL"),
                                                      rs.getString("NAMA_PROP"),
                                                      rs.getString("NAMA_KAB"),
                                                      rs.getString("NAMA_KEC"),
                                                      rs.getString("NAMA_KEL"),
                                                      rs.getInt("umur"),
                                                      rs.getInt("stat_kwn"));
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
     System.out.println("Error in KeluargaWnaBean=" + e.toString());
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

public Vector daftarKeluarga(String no_kk,String source,String no_prop,String no_kab,String no_kec,String no_kel)
   {
     this.no_kk = no_kk.trim() ;
   try
     {
       con_db = new ConnectorDB();
       con = ConnectorDB.getConnection();
       st = con.createStatement();

   if (con!=null)
              {

if (source.equals("WNA"))
                {
                sql = "select * from daftar_keluarga_wna where no_kk=" + no_kk + " and no_prop=" + no_prop.trim() + " and no_kab=" + no_kab.trim() + " and no_kec=" + no_kec + " and no_kel=" + no_kel;
                rs = st.executeQuery(sql);
                //System.out.println(sql);
                ve = new Vector();
 if (rs != null) {
            while (rs.next()) {
   Individu_SudapunyaWna new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
       rs.getString("NAMA_PERTMA"),
       rs.getString("STAT_HBKEL"),
       rs.getString("NO_KK"),
       rs.getString("NAMA_KEP"),
       rs.getString("ALAMAT"),
       rs.getString("NO_RT"),
       rs.getString("NO_RW"),
       rs.getString("DUSUN"),
       rs.getString("KODE_POS"),
       rs.getString("TELP"),
       rs.getString("NO_PROP"),
       rs.getString("NO_KAB"),
       rs.getString("NO_KEC"),
       rs.getString("NO_KEL"),
       rs.getString("NAMA_PROP"),
       rs.getString("NAMA_KAB"),
       rs.getString("NAMA_KEC"),
       rs.getString("NAMA_KEL"),
       rs.getInt("umur"),
       rs.getInt("stat_kwn"));

ve.addElement(new_record);
                      }
         }
              }
              else if (source.equals("WNI"))
                       {

                         sql = "select * from daftar_keluarga_wni_new where no_kk=" + no_kk + " and no_prop=" + no_prop.trim() + " and no_kab=" + no_kab.trim() + " and no_kec=" + no_kec.trim() + " and no_kel=" + no_kel.trim();
                                       rs = st.executeQuery(sql);
                                       //System.out.println(sql);
                                       ve = new Vector();

              if (rs != null) {
                         while (rs.next()) {
                          Individu_SudapunyaWna new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                              rs.getString("NAMA_LGKP"),
                                                                              rs.getString("STAT_HBKEL"),
                                                                              rs.getString("NO_KK"),
                                                                              rs.getString("NAMA_KEP"),
                                                                              rs.getString("ALAMAT"),
                                                                              rs.getString("NO_RT"),
                                                                              rs.getString("NO_RW"),
                                                                              rs.getString("DUSUN"),
                                                                              rs.getString("KODE_POS"),
                                                                              rs.getString("TELP"),
                                                                              rs.getString("NO_PROP"),
                                                                              rs.getString("NO_KAB"),
                                                                              rs.getString("NO_KEC"),
                                                                              rs.getString("NO_KEL"),
                                                                              rs.getString("NAMA_PROP"),
                                                                              rs.getString("NAMA_KAB"),
                                                                              rs.getString("NAMA_KEC"),
                                                                              rs.getString("NAMA_KEL"),
                                                                              rs.getInt("umur"),
                                                                              rs.getInt("stat_kwn"));
                        ve.addElement(new_record);

                                             }

                                       }


              }
                rs.close();
                st.close();
                con.close();
              }
    }catch(Exception e)
    {
      siakWriter.writeFile(e);
      System.out.println("Error in KeluargaWnaBean=" + e.toString());
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

public Vector daftarKK(String no_kk,String source)
     {
System.out.println("SOURCE->"+ source);
 this.no_kk = no_kk.trim() ;
     try
       {
         con_db = new ConnectorDB();
         con = ConnectorDB.getConnection();
         st = con.createStatement();

     if (con!=null)
                {

  if (source.equals("WNA"))
                  {
                  sql = "select * from daftar_keluarga_wna where nik in(" +
                      " select nik from kelrga_pindah_wni_wna where no_kk=" + no_kk + " and PINDAH_FLAG='N')";
                  rs = st.executeQuery(sql);
                  //System.out.println(sql);
                  ve = new Vector();
   if (rs != null) {
              while (rs.next()) {
     Individu_SudapunyaWna new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
         rs.getString("NAMA_PERTMA"),
         rs.getString("STAT_HBKEL"),
         rs.getString("NO_KK"),
         rs.getString("NAMA_KEP"),
         rs.getString("ALAMAT"),
         rs.getString("NO_RT"),
         rs.getString("NO_RW"),
         rs.getString("DUSUN"),
         rs.getString("KODE_POS"),
         rs.getString("TELP"),
         rs.getString("NO_PROP"),
         rs.getString("NO_KAB"),
         rs.getString("NO_KEC"),
         rs.getString("NO_KEL"),
         rs.getString("NAMA_PROP"),
         rs.getString("NAMA_KAB"),
         rs.getString("NAMA_KEC"),
         rs.getString("NAMA_KEL"),
         rs.getInt("umur"),
         rs.getInt("stat_kwn"));

  ve.addElement(new_record);
                        }
           }
                }
                else if (source.equals("WNI"))
                         {
                       sql = "select * from daftar_keluarga_wni_new where nik in(" +
                      "select nik from kelrga_pindah_wni_wna where no_kk=" + no_kk + " and PINDAH_FLAG='N')";
                                         rs = st.executeQuery(sql);
                                         //System.out.println(sql);
                                         ve = new Vector();

                if (rs != null) {
                           while (rs.next()) {
                            Individu_SudapunyaWna new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                                rs.getString("NAMA_LGKP"),
                                                                                rs.getString("STAT_HBKEL"),
                                                                                rs.getString("NO_KK"),
                                                                                rs.getString("NAMA_KEP"),
                                                                                rs.getString("ALAMAT"),
                                                                                rs.getString("NO_RT"),
                                                                                rs.getString("NO_RW"),
                                                                                rs.getString("DUSUN"),
                                                                                rs.getString("KODE_POS"),
                                                                                rs.getString("TELP"),
                                                                                rs.getString("NO_PROP"),
                                                                                rs.getString("NO_KAB"),
                                                                                rs.getString("NO_KEC"),
                                                                                rs.getString("NO_KEL"),
                                                                                rs.getString("NAMA_PROP"),
                                                                                rs.getString("NAMA_KAB"),
                                                                                rs.getString("NAMA_KEC"),
                                                                                rs.getString("NAMA_KEL"),
                                                                                rs.getInt("umur"),
                                                                                rs.getInt("stat_kwn"));
                          ve.addElement(new_record);

                                               }

                                         }


                }
                  rs.close();
                  st.close();
                  con.close();
                }
      }catch(Exception e)
      {
        System.out.println("Error in KeluargaWnaBean=" + e.toString());
                siakWriter.writeFile(e);
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