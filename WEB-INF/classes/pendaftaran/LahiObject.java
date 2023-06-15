package pendaftaran;

import java.math.*;

public class LahiObject
    implements java.io.Serializable {

  String nikBayi, pukulLhr, brtBayi, nikIbu, namaIbu, alamatIbu, dusunIbu,
      telpIbu, namaKelIbu, bangsaIbu, nikAyh, namaAyh, alamatAyh, dusunAyh,
      telpAyh, bangsaAyh, nikPlpor, nikSksi1, nikSksi2, psyratanLhr,
      noAktaLahir,
      namaKepDes, namaPetReg, namaPetEntri, flagKec, cflag, pflag, namaLgkp,
      tmptLhr
      , noKelIbu, noKecIbu, noKabIbu, noPropIbu, noKelAyh, noKecAyh, noKabAyh,
      noPropAyh;

  BigDecimal tmptDilhr, wktPklLhr, jenisKlahir, jenisPekerjaaan, anakKeLahir, pnlngBayi,
      jenisPkrjnIbu, noRtIbu, noRwIbu, kodeposIbu,
      kwrngrnIbu, ketrunanIbu, jenisPkrjnAyh, noRtAyh, noRwAyh,
      kodeposAyh, kwrngrnAyh,
      ketrunanAyh, jenisDftLhr, dsrhkCttlhr, nipLrh, nipPetReg, nipPetEntri,
      noProp, noKab, noKec, noKel, userId, jenisKlmin;

  java.lang.String tglLhrIbu, tglCttKwnIbu, tglLhirAyh, tglCttKwnAyh, tglMlpor,
      tglAktaLhr,
      tglCtkKtakta, tglEntri, tglUpdation, tglLhr;

  LahiObject recordBayi, recordPelapor;

  public LahiObject() {
  }

  public LahiObject(LahiObject obj1, LahiObject obj2) {
    this.recordBayi = obj1;
    this.recordPelapor = obj2;
  }

  public LahiObject(java.lang.String nikBayi,
                    java.math.BigDecimal tmptDilhr,
                    java.lang.String pukulLhr,
                    java.math.BigDecimal wktPklLhr,
                    java.math.BigDecimal jenisKlahir,
                    java.math.BigDecimal anakKeLahir,
                    java.math.BigDecimal pnlngBayi,
                    java.lang.String brtBayi,
                    java.lang.String nikIbu,
                    java.lang.String namaIbu,
                    java.lang.String tglLhrIbu,
                    java.math.BigDecimal jenisPkrjnIbu,
                    java.lang.String alamatIbu,
                    java.math.BigDecimal noRtIbu,
                    java.math.BigDecimal noRwIbu,
                    java.lang.String dusunIbu,
                    java.math.BigDecimal kodeposIbu,
                    java.lang.String telpIbu,
                    java.lang.String namaKelIbu,
                    String noKelIbu,
                    String noKecIbu,
                    String noKabIbu,
                    String noPropIbu,
                    java.math.BigDecimal kwrngrnIbu,
                    java.math.BigDecimal ketrunanIbu,
                    java.lang.String bangsaIbu,
                    java.lang.String tglCttKwnIbu,
                    java.lang.String nikAyh,
                    java.lang.String namaAyh,
                    java.lang.String tglLhirAyh,
                    java.math.BigDecimal jenisPkrjnAyh,
                    java.lang.String alamatAyh,
                    java.math.BigDecimal noRtAyh,
                    java.math.BigDecimal noRwAyh,
                    java.lang.String dusunAyh,
                    java.math.BigDecimal kodeposAyh,
                    java.lang.String telpAyh,
                    String noKelAyh,
                    String noKecAyh,
                    String noKabAyh,
                    String noPropAyh,
                    java.math.BigDecimal kwrngrnAyh,
                    java.math.BigDecimal ketrunanAyh,
                    java.lang.String bangsaAyh,
                    java.lang.String tglCttKwnAyh,
                    java.lang.String nikPlpor,
                    java.lang.String tglMlpor,
                    java.lang.String nikSksi1,
                    java.lang.String nikSksi2,
                    java.math.BigDecimal jenisDftLhr,
                    java.math.BigDecimal dsrhkCttlhr,
                    java.lang.String psyratanLhr,
                    java.lang.String noAktaLahir,
                    java.lang.String tglAktaLhr,
                    java.lang.String namaKepDes,
                    java.math.BigDecimal nipLrh,
                    java.lang.String namaPetReg,
                    java.math.BigDecimal nipPetReg,
                    java.lang.String tglCtkKtakta,
                    java.lang.String namaPetEntri,
                    java.math.BigDecimal nipPetEntri,
                    java.math.BigDecimal noProp,
                    java.math.BigDecimal noKab,
                    java.math.BigDecimal noKec,
                    java.math.BigDecimal noKel,
                    java.lang.String flagKec,
                    java.lang.String tglEntri,
                    java.lang.String tglUpdation,
                    java.math.BigDecimal userId,
                    java.lang.String cflag,
                    java.lang.String pflag,
                    java.math.BigDecimal jenisKlmin,
                    java.lang.String tglLhr, String namaLgkp,
                    String tmptLhr) {

    this.nikBayi = nikBayi;
    this.tmptDilhr = tmptDilhr;
    this.pukulLhr = pukulLhr;
    this.wktPklLhr = wktPklLhr;
    this.jenisKlahir = jenisKlahir;
    this.anakKeLahir = anakKeLahir;
    this.pnlngBayi = pnlngBayi;
    this.brtBayi = brtBayi;
    this.nikIbu = nikIbu;
    this.namaIbu = namaIbu;
    this.tglLhrIbu = tglLhrIbu;
    this.jenisPkrjnIbu = jenisPkrjnIbu;
    this.alamatIbu = alamatIbu;
    this.noRtIbu = noRtIbu;
    this.noRwIbu = noRwIbu;
    this.dusunIbu = dusunIbu;
    this.kodeposIbu = kodeposIbu;
    this.telpIbu = telpIbu;
    this.namaKelIbu = namaKelIbu;
    this.noKelIbu = noKelIbu;
    this.noKecIbu = noKecIbu;
    this.noKabIbu = noKabIbu;
    this.noPropIbu = noPropIbu;
    this.kwrngrnIbu = kwrngrnIbu;
    this.ketrunanIbu = ketrunanIbu;
    this.bangsaIbu = bangsaIbu;
    this.tglCttKwnIbu = tglCttKwnIbu;
    this.nikAyh = nikAyh;
    this.namaAyh = namaAyh;
    this.tglLhirAyh = tglLhirAyh;
    this.jenisPkrjnAyh = jenisPkrjnAyh;
    this.alamatAyh = alamatAyh;
    this.noRtAyh = noRtAyh;
    this.noRwAyh = noRwAyh;
    this.dusunAyh = dusunAyh;
    this.kodeposAyh = kodeposAyh;
    this.telpAyh = telpAyh;
    this.noKelAyh = noKelAyh;
    this.noKecAyh = noKecAyh;
    this.noKabAyh = noKabAyh;
    this.noPropAyh = noPropAyh;
    this.kwrngrnAyh = kwrngrnAyh;
    this.ketrunanAyh = ketrunanAyh;
    this.bangsaAyh = bangsaAyh;
    this.tglCttKwnAyh = tglCttKwnAyh;
    this.nikPlpor = nikPlpor;
    this.tglMlpor = tglMlpor;
    this.nikSksi1 = nikSksi1;
    this.nikSksi2 = nikSksi2;
    this.jenisDftLhr = jenisDftLhr;
    this.dsrhkCttlhr = dsrhkCttlhr;
    this.psyratanLhr = psyratanLhr;
    this.noAktaLahir = noAktaLahir;
    this.tglAktaLhr = tglAktaLhr;
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
  }

  public void setNikBayi(String nikBayi) {
    this.nikBayi = nikBayi;
  }

  public String getNikBayi() {
    return nikBayi
        ;
  }

  public void setTmptDilhr(BigDecimal tmptDilhr) {
    this.tmptDilhr = tmptDilhr;
  }

  public BigDecimal getTmptDilhr() {
    return tmptDilhr;
  }

  public void setPukulLhr(String pukulLhr) {
    this.pukulLhr = pukulLhr;
  }

  public String getPukulLhr() {
    return pukulLhr;
  }

  public void setWktPklLhr(BigDecimal wktPklLhr) {
    this.wktPklLhr = wktPklLhr;
  }

  public BigDecimal getWktPklLhr() {
    return wktPklLhr;
  }

  public void setJenisKlahir(BigDecimal jenisKlahir) {
    this.jenisKlahir = jenisKlahir;
  }

  public BigDecimal getJenisKlahir() {
    return jenisKlahir;
  }

  public void setAnakKeLahir(BigDecimal anakKeLahir) {
    this.anakKeLahir = anakKeLahir;
  }

  public BigDecimal getAnakKeLahir() {
    return anakKeLahir;
  }

  public void setPnlngBayi(BigDecimal pnlngBayi) {
    this.pnlngBayi = pnlngBayi;
  }

  public BigDecimal getPnlngBayi() {
    return pnlngBayi;
  }

  public void setBrtBayi(String brtBayi) {
    this.brtBayi = brtBayi;
  }

  public String getBrtBayi() {
    return brtBayi;
  }

  public void setNikIbu(String nikIbu) {
    this.nikIbu = nikIbu;
  }

  public String getNikIbu() {
    return nikIbu;
  }

  public void setNamaIbu(String namaIbu) {
    this.namaIbu = namaIbu;
  }

  public String getNamaIbu() {
    return namaIbu;
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

  public void setNamaKelIbu(String namaKelIbu) {
    this.namaKelIbu = namaKelIbu;
  }

  public String getNamaKelIbu() {
    return namaKelIbu;
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

  public void setKwrngrnIbu(BigDecimal kwrngrnIbu) {
    this.kwrngrnIbu = kwrngrnIbu;
  }

  public BigDecimal getKwrngrnIbu() {
    return kwrngrnIbu;
  }

  public void setKetrunanIbu(BigDecimal ketrunanIbu) {
    this.ketrunanIbu = ketrunanIbu;
  }

  public BigDecimal getKetrunanIbu() {
    return ketrunanIbu;
  }

  public void setBangsaIbu(String bangsaIbu) {
    this.bangsaIbu = bangsaIbu;
  }

  public String getBangsaIbu() {
    return bangsaIbu;
  }

  public void setTglCttKwnIbu(java.lang.String tglCttKwnIbu) {
    this.tglCttKwnIbu = tglCttKwnIbu;
  }

  public java.lang.String getTglCttKwnIbu() {
    return tglCttKwnIbu;
  }

  public void setNikAyh(String nikAyh) {
    this.nikAyh = nikAyh;
  }

  public String getNikAyh() {
    return nikAyh;
  }

  public void setNamaAyh(String namaAyh) {
    this.namaAyh = namaAyh;
  }

  public String getNamaAyh() {
    return namaAyh;
  }

  public void setTglLhirAyh(java.lang.String tglLhirAyh) {
    this.tglLhirAyh = tglLhirAyh;
  }

  public java.lang.String getTglLhirAyh() {
    return tglLhirAyh;
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

  public void setKwrngrnAyh(BigDecimal kwrngrnAyh) {
    this.kwrngrnAyh = kwrngrnAyh;
  }

  public BigDecimal getKwrngrnAyh() {
    return kwrngrnAyh;
  }

  public void setKetrunanAyh(BigDecimal ketrunanAyh) {
    this.ketrunanAyh = ketrunanAyh;
  }

  public BigDecimal getKetrunanAyh() {
    return ketrunanAyh;
  }

  public void setBangsaAyh(String bangsaAyh) {
    this.bangsaAyh = bangsaAyh;
  }

  public String getBangsaAyh() {
    return bangsaAyh;
  }

  public void setTglCttKwnAyh(java.lang.String tglCttKwnAyh) {
    this.tglCttKwnAyh = tglCttKwnAyh;
  }

  public java.lang.String getTglCttKwnAyh() {
    return tglCttKwnAyh;
  }

  public void setNikPlpor(String nikPlpor) {
    this.nikPlpor = nikPlpor;
  }

  public String getNikPlpor() {
    return nikPlpor;
  }

  public void setTglMlpor(java.lang.String tglMlpor) {
    this.tglMlpor = tglMlpor;
  }

  public java.lang.String getTglMlpor() {
    return tglMlpor;
  }

  public void setNikSksi1(String nikSksi1) {
    this.nikSksi1 = nikSksi1;
  }

  public String getNikSksi1() {
    return nikSksi1;
  }

  public void setNikSksi2(String nikSksi2) {
    this.nikSksi2 = nikSksi2;
  }

  public String getNikSksi2() {
    return nikSksi2;
  }

  public void setJenisDftLhr(BigDecimal jenisDftLhr) {
    this.jenisDftLhr = jenisDftLhr;
  }

  public BigDecimal getJenisDftLhr() {
    return jenisDftLhr;
  }

  public void setDsrhkCttlhr(BigDecimal dsrhkCttlhr) {
    this.dsrhkCttlhr = dsrhkCttlhr;
  }

  public BigDecimal getDsrhkCttlhr() {
    return dsrhkCttlhr;
  }

  public void setPsyratanLhr(String psyratanLhr) {
    this.psyratanLhr = psyratanLhr;
  }

  public String getPsyratanLhr() {
    return psyratanLhr;
  }

  public void setNoAktaLahir(String noAktaLahir) {
    this.noAktaLahir = noAktaLahir;
  }

  public String getNoAktaLahir() {
    return noAktaLahir;
  }

  public void setTglAktaLhr(java.lang.String tglAktaLhr) {
    this.tglAktaLhr = tglAktaLhr;
  }

  public java.lang.String getTglAktaLhr() {
    return tglAktaLhr;
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

  public void setFlagKec(String flagKec) {
    this.flagKec = flagKec;
  }

  public String getFlagKec() {
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
  public BigDecimal getJenisPekerjaaan() {
    return jenisPekerjaaan;
  }
  public void setJenisPekerjaaan(BigDecimal jenisPekerjaaan) {
    this.jenisPekerjaaan = jenisPekerjaaan;
  }
}