package pendaftaran;

import java.math.*;

public class PelaporNikMatiData
    implements java.io.Serializable {

  String dusun, telp, alamat, namaLgkp;
  BigDecimal noRt, noRw, kodePos, jenisPkrjn;
  java.lang.String tglLhr;

  public PelaporNikMatiData() {
  }

  public PelaporNikMatiData(String namaLgkp,
                            BigDecimal jenisPkrjn, java.lang.String tglLhr,
                            String alamat, String dusun,
                            String telp, BigDecimal noRt,
                            BigDecimal noRw, BigDecimal kodePos) {

    this.namaLgkp = namaLgkp;
    this.jenisPkrjn = jenisPkrjn;
    this.tglLhr = tglLhr;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
  }

  public void setNamaLgkp(String namaLgkp) {
    this.namaLgkp = namaLgkp;
  }

  public String getNamaLgkp() {
    return namaLgkp;
  }

  public void setTglLhr(java.lang.String tglLhr) {
    this.tglLhr = tglLhr;
  }

  public java.lang.String getTglLhr() {
    return tglLhr;
  }

  public void setJenisPkrjn(BigDecimal jenisPkrjn) {
    this.jenisPkrjn = jenisPkrjn;
  }

  public BigDecimal getJenisPkrjn() {
    return jenisPkrjn;
  }

  public void setAlamat(String alamat) {
    this.alamat = alamat;
  }

  public String getAlamat() {
    return alamat;
  }

  public void setNoRt(BigDecimal noRt) {
    this.noRt = noRt;
  }

  public BigDecimal getNoRt() {
    return noRt;
  }

  public void setNoRw(BigDecimal noRw) {
    this.noRw = noRw;
  }

  public BigDecimal getNoRw() {
    return noRw;
  }

  public void setDusun(String dusun) {
    this.dusun = dusun;
  }

  public String getDusun() {
    return dusun;
  }

  public void setKodePos(BigDecimal kodePos) {
    this.kodePos = kodePos;
  }

  public BigDecimal getKodePos() {
    return kodePos;
  }

  public void setTelp(String telp) {
    this.telp = telp;
  }

  public String getTelp() {
    return telp;
  }
}
