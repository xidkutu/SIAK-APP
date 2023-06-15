package pendaftaran;

import java.math.*;

public class Saksi2Object4
    implements java.io.Serializable {

  String agama, dusun, telp, alamat, namaLgkp, tmptLhr, kwrngr;
  BigDecimal noRt, noRw, kodePos, jenisPkrjn, noKk, pddkh, statKwn; ;
  java.lang.String tglLhr;

  public Saksi2Object4() {
  }

  public Saksi2Object4(String namaLgkp, String agama,
                       BigDecimal jenisPkrjn, java.lang.String tglLhr,
                       String tmptLhr, String alamat,
                       String dusun, String telp, BigDecimal noRt,
                       BigDecimal noRw, BigDecimal kodePos,
                       BigDecimal noKk, BigDecimal pddkh, BigDecimal statKwn,
                       String kwrngr) {

    this.namaLgkp = namaLgkp;
    this.agama = agama;
    this.jenisPkrjn = jenisPkrjn;
    this.tglLhr = tglLhr;
    this.tmptLhr = tmptLhr;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.noKk = noKk;
    this.pddkh = pddkh;
    this.statKwn = statKwn;
    this.kwrngr = kwrngr;

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

  public void setTmptLhr(String tmptLhr) {
    this.tmptLhr = tmptLhr;
  }

  public String getTmptLhr() {
    return tmptLhr;
  }

  public void setAgama(String agama) {
    this.agama = agama;
  }

  public String getAgama() {
    return agama;
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

  public void setNoKk(BigDecimal noKk) {
    this.noKk = noKk;
  }

  public BigDecimal getNoKk() {
    return noKk;
  }

  public void setPddkh(BigDecimal pddkh) {
    this.pddkh = pddkh;
  }

  public BigDecimal getPddkh() {
    return pddkh;
  }

  public void setStatKwn(BigDecimal statKwn) {
    this.statKwn = statKwn;
  }

  public BigDecimal getStatKwn() {
    return statKwn;
  }

  public void setKwrngr(String kwrngr) {
    this.kwrngr = kwrngr;
  }

  public String getKwrngr() {
    return kwrngr;
  }

}
