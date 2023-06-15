package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;

abstract public class PindahWniWna1Bean implements EntityBean
{
  EntityContext entityContext;
  ServiceEntity factory;
  Vector wni_vector;
  KelrgaPindahWniWna1Home home;
  KelrgaPindahWniWna1 remote;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }

 public java.math.BigDecimal ejbCreate(Pindah_Wni obj) throws CreateException {
          System.out.println("Inserting Pinda Wni Wna...");

         System.out.println("obj.getNokk()" + obj.getNokk());

          setNoKk(new BigDecimal (getTrimData(obj.getNokk())));

         System.out.println("obj.getAlspndh()" + obj.getAlspndh());

         setAlsPndh(new BigDecimal (getTrimData(obj.getAlspndh())));

         System.out.println("obj.getAlatjpndh()" + obj.getAlatjpndh());
         setAlamatTjpndh (getTrimData(obj.getAlatjpndh()).toString().toUpperCase());
         System.out.println("obj.getNorttjpndh()" + obj.getNorttjpndh());
         System.out.println("valueDecimalFinder(obj.getNorttjpndh())" + valueDecimalFinder(obj.getNorttjpndh()));
         setNoRtTjpndh(obj.getNorttjpndh());
         System.out.println("Dusun Tujuan=" + obj.getDusunTujuan());
         setDusun(getTrimData(obj.getDusunTujuan()).toString().toUpperCase());
         setNoRwTjpndh(obj.getNorwtjpndh());
         System.out.println("obj.getKodepostjpndh()" + obj.getKodepostjpndh());

if (valueDecimalFinder(obj.getKodepostjpndh()))     setKodeposTjpndh(new BigDecimal(getTrimData(obj.getKodepostjpndh())));
         System.out.println("obj.getTelptjpndh()" + obj.getTelptjpndh());

if (valueDecimalFinder(obj.getTelptjpndh()))   setTelpTjpndh(getTrimData(obj.getTelptjpndh()));
      System.out.println("obj.getNoprop()" + obj.getNoprop());

if (valueDecimalFinder(obj.getNoprop()))     setNoProp(new BigDecimal (getTrimData(obj.getNoprop())));

          System.out.println("obj.getNokab()" + obj.getNokab());

if (valueDecimalFinder(obj.getNokab()))     setNoKab(new BigDecimal (getTrimData(obj.getNokab())));

System.out.println("obj.getNokec()" + obj.getNokec());

if (valueDecimalFinder(obj.getNokec()))    setNoKec(new BigDecimal (getTrimData(obj.getNokec())));
          System.out.println("obj.getNokel()" + obj.getNokel());
if (valueDecimalFinder(obj.getNokel()))  setNoKel(new BigDecimal (getTrimData(obj.getNokel())));
if (valueDecimalFinder(obj.getJeskpndhn()))    setJenisKpndhn(new BigDecimal (getTrimData(obj.getJeskpndhn())));
if (valueDecimalFinder(obj.getRenctglpindah()))    setRencTgl(getTrimData(obj.getRenctglpindah()));
    System.out.println("obj.getKlasfpndh()" + obj.getKlasfpndh());
if (valueDecimalFinder(obj.getKlasfpndh()))  setKlasfPndh(new BigDecimal (getTrimData(obj.getKlasfpndh())));
         setNamaKep(obj.getNamakep());
         setNamaCmat(obj.getNamacmat());
         setNamaBup(getTrimData(obj.getNamakep().toString().toUpperCase()));
         setNamaPetEntri(getTrimData(obj.getNamapetentri()).toString().toUpperCase());
         System.out.println("obj.getNippetentri()" + obj.getNippetentri());
if (valueDecimalFinder(obj.getNippetentri()))   setNipPetEntri(new BigDecimal (getTrimData(obj.getNippetentri())));
          setTglEntri(getTrimData(obj.getTglentri()));
          System.out.println("obj.getNikk()" + obj.getNikk());
if (valueDecimalFinder(obj.getNikk()))    setNik(new BigDecimal(getTrimData(obj.getNikk())));
          setNamaKk(getTrimData(obj.getNamakk()).toString().toUpperCase());
          setNamaProp(getTrimData(obj.getNamaProp()).toString().toUpperCase());
          setNamaKab(getTrimData(obj.getNamaKab()).toString().toUpperCase());
          setNamaKec(getTrimData(obj.getNamaKec()).toString().toUpperCase());
          setNamaKel(getTrimData(obj.getNamaKel()).toString().toUpperCase());
          setNopropasl(obj.getNoPropAsal());
          setNokabasl(obj.getNoKabAsal());
          setNokecasl(obj.getNoKecAsal());
          setNokelasl(obj.getNoKelAsal());
          System.out.println("Inserted Pinda Wni Wna...");
      return null;
}

 public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
/*    @todo Complete this method*/
  }


  public void ejbPostCreate(Pindah_Wni obj) throws CreateException {
    GetKelrgaPindah  new_record;
    try
    {
      factory=ServiceEntity.getInstance();
      home=(KelrgaPindahWniWna1Home)factory.lookup("KelrgaPindahWniWna1",KelrgaPindahWniWna1Home.class);
      if(home!=null)
      {
       wni_vector=obj.getAngotta();
       System.out.println("wni_vector " + wni_vector.size());

       System.out.println("Inserting kelrga Pinda Wni Wna...");

       for(int x = 0; x < wni_vector.size(); x++)
       {
         new_record=(GetKelrgaPindah)wni_vector.elementAt(x);
         remote=home.create(obj,new_record);
       }
     }
    }catch(Exception err){
              System.out.println("Error in Pindah Wni Wna create "+err.toString());
            }
  }
  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setAlsPndh(java.math.BigDecimal alsPndh);
  public abstract void setAlamatTjpndh(java.lang.String alamatTjpndh);
  public abstract void setNoRtTjpndh(java.lang.String noRtTjpndh);
  public abstract void setNoRwTjpndh(java.lang.String noRwTjpndh);
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
  public abstract void setNopropasl(java.lang.String nopropasl);
  public abstract void setNokabasl(java.lang.String nokabasl);
  public abstract void setNokecasl(java.lang.String nokecasl);
  public abstract void setNokelasl(java.lang.String nokelasl);
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.math.BigDecimal getAlsPndh();
  public abstract java.lang.String getAlamatTjpndh();
  public abstract java.lang.String getNoRtTjpndh();
  public abstract java.lang.String getNoRwTjpndh();
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
  public abstract java.lang.String getNopropasl();
  public abstract java.lang.String getNokabasl();
  public abstract java.lang.String getNokecasl();
  public abstract java.lang.String getNokelasl();
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