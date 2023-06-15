package pendaftaran;

import javax.ejb.*;

abstract public class BiodataWniBean
    implements EntityBean {
  EntityContext entityContext;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws CreateException {
    setNik(nik);
    return null;
  }

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik, String noKtp, String tmptSbl, String noPaspor, String tglAkhPaspor, String namaLgkp, java.math.BigDecimal jenisKlmin, String tmptLhr, String tglLhr, java.math.BigDecimal aktaLhr, String noAktaLhr, java.math.BigDecimal golDrh, String agama, java.math.BigDecimal statKwn, java.math.BigDecimal aktaKwn, String noAktaKwn, String tglKwn, java.math.BigDecimal aktaCrai, String noAktaCrai, String tglCrai, java.math.BigDecimal statHbkel, java.math.BigDecimal klainFsk, java.math.BigDecimal pnydngCct, java.math.BigDecimal pddkAkh, java.math.BigDecimal jenisPkrjn, java.math.BigDecimal nikIbu, String namaLgkpIbu, java.math.BigDecimal nikAyah, String namaLgkpAyah, String namaKetRt, String namaKetRw, String namaPetReg, java.math.BigDecimal nipPetReg, String namaPetEntri, java.math.BigDecimal nipPetEntri, String tglEntri, java.math.BigDecimal noKk, java.math.BigDecimal jenisBntu, java.math.BigDecimal noProp, java.math.BigDecimal noKab, java.math.BigDecimal noKec, java.math.BigDecimal noKel, java.math.BigDecimal statHidup, String tglUbah, String tglCetakKtp, String tglGantiKtp, String tglPjgKtp, java.math.BigDecimal statKtp, java.math.BigDecimal alsNumpang, String pflag, String cflag) throws CreateException {
    try {
      setNik(nik);
      setNoKtp( (noKtp != null || noKtp != "0" || noKtp != "") ? noKtp : "");
      setTmptSbl( (tmptSbl != null || tmptSbl != "0" || tmptSbl != "") ?
                 tmptSbl : "");
      setNoPaspor( (noPaspor != null || noPaspor != "0" || noPaspor != "") ?
                  noPaspor : "");
      setTglAkhPaspor(tglAkhPaspor);
      setNamaLgkp(namaLgkp);
      setJenisKlmin(jenisKlmin);
      setTmptLhr(tmptLhr);
      setTglLhr(tglLhr);
      setAktaLhr(aktaLhr);
      setNoAktaLhr( (noAktaLhr != null || noAktaLhr != "0" || noAktaLhr != "") ?
                   noAktaLhr : "");
      setGolDrh(golDrh);
      setAgama(agama);
      setStatKwn(statKwn);

      if (aktaKwn!=null && !aktaKwn.equals("0"))
      setAktaKwn(aktaKwn);
      else
      setAktaKwn(new java.math.BigDecimal("1"));

      setNoAktaKwn( (noAktaKwn != null || noAktaKwn != "0" || noAktaKwn != "") ?
                   noAktaKwn : "");
      setTglKwn(tglKwn);

      if (aktaCrai!=null && !aktaCrai.equals("0"))
        setAktaCrai(aktaCrai);
      else
        setAktaCrai(new java.math.BigDecimal("1"));

      setNoAktaCrai( (noAktaCrai != null || noAktaCrai != "0" ||
                      noAktaCrai != "") ? noAktaCrai : "");
      setTglCrai(tglCrai);
      setStatHbkel(statHbkel);
      setKlainFsk(klainFsk);
      setPnydngCct(pnydngCct);
      setPddkAkh(pddkAkh);
      setJenisPkrjn(jenisPkrjn);
      if (nikIbu != new java.math.BigDecimal("0")) {
        setNikIbu(nikIbu);
      }

      setNamaLgkpIbu(namaLgkpIbu);
      if (nikAyah != new java.math.BigDecimal("0")) {
        setNikAyah(nikAyah);
      }
      setNamaLgkpAyah( (namaLgkpAyah != null || namaLgkpAyah != "0" ||
                        namaLgkpAyah != "") ? namaLgkpAyah : "");
      setNamaKetRt(namaKetRt);
      setNamaKetRw( (namaKetRw != null || namaKetRw != "0" || namaKetRw != "") ?
                   namaKetRw : "");
      setNamaPetReg(namaPetReg);
      if (nipPetReg != new java.math.BigDecimal("0")) {
        setNipPetReg(nipPetReg);
      }
      setNamaPetEntri(namaPetEntri);
      setNipPetEntri(nipPetEntri);
      setTglEntri(tglEntri);
      setNoKk(noKk);
      //   setJenisBntu(jenisBntu);
      setNoProp(noProp);
      setNoKab(noKab);
      setNoKec(noKec);
      setNoKel(noKel);
      //    setStatHidup(statHidup);
      //  setTglUbah(tglUbah);
      //setTglCetakKtp(tglCetakKtp);
      //setTglGantiKtp(tglGantiKtp);
      //setTglPjgKtp(tglPjgKtp);
      //setStatKtp(statKtp);
      //setAlsNumpang(alsNumpang);
      setPflag(pflag);
      setCflag(cflag);
    }
    catch (Exception errwni) {
      System.out.println("Error in Biodata WNI Insertion" + errwni);
    }

    return null;
  }

  public java.math.BigDecimal ejbCreate(BiodataWniDetailBean bean) throws CreateException {
    setNik(bean.getNik());

    setNoKtp(bean.getNoKtp());
    setTmptSbl(bean.getTmptSbl());
    setNoPaspor(bean.getNoPaspor());
    setTglAkhPaspor(bean.getTglAkhPaspor());
    setNamaLgkp(bean.getNamaLgkp());
    setJenisKlmin(bean.getJenisKlmin());
    setTmptLhr(bean.getTmptLhr());
    setTglLhr(bean.getTglLhr());
    setAktaLhr(bean.getAktaLhr());
    setNoAktaLhr(bean.getNoAktaLhr());
    setGolDrh(bean.getGolDrh());
    setAgama(bean.getAgama());
    setStatKwn(bean.getStatKwn());

    if (bean.getAktaKwn()!=null && !bean.getAktaKwn().equals("0"))
    setAktaKwn(bean.getAktaKwn());
    else
     setAktaKwn(new java.math.BigDecimal("1"));

    setNoAktaKwn(bean.getNoAktaKwn());
    setTglKwn(bean.getTglKwn());

    if (bean.getAktaCrai()!=null && !bean.getAktaCrai().equals("0"))
    setAktaCrai(bean.getAktaCrai());
   else
     setAktaCrai(new java.math.BigDecimal("1"));

    setNoAktaCrai(bean.getNoAktaCrai());
    setTglCrai(bean.getTglCrai());
    setStatHbkel(bean.getStatHbkel());
    setKlainFsk(bean.getKlainFsk());
    setPnydngCct(bean.getPnydngCct());
    setPddkAkh(bean.getPddkAkh());
    setJenisPkrjn(bean.getJenisPkrjn());
    setNikIbu(bean.getNikIbu());
    setNamaLgkpIbu(bean.getNamaLgkpIbu());
    setNikAyah(bean.getNikAyah());
    setNamaLgkpAyah(bean.getNamaLgkpAyah());
    setNamaKetRt(bean.getNamaKetRt());
    setNamaKetRw(bean.getNamaKetRw());
    setNamaPetReg(bean.getNamaPetReg());
    setNipPetReg(bean.getNipPetReg());
    setNamaPetEntri(bean.getNamaPetEntri());
    setNipPetEntri(bean.getNipPetEntri());
    setTglEntri(bean.getTglEntri());
    setNoKk(bean.getNoKk());
    setJenisBntu(bean.getJenisBntu());
    setNoProp(bean.getNoProp());
    setNoKab(bean.getNoKab());
    setNoKec(bean.getNoKec());
    setNoKel(bean.getNoKel());
    setStatHidup(bean.getStatHidup());
    setTglUbah(bean.getTglUbah());
    setTglCetakKtp(bean.getTglCetakKtp());
    setTglGantiKtp(bean.getTglGantiKtp());
    setTglPjgKtp(bean.getTglPjgKtp());
    setStatKtp(bean.getStatKtp());
    setAlsNumpang(bean.getAlsNumpang());
    setPflag(bean.getPflag());
    setCflag(bean.getCflag());

    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(java.math.BigDecimal nik, String noKtp, String tmptSbl, String noPaspor, String tglAkhPaspor, String namaLgkp, java.math.BigDecimal jenisKlmin, String tmptLhr, String tglLhr, java.math.BigDecimal aktaLhr, String noAktaLhr, java.math.BigDecimal golDrh, String agama, java.math.BigDecimal statKwn, java.math.BigDecimal aktaKwn, String noAktaKwn, String tglKwn, java.math.BigDecimal aktaCrai, String noAktaCrai, String tglCrai, java.math.BigDecimal statHbkel, java.math.BigDecimal klainFsk, java.math.BigDecimal pnydngCct, java.math.BigDecimal pddkAkh, java.math.BigDecimal jenisPkrjn, java.math.BigDecimal nikIbu, String namaLgkpIbu, java.math.BigDecimal nikAyah, String namaLgkpAyah, String namaKetRt, String namaKetRw, String namaPetReg, java.math.BigDecimal nipPetReg, String namaPetEntri, java.math.BigDecimal nipPetEntri, String tglEntri, java.math.BigDecimal noKk, java.math.BigDecimal jenisBntu, java.math.BigDecimal noProp, java.math.BigDecimal noKab, java.math.BigDecimal noKec, java.math.BigDecimal noKel, java.math.BigDecimal statHidup, String tglUbah, String tglCetakKtp, String tglGantiKtp, String tglPjgKtp, java.math.BigDecimal statKtp, java.math.BigDecimal alsNumpang, String pflag, String cflag) throws CreateException {
  }

  public void ejbPostCreate(BiodataWniDetailBean bean) throws CreateException {
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNik(java.math.BigDecimal nik);

  public abstract void setNoKtp(String noKtp);

  public abstract void setTmptSbl(String tmptSbl);

  public abstract void setNoPaspor(String noPaspor);

  public abstract void setTglAkhPaspor(String tglAkhPaspor);

  public abstract void setNamaLgkp(String namaLgkp);

  public abstract void setJenisKlmin(java.math.BigDecimal jenisKlmin);

  public abstract void setTmptLhr(String tmptLhr);

  public abstract void setTglLhr(String tglLhr);

  public abstract void setAktaLhr(java.math.BigDecimal aktaLhr);

  public abstract void setNoAktaLhr(String noAktaLhr);

  public abstract void setGolDrh(java.math.BigDecimal golDrh);

  public abstract void setAgama(String agama);

  public abstract void setStatKwn(java.math.BigDecimal statKwn);

  public abstract void setAktaKwn(java.math.BigDecimal aktaKwn);

  public abstract void setNoAktaKwn(String noAktaKwn);

  public abstract void setTglKwn(String tglKwn);

  public abstract void setAktaCrai(java.math.BigDecimal aktaCrai);

  public abstract void setNoAktaCrai(String noAktaCrai);

  public abstract void setTglCrai(String tglCrai);

  public abstract void setStatHbkel(java.math.BigDecimal statHbkel);

  public abstract void setKlainFsk(java.math.BigDecimal klainFsk);

  public abstract void setPnydngCct(java.math.BigDecimal pnydngCct);

  public abstract void setPddkAkh(java.math.BigDecimal pddkAkh);

  public abstract void setJenisPkrjn(java.math.BigDecimal jenisPkrjn);

  public abstract void setNikIbu(java.math.BigDecimal nikIbu);

  public abstract void setNamaLgkpIbu(String namaLgkpIbu);

  public abstract void setNikAyah(java.math.BigDecimal nikAyah);

  public abstract void setNamaLgkpAyah(String namaLgkpAyah);

  public abstract void setNamaKetRt(String namaKetRt);

  public abstract void setNamaKetRw(String namaKetRw);

  public abstract void setNamaPetReg(String namaPetReg);

  public abstract void setNipPetReg(java.math.BigDecimal nipPetReg);

  public abstract void setNamaPetEntri(String namaPetEntri);

  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);

  public abstract void setTglEntri(String tglEntri);

  public abstract void setNoKk(java.math.BigDecimal noKk);

  public abstract void setJenisBntu(java.math.BigDecimal jenisBntu);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setNoKec(java.math.BigDecimal noKec);

  public abstract void setNoKel(java.math.BigDecimal noKel);

  public abstract void setStatHidup(java.math.BigDecimal statHidup);

  public abstract void setTglUbah(String tglUbah);

  public abstract void setTglCetakKtp(String tglCetakKtp);

  public abstract void setTglGantiKtp(String tglGantiKtp);

  public abstract void setTglPjgKtp(String tglPjgKtp);

  public abstract void setStatKtp(java.math.BigDecimal statKtp);

  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);

  public abstract void setPflag(String pflag);

  public abstract void setCflag(String cflag);

  public abstract java.math.BigDecimal getNik();

  public abstract String getNoKtp();

  public abstract String getTmptSbl();

  public abstract String getNoPaspor();

  public abstract String getTglAkhPaspor();

  public abstract String getNamaLgkp();

  public abstract java.math.BigDecimal getJenisKlmin();

  public abstract String getTmptLhr();

  public abstract String getTglLhr();

  public abstract java.math.BigDecimal getAktaLhr();

  public abstract String getNoAktaLhr();

  public abstract java.math.BigDecimal getGolDrh();

  public abstract String getAgama();

  public abstract java.math.BigDecimal getStatKwn();

  public abstract java.math.BigDecimal getAktaKwn();

  public abstract String getNoAktaKwn();

  public abstract String getTglKwn();

  public abstract java.math.BigDecimal getAktaCrai();

  public abstract String getNoAktaCrai();

  public abstract String getTglCrai();

  public abstract java.math.BigDecimal getStatHbkel();

  public abstract java.math.BigDecimal getKlainFsk();

  public abstract java.math.BigDecimal getPnydngCct();

  public abstract java.math.BigDecimal getPddkAkh();

  public abstract java.math.BigDecimal getJenisPkrjn();

  public abstract java.math.BigDecimal getNikIbu();

  public abstract String getNamaLgkpIbu();

  public abstract java.math.BigDecimal getNikAyah();

  public abstract String getNamaLgkpAyah();

  public abstract String getNamaKetRt();

  public abstract String getNamaKetRw();

  public abstract String getNamaPetReg();

  public abstract java.math.BigDecimal getNipPetReg();

  public abstract String getNamaPetEntri();

  public abstract java.math.BigDecimal getNipPetEntri();

  public abstract String getTglEntri();

  public abstract java.math.BigDecimal getNoKk();

  public abstract java.math.BigDecimal getJenisBntu();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.math.BigDecimal getNoKec();

  public abstract java.math.BigDecimal getNoKel();

  public abstract java.math.BigDecimal getStatHidup();

  public abstract String getTglUbah();

  public abstract String getTglCetakKtp();

  public abstract String getTglGantiKtp();

  public abstract String getTglPjgKtp();

  public abstract java.math.BigDecimal getStatKtp();

  public abstract java.math.BigDecimal getAlsNumpang();

  public abstract String getPflag();

  public abstract String getCflag();

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

  public pendaftaran.BiodataWniDetailBean getDetailBean() {
    BiodataWniDetailBean bean = new BiodataWniDetailBean(
        getNik(), getNoKtp(), getTmptSbl(), getNoPaspor(), getTglAkhPaspor(),
        getNamaLgkp(), getJenisKlmin(), getTmptLhr(), getTglLhr(), getAktaLhr(),
        getNoAktaLhr(), getGolDrh(), getAgama(), getStatKwn(), getAktaKwn(),
        getNoAktaKwn(), getTglKwn(), getAktaCrai(), getNoAktaCrai(), getTglCrai(),
        getStatHbkel(), getKlainFsk(), getPnydngCct(), getPddkAkh(),
        getJenisPkrjn(),
        getNikIbu(), getNamaLgkpIbu(), getNikAyah(), getNamaLgkpAyah(),
        getNamaKetRt(),
        getNamaKetRw(), getNamaPetReg(), getNipPetReg(), getNamaPetEntri(),
        getNipPetEntri(),
        getTglEntri(), getNoKk(), getJenisBntu(), getNoProp(), getNoKab(),
        getNoKec(), getNoKel(), getStatHidup(), getTglUbah(), getTglCetakKtp(),
        getTglGantiKtp(), getTglPjgKtp(), getStatKtp(), getAlsNumpang(),
        getPflag(),
        getCflag());
    return bean;
  }

  public void unsetEntityContext() {
    this.entityContext = null;
  }
  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }

}