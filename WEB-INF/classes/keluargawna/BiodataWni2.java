package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import java.sql.Date;

public interface BiodataWni2 extends javax.ejb.EJBLocalObject {
  public BigDecimal getNik();
  public void setNoKtp(String noKtp);
  public String getNoKtp();
  public void setTmptSbl(String tmptSbl);
  public String getTmptSbl();
  public void setNoPaspor(String noPaspor);
  public String getNoPaspor();
  public void setTglAkhPaspor(Date tglAkhPaspor);
  public Date getTglAkhPaspor();
  public void setNamaLgkp(String namaLgkp);
  public String getNamaLgkp();
  public void setJenisKlmin(BigDecimal jenisKlmin);
  public BigDecimal getJenisKlmin();
  public void setTmptLhr(String tmptLhr);
  public String getTmptLhr();
  public void setTglLhr(Date tglLhr);
  public Date getTglLhr();
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
  public void setTglKwn(Date tglKwn);
  public Date getTglKwn();
  public void setAktaCrai(BigDecimal aktaCrai);
  public BigDecimal getAktaCrai();
  public void setNoAktaCrai(String noAktaCrai);
  public String getNoAktaCrai();
  public void setTglCrai(Date tglCrai);
  public Date getTglCrai();
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
  public void setTglEntri(Date tglEntri);
  public Date getTglEntri();
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
  public void setTglUbah(Date tglUbah);
  public Date getTglUbah();
  public void setTglCetakKtp(Date tglCetakKtp);
  public Date getTglCetakKtp();
  public void setTglGantiKtp(Date tglGantiKtp);
  public Date getTglGantiKtp();
  public void setTglPjgKtp(Date tglPjgKtp);
  public Date getTglPjgKtp();
  public void setStatKtp(BigDecimal statKtp);
  public BigDecimal getStatKtp();
  public void setAlsNumpang(BigDecimal alsNumpang);
  public BigDecimal getAlsNumpang();
  public void setPflag(String pflag);
  public String getPflag();
  public void setCflag(String cflag);
  public String getCflag();
}