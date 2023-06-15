package pendaftaran;

public class IbuData
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

  public IbuData() {
  }

  //created by Yopie
  public IbuData(String nik, String namaLgkp, String jenisKlmin, String alamat,
                 String noRt, String noRw,
                 String dusun, String kodePos, String telp,
                 String tglLhr, String statKwn, String tglKwn,

                 String statHbkel, String jenisPkrjn, String noKk,
                 String noProp,
                 String noKab, String noKec,
                 String noKel, String agama, String tmptLhr) {

    this.alamat = (alamat == null) ? "" : alamat;
    this.noRt = (noRt == null) ? "" : noRt;
    this.noRw = (noRw == null) ? "" : noRw;
    this.dusun = (dusun == null) ? "" : dusun;
    this.kodePos = (kodePos == null) ? "" : kodePos;
    this.telp = (telp == null) ? "" : telp;
    this.nik = (nik == null) ? "" : nik;

    this.namaLgkp = (namaLgkp == null) ? "" : namaLgkp;
    this.jenisKlmin = (jenisKlmin == null) ? "" : jenisKlmin;

    this.statKwn = (statKwn == null) ? "" : statKwn;
    this.tglLhr = (tglLhr == null) ? "" : tglLhr;

    this.tglKwn = (tglKwn == null) ? "" : tglKwn;
    this.statHbkel = (statHbkel == null) ? "" : statHbkel;
    this.jenisPkrjn = (jenisPkrjn == null) ? "" : jenisPkrjn;
    this.noKk = (noKk == null) ? "" : noKk;

    this.noProp = (noProp == null) ? "" : noProp;
    this.noKab = (noKab == null) ? "" : noKab;
    this.noKec = (noKec == null) ? "" : noKec;
    this.noKel = (noKel == null) ? "" : noKel;

    this.agama = agama;
    this.tmptLhr = tmptLhr;
  }

  //end created by Yopie

  public IbuData(String nik, String namaLgkp, String jenisKlmin, String alamat,
                 String noRt, String noRw,
                 String dusun, String kodePos, String telp,
                 String tglLhr, String statKwn, String tglKwn,

                 String statHbkel, String jenisPkrjn, String noKk,
                 String noProp,
                 String noKab, String noKec,
                 String noKel) {

    this.alamat = (alamat == null) ? "" : alamat;
    this.noRt = (noRt == null) ? "" : noRt;
    this.noRw = (noRw == null) ? "" : noRw;
    this.dusun = (dusun == null) ? "" : dusun;
    this.kodePos = (kodePos == null) ? "" : kodePos;
    this.telp = (telp == null) ? "" : telp;
    this.nik = (nik == null) ? "" : nik;

    this.namaLgkp = (namaLgkp == null) ? "" : namaLgkp;
    this.jenisKlmin = (jenisKlmin == null) ? "" : jenisKlmin;

    this.statKwn = (statKwn == null) ? "" : statKwn;
    this.tglLhr = (tglLhr == null) ? "" : tglLhr;

    this.tglKwn = (tglKwn == null) ? "" : tglKwn;
    this.statHbkel = (statHbkel == null) ? "" : statHbkel;
    this.jenisPkrjn = (jenisPkrjn == null) ? "" : jenisPkrjn;
    this.noKk = (noKk == null) ? "" : noKk;

    this.noProp = (noProp == null) ? "" : noProp;
    this.noKab = (noKab == null) ? "" : noKab;
    this.noKec = (noKec == null) ? "" : noKec;
    this.noKel = (noKel == null) ? "" : noKel;
  }

  public IbuData(String namaKep, String alamat,
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

    this.namaKep = (namaKep == null) ? "" : namaKep;
    this.alamat = (alamat == null) ? "" : alamat;
    this.noRt = (noRt == null) ? "" : noRt;
    this.noRw = (noRw == null) ? "" : noRw;
    this.dusun = (dusun == null) ? "" : dusun;
    this.kodePos = (kodePos == null) ? "" : kodePos;
    this.telp = (telp == null) ? "" : telp;
    this.nik = (nik == null) ? "" : nik;
    this.noKtp = (noKtp == null) ? "" : noKtp;
    this.tmptSbl = (tmptSbl == null) ? "" : tmptSbl;
    this.noPaspor = (noPaspor == null) ? "" : noPaspor;
    this.tglAkhPaspor = (tglAkhPaspor == null) ? "" : tglAkhPaspor;
    this.namaLgkp = (namaLgkp == null) ? "" : namaLgkp;
    this.jenisKlmin = (jenisKlmin == null) ? "" : jenisKlmin;
    this.tmptLhr = (tmptLhr == null) ? "" : tmptLhr;
    this.tglLhr = (tglLhr == null) ? "" : tglLhr;
    this.aktaLhr = (aktaLhr == null) ? "" : aktaLhr;
    this.noAktaLhr = (noAktaLhr == null) ? "" : noAktaLhr;
    this.golDrh = (golDrh == null) ? "" : golDrh;
    this.agama = (agama == null) ? "" : agama;
    this.statKwn = (statKwn == null) ? "" : statKwn;
    this.aktaKwn = (aktaKwn == null) ? "" : aktaKwn;
    this.noAktaKwn = (noAktaKwn == null) ? "" : noAktaKwn;
    this.tglKwn = (tglKwn == null) ? "" : tglKwn;
    this.aktaCrai = (aktaCrai == null) ? "" : aktaCrai;
    this.noAktaCrai = (noAktaCrai == null) ? "" : noAktaCrai;
    this.tglCrai = (tglCrai == null) ? "" : tglCrai;
    this.statHbkel = (statHbkel == null) ? "" : statHbkel;
    this.klainFsk = (klainFsk == null) ? "" : klainFsk;
    this.pnydngCct = (pnydngCct == null) ? "" : pnydngCct;
    this.pddkAkh = (pddkAkh == null) ? "" : pddkAkh;
    this.jenisPkrjn = (jenisPkrjn == null) ? "" : jenisPkrjn;
    this.nikIbu = (nikIbu == null) ? "" : nikIbu;
    this.namaLgkpIbu = (namaLgkpIbu == null) ? "" : namaLgkpIbu;
    this.nikAyah = (nikAyah == null) ? "" : nikAyah;
    this.namaLgkpAyah = (namaLgkpAyah == null) ? "" : namaLgkpAyah;
    this.namaKetRt = (namaKetRt == null) ? "" : namaKetRt;
    this.namaKetRw = (namaKetRw == null) ? "" : namaKetRw;
    this.namaPetReg = (namaPetReg == null) ? "" : namaPetReg;
    this.nipPetReg = (nipPetReg == null) ? "" : nipPetReg;
    this.namaPetEntri = (namaPetEntri == null) ? "" : namaPetEntri;
    this.nipPetEntri = (nipPetEntri == null) ? "" : nipPetEntri;
    this.tglEntri = (tglEntri == null) ? "" : tglEntri;
    this.noKk = (noKk == null) ? "" : noKk;
    this.jenisBntu = (jenisBntu == null) ? "" : jenisBntu;
    this.noProp = (noProp == null) ? "" : noProp;
    this.noKab = (noKab == null) ? "" : noKab;
    this.noKec = (noKec == null) ? "" : noKec;
    this.noKel = (noKel == null) ? "" : noKel;
    this.statHidup = (statHidup == null) ? "" : statHidup;
    this.tglUbah = (tglUbah == null) ? "" : tglUbah;
    this.tglCetakKtp = (tglCetakKtp == null) ? "" : tglCetakKtp;
    this.tglGantiKtp = (tglGantiKtp == null) ? "" : tglGantiKtp;
    this.tglPjgKtp = (tglPjgKtp == null) ? "" : tglPjgKtp;
    this.statKtp = (statKtp == null) ? "" : statKtp;
    this.alsNumpang = (alsNumpang == null) ? "" : alsNumpang;
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
