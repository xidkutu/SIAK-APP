package pendaftaran;

import javax.ejb.*;

abstract public class CatatLahirBean
    implements EntityBean {
  EntityContext entityContext;
  public String ejbCreate(String nikBayi) throws CreateException {
    setNikBayi(nikBayi);
    return null;
  }

  public String ejbCreate(String nikBayi, java.math.BigDecimal tmptDilhr,
                          String pukulLhr, java.math.BigDecimal wktPklLhr,
                          java.math.BigDecimal jenisKlahir,
                          java.math.BigDecimal anakKeLahir,
                          java.math.BigDecimal pnlngBayi, String brtBayi,
                          String nikIbu, String namaIbu, String tglLhrIbu,
                          java.math.BigDecimal jenisPkrjnIbu, String alamatIbu,
                          java.math.BigDecimal noRtIbu,
                          java.math.BigDecimal noRwIbu,
                          String dusunIbu, java.math.BigDecimal kodeposIbu,
                          String telpIbu, String namaKelIbu,
                          String noKelIbu, String noKecIbu,
                          String noKabIbu, String noPropIbu,
                          java.math.BigDecimal kwrngrnIbu,
                          java.math.BigDecimal ketrunanIbu,
                          String bangsaIbu, String tglCttKwnIbu, String nikAyh,
                          String namaAyh, String tglLhirAyh,
                          java.math.BigDecimal jenisPkrjnAyh, String alamatAyh,
                          java.math.BigDecimal noRtAyh,
                          java.math.BigDecimal noRwAyh,
                          String dusunAyh,
                          java.math.BigDecimal kodeposAyh, String telpAyh,
                          String noKelAyh, String noKecAyh, String noKabAyh,
                          String noPropAyh,
                          java.math.BigDecimal kwrngrnAyh,
                          java.math.BigDecimal ketrunanAyh, String bangsaAyh,
                          String tglCttKwnAyh, String nikPlpor, String tglMlpor,
                          java.math.BigDecimal userId,
                          java.math.BigDecimal noProp,
                          java.math.BigDecimal noKab,
                          java.math.BigDecimal noKec, String tglEntri,
                          String cflag,
                          String pflag) throws CreateException {
    setNikBayi(nikBayi);
    setTmptDilhr(tmptDilhr);
    setPukulLhr(pukulLhr);
    setWktPklLhr(wktPklLhr);
    setJenisKlahir(jenisKlahir);
    setAnakKeLahir(anakKeLahir);
    setPnlngBayi(pnlngBayi);
    setBrtBayi(brtBayi);
    setNikIbu(nikIbu);
    setNamaIbu(namaIbu);
    setTglLhrIbu(tglLhrIbu);
    setJenisPkrjnIbu(jenisPkrjnIbu);
    setAlamatIbu(alamatIbu);
    setNoRtIbu(noRtIbu);
    setNoRwIbu(noRwIbu);
    setDusunIbu(dusunIbu);
    setKodeposIbu(kodeposIbu);
    setTelpIbu(telpIbu);
    setNamaKelIbu(namaKelIbu);
    setNoKelIbu(noKelIbu);
    setNoKecIbu(noKecIbu);
    setNoKabIbu(noKabIbu);
    setNoPropIbu(noPropIbu);
    setKwrngrnIbu(kwrngrnIbu);
    setKetrunanIbu(ketrunanIbu);
    setBangsaIbu(bangsaIbu);
    setTglCttKwnIbu(tglCttKwnIbu);
    setNikAyh(nikAyh);
    setNamaAyh(namaAyh);
    setTglLhirAyh(tglLhirAyh);
    setJenisPkrjnAyh(jenisPkrjnAyh);
    setAlamatAyh(alamatAyh);
    setNoRtAyh(noRtAyh);
    setNoRwAyh(noRwAyh);
    setDusunAyh(dusunAyh);
    setKodeposAyh(kodeposAyh);
    setTelpAyh(telpAyh);
    setNoKelAyh(noKelAyh);
    setNoKecAyh(noKecAyh);
    setNoKabAyh(noKabAyh);
    setNoPropAyh(noPropAyh);
    setKwrngrnAyh(kwrngrnAyh);
    setKetrunanAyh(ketrunanAyh);
    setBangsaAyh(bangsaAyh);
    setTglCttKwnAyh(tglCttKwnAyh);
    setNikPlpor(nikPlpor);
    setTglMlpor(tglMlpor);
    setUserId(userId);
    setNoProp(noProp);
    setNoKab(noKab);
    setNoKec(noKec);
    setTglEntri(tglEntri);
    setCflag(cflag);
    setPflag(pflag);
    return null;
  }

  public void ejbPostCreate(String nikBayi) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(String nikBayi, java.math.BigDecimal tmptDilhr,
                            String pukulLhr,
                            java.math.BigDecimal wktPklLhr,
                            java.math.BigDecimal jenisKlahir,
                            java.math.BigDecimal anakKeLahir,
                            java.math.BigDecimal pnlngBayi,
                            String brtBayi, String nikIbu, String namaIbu,
                            String tglLhrIbu,
                            java.math.BigDecimal jenisPkrjnIbu,
                            String alamatIbu,
                            java.math.BigDecimal noRtIbu,
                            java.math.BigDecimal noRwIbu,
                            String dusunIbu, java.math.BigDecimal kodeposIbu,
                            String telpIbu,
                            String namaKelIbu, String noKelIbu,
                            String noKecIbu, String noKabIbu,
                            String noPropIbu, java.math.BigDecimal kwrngrnIbu,
                            java.math.BigDecimal ketrunanIbu, String bangsaIbu,
                            String tglCttKwnIbu, String nikAyh, String namaAyh,
                            String tglLhirAyh,
                            java.math.BigDecimal jenisPkrjnAyh,
                            String alamatAyh,
                            java.math.BigDecimal noRtAyh,
                            java.math.BigDecimal noRwAyh,
                            String dusunAyh, java.math.BigDecimal kodeposAyh,
                            String telpAyh,
                            String noKelAyh, String noKecAyh,
                            String noKabAyh, String noPropAyh,
                            java.math.BigDecimal kwrngrnAyh,
                            java.math.BigDecimal ketrunanAyh,
                            String bangsaAyh, String tglCttKwnAyh,
                            String nikPlpor,
                            String tglMlpor, java.math.BigDecimal noProp,
                            java.math.BigDecimal noKab,
                            java.math.BigDecimal noKec,
                            java.math.BigDecimal userId, String tglEntri,
                            String cflag,
                            String pflag) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNikBayi(String nikBayi);

  public abstract void setTmptDilhr(java.math.BigDecimal tmptDilhr);

  public abstract void setPukulLhr(String pukulLhr);

  public abstract void setWktPklLhr(java.math.BigDecimal wktPklLhr);

  public abstract void setJenisKlahir(java.math.BigDecimal jenisKlahir);

  public abstract void setAnakKeLahir(java.math.BigDecimal anakKeLahir);

  public abstract void setPnlngBayi(java.math.BigDecimal pnlngBayi);

  public abstract void setBrtBayi(String brtBayi);

  public abstract void setNikIbu(String nikIbu);

  public abstract void setNamaIbu(String namaIbu);

  public abstract void setTglLhrIbu(String tglLhrIbu);

  public abstract void setJenisPkrjnIbu(java.math.BigDecimal jenisPkrjnIbu);

  public abstract void setAlamatIbu(String alamatIbu);

  public abstract void setNoRtIbu(java.math.BigDecimal noRtIbu);

  public abstract void setNoRwIbu(java.math.BigDecimal noRwIbu);

  public abstract void setDusunIbu(String dusunIbu);

  public abstract void setKodeposIbu(java.math.BigDecimal kodeposIbu);

  public abstract void setTelpIbu(String telpIbu);

  public abstract void setNamaKelIbu(String namaKelIbu);

  public abstract void setNoKelIbu(String noKelIbu);

  public abstract void setNoKecIbu(String noKecIbu);

  public abstract void setNoKabIbu(String noKabIbu);

  public abstract void setNoPropIbu(String noPropIbu);

  public abstract void setKwrngrnIbu(java.math.BigDecimal kwrngrnIbu);

  public abstract void setKetrunanIbu(java.math.BigDecimal ketrunanIbu);

  public abstract void setBangsaIbu(String bangsaIbu);

  public abstract void setTglCttKwnIbu(String tglCttKwnIbu);

  public abstract void setNikAyh(String nikAyh);

  public abstract void setNamaAyh(String namaAyh);

  public abstract void setTglLhirAyh(String tglLhirAyh);

  public abstract void setJenisPkrjnAyh(java.math.BigDecimal jenisPkrjnAyh);

  public abstract void setAlamatAyh(String alamatAyh);

  public abstract void setNoRtAyh(java.math.BigDecimal noRtAyh);

  public abstract void setNoRwAyh(java.math.BigDecimal noRwAyh);

  public abstract void setDusunAyh(String dusunAyh);

  public abstract void setKodeposAyh(java.math.BigDecimal kodeposAyh);

  public abstract void setTelpAyh(String telpAyh);

  public abstract void setNoKelAyh(String noKelAyh);

  public abstract void setNoKecAyh(String noKecAyh);

  public abstract void setNoKabAyh(String noKabAyh);

  public abstract void setNoPropAyh(String noPropAyh);

  public abstract void setKwrngrnAyh(java.math.BigDecimal kwrngrnAyh);

  public abstract void setKetrunanAyh(java.math.BigDecimal ketrunanAyh);

  public abstract void setBangsaAyh(String bangsaAyh);

  public abstract void setTglCttKwnAyh(String tglCttKwnAyh);

  public abstract void setNikPlpor(String nikPlpor);

  public abstract void setTglMlpor(String tglMlpor);

  public abstract void setNikSksi1(String nikSksi1);

  public abstract void setNikSksi2(String nikSksi2);

  public abstract void setJenisDftLhr(java.math.BigDecimal jenisDftLhr);

  public abstract void setDsrhkCttlhr(java.math.BigDecimal dsrhkCttlhr);

  public abstract void setPsyratanLhr(String psyratanLhr);

  public abstract void setNoAktaLahir(String noAktaLahir);

  public abstract void setTglAktaLhr(String tglAktaLhr);

  public abstract void setNamaKepDes(String namaKepDes);

  public abstract void setNipLrh(java.math.BigDecimal nipLrh);

  public abstract void setNamaPetReg(String namaPetReg);

  public abstract void setNipPetReg(java.math.BigDecimal nipPetReg);

  public abstract void setTglCtkKtakta(String tglCtkKtakta);

  public abstract void setNamaPetEntri(String namaPetEntri);

  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setNoKec(java.math.BigDecimal noKec);

  public abstract void setNoKel(java.math.BigDecimal noKel);

  public abstract void setFlagKec(String flagKec);

  public abstract void setTglEntri(String tglEntri);

  public abstract void setTglUpdation(String tglUpdation);

  public abstract void setUserId(java.math.BigDecimal userId);

  public abstract void setCflag(String cflag);

  public abstract void setPflag(String pflag);

  public abstract String getNikBayi();

  public abstract java.math.BigDecimal getTmptDilhr();

  public abstract String getPukulLhr();

  public abstract java.math.BigDecimal getWktPklLhr();

  public abstract java.math.BigDecimal getJenisKlahir();

  public abstract java.math.BigDecimal getAnakKeLahir();

  public abstract java.math.BigDecimal getPnlngBayi();

  public abstract String getBrtBayi();

  public abstract String getNikIbu();

  public abstract String getNamaIbu();

  public abstract String getTglLhrIbu();

  public abstract java.math.BigDecimal getJenisPkrjnIbu();

  public abstract String getAlamatIbu();

  public abstract java.math.BigDecimal getNoRtIbu();

  public abstract java.math.BigDecimal getNoRwIbu();

  public abstract String getDusunIbu();

  public abstract java.math.BigDecimal getKodeposIbu();

  public abstract String getTelpIbu();

  public abstract String getNamaKelIbu();

  public abstract String getNoKelIbu();

  public abstract String getNoKecIbu();

  public abstract String getNoKabIbu();

  public abstract String getNoPropIbu();

  public abstract java.math.BigDecimal getKwrngrnIbu();

  public abstract java.math.BigDecimal getKetrunanIbu();

  public abstract String getBangsaIbu();

  public abstract String getTglCttKwnIbu();

  public abstract String getNikAyh();

  public abstract String getNamaAyh();

  public abstract String getTglLhirAyh();

  public abstract java.math.BigDecimal getJenisPkrjnAyh();

  public abstract String getAlamatAyh();

  public abstract java.math.BigDecimal getNoRtAyh();

  public abstract java.math.BigDecimal getNoRwAyh();

  public abstract String getDusunAyh();

  public abstract java.math.BigDecimal getKodeposAyh();

  public abstract String getTelpAyh();

  public abstract String getNoKelAyh();

  public abstract String getNoKecAyh();

  public abstract String getNoKabAyh();

  public abstract String getNoPropAyh();

  public abstract java.math.BigDecimal getKwrngrnAyh();

  public abstract java.math.BigDecimal getKetrunanAyh();

  public abstract String getBangsaAyh();

  public abstract String getTglCttKwnAyh();

  public abstract String getNikPlpor();

  public abstract String getTglMlpor();

  public abstract String getNikSksi1();

  public abstract String getNikSksi2();

  public abstract java.math.BigDecimal getJenisDftLhr();

  public abstract java.math.BigDecimal getDsrhkCttlhr();

  public abstract String getPsyratanLhr();

  public abstract String getNoAktaLahir();

  public abstract String getTglAktaLhr();

  public abstract String getNamaKepDes();

  public abstract java.math.BigDecimal getNipLrh();

  public abstract String getNamaPetReg();

  public abstract java.math.BigDecimal getNipPetReg();

  public abstract String getTglCtkKtakta();

  public abstract String getNamaPetEntri();

  public abstract java.math.BigDecimal getNipPetEntri();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.math.BigDecimal getNoKec();

  public abstract java.math.BigDecimal getNoKel();

  public abstract String getFlagKec();

  public abstract String getTglEntri();

  public abstract String getTglUpdation();

  public abstract java.math.BigDecimal getUserId();

  public abstract String getCflag();

  public abstract String getPflag();

  public void ejbLoad() {
    /**@todo Complete this method*/
  }

  public void ejbStore() {
    /**@todo Complete this method*/
  }

  public void ejbActivate() {
    /**@todo Complete this method*/
  }

  public void ejbPassivate() {
    /**@todo Complete this method*/
  }

  public void unsetEntityContext() {
    this.entityContext = null;
  }

  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
}