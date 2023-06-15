package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;

abstract public class DataKeluarga1Bean implements EntityBean {
 EntityContext entityContext;

String new_kk=null;
ServiceEntity factory;
Vector agt_vector;

BiodataWniHome home;
BiodataWni remote;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }
  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
    /**@todo Complete this method*/
  }
  public java.math.BigDecimal  ejbCreate(PermohonKK new_record) throws CreateException {
    System.out.println("inside entity DataKeluarga");
    setNoKk(new BigDecimal(new_record.getNewKK()));
    System.out.println(new_record.getNewKK());
    setNamaKep(new_record.getNamalgkp());
    System.out.println(new_record.getNamalgkp());
    setAlamat(new_record.getAlamat());
    System.out.println(new_record.getAlamat());
    setNoRt(new BigDecimal(new_record.getNort()));
    System.out.println(new_record.getNort());
    setNoRw(new BigDecimal(new_record.getNorw()));
    setDusun(new_record.getDusun());
    System.out.println(new_record.getDusun());
    setKodePos(new BigDecimal(new_record.getKodepos()));
    setTelp(new_record.getTelp());
    System.out.println(new_record.getAlsPermohn());
    setAlsPrmohon(new BigDecimal(new_record.getAlsPermohn()));
    System.out.println(new_record.getAlsPermohn());
    setAlsNumpang(new BigDecimal("0"));
    setNoProp(new BigDecimal(new_record.getNoProp()));
    setNoKab(new BigDecimal(new_record.getNoKab()));
    setNoKec(new BigDecimal(new_record.getNoKec()));
    setNoKel(new BigDecimal(new_record.getNoKel()));
    setUserid(new BigDecimal("0"));
    new_record.getTglEntri();
    setTglInsertion("");
    setTglUpdation("");
    setPflag("N");
    setCflag("N");
  //   new_kk=new_record.getNewKK();
    System.out.println("Came inside entity bean");
  return null;
  }

  public void ejbPostCreate(PermohonKK new_record) throws CreateException {
      PermohanAnggota detail_record;
      try
      {
      agt_vector=new_record.getAnggota();
      factory=ServiceEntity.getInstance();
      home=(BiodataWniHome)factory.lookup("BiodataWni_machine2",BiodataWniHome.class);

    // System.out.println("Vector Size=" + agt_vector.size());

     for(int cntr=0;cntr<=agt_vector.size()-1;cntr++)
     {
       detail_record=(PermohanAnggota)agt_vector.elementAt(cntr);
   //    System.out.println("Nik=" + detail_record.getNik());
    //   System.out.println("No Kk=" + new_record.getNewKK());
       remote=home.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
       remote.setNoKk(new BigDecimal(new_record.getNewKK()));  //updation of nokk  happens
       if (!(detail_record.getStatHubun().equals("0")))
        remote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));   //updation of stathubunkel happens
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
}