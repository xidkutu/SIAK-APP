package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;


abstract public class KelrgaPindahWniWna1Bean implements EntityBean {
  EntityContext entityContext;


public java.math.BigDecimal ejbCreate(Pindah_Wni obj, GetKelrgaPindah new_record) throws CreateException {
           System.out.println("inside the Kelurga pindah value");

           setNik(new BigDecimal(getTrimData(new_record.getNik())));

           setNoKk(new BigDecimal(getTrimData(new_record.getNokk())));

           setNamaLgkp(getTrimData(new_record.getNamaKep()));
           setStatHbkel(getTrimData(new_record.getStatHbkel()));
           setJenisKlmin(new BigDecimal(getTrimData(new_record.getJenisKlmin())));

           setKwrngrn(new BigDecimal(new_record.getKwrn()));

           setRencTgl(getTrimData(obj.getRenctglpindah()));

if (valueDecimalFinder(obj.getNoprop()))  setNoProp(new BigDecimal(getTrimData(obj.getNoprop())));
if (valueDecimalFinder(obj.getNokab()))   setNoKab(new BigDecimal(getTrimData(obj.getNokab())));

if (valueDecimalFinder(obj.getNokec()))    setNoKec(new BigDecimal(getTrimData(obj.getNokec())));

if (valueDecimalFinder(obj.getNokel()))    setNoKel(new BigDecimal(getTrimData(obj.getNokel())));

           setPindahFlag("N");

           System.out.println("Inserted kelrga Pinda Wni Wna...");
    return null;
 }

  public void ejbPostCreate(Pindah_Wni obj, GetKelrgaPindah new_record) throws CreateException {
    /**@todo Complete this method*/
  }

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws CreateException {
    setNik(nik);
    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }


  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNik(java.math.BigDecimal nik);
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNamaLgkp(java.lang.String namaLgkp);
  public abstract void setStatHbkel(java.lang.String statHbkel);
  public abstract void setJenisKlmin(java.math.BigDecimal jenisKlmin);
  public abstract void setKwrngrn(java.math.BigDecimal kwrngrn);
  public abstract void setRencTgl(java.lang.String rencTgl);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setPindahFlag(java.lang.String pindahFlag);
  public abstract java.math.BigDecimal getNik();
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.lang.String getNamaLgkp();
  public abstract java.lang.String getStatHbkel();
  public abstract java.math.BigDecimal getJenisKlmin();
  public abstract java.math.BigDecimal getKwrngrn();
  public abstract java.lang.String getRencTgl();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.lang.String getPindahFlag();
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
  public abstract java.util.Collection ejbSelectAnggota(java.math.BigDecimal nokk) throws FinderException;
  public java.util.Collection ejbHomeGetAnggota(java.math.BigDecimal nokk) throws FinderException {
    Collection  det_rec=null;
    try{
    det_rec=ejbSelectAnggota(nokk);
    }catch(Exception colErr)
    {
      System.out.println("Error in KelrgaPindahWniWna1 ejbselect=" + colErr.toString());
    }
   return(det_rec);
  }
  private String getTrimData(String trimdata)
  {
    if (trimdata!=null) return trimdata.trim();
    return "";
  }

  private boolean valueDecimalFinder(String data)
  {
    if ((data!=null) && (!data.trim().equals("0")) && (!data.trim().equals("null")) && (!data.trim().equals(""))) return true;
    return false;
  }

}