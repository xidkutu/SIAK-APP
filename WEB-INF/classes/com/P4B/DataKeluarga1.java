package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import java.sql.Date;

public interface DataKeluarga1 extends javax.ejb.EJBLocalObject {
  public String getNoKk();
  public void setNamaKep(String namaKep);
  public String getNamaKep();
  public void setAlamat(String alamat);
  public String getAlamat();
  public void setNoRt(String noRt);
  public String getNoRt();
  public void setNoRw(String noRw);
  public String getNoRw();
  public void setDusun(String dusun);
  public String getDusun();
  public void setKodePos(String kodePos);
  public String getKodePos();
  public void setTelp(String telp);
  public String getTelp();
  public void setAlsPrmohon(String alsPrmohon);
  public String getAlsPrmohon();
  public void setAlsNumpang(String alsNumpang);
  public String getAlsNumpang();
  public void setNoProp(String noProp);
  public String getNoProp();
  public void setNoKab(String noKab);
  public String getNoKab();
  public void setNoKec(String noKec);
  public String getNoKec();
  public void setNoKel(String noKel);
  public String getNoKel();
  public void setUserid(String userid);
  public String getUserid();
  public void setTglInsertion(String tglInsertion);
  public String getTglInsertion();
  public void setTglUpdation(String tglUpdation);
  public String getTglUpdation();
  public void setPflag(String pflag);
  public String getPflag();
  public void setCflag(String cflag);
  public String getCflag();
}