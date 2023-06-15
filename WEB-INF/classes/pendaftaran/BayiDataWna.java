package pendaftaran;

import java.io.*;

public class BayiDataWna
    implements Serializable {

  String NIK, JENIS_KLMIN, JENIS_PKRJN, NO_KK, NO_PROP, NO_KAB,
      NO_KEC, NO_KEL, noRt, noRw, kodePos, pddkAkh;
  String TGL_LHR;
  String NAMA_PERTMA, TMPT_LHR, alamat, dusun, telp, kwrngrn, agama;
  String kebangsaan = "";
  String stat_kwn = "";
  public BayiDataWna() {
  }

  public BayiDataWna(String NIK, String NAMA_PERTMA,
                     String JENIS_KLMIN, String TMPT_LHR,
                     String TGL_LHR, String NO_PROP, String NO_KAB,
                     String NO_KEC,
                     String NO_KEL)

  {
    this.NIK = (NIK == null) ? "" : NIK;
    this.NAMA_PERTMA = (NAMA_PERTMA == null) ? "" : NAMA_PERTMA;
    this.JENIS_KLMIN = (JENIS_KLMIN == null) ? "" : JENIS_KLMIN;
    this.TMPT_LHR = (TMPT_LHR == null) ? "" : TMPT_LHR;
    this.TGL_LHR = (TGL_LHR == null) ? "" : TGL_LHR;
    this.NO_PROP = (NO_PROP == null) ? "" : NO_PROP;
    this.NO_KAB = (NO_KAB == null) ? "" : NO_KAB;
    this.NO_KEC = (NO_KEC == null) ? "" : NO_KEC;
    this.NO_KEL = (NO_KEL == null) ? "" : NO_KEL;
  }

  public BayiDataWna(String nik, String nama_pertma,
                     String alamat,
                     String noRt,
                     String noRw,
                     String dusun,
                     String kodePos,
                     String telp,
                     String JENIS_KLMIN,
                     String TGL_LHR,
                     String TMPT_LHR,
                     String JENIS_PKRJN,
                     String kwrngra,
                     String kebangsaan,
                     String NO_PROP,
                     String NO_KAB,
                     String NO_KEC,
                     String NO_KEL) {
    this.NIK = nik;
    this.NAMA_PERTMA = nama_pertma;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = ( (noRw != null) && (! (noRw.trim().equals("0")))) ? noRw : "";
    this.dusun = ( (dusun != null) && (! (dusun.trim().equals("0")))) ? dusun :
        "";
    this.kodePos = ( (kodePos != null) && (! (kodePos.trim().equals("0")))) ?
        kodePos : "";
    this.telp = ( (telp != null) && (! (telp.trim().equals("0")))) ? telp : "";
    this.JENIS_KLMIN = JENIS_KLMIN;
    this.TGL_LHR = TGL_LHR;
    this.TMPT_LHR = TMPT_LHR;
    this.JENIS_PKRJN = JENIS_PKRJN;
    this.kwrngrn = kwrngra;
    this.kebangsaan = ( (kebangsaan != null) &&
                       (! (kebangsaan.trim().equals("0")))) ? kebangsaan : "";
    this.NO_PROP = NO_PROP;
    this.NO_KAB = NO_KAB;
    this.NO_KEC = NO_KEC;
    this.NO_KEL = NO_KEL;
  }

  public BayiDataWna(String NIK,
                     String JENIS_KLMIN,
                     String JENIS_PKRJN,
                     String NO_KK,
                     String NO_PROP,
                     String NO_KAB,
                     String NO_KEC,
                     String NO_KEL,
                     String TGL_LHR, String NAMA_PERTMA,
                     String TMPT_LHR, String alamat,
                     String dusun, String telp,
                     String noRt,
                     String noRw,
                     String kodePos, String kwrngrn,
                     String pddkAkh,
                     String agama) {

    this.NIK = (NIK == null) ? new String("0") : NIK;
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
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.kwrngrn = kwrngrn;
    this.pddkAkh = pddkAkh;
    this.agama = agama;
  }

  public BayiDataWna(String NIK,
                     String JENIS_KLMIN,
                     String JENIS_PKRJN,
                     String NO_KK,
                     String NO_PROP,
                     String NO_KAB,
                     String NO_KEC,
                     String NO_KEL,
                     String TGL_LHR, String NAMA_PERTMA,
                     String TMPT_LHR, String alamat,
                     String dusun, String telp,
                     String noRt,
                     String noRw,
                     String kodePos, String kwrngrn,
                     String pddkAkh,
                     String agama, String stat_kwn) {

    this.NIK = (NIK == null) ? new String("0") : NIK;
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
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.kwrngrn = kwrngrn;
    this.pddkAkh = pddkAkh;
    this.agama = agama;
    this.stat_kwn = stat_kwn;
  }

  public void setKwrngrn(String kwrngrn) {
    this.kwrngrn = kwrngrn;
  }

  public String getKwrngrn() {
    return kwrngrn;
  }

  public String getStatKwn() {
    return stat_kwn;
  }

  public void setStatKwn() {
    this.stat_kwn = stat_kwn;
  }

  public String getNik() {
    return (NIK);
  }

  public String getNamaPertma() {
    return (NAMA_PERTMA);
  }

  public String getJnsKlm() {
    return (JENIS_KLMIN);
  }

  public String getTmpLhr() {
    return (TMPT_LHR);
  }

  public String getTglLhr() {
    return TGL_LHR;
  }

  public String getJenisPkrjn() {
    return (JENIS_PKRJN);
  }

  public String getNoKk() {
    return (NO_KK);
  }

  public String getNoProp() {
    return (NO_PROP);
  }

  public String getNoKab() {
    return (NO_KAB);
  }

  public String getNoKec() {
    return (NO_KEC);
  }

  public String getNoKel() {
    return (NO_KEL);
  }

  public void setAlamat(String alamat) {
    this.alamat = alamat;
  }

  public String getAlamat() {
    return alamat;
  }

  public void setNoRt(String noRt) {
    this.noRt = noRt;
  }

  public String getNoRt() {
    return noRt;
  }

  public void setNoRw(String noRw) {
    this.noRw = noRw;
  }

  public String getNoRw() {
    return noRw;
  }

  public void setDusun(String dusun) {
    this.dusun = dusun;
  }

  public String getDusun() {
    return dusun;
  }

  public void setKodePos(String kodePos) {
    this.kodePos = kodePos;
  }

  public String getKodePos() {
    return kodePos;
  }

  public void setTelp(String telp) {
    this.telp = telp;
  }

  public String getTelp() {
    return telp;
  }

  public void setNik(String NIK) {
    this.NIK = (NIK == null) ? new String("0") : NIK;
  }

  public void setNamaPertma(String NAMA_PERTMA) {
    this.NAMA_PERTMA = (NAMA_PERTMA == null) ? "" : NAMA_PERTMA;
  }

  public void setJnsKlm(String JENIS_KLMIN) {
    this.JENIS_KLMIN = (JENIS_KLMIN == null) ? new String("0") : JENIS_KLMIN;
  }

  public void setTmpLhr(String TMPT_LHR) {
    this.TMPT_LHR = (TMPT_LHR == null) ? "" : TMPT_LHR;
  }

  public void setTglLhr(String TGL_LHR) {
    this.TGL_LHR = TGL_LHR;
  }

  public void setNoKk(String NO_KK) {
    this.NO_KK = (NO_KK == null) ? new String("0") : NO_KK;
  }

  public void setNoProp(String NO_PROP) {
    this.NO_PROP = (NO_PROP == null) ? new String("0") : NO_PROP;
  }

  public void setNoKab(String NO_KAB) {
    this.NO_KAB = (NO_KAB == null) ? new String("0") : NO_KAB;
  }

  public void setNoKec(String NO_KEC) {
    this.NO_KEC = (NO_KEC == null) ? new String("0") : NO_KEC;
  }

  public void setNoKel(String NO_KEL) {
    this.NO_KEL = (NO_KEL == null) ? new String("0") : NO_KEL;
  }

  public void setPddkAkh(String pddkAkh) {
    this.pddkAkh = pddkAkh;
  }

  public String getPddkAkh() {
    return pddkAkh;
  }

  public void setAgama(String agama) {
    this.agama = agama;
  }

  public String getAgama() {
    return agama;
  }

  public void setKebangsaan(String kebangsaan) {
    this.kebangsaan = kebangsaan;
  }

  public String getKebangsaan() {
    return kebangsaan;
  }

}
