package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;

abstract public class DataKeluarga2Bean implements EntityBean {
  EntityContext entityContext;
  String new_kk=null;
ServiceEntity factory;
Vector agt_vector;

BiodataWna1Home home;
BiodataWna1 remote;

BiodataWni3Home home_wni;
BiodataWni3 remote_wni;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }
  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
    /**@todo Complete this method*/
  }

public java.math.BigDecimal  ejbCreate(PermohonKK_Wna new_record) throws CreateException {
    System.out.println("inserting  DataKeluarga...");
    setNoKk(new BigDecimal(getDataTrim(new_record.getNewKK())));
    System.out.println("new_record.getNewKK()" + new_record.getNewKK());
    setNamaKep(getDataTrim(new_record.getNamaPra()));
    System.out.println("new_record.getNamaPra()" + new_record.getNamaPra());
    setAlamat(getDataTrim(new_record.getAlamat()));
    System.out.println("new_record.getAlamat()" + new_record.getAlamat());

 if (valueDecimalFinder(new_record.getNort()))   setNoRt(new BigDecimal(getDataTrim(new_record.getNort())));
   System.out.println("new_record.getNort()" + new_record.getNort());
 if (valueDecimalFinder(new_record.getNorw())) setNoRw(new BigDecimal(getDataTrim(new_record.getNorw())));
 if (valueDecimalFinder(new_record.getDusun()))  setDusun(getDataTrim(new_record.getDusun()));
    System.out.println("new_record.getDusun()" + new_record.getDusun());
if (valueDecimalFinder(new_record.getKodepos())) setKodePos(new BigDecimal(getDataTrim(new_record.getKodepos())));
    setTelp(getDataTrim(new_record.getTelp()));
    System.out.println("new_record.getAlsPermohn()" + new_record.getAlsPermohn());
if (valueDecimalFinder(new_record.getAlsPermohn())) setAlsPrmohon(new BigDecimal(getDataTrim(new_record.getAlsPermohn())));
    System.out.println("new_record.getAlsPermohn()" + new_record.getAlsPermohn());
    setNoProp(new BigDecimal(new_record.getNoProp()));
    setNoKab(new BigDecimal(new_record.getNoKab()));
    setNoKec(new BigDecimal(new_record.getNoKec()));
    setNoKel(new BigDecimal(new_record.getNoKel()));
System.out.println("new_record.getTglEntri()" + new_record.getTglEntri());
    setTglInsertion(new_record.getTglEntri());
    setPflag("N");
    setCflag("N");
    System.out.println("Record inserted into datakeluarga...");
  return null;
  }

  public void ejbPostCreate(PermohonKK_Wna new_record) throws CreateException {
      PermohanAnggota detail_record;

    try
      {
      agt_vector=new_record.getAnggota();
      factory=ServiceEntity.getInstance();
      home=(BiodataWna1Home)factory.lookup("BiodataWna1",BiodataWna1Home.class);

     System.out.println("Record updating into biodatawna...");

     for(int cntr=0;cntr<=agt_vector.size()-1;cntr++)
     {

       detail_record=(PermohanAnggota)agt_vector.elementAt(cntr);
       remote=home.findByPrimaryKey(new BigDecimal(getDataTrim(detail_record.getNik())));

       remote.setNoKk(new BigDecimal(getDataTrim(new_record.getNewKK())));  //updation of nokk  happens

      if ((detail_record.getStatHubun()!=null) && (!(detail_record.getStatHubun().equals("0"))) && (!(detail_record.getStatHubun().equals(""))))

  if (valueDecimalFinder(detail_record.getStatHubun()))
       remote.setStatHbkel(new BigDecimal(getDataTrim(detail_record.getStatHubun())));   //updation of stathubunkel happens

       remote.setCflag("Y");
       remote.setTglUbah(new_record.getTglEntri());
       System.out.println("Record updated  biodatawna...");
     }
   }
   catch(Exception err)
   {
     System.out.println(err.toString());
   }

   }


  public java.math.BigDecimal  ejbCreate(PermohonKK_Wna new_record, String source)
      throws CreateException {
      System.out.println("inserting  DataKeluarga...");
     System.out.println("new_record.getNewKK()" + new_record.getNewKK());
      setNoKk(new BigDecimal(getDataTrim(new_record.getNewKK())));
      System.out.println("new_record.getNewKK()" + new_record.getNewKK());
      setNamaKep(getDataTrim(new_record.getNamaPra()));
      System.out.println("new_record.getNamaPra()" + new_record.getNamaPra());
      setAlamat(getDataTrim(new_record.getAlamat()));
      System.out.println("new_record.getAlamat()" + new_record.getAlamat());

  if (valueDecimalFinder(new_record.getNort()))   setNoRt(new BigDecimal(getDataTrim(new_record.getNort())));


      System.out.println("new_record.getNort()" + new_record.getNort());

  if (valueDecimalFinder(new_record.getNorw())) setNoRw(new BigDecimal(getDataTrim(new_record.getNorw())));

  if (valueDecimalFinder(new_record.getDusun()))  setDusun(getDataTrim(new_record.getDusun()));

      System.out.println("new_record.getDusun()" + new_record.getDusun());

  if (valueDecimalFinder(new_record.getKodepos())) setKodePos(new BigDecimal(getDataTrim(new_record.getKodepos())));

      setTelp(getDataTrim(new_record.getTelp()));

      System.out.println("new_record.getAlsPermohn()" + new_record.getAlsPermohn());

  if (valueDecimalFinder(new_record.getAlsPermohn())) setAlsPrmohon(new BigDecimal(getDataTrim(new_record.getAlsPermohn())));

      System.out.println("new_record.getAlsPermohn()" + new_record.getAlsPermohn());

      setNoProp(new BigDecimal(new_record.getNoProp()));
      setNoKab(new BigDecimal(new_record.getNoKab()));
      setNoKec(new BigDecimal(new_record.getNoKec()));
      setNoKel(new BigDecimal(new_record.getNoKel()));

  System.out.println("new_record.getTglEntri()" + new_record.getTglEntri());
      setTglInsertion(new_record.getTglEntri());

      setPflag("N");
      setCflag("N");

      System.out.println("Record inserted into datakeluarga...");
    return null;
    }

    public void ejbPostCreate(PermohonKK_Wna new_record, String source) throws
        CreateException {
        PermohanAnggota detail_record;

      try
        {
        agt_vector=new_record.getAnggota();
        factory=ServiceEntity.getInstance();

        if (source.equals("WNA"))
        {
        home=(BiodataWna1Home)factory.lookup("BiodataWna1",BiodataWna1Home.class);

       System.out.println("Record updating into biodatawna...");

       for(int cntr=0;cntr<=agt_vector.size()-1;cntr++)
       {

         detail_record=(PermohanAnggota)agt_vector.elementAt(cntr);
         remote=home.findByPrimaryKey(new BigDecimal(getDataTrim(detail_record.getNik())));

         remote.setNoKk(new BigDecimal(getDataTrim(new_record.getNewKK())));  //updation of nokk  happens

        if ((detail_record.getStatHubun()!=null) && (!(detail_record.getStatHubun().equals("0"))) && (!(detail_record.getStatHubun().equals(""))))
        {
    if (valueDecimalFinder(detail_record.getStatHubun()))
         remote.setStatHbkel(new BigDecimal(getDataTrim(detail_record.getStatHubun())));   //updation of stathubunkel happens
        }
         remote.setCflag("Y");
         remote.setTglUbah(new_record.getTglEntri());
         System.out.println("Record updated  biodatawna...");

       }
        }

        else if(source.equals("WNI"))
        {

          home_wni=(BiodataWni3Home)factory.lookup("BiodataWni3",BiodataWni3Home.class);

         System.out.println("Record updating into biodatawni...");

         for(int cntr=0;cntr<=agt_vector.size()-1;cntr++)
         {
           detail_record=(PermohanAnggota)agt_vector.elementAt(cntr);
           remote_wni=home_wni.findByPrimaryKey(new BigDecimal(getDataTrim(detail_record.getNik())));
           remote_wni.setNoKk(new BigDecimal(getDataTrim(new_record.getNewKK())));  //updation of nokk  happens
          if ((detail_record.getStatHubun()!=null) && (!(detail_record.getStatHubun().equals("0"))) && (!(detail_record.getStatHubun().equals(""))))
          {
        if (valueDecimalFinder(detail_record.getStatHubun()))
           remote_wni.setStatHbkel(new BigDecimal(getDataTrim(detail_record.getStatHubun())));   //updation of stathubunkel happens
          }
           remote_wni.setCflag("Y");
           remote_wni.setTglUbah(new_record.getTglEntri());
           System.out.println("Record updated  biodatawni...");
         }
        }
     }
     catch(Exception err)
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

  private String getDataTrim(String datatrim)
  {
    if (datatrim!=null) return datatrim.trim();
    return("");
  }

  private boolean valueDecimalFinder(String data)
{
  if ((data!=null) && (!data.trim().equals("0")) && (!data.trim().equals("")) && (!data.trim().equals("-")) && (!data.trim().equals("null")) ) return true;
  return false;
}

}