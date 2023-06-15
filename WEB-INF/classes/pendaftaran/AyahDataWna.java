package pendaftaran;

import java.io.*;
import java.math.*;

public class AyahDataWna
    implements Serializable {

  java.math.BigDecimal NIK, JENIS_KLMIN, JENIS_PKRJN, NO_KK, NO_PROP, NO_KAB,
      NO_KEC, NO_KEL, noRt, noRw, kodePos;
  String TGL_LHR;
  String NAMA_PERTMA, TMPT_LHR, alamat, dusun, telp, agama;

  String nomor_prop, nomor_kab, nomor_kec, nomor_kel;

  public AyahDataWna() {
  }

//added by Yopie
  public AyahDataWna(java.math.BigDecimal NIK,
                     java.math.BigDecimal JENIS_KLMIN,
                     java.math.BigDecimal JENIS_PKRJN,
                     java.math.BigDecimal NO_KK,
                     String nomor_prop,
                     String nomor_kab,
                     String nomor_kec,
                     String nomor_kel,

                     java.lang.String TGL_LHR, String NAMA_PERTMA,
                     String TMPT_LHR, String alamat,
                     String dusun, String telp,
                     java.math.BigDecimal noRt,
                     java.math.BigDecimal noRw,
                     java.math.BigDecimal kodePos,
                     String agama) {

    this.NIK = (NIK == null) ? new BigDecimal("0") : NIK;
    this.JENIS_KLMIN = JENIS_KLMIN;
    this.JENIS_PKRJN = JENIS_PKRJN;
    this.NO_KK = NO_KK;

    this.nomor_prop = nomor_prop;
    this.nomor_kab = nomor_kab;
    this.nomor_kec = nomor_kec;
    this.nomor_kel = nomor_kel;

    this.TGL_LHR = TGL_LHR;
    this.NAMA_PERTMA = (NAMA_PERTMA == null) ? "" : NAMA_PERTMA;
    this.TMPT_LHR = (TMPT_LHR == null) ? "" : TMPT_LHR;
    this.alamat = (alamat == null) ? "" : alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.agama = agama;
  }

  public void setNomor_prop(String nomor_prop) {
    this.nomor_prop = nomor_prop;
  }

  public String getNomor_prop() {
    return nomor_prop;
  }

  public void setNomor_kab(String nomor_kab) {
    this.nomor_kab = nomor_kab;
  }

  public String getNomor_kab() {
    return nomor_kab;
  }

  public void setNomor_kec(String nomor_kec) {
    this.nomor_kec = nomor_kec;
  }

  public String getNomor_kec() {
    return nomor_kec;
  }

  public void setNomor_kel(String nomor_kel) {
    this.nomor_kel = nomor_kel;
  }

  public String getNomor_kel() {
    return nomor_kel;
  }

//end added by Yopie
  public AyahDataWna(java.math.BigDecimal NIK,
                     java.math.BigDecimal JENIS_KLMIN,
                     java.math.BigDecimal JENIS_PKRJN,
                     java.math.BigDecimal NO_KK,
                     java.math.BigDecimal NO_PROP,
                     java.math.BigDecimal NO_KAB,
                     java.math.BigDecimal NO_KEC,
                     java.math.BigDecimal NO_KEL,
                     java.lang.String TGL_LHR, String NAMA_PERTMA,
                     String TMPT_LHR, String alamat,
                     String dusun, String telp,
                     java.math.BigDecimal noRt,
                     java.math.BigDecimal noRw,
                     java.math.BigDecimal kodePos,
                     String agama) {

    this.NIK = (NIK == null) ? new BigDecimal("0") : NIK;
    this.JENIS_KLMIN = JENIS_KLMIN;
    this.JENIS_PKRJN = JENIS_PKRJN;
    this.NO_KK = NO_KK;
    this.NO_PROP = NO_PROP;
    this.NO_KAB = NO_KAB;
    this.NO_KEC = NO_KEC;
    this.NO_KEL = NO_KEL;
    this.TGL_LHR = TGL_LHR;
    this.NAMA_PERTMA = (NAMA_PERTMA == null) ? "" : NAMA_PERTMA;
    this.TMPT_LHR = (TMPT_LHR == null) ? "" : TMPT_LHR;
    this.alamat = (alamat == null) ? "" : alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.agama = agama;
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

  public java.lang.String getTglLhr() {
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

  public java.math.BigDecimal getNoKab() {
    return (NO_KAB);
  }

  public java.math.BigDecimal getNoKec() {
    return (NO_KEC);
  }

  public java.math.BigDecimal getNoKel() {
    return (NO_KEL);
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

  public void setTglLhr(java.lang.String TGL_LHR) {
    this.TGL_LHR = TGL_LHR;
  }

  public void setNoKk(BigDecimal NO_KK) {
    this.NO_KK = (NO_KK == null) ? new BigDecimal("0") : NO_KK;
  }

  public void setNoProp(BigDecimal NO_PROP) {
    this.NO_PROP = (NO_PROP == null) ? new BigDecimal("0") : NO_PROP;
  }

  public void setNoKab(BigDecimal NO_KAB) {
    this.NO_KAB = (NO_KAB == null) ? new BigDecimal("0") : NO_KAB;
  }

  public void setNoKec(BigDecimal NO_KEC) {
    this.NO_KEC = (NO_KEC == null) ? new BigDecimal("0") : NO_KEC;
  }

  public void setNoKel(BigDecimal NO_KEL) {
    this.NO_KEL = (NO_KEL == null) ? new BigDecimal("0") : NO_KEL;
  }

  public void setAgama(String agama) {
    this.agama = agama;
  }

  public String getAgama() {
    return agama;
  }

}
