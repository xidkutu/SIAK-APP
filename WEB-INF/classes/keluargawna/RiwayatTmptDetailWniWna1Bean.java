package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;


abstract public class RiwayatTmptDetailWniWna1Bean implements EntityBean {
  EntityContext entityContext;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws CreateException {
    setNik(nik);
    return null;
  }

  public java.math.BigDecimal ejbCreate(Kedatan_keluarga obj, GetKelrgaPindah new_record) throws CreateException {
     System.out.println(new_record.getNik()+new_record.getNamaKep()+new_record.getNokk()+obj.getTglUpd()+new_record.getJenisKlmin()+new_record.getStatHbkel()+new_record.getKwrn());
  System.out.println("before setNik finsihed");

   setNik(new BigDecimal(getTrimData(new_record.getNik())));

   System.out.println("setNik finsihed");

   setNamaLengkp(getTrimData(new_record.getNamaKep()));

   System.out.println("setNamaLengkp finsihed");

   setNoKkLma(new BigDecimal(getTrimData(obj.getNO_KK_LMA())));

    System.out.println("setNoKkLma finsihed");

     setNoKkBru(new BigDecimal(getTrimData(obj.getNO_KK_BRU())));

     System.out.println("setNoKkBru finsihed");

     System.out.println("obj.getTGL_DTNG()" + obj.getTGL_DTNG());
     setTglDtng(getTrimData(obj.getTGL_DTNG()));

//     System.out.println("setTglDtng finsihed" + obj.getTglUpd().trim());

if (valueDecimalFinder(new_record.getJenisKlmin()))
     setJenisKlmin(new BigDecimal(getTrimData(new_record.getJenisKlmin())));


     System.out.println("setJenisKlmin finsihed");

     setStatHbkel(getTrimData(new_record.getStatHbkel()));

     System.out.println("setStatHbkel finsihed");

if (valueDecimalFinder(new_record.getKwrn()))
     setKwrngrn(new BigDecimal(getTrimData(new_record.getKwrn())));

     System.out.println("setKwrngrn finsihed");

if (valueDecimalFinder(obj.getNoProp()))
     setNoProp(new BigDecimal(getTrimData(obj.getNoPropAsl())));

     System.out.println("setNoProp finsihed");

if (valueDecimalFinder(obj.getNoKab()))
     setNoKab(new BigDecimal(getTrimData(obj.getNoKabAsl())));


     System.out.println("setNoKab finsihed");

if (valueDecimalFinder(obj.getNoKec()))
     setNoKec(new BigDecimal(getTrimData(obj.getNoKecAsl())));


     System.out.println("setNoKec finsihed");

if (valueDecimalFinder(obj.getNoKel()))
     setNoKel(new BigDecimal(getTrimData(obj.getNoKelAsl())));

     System.out.println("setNoKel finsihed");
     setRiwayatFlag("Y");
     setTglEntri(getTrimData(obj.getTGL_ENTRI_BRU()));
     System.out.println("obj.getTglEntri() setTglEntri finsihed" +obj.getTGL_ENTRI_BRU());
    return null;
}

  public java.math.BigDecimal ejbCreate(pinda_num_suda new_record, Pindah_Nup_Anggo new_record1, String np, String nk, String nc, String nl) throws CreateException {
     System.out.println(new_record1.getNik()+new_record1.getNamaLgkp()+new_record.getNokkNum());
     setNik(new BigDecimal(new_record1.getNik()));
     setNamaLengkp(new_record1.getNamaLgkp());
     setNoKkLma(new BigDecimal(new_record.getNokk()));
     setNoKkBru(new BigDecimal(new_record.getNokkNum()));
     setTglDtng(new_record.getTglDtng());
     setJenisKlmin(new BigDecimal("0"));
     setStatHbkel(new_record1.getStatHubun());
     setKwrngrn(new BigDecimal("2"));
     setNoProp(new BigDecimal(np));
     setNoKab(new BigDecimal(nk));
     setNoKec(new BigDecimal(nc));
     setNoKel(new BigDecimal(nl));
     setRiwayatFlag("Y");
     setTglEntri(new_record.getTglEntBru());
    return null;
  }
  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(Kedatan_keluarga obj, GetKelrgaPindah new_record) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(pinda_num_suda new_record, Pindah_Nup_Anggo new_record1, String np, String nk, String nc, String nl) throws CreateException {
      /**@todo Complete this method*/
    }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNik(java.math.BigDecimal nik);
  public abstract void setNamaLengkp(java.lang.String namaLengkp);
  public abstract void setNoKkLma(java.math.BigDecimal noKkLma);
  public abstract void setNoKkBru(java.math.BigDecimal noKkBru);
  public abstract void setTglDtng(java.lang.String tglDtng);
  public abstract void setJenisKlmin(java.math.BigDecimal jenisKlmin);
  public abstract void setStatHbkel(java.lang.String statHbkel);
  public abstract void setKwrngrn(java.math.BigDecimal kwrngrn);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setRiwayatFlag(java.lang.String riwayatFlag);
  public abstract void setTglEntri(java.lang.String tglEntri);
  public abstract java.math.BigDecimal getNik();
  public abstract java.lang.String getNamaLengkp();
  public abstract java.math.BigDecimal getNoKkLma();
  public abstract java.math.BigDecimal getNoKkBru();
  public abstract java.lang.String getTglDtng();
  public abstract java.math.BigDecimal getJenisKlmin();
  public abstract java.lang.String getStatHbkel();
  public abstract java.math.BigDecimal getKwrngrn();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.lang.String getRiwayatFlag();
  public abstract java.lang.String getTglEntri();
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