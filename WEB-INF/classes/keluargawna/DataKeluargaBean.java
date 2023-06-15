package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;

abstract public class DataKeluargaBean implements EntityBean {
EntityContext entityContext;

String new_kk=null;
ServiceEntity factory;
Vector wna_vector;

BiodataWnaHome home;
BiodataWna remote;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }

  public java.math.BigDecimal  ejbCreate(GdataWna obj,GdataKelu kelu) throws CreateException
  {
    System.out.println("inserting dataKeluarga....");

    setNoKk(new BigDecimal(kelu.getDknokk()));
    setNamaKep(kelu.getDknamakep());
    setAlamat(kelu.getDkalamat());

    if (checkNull(kelu.getDknort()))
    setNoRt(new BigDecimal(kelu.getDknort()));

    if (checkNull(kelu.getDknorw()))
     setNoRw(new BigDecimal(kelu.getDknorw()));

     setDusun(kelu.getDkdusun());

     if (checkNull(kelu.getDkkodepos()))
     setKodePos(new BigDecimal(kelu.getDkkodepos()));

     setTelp(kelu.getDktelp());

    setNoProp(new BigDecimal(kelu.getDknoprop()));
    setNoKab(new BigDecimal(kelu.getDknokab()));
    setNoKec(new BigDecimal(kelu.getDknokec()));
    setNoKel(new BigDecimal(kelu.getDknokel()));
    setTglInsertion(obj.getTglEnt());

    setPflag("N");
    setCflag("N");

    System.out.println("inserted data keluarga...!!");
  return null;
  }

  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
      /**@todo Complete this method*/
    }
    public void ejbPostCreate(GdataWna obj,GdataKelu kelu) throws CreateException
    {
    try
    {
      factory=ServiceEntity.getInstance();
      System.out.println("In Data Keluarga Bean Post Create KK" + obj.getNoKk());
      System.out.println("In Data Keluarga Bean Post Create Nik" + obj.getNik());
      home=(BiodataWnaHome)factory.lookup("BiodataWna_machine2",BiodataWnaHome.class);
      remote=home.create(obj);
         System.out.println("Inserted biodata");
   } catch(Exception err)
  {
    System.out.println(err.toString());
  }
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNamaKep(java.lang.String namaKep);
  public abstract void setAlamat(java.lang.String alamat);
  public abstract void setNoRt(java.math.BigDecimal noRt);
  public abstract void setNoRw(java.math.BigDecimal noRw);
  public abstract void setDusun(java.lang.String dusun);
  public abstract void setKodePos(java.math.BigDecimal kodePos);
  public abstract void setTelp(java.lang.String telp);
  public abstract void setAlsPrmohon(java.math.BigDecimal alsPrmohon);
  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setUserid(java.math.BigDecimal userid);
  public abstract void setTglInsertion(java.lang.String tglInsertion);
  public abstract void setTglUpdation(java.lang.String tglUpdation);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.lang.String getNamaKep();
  public abstract java.lang.String getAlamat();
  public abstract java.math.BigDecimal getNoRt();
  public abstract java.math.BigDecimal getNoRw();
  public abstract java.lang.String getDusun();
  public abstract java.math.BigDecimal getKodePos();
  public abstract java.lang.String getTelp();
  public abstract java.math.BigDecimal getAlsPrmohon();
  public abstract java.math.BigDecimal getAlsNumpang();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.math.BigDecimal getUserid();
  public abstract java.lang.String getTglInsertion();
  public abstract java.lang.String getTglUpdation();
  public abstract java.lang.String getPflag();
  public abstract java.lang.String getCflag();
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

private static String getTrimData(Object trimdata) {
   if (trimdata != null) {
     return trimdata.toString().trim();
   }
   return "";
 }

 private static boolean checkNull(Object trimdata) {
    if ((trimdata != null) && (!trimdata.toString().trim().equals(""))
       && (!trimdata.toString().trim().equals("0")))
        {
      return true;
    }
    return false;
}

 private static String getTrimData(String val, Object trimdata) {
   if (trimdata != null) {
     if (trimdata.toString().length() == 1) {
       return trimdata.toString();
     }
     if (trimdata.toString().length() > 1) {
       return trimdata.toString().trim();
     }
   }
   return val;
 }

}