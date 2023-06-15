package com.P4B;
import com.Info.*;

public class P4BBioObject extends Acknowledge implements java.io.Serializable
{
  private String nama_kep=null;
   private String alamat=null;
   private String noRt=null;
   private String noRw=null;
   private String dusun=null;
   private String kodePos=null;
   private String telp=null;
   private String nik=null;
   private String noKtp=null;
   private String tmptSbl=null;
   private String noPaspor=null;
   private String tglAkhPaspor=null;
   private String namaLgkp=null;
   private String jenisKlmin=null;
   private String tmptLhr=null;
   private String tglLhr=null;
   private String aktaLhr=null;
   private String noAktaLhr=null;
   private String golDrh=null;
   private String agama=null;
   private String statKwn=null;
   private String aktaKwn=null;
   private String noAktaKwn=null;
   private String tglKwn=null;
   private String aktaCrai=null;
   private String noAktaCrai=null;
   private String tglCrai=null;
   private String statHbkel=null;
   private String klainFsk=null;
   private String pnydngCct=null;
   private String pddkAkh=null;
   private String jenisPkrjn=null;
   private String nikIbu=null;
   private String namaLgkpIbu=null;
   private String nikAyah=null;
   private String namaLgkpAyah=null;
   private String namaKetRt=null;
   private String namaKetRw=null;
   private String namaPetReg=null;
   private String nipPetReg=null;
   private String namaPetEntri=null;
   private String nipPetEntri=null;
   private String tglEntri=null;
   private String noKk=null;
   private String no_prop=null;
   private String no_kab=null;
   private String no_kec=null;
   private String no_kel=null;
   private String ddpaspor="";
   private String mmpaspor="";
   private String yypaspor="";
   private String ddlahir=null;
   private String mmlahir=null;
   private String yylahir=null;
   private String ddkawin="";
   private String mmkawin="";
   private String yykawin="";
   private String ddcerai="";
   private String mmcerai="";
   private String yycerai="";
   private String ddPaspor="";
   private String mmPaspor="";
   private String yyPaspor="";
   private String ddtglLhr=null;
   private String mmtglLhr=null;
   private String yytglLhr=null;
   private String ddtglKwn="";
   private String mmtglKwn="";
   private  String yytglKwn="";
   private String ddtglCrai="";
   private String mmtglCrai="";
   private String yytglCrai="";
   private String jenis_klmn_lma=null;
   private String tgllhr_lma=null;
   private String agama_txt=null;
   private String agamaIdx=null;
   private String jenisLma=null;
   private String ddNow=null;
   private String mmNow=null;
   private String yyNow=null;
   private String custom=null;
   private String hbkelexsts=null;
  public P4BBioObject()
  {

  }

 public P4BBioObject(String no_kk,String nama_kep, String alamat,
                       String noRt, String noRw,
                       String dusun, String kodePos,
                       String telp,
                       String nik, String noKtp,
                       String tmptSbl, String noPaspor,
                       String tglAkhPaspor, String namaLgkp,
                       String jenisKlmin, String tmptLhr,
                       String tglLhr, String aktaLhr,
                       String noAktaLhr, String golDrh,
                       String agama, String statKwn,
                       String aktaKwn, String noAktaKwn,
                       String tglKwn, String aktaCrai,
                       String noAktaCrai, String tglCrai,
                       String statHbkel, String
                       klainFsk, String pnydngCct,
                       String pddkAkh,
                       String jenisPkrjn,
                       String nikIbu, String namaLgkpIbu,
                       String nikAyah, String namaLgkpAyah,
                       String namaKetRt, String namaKetRw,
                       String namaPetReg, String nipPetReg,
                       String namaPetEntri,
                       String nipPetEntri,
                       String tglEntri)
  {
       this.nama_kep = (nama_kep==null)?"-":nama_kep.toUpperCase();
       this.alamat = (alamat==null)?"-":alamat.toUpperCase();
       this.noRt = (noRt==null)?"":noRt;
       this.noRw = (noRw==null)?"":noRw;
       this.dusun = (dusun==null)?"-":dusun.toUpperCase();
       this.kodePos = (kodePos==null)?"":kodePos;
       this.telp = (telp==null)?"":telp;
       this.nik = nik;
       this.noKtp = (noKtp==null)?"-":noKtp;
       this.tmptSbl = (tmptSbl==null)?"-":tmptSbl.toUpperCase();
       this.noPaspor = (noPaspor.equals("null"))?"-":noPaspor;
       this.tglAkhPaspor = ((tglAkhPaspor==null)||(tglAkhPaspor.trim().equals("")))?"-":tglAkhPaspor;
       this.namaLgkp = (namaLgkp==null)?"-":namaLgkp.toUpperCase();
       this.jenisKlmin = jenisKlmin;
       this.tmptLhr = (tmptLhr==null)?"-":tmptLhr.toUpperCase();
       this.tglLhr = (tglLhr==null)?"-":tglLhr;
       this.aktaLhr = aktaLhr;
       this.noAktaLhr = (noAktaLhr==null)?"-":noAktaLhr;
       this.golDrh = golDrh;
       this.agama = (agama==null)?"-":agama.toUpperCase();
       this.statKwn = statKwn;
       this.aktaKwn = aktaKwn;
       this.noAktaKwn = (noAktaKwn==null)?"-":noAktaKwn;
       this.tglKwn = ((tglKwn==null)||(tglKwn.trim().equals("")))?"-":tglKwn;
       this.aktaCrai = aktaCrai;
       this.noAktaCrai = (noAktaCrai==null)?"-":noAktaCrai;
       this.tglCrai = ((tglCrai==null)||(tglCrai.trim().equals("")))?"-":tglCrai;
       this.statHbkel = statHbkel;
       this.klainFsk = klainFsk;
       this.pnydngCct = pnydngCct;
       this.pddkAkh = pddkAkh;
       this.jenisPkrjn = jenisPkrjn;
       this.nikIbu = (nikIbu==null)?"":nikIbu;
       this.namaLgkpIbu = (namaLgkpIbu==null)?"-":namaLgkpIbu.toUpperCase();
       this.nikAyah = (nikAyah==null)?"":nikAyah;
       this.namaLgkpAyah = (namaLgkpAyah==null)?"-":namaLgkpAyah.toUpperCase();
       this.namaKetRt = (namaKetRt==null)?"-":namaKetRt.toUpperCase();
       this.namaKetRw = (namaKetRw==null)?"-":namaKetRw.toUpperCase();
       this.namaPetReg = (namaPetReg==null)?"-":namaPetReg.toUpperCase();
       this.nipPetReg = (nipPetReg==null)?"":nipPetReg;
       this.namaPetEntri = (namaPetEntri==null)?"-":namaPetEntri.toUpperCase();
       this.nipPetEntri = nipPetEntri;
       this.tglEntri = tglEntri;
       this.noKk=no_kk;
}


public  P4BBioObject(String no_kk,String nama_kep,String alamat,
                                     String noRt, String noRw,
                                     String dusun, String kodePos,
                                     String telp,
                                     String nik, String namaLgkp,String noKtp,
                                     String tmptSbl, String noPaspor,
                                     String ddPaspor,String mmPaspor,String yyPaspor,
                                     String jenis_klmn_lma,
                                     String jenisKlmin, String tmptLhr,
                                     String tgllhr_lma,
                                     String ddtglLhr,  String mmtglLhr, String yytglLhr,
                                     String aktaLhr,String noAktaLhr, String golDrh,
                                     String agama, String agama_txt, String statKwn,
                                     String aktaKwn, String noAktaKwn,
                                     String ddtglKwn, String mmtglKwn, String yytglKwn, String aktaCrai,
                                     String noAktaCrai, String ddtglCrai,String mmtglCrai,String yytglCrai,
                                     String statHbkel, String klainFsk, String pnydngCct,
                                     String pddkAkh,String jenisPkrjn,String nikIbu, String namaLgkpIbu,
                                     String nikAyah, String namaLgkpAyah,String namaKetRt, String namaKetRw,
                                     String namaPetReg, String nipPetReg,String namaPetEntri,String nipPetEntri,
                                     String tglEntri,String no_prop,String no_kab,String no_kec,String no_kel)
                                     {
               this.noKk=no_kk;
               this.nama_kep = (nama_kep==null)?"-":nama_kep.toUpperCase();
               this.alamat = (alamat==null)?"-":alamat.toUpperCase();
               this.noRt = (noRt==null)?"":noRt.trim();
               this.noRw = (noRw==null)?"":noRw.trim();
               this.dusun = (dusun==null)?"-":dusun.toUpperCase();
               this.kodePos = (kodePos==null)?"":kodePos.trim();
               this.telp = telp;
               this.nik = nik;
               this.noKtp = noKtp;
               this.tmptSbl = (tmptSbl==null)?"-":tmptSbl.toUpperCase();
               this.noPaspor = (noPaspor==null)?"-":noPaspor;
               this.ddPaspor=ddPaspor;
               this.mmPaspor=mmPaspor;
               this.yyPaspor=yyPaspor;
               this.namaLgkp = (namaLgkp==null)?"-":namaLgkp.toUpperCase();
               this.jenis_klmn_lma=jenis_klmn_lma;
               this.jenisKlmin = jenisKlmin;
               this.tmptLhr = (tmptLhr==null)?"-":tmptLhr.toUpperCase();
               this.tgllhr_lma=tgllhr_lma;
               this.ddtglLhr=ddtglLhr;
               this.mmtglLhr=mmtglLhr;
               this.yytglLhr=yytglLhr;
               this.aktaLhr = aktaLhr;
               this.noAktaLhr = (noAktaLhr==null)?"-":noAktaLhr;
               this.golDrh = golDrh;
               this.agama = (agama==null)?"-":agama.toUpperCase();
               this.agama_txt=agama_txt;
               this.statKwn = statKwn;
               this.aktaKwn = aktaKwn;
               this.noAktaKwn = (noAktaKwn==null)?"-":noAktaKwn;
               this.ddtglKwn= ddtglKwn;
               this.mmtglKwn=mmtglKwn;
               this.yytglKwn=yytglKwn;
               this.aktaCrai = aktaCrai;
               this.noAktaCrai = (noAktaCrai==null)?"-":noAktaCrai;
               this.ddtglCrai=ddtglCrai;
               this.mmtglCrai=mmtglCrai;
               this.yytglCrai=yytglCrai;
               this.statHbkel = statHbkel;
               this.klainFsk = klainFsk;
               this.pnydngCct = pnydngCct;
               this.pddkAkh = pddkAkh;
               this.jenisPkrjn = jenisPkrjn;
               this.nikIbu = (nikIbu==null)?"":nikIbu.trim();
               this.namaLgkpIbu = (namaLgkpIbu==null)?"-":namaLgkpIbu.toUpperCase();
               this.nikAyah = (nikAyah==null)?"":nikAyah.trim();
               this.namaLgkpAyah = (namaLgkpAyah==null)?"-":namaLgkpAyah.toUpperCase();
               this.namaKetRt = (namaKetRt==null)?"-":namaKetRt.toUpperCase();
               this.namaKetRw = (namaKetRw==null)?"-":namaKetRw.toUpperCase();
               this.namaPetReg = (namaPetReg==null)?"-":namaPetReg.toUpperCase();
               this.nipPetReg = (nipPetReg==null)?"":nipPetReg.trim();
               this.namaPetEntri = (namaPetEntri==null)?"-":namaPetEntri.toUpperCase();
               this.nipPetEntri = nipPetEntri.trim();
               this.tglEntri = tglEntri;
               this.no_prop=no_prop;
               this.no_kab=no_kab;
               this.no_kec=no_kec;
               this.no_kel=no_kel;
}

/*Begin Private Function*/

private boolean isTglNull(String ddtgl,String mmtgl,String yytgl)
{
  boolean flag=false;
               if (((ddtgl!=null) && (!ddtgl.trim().equals("")))
                  &&
                  ((mmtgl!=null) && (!mmtgl.trim().equals("")))
                  &&
                  ((yytgl!=null) && (!yytgl.trim().equals(""))))
                {
                  flag=true;

                }
return flag;
}

private String tglReFormat(String ddtgl,String mmtgl,String yytgl)
              {
                return(ddtgl.trim()+"-"+mmtgl.trim()+"-"+yytgl.trim());
              }

/*End Private Function*/

public String getJenisLma()
{
return jenis_klmn_lma;
}

public String getTglLhrLma()
{
return tgllhr_lma;
}

public String getTglPasporform()
{
                 String tgl=null;
   if (isTglNull(ddPaspor,mmPaspor,yyPaspor))
     tgl=tglReFormat(ddPaspor,mmPaspor,yyPaspor);
   return tgl;
}

 public String getTglLahirform()
 {
                 String tgl=null;
    if (isTglNull(ddtglLhr,mmtglLhr,yytglLhr))
      tgl=tglReFormat(ddtglLhr,mmtglLhr,yytglLhr);
    return tgl;
 }

 public String getTglKawinform()
 {
                 String tgl=null;
    if (isTglNull(ddtglKwn,mmtglKwn,yytglKwn))
      tgl=tglReFormat(ddtglKwn,mmtglKwn,yytglKwn);
    return tgl;
 }

 public String getTglCeraiform()
 {
                 String tgl=null;
    if (isTglNull(ddtglCrai,mmtglCrai,yytglCrai))
      tgl=tglReFormat(ddtglCrai,mmtglCrai,yytglCrai);
    return tgl;
 }


public boolean isNewNik(String tgl_lma,String tgl_bru,String jenis_lma,String jenis_bru)
{
   if (tgl_lma.trim().equals(tgl_bru.trim()) && jenis_lma.trim().equals(jenis_bru.trim()))
   return false;
      return true;
}

public boolean isKK()
    {
      if (statHbkel.trim().equals("1")) return true;
      return false;
    }



public String getNoKk() {
return noKk;
}

public void setNoKk(String noKk) {
this.noKk = noKk;
}
public String getNama_kep() {
    return nama_kep;
  }
  public void setNama_kep(String nama_kep) {
    this.nama_kep = nama_kep;
  }
  public String getAlamat() {
    return alamat;
  }
  public void setAlamat(String alamat) {
    this.alamat = alamat;
  }
  public String getNoRt() {
    return noRt;
  }
  public void setNoRt(String noRt) {
    this.noRt = noRt;
  }
  public String getNoRw() {
    return noRw;
  }
  public void setNoRw(String noRw) {
    this.noRw = noRw;
  }
  public String getDusun() {
    return dusun;
  }
  public void setDusun(String dusun) {
    this.dusun = dusun;
  }
  public String getKodePos() {
    return kodePos;
  }
  public void setKodePos(String kodePos) {
    this.kodePos = kodePos;
  }
  public String getTelp() {
    return telp;
  }
  public void setTelp(String telp) {
    this.telp = telp;
  }
  public String getNik() {
    return nik;
  }
  public void setNik(String nik) {
    this.nik = nik;
  }
  public String getNoKtp() {
    return noKtp;
  }
  public void setNoKtp(String noKtp) {
    this.noKtp = noKtp;
  }
  public String getTmptSbl() {
    return tmptSbl;
  }
  public void setTmptSbl(String tmptSbl) {
    this.tmptSbl = tmptSbl;
  }
  public String getNoPaspor() {
    return noPaspor;
  }
  public void setNoPaspor(String noPaspor) {
    this.noPaspor = noPaspor;
  }
  public String getTglAkhPaspor() {
    return tglAkhPaspor;
  }

  public void setTglAkhPaspor(String tglAkhPaspor) {
    this.tglAkhPaspor = tglAkhPaspor;
  }
  public String getNamaLgkp() {
    return namaLgkp;
  }
  public void setNamaLgkp(String namaLgkp) {
    this.namaLgkp = namaLgkp;
  }
  public String getJenisKlmin() {
    return jenisKlmin;
  }
  public void setJenisKlmin(String jenisKlmin) {
    this.jenisKlmin = jenisKlmin;
  }
  public String getTmptLhr() {
    return tmptLhr;
  }
  public void setTmptLhr(String tmptLhr) {
    this.tmptLhr = tmptLhr;
  }
  public String getTglLhr() {
    return tglLhr;
  }
  public void setTglLhr(String tglLhr) {
    this.tglLhr = tglLhr;
  }
  public String getAktaLhr() {
    return aktaLhr;
  }
  public void setAktaLhr(String aktaLhr) {
    this.aktaLhr = aktaLhr;
  }
  public String getNoAktaLhr() {
    return noAktaLhr;
  }
  public void setNoAktaLhr(String noAktaLhr) {
    this.noAktaLhr = noAktaLhr;
  }
  public String getGolDrh() {
    return golDrh;
  }
  public void setGolDrh(String golDrh) {
    this.golDrh = golDrh;
  }
  public String getAgama() {
    System.out.println("Agama=" + agama);
    return agama;
  }
  public void setAgama(String agama) {
    this.agama = agama;
  }
  public String getStatKwn() {
    return statKwn;
  }
  public void setStatKwn(String statKwn) {
    this.statKwn = statKwn;
  }
  public String getAktaKwn() {
    return aktaKwn;
  }
  public void setAktaKwn(String aktaKwn) {
    this.aktaKwn = aktaKwn;
  }
  public String getNoAktaKwn() {
    return noAktaKwn;
  }
  public void setNoAktaKwn(String noAktaKwn) {
    this.noAktaKwn = noAktaKwn;
  }
  public String getTglKwn() {
    return tglKwn;
  }
  public void setTglKwn(String tglKwn) {
    this.tglKwn = tglKwn;
  }
  public String getAktaCrai() {
    return aktaCrai;
  }
  public void setAktaCrai(String aktaCrai) {
    this.aktaCrai = aktaCrai;
  }
  public String getNoAktaCrai() {
    return noAktaCrai;
  }
  public void setNoAktaCrai(String noAktaCrai) {
    this.noAktaCrai = noAktaCrai;
  }
  public String getTglCrai() {
    return tglCrai;
  }
  public void setTglCrai(String tglCrai) {
    this.tglCrai = tglCrai;
  }
  public String getStatHbkel() {
    return statHbkel;
  }
  public void setStatHbkel(String statHbkel) {
    this.statHbkel = statHbkel;
  }
  public String getKlainFsk() {
    return klainFsk;
  }
  public void setKlainFsk(String klainFsk) {
    this.klainFsk = klainFsk;
  }
  public String getPnydngCct() {
    return pnydngCct;
  }
  public void setPnydngCct(String pnydngCct) {
    this.pnydngCct = pnydngCct;
  }
  public String getPddkAkh() {
    return pddkAkh;
  }
  public void setPddkAkh(String pddkAkh) {
    this.pddkAkh = pddkAkh;
  }
  public String getJenisPkrjn() {
    return jenisPkrjn;
  }
  public void setJenisPkrjn(String jenisPkrjn) {
    this.jenisPkrjn = jenisPkrjn;
  }
  public String getNikIbu() {
    return nikIbu;
  }
  public void setNikIbu(String nikIbu) {
    this.nikIbu = nikIbu;
  }
  public String getNamaLgkpIbu() {
    return namaLgkpIbu;
  }
  public void setNamaLgkpIbu(String namaLgkpIbu) {
    this.namaLgkpIbu = namaLgkpIbu;
  }
  public String getNikAyah() {
    return nikAyah;
  }
  public void setNikAyah(String nikAyah) {
    this.nikAyah = nikAyah;
  }
  public String getNamaLgkpAyah() {
    return namaLgkpAyah;
  }
  public void setNamaLgkpAyah(String namaLgkpAyah) {
    this.namaLgkpAyah = namaLgkpAyah;
  }
  public String getNamaKetRt() {
    return namaKetRt;
  }
  public void setNamaKetRt(String namaKetRt) {
    this.namaKetRt = namaKetRt;
  }
  public String getNamaKetRw() {
    return namaKetRw;
  }
  public void setNamaKetRw(String namaKetRw) {
    this.namaKetRw = namaKetRw;
  }
  public String getNamaPetReg() {
    return namaPetReg;
  }
  public void setNamaPetReg(String namaPetReg) {
    this.namaPetReg = namaPetReg;
  }
  public String getNipPetReg() {
    return nipPetReg;
  }
  public void setNipPetReg(String nipPetReg) {
    this.nipPetReg = nipPetReg;
  }
  public String getNamaPetEntri() {
    return namaPetEntri;
  }
  public void setNamaPetEntri(String namaPetEntri) {
    this.namaPetEntri = namaPetEntri;
  }
  public String getNipPetEntri() {
    return nipPetEntri;
  }
  public void setNipPetEntri(String nipPetEntri) {
    this.nipPetEntri = nipPetEntri;
  }
  public String getTglEntri() {
    return tglEntri;
  }
  public void setTglEntri(String tglEntri) {
    this.tglEntri = tglEntri;
  }
  public String getNo_prop() {
    return no_prop;
  }
  public void setNo_prop(String no_prop) {
    this.no_prop = no_prop;
  }
  public String getNo_kab() {
    return no_kab;
  }
  public void setNo_kab(String no_kab) {
    this.no_kab = no_kab;
  }
  public String getNo_kec() {
    return no_kec;
  }
  public void setNo_kec(String no_kec) {
    this.no_kec = no_kec;
  }
  public String getNo_kel() {
    return no_kel;
  }
  public void setNo_kel(String no_kel) {
    this.no_kel = no_kel;
  }
  public String getDdpaspor() {

    if (!tglAkhPaspor.equals("-"))
    {
      ddpaspor=getSegment(tglAkhPaspor,0,2);
    }
    return ddpaspor;
  }

  public void setDdpaspor(String ddpaspor) {
    this.ddpaspor = ddpaspor;
  }
  public String getMmpaspor() {
    if (!tglAkhPaspor.equals("-"))
{
  mmpaspor=getSegment(tglAkhPaspor,3,5);
}
return mmpaspor;
  }
  public void setMmpaspor(String mmpaspor) {
    this.mmpaspor = mmpaspor;
  }

  public String getYypaspor() {
    if (!tglAkhPaspor.equals("-"))
    {
      yypaspor=getSegment(tglAkhPaspor,6,tglAkhPaspor.length());
    }
    return yypaspor;
  }

  public void setYypaspor(String yypaspor) {
    this.yypaspor = yypaspor;
  }
  public String getDdlahir() {
    if (tglLhr==null)   tglLhr=getTglLahirform();
    ddlahir=getSegment(tglLhr,0,2);
    return ddlahir;
  }
  public void setDdlahir(String ddlahir) {
    this.ddlahir = ddlahir;
  }
  public String getMmlahir() {
    if (tglLhr==null)   tglLhr=getTglLahirform();
        mmlahir=getSegment(tglLhr,3,5);
    return mmlahir;
  }
  public void setMmlahir(String mmlahir) {
    this.mmlahir = mmlahir;
  }
  public String getYylahir() {
    if (tglLhr==null)   tglLhr=getTglLahirform();
    yylahir=getSegment(tglLhr,6,tglLhr.length());
    return yylahir;
  }
  public void setYylahir(String yylahir) {
    this.yylahir = yylahir;
  }
  public String getDdkawin() {
    if (!tglKwn.equals("-"))
    {
      ddkawin =getSegment(tglKwn,0,2);
    }
    return ddkawin;
  }

  public void setDdkawin(String ddkawin) {
    this.ddkawin = ddkawin;
  }

  public String getMmkawin() {
    if (!tglKwn.equals("-"))
    {
  mmkawin =getSegment(tglKwn,3,5);
    }
    return mmkawin;
  }
  public void setMmkawin(String mmkawin) {
    this.mmkawin = mmkawin;
  }
  public String getYykawin() {
    if (!tglKwn.equals("-"))
    {
      yykawin =getSegment(tglKwn,6,tglKwn.length());
    }
    return yykawin;
  }
  public void setYykawin(String yykawin) {
    this.yykawin = yykawin;
  }
  public String getDdcerai() {
    if (!tglCrai.equals("-"))
    {
      ddcerai =getSegment(tglCrai,0,2);
    }
    return ddcerai;
  }
  public void setDdcerai(String ddcerai) {
    this.ddcerai = ddcerai;
  }
  public String getMmcerai() {
    if (!tglCrai.equals("-"))
    {
      mmcerai =getSegment(tglCrai,3,5);
    }
    return mmcerai;
  }
  public void setMmcerai(String mmcerai) {
    this.mmcerai = mmcerai;
  }
  public String getYycerai() {
    if (!tglCrai.equals("-"))
    {
      yycerai =getSegment(tglCrai,6,tglCrai.length());
    }
    return yycerai;
  }

  public void setYycerai(String yycerai) {
    this.yycerai = yycerai;
  }

public String getAgamaIdx()
{
  String idx="";
  if (agama.trim().equals("Islam"))  idx="1";
  if (agama.trim().equals("Kristen"))  idx="2";
  if (agama.trim().equals("Katholik"))  idx="3";
  if (agama.trim().equals("Hindu"))  idx="4";
  if (agama.trim().equals("Budha"))  idx="5";
  return idx;
}

private String getSegment(String data,int start,int end)
{
    return data.substring(start,end);
}
  public String getAgama_txt() {
    return agama_txt;
  }
  public void setAgama_txt(String agama_txt) {
    this.agama_txt = agama_txt;
  }
  public String getDdPaspor() {
    return ddPaspor;
  }

  public String getDdtglKwn() {
    return ddtglKwn;
  }
  public String getDdtglLhr() {
    return ddtglLhr;
  }
  public void setDdPaspor(String ddPaspor) {
    this.ddPaspor = ddPaspor;
  }
  public void setDdtglCrai(String ddtglCrai) {
    this.ddtglCrai = ddtglCrai;
  }
  public void setDdtglKwn(String ddtglKwn) {
    this.ddtglKwn = ddtglKwn;
  }
  public void setDdtglLhr(String ddtglLhr) {
    this.ddtglLhr = ddtglLhr;
  }
  public void setAgamaIdx(String agamaIdx) {
    this.agamaIdx = agamaIdx;
  }
  public String getJenis_klmn_lma() {
    return jenis_klmn_lma;
  }
  public void setJenis_klmn_lma(String jenis_klmn_lma) {
    this.jenis_klmn_lma = jenis_klmn_lma;
  }
  public void setJenisLma(String jenisLma) {
    this.jenisLma = jenisLma;
  }
  public String getDdNow() {
    return tglEntri.substring(0,2);
  }
  public void setDdNow(String ddNow) {
    this.ddNow = ddNow;
  }
  public String getMmNow() {
    return tglEntri.substring(3,5);
  }
  public void setMmNow(String mmNow) {
    this.mmNow = mmNow;
  }
  public String getYyNow() {
    return tglEntri.substring(6,tglEntri.length());
  }
  public void setYyNow(String yyNow) {
    this.yyNow = yyNow;
  }
 public void setCustom(String extend)
 {
     custom=extend;
 }

 public String getCustom()
  {
    return custom;
  }

public void setHbkelExists(String hbkelexsts)
  {
    this.hbkelexsts=hbkelexsts;
  }

public String getHbkelExists()
  {
    return hbkelexsts;
  }
}