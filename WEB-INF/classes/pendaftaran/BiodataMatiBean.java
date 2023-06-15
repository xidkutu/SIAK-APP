package pendaftaran;

import java.math.*;
import javax.ejb.*;

abstract public class BiodataMatiBean
    implements EntityBean {
  EntityContext entityContext;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws
      CreateException {
    setNik(nik);
    return null;
  }

  private boolean getParseValue(String data) {
    if (data != null && (!data.trim().equals("")) &&
        (!data.trim().equals("null")) && (!data.trim().equals("0"))) {
      return true;
    }
    return false;
  }

  private boolean getParseValue(BigDecimal data) {
    if (data != null && (!data.toString().trim().equals("")) &&
        (!data.toString().trim().equals("null")) &&
        (!data.toString().trim().equals("0"))) {
      return true;
    }
    return false;
  }

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik,
                                        java.math.BigDecimal wnJenazah,
                                        String noKtp,
                                        String tmptSbl, String namaLgkp,
                                        String namaKlrga,
                                        java.math.BigDecimal jenisKlmin,
                                        String tmptLhr, String tglLhr,
                                        String alamatJenazah,
                                        java.math.BigDecimal noRtJenazah,
                                        java.math.BigDecimal noRwJenazah,
                                        String dusunJenazah,
                                        java.math.BigDecimal kodePos,
                                        String telp, String kwrngrn,
                                        java.math.BigDecimal aktaLhr,
                                        String noAktaLhr,
                                        java.math.BigDecimal golDrh,
                                        String agama,
                                        java.math.BigDecimal statKwn,
                                        java.math.BigDecimal aktaKwn,
                                        String noAktaKwn,
                                        String tglKwn,
                                        java.math.BigDecimal aktaCrai,
                                        String noAktaCrai, String tglCrai,
                                        java.math.BigDecimal statHbkel,
                                        java.math.BigDecimal klainFsk,
                                        java.math.BigDecimal pnydngCct,
                                        java.math.BigDecimal pddkAkh,
                                        java.math.BigDecimal jenisPkrjn,
                                        java.math.BigDecimal nikIbu,
                                        String namaLgkpIbu,
                                        java.math.BigDecimal nikAyah,
                                        String namaLgkpAyah,
                                        String namaKetRt, String namaKetRw,
                                        String namaPetReg,
                                        java.math.BigDecimal nipPetReg,
                                        String namaPetEntri,
                                        java.math.BigDecimal nipPetEntri,
                                        String tglEntri,
                                        java.math.BigDecimal noKk,
                                        java.math.BigDecimal jenisBntu,
                                        java.math.BigDecimal noProp,
                                        java.math.BigDecimal noKab,
                                        java.math.BigDecimal noKec,
                                        java.math.BigDecimal noKel,
                                        java.math.BigDecimal statHidup,
                                        String tglUbah,
                                        String tglCetakKtp, String tglGantiKtp,
                                        String tglPjgKtp,
                                        java.math.BigDecimal statKtp,
                                        java.math.BigDecimal alsNumpang,
                                        String alamatSpsor,
                                        java.math.BigDecimal noRtSpsor,
                                        java.math.BigDecimal noRwSpsor,
                                        java.math.BigDecimal kodeposSpsor,
                                        String teleponSpsor, String datngDari,
                                        String tujuanDtng,
                                        String noPaspor, String tglPaspor,
                                        String tglAkhPaspor,
                                        String namaSpsor,
                                        java.math.BigDecimal tipeSpsor,
                                        java.math.BigDecimal dokImgr,
                                        String noDok, String tmptDtbit,
                                        String tglDtbit, String tglAkhDok,
                                        String tmptDtngPert, String tglDtngPert,
                                        String noStld, String tglDft,
                                        String namaDin, String namaKepDin,
                                        java.math.BigDecimal nipKepDin,
                                        String pflag,
                                        String cflag) throws CreateException {
    System.out.println("STEP 1");
    if (getParseValue(nik)) {
      setNik(nik);
      System.out.println("STEP 2");
    }

    if (getParseValue(wnJenazah)) {
      setWnJenazah(wnJenazah);
      System.out.println("STEP 3");
    }

    if (getParseValue(noKtp)) {
      setNoKtp(noKtp.trim());
      System.out.println("STEP 4");
    }

    if (getParseValue(tmptSbl)) {
      setTmptSbl(tmptSbl.trim());
      System.out.println("STEP 5");
    }
    if (getParseValue(namaLgkp)) {
      setNamaLgkp(namaLgkp.trim());
      System.out.println("STEP 6");
    }

    if (getParseValue(namaKlrga)) {
      setNamaKlrga(namaKlrga.trim());
      System.out.println("STEP 7");
    }
    if (getParseValue(jenisKlmin)) {
      setJenisKlmin(jenisKlmin);
      System.out.println("STEP 8");
    }
    if (getParseValue(tmptLhr)) {
      setTmptLhr(tmptLhr.trim());
      System.out.println("STEP 9");
    }
    if (getParseValue(tglLhr)) {
      setTglLhr(tglLhr.trim());
      System.out.println("STEP 10");
    }

    if (getParseValue(alamatJenazah)) {
      setAlamatJenazah(alamatJenazah.trim());
      System.out.println("STEP 11");
    }
    if (getParseValue(noRtJenazah)) {
      setNoRtJenazah(noRtJenazah);
      System.out.println("STEP 12");
    }
    if (getParseValue(noRwJenazah)) {
      setNoRwJenazah(noRwJenazah);
      System.out.println("STEP 13");
    }
    if (getParseValue(dusunJenazah)) {
      setDusunJenazah(dusunJenazah.trim());
      System.out.println("STEP 14");
    }
    if (getParseValue(kodePos)) {
      setKodePos(kodePos);
      System.out.println("STEP 15");
    }
    if (getParseValue(telp)) {
      setTelp(telp.trim());
      System.out.println("STEP 16");
    }
    if (getParseValue(kwrngrn)) {
      setKwrngrn(kwrngrn);
      System.out.println("STEP 17");
    }
    if (getParseValue(aktaLhr)) {
      setAktaLhr(aktaLhr);
      System.out.println("STEP 18");
    }
    if (getParseValue(noAktaLhr)) {
      setNoAktaLhr(noAktaLhr.trim());
      System.out.println("STEP 19");
    }
    if (getParseValue(golDrh)) {
      setGolDrh(golDrh);
      System.out.println("STEP 20");
    }
    if (getParseValue(agama)) {
      setAgama(agama.trim());
      System.out.println("STEP 21");
    }
    if (getParseValue(statKwn)) {
      setStatKwn(statKwn);
      System.out.println("STEP 22");
    }
    if (getParseValue(aktaKwn)) {
      setAktaKwn(aktaKwn);
      System.out.println("STEP 23");
    }
    if (getParseValue(noAktaKwn)) {
      setNoAktaKwn(noAktaKwn.trim());
      System.out.println("STEP 24");
    }
    if (getParseValue(tglKwn)) {
      setTglKwn(tglKwn.trim());
      System.out.println("STEP 25");
    }
    if (getParseValue(aktaCrai)) {
      setAktaCrai(aktaCrai);
      System.out.println("STEP 26");
    }
    if (getParseValue(noAktaCrai)) {
      setNoAktaCrai(noAktaCrai.trim());
      System.out.println("STEP 27");
    }
    if (getParseValue(tglCrai)) {
      setTglCrai(tglCrai.trim());
      System.out.println("STEP 28");
    }
    if (getParseValue(statHbkel)) {
      setStatHbkel(statHbkel);
      System.out.println("STEP 29");
    }
    if (getParseValue(klainFsk)) {
      setKlainFsk(klainFsk);
      System.out.println("STEP 30");
    }
    if (getParseValue(pnydngCct)) {
      setPnydngCct(pnydngCct);
      System.out.println("STEP 31");
    }
    if (getParseValue(pddkAkh)) {
      setPddkAkh(pddkAkh);
      System.out.println("STEP 32");
    }
    if (getParseValue(jenisPkrjn)) {
      setJenisPkrjn(jenisPkrjn);
      System.out.println("STEP 33");
    }
    if (getParseValue(nikIbu)) {
      setNikIbu(nikIbu);
      System.out.println("STEP 34");
    }
    if (getParseValue(namaLgkpIbu)) {
      setNamaLgkpIbu(namaLgkpIbu.trim());
      System.out.println("STEP 35");
    }
    if (getParseValue(nikAyah)) {
      setNikAyah(nikAyah);
      System.out.println("STEP 36");
    }
    if (getParseValue(namaLgkpAyah)) {
      setNamaLgkpAyah(namaLgkpAyah.trim());
      System.out.println("STEP 37");
    }
    if (getParseValue(namaKetRt)) {
      setNamaKetRt(namaKetRt.trim());
      System.out.println("STEP 38");
    }
    if (getParseValue(namaKetRw)) {
      setNamaKetRw(namaKetRw.trim());
      System.out.println("STEP 39");
    }
    if (getParseValue(namaPetReg)) {
      setNamaPetReg(namaPetReg.trim());
      System.out.println("STEP 40");
    }
    if (getParseValue(nipPetReg)) {
      setNipPetReg(nipPetReg);
      System.out.println("STEP 41");
    }
    if (getParseValue(namaPetEntri)) {
      setNamaPetEntri(namaPetEntri.trim());
      System.out.println("STEP 42");
    }
    if (getParseValue(nipPetEntri)) {
      setNipPetEntri(nipPetEntri);
      System.out.println("STEP 43");
    }
    if (getParseValue(tglEntri)) {
      setTglEntri(tglEntri.trim());
      System.out.println("STEP 44");
    }
    if (getParseValue(noKk)) {
      setNoKk(noKk);
      System.out.println("STEP 45");
    }
    if (getParseValue(jenisBntu)) {
      setJenisBntu(jenisBntu);
      System.out.println("STEP 46");
    }
    if (getParseValue(noProp)) {
      setNoProp(noProp);
      System.out.println("STEP 47");
    }
    if (getParseValue(noKab)) {
      setNoKab(noKab);
      System.out.println("STEP 48");
    }
    if (getParseValue(noKec)) {
      setNoKec(noKec);
      System.out.println("STEP 49");
    }
    if (getParseValue(noKel)) {
      setNoKel(noKel);
      System.out.println("STEP 50");
    }
    if (getParseValue(statHidup)) {
      setStatHidup(statHidup);
      System.out.println("STEP 51");
    }
    if (getParseValue(tglUbah)) {
      setTglUbah(tglUbah.trim());
      System.out.println("STEP 52");
    }
    if (getParseValue(tglCetakKtp)) {
      setTglCetakKtp(tglCetakKtp.trim());
      System.out.println("STEP 53");
    }
    if (getParseValue(tglGantiKtp)) {
      setTglGantiKtp(tglGantiKtp.trim());
      System.out.println("STEP 54");
    }
    if (getParseValue(statKtp)) {
      setStatKtp(statKtp);
      System.out.println("STEP 55");
    }
    if (getParseValue(alsNumpang)) {
      setAlsNumpang(alsNumpang);
      System.out.println("STEP 56");
    }
    if (getParseValue(alamatSpsor)) {
      setAlamatSpsor(alamatSpsor.trim());
      System.out.println("STEP 57");
    }
    if (getParseValue(noRtSpsor)) {
      setNoRtSpsor(noRtSpsor);
      System.out.println("STEP 58");
    }
    if (getParseValue(noRwSpsor)) {
      setNoRwSpsor(noRwSpsor);
      System.out.println("STEP 59");
    }
    if (getParseValue(kodeposSpsor)) {
      setKodeposSpsor(kodeposSpsor);
      System.out.println("STEP 60");
    }
    if (getParseValue(teleponSpsor)) {
      setTeleponSpsor(teleponSpsor.trim());
      System.out.println("STEP 61");
    }
    if (getParseValue(datngDari)) {
      setDatngDari(datngDari.trim());
      System.out.println("STEP 62");
    }
    if (getParseValue(tujuanDtng)) {
      setTujuanDtng(tujuanDtng.trim());
      System.out.println("STEP 63");
    }
    if (getParseValue(noPaspor)) {
      setNoPaspor(noPaspor.trim());
      System.out.println("STEP 64");
    }
    if (getParseValue(tglPaspor)) {
      setTglPaspor(tglPaspor.trim());
      System.out.println("STEP 65");
    }
    if (getParseValue(tglAkhPaspor)) {
      setTglAkhPaspor(tglAkhPaspor.trim());
      System.out.println("STEP 66");
    }
    if (getParseValue(namaSpsor)) {
      setNamaSpsor(namaSpsor.trim());
      System.out.println("STEP 67");
    }
    if (getParseValue(tipeSpsor)) {
      setTipeSpsor(tipeSpsor);
      System.out.println("STEP 68");
    }
    if (getParseValue(dokImgr)) {
      setDokImgr(dokImgr);
      System.out.println("STEP 69");
    }
    if (getParseValue(noDok)) {
      setNoDok(noDok.trim());
      System.out.println("STEP 70");
    }
    if (getParseValue(tmptDtbit)) {
      setTmptDtbit(tmptDtbit.trim());
      System.out.println("STEP 71");
    }
    if (getParseValue(tglDtbit)) {
      setTglDtbit(tglDtbit.trim());
      System.out.println("STEP 72");
    }
    if (getParseValue(tglAkhDok)) {
      setTglAkhDok(tglAkhDok.trim());
      System.out.println("STEP 73");
    }
    if (getParseValue(tmptDtngPert)) {
      setTmptDtngPert(tmptDtngPert.trim());
      System.out.println("STEP 74");
    }
    if (getParseValue(tglDtngPert)) {
      setTglDtngPert(tglDtngPert.trim());
      System.out.println("STEP 75");
    }
    if (getParseValue(noStld)) {
      setNoStld(noStld.trim());
      System.out.println("STEP 76");
    }
    if (getParseValue(tglDft)) {
      setTglDft(tglDft.trim());
      System.out.println("STEP 77");
    }
    if (getParseValue(namaDin)) {
      setNamaDin(namaDin.trim());
      System.out.println("STEP 78");
    }
    if (getParseValue(namaKepDin)) {
      setNamaKepDin(namaKepDin.trim());
      System.out.println("STEP 79");
    }
    if (getParseValue(nipKepDin)) {
      setNipKepDin(nipKepDin);
      System.out.println("STEP 80");
    }
    if (getParseValue(pflag)) {
      setPflag(pflag.trim());
      System.out.println("STEP 81");
    }
    if (getParseValue(cflag)) {
      setCflag(cflag.trim());
      System.out.println("STEP 82");
    }
    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(java.math.BigDecimal nik,
                            java.math.BigDecimal wnJenazah, String noKtp,
                            String tmptSbl, String namaLgkp, String namaKlrga,
                            java.math.BigDecimal jenisKlmin, String tmptLhr,
                            String tglLhr, String alamatJenazah,
                            java.math.BigDecimal noRtJenazah,
                            java.math.BigDecimal noRwJenazah,
                            String dusunJenazah, java.math.BigDecimal kodePos,
                            String telp, String kwrngrn,
                            java.math.BigDecimal aktaLhr, String noAktaLhr,
                            java.math.BigDecimal golDrh, String agama,
                            java.math.BigDecimal statKwn,
                            java.math.BigDecimal aktaKwn, String noAktaKwn,
                            String tglKwn, java.math.BigDecimal aktaCrai,
                            String noAktaCrai, String tglCrai,
                            java.math.BigDecimal statHbkel,
                            java.math.BigDecimal klainFsk,
                            java.math.BigDecimal pnydngCct,
                            java.math.BigDecimal pddkAkh,
                            java.math.BigDecimal jenisPkrjn,
                            java.math.BigDecimal nikIbu, String namaLgkpIbu,
                            java.math.BigDecimal nikAyah, String namaLgkpAyah,
                            String namaKetRt, String namaKetRw,
                            String namaPetReg, java.math.BigDecimal nipPetReg,
                            String namaPetEntri,
                            java.math.BigDecimal nipPetEntri
                            , String tglEntri, java.math.BigDecimal noKk,
                            java.math.BigDecimal jenisBntu,
                            java.math.BigDecimal noProp,
                            java.math.BigDecimal noKab,
                            java.math.BigDecimal noKec,
                            java.math.BigDecimal noKel,
                            java.math.BigDecimal statHidup, String tglUbah,
                            String tglCetakKtp, String tglGantiKtp,
                            String tglPjgKtp, java.math.BigDecimal statKtp,
                            java.math.BigDecimal alsNumpang, String alamatSpsor,
                            java.math.BigDecimal noRtSpsor,
                            java.math.BigDecimal noRwSpsor,
                            java.math.BigDecimal kodeposSpsor,
                            String teleponSpsor, String datngDari,
                            String tujuanDtng, String noPaspor,
                            String tglPaspor, String tglAkhPaspor,
                            String namaSpsor, java.math.BigDecimal tipeSpsor,
                            java.math.BigDecimal dokImgr, String noDok,
                            String tmptDtbit, String tglDtbit, String tglAkhDok,
                            String tmptDtngPert, String tglDtngPert,
                            String noStld, String tglDft, String namaDin,
                            String namaKepDin, java.math.BigDecimal nipKepDin,
                            String pflag, String cflag) throws CreateException
      /**@todo Complete this method*/{
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNik(java.math.BigDecimal nik);

  public abstract void setWnJenazah(java.math.BigDecimal wnJenazah);

  public abstract void setNoKtp(String noKtp);

  public abstract void setTmptSbl(String tmptSbl);

  public abstract void setNamaLgkp(String namaLgkp);

  public abstract void setNamaKlrga(String namaKlrga);

  public abstract void setJenisKlmin(java.math.BigDecimal jenisKlmin);

  public abstract void setTmptLhr(String tmptLhr);

  public abstract void setTglLhr(String tglLhr);

  public abstract void setAlamatJenazah(String alamatJenazah);

  public abstract void setNoRtJenazah(java.math.BigDecimal noRtJenazah);

  public abstract void setNoRwJenazah(java.math.BigDecimal noRwJenazah);

  public abstract void setDusunJenazah(String dusunJenazah);

  public abstract void setKodePos(java.math.BigDecimal kodePos);

  public abstract void setTelp(String telp);

  public abstract void setKwrngrn(String kwrngrn);

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

  public abstract void setAlamatSpsor(String alamatSpsor);

  public abstract void setNoRtSpsor(java.math.BigDecimal noRtSpsor);

  public abstract void setNoRwSpsor(java.math.BigDecimal noRwSpsor);

  public abstract void setKodeposSpsor(java.math.BigDecimal kodeposSpsor);

  public abstract void setTeleponSpsor(String teleponSpsor);

  public abstract void setDatngDari(String datngDari);

  public abstract void setTujuanDtng(String tujuanDtng);

  public abstract void setNoPaspor(String noPaspor);

  public abstract void setTglPaspor(String tglPaspor);

  public abstract void setTglAkhPaspor(String tglAkhPaspor);

  public abstract void setNamaSpsor(String namaSpsor);

  public abstract void setTipeSpsor(java.math.BigDecimal tipeSpsor);

  public abstract void setDokImgr(java.math.BigDecimal dokImgr);

  public abstract void setNoDok(String noDok);

  public abstract void setTmptDtbit(String tmptDtbit);

  public abstract void setTglDtbit(String tglDtbit);

  public abstract void setTglAkhDok(String tglAkhDok);

  public abstract void setTmptDtngPert(String tmptDtngPert);

  public abstract void setTglDtngPert(String tglDtngPert);

  public abstract void setNoStld(String noStld);

  public abstract void setTglDft(String tglDft);

  public abstract void setNamaDin(String namaDin);

  public abstract void setNamaKepDin(String namaKepDin);

  public abstract void setNipKepDin(java.math.BigDecimal nipKepDin);

  public abstract void setPflag(String pflag);

  public abstract void setCflag(String cflag);

  public abstract java.math.BigDecimal getNik();

  public abstract java.math.BigDecimal getWnJenazah();

  public abstract String getNoKtp();

  public abstract String getTmptSbl();

  public abstract String getNamaLgkp();

  public abstract String getNamaKlrga();

  public abstract java.math.BigDecimal getJenisKlmin();

  public abstract String getTmptLhr();

  public abstract String getTglLhr();

  public abstract String getAlamatJenazah();

  public abstract java.math.BigDecimal getNoRtJenazah();

  public abstract java.math.BigDecimal getNoRwJenazah();

  public abstract String getDusunJenazah();

  public abstract java.math.BigDecimal getKodePos();

  public abstract String getTelp();

  public abstract String getKwrngrn();

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

  public abstract String getAlamatSpsor();

  public abstract java.math.BigDecimal getNoRtSpsor();

  public abstract java.math.BigDecimal getNoRwSpsor();

  public abstract java.math.BigDecimal getKodeposSpsor();

  public abstract String getTeleponSpsor();

  public abstract String getDatngDari();

  public abstract String getTujuanDtng();

  public abstract String getNoPaspor();

  public abstract String getTglPaspor();

  public abstract String getTglAkhPaspor();

  public abstract String getNamaSpsor();

  public abstract java.math.BigDecimal getTipeSpsor();

  public abstract java.math.BigDecimal getDokImgr();

  public abstract String getNoDok();

  public abstract String getTmptDtbit();

  public abstract String getTglDtbit();

  public abstract String getTglAkhDok();

  public abstract String getTmptDtngPert();

  public abstract String getTglDtngPert();

  public abstract String getNoStld();

  public abstract String getTglDft();

  public abstract String getNamaDin();

  public abstract String getNamaKepDin();

  public abstract java.math.BigDecimal getNipKepDin();

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

  public void unsetEntityContext() {
    this.entityContext = null;
  }

  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
}