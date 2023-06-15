package pendaftaran;

import java.math.*;

public interface SetupKab
    extends javax.ejb.EJBLocalObject {
  public BigDecimal getNoKab();

  public void setNamaKab(String namaKab);

  public String getNamaKab();

  public BigDecimal getNoProp();

  public void setJabatan(String jabatan);

  public String getJabatan();

  public void setNamaPej(String namaPej);

  public String getNamaPej();

  public void setNipPej(String nipPej);

  public String getNipPej();

  public void setStatPndtng(String statPndtng);

  public String getStatPndtng();
}