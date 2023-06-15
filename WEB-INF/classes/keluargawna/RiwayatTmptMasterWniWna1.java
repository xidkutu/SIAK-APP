package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import java.sql.Date;

public interface RiwayatTmptMasterWniWna1 extends javax.ejb.EJBLocalObject {
  public BigDecimal getNoKkLma();
  public void setNamaKepalaLma(String namaKepalaLma);
  public String getNamaKepalaLma();
  public void setRencTgl(String rencTgl);
  public String getRencTgl();
  public void setAlmtLma(String almtLma);
  public String getAlmtLma();
  public void setAlmtRtLma(BigDecimal almtRtLma);
  public BigDecimal getAlmtRtLma();
  public void setAlmtRwLma(BigDecimal almtRwLma);
  public BigDecimal getAlmtRwLma();
  public void setDusunLma(String dusunLma);
  public String getDusunLma();
  public void setAlmtKodeposLma(BigDecimal almtKodeposLma);
  public BigDecimal getAlmtKodeposLma();
  public void setAlmtTelpLma(String almtTelpLma);
  public String getAlmtTelpLma();
  public void setNamaCmatLma(String namaCmatLma);
  public String getNamaCmatLma();
  public void setNamaLurLma(String namaLurLma);
  public String getNamaLurLma();
  public void setNamaPetLma(String namaPetLma);
  public String getNamaPetLma();
  public void setNipPetLma(BigDecimal nipPetLma);
  public BigDecimal getNipPetLma();
  public void setTglEntriLma(String tglEntriLma);
  public String getTglEntriLma();
  public void setNoKkBru(BigDecimal noKkBru);
  public BigDecimal getNoKkBru();
  public void setNamaCamatBru(String namaCamatBru);
  public String getNamaCamatBru();
  public void setNamaLurBru(String namaLurBru);
  public String getNamaLurBru();
  public void setNamaPetBru(String namaPetBru);
  public String getNamaPetBru();
  public void setNipPetBru(BigDecimal nipPetBru);
  public BigDecimal getNipPetBru();
  public void setTglEntriBru(String tglEntriBru);
  public String getTglEntriBru();
  public void setTglDtng(String tglDtng);
  public String getTglDtng();
}