package pendaftaran;

import java.math.*;
import javax.ejb.*;
import java.util.*;

public interface CatatKawin
    extends javax.ejb.EJBLocalObject {
  public void setNikSuami(BigDecimal nikSuami);
  public BigDecimal getNikSuami();
  public void setKwrngrnSuami(BigDecimal kwrngrnSuami);
  public BigDecimal getKwrngrnSuami();
  public void setKtrunanSuami(BigDecimal ktrunanSuami);
  public BigDecimal getKtrunanSuami();
  public void setKwnKeSuami(BigDecimal kwnKeSuami);
  public BigDecimal getKwnKeSuami();
  public void setIstriKe(BigDecimal istriKe);
  public BigDecimal getIstriKe();
  public void setNikAyhDrSuami(BigDecimal nikAyhDrSuami);
  public BigDecimal getNikAyhDrSuami();
  public void setKwrngrnAyhSuami(BigDecimal kwrngrnAyhSuami);
  public BigDecimal getKwrngrnAyhSuami();
  public void setNamaAyhSuami(String namaAyhSuami);
  public String getNamaAyhSuami();
  public void setTglLhrAyhSuami(String tglLhrAyhSuami);
  public String getTglLhrAyhSuami();
  public void setJenisPkrjnAyhSuami(BigDecimal jenisPkrjnAyhSuami);
  public BigDecimal getJenisPkrjnAyhSuami();
  public void setAlamatAyhSuami(String alamatAyhSuami);
  public String getAlamatAyhSuami();
  public void setRtAyhSuami(BigDecimal rtAyhSuami);
  public BigDecimal getRtAyhSuami();
  public void setRwAyhSuami(BigDecimal rwAyhSuami);
  public BigDecimal getRwAyhSuami();
  public void setDusunAyhSuami(String dusunAyhSuami);
  public String getDusunAyhSuami();
  public void setKposAyhSuami(BigDecimal kposAyhSuami);
  public BigDecimal getKposAyhSuami();
  public void setTlpAyhSuami(String tlpAyhSuami);
  public String getTlpAyhSuami();
  public void setNoPropAyhSuami(String noPropAyhSuami);
  public String getNoPropAyhSuami();
  public void setNoKabAyhSuami(String noKabAyhSuami);
  public String getNoKabAyhSuami();
  public void setNoKecAyhSuami(String noKecAyhSuami);
  public String getNoKecAyhSuami();
  public void setNoKelAyhSuami(String noKelAyhSuami);
  public String getNoKelAyhSuami();
  public void setNikIbuDrSuami(BigDecimal nikIbuDrSuami);
  public BigDecimal getNikIbuDrSuami();
  public void setKwrngrnIbuSuami(BigDecimal kwrngrnIbuSuami);
  public BigDecimal getKwrngrnIbuSuami();
  public void setNamaIbuSuami(String namaIbuSuami);
  public String getNamaIbuSuami();
  public void setTglLhrIbuSuami(String tglLhrIbuSuami);
  public String getTglLhrIbuSuami();
  public void setJenisPkrjnIbuSuami(BigDecimal jenisPkrjnIbuSuami);
  public BigDecimal getJenisPkrjnIbuSuami();
  public void setAlamatIbuSuami(String alamatIbuSuami);
  public String getAlamatIbuSuami();
  public void setRtIbuSuami(BigDecimal rtIbuSuami);
  public BigDecimal getRtIbuSuami();
  public void setRwIbuSuami(BigDecimal rwIbuSuami);
  public BigDecimal getRwIbuSuami();
  public void setDusunIbuSuami(String dusunIbuSuami);
  public String getDusunIbuSuami();
  public void setKposIbuSuami(BigDecimal kposIbuSuami);
  public BigDecimal getKposIbuSuami();
  public void setTlpIbuSuami(String tlpIbuSuami);
  public String getTlpIbuSuami();
  public void setNoPropIbuSuami(String noPropIbuSuami);
  public String getNoPropIbuSuami();
  public void setNoKabIbuSuami(String noKabIbuSuami);
  public String getNoKabIbuSuami();
  public void setNoKecIbuSuami(String noKecIbuSuami);
  public String getNoKecIbuSuami();
  public void setNoKelIbuSuami(String noKelIbuSuami);
  public String getNoKelIbuSuami();
  public void setNikIstri(BigDecimal nikIstri);
  public BigDecimal getNikIstri();
  public void setKwrngrnIstri(BigDecimal kwrngrnIstri);
  public BigDecimal getKwrngrnIstri();
  public void setKtrunanIstri(BigDecimal ktrunanIstri);
  public BigDecimal getKtrunanIstri();
  public void setKwnKeIstri(BigDecimal kwnKeIstri);
  public BigDecimal getKwnKeIstri();
  public void setNikAyhDrIstri(BigDecimal nikAyhDrIstri);
  public BigDecimal getNikAyhDrIstri();
  public void setKwrngrnAyhDrIstri(BigDecimal kwrngrnAyhDrIstri);
  public BigDecimal getKwrngrnAyhDrIstri();
  public void setNamaAyhIstri(String namaAyhIstri);
  public String getNamaAyhIstri();
  public void setTglLhrAyhIstri(String tglLhrAyhIstri);
  public String getTglLhrAyhIstri();
  public void setJenisPkrjnAyhIstri(BigDecimal jenisPkrjnAyhIstri);
  public BigDecimal getJenisPkrjnAyhIstri();
  public void setAlamatAyhIstri(String alamatAyhIstri);
  public String getAlamatAyhIstri();
  public void setRtAyhIstri(BigDecimal rtAyhIstri);
  public BigDecimal getRtAyhIstri();
  public void setRwAyhIstri(BigDecimal rwAyhIstri);
  public BigDecimal getRwAyhIstri();
  public void setDusunAyhIstri(String dusunAyhIstri);
  public String getDusunAyhIstri();
  public void setKposAyhIstri(BigDecimal kposAyhIstri);
  public BigDecimal getKposAyhIstri();
  public void setTlpAyhIstri(String tlpAyhIstri);
  public String getTlpAyhIstri();
  public void setNoPropAyhIstri(String noPropAyhIstri);
  public String getNoPropAyhIstri();
  public void setNoKabAyhIstri(String noKabAyhIstri);
  public String getNoKabAyhIstri();
  public void setNoKecAyhIstri(String noKecAyhIstri);
  public String getNoKecAyhIstri();
  public void setNoKelAyhIstri(String noKelAyhIstri);
  public String getNoKelAyhIstri();
  public void setNikIbuDrIstri(BigDecimal nikIbuDrIstri);
  public BigDecimal getNikIbuDrIstri();
  public void setKwrngrnIbuDrIstri(BigDecimal kwrngrnIbuDrIstri);
  public BigDecimal getKwrngrnIbuDrIstri();
  public void setNamaIbuIstri(String namaIbuIstri);
  public String getNamaIbuIstri();
  public void setTglLhrIbuIstri(String tglLhrIbuIstri);
  public String getTglLhrIbuIstri();
  public void setJenisPkrjnIbuIstri(BigDecimal jenisPkrjnIbuIstri);
  public BigDecimal getJenisPkrjnIbuIstri();
  public void setAlamatIbuIstri(String alamatIbuIstri);
  public String getAlamatIbuIstri();
  public void setRtIbuIstri(BigDecimal rtIbuIstri);
  public BigDecimal getRtIbuIstri();
  public void setRwIbuIstri(BigDecimal rwIbuIstri);
  public BigDecimal getRwIbuIstri();
  public void setDusunIbuIstri(String dusunIbuIstri);
  public String getDusunIbuIstri();
  public void setKposIbuIstri(BigDecimal kposIbuIstri);
  public BigDecimal getKposIbuIstri();
  public void setTlpIbuIstri(String tlpIbuIstri);
  public String getTlpIbuIstri();
  public void setNoPropIbuIstri(String noPropIbuIstri);
  public String getNoPropIbuIstri();
  public void setNoKabIbuIstri(String noKabIbuIstri);
  public String getNoKabIbuIstri();
  public void setNoKecIbuIstri(String noKecIbuIstri);
  public String getNoKecIbuIstri();
  public void setNoKelIbuIstri(String noKelIbuIstri);
  public String getNoKelIbuIstri();
  public void setNikSksi1(BigDecimal nikSksi1);
  public BigDecimal getNikSksi1();
  public void setKwrngrnSksi1(BigDecimal kwrngrnSksi1);
  public BigDecimal getKwrngrnSksi1();
  public void setNikSksi2(BigDecimal nikSksi2);
  public BigDecimal getNikSksi2();
  public void setKwrngrnSksi2(BigDecimal kwrngrnSksi2);
  public BigDecimal getKwrngrnSksi2();
  public void setTglPembktanKwn(String tglPembktanKwn);
  public String getTglPembktanKwn();
  public void setJam(String jam);
  public String getJam();
  public void setTglMlapor(String tglMlapor);
  public String getTglMlapor();
  public void setTdukAgama(String tdukAgama);
  public String getTdukAgama();
  public void setNamaTmptPnesah(String namaTmptPnesah);
  public String getNamaTmptPnesah();
  public void setKetNamaTmptPnesah(String ketNamaTmptPnesah);
  public String getKetNamaTmptPnesah();
  public void setNamaPmkaAgama(String namaPmkaAgama);
  public String getNamaPmkaAgama();
  public void setAlamatPmkaAgama(String alamatPmkaAgama);
  public String getAlamatPmkaAgama();
  public void setRtPmkaAgama(BigDecimal rtPmkaAgama);
  public BigDecimal getRtPmkaAgama();
  public void setRwPmkaAgama(BigDecimal rwPmkaAgama);
  public BigDecimal getRwPmkaAgama();
  public void setDusunPmkaAgama(String dusunPmkaAgama);
  public String getDusunPmkaAgama();
  public void setKposPmkaAgama(BigDecimal kposPmkaAgama);
  public BigDecimal getKposPmkaAgama();
  public void setTlpPmkaAgama(String tlpPmkaAgama);
  public String getTlpPmkaAgama();
  public void setNoPropPmkaAgama(String noPropPmkaAgama);
  public String getNoPropPmkaAgama();
  public void setNoKabPmkaAgama(String noKabPmkaAgama);
  public String getNoKabPmkaAgama();
  public void setNoKecPmkaAgama(String noKecPmkaAgama);
  public String getNoKecPmkaAgama();
  public void setNoKelPmkaAgama(String noKelPmkaAgama);
  public String getNoKelPmkaAgama();
  public void setTglDftKwnLn(String tglDftKwnLn);
  public String getTglDftKwnLn();
  public void setIjnDutKwnWna(String ijnDutKwnWna);
  public String getIjnDutKwnWna();
  public void setDsrhkCttlkwn(BigDecimal dsrhkCttlkwn);
  public BigDecimal getDsrhkCttlkwn();
  public void setPsyrat(String psyrat);
  public String getPsyrat();
  public String getNoAktaKwn();
  public void setTglAktaKwn(String tglAktaKwn);
  public String getTglAktaKwn();
  public void setTglCtkKtakta(String tglCtkKtakta);
  public String getTglCtkKtakta();
  public void setNamaKepDes(String namaKepDes);
  public String getNamaKepDes();
  public void setNipLrh(BigDecimal nipLrh);
  public BigDecimal getNipLrh();
  public void setNamaPetReg(String namaPetReg);
  public String getNamaPetReg();
  public void setNipPetReg(BigDecimal nipPetReg);
  public BigDecimal getNipPetReg();
  public void setNamaPlpor(String namaPlpor);
  public String getNamaPlpor();
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
  public void setStatSebelSuami(String statSebelSuami);
  public String getStatSebelSuami();
  public void setStatSebelIstri(String statSebelIstri);
  public String getStatSebelIstri();
  public void setDaftarAnak(String daftarAnak);
  public String getDaftarAnak();
























































































































































































































}
