package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import java.sql.Date;

public interface RiwayatTmptDetailWniWna1 extends javax.ejb.EJBLocalObject {
  public BigDecimal getNik();
  public void setNamaLengkp(String namaLengkp);
  public String getNamaLengkp();
  public void setNoKkLma(BigDecimal noKkLma);
  public BigDecimal getNoKkLma();
  public void setNoKkBru(BigDecimal noKkBru);
  public BigDecimal getNoKkBru();
  public void setTglDtng(String tglDtng);
  public String getTglDtng();
  public void setJenisKlmin(BigDecimal jenisKlmin);
  public BigDecimal getJenisKlmin();
  public void setStatHbkel(String statHbkel);
  public String getStatHbkel();
  public void setKwrngrn(BigDecimal kwrngrn);
  public BigDecimal getKwrngrn();
  public void setNoProp(BigDecimal noProp);
  public BigDecimal getNoProp();
  public void setNoKab(BigDecimal noKab);
  public BigDecimal getNoKab();
  public void setNoKec(BigDecimal noKec);
  public BigDecimal getNoKec();
  public void setNoKel(BigDecimal noKel);
  public BigDecimal getNoKel();
  public void setRiwayatFlag(String riwayatFlag);
  public String getRiwayatFlag();
  public void setTglEntri(String tglEntri);
  public String getTglEntri();
}