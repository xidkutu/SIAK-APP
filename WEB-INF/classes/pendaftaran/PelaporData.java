package pendaftaran;

public class PelaporData
    implements java.io.Serializable {
  private String nik, jenisKlmin, aktaLhr, golDrh, statKwn, aktaKwn, statHbkel,
      klainFsk,
      aktaCrai, pnydngCct, pddkAkh, jenisPkrjn, nikIbu, nikAyah, nipPetReg,
      nipPetEntri, noKk, jenisBntu, noProp, noKab, noKec, noKel, statHidup,
      statKtp, alsNumpang, noRt, noRw, kodePos;

  private String namaKep, alamat, noKtp, tmptSbl, noPaspor, namaLgkp, tmptLhr,
      noAktaLhr,
      agama, noAktaKwn, noAktaCrai, namaLgkpIbu, namaLgkpAyah,
      namaKetRt, namaKetRw, namaPetReg, namaPetEntri, dusun, telp;

  private String tglAkhPaspor, tglLhr, tglKwn, tglCrai, tglEntri,
      tglUbah, tglCetakKtp, tglGantiKtp, tglPjgKtp;

  public PelaporData() {
  }

//created by Yopie
  public PelaporData(String nik, String namaLgkp, String tglLhr,
                     String jenis_pkrjn, String alamat, String nort,
                     String norw,
                     String dusun, String kodepos, String telp,
                     String noProp, String noKab, String noKec, String noKel,
                     String agama, String tmptLhr) {
    this.nik = (nik.equals(null)) ? "" : nik;
    this.namaLgkp = namaLgkp;
    this.tglLhr = tglLhr;
    this.alamat = alamat;
    this.noRt = nort;
    this.noRw = norw;
    this.dusun = dusun;
    this.kodePos = kodepos;
    this.telp = telp;
    this.jenisPkrjn = jenis_pkrjn;
    this.noProp = noProp;
    this.noKab = noKab;
    this.noKec = noKec;
    this.noKel = noKel;

    this.agama = agama;
    this.tmptLhr = tmptLhr;
  }

//end created by Yopie

  public PelaporData(String nik, String namaLgkp, String tglLhr,
                     String jenis_pkrjn, String alamat, String nort,
                     String norw,
                     String dusun, String kodepos, String telp,
                     String noProp, String noKab, String noKec, String noKel) {
    this.nik = (nik.equals(null)) ? "" : nik;
    this.namaLgkp = namaLgkp;
    this.tglLhr = tglLhr;
    this.alamat = alamat;
    this.noRt = nort;
    this.noRw = norw;
    this.dusun = dusun;
    this.kodePos = kodepos;
    this.telp = telp;
    this.jenisPkrjn = jenis_pkrjn;
    this.noProp = noProp;
    this.noKab = noKab;
    this.noKec = noKec;
    this.noKel = noKel;
  }

  public PelaporData(String namaKep, String alamat,
                     String noRt, String noRw,
                     String dusun, String kodePos, String telp,
                     String nik, String noKtp,
                     String tmptSbl, String noPaspor,
                     String tglAkhPaspor, String namaLgkp,
                     String jenisKlmin, String tmptLhr,
                     String tglLhr, String aktaLhr,
                     String noAktaLhr, String golDrh,
                     String agama, String statKwn,
                     String aktaKwn, String noAktaKwn,
                     String tglKwn, String aktaCrai,
                     String noAktaCrai, String tglCrai,
                     String statHbkel, String
                     klainFsk, String pnydngCct,
                     String pddkAkh, String jenisPkrjn,
                     String nikIbu, String namaLgkpIbu,
                     String nikAyah, String namaLgkpAyah,
                     String namaKetRt, String namaKetRw,
                     String namaPetReg, String nipPetReg,
                     String namaPetEntri, String nipPetEntri,
                     String tglEntri, String noKk,
                     String jenisBntu, String noProp,
                     String noKab, String noKec,
                     String noKel, String statHidup,
                     String tglUbah, String tglCetakKtp,
                     String tglGantiKtp, String tglPjgKtp,
                     String statKtp, String alsNumpang) {

    this.namaKep = namaKep;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.nik = (nik.equals(null)) ? new String("0") : nik;
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

  public void setNik(String nik) {
    this.nik = nik;
  }

  public String getNik() {
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

  public void setTglAkhPaspor(String tglAkhPaspor) {
    this.tglAkhPaspor = tglAkhPaspor;
  }

  public String getTglAkhPaspor() {
    return tglAkhPaspor;
  }

  public void setNamaLgkp(String namaLgkp) {
    this.namaLgkp = namaLgkp;
  }

  public String getNamaLgkp() {
    return namaLgkp;
  }

  public void setJenisKlmin(String jenisKlmin) {
    this.jenisKlmin = jenisKlmin;
  }

  public String getJenisKlmin() {
    return jenisKlmin;
  }

  public void setTmptLhr(String tmptLhr) {
    this.tmptLhr = tmptLhr;
  }

  public String getTmptLhr() {
    return tmptLhr;
  }

  public void setTglLhr(String tglLhr) {
    this.tglLhr = tglLhr;
  }

  public String getTglLhr() {
    return tglLhr;
  }

  public void setAktaLhr(String aktaLhr) {
    this.aktaLhr = aktaLhr;
  }

  public String getAktaLhr() {
    return aktaLhr;
  }

  public void setNoAktaLhr(String noAktaLhr) {
    this.noAktaLhr = noAktaLhr;
  }

  public String getNoAktaLhr() {
    return noAktaLhr;
  }

  public void setGolDrh(String golDrh) {
    this.golDrh = golDrh;
  }

  public String getGolDrh() {
    return golDrh;
  }

  public void setAgama(String agama) {
    this.agama = agama;
  }

  public String getAgama() {
    return agama;
  }

  public void setStatKwn(String statKwn) {
    this.statKwn = statKwn;
  }

  public String getStatKwn() {
    return statKwn;
  }

  public void setAktaKwn(String aktaKwn) {
    this.aktaKwn = aktaKwn;
  }

  public String getAktaKwn() {
    return aktaKwn;
  }

  public void setNoAktaKwn(String noAktaKwn) {
    this.noAktaKwn = noAktaKwn;
  }

  public String getNoAktaKwn() {
    return noAktaKwn;
  }

  public void setTglKwn(String tglKwn) {
    this.tglKwn = tglKwn;
  }

  public String getTglKwn() {
    return tglKwn;
  }

  public void setAktaCrai(String aktaCrai) {
    this.aktaCrai = aktaCrai;
  }

  public String getAktaCrai() {
    return aktaCrai;
  }

  public void setNoAktaCrai(String noAktaCrai) {
    this.noAktaCrai = noAktaCrai;
  }

  public String getNoAktaCrai() {
    return noAktaCrai;
  }

  public void setTglCrai(String tglCrai) {
    this.tglCrai = tglCrai;
  }

  public String getTglCrai() {
    return tglCrai;
  }

  public void setStatHbkel(String statHbkel) {
    this.statHbkel = statHbkel;
  }

  public String getStatHbkel() {
    return statHbkel;
  }

  public void setKlainFsk(String klainFsk) {
    this.klainFsk = klainFsk;
  }

  public String getKlainFsk() {
    return klainFsk;
  }

  public void setPnydngCct(String pnydngCct) {
    this.pnydngCct = pnydngCct;
  }

  public String getPnydngCct() {
    return pnydngCct;
  }

  public void setPddkAkh(String pddkAkh) {
    this.pddkAkh = pddkAkh;
  }

  public String getPddkAkh() {
    return pddkAkh;
  }

  public void setJenisPkrjn(String jenisPkrjn) {
    this.jenisPkrjn = jenisPkrjn;
  }

  public String getJenisPkrjn() {
    return jenisPkrjn;
  }

  public void setNikIbu(String nikIbu) {
    this.nikIbu = nikIbu;
  }

  public String getNikIbu() {
    return nikIbu;
  }

  public void setNamaLgkpIbu(String namaLgkpIbu) {
    this.namaLgkpIbu = namaLgkpIbu;
  }

  public String getNamaLgkpIbu() {
    return namaLgkpIbu;
  }

  public void setNikAyah(String nikAyah) {
    this.nikAyah = nikAyah;
  }

  public String getNikAyah() {
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

  public void setNipPetReg(String nipPetReg) {
    this.nipPetReg = nipPetReg;
  }

  public String getNipPetReg() {
    return nipPetReg;
  }

  public void setNamaPetEntri(String namaPetEntri) {
    this.namaPetEntri = namaPetEntri;
  }

  public String getNamaPetEntri() {
    return namaPetEntri;
  }

  public void setNipPetEntri(String nipPetEntri) {
    this.nipPetEntri = nipPetEntri;
  }

  public String getNipPetEntri() {
    return nipPetEntri;
  }

  public void setTglEntri(String tglEntri) {
    this.tglEntri = tglEntri;
  }

  public String getTglEntri() {
    return tglEntri;
  }

  public void setNoKk(String noKk) {
    this.noKk = noKk;
  }

  public String getNoKk() {
    return noKk;
  }

  public void setJenisBntu(String jenisBntu) {
    this.jenisBntu = jenisBntu;
  }

  public String getJenisBntu() {
    return jenisBntu;
  }

  public void setNoProp(String noProp) {
    this.noProp = noProp;
  }

  public String getNoProp() {
    return noProp;
  }

  public void setNoKab(String noKab) {
    this.noKab = noKab;
  }

  public String getNoKab() {
    return noKab;
  }

  public void setNoKec(String noKec) {
    this.noKec = noKec;
  }

  public String getNoKec() {
    return noKec;
  }

  public void setNoKel(String noKel) {
    this.noKel = noKel;
  }

  public String getNoKel() {
    return noKel;
  }

  public void setStatHidup(String statHidup) {
    this.statHidup = statHidup;
  }

  public String getStatHidup() {
    return statHidup;
  }

  public void setTglUbah(String tglUbah) {
    this.tglUbah = tglUbah;
  }

  public String getTglUbah() {
    return tglUbah;
  }

  public void setTglCetakKtp(String tglCetakKtp) {
    this.tglCetakKtp = tglCetakKtp;
  }

  public String getTglCetakKtp() {
    return tglCetakKtp;
  }

  public void setTglGantiKtp(String tglGantiKtp) {
    this.tglGantiKtp = tglGantiKtp;
  }

  public String getTglGantiKtp() {
    return tglGantiKtp;
  }

  public void setTglPjgKtp(String tglPjgKtp) {
    this.tglPjgKtp = tglPjgKtp;
  }

  public String getTglPjgKtp() {
    return tglPjgKtp;
  }

  public void setStatKtp(String statKtp) {
    this.statKtp = statKtp;
  }

  public String getStatKtp() {
    return statKtp;
  }

  public void setAlsNumpang(String alsNumpang) {
    this.alsNumpang = alsNumpang;
  }

  public String getAlsNumpang() {
    return alsNumpang;
  }
}
