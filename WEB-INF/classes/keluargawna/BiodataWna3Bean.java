package keluargawna;

import javax.ejb.*;

abstract public class BiodataWna3Bean implements EntityBean {
  EntityContext entityContext;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws CreateException {
    setNik(nik);
    return null;
  }
  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNik(java.math.BigDecimal nik);
  public abstract void setNamaKlrga(java.lang.String namaKlrga);
  public abstract void setNamaPertma(java.lang.String namaPertma);
  public abstract void setJenisKlmin(java.math.BigDecimal jenisKlmin);
  public abstract void setTmptLhr(java.lang.String tmptLhr);
  public abstract void setTglLhr(java.sql.Date tglLhr);
  public abstract void setKwrngrn(java.lang.String kwrngrn);
  public abstract void setAgama(java.lang.String agama);
  public abstract void setGolDrh(java.math.BigDecimal golDrh);
  public abstract void setStatKwn(java.math.BigDecimal statKwn);
  public abstract void setPddkAkh(java.math.BigDecimal pddkAkh);
  public abstract void setJenisPkrjn(java.math.BigDecimal jenisPkrjn);
  public abstract void setAlamatSpsor(java.lang.String alamatSpsor);
  public abstract void setNoRt(java.math.BigDecimal noRt);
  public abstract void setNoRw(java.math.BigDecimal noRw);
  public abstract void setKodepos(java.math.BigDecimal kodepos);
  public abstract void setTelepon(java.lang.String telepon);
  public abstract void setDatngDari(java.lang.String datngDari);
  public abstract void setTujuanDtng(java.lang.String tujuanDtng);
  public abstract void setNoPaspor(java.lang.String noPaspor);
  public abstract void setTglPaspor(java.sql.Date tglPaspor);
  public abstract void setTglAkhPaspor(java.sql.Date tglAkhPaspor);
  public abstract void setNamaSpsor(java.lang.String namaSpsor);
  public abstract void setTipeSpsor(java.math.BigDecimal tipeSpsor);
  public abstract void setDokImgr(java.math.BigDecimal dokImgr);
  public abstract void setNoDok(java.lang.String noDok);
  public abstract void setTmptDtbit(java.lang.String tmptDtbit);
  public abstract void setTglDtbit(java.sql.Date tglDtbit);
  public abstract void setTglAkhDok(java.sql.Date tglAkhDok);
  public abstract void setTmptDtngPert(java.lang.String tmptDtngPert);
  public abstract void setTglDtngPert(java.sql.Date tglDtngPert);
  public abstract void setNoStld(java.lang.String noStld);
  public abstract void setTglDft(java.sql.Date tglDft);
  public abstract void setNamaDin(java.lang.String namaDin);
  public abstract void setNamaKepDin(java.lang.String namaKepDin);
  public abstract void setNipKepDin(java.math.BigDecimal nipKepDin);
  public abstract void setNamaPetEntri(java.lang.String namaPetEntri);
  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);
  public abstract void setTglEntri(java.sql.Date tglEntri);
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setStatKtp(java.math.BigDecimal statKtp);
  public abstract void setStatHidup(java.math.BigDecimal statHidup);
  public abstract void setTglUbah(java.sql.Date tglUbah);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setStatHbkel(java.math.BigDecimal statHbkel);
  public abstract void setTglCetakKtp(java.sql.Date tglCetakKtp);
  public abstract void setTglGantiKtp(java.sql.Date tglGantiKtp);
  public abstract void setTglPjgKtp(java.sql.Date tglPjgKtp);
  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract java.math.BigDecimal getNik();
  public abstract java.lang.String getNamaKlrga();
  public abstract java.lang.String getNamaPertma();
  public abstract java.math.BigDecimal getJenisKlmin();
  public abstract java.lang.String getTmptLhr();
  public abstract java.sql.Date getTglLhr();
  public abstract java.lang.String getKwrngrn();
  public abstract java.lang.String getAgama();
  public abstract java.math.BigDecimal getGolDrh();
  public abstract java.math.BigDecimal getStatKwn();
  public abstract java.math.BigDecimal getPddkAkh();
  public abstract java.math.BigDecimal getJenisPkrjn();
  public abstract java.lang.String getAlamatSpsor();
  public abstract java.math.BigDecimal getNoRt();
  public abstract java.math.BigDecimal getNoRw();
  public abstract java.math.BigDecimal getKodepos();
  public abstract java.lang.String getTelepon();
  public abstract java.lang.String getDatngDari();
  public abstract java.lang.String getTujuanDtng();
  public abstract java.lang.String getNoPaspor();
  public abstract java.sql.Date getTglPaspor();
  public abstract java.sql.Date getTglAkhPaspor();
  public abstract java.lang.String getNamaSpsor();
  public abstract java.math.BigDecimal getTipeSpsor();
  public abstract java.math.BigDecimal getDokImgr();
  public abstract java.lang.String getNoDok();
  public abstract java.lang.String getTmptDtbit();
  public abstract java.sql.Date getTglDtbit();
  public abstract java.sql.Date getTglAkhDok();
  public abstract java.lang.String getTmptDtngPert();
  public abstract java.sql.Date getTglDtngPert();
  public abstract java.lang.String getNoStld();
  public abstract java.sql.Date getTglDft();
  public abstract java.lang.String getNamaDin();
  public abstract java.lang.String getNamaKepDin();
  public abstract java.math.BigDecimal getNipKepDin();
  public abstract java.lang.String getNamaPetEntri();
  public abstract java.math.BigDecimal getNipPetEntri();
  public abstract java.sql.Date getTglEntri();
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getStatKtp();
  public abstract java.math.BigDecimal getStatHidup();
  public abstract java.sql.Date getTglUbah();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.math.BigDecimal getStatHbkel();
  public abstract java.sql.Date getTglCetakKtp();
  public abstract java.sql.Date getTglGantiKtp();
  public abstract java.sql.Date getTglPjgKtp();
  public abstract java.math.BigDecimal getAlsNumpang();
  public abstract java.lang.String getPflag();
  public abstract java.lang.String getCflag();
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