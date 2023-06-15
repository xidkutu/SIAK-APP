package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import java.sql.Date;

public interface DataKeluarga1 extends javax.ejb.EJBLocalObject {
  public BigDecimal getNoKk();
  public void setNamaKep(String namaKep);
  public String getNamaKep();
  public void setAlamat(String alamat);
  public String getAlamat();
  public void setNoRt(BigDecimal noRt);
  public BigDecimal getNoRt();
  public void setNoRw(BigDecimal noRw);
  public BigDecimal getNoRw();
  public void setDusun(String dusun);
  public String getDusun();
  public void setKodePos(BigDecimal kodePos);
  public BigDecimal getKodePos();
  public void setTelp(String telp);
  public String getTelp();
  public void setAlsPrmohon(BigDecimal alsPrmohon);
  public BigDecimal getAlsPrmohon();
  public void setAlsNumpang(BigDecimal alsNumpang);
  public BigDecimal getAlsNumpang();
  public void setNoProp(BigDecimal noProp);
  public BigDecimal getNoProp();
  public void setNoKab(BigDecimal noKab);
  public BigDecimal getNoKab();
  public void setNoKec(BigDecimal noKec);
  public BigDecimal getNoKec();
  public void setNoKel(BigDecimal noKel);
  public BigDecimal getNoKel();
  public void setUserid(BigDecimal userid);
  public BigDecimal getUserid();
  public void setTglInsertion(String tglInsertion);
  public String getTglInsertion();
  public void setTglUpdation(String tglUpdation);
  public String getTglUpdation();
  public void setPflag(String pflag);
  public String getPflag();
  public void setCflag(String cflag);
  public String getCflag();
}