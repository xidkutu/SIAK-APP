package keluargawna;

import javax.ejb.*;

abstract public class BiodataWna1Bean implements EntityBean {
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
  public abstract void setTglLhr(java.lang.String tglLhr);
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
  public abstract void setTglPaspor(java.lang.String tglPaspor);
  public abstract void setTglAkhPaspor(java.lang.String tglAkhPaspor);
  public abstract void setNamaSpsor(java.lang.String namaSpsor);
  public abstract void setTipeSpsor(java.math.BigDecimal tipeSpsor);
  public abstract void setDokImgr(java.math.BigDecimal dokImgr);
  public abstract void setNoDok(java.lang.String noDok);
  public abstract void setTmptDtbit(java.lang.String tmptDtbit);
  public abstract void setTglDtbit(java.lang.String tglDtbit);
  public abstract void setTglAkhDok(java.lang.String tglAkhDok);
  public abstract void setTmptDtngPert(java.lang.String tmptDtngPert);
  public abstract void setTglDtngPert(java.lang.String tglDtngPert);
  public abstract void setNoStld(java.lang.String noStld);
  public abstract void setTglDft(java.lang.String tglDft);
  public abstract void setNamaDin(java.lang.String namaDin);
  public abstract void setNamaKepDin(java.lang.String namaKepDin);
  public abstract void setNipKepDin(java.math.BigDecimal nipKepDin);
  public abstract void setNamaPetEntri(java.lang.String namaPetEntri);
  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);
  public abstract void setTglEntri(java.lang.String tglEntri);
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setStatKtp(java.math.BigDecimal statKtp);
  public abstract void setStatHidup(java.math.BigDecimal statHidup);
  public abstract void setTglUbah(java.lang.String tglUbah);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setStatHbkel(java.math.BigDecimal statHbkel);
  public abstract void setTglCetakKtp(java.lang.String tglCetakKtp);
  public abstract void setTglGantiKtp(java.lang.String tglGantiKtp);
  public abstract void setTglPjgKtp(java.lang.String tglPjgKtp);
  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract java.math.BigDecimal getNik();
  public abstract java.lang.String getNamaKlrga();
  public abstract java.lang.String getNamaPertma();
  public abstract java.math.BigDecimal getJenisKlmin();
  public abstract java.lang.String getTmptLhr();
  public abstract java.lang.String getTglLhr();
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
  public abstract java.lang.String getTglPaspor();
  public abstract java.lang.String getTglAkhPaspor();
  public abstract java.lang.String getNamaSpsor();
  public abstract java.math.BigDecimal getTipeSpsor();
  public abstract java.math.BigDecimal getDokImgr();
  public abstract java.lang.String getNoDok();
  public abstract java.lang.String getTmptDtbit();
  public abstract java.lang.String getTglDtbit();
  public abstract java.lang.String getTglAkhDok();
  public abstract java.lang.String getTmptDtngPert();
  public abstract java.lang.String getTglDtngPert();
  public abstract java.lang.String getNoStld();
  public abstract java.lang.String getTglDft();
  public abstract java.lang.String getNamaDin();
  public abstract java.lang.String getNamaKepDin();
  public abstract java.math.BigDecimal getNipKepDin();
  public abstract java.lang.String getNamaPetEntri();
  public abstract java.math.BigDecimal getNipPetEntri();
  public abstract java.lang.String getTglEntri();
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getStatKtp();
  public abstract java.math.BigDecimal getStatHidup();
  public abstract java.lang.String getTglUbah();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.math.BigDecimal getStatHbkel();
  public abstract java.lang.String getTglCetakKtp();
  public abstract java.lang.String getTglGantiKtp();
  public abstract java.lang.String getTglPjgKtp();
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
  public abstract java.math.BigDecimal ejbSelectCount(java.math.BigDecimal no_kk) throws FinderException;

  public java.math.BigDecimal ejbHomeGetCount(java.math.BigDecimal no_kk) throws FinderException {
  java.math.BigDecimal cnt=null;
   try{

     cnt=ejbSelectCount(no_kk);
   }catch(Exception err)
   {
     System.out.println("error in count for AngotasMoveBean" + err.toString());
   }
    return cnt;
 }
}