package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface KelrgaPindahWniWna extends javax.ejb.EJBLocalObject {
  public BigDecimal getNik();
  public void setNoKk(BigDecimal noKk);
  public BigDecimal getNoKk();
  public void setNamaLgkp(String namaLgkp);
  public String getNamaLgkp();
  public void setStatHbkel(String statHbkel);
  public String getStatHbkel();
}
