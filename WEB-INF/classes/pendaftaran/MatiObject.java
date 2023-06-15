package pendaftaran;

import java.math.*;

public class MatiObject
    implements java.io.Serializable {

  String pukul, tmptMati, pnetapPn, noPnetap, namaLgkpIbu, alamatIbu, dusunIbu,
      telpIbu, namaLgkpAyh, alamatAyh, dusunAyh, telpAyh, psyratanMt,
      noAktaMati, namaKepDes, namaPetReg, namaPetEntri, cflag, pflag, namaLgkp,
      tmptLhr, dusun, telp, alamat, bagi, noPropIbu, noKabIbu, noKecIbu,
      noKelIbu, noPropAyh,
      noKabAyh, noKecAyh, noKelAyh;

  BigDecimal nikJnsah, jenisPkrjn, kwrngrnJnsah, ktrunanJnsah, anakKe, wktPukul, sbabMati,
      ygMnerang, nikIbu, kwrngrnIbu, jenisPkrjnIbu, noRtIbu, noRwIbu,
      kodeposIbu,
      nikAyh, kwrngrnAyh, jenisPkrjnAyh,
      noRtAyh, noRwAyh, kodeposAyh, nikPlpor,
      kwrngrnPlpor, nikSksi1, kwrngrnSksi1, nikSksi2, kwrngrnSksi2, jenisDftLhr,
      dasarHkmMati, nipLrh, nipPetReg, nipPetEntri, noProp, noKab, noKec, noKel,
      flagKec,
      userId, jenisKlmin, noRt, noRw, kodePos;

  java.lang.String tglMati, tglPnetap, tglLhrIbu, tglLhrAyh, tglMlpor,
      tglAktaMati, tglCtkKtakta, tglEntri, tglUpdation, tglLhr;

  public MatiObject() {
  }

  public MatiObject(BigDecimal nikJnsah,
                    BigDecimal jenisPkrjn,
                    BigDecimal kwrngrnJnsah,
                    BigDecimal ktrunanJnsah,
                    BigDecimal anakKe,
                    java.lang.String tglMati,
                    String pukul,
                    BigDecimal wktPukul,
                    BigDecimal sbabMati,
                    String tmptMati,
                    BigDecimal ygMnerang,
                    String pnetapPn,
                    String noPnetap,
                    java.lang.String tglPnetap,
                    BigDecimal nikIbu,
                    BigDecimal kwrngrnIbu,
                    String namaLgkpIbu,
                    java.lang.String tglLhrIbu,
                    BigDecimal jenisPkrjnIbu,
                    String alamatIbu,
                    BigDecimal noRtIbu,
                    BigDecimal noRwIbu,
                    String dusunIbu,
                    BigDecimal kodeposIbu,
                    String telpIbu,
                    String noPropIbu,
                    String noKabIbu,
                    String noKecIbu,
                    String noKelIbu,
                    BigDecimal nikAyh,
                    BigDecimal kwrngrnAyh,
                    String namaLgkpAyh,
                    java.lang.String tglLhrAyh,
                    BigDecimal jenisPkrjnAyh,
                    String alamatAyh,
                    BigDecimal noRtAyh,
                    String dusunAyh,
                    BigDecimal noRwAyh,
                    BigDecimal kodeposAyh,
                    String telpAyh,
                    String noPropAyh,
                    String noKabAyh,
                    String noKecAyh,
                    String noKelAyh,
                    BigDecimal nikPlpor,
                    BigDecimal kwrngrnPlpor,
                    java.lang.String tglMlpor,
                    BigDecimal nikSksi1,
                    BigDecimal kwrngrnSksi1,
                    BigDecimal nikSksi2,
                    BigDecimal kwrngrnSksi2,
                    BigDecimal jenisDftLhr,
                    BigDecimal dasarHkmMati,
                    String psyratanMt,
                    String noAktaMati,
                    java.lang.String tglAktaMati,
                    String namaKepDes,
                    BigDecimal nipLrh,
                    String namaPetReg,
                    BigDecimal nipPetReg,
                    java.lang.String tglCtkKtakta,
                    String namaPetEntri,
                    BigDecimal nipPetEntri,
                    BigDecimal noProp,
                    BigDecimal noKab,
                    BigDecimal noKec,
                    BigDecimal noKel,
                    BigDecimal flagKec,
                    java.lang.String tglEntri,
                    java.lang.String tglUpdation,
                    BigDecimal userId,
                    String cflag,
                    String pflag,
                    java.math.BigDecimal jenisKlmin,
                    java.lang.String tglLhr, String namaLgkp,
                    String tmptLhr,
                    String alamat, String dusun,
                    String telp, BigDecimal noRt,
                    BigDecimal noRw, BigDecimal kodePos, String bagi) {

    this.nikJnsah = nikJnsah;
    this.jenisPkrjn = jenisPkrjn;
    this.kwrngrnJnsah = kwrngrnJnsah;
    this.ktrunanJnsah = ktrunanJnsah;
    this.anakKe = anakKe;
    this.tglMati = tglMati;
    this.pukul = pukul;
    this.wktPukul = wktPukul;
    this.sbabMati = sbabMati;
    this.tmptMati = tmptMati;
    this.ygMnerang = ygMnerang;
    this.pnetapPn = pnetapPn;
    this.noPnetap = noPnetap;
    this.tglPnetap = tglPnetap;
    this.nikIbu = nikIbu;
    this.kwrngrnIbu = kwrngrnIbu;
    this.namaLgkpIbu = namaLgkpIbu;
    this.tglLhrIbu = tglLhrIbu;
    this.jenisPkrjnIbu = jenisPkrjnIbu;
    this.alamatIbu = alamatIbu;
    this.noRtIbu = noRtIbu;
    this.noRwIbu = noRwIbu;
    this.dusunIbu = dusunIbu;
    this.kodeposIbu = kodeposIbu;
    this.telpIbu = telpIbu;
    this.noPropIbu = noPropIbu;
    this.noKabIbu = noKabIbu;
    this.noKecIbu = noKecIbu;
    this.noKelIbu = noKelIbu;
    this.nikAyh = nikAyh;
    this.kwrngrnAyh = kwrngrnAyh;
    this.namaLgkpAyh = namaLgkpAyh;
    this.tglLhrAyh = tglLhrAyh;
    this.jenisPkrjnAyh = jenisPkrjnAyh;
    this.alamatAyh = alamatAyh;
    this.noRtAyh = noRtAyh;
    this.dusunAyh = dusunAyh;
    this.noRwAyh = noRwAyh;
    this.kodeposAyh = kodeposAyh;
    this.telpAyh = telpAyh;
    this.noKelAyh = noKelAyh;
    this.noKecAyh = noKecAyh;
    this.noKabAyh = noKabAyh;
    this.noPropAyh = noPropAyh;
    this.nikPlpor = nikPlpor;
    this.kwrngrnPlpor = kwrngrnPlpor;
    this.tglMlpor = tglMlpor;
    this.nikSksi1 = nikSksi1;
    this.kwrngrnSksi1 = kwrngrnSksi1;
    this.nikSksi2 = nikSksi2;
    this.kwrngrnSksi2 = kwrngrnSksi2;
    this.jenisDftLhr = jenisDftLhr;
    this.dasarHkmMati = dasarHkmMati;
    this.psyratanMt = psyratanMt;
    this.noAktaMati = noAktaMati;
    this.tglAktaMati = tglAktaMati;
    this.namaKepDes = namaKepDes;
    this.nipLrh = nipLrh;
    this.namaPetReg = namaPetReg;
    this.nipPetReg = nipPetReg;
    this.tglCtkKtakta = tglCtkKtakta;
    this.namaPetEntri = namaPetEntri;
    this.nipPetEntri = nipPetEntri;
    this.noProp = noProp;
    this.noKab = noKab;
    this.noKec = noKec;
    this.noKel = noKel;
    this.flagKec = flagKec;
    this.tglEntri = tglEntri;
    this.tglUpdation = tglUpdation;
    this.userId = userId;
    this.cflag = cflag;
    this.pflag = pflag;
    this.namaLgkp = namaLgkp;
    this.jenisKlmin = jenisKlmin;
    this.tmptLhr = tmptLhr;
    this.tglLhr = tglLhr;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.bagi = bagi;

  }

  public void setNikJnsah(BigDecimal nikJnsah) {
    this.nikJnsah = nikJnsah;
  }

  public BigDecimal getNikJnsah() {
    return nikJnsah
        ;
  }

  public void setKwrngrnJnsah(BigDecimal kwrngrnJnsah) {
    this.kwrngrnJnsah = kwrngrnJnsah;
  }

  public void setKtrunanJnsah(BigDecimal ktrunanJnsah) {
    this.ktrunanJnsah = ktrunanJnsah;
  }

  public BigDecimal getKtrunanJnsah() {
    return ktrunanJnsah;
  }

  public BigDecimal getKwrngrnJnsah() {
    return kwrngrnJnsah;
  }

  public void setTglMati(java.lang.String tglMati) {
    this.tglMati = tglMati;
  }

  public java.lang.String getTglMati() {
    return tglMati;
  }

  public void setPukul(String pukul) {
    this.pukul = pukul;
  }

  public String getPukul() {
    return pukul;
  }

  public void setWktPukul(BigDecimal wktPukul) {
    this.wktPukul = wktPukul;
  }

  public BigDecimal getWktPukul() {
    return wktPukul;
  }

  public void setSbabMati(BigDecimal jenisKlahir) {
    this.sbabMati = sbabMati;
  }

  public BigDecimal getSbabMati() {
    return sbabMati;
  }

  public void setAnakKe(BigDecimal anakKe) {
    this.anakKe = anakKe;
  }

  public BigDecimal getAnakKe() {
    return anakKe;
  }

  public void setYgMnerang(BigDecimal ygMnerang) {
    this.ygMnerang = ygMnerang;
  }

  public BigDecimal getYgMnerang() {
    return ygMnerang;
  }

  public void setTmptMati(String tmptMati) {
    this.tmptMati = tmptMati;
  }

  public String getTmptMati() {
    return tmptMati;
  }

  public String getPnetapPn() {
    return pnetapPn;
  }

  public void setPnetapPn(String pnetapPn) {
    this.pnetapPn = pnetapPn;
  }

  public String getNoPnetap() {
    return noPnetap;
  }

  public void setNoPnetap(String noPnetap) {
    this.noPnetap = noPnetap;
  }

  public void setTglPnetap(java.lang.String tglPnetap) {
    this.tglPnetap = tglPnetap;
  }

  public java.lang.String getTglPnetap() {
    return tglPnetap;
  }

  public void setNikIbu(BigDecimal nikIbu) {
    this.nikIbu = nikIbu;
  }

  public BigDecimal getNikIbu() {
    return nikIbu;
  }

  public void setKwrngrnIbu(BigDecimal kwrngrnIbu) {
    this.kwrngrnIbu = kwrngrnIbu;
  }

  public BigDecimal getKwrngrnIbu() {
    return kwrngrnIbu;
  }

  public void setNamaLgkpIbu(String namaLgkpIbu) {
    this.namaLgkpIbu = namaLgkpIbu;
  }

  public String getNamaLgkpIbu() {
    return namaLgkpIbu;
  }

  public void setTglLhrIbu(java.lang.String tglLhrIbu) {
    this.tglLhrIbu = tglLhrIbu;
  }

  public java.lang.String getTglLhrIbu() {
    return tglLhrIbu;
  }

  public void setJenisPkrjnIbu(BigDecimal jenisPkrjnIbu) {
    this.jenisPkrjnIbu = jenisPkrjnIbu;
  }

  public BigDecimal getJenisPkrjnIbu() {
    return jenisPkrjnIbu;
  }

  public void setAlamatIbu(String alamatIbu) {
    this.alamatIbu = alamatIbu;
  }

  public String getAlamatIbu() {
    return alamatIbu;
  }

  public void setNoRtIbu(BigDecimal noRtIbu) {
    this.noRtIbu = noRtIbu;
  }

  public BigDecimal getNoRtIbu() {
    return noRtIbu;
  }

  public void setNoRwIbu(BigDecimal noRwIbu) {
    this.noRwIbu = noRwIbu;
  }

  public BigDecimal getNoRwIbu() {
    return noRwIbu;
  }

  public void setDusunIbu(String dusunIbu) {
    this.dusunIbu = dusunIbu;
  }

  public String getDusunIbu() {
    return dusunIbu;
  }

  public void setKodeposIbu(BigDecimal kodeposIbu) {
    this.kodeposIbu = kodeposIbu;
  }

  public BigDecimal getKodeposIbu() {
    return kodeposIbu;
  }

  public void setTelpIbu(String telpIbu) {
    this.telpIbu = telpIbu;
  }

  public String getTelpIbu() {
    return telpIbu;
  }

  public void setNoKelIbu(String noKelIbu) {
    this.noKelIbu = noKelIbu;
  }

  public String getNoKelIbu() {
    return noKelIbu;
  }

  public void setNoKecIbu(String noKecIbu) {
    this.noKecIbu = noKecIbu;
  }

  public String getNoKecIbu() {
    return noKecIbu;
  }

  public void setNoKabIbu(String noKabIbu) {
    this.noKabIbu = noKabIbu;
  }

  public String getNoKabIbu() {
    return noKabIbu;
  }

  public void setNoPropIbu(String noPropIbu) {
    this.noPropIbu = noPropIbu;
  }

  public String getNoPropIbu() {
    return noPropIbu;
  }

  public void setKwrngrnAyh(BigDecimal kwrngrnAyh) {
    this.kwrngrnAyh = kwrngrnAyh;
  }

  public BigDecimal getKwrngrnAyh() {
    return kwrngrnAyh;
  }

  public void setNikAyh(BigDecimal nikAyh) {
    this.nikAyh = nikAyh;
  }

  public BigDecimal getNikAyh() {
    return nikAyh;
  }

  public void setNamaLgkpAyh(String namaLgkpAyh) {
    this.namaLgkpAyh = namaLgkpAyh;
  }

  public String getNamaLgkpAyh() {
    return namaLgkpAyh;
  }

  public void setTglLhrAyh(java.lang.String tglLhrAyh) {
    this.tglLhrAyh = tglLhrAyh;
  }

  public java.lang.String getTglLhrAyh() {
    return tglLhrAyh;
  }

  public void setJenisPkrjnAyh(BigDecimal jenisPkrjnAyh) {
    this.jenisPkrjnAyh = jenisPkrjnAyh;
  }

  public BigDecimal getJenisPkrjnAyh() {
    return jenisPkrjnAyh;
  }

  public void setAlamatAyh(String alamatAyh) {
    this.alamatAyh = alamatAyh;
  }

  public String getAlamatAyh() {
    return alamatAyh;
  }

  public void setNoRtAyh(BigDecimal noRtAyh) {
    this.noRtAyh = noRtAyh;
  }

  public BigDecimal getNoRtAyh() {
    return noRtAyh;
  }

  public void setNoRwAyh(BigDecimal noRwAyh) {
    this.noRwAyh = noRwAyh;
  }

  public BigDecimal getNoRwAyh() {
    return noRwAyh;
  }

  public void setDusunAyh(String dusunAyh) {
    this.dusunAyh = dusunAyh;
  }

  public String getDusunAyh() {
    return dusunAyh;
  }

  public void setKodeposAyh(BigDecimal kodeposAyh) {
    this.kodeposAyh = kodeposAyh;
  }

  public BigDecimal getKodeposAyh() {
    return kodeposAyh;
  }

  public void setTelpAyh(String telpAyh) {
    this.telpAyh = telpAyh;
  }

  public String getTelpAyh() {
    return telpAyh;
  }

  public void setNoKelAyh(String noKelAyh) {
    this.noKelAyh = noKelAyh;
  }

  public String getNoKelAyh() {
    return noKelAyh;
  }

  public void setNoKecAyh(String noKecAyh) {
    this.noKecAyh = noKecAyh;
  }

  public String getNoKecAyh() {
    return noKecAyh;
  }

  public void setNoKabAyh(String noKabAyh) {
    this.noKabAyh = noKabAyh;
  }

  public String getNoKabAyh() {
    return noKabAyh;
  }

  public void setNoPropAyh(String noPropAyh) {
    this.noPropAyh = noPropAyh;
  }

  public String getNoPropAyh() {
    return noPropAyh;
  }

  public void setKwrngrnPlpor(BigDecimal kwrngrnPlpor) {
    this.kwrngrnPlpor = kwrngrnPlpor;
  }

  public BigDecimal getKwrngrnPlpor() {
    return kwrngrnPlpor;
  }

  public void setNikPlpor(BigDecimal nikPlpor) {
    this.nikPlpor = nikPlpor;
  }

  public BigDecimal getNikPlpor() {
    return nikPlpor;
  }

  public void setTglMlpor(java.lang.String tglMlpor) {
    this.tglMlpor = tglMlpor;
  }

  public java.lang.String getTglMlpor() {
    return tglMlpor;
  }

  public void setNikSksi1(BigDecimal nikSksi1) {
    this.nikSksi1 = nikSksi1;
  }

  public BigDecimal getNikSksi1() {
    return nikSksi1;
  }

  public void setKwrngrnSksi1(BigDecimal kwrngrnSksi1) {
    this.kwrngrnSksi1 = kwrngrnSksi1;
  }

  public BigDecimal getKwrngrnSksi1() {
    return kwrngrnSksi1;
  }

  public void setNikSksi2(BigDecimal nikSksi2) {
    this.nikSksi2 = nikSksi2;
  }

  public BigDecimal getNikSksi2() {
    return nikSksi2;
  }

  public void setKwrngrnSksi2(BigDecimal kwrngrnSksi2) {
    this.kwrngrnSksi2 = kwrngrnSksi2;
  }

  public BigDecimal getKwrngrnSksi2() {
    return kwrngrnSksi2;
  }

  public void setJenisDftLhr(BigDecimal jenisDftLhr) {
    this.jenisDftLhr = jenisDftLhr;
  }

  public BigDecimal getJenisDftLhr() {
    return jenisDftLhr;
  }

  public void setDasarHkmMati(BigDecimal dasarHkmMati) {
    this.dasarHkmMati = dasarHkmMati;
  }

  public BigDecimal getDasarHkmMati() {
    return dasarHkmMati;
  }

  public void setPsyratanMt(String psyratanMt) {
    this.psyratanMt = psyratanMt;
  }

  public String getpsyratanMt() {
    return psyratanMt;
  }

  public void setNoAktaMati(String noAktaMati) {
    this.noAktaMati = noAktaMati;
  }

  public String getNoAktaMati() {
    return noAktaMati;
  }

  public void setTglAktaMati(java.lang.String tglAktaMati) {
    this.tglAktaMati = tglAktaMati;
  }

  public java.lang.String getTglAktaMati() {
    return tglAktaMati;
  }

  public void setNamaKepDes(String namaKepDes) {
    this.namaKepDes = namaKepDes;
  }

  public String getNamaKepDes() {
    return namaKepDes;
  }

  public void setNipLrh(BigDecimal nipLrh) {
    this.nipLrh = nipLrh;
  }

  public BigDecimal getNipLrh() {
    return nipLrh;
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

  public void setTglCtkKtakta(java.lang.String tglCtkKtakta) {
    this.tglCtkKtakta = tglCtkKtakta;
  }

  public java.lang.String getTglCtkKtakta() {
    return tglCtkKtakta;
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

  public void setFlagKec(BigDecimal flagKec) {
    this.flagKec = flagKec;
  }

  public BigDecimal getFlagKec() {
    return flagKec;
  }

  public void setTglEntri(java.lang.String tglEntri) {
    this.tglEntri = tglEntri;
  }

  public java.lang.String getTglEntri() {
    return tglEntri;
  }

  public void setTglUpdation(java.lang.String tglUpdation) {
    this.tglUpdation = tglUpdation;
  }

  public java.lang.String getTglUpdation() {
    return tglUpdation;
  }

  public void setUserId(BigDecimal userId) {
    this.userId = userId;
  }

  public BigDecimal getUserId() {
    return userId;
  }

  public void setCflag(String cflag) {
    this.cflag = cflag;
  }

  public String getCflag() {
    return cflag;
  }

  public void setPflag(String pflag) {
    this.pflag = pflag;
  }

  public String getPflag() {
    return pflag;
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
    return tglLhr;
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

  public void setBagi(String bagi) {
    this.bagi = bagi;
  }

  public String getBagi() {
    return bagi;
  }
  public BigDecimal getJenisPkrjn() {
    return jenisPkrjn;
  }
  public void setJenisPkrjn(BigDecimal jenisPkrjn) {
    this.jenisPkrjn = jenisPkrjn;
  }

}
