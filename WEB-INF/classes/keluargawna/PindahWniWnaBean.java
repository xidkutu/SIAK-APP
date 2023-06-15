package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;

abstract public class PindahWniWnaBean implements EntityBean
{
  EntityContext entityContext;
  ServiceEntity factory;
  Vector wni_vector;
  KelrgaPindahWniWnaHome home;
  KelrgaPindahWniWna remote;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }

  public java.math.BigDecimal ejbCreate(Pindah_Wni obj, Vector vt) throws CreateException
  {
          System.out.println("Inserting Pinda Wni Wna...");
          setNoKk(new BigDecimal (getTrimData(obj.getNokk())));

if (valueDecimalFinder(obj.getAlspndh()))
          setAlsPndh(new BigDecimal (getTrimData(obj.getAlspndh())));

          setAlamatTjpndh (getTrimData(obj.getAlatjpndh()).toString().toUpperCase());

if (valueDecimalFinder(obj.getNorttjpndh()))
          setNoRtTjpndh(new BigDecimal (getTrimData(obj.getNorttjpndh())));

if (valueDecimalFinder(obj.getNorwtjpndh()))
          setNoRwTjpndh(new BigDecimal (getTrimData(obj.getNorwtjpndh())));

if (valueDecimalFinder(obj.getKodepostjpndh()))
          setKodeposTjpndh(new BigDecimal(getTrimData(obj.getKodepostjpndh())));

          setTelpTjpndh(getTrimData(obj.getTelptjpndh()));

if (valueDecimalFinder(obj.getNoprop()))
          setNoProp(new BigDecimal (getTrimData(obj.getNoprop())));

          System.out.println(obj.getNoprop());
if (valueDecimalFinder(obj.getNokab()))
          setNoKab(new BigDecimal (getTrimData(obj.getNokab())));

if (valueDecimalFinder(obj.getNokec()))
          setNoKec(new BigDecimal (getTrimData(obj.getNokec())));

if (valueDecimalFinder(obj.getNokel()))
          setNoKel(new BigDecimal (getTrimData(obj.getNokel())));


if (valueDecimalFinder(obj.getJeskpndhn()))
          setJenisKpndhn(new BigDecimal (getTrimData(obj.getJeskpndhn())));

          setRencTgl(getTrimData(obj.getRenctglpindah()));

if (valueDecimalFinder(obj.getKlasfpndh()))
          setKlasfPndh(new BigDecimal (getTrimData(obj.getKlasfpndh())));

          setNamaKep(getTrimData(obj.getNamakep()).toString().toUpperCase());
          setNamaCmat(getTrimData(obj.getNamacmat()).toString().toUpperCase());
          setNamaBup("");
          setNamaPetEntri(getTrimData(obj.getNamapetentri()).toString().toUpperCase());

if (valueDecimalFinder(obj.getNippetentri()))
          setNipPetEntri(new BigDecimal (getTrimData(obj.getNippetentri())));


          setTglEntri(getTrimData(obj.getTglentri()));
          setDusun(getTrimData(obj.getDusunTujuan()).toString().toUpperCase());

if (valueDecimalFinder(obj.getNikk()))
          setNik(new BigDecimal(getTrimData(obj.getNikk())));

          setNamaKk(getTrimData(obj.getNamakk()).toString().toUpperCase());
          setNamaProp(getTrimData(obj.getNamaProp()).toString().toUpperCase());
          setNamaKab(getTrimData(obj.getNamaKab()).toString().toUpperCase());
          setNamaKec(getTrimData(obj.getNamaKec()).toString().toUpperCase());
          setNamaKel(getTrimData(obj.getNamaKel()).toString().toUpperCase());
          System.out.println("Inserted Pinda Wni Wna...");
      return null;
  }

  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(Pindah_Wni obj, Vector vt) throws CreateException {
    try
    {
      factory=ServiceEntity.getInstance();
      home=(KelrgaPindahWniWnaHome)factory.lookup("KelrgaPindahWniWna",KelrgaPindahWniWnaHome.class);
      for (int i = 1; i < vt.size(); i++)
      {
        System.out.println("Inserting kelrga Pinda Wni Wna...");
        System.out.println(vt.elementAt(i)+" "+vt.elementAt(0)+" "+vt.elementAt(i+1)+" "+vt.elementAt(i+2));
        remote=home.create((String)vt.elementAt(i),(String)vt.elementAt(0),(String)vt.elementAt(i+1),(String)vt.elementAt(i+2));
        i=i+2;
      }
      System.out.println("Inserted kelrga Pinda Wni Wna...");
     } catch(Exception err)
  {
    System.out.println(err.toString());
  }

  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setAlsPndh(java.math.BigDecimal alsPndh);
  public abstract void setAlamatTjpndh(java.lang.String alamatTjpndh);
  public abstract void setNoRtTjpndh(java.math.BigDecimal noRtTjpndh);
  public abstract void setNoRwTjpndh(java.math.BigDecimal noRwTjpndh);
  public abstract void setKodeposTjpndh(java.math.BigDecimal kodeposTjpndh);
  public abstract void setTelpTjpndh(java.lang.String telpTjpndh);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setJenisKpndhn(java.math.BigDecimal jenisKpndhn);
  public abstract void setRencTgl(java.lang.String rencTgl);
  public abstract void setKlasfPndh(java.math.BigDecimal klasfPndh);
  public abstract void setNamaKep(java.lang.String namaKep);
  public abstract void setNamaCmat(java.lang.String namaCmat);
  public abstract void setNamaBup(java.lang.String namaBup);
  public abstract void setNamaPetEntri(java.lang.String namaPetEntri);
  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);
  public abstract void setTglEntri(java.lang.String tglEntri);
  public abstract void setDusun(java.lang.String dusun);
  public abstract void setNik(java.math.BigDecimal nik);
  public abstract void setNamaKk(java.lang.String namaKk);
  public abstract void setNamaProp(java.lang.String namaProp);
  public abstract void setNamaKab(java.lang.String namaKab);
  public abstract void setNamaKec(java.lang.String namaKec);
  public abstract void setNamaKel(java.lang.String namaKel);
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.math.BigDecimal getAlsPndh();
  public abstract java.lang.String getAlamatTjpndh();
  public abstract java.math.BigDecimal getNoRtTjpndh();
  public abstract java.math.BigDecimal getNoRwTjpndh();
  public abstract java.math.BigDecimal getKodeposTjpndh();
  public abstract java.lang.String getTelpTjpndh();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.math.BigDecimal getJenisKpndhn();
  public abstract java.lang.String getRencTgl();
  public abstract java.math.BigDecimal getKlasfPndh();
  public abstract java.lang.String getNamaKep();
  public abstract java.lang.String getNamaCmat();
  public abstract java.lang.String getNamaBup();
  public abstract java.lang.String getNamaPetEntri();
  public abstract java.math.BigDecimal getNipPetEntri();
  public abstract java.lang.String getTglEntri();
  public abstract java.lang.String getDusun();
  public abstract java.math.BigDecimal getNik();
  public abstract java.lang.String getNamaKk();
  public abstract java.lang.String getNamaProp();
  public abstract java.lang.String getNamaKab();
  public abstract java.lang.String getNamaKec();
  public abstract java.lang.String getNamaKel();
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
   if ((data!=null) && (!data.trim().equals("0")) && (!data.trim().equals("null")) && (!data.trim().equals(""))) return true;
   return false;
 }

}