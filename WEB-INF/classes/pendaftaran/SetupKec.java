package pendaftaran;

import java.math.*;

public interface SetupKec
    extends javax.ejb.EJBLocalObject {
  public BigDecimal getNoKec();

  public void setNamaKec(String namaKec);

  public String getNamaKec();

  public BigDecimal getNoKab();

  public BigDecimal getNoProp();

  public void setJabatan(String jabatan);

  public String getJabatan();

  public void setNamaPej(String namaPej);

  public String getNamaPej();

  public void setStatPndtng(String statPndtng);

  public String getStatPndtng();

  public void setNipPej(String nipPej);

  public String getNipPej();
}