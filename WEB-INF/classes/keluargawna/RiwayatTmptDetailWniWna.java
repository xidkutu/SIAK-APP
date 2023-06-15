package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface RiwayatTmptDetailWniWna extends javax.ejb.EJBLocalObject {
  public BigDecimal getNik();
  public void setNamaLengkp(String namaLengkp);
  public String getNamaLengkp();
  public void setNoKkLma(BigDecimal noKkLma);
  public BigDecimal getNoKkLma();
  public void setNoKkBru(BigDecimal noKkBru);
  public BigDecimal getNoKkBru();
}