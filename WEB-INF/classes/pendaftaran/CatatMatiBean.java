package pendaftaran;

import java.math.*;
import javax.ejb.*;

abstract public class CatatMatiBean
    implements EntityBean {
  EntityContext entityContext;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nikJnsah) throws
      CreateException {
    setNikJnsah(nikJnsah);
    return null;
  }

  public java.math.BigDecimal ejbCreate(
      BigDecimal nikJnsah, BigDecimal kwrngrnJnsah,
      BigDecimal ktrunanJnsah, BigDecimal anakKe,
      String tglMati, String pukul,
      BigDecimal wktPukul, BigDecimal sbabMati, String tmptMati,
      BigDecimal ygMnerang, String pnetapPn, String noPnetap,
      java.lang.String tglPnetap, BigDecimal nikIbu,
      BigDecimal kwrngrnIbu, String namaLgkpIbu,
      java.lang.String tglLhrIbu, BigDecimal jenisPkrjnIbu,
      String alamatIbu, BigDecimal noRtIbu, BigDecimal noRwIbu,
      String dusunIbu, BigDecimal kodeposIbu, String telpIbu,
      String noPropIbu, String noKabIbu, String noKecIbu,
      String noKelIbu, BigDecimal nikAyh, BigDecimal kwrngrnAyh,
      String namaLgkpAyh, java.lang.String tglLhrAyh,
      BigDecimal jenisPkrjnAyh, String alamatAyh, BigDecimal noRtAyh,
      String dusunAyh, BigDecimal noRwAyh, BigDecimal kodeposAyh,
      String telpAyh, String noPropAyh, String noKabAyh,
      String noKecAyh, String noKelAyh, BigDecimal nikPlpor,
      BigDecimal kwrngrnPlpor, java.lang.String tglMlpor,
      BigDecimal noProp, BigDecimal noKab, BigDecimal noKec) throws
      CreateException {

    setNikJnsah(nikJnsah);
    setKwrngrnJnsah(kwrngrnJnsah);
    setKtrunanJnsah(ktrunanJnsah);
    setAnakKe(anakKe);
    setTglMati(tglMati);
    setPukul(pukul);
    setWktPukul(wktPukul);
    setSbabMati(sbabMati);
    setTmptMati(tmptMati);
    setYgMnerang(ygMnerang);
    setPnetapPn(pnetapPn);
    setNoPnetap(noPnetap);
    setTglPnetap(tglPnetap);
    setNikIbu(nikIbu);
    setKwrngrnIbu(kwrngrnIbu);
    setNamaLgkpIbu(namaLgkpIbu);
    setTglLhrIbu(tglLhrIbu);
    setJenisPkrjnIbu(jenisPkrjnIbu);
    setAlamatIbu(alamatIbu);
    setNoRtIbu(noRtIbu);
    setNoRwIbu(noRwIbu);
    setDusunIbu(dusunIbu);
    setKodeposIbu(kodeposIbu);
    setTelpIbu(telpIbu);
    setNoPropIbu(noPropIbu);
    setNoKabIbu(noKabIbu);
    setNoKecIbu(noKecIbu);
    setNoKelIbu(noKelIbu);
    setNikAyh(nikAyh);
    setKwrngrnAyh(kwrngrnAyh);
    setNamaLgkpAyh(namaLgkpAyh);
    setTglLhrAyh(tglLhrAyh);
    setJenisPkrjnAyh(jenisPkrjnAyh);
    setAlamatAyh(alamatAyh);
    setNoRtAyh(noRtAyh);
    setDusunAyh(dusunAyh);
    setNoRwAyh(noRwAyh);
    setKodeposAyh(kodeposAyh);
    setTelpAyh(telpAyh);
    setNoPropAyh(noPropAyh);
    setNoKabAyh(noKabAyh);
    setNoKecAyh(noKecAyh);
    setNoKelAyh(noKelAyh);
    setNikPlpor(nikPlpor);
    setKwrngrnPlpor(kwrngrnPlpor);
    setTglMlpor(tglMlpor);
    setNoProp(noProp);
    setNoKab(noKab);
    setNoKec(noKec);

    /*  setNikSksi1(nikSksi1);
      setKwrngrnSksi1(kwrngrnSksi1);
      setNikSksi2(nikSksi2);
      setKwrngrnSksi2(kwrngrnSksi2);
      setJenisDftLhr(jenisDftLhr);
      setDasarHkmMati(dasarHkmMati);
      setPsyratanMt(psyratanMt);
      setNoAktaMati(noAktaMati);
      setTglAktaMati(tglAktaMati);
      setNamaKepDes(namaKepDes);
      setNipLrh(nipLrh);
      setNamaPetReg(namaPetReg);
      setNipPetReg(nipPetReg);
      setTglCtkKtakta(tglCtkKtakta);
      setNamaPetEntri(namaPetEntri);
      setNipPetEntri(nipPetEntri);
      setNoProp(noProp);
      setNoKab(noKab);
      setNoKec(noKec);
      setNoKel(noKel);
      setFlagKec(flagKec);
      setTglEntri(tglEntri);
      setTglUpdation(tglUpdation);
      setUserId(userId);
      setCflag(cflag);
      setPflag(pflag);*/

    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal nikJnsah) throws
      CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(BigDecimal nikJnsah, BigDecimal kwrngrnJnsah,
                            BigDecimal ktrunanJnsah,
                            BigDecimal anakKe, String tglMati, String pukul,
                            BigDecimal wktPukul, BigDecimal sbabMati,
                            String tmptMati,
                            BigDecimal ygMnerang, String pnetapPn,
                            String noPnetap,
                            String tglPnetap, BigDecimal nikIbu,
                            BigDecimal kwrngrnIbu,
                            String namaLgkpIbu, String tglLhrIbu,
                            BigDecimal jenisPkrjnIbu,
                            String alamatIbu, BigDecimal noRtIbu,
                            BigDecimal noRwIbu,
                            String dusunIbu, BigDecimal kodeposIbu,
                            String telpIbu,
                            String noPropIbu, String noKabIbu, String noKecIbu,
                            String noKelIbu, BigDecimal nikAyh,
                            BigDecimal kwrngrnAyh,
                            String namaLgkpAyh, String tglLhrAyh,
                            BigDecimal jenisPkrjnAyh,
                            String alamatAyh, BigDecimal noRtAyh,
                            String dusunAyh,
                            BigDecimal noRwAyh, BigDecimal kodeposAyh,
                            String telpAyh,
                            String noPropAyh, String noKabAyh, String noKecAyh,
                            String noKelAyh, BigDecimal nikPlpor,
                            BigDecimal kwrngrnPlpor,
                            String tglMlpor, BigDecimal noProp,
                            BigDecimal noKab,
                            BigDecimal noKec) throws CreateException {}

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNikJnsah(java.math.BigDecimal nikJnsah);

  public abstract void setKwrngrnJnsah(java.math.BigDecimal kwrngrnJnsah);

  public abstract void setKtrunanJnsah(java.math.BigDecimal ktrunanJnsah);

  public abstract void setAnakKe(java.math.BigDecimal anakKe);

  public abstract void setTglMati(java.lang.String tglMati);

  public abstract void setPukul(java.lang.String pukul);

  public abstract void setWktPukul(java.math.BigDecimal wktPukul);

  public abstract void setSbabMati(java.math.BigDecimal sbabMati);

  public abstract void setTmptMati(java.lang.String tmptMati);

  public abstract void setYgMnerang(java.math.BigDecimal ygMnerang);

  public abstract void setPnetapPn(java.lang.String pnetapPn);

  public abstract void setNoPnetap(java.lang.String noPnetap);

  public abstract void setTglPnetap(java.lang.String tglPnetap);

  public abstract void setNikIbu(java.math.BigDecimal nikIbu);

  public abstract void setKwrngrnIbu(java.math.BigDecimal kwrngrnIbu);

  public abstract void setNamaLgkpIbu(java.lang.String namaLgkpIbu);

  public abstract void setTglLhrIbu(java.lang.String tglLhrIbu);

  public abstract void setJenisPkrjnIbu(java.math.BigDecimal jenisPkrjnIbu);

  public abstract void setAlamatIbu(java.lang.String alamatIbu);

  public abstract void setNoRtIbu(java.math.BigDecimal noRtIbu);

  public abstract void setNoRwIbu(java.math.BigDecimal noRwIbu);

  public abstract void setDusunIbu(java.lang.String dusunIbu);

  public abstract void setKodeposIbu(java.math.BigDecimal kodeposIbu);

  public abstract void setTelpIbu(java.lang.String telpIbu);

  public abstract void setNoPropIbu(String noPropIbu);

  public abstract void setNoKabIbu(String noKabIbu);

  public abstract void setNoKecIbu(String noKecIbu);

  public abstract void setNoKelIbu(String noKelIbu);

  public abstract void setNikAyh(java.math.BigDecimal nikAyh);

  public abstract void setKwrngrnAyh(java.math.BigDecimal kwrngrnAyh);

  public abstract void setNamaLgkpAyh(java.lang.String namaLgkpAyh);

  public abstract void setTglLhrAyh(java.lang.String tglLhrAyh);

  public abstract void setJenisPkrjnAyh(java.math.BigDecimal jenisPkrjnAyh);

  public abstract void setAlamatAyh(java.lang.String alamatAyh);

  public abstract void setNoRtAyh(java.math.BigDecimal noRtAyh);

  public abstract void setDusunAyh(java.lang.String dusunAyh);

  public abstract void setNoRwAyh(java.math.BigDecimal noRwAyh);

  public abstract void setKodeposAyh(java.math.BigDecimal kodeposAyh);

  public abstract void setTelpAyh(java.lang.String telpAyh);

  public abstract void setNoPropAyh(String noPropAyh);

  public abstract void setNoKabAyh(String noKabAyh);

  public abstract void setNoKecAyh(String noKecAyh);

  public abstract void setNoKelAyh(String noKelAyh);

  public abstract void setNikPlpor(java.math.BigDecimal nikPlpor);

  public abstract void setKwrngrnPlpor(java.math.BigDecimal kwrngrnPlpor);

  public abstract void setTglMlpor(java.lang.String tglMlpor);

  public abstract void setNikSksi1(java.math.BigDecimal nikSksi1);

  public abstract void setKwrngrnSksi1(java.math.BigDecimal kwrngrnSksi1);

  public abstract void setNikSksi2(java.math.BigDecimal nikSksi2);

  public abstract void setKwrngrnSksi2(java.math.BigDecimal kwrngrnSksi2);

  public abstract void setJenisDftLhr(java.math.BigDecimal jenisDftLhr);

  public abstract void setDasarHkmMati(java.math.BigDecimal dasarHkmMati);

  public abstract void setPsyratanMt(java.lang.String psyratanMt);

  public abstract void setNoAktaMati(java.lang.String noAktaMati);

  public abstract void setTglAktaMati(java.lang.String tglAktaMati);

  public abstract void setNamaKepDes(java.lang.String namaKepDes);

  public abstract void setNipLrh(java.math.BigDecimal nipLrh);

  public abstract void setNamaPetReg(java.lang.String namaPetReg);

  public abstract void setNipPetReg(java.math.BigDecimal nipPetReg);

  public abstract void setTglCtkKtakta(java.lang.String tglCtkKtakta);

  public abstract void setNamaPetEntri(java.lang.String namaPetEntri);

  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setNoKec(java.math.BigDecimal noKec);

  public abstract void setNoKel(java.math.BigDecimal noKel);

  public abstract void setFlagKec(java.math.BigDecimal flagKec);

  public abstract void setTglEntri(java.lang.String tglEntri);

  public abstract void setTglUpdation(java.lang.String tglUpdation);

  public abstract void setUserId(java.math.BigDecimal userId);

  public abstract void setCflag(java.lang.String cflag);

  public abstract void setPflag(java.lang.String pflag);

  public abstract java.math.BigDecimal getNikJnsah();

  public abstract java.math.BigDecimal getKwrngrnJnsah();

  public abstract java.math.BigDecimal getKtrunanJnsah();

  public abstract java.math.BigDecimal getAnakKe();

  public abstract java.lang.String getTglMati();

  public abstract java.lang.String getPukul();

  public abstract java.math.BigDecimal getWktPukul();

  public abstract java.math.BigDecimal getSbabMati();

  public abstract java.lang.String getTmptMati();

  public abstract java.math.BigDecimal getYgMnerang();

  public abstract java.lang.String getPnetapPn();

  public abstract java.lang.String getNoPnetap();

  public abstract java.lang.String getTglPnetap();

  public abstract java.math.BigDecimal getNikIbu();

  public abstract java.math.BigDecimal getKwrngrnIbu();

  public abstract java.lang.String getNamaLgkpIbu();

  public abstract java.lang.String getTglLhrIbu();

  public abstract java.math.BigDecimal getJenisPkrjnIbu();

  public abstract java.lang.String getAlamatIbu();

  public abstract java.math.BigDecimal getNoRtIbu();

  public abstract java.math.BigDecimal getNoRwIbu();

  public abstract java.lang.String getDusunIbu();

  public abstract java.math.BigDecimal getKodeposIbu();

  public abstract java.lang.String getTelpIbu();

  public abstract String getNoPropIbu();

  public abstract String getNoKabIbu();

  public abstract String getNoKecIbu();

  public abstract String getNoKelIbu();

  public abstract java.math.BigDecimal getNikAyh();

  public abstract java.math.BigDecimal getKwrngrnAyh();

  public abstract java.lang.String getNamaLgkpAyh();

  public abstract java.lang.String getTglLhrAyh();

  public abstract java.math.BigDecimal getJenisPkrjnAyh();

  public abstract java.lang.String getAlamatAyh();

  public abstract java.math.BigDecimal getNoRtAyh();

  public abstract java.lang.String getDusunAyh();

  public abstract java.math.BigDecimal getNoRwAyh();

  public abstract java.math.BigDecimal getKodeposAyh();

  public abstract java.lang.String getTelpAyh();

  public abstract String getNoPropAyh();

  public abstract String getNoKabAyh();

  public abstract String getNoKecAyh();

  public abstract String getNoKelAyh();

  public abstract java.math.BigDecimal getNikPlpor();

  public abstract java.math.BigDecimal getKwrngrnPlpor();

  public abstract java.lang.String getTglMlpor();

  public abstract java.math.BigDecimal getNikSksi1();

  public abstract java.math.BigDecimal getKwrngrnSksi1();

  public abstract java.math.BigDecimal getNikSksi2();

  public abstract java.math.BigDecimal getKwrngrnSksi2();

  public abstract java.math.BigDecimal getJenisDftLhr();

  public abstract java.math.BigDecimal getDasarHkmMati();

  public abstract java.lang.String getPsyratanMt();

  public abstract java.lang.String getNoAktaMati();

  public abstract java.lang.String getTglAktaMati();

  public abstract java.lang.String getNamaKepDes();

  public abstract java.math.BigDecimal getNipLrh();

  public abstract java.lang.String getNamaPetReg();

  public abstract java.math.BigDecimal getNipPetReg();

  public abstract java.lang.String getTglCtkKtakta();

  public abstract java.lang.String getNamaPetEntri();

  public abstract java.math.BigDecimal getNipPetEntri();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.math.BigDecimal getNoKec();

  public abstract java.math.BigDecimal getNoKel();

  public abstract java.math.BigDecimal getFlagKec();

  public abstract java.lang.String getTglEntri();

  public abstract java.lang.String getTglUpdation();

  public abstract java.math.BigDecimal getUserId();

  public abstract java.lang.String getCflag();

  public abstract java.lang.String getPflag();

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