package pendaftaran;

import java.io.*;
import java.math.*;

public class BioDataWnaObj
    implements Serializable {

  java.math.BigDecimal NIK, JENIS_KLMIN, JENIS_PKRJN, NO_KK, NO_PROP, NO_KAB,
      NO_KEC, NO_KEL, noRt, noRw, kodePos;
  java.sql.Date TGL_LHR;
  String NAMA_PERTMA, TMPT_LHR, alamat, dusun, telp;

  public BioDataWnaObj() {
  }

  public BioDataWnaObj(java.math.BigDecimal NIK,
                       java.math.BigDecimal JENIS_KLMIN,
                       java.math.BigDecimal JENIS_PKRJN,
                       java.math.BigDecimal NO_KK,
                       java.math.BigDecimal NO_PROP,
                       java.sql.Date TGL_LHR, String NAMA_PERTMA,
                       String TMPT_LHR, String alamat,
                       String dusun, String telp,
                       java.math.BigDecimal noRt,
                       java.math.BigDecimal noRw,
                       java.math.BigDecimal kodePos) {

    this.NIK = (NIK == null) ? new BigDecimal("0") : NIK;
    this.JENIS_KLMIN = JENIS_KLMIN;
    this.JENIS_PKRJN = JENIS_PKRJN;
    this.NO_KK = NO_KK;
    this.NO_PROP = NO_PROP;
    this.TGL_LHR = TGL_LHR;
    this.NAMA_PERTMA = (NAMA_PERTMA == null) ? "" : NAMA_PERTMA;
    this.TMPT_LHR = (TMPT_LHR == null) ? "" : TMPT_LHR;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
  }

  public java.math.BigDecimal getNik() {
    return (NIK);
  }

  public String getNamaPertma() {
    return (NAMA_PERTMA);
  }

  public java.math.BigDecimal getJnsKlm() {
    return (JENIS_KLMIN);
  }

  public String getTmpLhr() {
    return (TMPT_LHR);
  }

  public java.sql.Date getTglLhr() {
    return TGL_LHR;
  }

  public java.math.BigDecimal getJenisPkrjn() {
    return (JENIS_PKRJN);
  }

  public java.math.BigDecimal getNoKk() {
    return (NO_KK);
  }

  public java.math.BigDecimal getNoProp() {
    return (NO_PROP);
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

  public void setNik(BigDecimal NIK) {
    this.NIK = (NIK == null) ? new BigDecimal("0") : NIK;
  }

  public void setNamaPertma(String NAMA_PERTMA) {
    this.NAMA_PERTMA = (NAMA_PERTMA == null) ? "" : NAMA_PERTMA;
  }

  public void setJnsKlm(BigDecimal JENIS_KLMIN) {
    this.JENIS_KLMIN = (JENIS_KLMIN == null) ? new BigDecimal("0") :
        JENIS_KLMIN;
  }

  public void setTmpLhr(String TMPT_LHR) {
    this.TMPT_LHR = (TMPT_LHR == null) ? "" : TMPT_LHR;
  }

  public void setTglLhr(java.sql.Date TGL_LHR) {
    this.TGL_LHR = TGL_LHR;
  }

  public void setNoKk(BigDecimal NO_KK) {
    this.NO_KK = (NO_KK == null) ? new BigDecimal("0") : NO_KK;
  }

  public void setNoProp(BigDecimal NO_PROP) {
    this.NO_PROP = (NO_PROP == null) ? new BigDecimal("0") : NO_PROP;
  }
}