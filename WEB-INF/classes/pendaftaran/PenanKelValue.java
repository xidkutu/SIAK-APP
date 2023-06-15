package pendaftaran;

import java.math.*;
import java.rmi.*;

public class PenanKelValue
    implements java.io.Serializable {
  private BigDecimal nokel, nokec, nokab, noprop;
  private String jabatan, namalur, niplur;

  public PenanKelValue() {
  }

  public PenanKelValue(BigDecimal nokel, BigDecimal nokec, BigDecimal nokab,
                       BigDecimal noprop, String jabatan, String namalur,
                       String niplur) throws RemoteException {
    this.nokel = nokel;
    this.nokec = nokec;
    this.nokab = nokab;
    this.noprop = noprop;
    this.jabatan = (jabatan == null) ? "" : jabatan;
    this.namalur = (namalur == null) ? "" : namalur;
    this.niplur = (niplur == null) ? "" : niplur;

  }

  public PenanKelValue(BigDecimal nokel, String jabatan, String namalur,
                       String niplur) throws RemoteException {
    this.nokel = nokel;
    this.jabatan = (jabatan == null) ? "" : jabatan;
    this.namalur = (namalur == null) ? "" : namalur;
    this.niplur = (niplur == null) ? "" : niplur;
  }

  public BigDecimal getNoKel() {
    return nokel;
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
    System.out.println("Jabatan in Kel = " + jabatan);
    return jabatan;
  }

  public String getNamaLur() {
    return namalur;
  }

  public String getNipLur() {
    return niplur;
  }

  public void setNamaLur(String namalur) {
    this.namalur = namalur;
  }

  public void setJabatan(String jabatan) {
    this.jabatan = jabatan;
  }

  public void setNipLur(String niplur) {
    this.niplur = niplur;
  }
}
