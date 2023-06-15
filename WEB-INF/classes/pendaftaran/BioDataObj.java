package pendaftaran;

import java.math.*;

public class BioDataObj
    implements java.io.Serializable {

// Variable Declaration

  private BigDecimal nik, jenisKlmin, aktaLhr, golDrh, statKwn, aktaKwn,
      statHbkel, klainFsk,
      aktaCrai, pnydngCct, pddkAkh, jenisPkrjn, nikIbu, nikAyah, nipPetReg,
      nipPetEntri, noKk, jenisBntu, noProp, noKab, noKec, noKel, statHidup,
      statKtp, alsNumpang, noRt, noRw, kodePos;

  private String namaKep, alamat, noKtp, tmptSbl, noPaspor, namaLgkp, tmptLhr,
      noAktaLhr,
      agama, noAktaKwn, noAktaCrai, namaLgkpIbu, namaLgkpAyah,
      namaKetRt, namaKetRw, namaPetReg, namaPetEntri, dusun, telp;

  private String tglAkhPaspor, tglLhr, tglKwn, tglCrai, tglEntri,
      tglUbah, tglCetakKtp, tglGantiKtp, tglPjgKtp;
  private String cflag = "";

  // Constructor Declaration

  public BioDataObj() {}

  // Constructor Overloading

  public BioDataObj(java.lang.String namaKep, java.lang.String alamat,
                    java.math.BigDecimal noRt, java.math.BigDecimal noRw,
                    java.lang.String dusun, java.math.BigDecimal kodePos,
                    java.lang.String telp,
                    java.math.BigDecimal nik, java.lang.String noKtp,
                    java.lang.String tmptSbl, java.lang.String noPaspor,
                    java.lang.String tglAkhPaspor, java.lang.String namaLgkp,
                    java.math.BigDecimal jenisKlmin, java.lang.String tmptLhr,
                    java.lang.String tglLhr, java.math.BigDecimal aktaLhr,
                    java.lang.String noAktaLhr, java.math.BigDecimal golDrh,
                    java.lang.String agama, java.math.BigDecimal statKwn,
                    java.math.BigDecimal aktaKwn, java.lang.String noAktaKwn,
                    java.lang.String tglKwn, java.math.BigDecimal aktaCrai,
                    java.lang.String noAktaCrai, java.lang.String tglCrai,
                    java.math.BigDecimal statHbkel, java.math.BigDecimal
                    klainFsk, java.math.BigDecimal pnydngCct,
                    java.math.BigDecimal pddkAkh,
                    java.math.BigDecimal jenisPkrjn,
                    java.math.BigDecimal nikIbu, java.lang.String namaLgkpIbu,
                    java.math.BigDecimal nikAyah, java.lang.String namaLgkpAyah,
                    java.lang.String namaKetRt, java.lang.String namaKetRw,
                    java.lang.String namaPetReg, java.math.BigDecimal nipPetReg,
                    java.lang.String namaPetEntri,
                    java.math.BigDecimal nipPetEntri,
                    java.lang.String tglEntri, java.math.BigDecimal noKk,
                    java.math.BigDecimal jenisBntu, java.math.BigDecimal noProp,
                    java.math.BigDecimal noKab, java.math.BigDecimal noKec,
                    java.math.BigDecimal noKel, java.math.BigDecimal statHidup,
                    java.lang.String tglUbah, java.lang.String tglCetakKtp,
                    java.lang.String tglGantiKtp, java.lang.String tglPjgKtp,
                    java.math.BigDecimal statKtp,
                    java.math.BigDecimal alsNumpang) {

    this.namaKep = namaKep;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.nik = (nik.equals(null)) ? new BigDecimal("0") : nik;
    this.noKtp = noKtp;
    this.tmptSbl = tmptSbl;
    this.noPaspor = noPaspor;
    this.tglAkhPaspor = tglAkhPaspor;
    this.namaLgkp = namaLgkp;
    this.jenisKlmin = jenisKlmin;
    this.tmptLhr = tmptLhr;
    this.tglLhr = tglLhr;
    this.aktaLhr = aktaLhr;
    this.noAktaLhr = noAktaLhr;
    this.golDrh = golDrh;
    this.agama = agama;
    this.statKwn = statKwn;
    this.aktaKwn = aktaKwn;
    this.noAktaKwn = noAktaKwn;
    this.tglKwn = tglKwn;
    this.aktaCrai = aktaCrai;
    this.noAktaCrai = noAktaCrai;
    this.tglCrai = tglCrai;
    this.statHbkel = statHbkel;
    this.klainFsk = klainFsk;
    this.pnydngCct = pnydngCct;
    this.pddkAkh = pddkAkh;
    this.jenisPkrjn = jenisPkrjn;
    this.nikIbu = nikIbu;
    this.namaLgkpIbu = namaLgkpIbu;
    this.nikAyah = nikAyah;
    this.namaLgkpAyah = namaLgkpAyah;
    this.namaKetRt = namaKetRt;
    this.namaKetRw = namaKetRw;
    this.namaPetReg = namaPetReg;
    this.nipPetReg = nipPetReg;
    this.namaPetEntri = namaPetEntri;
    this.nipPetEntri = nipPetEntri;
    this.tglEntri = tglEntri;
    this.noKk = noKk;
    this.jenisBntu = jenisBntu;
    this.noProp = noProp;
    this.noKab = noKab;
    this.noKec = noKec;
    this.noKel = noKel;
    this.statHidup = statHidup;
    this.tglUbah = tglUbah;
    this.tglCetakKtp = tglCetakKtp;
    this.tglGantiKtp = tglGantiKtp;
    this.tglPjgKtp = tglPjgKtp;
    this.statKtp = statKtp;
    this.alsNumpang = alsNumpang;
  }

  public BioDataObj(java.lang.String namaKep, java.lang.String alamat,
                    java.math.BigDecimal noRt, java.math.BigDecimal noRw,
                    java.lang.String dusun, java.math.BigDecimal kodePos,
                    java.lang.String telp,
                    java.math.BigDecimal nik, java.lang.String noKtp,
                    java.lang.String tmptSbl, java.lang.String noPaspor,
                    java.lang.String tglAkhPaspor, java.lang.String namaLgkp,
                    java.math.BigDecimal jenisKlmin, java.lang.String tmptLhr,
                    java.lang.String tglLhr, java.math.BigDecimal aktaLhr,
                    java.lang.String noAktaLhr, java.math.BigDecimal golDrh,
                    java.lang.String agama, java.math.BigDecimal statKwn,
                    java.math.BigDecimal aktaKwn, java.lang.String noAktaKwn,
                    java.lang.String tglKwn, java.math.BigDecimal aktaCrai,
                    java.lang.String noAktaCrai, java.lang.String tglCrai,
                    java.math.BigDecimal statHbkel, java.math.BigDecimal
                    klainFsk, java.math.BigDecimal pnydngCct,
                    java.math.BigDecimal pddkAkh,
                    java.math.BigDecimal jenisPkrjn,
                    java.math.BigDecimal nikIbu, java.lang.String namaLgkpIbu,
                    java.math.BigDecimal nikAyah, java.lang.String namaLgkpAyah,
                    java.lang.String namaKetRt, java.lang.String namaKetRw,
                    java.lang.String namaPetReg, java.math.BigDecimal nipPetReg,
                    java.lang.String namaPetEntri,
                    java.math.BigDecimal nipPetEntri,
                    java.lang.String tglEntri, java.math.BigDecimal noKk,
                    java.math.BigDecimal jenisBntu, java.math.BigDecimal noProp,
                    java.math.BigDecimal noKab, java.math.BigDecimal noKec,
                    java.math.BigDecimal noKel, java.math.BigDecimal statHidup,
                    java.lang.String tglUbah, java.lang.String tglCetakKtp,
                    java.lang.String tglGantiKtp, java.lang.String tglPjgKtp,
                    java.math.BigDecimal statKtp,
                    java.math.BigDecimal alsNumpang, String cflag) {

    this.namaKep = namaKep;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.nik = (nik.equals(null)) ? new BigDecimal("0") : nik;
    this.noKtp = noKtp;
    this.tmptSbl = tmptSbl;
    this.noPaspor = noPaspor;
    this.tglAkhPaspor = tglAkhPaspor;
    this.namaLgkp = namaLgkp;
    this.jenisKlmin = jenisKlmin;
    this.tmptLhr = tmptLhr;
    this.tglLhr = tglLhr;
    this.aktaLhr = aktaLhr;
    this.noAktaLhr = noAktaLhr;
    this.golDrh = golDrh;
    this.agama = agama;
    this.statKwn = statKwn;
    this.aktaKwn = aktaKwn;
    this.noAktaKwn = noAktaKwn;
    this.tglKwn = tglKwn;
    this.aktaCrai = aktaCrai;
    this.noAktaCrai = noAktaCrai;
    this.tglCrai = tglCrai;
    this.statHbkel = statHbkel;
    this.klainFsk = klainFsk;
    this.pnydngCct = pnydngCct;
    this.pddkAkh = pddkAkh;
    this.jenisPkrjn = jenisPkrjn;
    this.nikIbu = nikIbu;
    this.namaLgkpIbu = namaLgkpIbu;
    this.nikAyah = nikAyah;
    this.namaLgkpAyah = namaLgkpAyah;
    this.namaKetRt = namaKetRt;
    this.namaKetRw = namaKetRw;
    this.namaPetReg = namaPetReg;
    this.nipPetReg = nipPetReg;
    this.namaPetEntri = namaPetEntri;
    this.nipPetEntri = nipPetEntri;
    this.tglEntri = tglEntri;
    this.noKk = noKk;
    this.jenisBntu = jenisBntu;
    this.noProp = noProp;
    this.noKab = noKab;
    this.noKec = noKec;
    this.noKel = noKel;
    this.statHidup = statHidup;
    this.tglUbah = tglUbah;
    this.tglCetakKtp = tglCetakKtp;
    this.tglGantiKtp = tglGantiKtp;
    this.tglPjgKtp = tglPjgKtp;
    this.statKtp = statKtp;
    this.alsNumpang = alsNumpang;
    this.cflag = cflag;
  }

  public void setNamaKep(String namaKep) {
    this.namaKep = namaKep;
  }

  public String getNamaKep() {
    return namaKep;
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

  public void setNik(BigDecimal nik) {
    this.nik = nik;
  }

  public BigDecimal getNik() {
    return nik;
  }

  public void setNoKtp(String noKtp) {
    this.noKtp = noKtp;
  }

  public String getNoKtp() {
    return noKtp;
  }

  public void setTmptSbl(String tmptSbl) {
    this.tmptSbl = tmptSbl;
  }

  public String getTmptSbl() {
    return tmptSbl;
  }

  public void setNoPaspor(String noPaspor) {
    this.noPaspor = noPaspor;
  }

  public String getNoPaspor() {
    return noPaspor;
  }

  public void setTglAkhPaspor(java.lang.String tglAkhPaspor) {
    this.tglAkhPaspor = tglAkhPaspor;
  }

  public java.lang.String getTglAkhPaspor() {
    return DayFormatter.formatDate(tglAkhPaspor);
  }

  public void setNamaLgkp(String namaLgkp) {
    this.namaLgkp = namaLgkp;
  }

  public String getNamaLgkp() {
    return namaLgkp;
  }

  public void setJenisKlmin(BigDecimal jenisKlmin) {
    this.jenisKlmin = jenisKlmin;
  }

  public BigDecimal getJenisKlmin() {
    return jenisKlmin;
  }

  public void setTmptLhr(String tmptLhr) {
    this.tmptLhr = tmptLhr;
  }

  public String getTmptLhr() {
    return tmptLhr;
  }

  public void setTglLhr(java.lang.String tglLhr) {
    this.tglLhr = tglLhr;
  }

  public java.lang.String getTglLhr() {
    return DayFormatter.formatDate(tglLhr);
  }

  public void setAktaLhr(BigDecimal aktaLhr) {
    this.aktaLhr = aktaLhr;
  }

  public BigDecimal getAktaLhr() {
    return aktaLhr;
  }

  public void setNoAktaLhr(String noAktaLhr) {
    this.noAktaLhr = noAktaLhr;
  }

  public String getNoAktaLhr() {
    return noAktaLhr;
  }

  public void setGolDrh(BigDecimal golDrh) {
    this.golDrh = golDrh;
  }

  public BigDecimal getGolDrh() {
    return golDrh;
  }

  public void setAgama(String agama) {
    this.agama = agama;
  }

  public String getAgama() {
    return agama;
  }

  public void setStatKwn(BigDecimal statKwn) {
    this.statKwn = statKwn;
  }

  public BigDecimal getStatKwn() {
    return statKwn;
  }

  public void setAktaKwn(BigDecimal aktaKwn) {
    this.aktaKwn = aktaKwn;
  }

  public BigDecimal getAktaKwn() {
    return aktaKwn;
  }

  public void setNoAktaKwn(String noAktaKwn) {
    this.noAktaKwn = noAktaKwn;
  }

  public String getNoAktaKwn() {
    return noAktaKwn;
  }

  public void setTglKwn(java.lang.String tglKwn) {
    this.tglKwn = tglKwn;
  }

  public java.lang.String getTglKwn() {
    return DayFormatter.formatDate(tglKwn);
  }

  public void setAktaCrai(BigDecimal aktaCrai) {
    this.aktaCrai = aktaCrai;
  }

  public BigDecimal getAktaCrai() {
    return aktaCrai;
  }

  public void setNoAktaCrai(String noAktaCrai) {
    this.noAktaCrai = noAktaCrai;
  }

  public String getNoAktaCrai() {
    return noAktaCrai;
  }

  public void setTglCrai(java.lang.String tglCrai) {
    this.tglCrai = tglCrai;
  }

  public java.lang.String getTglCrai() {
    return DayFormatter.formatDate(tglCrai);
  }

  public void setStatHbkel(BigDecimal statHbkel) {
    this.statHbkel = statHbkel;
  }

  public BigDecimal getStatHbkel() {
    return statHbkel;
  }

  public void setKlainFsk(BigDecimal klainFsk) {
    this.klainFsk = klainFsk;
  }

  public BigDecimal getKlainFsk() {
    return klainFsk;
  }

  public void setPnydngCct(BigDecimal pnydngCct) {
    this.pnydngCct = pnydngCct;
  }

  public BigDecimal getPnydngCct() {
    return pnydngCct;
  }

  public void setPddkAkh(BigDecimal pddkAkh) {
    this.pddkAkh = pddkAkh;
  }

  public BigDecimal getPddkAkh() {
    return pddkAkh;
  }

  public void setJenisPkrjn(BigDecimal jenisPkrjn) {
    this.jenisPkrjn = jenisPkrjn;
  }

  public BigDecimal getJenisPkrjn() {
    return jenisPkrjn;
  }

  public void setNikIbu(BigDecimal nikIbu) {
    this.nikIbu = nikIbu;
  }

  public BigDecimal getNikIbu() {
    return nikIbu;
  }

  public void setNamaLgkpIbu(String namaLgkpIbu) {
    this.namaLgkpIbu = namaLgkpIbu;
  }

  public String getNamaLgkpIbu() {
    return namaLgkpIbu;
  }

  public void setNikAyah(BigDecimal nikAyah) {
    this.nikAyah = nikAyah;
  }

  public BigDecimal getNikAyah() {
    return nikAyah;
  }

  public void setNamaLgkpAyah(String namaLgkpAyah) {
    this.namaLgkpAyah = namaLgkpAyah;
  }

  public String getNamaLgkpAyah() {
    return namaLgkpAyah;
  }

  public void setNamaKetRt(String namaKetRt) {
    this.namaKetRt = namaKetRt;
  }

  public String getNamaKetRt() {
    return namaKetRt;
  }

  public void setNamaKetRw(String namaKetRw) {
    this.namaKetRw = namaKetRw;
  }

  public String getNamaKetRw() {
    return namaKetRw;
  }

  public void setNamaPetReg(String namaPetReg) {
    this.namaPetReg = namaPetReg;
  }

  public String getNamaPetReg() {
    return namaPetReg;
  }

  public void setNipPetReg(BigDecimal nipPetReg) {
    this.nipPetReg = nipPetReg;
  }

  public BigDecimal getNipPetReg() {
    return nipPetReg;
  }

  public void setNamaPetEntri(String namaPetEntri) {
    this.namaPetEntri = namaPetEntri;
  }

  public String getNamaPetEntri() {
    return namaPetEntri;
  }

  public void setNipPetEntri(BigDecimal nipPetEntri) {
    this.nipPetEntri = nipPetEntri;
  }

  public BigDecimal getNipPetEntri() {
    return nipPetEntri;
  }

  public void setTglEntri(java.lang.String tglEntri) {
    this.tglEntri = tglEntri;
  }

  public java.lang.String getTglEntri() {
    return DayFormatter.formatDate(tglEntri);
  }

  public void setNoKk(BigDecimal noKk) {
    this.noKk = noKk;
  }

  public BigDecimal getNoKk() {
    return noKk;
  }

  public void setJenisBntu(BigDecimal jenisBntu) {
    this.jenisBntu = jenisBntu;
  }

  public BigDecimal getJenisBntu() {
    return jenisBntu;
  }

  public void setNoProp(BigDecimal noProp) {
    this.noProp = noProp;
  }

  public BigDecimal getNoProp() {
    return noProp;
  }

  public void setNoKab(BigDecimal noKab) {
    this.noKab = noKab;
  }

  public BigDecimal getNoKab() {
    return noKab;
  }

  public void setNoKec(BigDecimal noKec) {
    this.noKec = noKec;
  }

  public BigDecimal getNoKec() {
    return noKec;
  }

  public void setNoKel(BigDecimal noKel) {
    this.noKel = noKel;
  }

  public BigDecimal getNoKel() {
    return noKel;
  }

  public void setStatHidup(BigDecimal statHidup) {
    this.statHidup = statHidup;
  }

  public BigDecimal getStatHidup() {
    return statHidup;
  }

  public void setTglUbah(java.lang.String tglUbah) {
    this.tglUbah = tglUbah;
  }

  public java.lang.String getTglUbah() {
    return DayFormatter.formatDate(tglUbah);
  }

  public void setTglCetakKtp(java.lang.String tglCetakKtp) {
    this.tglCetakKtp = tglCetakKtp;
  }

  public java.lang.String getTglCetakKtp() {
    return DayFormatter.formatDate(tglCetakKtp);
  }

  public void setTglGantiKtp(java.lang.String tglGantiKtp) {
    this.tglGantiKtp = tglGantiKtp;
  }

  public java.lang.String getTglGantiKtp() {
    return DayFormatter.formatDate(tglGantiKtp);
  }

  public void setTglPjgKtp(java.lang.String tglPjgKtp) {
    this.tglPjgKtp = tglPjgKtp;
  }

  public java.lang.String getTglPjgKtp() {
    return DayFormatter.formatDate(tglPjgKtp);
  }

  public void setStatKtp(BigDecimal statKtp) {
    this.statKtp = statKtp;
  }

  public BigDecimal getStatKtp() {
    return statKtp;
  }

  public void setAlsNumpang(BigDecimal alsNumpang) {
    this.alsNumpang = alsNumpang;
  }

  public BigDecimal getAlsNumpang() {
    return alsNumpang;
  }

  public void setCFlag(String cflag) {
    this.cflag = cflag;
  }

  public String getCFlag() {
    return cflag;
  }
}