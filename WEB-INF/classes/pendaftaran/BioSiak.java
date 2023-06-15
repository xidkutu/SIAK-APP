package pendaftaran;
import com.Info.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class BioSiak extends Acknowledge implements
    java.io.Serializable
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
   private String propnama=null;
   private String kabnama=null;
   private String kecnama=null;
   private String kelnama=null;
  private String b_pddkn;
  private String b_pddkn_lama;
  private String b_gelar_dpm;
  private String b_gelar_blk;
  private String b_gelar_tmp;
  private String b_ijazah_no;
  private String b_ijazah_tgl;
  private String b_ijazah_ins;
  private String b_ijazah_ttd;
  private String b_ptg_nama;
  private String b_ptg_nip;
  private String b_entri_nama;
  private String b_entri_nip;
  private String b_entri_tgl;
  private String c_pkrjn;
  private String c_pkrjn_lama;
  private String c_sk_no;
  private String c_sk_tgl;
  private String c_sk_ins;
  private String c_sk_ttd;
  private String c_ptg_nama;
  private String c_ptg_nip;
  private String c_entri_nama;
  private String c_entri_nip;
  private String c_entri_tgl;

public BioSiak() {
  }

 public BioSiak(String no_kk,String nama_kep, String alamat,
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
       this.noAktaLhr = ((noAktaLhr==null)||(noAktaLhr.trim().equals("0")))?"-":noAktaLhr;
       this.golDrh = golDrh;
       this.agama = (agama==null)?"-":agama.toUpperCase();
       this.statKwn = statKwn;
       this.aktaKwn = aktaKwn;
       this.noAktaKwn = ((noAktaKwn==null)||(noAktaKwn.trim().equals("0")))?"-":noAktaKwn;
       this.tglKwn = ((tglKwn==null)||(tglKwn.trim().equals("")))?"-":tglKwn;
       this.aktaCrai = aktaCrai;
       this.noAktaCrai = ((noAktaCrai==null)||(noAktaCrai.trim().equals("0")))?"-":noAktaCrai;
       this.tglCrai = ((tglCrai==null)||(tglCrai.trim().equals("")))?"-":tglCrai;
       this.statHbkel = statHbkel;
       this.klainFsk = klainFsk;
       this.pnydngCct = pnydngCct;
       this.pddkAkh = pddkAkh;
       this.jenisPkrjn = jenisPkrjn;
       this.nikIbu = ((nikIbu==null)||(nikIbu.trim().equals("0")))?"":nikIbu;
       this.namaLgkpIbu = (namaLgkpIbu==null)?"-":namaLgkpIbu.toUpperCase();
       this.nikAyah = ((nikAyah==null)||(nikAyah.trim().equals("0")))?"":nikAyah;
       this.namaLgkpAyah = (namaLgkpAyah==null)?"-":namaLgkpAyah.toUpperCase();
       this.namaKetRt = (namaKetRt==null)?"-":namaKetRt.toUpperCase();
       this.namaKetRw = (namaKetRw==null)?"-":namaKetRw.toUpperCase();
       this.namaPetReg = (namaPetReg==null)?"-":namaPetReg.toUpperCase();
       this.nipPetReg = ((nipPetReg==null)||(nipPetReg.trim().equals("0")))?"":nipPetReg;
       this.namaPetEntri = (namaPetEntri==null)?"-":namaPetEntri.toUpperCase();
       this.nipPetEntri = nipPetEntri;
       this.tglEntri = tglEntri;
       this.noKk=no_kk;
}


public  BioSiak(String no_kk,String nama_kep,String alamat,
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

public BioSiak(String nik, String pddkn, String pddkn_lama, String gelar_dpm, String gelar_blk,
           String gelar_tmp, String ijazah_no, String ijazah_tgl, String ijazah_ins,
           String ijazah_ttd, String ptg_nama, String ptg_nip,
           String entri_nama, String entri_nip, String entri_tgl)
             {
               this.nik=nik;
               this.b_pddkn=pddkn;
               this.b_pddkn_lama=pddkn_lama;
               this.b_gelar_dpm=gelar_dpm;
               this.b_gelar_blk=gelar_blk;
               this.b_gelar_tmp=gelar_tmp;
               this.b_ijazah_no=ijazah_no;
               this.b_ijazah_tgl=ijazah_tgl;
               this.b_ijazah_ins=ijazah_ins;
               this.b_ijazah_ttd=ijazah_ttd;
               this.b_ptg_nama=ptg_nama;
               this.b_ptg_nip=ptg_nip;
               this.b_entri_nama=entri_nama;
               this.b_entri_nip=entri_nip;
               this.b_entri_tgl=entri_tgl;
             }

 public BioSiak(String nik, String pkrjn, String pkrjn_lama,
            String sk_no, String sk_tgl, String sk_ins,
            String sk_ttd, String ptg_nama, String ptg_nip,
            String entri_nama, String entri_nip, String entri_tgl)
              {
                this.nik=nik;
                this.c_pkrjn=pkrjn;
                this.c_pkrjn_lama=pkrjn_lama;
                this.c_sk_no=sk_no;
                this.c_sk_tgl=sk_tgl;
                this.c_sk_ins=sk_ins;
                this.c_sk_ttd=sk_ttd;
                this.c_ptg_nama=ptg_nama;
                this.c_ptg_nip=ptg_nip;
                this.c_entri_nama=entri_nama;
                this.c_entri_nip=entri_nip;
                this.c_entri_tgl=entri_tgl;
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
    return nikIbu.trim();
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
    return nikAyah.trim();
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
    return nipPetReg.trim();
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
    System.out.println("tglAkhPaspor="+ tglAkhPaspor + " ddpaspor="+ ddpaspor);
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
  if (agama.trim().toUpperCase().equals("ISLAM"))  idx="1";
  if (agama.trim().equals("KRISTEN"))  idx="2";
  if (agama.trim().equals("KATHOLIK"))  idx="3";
  if (agama.trim().equals("HINDU"))  idx="4";
  if (agama.trim().equals("BUDHA"))  idx="5";
    System.out.println("IDX="+ idx);
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

public void setPropNama(String propnama)
  {
    this.propnama=propnama;
  }
  public String getPropNama()
    {
  return propnama;
    }
    public void setKabNama(String kabnama)
      {
        this.kabnama=kabnama;
      }
      public String getKabNama()
        {
      return kabnama;
        }

        public void setKecNama(String kecnama)
          {
            this.kecnama=kecnama;
          }
          public String getKecNama()
            {
          return kecnama;
            }

            public void setKelNama(String kelnama)
              {
                this.kelnama=kelnama;
              }
              public String getKelNama()
                {
              return kelnama;
                }
  public String getB_pddkn() {
    return b_pddkn;
  }
  public void setB_pddkn(String b_pddkn) {
    this.b_pddkn = b_pddkn;
  }
  public String getB_pddkn_lama() {
    return b_pddkn_lama;
  }
  public void setB_pddkn_lama(String b_pddkn_lama) {
    this.b_pddkn_lama = b_pddkn_lama;
  }
  public String getB_gelar_dpm() {
    return b_gelar_dpm;
  }
  public void setB_gelar_dpm(String b_gelar_dpm) {
    this.b_gelar_dpm = b_gelar_dpm;
  }
  public String getB_gelar_blk() {
    return b_gelar_blk;
  }
  public void setB_gelar_blk(String b_gelar_blk) {
    this.b_gelar_blk = b_gelar_blk;
  }
  public String getB_gelar_tmp() {
    return b_gelar_tmp;
  }
  public void setB_gelar_tmp(String b_gelar_tmp) {
    this.b_gelar_tmp = b_gelar_tmp;
  }
  public String getB_ijazah_no() {
    return b_ijazah_no;
  }
  public void setB_ijazah_no(String b_ijazah_no) {
    this.b_ijazah_no = b_ijazah_no;
  }
  public String getB_ijazah_tgl() {
    return b_ijazah_tgl;
  }
  public void setB_ijazah_tgl(String b_ijazah_tgl) {
    this.b_ijazah_tgl = b_ijazah_tgl;
  }
  public String getB_ijazah_ins() {
    return b_ijazah_ins;
  }
  public void setB_ijazah_ins(String b_ijazah_ins) {
    this.b_ijazah_ins = b_ijazah_ins;
  }
  public String getB_ijazah_ttd() {
    return b_ijazah_ttd;
  }
  public void setB_ijazah_ttd(String b_ijazah_ttd) {
    this.b_ijazah_ttd = b_ijazah_ttd;
  }
  public String getB_ptg_nama() {
    return b_ptg_nama;
  }
  public void setB_ptg_nama(String b_ptg_nama) {
    this.b_ptg_nama = b_ptg_nama;
  }
  public String getB_ptg_nip() {
    return b_ptg_nip;
  }
  public void setB_ptg_nip(String b_ptg_nip) {
    this.b_ptg_nip = b_ptg_nip;
  }
  public String getB_entri_nama() {
    return b_entri_nama;
  }
  public void setB_entri_nama(String b_entri_nama) {
    this.b_entri_nama = b_entri_nama;
  }
  public String getB_entri_nip() {
    return b_entri_nip;
  }
  public void setB_entri_nip(String b_entri_nip) {
    this.b_entri_nip = b_entri_nip;
  }
  public String getB_entri_tgl() {
    return b_entri_tgl;
  }
  public void setB_entri_tgl(String b_entri_tgl) {
    this.b_entri_tgl = b_entri_tgl;
  }
  public String getC_pkrjn() {
    return c_pkrjn;
  }
  public void setC_pkrjn(String c_pkrjn) {
    this.c_pkrjn = c_pkrjn;
  }
  public String getC_pkrjn_lama() {
    return c_pkrjn_lama;
  }
  public void setC_pkrjn_lama(String c_pkrjn_lama) {
    this.c_pkrjn_lama = c_pkrjn_lama;
  }
  public String getC_sk_no() {
    return c_sk_no;
  }
  public void setC_sk_no(String c_sk_no) {
    this.c_sk_no = c_sk_no;
  }
  public String getC_sk_tgl() {
    return c_sk_tgl;
  }
  public void setC_sk_tgl(String c_sk_tgl) {
    this.c_sk_tgl = c_sk_tgl;
  }
  public String getC_sk_ins() {
    return c_sk_ins;
  }
  public void setC_sk_ins(String c_sk_ins) {
    this.c_sk_ins = c_sk_ins;
  }
  public String getC_sk_ttd() {
    return c_sk_ttd;
  }
  public void setC_sk_ttd(String c_sk_ttd) {
    this.c_sk_ttd = c_sk_ttd;
  }
  public String getC_ptg_nama() {
    return c_ptg_nama;
  }
  public void setC_ptg_nama(String c_ptg_nama) {
    this.c_ptg_nama = c_ptg_nama;
  }
  public String getC_ptg_nip() {
    return c_ptg_nip;
  }
  public void setC_ptg_nip(String c_ptg_nip) {
    this.c_ptg_nip = c_ptg_nip;
  }
  public String getC_entri_nama() {
    return c_entri_nama;
  }
  public void setC_entri_nama(String c_entri_nama) {
    this.c_entri_nama = c_entri_nama;
  }
  public String getC_entri_nip() {
    return c_entri_nip;
  }
  public void setC_entri_nip(String c_entri_nip) {
    this.c_entri_nip = c_entri_nip;
  }
  public String getC_entri_tgl() {
    return c_entri_tgl;
  }
  public void setC_entri_tgl(String c_entri_tgl) {
    this.c_entri_tgl = c_entri_tgl;
  }
}
