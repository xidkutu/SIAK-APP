package pendaftaran;

import java.math.*;
import java.rmi.*;

public class PenanValue
    implements java.io.Serializable {
  private BigDecimal nokec, nokab, noprop;
  private String jabatan, namapej, nippej, status;

  public PenanValue() {
  }

  public PenanValue(BigDecimal nokec, BigDecimal nokab, BigDecimal noprop,
                    String jabatan, String namapej, String status,
                    String nippej) throws RemoteException {
    this.nokec = nokec;
    this.nokab = nokab;
    this.noprop = noprop;
    this.jabatan = (jabatan == null) ? "" : jabatan;
    this.namapej = (namapej == null) ? "" : namapej;
    this.status = (status == null) ? "" : status;
    this.nippej = (nippej == null) ? "" : nippej;
  }

  public BigDecimal getNoKec() {
    return (nokec);
  }

  public BigDecimal getNoKab() {
    return nokab;
  }

  public BigDecimal getNoProp() {
    return noprop;
  }

  public String getJabatan() {
    System.out.println("Jabatan in get = " + jabatan);
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