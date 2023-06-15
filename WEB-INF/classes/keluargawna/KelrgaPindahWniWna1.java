package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import java.sql.Date;

public interface KelrgaPindahWniWna1 extends javax.ejb.EJBLocalObject {
  public BigDecimal getNik();
  public void setNoKk(BigDecimal noKk);
  public BigDecimal getNoKk();
  public void setNamaLgkp(String namaLgkp);
  public String getNamaLgkp();
  public void setStatHbkel(String statHbkel);
  public String getStatHbkel();
  public void setJenisKlmin(BigDecimal jenisKlmin);
  public BigDecimal getJenisKlmin();
  public void setKwrngrn(BigDecimal kwrngrn);
  public BigDecimal getKwrngrn();
  public void setRencTgl(String rencTgl);
  public String getRencTgl();
  public void setNoProp(BigDecimal noProp);
  public BigDecimal getNoProp();
  public void setNoKab(BigDecimal noKab);
  public BigDecimal getNoKab();
  public void setNoKec(BigDecimal noKec);
  public BigDecimal getNoKec();
  public void setNoKel(BigDecimal noKel);
  public BigDecimal getNoKel();
  public void setPindahFlag(String pindahFlag);
  public String getPindahFlag();
}