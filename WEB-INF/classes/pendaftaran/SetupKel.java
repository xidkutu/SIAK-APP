package pendaftaran;

import java.math.*;

public interface SetupKel
    extends javax.ejb.EJBLocalObject {
  public BigDecimal getNoKel();

  public void setNamaKel(String namaKel);

  public String getNamaKel();

  public BigDecimal getNoKec();

  public BigDecimal getNoKab();

  public BigDecimal getNoProp();

  public void setJabatan(String jabatan);

  public String getJabatan();

  public void setNamaLur(String namaLur);

  public String getNamaLur();

  public void setNipLur(String nipLur);

  public String getNipLur();
}