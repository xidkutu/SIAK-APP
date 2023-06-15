package com.P4B;

import javax.ejb.*;

abstract public class BiodataWni1Bean implements EntityBean {
  EntityContext entityContext;

  public java.lang.String ejbCreate(java.lang.String nik) throws CreateException {
    setNik(nik);
    return null;
  }

public java.lang.String ejbCreateBio(P4BBioObject form) throws CreateException
 {
System.out.println("Nik-"+     form.getNik());
 setNik(form.getNik());
System.out.println("KTP-"+     form.getNoKtp());
 setNoKtp( form.getNoKtp());
 System.out.println("TmptSbl-"+     form.getTmptSbl());
 setTmptSbl( form.getTmptSbl());
 System.out.println("NoPaspor-"+     form.getNoPaspor());
 setNoPaspor(form.getNoPaspor());
 System.out.println("TglAkhPaspor-"+     form.getTglPasporform());
 setTglAkhPaspor(form.getTglPasporform());
 System.out.println("getNamaLgkp-"+     form.getNamaLgkp());
 setNamaLgkp( form.getNamaLgkp());
 System.out.println("form.getJenisKlmin()"+     form.getJenisKlmin());
 setJenisKlmin( form.getJenisKlmin());
 System.out.println("form.getTmptLhr()"+     form.getTmptLhr());
 setTmptLhr( form.getTmptLhr());
 System.out.println("form.getTglLahirform()"+     form.getTglLahirform());
 setTglLhr( form.getTglLahirform());
 System.out.println("form.getAktaLhr()"+     form.getAktaLhr());
 setAktaLhr(form.getAktaLhr());
 System.out.println("form.getNoAktaLhr()"+     form.getNoAktaLhr());
 setNoAktaLhr(form.getNoAktaLhr());
 System.out.println("form.getGolDrh()"+     form.getGolDrh());
 setGolDrh( form.getGolDrh());

    if ((form.getAgama_txt()!=null) && !(form.getAgama_txt().trim().equals("")))
    {
       System.out.println("form.getAgama_txt()"+     form.getAgama_txt());
      setAgama( form.getAgama_txt());

      }  else   {
      System.out.println("form.getAgama()"+     form.getAgama());
        setAgama(form.getAgama());
        }

System.out.println("form.getStatKwn()"+     form.getStatKwn());
 setStatKwn( form.getStatKwn());
System.out.println("form.getAktaKwn()"+     form.getAktaKwn());

 if (form.getAktaKwn()!=null)
 setAktaKwn(form.getAktaKwn());
 else
   setAktaKwn("1");

System.out.println("form.getNoAktaKwn()"+     form.getNoAktaKwn());
 setNoAktaKwn( form.getNoAktaKwn());
System.out.println("form.getTglKawinform()"+     form.getTglKawinform());
 setTglKwn( form.getTglKawinform());
System.out.println("form.getAktaCrai()"+     form.getAktaCrai());

 if (form.getAktaCrai()!=null)
 setAktaCrai( form.getAktaCrai());
 else
    setAktaCrai("1");
System.out.println("form.getNoAktaCrai()"+     form.getNoAktaCrai());
 setNoAktaCrai( form.getNoAktaCrai());
System.out.println("form.getTglCeraiform()"+     form.getTglCeraiform());
 setTglCrai( form.getTglCeraiform());
System.out.println("form.getStatHbkel()"+     form.getStatHbkel());
 setStatHbkel( form.getStatHbkel());
System.out.println("form.getKlainFsk()"+     form.getKlainFsk());
 setKlainFsk( form.getKlainFsk());
System.out.println("form.getPnydngCct()"+     form.getPnydngCct());
 setPnydngCct( form.getPnydngCct());
System.out.println("form.getPddkAkh()"+     form.getPddkAkh());
 setPddkAkh( form.getPddkAkh());
System.out.println("form.getJenisPkrjn()"+     form.getJenisPkrjn());
 setJenisPkrjn( form.getJenisPkrjn());
System.out.println("form.getNikIbu()"+     form.getNikIbu());
 setNikIbu(form.getNikIbu());
System.out.println("form.getNamaLgkpIbu()"+     form.getNamaLgkpIbu());
 setNamaLgkpIbu( form.getNamaLgkpIbu());
System.out.println("form.getNikAyah()"+     form.getNikAyah());
 setNikAyah( form.getNikAyah());
System.out.println("form.getNamaLgkpAyah()"+     form.getNamaLgkpAyah());
 setNamaLgkpAyah( form.getNamaLgkpAyah());
System.out.println("form.getNamaKetRt()"+     form.getNamaKetRt());
 setNamaKetRt( form.getNamaKetRt());
System.out.println("form.getNamaKetRw()"+     form.getNamaKetRw());
 setNamaKetRw( form.getNamaKetRw());
System.out.println("form.getNamaPetReg()"+     form.getNamaPetReg());
 setNamaPetReg( form.getNamaPetReg());
System.out.println("form.getNipPetReg()"+     form.getNipPetReg());
 setNipPetReg( form.getNipPetReg());
System.out.println("form.getNamaPetEntri()"+     form.getNamaPetEntri());
 setNamaPetEntri( form.getNamaPetEntri());
System.out.println("form.getNipPetEntri()"+     form.getNipPetEntri());
 setNipPetEntri( form.getNipPetEntri());
 System.out.println("form.getTglEntri()"+     form.getTglEntri());
 setTglEntri( form.getTglEntri());
 System.out.println("form.getNoKk()"+     form.getNoKk());
 setNoKk( form.getNoKk());
 System.out.println("form.getNo_prop()"+     form.getNo_prop());
 setNoProp( form.getNo_prop());
 System.out.println("form.getNo_kab()"+     form.getNo_kab());
 setNoKab( form.getNo_kab());
 System.out.println("form.getNo_kec()"+     form.getNo_kec());
 setNoKec( form.getNo_kec());
 System.out.println("form.getNo_kel()"+     form.getNo_kel());
 setNoKel( form.getNo_kel());
 setPflag("N");
 setCflag("N");
    /**@todo Complete this method*/
    return null;
  }

  public void ejbPostCreate(java.lang.String nik) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreateBio(P4BBioObject form) throws CreateException  {

    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNik(java.lang.String nik);
  public abstract void setNoKtp(java.lang.String noKtp);
  public abstract void setTmptSbl(java.lang.String tmptSbl);
  public abstract void setNoPaspor(java.lang.String noPaspor);
  public abstract void setTglAkhPaspor(java.lang.String tglAkhPaspor);
  public abstract void setNamaLgkp(java.lang.String namaLgkp);
  public abstract void setJenisKlmin(java.lang.String jenisKlmin);
  public abstract void setTmptLhr(java.lang.String tmptLhr);
  public abstract void setTglLhr(java.lang.String tglLhr);
  public abstract void setAktaLhr(java.lang.String aktaLhr);
  public abstract void setNoAktaLhr(java.lang.String noAktaLhr);
  public abstract void setGolDrh(java.lang.String golDrh);
  public abstract void setAgama(java.lang.String agama);
  public abstract void setStatKwn(java.lang.String statKwn);
  public abstract void setAktaKwn(java.lang.String aktaKwn);
  public abstract void setNoAktaKwn(java.lang.String noAktaKwn);
  public abstract void setTglKwn(java.lang.String tglKwn);
  public abstract void setAktaCrai(java.lang.String aktaCrai);
  public abstract void setNoAktaCrai(java.lang.String noAktaCrai);
  public abstract void setTglCrai(java.lang.String tglCrai);
  public abstract void setStatHbkel(java.lang.String statHbkel);
  public abstract void setKlainFsk(java.lang.String klainFsk);
  public abstract void setPnydngCct(java.lang.String pnydngCct);
  public abstract void setPddkAkh(java.lang.String pddkAkh);
  public abstract void setJenisPkrjn(java.lang.String jenisPkrjn);
  public abstract void setNikIbu(java.lang.String nikIbu);
  public abstract void setNamaLgkpIbu(java.lang.String namaLgkpIbu);
  public abstract void setNikAyah(java.lang.String nikAyah);
  public abstract void setNamaLgkpAyah(java.lang.String namaLgkpAyah);
  public abstract void setNamaKetRt(java.lang.String namaKetRt);
  public abstract void setNamaKetRw(java.lang.String namaKetRw);
  public abstract void setNamaPetReg(java.lang.String namaPetReg);
  public abstract void setNipPetReg(java.lang.String nipPetReg);
  public abstract void setNamaPetEntri(java.lang.String namaPetEntri);
  public abstract void setNipPetEntri(java.lang.String nipPetEntri);
  public abstract void setTglEntri(java.lang.String tglEntri);
  public abstract void setNoKk(java.lang.String noKk);
  public abstract void setJenisBntu(java.lang.String jenisBntu);
  public abstract void setNoProp(java.lang.String noProp);
  public abstract void setNoKab(java.lang.String noKab);
  public abstract void setNoKec(java.lang.String noKec);
  public abstract void setNoKel(java.lang.String noKel);
  public abstract void setStatHidup(java.lang.String statHidup);
  public abstract void setTglUbah(java.lang.String tglUbah);
  public abstract void setTglCetakKtp(java.lang.String tglCetakKtp);
  public abstract void setTglGantiKtp(java.lang.String tglGantiKtp);
  public abstract void setTglPjgKtp(java.lang.String tglPjgKtp);
  public abstract void setStatKtp(java.lang.String statKtp);
  public abstract void setAlsNumpang(java.lang.String alsNumpang);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract java.lang.String getNik();
  public abstract java.lang.String getNoKtp();
  public abstract java.lang.String getTmptSbl();
  public abstract java.lang.String getNoPaspor();
  public abstract java.lang.String getTglAkhPaspor();
  public abstract java.lang.String getNamaLgkp();
  public abstract java.lang.String getJenisKlmin();
  public abstract java.lang.String getTmptLhr();
  public abstract java.lang.String getTglLhr();
  public abstract java.lang.String getAktaLhr();
  public abstract java.lang.String getNoAktaLhr();
  public abstract java.lang.String getGolDrh();
  public abstract java.lang.String getAgama();
  public abstract java.lang.String getStatKwn();
  public abstract java.lang.String getAktaKwn();
  public abstract java.lang.String getNoAktaKwn();
  public abstract java.lang.String getTglKwn();
  public abstract java.lang.String getAktaCrai();
  public abstract java.lang.String getNoAktaCrai();
  public abstract java.lang.String getTglCrai();
  public abstract java.lang.String getStatHbkel();
  public abstract java.lang.String getKlainFsk();
  public abstract java.lang.String getPnydngCct();
  public abstract java.lang.String getPddkAkh();
  public abstract java.lang.String getJenisPkrjn();
  public abstract java.lang.String getNikIbu();
  public abstract java.lang.String getNamaLgkpIbu();
  public abstract java.lang.String getNikAyah();
  public abstract java.lang.String getNamaLgkpAyah();
  public abstract java.lang.String getNamaKetRt();
  public abstract java.lang.String getNamaKetRw();
  public abstract java.lang.String getNamaPetReg();
  public abstract java.lang.String getNipPetReg();
  public abstract java.lang.String getNamaPetEntri();
  public abstract java.lang.String getNipPetEntri();
  public abstract java.lang.String getTglEntri();
  public abstract java.lang.String getNoKk();
  public abstract java.lang.String getJenisBntu();
  public abstract java.lang.String getNoProp();
  public abstract java.lang.String getNoKab();
  public abstract java.lang.String getNoKec();
  public abstract java.lang.String getNoKel();
  public abstract java.lang.String getStatHidup();
  public abstract java.lang.String getTglUbah();
  public abstract java.lang.String getTglCetakKtp();
  public abstract java.lang.String getTglGantiKtp();
  public abstract java.lang.String getTglPjgKtp();
  public abstract java.lang.String getStatKtp();
  public abstract java.lang.String getAlsNumpang();
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