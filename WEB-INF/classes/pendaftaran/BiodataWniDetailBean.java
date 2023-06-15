package pendaftaran;

import java.io.*;
import java.math.*;

public class BiodataWniDetailBean
    implements Serializable {

  private BigDecimal nik;
  private String noKtp;
  private String tmptSbl;
  private String noPaspor;
  private String tglAkhPaspor;
  private String namaLgkp;
  private BigDecimal jenisKlmin;
  private String tmptLhr;
  private String tglLhr;
  private BigDecimal aktaLhr;
  private String noAktaLhr;
  private BigDecimal golDrh;
  private String agama;
  private BigDecimal statKwn;
  private BigDecimal aktaKwn;
  private String noAktaKwn;
  private String tglKwn;
  private BigDecimal aktaCrai;
  private String noAktaCrai;
  private String tglCrai;
  private BigDecimal statHbkel;
  private BigDecimal klainFsk;
  private BigDecimal pnydngCct;
  private BigDecimal pddkAkh;
  private BigDecimal jenisPkrjn;
  private BigDecimal nikIbu;
  private String namaLgkpIbu;
  private BigDecimal nikAyah;
  private String namaLgkpAyah;
  private String namaKetRt;
  private String namaKetRw;
  private String namaPetReg;
  private BigDecimal nipPetReg;
  private String namaPetEntri;
  private BigDecimal nipPetEntri;
  private String tglEntri;
  private BigDecimal noKk;
  private BigDecimal jenisBntu;
  private BigDecimal noProp;
  private BigDecimal noKab;
  private BigDecimal noKec;
  private BigDecimal noKel;
  private BigDecimal statHidup;
  private String tglUbah;
  private String tglCetakKtp;
  private String tglGantiKtp;
  private String tglPjgKtp;
  private BigDecimal statKtp;
  private BigDecimal alsNumpang;
  private String pflag;
  private String cflag;

  public BiodataWniDetailBean(BigDecimal nik, String noKtp, String tmptSbl,
                              String noPaspor, String tglAkhPaspor,
                              String namaLgkp, BigDecimal jenisKlmin,
                              String tmptLhr, String tglLhr, BigDecimal aktaLhr,
                              String noAktaLhr, BigDecimal golDrh, String agama,
                              BigDecimal statKwn, BigDecimal aktaKwn,
                              String noAktaKwn, String tglKwn,
                              BigDecimal aktaCrai, String noAktaCrai,
                              String tglCrai,
                              BigDecimal statHbkel, BigDecimal klainFsk,
                              BigDecimal pnydngCct, BigDecimal pddkAkh,
                              BigDecimal jenisPkrjn,
                              BigDecimal nikIbu, String namaLgkpIbu,
                              BigDecimal nikAyah, String namaLgkpAyah,
                              String namaKetRt,
                              String namaKetRw, String namaPetReg,
                              BigDecimal nipPetReg, String namaPetEntri,
                              BigDecimal nipPetEntri,
                              String tglEntri, BigDecimal noKk,
                              BigDecimal jenisBntu, BigDecimal noProp,
                              BigDecimal noKab,
                              BigDecimal noKec, BigDecimal noKel,
                              BigDecimal statHidup, String tglUbah,
                              String tglCetakKtp,
                              String tglGantiKtp, String tglPjgKtp,
                              BigDecimal statKtp, BigDecimal alsNumpang,
                              String pflag,
                              String cflag
                              ) {
    this.nik = nik;
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
    this.pflag = pflag;
    this.cflag = cflag;
  }

  public String getAgama() {
    return agama;
  }

  public BigDecimal getAktaKwn() {
    return aktaKwn;
  }

  public BigDecimal getAlsNumpang() {
    return alsNumpang;
  }

  public String getCflag() {
    return cflag;
  }

  public BigDecimal getGolDrh() {
    return golDrh;
  }

  public BigDecimal getJenisBntu() {
    return jenisBntu;
  }

  public BigDecimal getJenisKlmin() {
    return jenisKlmin;
  }

  public BigDecimal getJenisPkrjn() {
    return jenisPkrjn;
  }

  public BigDecimal getKlainFsk() {
    return klainFsk;
  }

  public String getNamaKetRt() {
    return namaKetRt;
  }

  public String getNamaKetRw() {
    return namaKetRw;
  }

  public String getNamaLgkp() {
    return namaLgkp;
  }

  public String getNamaLgkpAyah() {
    return namaLgkpAyah;
  }

  public String getNamaLgkpIbu() {
    return namaLgkpIbu;
  }

  public String getNamaPetEntri() {
    return namaPetEntri;
  }

  public String getNamaPetReg() {
    return namaPetReg;
  }

  public BigDecimal getNik() {
    return nik;
  }

  public BigDecimal getNikAyah() {
    return nikAyah;
  }

  public BigDecimal getNikIbu() {
    return nikIbu;
  }

  public BigDecimal getNipPetEntri() {
    return nipPetEntri;
  }

  public BigDecimal getNipPetReg() {
    return nipPetReg;
  }

  public String getNoAktaCrai() {
    return noAktaCrai;
  }

  public String getNoAktaKwn() {
    return noAktaKwn;
  }

  public String getNoAktaLhr() {
    return noAktaLhr;
  }

  public BigDecimal getNoKab() {
    return noKab;
  }

  public BigDecimal getNoKec() {
    return noKec;
  }

  public BigDecimal getNoKel() {
    return noKel;
  }

  public BigDecimal getNoKk() {
    return noKk;
  }

  public String getNoKtp() {
    return noKtp;
  }

  public String getNoPaspor() {
    return noPaspor;
  }

  public BigDecimal getNoProp() {
    return noProp;
  }

  public String getPflag() {
    return pflag;
  }

  public BigDecimal getPddkAkh() {
    return pddkAkh;
  }

  public BigDecimal getPnydngCct() {
    return pnydngCct;
  }

  public BigDecimal getStatHbkel() {
    return statHbkel;
  }

  public BigDecimal getStatHidup() {
    return statHidup;
  }

  public BigDecimal getStatKtp() {
    return statKtp;
  }

  public BigDecimal getStatKwn() {
    return statKwn;
  }

  public String getTglAkhPaspor() {
    return tglAkhPaspor;
  }

  public String getTglCetakKtp() {
    return tglCetakKtp;
  }

  public String getTglCrai() {
    return tglCrai;
  }

  public String getTglEntri() {
    return tglEntri;
  }

  public String getTglKwn() {
    return tglKwn;
  }

  public String getTglLhr() {
    return tglLhr;
  }

  public String getTglPjgKtp() {
    return tglPjgKtp;
  }

  public String getTglUbah() {
    return tglUbah;
  }

  public String getTmptLhr() {
    return tmptLhr;
  }

  public String getTmptSbl() {
    return tmptSbl;
  }

  public void setTmptSbl(String tmptSbl) {
    this.tmptSbl = tmptSbl;
  }

  public void setTmptLhr(String tmptLhr) {
    this.tmptLhr = tmptLhr;
  }

  public void setTglUbah(String tglUbah) {
    this.tglUbah = parsing(tglUbah);
  }

  public void setTglPjgKtp(String tglPjgKtp) {
    this.tglPjgKtp = parsing(tglPjgKtp);
  }

  public void setTglKwn(String tglKwn) {
    this.tglKwn = parsing(tglKwn);
  }

  public void setTglLhr(String tglLhr) {
    this.tglLhr = parsing(tglLhr);
  }

  public void setTglGantiKtp(String tglGantiKtp) {
    this.tglGantiKtp = parsing(tglGantiKtp);
  }

  public void setTglEntri(String tglEntri) {
    this.tglEntri = parsing(tglEntri);
  }

  public void setTglCrai(String tglCrai) {
    this.tglCrai = parsing(tglCrai);
  }

  public void setTglCetakKtp(String tglCetakKtp) {
    this.tglCetakKtp = parsing(tglCetakKtp);
  }

  public void setTglAkhPaspor(String tglAkhPaspor) {
    this.tglAkhPaspor = parsing(tglAkhPaspor);
  }

  public void setStatKwn(BigDecimal statKwn) {
    this.statKwn = statKwn;
  }

  public void setStatKtp(BigDecimal statKtp) {
    this.statKtp = statKtp;
  }

  public void setStatHidup(BigDecimal statHidup) {
    this.statHidup = statHidup;
  }

  public void setStatHbkel(BigDecimal statHbkel) {
    this.statHbkel = statHbkel;
  }

  public void setPnydngCct(BigDecimal pnydngCct) {
    this.pnydngCct = pnydngCct;
  }

  public void setPflag(String pflag) {
    this.pflag = pflag;
  }

  public void setNoPaspor(String noPaspor) {
    this.noPaspor = noPaspor;
  }

  public void setNoKtp(String noKtp) {
    this.noKtp = noKtp;
  }

  public void setNoKel(BigDecimal noKel) {
    this.noKel = noKel;
  }

  public void setNoKab(BigDecimal noKab) {
    this.noKab = noKab;
  }

  public void setNoKec(BigDecimal noKec) {
    this.noKec = noKec;
  }

  public void setNoAktaLhr(String noAktaLhr) {
    this.noAktaLhr = noAktaLhr;
  }

  public void setNoAktaKwn(String noAktaKwn) {
    this.noAktaKwn = noAktaKwn;
  }

  public void setNoAktaCrai(String noAktaCrai) {
    this.noAktaCrai = noAktaCrai;
  }

  public void setNipPetReg(BigDecimal nipPetReg) {
    this.nipPetReg = nipPetReg;
  }

  public void setNipPetEntri(BigDecimal nipPetEntri) {
    this.nipPetEntri = nipPetEntri;
  }

  public void setNikIbu(BigDecimal nikIbu) {
    this.nikIbu = nikIbu;
  }

  public void setNikAyah(BigDecimal nikAyah) {
    this.nikAyah = nikAyah;
  }

  public void setNik(BigDecimal nik) {
    this.nik = nik;
  }

  public void setNamaPetReg(String namaPetReg) {
    this.namaPetReg = namaPetReg;
  }

  public void setNamaPetEntri(String namaPetEntri) {
    this.namaPetEntri = namaPetEntri;
  }

  public void setNamaLgkpIbu(String namaLgkpIbu) {
    this.namaLgkpIbu = namaLgkpIbu;
  }

  public void setNamaLgkpAyah(String namaLgkpAyah) {
    this.namaLgkpAyah = namaLgkpAyah;
  }

  public void setNamaLgkp(String namaLgkp) {
    this.namaLgkp = namaLgkp;
  }

  public void setNamaKetRw(String namaKetRw) {
    this.namaKetRw = namaKetRw;
  }

  public void setNamaKetRt(String namaKetRt) {
    this.namaKetRt = namaKetRt;
  }

  public void setKlainFsk(BigDecimal klainFsk) {
    this.klainFsk = klainFsk;
  }

  public void setJenisPkrjn(BigDecimal jenisPkrjn) {
    this.jenisPkrjn = jenisPkrjn;
  }

  public void setJenisKlmin(BigDecimal jenisKlmin) {
    this.jenisKlmin = jenisKlmin;
  }

  public void setJenisBntu(BigDecimal jenisBntu) {
    this.jenisBntu = jenisBntu;
  }

  public void setGolDrh(BigDecimal golDrh) {
    this.golDrh = golDrh;
  }

  public void setCflag(String cflag) {
    this.cflag = cflag;
  }

  public void setAlsNumpang(BigDecimal alsNumpang) {
    this.alsNumpang = alsNumpang;
  }

  public void setAktaLhr(BigDecimal aktaLhr) {
    this.aktaLhr = aktaLhr;
  }

  public void setAktaKwn(BigDecimal aktaKwn) {
    this.aktaKwn = aktaKwn;
  }

  public void setAktaCrai(BigDecimal aktaCrai) {
    this.aktaCrai = aktaCrai;
  }

  public void setAgama(String agama) {
    this.agama = agama;
  }

  public BigDecimal getAktaCrai() {
    return aktaCrai;
  }

  public BigDecimal getAktaLhr() {
    return aktaLhr;
  }

  public String getTglGantiKtp() {
    return tglGantiKtp;
  }

  public void setPddkAkh(BigDecimal pddkAkh) {
    this.pddkAkh = pddkAkh;
  }

  public void setNoProp(BigDecimal noProp) {
    this.noProp = noProp;
  }

  public void setNoKk(BigDecimal noKk) {
    this.noKk = noKk;
  }

  private String parsing(String tgl) {
    /*
         String tanggal = "", bulan = "", tahun = "";
         if (tgl!=null) {
      StringTokenizer parser = new StringTokenizer(tgl.substring(0, 10), "-");
      tanggal = parser.nextToken();
      if (tanggal.length() == 4) {
        tahun = tanggal;
        bulan = parser.nextToken();
        tanggal = parser.nextToken();
      }
      else {
        return tgl;
      }
         }
         return tanggal +"-"+ bulan +"-"+ tahun;*/
    return DayFormatter.formatDate(tgl);
  }
}
