package pendaftaran;

import java.math.*;

public interface BiodataMati
    extends javax.ejb.EJBLocalObject {
  public BigDecimal getNik();

  public void setWnJenazah(BigDecimal wnJenazah);

  public BigDecimal getWnJenazah();

  public void setNoKtp(String noKtp);

  public String getNoKtp();

  public void setTmptSbl(String tmptSbl);

  public String getTmptSbl();

  public void setNamaLgkp(String namaLgkp);

  public String getNamaLgkp();

  public void setNamaKlrga(String namaKlrga);

  public String getNamaKlrga();

  public void setJenisKlmin(BigDecimal jenisKlmin);

  public BigDecimal getJenisKlmin();

  public void setTmptLhr(String tmptLhr);

  public String getTmptLhr();

  public void setTglLhr(String tglLhr);

  public String getTglLhr();

  public void setAlamatJenazah(String alamatJenazah);

  public String getAlamatJenazah();

  public void setNoRtJenazah(BigDecimal noRtJenazah);

  public BigDecimal getNoRtJenazah();

  public void setNoRwJenazah(BigDecimal noRwJenazah);

  public BigDecimal getNoRwJenazah();

  public void setDusunJenazah(String dusunJenazah);

  public String getDusunJenazah();

  public void setKodePos(BigDecimal kodePos);

  public BigDecimal getKodePos();

  public void setTelp(String telp);

  public String getTelp();

  public void setKwrngrn(String kwrngrn);

  public String getKwrngrn();

  public void setAktaLhr(BigDecimal aktaLhr);

  public BigDecimal getAktaLhr();

  public void setNoAktaLhr(String noAktaLhr);

  public String getNoAktaLhr();

  public void setGolDrh(BigDecimal golDrh);

  public BigDecimal getGolDrh();

  public void setAgama(String agama);

  public String getAgama();

  public void setStatKwn(BigDecimal statKwn);

  public BigDecimal getStatKwn();

  public void setAktaKwn(BigDecimal aktaKwn);

  public BigDecimal getAktaKwn();

  public void setNoAktaKwn(String noAktaKwn);

  public String getNoAktaKwn();

  public void setTglKwn(String tglKwn);

  public String getTglKwn();

  public void setAktaCrai(BigDecimal aktaCrai);

  public BigDecimal getAktaCrai();

  public void setNoAktaCrai(String noAktaCrai);

  public String getNoAktaCrai();

  public void setTglCrai(String tglCrai);

  public String getTglCrai();

  public void setStatHbkel(BigDecimal statHbkel);

  public BigDecimal getStatHbkel();

  public void setKlainFsk(BigDecimal klainFsk);

  public BigDecimal getKlainFsk();

  public void setPnydngCct(BigDecimal pnydngCct);

  public BigDecimal getPnydngCct();

  public void setPddkAkh(BigDecimal pddkAkh);

  public BigDecimal getPddkAkh();

  public void setJenisPkrjn(BigDecimal jenisPkrjn);

  public BigDecimal getJenisPkrjn();

  public void setNikIbu(BigDecimal nikIbu);

  public BigDecimal getNikIbu();

  public void setNamaLgkpIbu(String namaLgkpIbu);

  public String getNamaLgkpIbu();

  public void setNikAyah(BigDecimal nikAyah);

  public BigDecimal getNikAyah();

  public void setNamaLgkpAyah(String namaLgkpAyah);

  public String getNamaLgkpAyah();

  public void setNamaKetRt(String namaKetRt);

  public String getNamaKetRt();

  public void setNamaKetRw(String namaKetRw);

  public String getNamaKetRw();

  public void setNamaPetReg(String namaPetReg);

  public String getNamaPetReg();

  public void setNipPetReg(BigDecimal nipPetReg);

  public BigDecimal getNipPetReg();

  public void setNamaPetEntri(String namaPetEntri);

  public String getNamaPetEntri();

  public void setNipPetEntri(BigDecimal nipPetEntri);

  public BigDecimal getNipPetEntri();

  public void setTglEntri(String tglEntri);

  public String getTglEntri();

  public void setNoKk(BigDecimal noKk);

  public BigDecimal getNoKk();

  public void setJenisBntu(BigDecimal jenisBntu);

  public BigDecimal getJenisBntu();

  public void setNoProp(BigDecimal noProp);

  public BigDecimal getNoProp();

  public void setNoKab(BigDecimal noKab);

  public BigDecimal getNoKab();

  public void setNoKec(BigDecimal noKec);

  public BigDecimal getNoKec();

  public void setNoKel(BigDecimal noKel);

  public BigDecimal getNoKel();

  public void setStatHidup(BigDecimal statHidup);

  public BigDecimal getStatHidup();

  public void setTglUbah(String tglUbah);

  public String getTglUbah();

  public void setTglCetakKtp(String tglCetakKtp);

  public String getTglCetakKtp();

  public void setTglGantiKtp(String tglGantiKtp);

  public String getTglGantiKtp();

  public void setTglPjgKtp(String tglPjgKtp);

  public String getTglPjgKtp();

  public void setStatKtp(BigDecimal statKtp);

  public BigDecimal getStatKtp();

  public void setAlsNumpang(BigDecimal alsNumpang);

  public BigDecimal getAlsNumpang();

  public void setAlamatSpsor(String alamatSpsor);

  public String getAlamatSpsor();

  public void setNoRtSpsor(BigDecimal noRtSpsor);

  public BigDecimal getNoRtSpsor();

  public void setNoRwSpsor(BigDecimal noRwSpsor);

  public BigDecimal getNoRwSpsor();

  public void setKodeposSpsor(BigDecimal kodeposSpsor);

  public BigDecimal getKodeposSpsor();

  public void setTeleponSpsor(String teleponSpsor);

  public String getTeleponSpsor();

  public void setDatngDari(String datngDari);

  public String getDatngDari();

  public void setTujuanDtng(String tujuanDtng);

  public String getTujuanDtng();

  public void setNoPaspor(String noPaspor);

  public String getNoPaspor();

  public void setTglPaspor(String tglPaspor);

  public String getTglPaspor();

  public void setTglAkhPaspor(String tglAkhPaspor);

  public String getTglAkhPaspor();

  public void setNamaSpsor(String namaSpsor);

  public String getNamaSpsor();

  public void setTipeSpsor(BigDecimal tipeSpsor);

  public BigDecimal getTipeSpsor();

  public void setDokImgr(BigDecimal dokImgr);

  public BigDecimal getDokImgr();

  public void setNoDok(String noDok);

  public String getNoDok();

  public void setTmptDtbit(String tmptDtbit);

  public String getTmptDtbit();

  public void setTglDtbit(String tglDtbit);

  public String getTglDtbit();

  public void setTglAkhDok(String tglAkhDok);

  public String getTglAkhDok();

  public void setTmptDtngPert(String tmptDtngPert);

  public String getTmptDtngPert();

  public void setTglDtngPert(String tglDtngPert);

  public String getTglDtngPert();

  public void setNoStld(String noStld);

  public String getNoStld();

  public void setTglDft(String tglDft);

  public String getTglDft();

  public void setNamaDin(String namaDin);

  public String getNamaDin();

  public void setNamaKepDin(String namaKepDin);

  public String getNamaKepDin();

  public void setNipKepDin(BigDecimal nipKepDin);

  public BigDecimal getNipKepDin();

  public void setPflag(String pflag);

  public String getPflag();

  public void setCflag(String cflag);

  public String getCflag();
}