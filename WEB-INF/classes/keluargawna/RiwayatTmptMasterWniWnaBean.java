package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;
abstract public class RiwayatTmptMasterWniWnaBean implements EntityBean {
  EntityContext entityContext;
  ServiceEntity factory;
  Vector agt_vector,detail_record;
  RiwayatTmptDetailWniWnaHome home;
  RiwayatTmptDetailWniWna remote;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKkLma) throws CreateException {
    setNoKkLma(noKkLma);
    return null;
  }
  public java.math.BigDecimal ejbCreate(pinda_num_suda new_record) throws CreateException
  {
   System.out.println("Updating Riwayat Master...");
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
   System.out.println("Insert finished in riwayat master entity bean");
   return null;
  }
  public java.math.BigDecimal ejbCreate(Kedatan_keluarga obj, String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP) throws CreateException
  {
    System.out.println("Updating Riwayat Master...");
   setNoKkLma(new BigDecimal(obj.getNokk()));
   setNamaKepalaLma(obj.getNaKk().toString().toUpperCase());
   setRencTgl(obj.getReTgl().toString().toUpperCase());
   setAlmtLma(ALAMAT);
   setAlmtRtLma(new BigDecimal(NO_RT));
   setAlmtRwLma(new BigDecimal(NO_RW));
   setDusunLma(DUSUN.toString().toUpperCase());
   setAlmtKodeposLma(new BigDecimal(KODE_POS));
   setAlmtTelpLma(TELP);
   setNamaCmatLma(obj.getNaCat().toString().toUpperCase());
   setNamaLurLma(obj.getNaLur().toString().toUpperCase());
   setNamaPetLma(obj.getNaPet().toString().toUpperCase());
   setNipPetLma(new BigDecimal(obj.getNiPet()));
   setTglEntriLma(obj.getTglLma());
   setNoKkBru(new BigDecimal(obj.getNokk()));
   setNamaCamatBru(obj.getCatBru().toString().toUpperCase());
   setNamaLurBru(obj.getLurBru().toString().toUpperCase());
   setNamaPetBru(obj.getPetBru().toString().toUpperCase());
   setNipPetBru(new BigDecimal(obj.getNiBru()));
   setTglEntriBru(obj.getTglUpd().toString().toUpperCase());
   setTglDtng(obj.getTglUpd().toString().toUpperCase());
   System.out.println("Insert finished in riwayat master entity bean");
   return null;

  }
  public void ejbPostCreate(java.math.BigDecimal noKkLma) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(Kedatan_keluarga obj, String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(pinda_num_suda new_record) throws CreateException
  {
    try
        {
          Pindah_Nup_Anggo detail_record;
          agt_vector=new_record.getAllAnggota();
          factory=ServiceEntity.getInstance();
          home=(RiwayatTmptDetailWniWnaHome)factory.lookup("RiwayatTmptDetailWniWna",RiwayatTmptDetailWniWnaHome.class);
          for (int i = 0; i < agt_vector.size(); i++)
          {
            detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(i);
            remote=home.create(detail_record.getNik(),detail_record.getNamaLgkp(),new_record.getNokk(),new_record.getNokkNum());
          }
         } catch(Exception err)
      {
        System.out.println(err.toString());
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
}