package pendaftaran;

import java.math.*;
import java.rmi.*;

public class PenanKabValue
    implements java.io.Serializable {
  private BigDecimal nokab, noprop;
  private String jabatan, namapej, nippej, status;

  public PenanKabValue() {
  }

  public PenanKabValue(BigDecimal nokab, BigDecimal noprop, String jabatan,
                       String namapej, String nippej, String status) throws
      RemoteException {
    this.nokab = nokab;
    this.noprop = noprop;
    this.jabatan = (jabatan == null) ? "" : jabatan;
    this.namapej = (namapej == null) ? "" : namapej;
    this.nippej = (nippej == null) ? "" : nippej;
    this.status = (status == null) ? "" : status;

  }

  public BigDecimal getNoKab() {
    return nokab;
  }

  public BigDecimal getNoProp() {
    return noprop;
  }

  public String getJabatan() {
    System.out.println("Jabatan in get Kab = " + jabatan);
    return jabatan;
  }

  public String getNamaPej() {
    return namapej;
  }

  public String getStatPndtng() {
    return status;
  }

  public String getNipPej() {
    return nippej;
  }

  public void setJabatan(String jabatan) {
    this.jabatan = jabatan;
    System.out.println("Jabatan = " + jabatan);
  }

  public void setNamaPej(String namaPej) {
    this.namapej = namaPej;
  }

  public void setStatPndtng(String statPndtng) {
    this.status = statPndtng;
  }

  public void setNipPej(String nipPej) {
    this.nippej = nipPej;
  }
}
