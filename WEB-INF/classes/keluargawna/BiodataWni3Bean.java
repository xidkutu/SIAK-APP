package keluargawna;

import javax.ejb.*;

abstract public class BiodataWni3Bean implements EntityBean {
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
  public abstract void setNoKtp(java.lang.String noKtp);
  public abstract void setTmptSbl(java.lang.String tmptSbl);
  public abstract void setNoPaspor(java.lang.String noPaspor);
  public abstract void setTglAkhPaspor(java.lang.String tglAkhPaspor);
  public abstract void setNamaLgkp(java.lang.String namaLgkp);
  public abstract void setJenisKlmin(java.math.BigDecimal jenisKlmin);
  public abstract void setTmptLhr(java.lang.String tmptLhr);
  public abstract void setTglLhr(java.lang.String tglLhr);
  public abstract void setAktaLhr(java.math.BigDecimal aktaLhr);
  public abstract void setNoAktaLhr(java.lang.String noAktaLhr);
  public abstract void setGolDrh(java.math.BigDecimal golDrh);
  public abstract void setAgama(java.lang.String agama);
  public abstract void setStatKwn(java.math.BigDecimal statKwn);
  public abstract void setAktaKwn(java.math.BigDecimal aktaKwn);
  public abstract void setNoAktaKwn(java.lang.String noAktaKwn);
  public abstract void setTglKwn(java.lang.String tglKwn);
  public abstract void setAktaCrai(java.math.BigDecimal aktaCrai);
  public abstract void setNoAktaCrai(java.lang.String noAktaCrai);
  public abstract void setTglCrai(java.lang.String tglCrai);
  public abstract void setStatHbkel(java.math.BigDecimal statHbkel);
  public abstract void setKlainFsk(java.math.BigDecimal klainFsk);
  public abstract void setPnydngCct(java.math.BigDecimal pnydngCct);
  public abstract void setPddkAkh(java.math.BigDecimal pddkAkh);
  public abstract void setJenisPkrjn(java.math.BigDecimal jenisPkrjn);
  public abstract void setNikIbu(java.math.BigDecimal nikIbu);
  public abstract void setNamaLgkpIbu(java.lang.String namaLgkpIbu);
  public abstract void setNikAyah(java.math.BigDecimal nikAyah);
  public abstract void setNamaLgkpAyah(java.lang.String namaLgkpAyah);
  public abstract void setNamaKetRt(java.lang.String namaKetRt);
  public abstract void setNamaKetRw(java.lang.String namaKetRw);
  public abstract void setNamaPetReg(java.lang.String namaPetReg);
  public abstract void setNipPetReg(java.math.BigDecimal nipPetReg);
  public abstract void setNamaPetEntri(java.lang.String namaPetEntri);
  public abstract void setNipPetEntri(java.math.BigDecimal nipPetEntri);
  public abstract void setTglEntri(java.lang.String tglEntri);
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setJenisBntu(java.math.BigDecimal jenisBntu);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setStatHidup(java.math.BigDecimal statHidup);
  public abstract void setTglUbah(java.lang.String tglUbah);
  public abstract void setTglCetakKtp(java.lang.String tglCetakKtp);
  public abstract void setTglGantiKtp(java.lang.String tglGantiKtp);
  public abstract void setTglPjgKtp(java.lang.String tglPjgKtp);
  public abstract void setStatKtp(java.math.BigDecimal statKtp);
  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract java.math.BigDecimal getNik();
  public abstract java.lang.String getNoKtp();
  public abstract java.lang.String getTmptSbl();
  public abstract java.lang.String getNoPaspor();
  public abstract java.lang.String getTglAkhPaspor();
  public abstract java.lang.String getNamaLgkp();
  public abstract java.math.BigDecimal getJenisKlmin();
  public abstract java.lang.String getTmptLhr();
  public abstract java.lang.String getTglLhr();
  public abstract java.math.BigDecimal getAktaLhr();
  public abstract java.lang.String getNoAktaLhr();
  public abstract java.math.BigDecimal getGolDrh();
  public abstract java.lang.String getAgama();
  public abstract java.math.BigDecimal getStatKwn();
  public abstract java.math.BigDecimal getAktaKwn();
  public abstract java.lang.String getNoAktaKwn();
  public abstract java.lang.String getTglKwn();
  public abstract java.math.BigDecimal getAktaCrai();
  public abstract java.lang.String getNoAktaCrai();
  public abstract java.lang.String getTglCrai();
  public abstract java.math.BigDecimal getStatHbkel();
  public abstract java.math.BigDecimal getKlainFsk();
  public abstract java.math.BigDecimal getPnydngCct();
  public abstract java.math.BigDecimal getPddkAkh();
  public abstract java.math.BigDecimal getJenisPkrjn();
  public abstract java.math.BigDecimal getNikIbu();
  public abstract java.lang.String getNamaLgkpIbu();
  public abstract java.math.BigDecimal getNikAyah();
  public abstract java.lang.String getNamaLgkpAyah();
  public abstract java.lang.String getNamaKetRt();
  public abstract java.lang.String getNamaKetRw();
  public abstract java.lang.String getNamaPetReg();
  public abstract java.math.BigDecimal getNipPetReg();
  public abstract java.lang.String getNamaPetEntri();
  public abstract java.math.BigDecimal getNipPetEntri();
  public abstract java.lang.String getTglEntri();
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.math.BigDecimal getJenisBntu();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.math.BigDecimal getStatHidup();
  public abstract java.lang.String getTglUbah();
  public abstract java.lang.String getTglCetakKtp();
  public abstract java.lang.String getTglGantiKtp();
  public abstract java.lang.String getTglPjgKtp();
  public abstract java.math.BigDecimal getStatKtp();
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

 public java.math.BigDecimal ejbHomeGetCount(java.math.BigDecimal no_kk) {
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