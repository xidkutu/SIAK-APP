package keluargawna;

import javax.ejb.*;
import javax.ejb.*;
import java.util.*;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class Num_Wna_DataBean implements SessionBean {
  SessionContext sessionContext;
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
      siakWriter = new SiakWriter(path, "Num_Wna_DataBean.class");
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

 public Vector numpangKeluarga(String no_kk,String num_prop,String num_kab)
  {
    this.no_kk = no_kk;
      Vector ve=new Vector();
  try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();

     if (con!=null)
             {
               st = con.createStatement();
               sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim();
               rs = st.executeQuery(sql);
               ve = new Vector();
                if (rs != null) {
                while (rs.next()) {
                Individu_SudapunyaWna new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                      rs.getString("NAMA_PERTMA"),
                                                                      rs.getString("JENIS_KLMIN"),
                                                                      rs.getString("KWRNGRN"),
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
                                                                      rs.getString("KEC_JABATAN"),
                                                                      rs.getString("KEC_NAMA_PEJ"),
                                                                      rs.getString("KEC_NIP_PEJ"),
                                                                      rs.getString("KEL_JABATAN"),
                                                                      rs.getString("KEL_NAMA_LUR"),
                                                                      rs.getString("KEL_NIP_LUR"));




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
      System.out.println("Error in Num_Wna_DataBean=" + e.toString());
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

public Vector numpangKeluarga(String no_kk_lma,String no_kk_baru,String num_prop,String num_kab)
  {
    this.no_kk = no_kk;
    Individu_SudapunyaWna new_record=null;
      Vector ve=new Vector();
  try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();

     if (con!=null)
             {
           st = con.createStatement();
           sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_lma.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim();

            rs = st.executeQuery(sql);

               ve = new Vector();
                if (rs != null) {
                while (rs.next()) {
                new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                      rs.getString("NAMA_PERTMA"),
                                                                      rs.getString("JENIS_KLMIN"),
                                                                      rs.getString("KWRNGRN"),
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
                                                                      rs.getString("KEC_JABATAN"),
                                                                      rs.getString("KEC_NAMA_PEJ"),
                                                                      rs.getString("KEC_NIP_PEJ"),
                                                                      rs.getString("KEL_JABATAN"),
                                                                      rs.getString("KEL_NAMA_LUR"),
                                                                      rs.getString("KEL_NIP_LUR"));
ve.addElement(new_record);
            }
               }
         rs.close();
         st.close();
  st = con.createStatement();
  sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_baru.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim();

 rs = st.executeQuery(sql);

  if (rs != null) {
     rs.next();
     new_record.setNikKepLama(rs.getString("NIK"));
     new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
     new_record.setAlamat(rs.getString("ALAMAT"));
     new_record.setNort(rs.getString("NO_RT"));
     new_record.setNorw(rs.getString("NO_RW"));
     new_record.setDusun(rs.getString("DUSUN"));
     new_record.setKodepos(rs.getString("KODE_POS"));
     new_record.setTelp(rs.getString("TELP"));
     new_record.setNoPro(rs.getString("NO_PROP"));
     new_record.setNoKab(rs.getString("NO_KAB"));
     new_record.setNoKec(rs.getString("NO_KEC"));
     new_record.setNoKel(rs.getString("NO_KEL"));
     new_record.setNamaPro(rs.getString("NAMA_PROP"));
     new_record.setNamaKab(rs.getString("NAMA_KAB"));
     new_record.setNamaKec(rs.getString("NAMA_KEC"));
     new_record.setNamaKel(rs.getString("NAMA_KEL"));
  }

             rs.close() ;
             st.close();
             con.close();
            }
   }catch(Exception e)
   {
     siakWriter.writeFile(e);
      System.out.println("Error in Num_Wna_DataBean=" + e.toString());
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

public Vector numpangKeluarga(String no_kk_lma,String no_kk_baru,String num_prop,String num_kab,String num_kec,String source)
   {
     System.out.println("Entered into NUMPANG FUNCTION 1!!!!!!!!!!");

     this.no_kk = no_kk;
     Individu_SudapunyaWna new_record=null;
        Vector ve= new Vector();
   try
     {
       con_db = new ConnectorDB();
       con = ConnectorDB.getConnection();

      if (con!=null)
              {
            st = con.createStatement();
         if (source.equals("WNA"))
            {
            sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_lma.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim();;
             rs = st.executeQuery(sql);
                 if (rs != null) {
                 while (rs.next()) {
                 new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                       rs.getString("NAMA_PERTMA"),
                                                                       rs.getString("JENIS_KLMIN"),
                                                                       rs.getString("KWRNGRN"),
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
                                                                       rs.getString("KEC_JABATAN"),
                                                                       rs.getString("KEC_NAMA_PEJ"),
                                                                       rs.getString("KEC_NIP_PEJ"),
                                                                       rs.getString("KEL_JABATAN"),
                                                                       rs.getString("KEL_NAMA_LUR"),
                                                                       rs.getString("KEL_NIP_LUR"));
 ve.addElement(new_record);
             }
                }
          rs.close();
          st.close();
   st = con.createStatement();
   sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_baru.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec;
   rs = st.executeQuery(sql);

   if (rs.next()) {

      new_record.setNikKepLama(rs.getString("NIK"));
      new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
      new_record.setAlamat(rs.getString("ALAMAT"));
      new_record.setNort(rs.getString("NO_RT"));
      new_record.setNorw(rs.getString("NO_RW"));
      new_record.setDusun(rs.getString("DUSUN"));
      new_record.setKodepos(rs.getString("KODE_POS"));
      new_record.setTelp(rs.getString("TELP"));
      new_record.setNoPro(rs.getString("NO_PROP"));
      new_record.setNoKab(rs.getString("NO_KAB"));
      new_record.setNoKec(rs.getString("NO_KEC"));
      new_record.setNoKel(rs.getString("NO_KEL"));
      new_record.setNamaPro(rs.getString("NAMA_PROP"));
      new_record.setNamaKab(rs.getString("NAMA_KAB"));
      new_record.setNamaKec(rs.getString("NAMA_KEC"));
      new_record.setNamaKel(rs.getString("NAMA_KEL"));
   }
   else
   {
     ve.removeAllElements();
   }
            }
 else if (source.equals("WNI"))
         {
  sql = "select * from numpang_keluarga_wni_new where no_kk=" + no_kk_lma.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim();
  rs = st.executeQuery(sql);
           if (rs != null) {
           while (rs.next()) {
           new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                 rs.getString("NAMA_LGKP"),
                                                                 rs.getString("JENIS_KLMIN"),
                                                                 rs.getString("KWRNGRN"),
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
                                                                 rs.getString("KEC_JABATAN"),
                                                                 rs.getString("KEC_NAMA_PEJ"),
                                                                 rs.getString("KEC_NIP_PEJ"),
                                                                 rs.getString("KEL_JABATAN"),
                                                                 rs.getString("KEL_NAMA_LUR"),
                                                                 rs.getString("KEL_NIP_LUR"));
ve.addElement(new_record);
       }
          }
    rs.close();
    st.close();
st = con.createStatement();

   sql = "select * from numpang_keluarga_wni_new where no_kk=" + no_kk_baru.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim();
   rs = st.executeQuery(sql);

if (rs.next()) {
new_record.setNikKepLama(rs.getString("NIK"));
new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
new_record.setAlamat(rs.getString("ALAMAT"));
new_record.setNort(rs.getString("NO_RT"));
new_record.setNorw(rs.getString("NO_RW"));
new_record.setDusun(rs.getString("DUSUN"));
new_record.setKodepos(rs.getString("KODE_POS"));
new_record.setTelp(rs.getString("TELP"));
new_record.setNoPro(rs.getString("NO_PROP"));
new_record.setNoKab(rs.getString("NO_KAB"));
new_record.setNoKec(rs.getString("NO_KEC"));
new_record.setNoKel(rs.getString("NO_KEL"));
new_record.setNamaPro(rs.getString("NAMA_PROP"));
new_record.setNamaKab(rs.getString("NAMA_KAB"));
new_record.setNamaKec(rs.getString("NAMA_KEC"));
new_record.setNamaKel(rs.getString("NAMA_KEL"));
}
else
    {
ve.removeAllElements();
    }
 }
              rs.close() ;
              st.close();
              con.close();
             }
    }catch(Exception e)
    {
      siakWriter.writeFile(e);
       System.out.println("Error in Num_Wna_DataBean=" + e.toString());
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
//This function used in Pindah Dareh Asal in Dis_Per_Wna.jsp
public Vector numpangKeluarga_new(String no_kk,String num_prop,String num_kab,String num_kec,String num_kel,String source)
 {
   this.no_kk = no_kk;
   Individu_SudapunyaWna  new_record=null;
    Vector ve=new Vector();
    Statement st1=null;
 try
   {
     con_db = new ConnectorDB();
     con = ConnectorDB.getConnection();

    if (con!=null)
            {
            st = con.createStatement();
       if (source.trim().equals("WNA"))
             {
              sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim() + " and no_kel=" + num_kel.trim();
              System.out.println("SQL WNA" + sql);
              rs = st.executeQuery(sql);
              ve = new Vector();

      if (rs != null) {
        st1 = con.createStatement();
        st1.addBatch("delete from pindah_wni_wna where no_kk in(select no_kk from kelrga_pindah_wni_wna where no_kk=" + no_kk + " and pindah_flag='N')");
        st1.addBatch("delete from kelrga_pindah_wni_wna where no_kk="+ no_kk + " and pindah_flag='N'");
        st1.executeBatch();
        try{
          st1.close();
          st1=null;
        }catch(Exception errp)
        {   }
               while (rs.next())
               {

               new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                     rs.getString("NAMA_PERTMA"),
                                                                     rs.getString("JENIS_KLMIN"),
                                                                     /*rs.getString("KWRNGRN")*/ "2", //is been modified from KWRNGRN->only 1-WNI,2-WNA
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
                                                                     rs.getString("KEC_JABATAN"),
                                                                     rs.getString("KEC_NAMA_PEJ"),
                                                                     rs.getString("KEC_NIP_PEJ"),
                                                                     rs.getString("KEL_JABATAN"),
                                                                     rs.getString("KEL_NAMA_LUR"),
                                                                     rs.getString("KEL_NIP_LUR"));
ve.addElement(new_record);
          }
  }
}

else if (source.equals("WNI"))
  {
sql = "select * from numpang_keluarga_wni_new where no_kk=" + no_kk.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim() + " and no_kel=" + num_kel.trim();
System.out.println("SQL" + sql);
System.out.println("Entered into WNI SUDAH PUNYA");
 rs = st.executeQuery(sql);

 if (rs != null) {
   st1 = con.createStatement();
   st1.addBatch("delete from pindah_wni_wna where no_kk in(select no_kk from kelrga_pindah_wni_wna where no_kk=" + no_kk + " and pindah_flag='N')");
   st1.addBatch("delete from kelrga_pindah_wni_wna where no_kk="+ no_kk + " and pindah_flag='N'");
   st1.executeBatch();
   try{
     st1.close();
     st1=null;
   }catch(Exception errp)
   {   }
   while (rs.next()) {
           new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                 rs.getString("NAMA_LGKP"),
                                                                 rs.getString("JENIS_KLMIN"),
                                                                 /*rs.getString("KWRNGRN")*/ "1", //is been modified from KWRNGRN->only 1-WNI,2-WNA
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
                                                                 rs.getString("KEC_JABATAN"),
                                                                 rs.getString("KEC_NAMA_PEJ"),
                                                                 rs.getString("KEC_NIP_PEJ"),
                                                                 rs.getString("KEL_JABATAN"),
                                                                 rs.getString("KEL_NAMA_LUR"),
                                                                 rs.getString("KEL_NIP_LUR"));
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
     System.out.println("Error in Num_Wna_DataBean=" + e.toString());
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

public Vector numpangKeluarga(String no_kk_lma,String no_kk_baru,String num_prop,String num_kab,String num_kec,String num_kel,String source)
     {
       System.out.println("Entered into NUMPANG FUNCTION 2!!!!!!!!!!");
       this.no_kk = no_kk;
       Individu_SudapunyaWna new_record=null;
          Vector ve = new Vector();
     try
       {
         con_db = new ConnectorDB();
         con = ConnectorDB.getConnection();

        if (con!=null)
                {
              st = con.createStatement();
           if (source.equals("WNA"))
              {
              sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_lma.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim() + " and no_kel=" + num_kel.trim();
               rs = st.executeQuery(sql);
                   if (rs != null) {
                   while (rs.next()) {
                   new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                         rs.getString("NAMA_PERTMA"),
                                                                         rs.getString("JENIS_KLMIN"),
                                                                         rs.getString("KWRNGRN"),
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
                                                                         rs.getString("KEC_JABATAN"),
                                                                         rs.getString("KEC_NAMA_PEJ"),
                                                                         rs.getString("KEC_NIP_PEJ"),
                                                                         rs.getString("KEL_JABATAN"),
                                                                         rs.getString("KEL_NAMA_LUR"),
                                                                         rs.getString("KEL_NIP_LUR"));
   ve.addElement(new_record);
               }
                  }
            rs.close();
            st.close();
     st = con.createStatement();

     sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_baru.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim() + " and no_kel=" + num_kel.trim();

     rs = st.executeQuery(sql);

     if (rs.next()) {

        new_record.setNikKepLama(rs.getString("NIK"));
        new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
        new_record.setAlamat(rs.getString("ALAMAT"));
        new_record.setNort(rs.getString("NO_RT"));
        new_record.setNorw(rs.getString("NO_RW"));
        new_record.setDusun(rs.getString("DUSUN"));
        new_record.setKodepos(rs.getString("KODE_POS"));
        new_record.setTelp(rs.getString("TELP"));
        new_record.setNoPro(rs.getString("NO_PROP"));
        new_record.setNoKab(rs.getString("NO_KAB"));
        new_record.setNoKec(rs.getString("NO_KEC"));
        new_record.setNoKel(rs.getString("NO_KEL"));
        new_record.setNamaPro(rs.getString("NAMA_PROP"));
        new_record.setNamaKab(rs.getString("NAMA_KAB"));
        new_record.setNamaKec(rs.getString("NAMA_KEC"));
        new_record.setNamaKel(rs.getString("NAMA_KEL"));
     }
     else
{
  ve.removeAllElements();
}
        }
   else if (source.equals("WNI"))
           {
      sql = "select * from numpang_keluarga_wni_new where no_kk=" + no_kk_lma.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim() + " and no_kel=" + num_kel.trim();
      System.out.println("SQL" + sql);
         rs = st.executeQuery(sql);
             if (rs != null) {
             while (rs.next()) {
             new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                   rs.getString("NAMA_LGKP"),
                                                                   rs.getString("JENIS_KLMIN"),
                                                                   rs.getString("KWRNGRN"),
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
                                                                   rs.getString("KEC_JABATAN"),
                                                                   rs.getString("KEC_NAMA_PEJ"),
                                                                   rs.getString("KEC_NIP_PEJ"),
                                                                   rs.getString("KEL_JABATAN"),
                                                                   rs.getString("KEL_NAMA_LUR"),
                                                                   rs.getString("KEL_NIP_LUR"));
  ve.addElement(new_record);
         }
            }
      rs.close();
      st.close();
  st = con.createStatement();
  sql = "select * from numpang_keluarga_wni_new where no_kk=" + no_kk_baru.trim() + " and no_prop=" + num_prop.trim()  + " and no_kab=" + num_kab.trim() + " and no_kec=" + num_kec.trim() + " and no_kel=" + num_kel.trim();
      System.out.println("SQL 2" + sql);
  rs = st.executeQuery(sql);

  if (rs.next()) {
  new_record.setNikKepLama(rs.getString("NIK"));
  new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
  new_record.setAlamat(rs.getString("ALAMAT"));
  new_record.setNort(rs.getString("NO_RT"));
  new_record.setNorw(rs.getString("NO_RW"));
  new_record.setDusun(rs.getString("DUSUN"));
  new_record.setKodepos(rs.getString("KODE_POS"));
  new_record.setTelp(rs.getString("TELP"));
  new_record.setNoPro(rs.getString("NO_PROP"));
  new_record.setNoKab(rs.getString("NO_KAB"));
  new_record.setNoKec(rs.getString("NO_KEC"));
  new_record.setNoKel(rs.getString("NO_KEL"));
  new_record.setNamaPro(rs.getString("NAMA_PROP"));
  new_record.setNamaKab(rs.getString("NAMA_KAB"));
  new_record.setNamaKec(rs.getString("NAMA_KEC"));
  new_record.setNamaKel(rs.getString("NAMA_KEL"));
  }
  else
  {
    ve.removeAllElements();
  }
         }
                rs.close() ;
                st.close();
                con.close();
               }
      }catch(Exception e)
      {
        siakWriter.writeFile(e);
         System.out.println("Error in Num_Wna_DataBean=" + e.toString());
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


/*New Created Funcition exclusively for Numpang Tujuan*/
public Vector numpangTujuan(String no_kk_lma,String no_kk_baru,String source)
        {
          System.out.println("Entered into NUMPANG FUNCTION 3!!!!!!!!!!");
          this.no_kk = no_kk;
          Individu_SudapunyaWna new_record=null;
          Vector ve = new Vector();
try
       {
            con_db = new ConnectorDB();
            con = ConnectorDB.getConnection();

           if (con!=null)
                   {
                 st = con.createStatement();
              if (source.equals("WNA"))
                 {

                   String sqlwna= " SELECT TO_CHAR(a.nik,'0000000000000000') nik, a.NAMA_PERTMA, " +
                                  " a.jenis_klmin,a.KWRNGRN, DECODE(a.STAT_HBKEL,1,'Kepala Keluarga/Head of Family',2, 'Suami/Husband',3,'Istri/Wife', 4, 'Anak/Child',5,'Menantu/Child in Law',6, " +
                                  " 'Cucu/Grand Child',7,'Orangtua/Parent',8,'Mertua/Parent in Law',9,'Famili Lain/Relative',10,'Pembantu/Housemade', 11,'Lain/Others') stat_hbkel, " +
                                  " a.no_kk,b.NAMA_KEP, b.ALMT_T alamat,b.RT_T no_rt,b.RW_T no_rw,NVL(b.DUSUN_T,'-') dusun, " +
                                  " DECODE(b.KODE_POS_T,NULL,'-',0,'-',b.kode_pos_T) KODE_POS,NVL(b.TELP_T,'-')  TELP," +
                                  " TO_CHAR(a.no_prop,'00') no_prop,TO_CHAR(a.no_kab,'00') no_kab,TO_CHAR(a.no_kec,'00') no_kec,TO_CHAR(a.no_kel,'0000') no_kel," +
                                  " getnamaprop(a.no_prop) nama_prop,getnamakab(a.no_kab,a.no_prop) nama_kab," +
                                  " getnamakec(a.no_kec,a.no_kab,a.no_prop) nama_kec,getnamakel(a.no_kel,a.no_kec,a.no_kab,a.no_prop) nama_kel," +
                                  " c.kec_jabatan,c.kec_nama_pej,c.kec_nip_pej,d.kel_jabatan,d.kel_nama_lur,d.kel_nip_lur " +
                                  " FROM Biodata_wna a,TABLE(Getalmtpivot(a.NO_KK)) b,TABLE(getKecPivot(a.NO_KEC,a.no_kab,a.no_prop)) c," +
                                  " TABLE(getKelPivot(a.no_kel,a.NO_KEC,a.no_kab,a.no_prop)) d " +
                                  " where nik in(select nik from kelrga_pindah_wni_wna where no_kk=" + no_kk_lma + " and pindah_flag='N')" +
                                  " ORDER BY a.STAT_HBKEL ";

                  rs = st.executeQuery(sqlwna);
                      if (rs != null) {
                      while (rs.next()) {
                      new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                            rs.getString("NAMA_PERTMA"),
                                                                            rs.getString("JENIS_KLMIN"),
                                                                            rs.getString("KWRNGRN"),
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
                                                                            rs.getString("KEC_JABATAN"),
                                                                            rs.getString("KEC_NAMA_PEJ"),
                                                                            rs.getString("KEC_NIP_PEJ"),
                                                                            rs.getString("KEL_JABATAN"),
                                                                            rs.getString("KEL_NAMA_LUR"),
                                                                            rs.getString("KEL_NIP_LUR"));
      ve.addElement(new_record);
                  }
                     }
               rs.close();
               st.close();
        st = con.createStatement();

        sql = "select * from numpang_keluarga_wna where no_kk=" + no_kk_baru.trim();
        rs = st.executeQuery(sql);

        if (rs.next()) {

           new_record.setNikKepLama(rs.getString("NIK"));
           new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
           new_record.setAlamat(rs.getString("ALAMAT"));
           new_record.setNort(rs.getString("NO_RT"));
           new_record.setNorw(rs.getString("NO_RW"));
           new_record.setDusun(rs.getString("DUSUN"));
           new_record.setKodepos(rs.getString("KODE_POS"));
           new_record.setTelp(rs.getString("TELP"));
           new_record.setNoPro(rs.getString("NO_PROP"));
           new_record.setNoKab(rs.getString("NO_KAB"));
           new_record.setNoKec(rs.getString("NO_KEC"));
           new_record.setNoKel(rs.getString("NO_KEL"));
           new_record.setNamaPro(rs.getString("NAMA_PROP"));
           new_record.setNamaKab(rs.getString("NAMA_KAB"));
           new_record.setNamaKec(rs.getString("NAMA_KEC"));
           new_record.setNamaKel(rs.getString("NAMA_KEL"));
        }
        else
   {
     ve.removeAllElements();
   }
     }
   else if (source.equals("WNI"))
        {
          String sqlwni=" SELECT TO_CHAR(a.nik,'0000000000000000') nik," +
                    " a.nama_lgkp,a.JENIS_KLMIN,'INDONESIA' KWRNGRN, " +
                    " DECODE(a.STAT_HBKEL,1,'Kepala Keluarga',2, 'Suami',3,'Istri', 4, 'Anak',5,'Menantu',6," +
                    " 'Cucu',7,'OrangTua',8,'Mertua',9,'Famili Lain',10,'Pembantu', 11,'Lainnya') stat_hbkel, " +
                    " a.NO_KK,b.NAMA_KEP,b.ALMT_T alamat,b.RT_T no_rt,b.RW_T no_rw,NVL(b.DUSUN_T,'-') dusun, " +
                    " DECODE(b.KODE_POS_T,NULL,'-',0,'-',b.kode_pos_T) KODE_POS,NVL(b.TELP_T,'-')  TELP, " +
                    " TO_CHAR(a.no_prop,'00') no_prop,TO_CHAR(a.no_kab,'00') no_kab,TO_CHAR(a.no_kec,'00') no_kec," +
                    " TO_CHAR(a.no_kel,'0000') no_kel,Getnamaprop(a.no_prop) nama_prop,Getnamakab(a.no_kab,a.no_prop) nama_kab," +
                    " Getnamakec(a.no_kec,a.no_kab,a.no_prop) nama_kec,Getnamakel(a.no_kel,a.no_kec,a.no_kab,a.no_prop) nama_kel," +
                    " c.kec_jabatan,c.kec_nama_pej,c.kec_nip_pej,d.kel_jabatan,d.kel_nama_lur,d.kel_nip_lur FROM BIODATA_WNI a, TABLE(Getalmtpivot(a.NO_KK)) b ,TABLE(Getkecpivot(a.NO_KEC,a.no_kab,a.no_prop)) c," +
                   " TABLE(Getkelpivot(a.no_kel,a.NO_KEC,a.no_kab,a.no_prop)) d " +
                   " where nik in(select nik from kelrga_pindah_wni_wna where no_kk=" + no_kk_lma + " and pindah_flag='N')" +
                  " ORDER BY a.STAT_HBKEL ";

      System.out.println("SQL" + sqlwni);
      rs = st.executeQuery(sqlwni);
                if (rs != null) {
                while (rs.next()) {
                new_record = new Individu_SudapunyaWna(rs.getString("NIK"),
                                                                      rs.getString("NAMA_LGKP"),
                                                                      rs.getString("JENIS_KLMIN"),
                                                                      rs.getString("KWRNGRN"),
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
                                                                      rs.getString("KEC_JABATAN"),
                                                                      rs.getString("KEC_NAMA_PEJ"),
                                                                      rs.getString("KEC_NIP_PEJ"),
                                                                      rs.getString("KEL_JABATAN"),
                                                                      rs.getString("KEL_NAMA_LUR"),
                                                                      rs.getString("KEL_NIP_LUR"));
     ve.addElement(new_record);
            }
               }
         rs.close();
         st.close();
     st = con.createStatement();
     sql = "select * from numpang_keluarga_wni_new where no_kk=" + no_kk_baru.trim();
         System.out.println("SQL 2" + sql);
     rs = st.executeQuery(sql);

     if (rs.next()) {
     new_record.setNikKepLama(rs.getString("NIK"));
     new_record.setNamaKepLama(rs.getString("NAMA_KEP"));
     new_record.setAlamat(rs.getString("ALAMAT"));
     new_record.setNort(rs.getString("NO_RT"));
     new_record.setNorw(rs.getString("NO_RW"));
     new_record.setDusun(rs.getString("DUSUN"));
     new_record.setKodepos(rs.getString("KODE_POS"));
     new_record.setTelp(rs.getString("TELP"));
     new_record.setNoPro(rs.getString("NO_PROP"));
     new_record.setNoKab(rs.getString("NO_KAB"));
     new_record.setNoKec(rs.getString("NO_KEC"));
     new_record.setNoKel(rs.getString("NO_KEL"));
     new_record.setNamaPro(rs.getString("NAMA_PROP"));
     new_record.setNamaKab(rs.getString("NAMA_KAB"));
     new_record.setNamaKec(rs.getString("NAMA_KEC"));
     new_record.setNamaKel(rs.getString("NAMA_KEL"));
     }
     else
     {
       ve.removeAllElements();
     }
            }
                   rs.close() ;
                   st.close();
                   con.close();
                  }
         }catch(Exception e)
         {
           siakWriter.writeFile(e);
            System.out.println("Error in Num_Wna_DataBean=" + e.toString());
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
/*End Function*/


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
