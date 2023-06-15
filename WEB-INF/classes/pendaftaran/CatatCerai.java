package pendaftaran;

import java.math.*;

public interface CatatCerai
    extends javax.ejb.EJBLocalObject {
  public void setNikSuami(BigDecimal nikSuami);

  public BigDecimal getNikSuami();

  public void setKwrngrnSuami(BigDecimal kwrngrnSuami);

  public BigDecimal getKwrngrnSuami();

  public void setKtrunanSuami(BigDecimal ktrunanSuami);

  public BigDecimal getKtrunanSuami();

  public void setStatKwnSblmNkhSuami(BigDecimal statKwnSblmNkhSuami);

  public BigDecimal getStatKwnSblmNkhSuami();

  public void setCraiKe(BigDecimal craiKe);

  public BigDecimal getCraiKe();

  public void setKwnKeSuami(BigDecimal kwnKeSuami);

  public BigDecimal getKwnKeSuami();

  public void setIstriKe(BigDecimal istriKe);

  public BigDecimal getIstriKe();

  public void setNikIstri(BigDecimal nikIstri);

  public BigDecimal getNikIstri();

  public void setKwrngrnIstri(BigDecimal kwrngrnIstri);

  public BigDecimal getKwrngrnIstri();

  public void setKtrunanIstri(BigDecimal ktrunanIstri);

  public BigDecimal getKtrunanIstri();

  public void setStatKwnSblmNkhIstri(BigDecimal statKwnSblmNkhIstri);

  public BigDecimal getStatKwnSblmNkhIstri();

  public void setKwnKeIstri(BigDecimal kwnKeIstri);

  public BigDecimal getKwnKeIstri();

  public void setJmlAnk(BigDecimal jmlAnk);

  public BigDecimal getJmlAnk();

  public void setYgBtgungPmelAnk(BigDecimal ygBtgungPmelAnk);

  public BigDecimal getYgBtgungPmelAnk();

  public void setYgAjuCrai(BigDecimal ygAjuCrai);

  public BigDecimal getYgAjuCrai();

  public void setNoAktaKwn(String noAktaKwn);

  public String getNoAktaKwn();

  public void setTglAktaKwn(String tglAktaKwn);

  public String getTglAktaKwn();

  public void setTmptCttKwn(String tmptCttKwn);

  public String getTmptCttKwn();

  public void setNoSrtKetPn(String noSrtKetPn);

  public String getNoSrtKetPn();

  public void setTglSrtKetPn(String tglSrtKetPn);

  public String getTglSrtKetPn();

  public void setNoKepPngadil(String noKepPngadil);

  public String getNoKepPngadil();

  public void setTglSrtKepPngadil(String tglSrtKepPngadil);

  public String getTglSrtKepPngadil();

  public void setLbgPngadilKelKep(String lbgPngadilKelKep);

  public String getLbgPngadilKelKep();

  public void setTmptLbgPngadil(String tmptLbgPngadil);

  public String getTmptLbgPngadil();

  public void setSbabCrai(BigDecimal sbabCrai);

  public BigDecimal getSbabCrai();

  public void setTglDraftCraiDrln(String tglDraftCraiDrln);

  public String getTglDraftCraiDrln();

  public void setDasarHkmCrai(BigDecimal dasarHkmCrai);

  public BigDecimal getDasarHkmCrai();

  public String getNoAktaCrai();

  public void setTglAktaCrai(String tglAktaCrai);

  public String getTglAktaCrai();

  public void setTglCtkKtakta(String tglCtkKtakta);

  public String getTglCtkKtakta();

  public void setNamaPetReg(String namaPetReg);

  public String getNamaPetReg();

  public void setNipPetReg(BigDecimal nipPetReg);

  public BigDecimal getNipPetReg();

  public void setTglEntri(String tglEntri);

  public String getTglEntri();

  public void setNoProp(BigDecimal noProp);

  public BigDecimal getNoProp();

  public void setNoKab(BigDecimal noKab);

  public BigDecimal getNoKab();

  public void setCflag(String cflag);

  public String getCflag();

  public void setPflag(String pflag);

  public String getPflag();

  public void setNikPlapor(BigDecimal nikPlapor);

  public BigDecimal getNikPlapor();

  public void setKwrngrnPlapor(BigDecimal kwrngrnPlapor);

  public BigDecimal getKwrngrnPlapor();

  public void setTglMlapor(String tglMlapor);

  public String getTglMlapor();
}