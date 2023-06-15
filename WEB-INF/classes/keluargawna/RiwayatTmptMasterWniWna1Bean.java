package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;
import java.sql.*;

abstract public class RiwayatTmptMasterWniWna1Bean implements EntityBean {
  EntityContext entityContext;
  ServiceEntity factory;
  Vector agt_vector,detail_record;

  RiwayatTmptDetailWniWna1Home home,home1;
  RiwayatTmptDetailWniWna1 remote,remote1;
  Vector ang;
  DataKeluarga4Home Dhome = null;
  DataKeluarga4 Dremote=null;

 private SiakWriter siakWriter;

public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKkLma) throws CreateException {
    setNoKkLma(noKkLma);
    return null;
  }

public java.math.BigDecimal ejbCreate(Kedatan_keluarga obj, String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP) throws CreateException
  {
    //This Function Creates a new record for RiwayatTmptMaster Table
 try{

   //System.out.println("Updating Riwayat Master...");

   setNoKkLma(new BigDecimal(getTrimData(obj.getNO_KK_LMA())));

   setNamaKepalaLma(getTrimData(obj.getNAMA_KEPALA_LMA()).toString().toUpperCase());

   setRencTgl(getTrimData(obj.getRENC_TGL()));
   setAlmtLma(getTrimData(obj.getALMT_LMA()));

if (valueDecimalFinder(obj.getALMT_RT_LMA()))    setAlmtRtLma(new BigDecimal(getTrimData(obj.getALMT_RT_LMA())));

 if (valueDecimalFinder(obj.getALMT_RW_LMA()))  setAlmtRwLma(new BigDecimal(getTrimData(obj.getALMT_RW_LMA())));

if (valueDecimalFinder(obj.getDUSUN_LMA()))    setDusunLma(getTrimData(obj.getDUSUN_LMA()).toString().toUpperCase());

//   setDusunLma((getTrimData(obj.getDUSUN_LMA())==null) ?"":getTrimData(obj.getDUSUN_LMA()).toString().toUpperCase());

if (valueDecimalFinder(obj.getALMT_KODEPOS_LMA()))   setAlmtKodeposLma(new BigDecimal(getTrimData(obj.getALMT_KODEPOS_LMA())));

   setAlmtTelpLma(getTrimData(obj.getALMT_TELP_LMA()) );

   setNamaCmatLma(getTrimData(obj.getNAMA_CMAT_LMA()).toString().toUpperCase());

   setNamaLurLma(getTrimData(obj.getNAMA_LUR_LMA()).toString().toUpperCase());

   setNamaPetLma(getTrimData(obj.getNAMA_PET_LMA()).toString().toUpperCase());


if (valueDecimalFinder(obj.getNIP_PET_LMA()))   setNipPetLma(new BigDecimal(getTrimData(obj.getNIP_PET_LMA())));

   setTglEntriLma(getTrimData(obj.getTGL_ENTRI_LMA()));

if (valueDecimalFinder(obj.getNO_KK_BRU()))   setNoKkBru(new BigDecimal(getTrimData(obj.getNO_KK_BRU())));

   setNamaCamatBru(getTrimData(obj.getNAMA_CAMAT_BRU()).toString().toUpperCase());
   setNamaLurBru(getTrimData(obj.getNAMA_LUR_BRU()).toString().toUpperCase());
   setNamaPetBru(getTrimData(obj.getNAMA_PET_BRU()).toString().toUpperCase());

if (valueDecimalFinder(obj.getNIP_PET_BRU()))  setNipPetBru(new BigDecimal(getTrimData(obj.getNIP_PET_BRU())));

   setTglEntriBru(getTrimData(obj.getTGL_ENTRI_BRU()));
   setTglDtng(getTrimData(obj.getTGL_DTNG()));

   //System.out.println("Insert finished in riwayat master entity bean");

    ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());

      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "KabBean.class");
    }catch(Exception e)
    {
      e.printStackTrace();
    }
   return null;
  }

public java.math.BigDecimal ejbCreate(pinda_num_suda new_record, String np, String nk, String nc, String nl) throws CreateException
   {
         try{
           //System.out.println("Updating Riwayat Master...");
  setNoKkLma(new BigDecimal(new_record.getNokk()));
  setNamaKepalaLma(new_record.getNakk().toString().toUpperCase());
  setRencTgl(new_record.getRencTgl().toString().toUpperCase());
  setAlmtLma(new_record.getAlmtLam().toString().toUpperCase());
  setAlmtRtLma(new BigDecimal(new_record.getRtLam()));
  setAlmtRwLma(new BigDecimal(new_record.getRwLam()));
  setDusunLma(new_record.getDusunLam().toString().toUpperCase());
  setAlmtKodeposLma(new BigDecimal(new_record.getKodLam()));
  setAlmtTelpLma(new_record.getTelLam());
  setNamaCmatLma(new_record.getNaCatLam().toString().toUpperCase());
  setNamaLurLma(new_record.getNaLurLma().toString().toUpperCase());
  setNamaPetLma(new_record.getNaPetLam().toString().toUpperCase());
  setNipPetLma(new BigDecimal(new_record.getNipPetLam()));
  setTglEntriLma(new_record.getTglEntLam());
  setNoKkBru(new BigDecimal(new_record.getNokkNum()));
  setNamaCamatBru(new_record.getNaCatBru().toString().toUpperCase());
  setNamaLurBru(new_record.getNaLurBru().toString().toUpperCase());
  setNamaPetBru(new_record.getNaPetBru().toString().toUpperCase());
  setNipPetBru(new BigDecimal(new_record.getNipPetBru()));
  setTglEntriBru(new_record.getTglEntBru().toString().toUpperCase());
  setTglDtng(new_record.getTglDtng().toString().toUpperCase());
  //System.out.println("Insert finished in riwayat master entity bean");
  ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                            Locale.getDefault());
     String path = res.getString("BEAN_PATH");
     siakWriter = new SiakWriter(path, "KabBean.class");


   }catch(Exception e)
     {
e.printStackTrace();
}
   return null;
}


public void ejbPostCreate(Kedatan_keluarga obj, String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP) throws CreateException
  {
    //This Function Creates the details records for  RiwayatTmptDetail Table
   //Creates a new KK
    //Updates the BiodataWNI for the new kk generated and status hubun keluarga
    GetKelrgaPindah  new_record=null;
    Connection conn = null;
    Statement st = null;
    String sql = "";
    BiodataWna3 wna_remote=null;
    BiodataWni2 wni_remote=null;
    BiodataWna3Home wna_home=null;
    BiodataWni2Home wni_home=null;
    Vector ang = null;


  try
    {
      factory=ServiceEntity.getInstance();
      home=(RiwayatTmptDetailWniWna1Home)factory.lookup("RiwayatTmptDetailWniWna1",RiwayatTmptDetailWniWna1Home.class);

   if(home!=null)
      {
        ang = obj.getAngo();
        //System.out.println(ang.size());
        //System.out.println("Inserting Riwayat tmpt detail wni wna...");

        for (int x = 0; x < ang.size(); x++) {
          new_record = (GetKelrgaPindah) ang.elementAt(x);
          remote = home.create(obj, new_record);
        }
        //System.out.println("Inserted Riwayat tempt detail wni wna");

        if (obj.getStatusPindah().trim().equals("2")) {
          Dhome = (DataKeluarga4Home) factory.lookup("DataKeluarga4",
              DataKeluarga4Home.class);
          if (Dhome != null) {
            Dremote = Dhome.create(obj, ALAMAT, NO_RT, NO_RW, DUSUN, KODE_POS,
                                   TELP);
          }
        }
         if (obj.getStatusPindah().trim().equals("3")) {
            Dhome = (DataKeluarga4Home) factory.lookup("DataKeluarga4",
                DataKeluarga4Home.class);
            if (Dhome != null) {
              Dremote = Dhome.findByPrimaryKey(new BigDecimal(obj.getNO_KK_BRU()));
              Dremote.setAlamat(obj.getAlamatTuj());
              Dremote.setNoRt(obj.getRtTuj());
              Dremote.setNoRw(obj.getRwTuj());
              Dremote.setDusun(obj.getDusunTuj());
              Dremote.setKodePos(obj.getKodeposTuj());
              Dremote.setTelp(obj.getTelpTuj());
              Dremote.setNoProp(new BigDecimal(obj.getNoProp()));
              Dremote.setNoKab(new BigDecimal(obj.getNoKab()));
              Dremote.setNoKec(new BigDecimal(obj.getNoKec()));
              Dremote.setNoKel(new BigDecimal(obj.getNoKel()));
              Dremote.setTglUpdation(obj.getTGL_ENTRI_BRU());
              Dremote.setCflag("Y");
              ConnectorDB connectorDb = new ConnectorDB();
              conn = ConnectorDB.getConnection();
              st = conn.createStatement();
              sql =
                  "update kelrga_pindah_wni_wna set PINDAH_FLAG='Y' where no_kk=" +
                  obj.getNO_KK_LMA().trim() + " and RENC_TGL='" +
                  obj.getRENC_TGL().trim() + "'";
              //System.out.println("SQL 1 in RIWAYAT MASTER POST CREATE->" + sql);
              int res = st.executeUpdate(sql.trim());
              //System.out.println("Success Upadtion");
              st.close();
              conn.close();
              conn = null;
              ang = obj.getAngo();

              if (obj.getSource().trim().equals("WNI")) {
                wni_home = (BiodataWni2Home) factory.lookup("BiodataWni2",
                    BiodataWni2Home.class);

                for (int x = 0; x < ang.size(); x++) {
                  new_record = (GetKelrgaPindah) ang.elementAt(x);
                  wni_remote = wni_home.findByPrimaryKey(new BigDecimal(
                      new_record.getNik().trim()));
                  wni_remote.setNoProp(new BigDecimal(obj.getNoProp()));
                  wni_remote.setNoKab(new BigDecimal(obj.getNoKab()));
                  wni_remote.setNoKec(new BigDecimal(obj.getNoKec()));
                  wni_remote.setNoKel(new BigDecimal(obj.getNoKel()));
                  wni_remote.setCflag("Y");
                  //System.out.println("Update Angota WNI ==" + x);
                }
              }
              else if (obj.getSource().trim().equals("WNA")) {
                wna_home = (BiodataWna3Home) factory.lookup("BiodataWna3",
                    BiodataWna3Home.class);

                for (int x = 0; x < ang.size(); x++) {
                  new_record = (GetKelrgaPindah) ang.elementAt(x);
                  wna_remote = wna_home.findByPrimaryKey(new BigDecimal(
                      new_record.getNik().trim()));
                  wna_remote.setNoProp(new BigDecimal(obj.getNoProp()));
                  wna_remote.setNoKab(new BigDecimal(obj.getNoKab()));
                  wna_remote.setNoKec(new BigDecimal(obj.getNoKec()));
                  wna_remote.setNoKel(new BigDecimal(obj.getNoKel()));
                  wna_remote.setCflag("Y");
                  //System.out.println("Update Angota WNA ==" + x);
                }
              }
            }
          }
        }
 }
    catch(Exception err){
                    err.printStackTrace();
             throw new CreateException();
          }
          finally
          {
            try{
              if (st != null) {
                st.close();
              }
            }
            catch (Exception e2) {}

            try {
              if (conn != null) {
                conn.close();
              }
            }catch(Exception e1){ }
       }
}


  public void ejbPostCreate(java.math.BigDecimal noKkLma) throws CreateException {
   /**@todo Complete this method*/
 }

 public void ejbPostCreate(pinda_num_suda new_record,String np, String nk, String nc, String nl) throws CreateException
 {
   try
       {
         Pindah_Nup_Anggo  new_record1;
         agt_vector=new_record.getAllAnggota();
         factory=ServiceEntity.getInstance();
         home1=(RiwayatTmptDetailWniWna1Home)factory.lookup("RiwayatTmptDetailWniWna1",RiwayatTmptDetailWniWna1Home.class);
         //System.out.println("Inserting Riwayat tmpt detail wni wna...");
         for (int i = 0; i < agt_vector.size(); i++)
         {
           new_record1=(Pindah_Nup_Anggo)agt_vector.elementAt(i);
           remote1=home1.create(new_record,new_record1,np,nk,nc,nl);
         }
         //System.out.println("Inserted Riwayat tempt detail wni wna");
        } catch(Exception err)
     {
       //System.out.println(err.toString());
       siakWriter.writeFile(err);
     }
 }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKkLma(java.math.BigDecimal noKkLma);
  public abstract void setNamaKepalaLma(java.lang.String namaKepalaLma);
  public abstract void setRencTgl(java.lang.String rencTgl);
  public abstract void setAlmtLma(java.lang.String almtLma);
  public abstract void setAlmtRtLma(java.math.BigDecimal almtRtLma);
  public abstract void setAlmtRwLma(java.math.BigDecimal almtRwLma);
  public abstract void setDusunLma(java.lang.String dusunLma);
  public abstract void setAlmtKodeposLma(java.math.BigDecimal almtKodeposLma);
  public abstract void setAlmtTelpLma(java.lang.String almtTelpLma);
  public abstract void setNamaCmatLma(java.lang.String namaCmatLma);
  public abstract void setNamaLurLma(java.lang.String namaLurLma);
  public abstract void setNamaPetLma(java.lang.String namaPetLma);
  public abstract void setNipPetLma(java.math.BigDecimal nipPetLma);
  public abstract void setTglEntriLma(java.lang.String tglEntriLma);
  public abstract void setNoKkBru(java.math.BigDecimal noKkBru);
  public abstract void setNamaCamatBru(java.lang.String namaCamatBru);
  public abstract void setNamaLurBru(java.lang.String namaLurBru);
  public abstract void setNamaPetBru(java.lang.String namaPetBru);
  public abstract void setNipPetBru(java.math.BigDecimal nipPetBru);
  public abstract void setTglEntriBru(java.lang.String tglEntriBru);
  public abstract void setTglDtng(java.lang.String tglDtng);
  public abstract java.math.BigDecimal getNoKkLma();
  public abstract java.lang.String getNamaKepalaLma();
  public abstract java.lang.String getRencTgl();
  public abstract java.lang.String getAlmtLma();
  public abstract java.math.BigDecimal getAlmtRtLma();
  public abstract java.math.BigDecimal getAlmtRwLma();
  public abstract java.lang.String getDusunLma();
  public abstract java.math.BigDecimal getAlmtKodeposLma();
  public abstract java.lang.String getAlmtTelpLma();
  public abstract java.lang.String getNamaCmatLma();
  public abstract java.lang.String getNamaLurLma();
  public abstract java.lang.String getNamaPetLma();
  public abstract java.math.BigDecimal getNipPetLma();
  public abstract java.lang.String getTglEntriLma();
  public abstract java.math.BigDecimal getNoKkBru();
  public abstract java.lang.String getNamaCamatBru();
  public abstract java.lang.String getNamaLurBru();
  public abstract java.lang.String getNamaPetBru();
  public abstract java.math.BigDecimal getNipPetBru();
  public abstract java.lang.String getTglEntriBru();
  public abstract java.lang.String getTglDtng();
  public void ejbLoad() {
    /**@todo Complete this method*/
  }
  public void ejbStore() {
    /**@todo Complete this method*/
  }
  public void ejbActivate() {
    /**@todo Complete this method*/
  }
  public void ejbPassivate() {
    /**@todo Complete this method*/
  }
  public void unsetEntityContext() {
    this.entityContext = null;
  }
  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }

 private String getTrimData(String trimdata)
{
  if (trimdata!=null) return trimdata.trim();
  return "";
}

private boolean valueDecimalFinder(String data)
{
  if ((data!=null) && (!data.trim().equals("0")) && (!data.trim().equals(""))) return true;
  return false;
}

}