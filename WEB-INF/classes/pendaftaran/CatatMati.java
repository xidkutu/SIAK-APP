package pendaftaran;

import java.math.*;

public interface CatatMati
    extends javax.ejb.EJBLocalObject {
  public BigDecimal getNikJnsah();

  public void setKwrngrnJnsah(BigDecimal kwrngrnJnsah);

  public BigDecimal getKwrngrnJnsah();

  public void setKtrunanJnsah(BigDecimal ktrunanJnsah);

  public BigDecimal getKtrunanJnsah();

  public void setAnakKe(BigDecimal anakKe);

  public BigDecimal getAnakKe();

  public void setTglMati(String tglMati);

  public String getTglMati();

  public void setPukul(String pukul);

  public String getPukul();

  public void setWktPukul(BigDecimal wktPukul);

  public BigDecimal getWktPukul();

  public void setSbabMati(BigDecimal sbabMati);

  public BigDecimal getSbabMati();

  public void setTmptMati(String tmptMati);

  public String getTmptMati();

  public void setYgMnerang(BigDecimal ygMnerang);

  public BigDecimal getYgMnerang();

  public void setPnetapPn(String pnetapPn);

  public String getPnetapPn();

  public void setNoPnetap(String noPnetap);

  public String getNoPnetap();

  public void setTglPnetap(String tglPnetap);

  public String getTglPnetap();

  public void setNikIbu(BigDecimal nikIbu);

  public BigDecimal getNikIbu();

  public void setKwrngrnIbu(BigDecimal kwrngrnIbu);

  public BigDecimal getKwrngrnIbu();

  public void setNamaLgkpIbu(String namaLgkpIbu);

  public String getNamaLgkpIbu();

  public void setTglLhrIbu(String tglLhrIbu);

  public String getTglLhrIbu();

  public void setJenisPkrjnIbu(BigDecimal jenisPkrjnIbu);

  public BigDecimal getJenisPkrjnIbu();

  public void setAlamatIbu(String alamatIbu);

  public String getAlamatIbu();

  public void setNoRtIbu(BigDecimal noRtIbu);

  public BigDecimal getNoRtIbu();

  public void setNoRwIbu(BigDecimal noRwIbu);

  public BigDecimal getNoRwIbu();

  public void setDusunIbu(String dusunIbu);

  public String getDusunIbu();

  public void setKodeposIbu(BigDecimal kodeposIbu);

  public BigDecimal getKodeposIbu();

  public void setTelpIbu(String telpIbu);

  public String getTelpIbu();

  public void setNoPropIbu(String noPropIbu);

  public String getNoPropIbu();

  public void setNoKabIbu(String noKabIbu);

  public String getNoKabIbu();

  public void setNoKecIbu(String noKecIbu);

  public String getNoKecIbu();

  public void setNoKelIbu(String noKelIbu);

  public String getNoKelIbu();

  public void setNikAyh(BigDecimal nikAyh);

  public BigDecimal getNikAyh();

  public void setKwrngrnAyh(BigDecimal kwrngrnAyh);

  public BigDecimal getKwrngrnAyh();

  public void setNamaLgkpAyh(String namaLgkpAyh);

  public String getNamaLgkpAyh();

  public void setTglLhrAyh(String tglLhrAyh);

  public String getTglLhrAyh();

  public void setJenisPkrjnAyh(BigDecimal jenisPkrjnAyh);

  public BigDecimal getJenisPkrjnAyh();

  public void setAlamatAyh(String alamatAyh);

  public String getAlamatAyh();

  public void setNoRtAyh(BigDecimal noRtAyh);

  public BigDecimal getNoRtAyh();

  public void setDusunAyh(String dusunAyh);

  public String getDusunAyh();

  public void setNoRwAyh(BigDecimal noRwAyh);

  public BigDecimal getNoRwAyh();

  public void setKodeposAyh(BigDecimal kodeposAyh);

  public BigDecimal getKodeposAyh();

  public void setTelpAyh(String telpAyh);

  public String getTelpAyh();

  public void setNoPropAyh(String noPropAyh);

  public String getNoPropAyh();

  public void setNoKabAyh(String noKabAyh);

  public String getNoKabAyh();

  public void setNoKecAyh(String noKecAyh);

  public String getNoKecAyh();

  public void setNoKelAyh(String noKelAyh);

  public String getNoKelAyh();

  public void setNikPlpor(BigDecimal nikPlpor);

  public BigDecimal getNikPlpor();

  public void setKwrngrnPlpor(BigDecimal kwrngrnPlpor);

  public BigDecimal getKwrngrnPlpor();

  public void setTglMlpor(String tglMlpor);

  public String getTglMlpor();

  public void setNikSksi1(BigDecimal nikSksi1);

  public BigDecimal getNikSksi1();

  public void setKwrngrnSksi1(BigDecimal kwrngrnSksi1);

  public BigDecimal getKwrngrnSksi1();

  public void setNikSksi2(BigDecimal nikSksi2);

  public BigDecimal getNikSksi2();

  public void setKwrngrnSksi2(BigDecimal kwrngrnSksi2);

  public BigDecimal getKwrngrnSksi2();

  public void setJenisDftLhr(BigDecimal jenisDftLhr);

  public BigDecimal getJenisDftLhr();

  public void setDasarHkmMati(BigDecimal dasarHkmMati);

  public BigDecimal getDasarHkmMati();

  public void setPsyratanMt(String psyratanMt);

  public String getPsyratanMt();

  public void setNoAktaMati(String noAktaMati);

  public String getNoAktaMati();

  public void setTglAktaMati(String tglAktaMati);

  public String getTglAktaMati();

  public void setNamaKepDes(String namaKepDes);

  public String getNamaKepDes();

  public void setNipLrh(BigDecimal nipLrh);

  public BigDecimal getNipLrh();

  public void setNamaPetReg(String namaPetReg);

  public String getNamaPetReg();

  public void setNipPetReg(BigDecimal nipPetReg);

  public BigDecimal getNipPetReg();

  public void setTglCtkKtakta(String tglCtkKtakta);

  public String getTglCtkKtakta();

  public void setNamaPetEntri(String namaPetEntri);

  public String getNamaPetEntri();

  public void setNipPetEntri(BigDecimal nipPetEntri);

  public BigDecimal getNipPetEntri();

  public void setNoProp(BigDecimal noProp);

  public BigDecimal getNoProp();

  public void setNoKab(BigDecimal noKab);

  public BigDecimal getNoKab();

  public void setNoKec(BigDecimal noKec);

  public BigDecimal getNoKec();

  public void setNoKel(BigDecimal noKel);

  public BigDecimal getNoKel();

  public void setFlagKec(BigDecimal flagKec);

  public BigDecimal getFlagKec();

  public void setTglEntri(String tglEntri);

  public String getTglEntri();

  public void setTglUpdation(String tglUpdation);

  public String getTglUpdation();

  public void setUserId(BigDecimal userId);

  public BigDecimal getUserId();

  public void setCflag(String cflag);

  public String getCflag();

  public void setPflag(String pflag);

  public String getPflag();
}