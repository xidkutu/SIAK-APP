package com.P4B;

import javax.ejb.*;

abstract public class DataKeluargaP4bBean implements EntityBean {
  EntityContext entityContext;
  public java.lang.String ejbCreate(java.lang.String noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }
  public void ejbPostCreate(java.lang.String noKk) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKk(java.lang.String noKk);
  public abstract void setNamaKep(java.lang.String namaKep);
  public abstract void setAlamat(java.lang.String alamat);
  public abstract void setNoRt(java.lang.String noRt);
  public abstract void setNoRw(java.lang.String noRw);
  public abstract void setDusun(java.lang.String dusun);
  public abstract void setKodePos(java.lang.String kodePos);
  public abstract void setTelp(java.lang.String telp);
  public abstract void setAlsPrmohon(java.lang.String alsPrmohon);
  public abstract void setAlsNumpang(java.lang.String alsNumpang);
  public abstract void setNoProp(java.lang.String noProp);
  public abstract void setNoKab(java.lang.String noKab);
  public abstract void setNoKec(java.lang.String noKec);
  public abstract void setNoKel(java.lang.String noKel);
  public abstract void setUserid(java.lang.String userid);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract void setTglInsertion(java.lang.String tglInsertion);
  public abstract void setTglUpdation(java.lang.String tglUpdation);
  public abstract java.lang.String getNoKk();
  public abstract java.lang.String getNamaKep();
  public abstract java.lang.String getAlamat();
  public abstract java.lang.String getNoRt();
  public abstract java.lang.String getNoRw();
  public abstract java.lang.String getDusun();
  public abstract java.lang.String getKodePos();
  public abstract java.lang.String getTelp();
  public abstract java.lang.String getAlsPrmohon();
  public abstract java.lang.String getAlsNumpang();
  public abstract java.lang.String getNoProp();
  public abstract java.lang.String getNoKab();
  public abstract java.lang.String getNoKec();
  public abstract java.lang.String getNoKel();
  public abstract java.lang.String getUserid();
  public abstract java.lang.String getPflag();
  public abstract java.lang.String getCflag();
  public abstract java.lang.String getTglInsertion();
  public abstract java.lang.String getTglUpdation();
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