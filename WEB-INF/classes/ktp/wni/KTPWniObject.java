package ktp.wni;

import java.io.*;

public class KTPWniObject implements Serializable
{
  private String nik, nama_lgkp, tmpt_lhr, tgl_lhr, jenis_klmin, gol_drh;
  private String alamat, no_rt, no_rw, nama_kel, nama_kec, nama_kab, nama_prop, agama, jenis_pkrjn;
  private String stat_kwn, tgl_berlaku, systgl, nip_pej, nama_pej;

  private String img_foto, kewarganegaraan;
  private boolean found;
  private String  no_paspor,no_dok,tgl_akh_dok;
  private String signture_per="";

  public KTPWniObject() {}

  public KTPWniObject(String nik, String img_foto)
  {
    this.nik = nik;
    this.img_foto = img_foto;
  }

  public KTPWniObject(String nik, String img_foto,String signture_per)
  {
    this.nik = nik;
    this.img_foto = img_foto;
    this.signture_per=(signture_per==null)?"-":signture_per;
  }



  public KTPWniObject(String nik, String nama_lgkp, String tgl_lhr, String alamat )
  {
    this.nik=(nik==null)?"-":nik;
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.alamat=(alamat==null)?"-":alamat;
  }

  public KTPWniObject(String nik, String nama_lgkp, String tgl_lhr, String alamat, boolean found )
  {
    this.nik=(nik==null)?"-":nik;
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.alamat=(alamat==null)?"-":alamat;

    this.found = found;
  }
  public KTPWniObject( String nik, String nama_lgkp, String tmpt_lhr, String tgl_lhr,
                       String jenis_klmin, String gol_drh, String alamat, String no_rt,
                       String no_rw, String nama_kel, String nama_kec, String nama_kab, String nama_prop,
                       String agama, String jenis_pkrjn, String stat_kwn, String tgl_berlaku,
                       String systgl, String img_foto, String kewarganegaraan )
  {
    this.nik=(nik==null)?"-":nik;
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
    this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
    this.gol_drh=(gol_drh==null)?"-":gol_drh;
    this.alamat=(alamat==null)?"-":alamat;
    this.no_rt=(no_rt==null)?"-":no_rt;
    this.no_rw=(no_rw==null)?"-":no_rw;
    this.nama_kel=(nama_kel==null)?"-":nama_kel;
    this.nama_kec=(nama_kec==null)?"-":nama_kec;
    this.nama_kab=(nama_kab==null)?"-":nama_kab;
    this.nama_prop=(nama_prop==null)?"-":nama_prop;
    this.agama=(agama==null)?"-":agama;
    this.jenis_pkrjn=(jenis_pkrjn==null)?"-":jenis_pkrjn;
    this.stat_kwn=(stat_kwn==null)?"-":stat_kwn;
    this.tgl_berlaku=(tgl_berlaku==null)?"-":tgl_berlaku;
    this.systgl=(systgl==null)?"-":systgl;

    this.img_foto=(img_foto==null)?"-":img_foto;
    this.kewarganegaraan = (kewarganegaraan==null)?"-":kewarganegaraan;
  }


  public KTPWniObject( String nik, String nama_lgkp, String tmpt_lhr, String tgl_lhr,
                         String kewarganegaraan,String jenis_klmin, String no_paspor,
                         String no_dok,String tgl_akh_dok,String alamat, String no_rt,
                         String no_rw, String tgl_berlaku,String systgl,String nama_kel, String nama_kec, String nama_kab, String nama_prop,
                         String img_foto)
    {

      this.nik=(nik==null)?"-":nik;
      this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
      this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
      this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
      this.kewarganegaraan = (kewarganegaraan==null)?"-":kewarganegaraan;
      this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
      this.no_paspor=(no_paspor==null)?"-":no_paspor;
      this.no_dok=(no_dok==null)?"-":no_dok;
      this.tgl_akh_dok=(tgl_akh_dok==null)?"-":tgl_akh_dok;
      this.alamat=(alamat==null)?"-":alamat;
      this.no_rt=(no_rt==null)?"-":no_rt;
      this.no_rw=(no_rw==null)?"-":no_rw;
      this.tgl_berlaku=(tgl_berlaku==null)?"-":tgl_berlaku;
      this.systgl=(systgl==null)?"-":systgl;
      this.nama_kel=(nama_kel==null)?"-":nama_kel;
      this.nama_kec=(nama_kec==null)?"-":nama_kec;
      this.nama_kab=(nama_kab==null)?"-":nama_kab;
      this.nama_prop=(nama_prop==null)?"-":nama_prop;
      this.img_foto=(img_foto==null)?"-":img_foto;
 }

public KTPWniObject(String nik, String nama_lgkp, String tmpt_lhr, String tgl_lhr,
                          String kewarganegaraan,String jenis_klmin, String no_paspor,
                          String no_dok,String tgl_akh_dok,String alamat, String no_rt,
                          String no_rw, String tgl_berlaku,String systgl,String nama_kel, String nama_kec, String nama_kab, String nama_prop,
                          String img_foto,String signture_per,String custom)
     {

       this.nik=(nik==null)?"-":nik;
       this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
       this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
       this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
       this.kewarganegaraan = (kewarganegaraan==null)?"-":kewarganegaraan;
       this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
       this.no_paspor=(no_paspor==null)?"-":no_paspor;
       this.no_dok=(no_dok==null)?"-":no_dok;
       this.tgl_akh_dok=(tgl_akh_dok==null)?"-":tgl_akh_dok;
       this.alamat=(alamat==null)?"-":alamat;
       this.no_rt=(no_rt==null)?"-":no_rt;
       this.no_rw=(no_rw==null)?"-":no_rw;
       this.tgl_berlaku=(tgl_berlaku==null)?"-":tgl_berlaku;
       this.systgl=(systgl==null)?"-":systgl;
       this.nama_kel=(nama_kel==null)?"-":nama_kel;
       this.nama_kec=(nama_kec==null)?"-":nama_kec;
       this.nama_kab=(nama_kab==null)?"-":nama_kab;
       this.nama_prop=(nama_prop==null)?"-":nama_prop;
       this.img_foto=(img_foto==null)?"-":img_foto;
       this.signture_per=(signture_per==null)?"-":signture_per;
  }


public String getSignature()
  {
    return signture_per;
  }

public void setSignature(String signture_per)
  {
       this.signture_per=(signture_per==null)?"-":signture_per;
  }

public void setFound(boolean found)
  {
    this.found = found;
  }
  public boolean getFound()
  {
    return found;
  }


public String getNoPaspor()
  {
    return no_paspor;
  }

public void setNoPaspor(String no_paspor)
  {
    this.no_paspor=(no_paspor==null)?"-":no_paspor;
  }

  public String getNoDok()
  {
    return no_dok;
  }
  public void setNoDok(String no_dok)
  {
this.no_dok=(no_dok==null)?"-":no_dok;
  }

  public String getTglAkhDok()
  {
    return tgl_akh_dok;
  }
  public void setTglAkhDok(String tgl_akh_dok)
  {
   this.tgl_akh_dok=(tgl_akh_dok==null)?"-":tgl_akh_dok;
  }

  public void setKewarganegaraan(String kewarganegaraan)
  {
    this.kewarganegaraan = kewarganegaraan;
  }
  public String getKewarganegaraan()
  {
    return kewarganegaraan;
  }

  public void setNik(String nik)
  {
    this.nik=(nik==null)?"-":nik;
  }
  public String getNik()
  {
    return nik;
  }
  public void setImg_foto(String img_foto)
  {
    this.img_foto = img_foto;
  }
  public String getImg_foto()
  {
    return img_foto;
  }

  public void setNama_lgkp(String nama_lgkp)
  {
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }

  public void setTmpt_lhr(String tmpt_lhr)
  {
    this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
  }
  public String getTmpt_lhr()
  {
   return tmpt_lhr;
  }

  public void setTgl_lhr(String tgl_lhr)
  {
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
  }
  public String getTgl_lhr()
  {
    return tgl_lhr;
  }

  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }

  public void setGol_drh(String gol_drh)
  {
    this.gol_drh=(gol_drh==null)?"-":gol_drh;
  }
  public String getGol_drh()
  {
    return gol_drh;
  }

  public void setAlamat(String alamat)
  {
    this.alamat=(alamat==null)?"-":alamat;
  }
  public String getAlamat()
  {
    return alamat;
  }

  public void setNo_rt(String no_rt)
  {
     this.no_rt=(no_rt==null)?"-":no_rt;
  }
  public String getNo_rt()
  {
    return no_rt;
  }

  public void setNo_rw(String no_rw)
  {
     this.no_rw=(no_rw==null)?"-":no_rw;
  }
  public String getNo_rw()
  {
    return no_rw;
  }
  public void setNama_kel(String nama_kel)
  {
    this.nama_kel=(nama_kel==null)?"-":nama_kel;
  }
  public String getNama_kel()
  {
    return nama_kel;
  }

  public void setNama_kec(String nama_kec)
  {
    this.nama_kec=(nama_kec==null)?"-":nama_kec;
  }
  public String getNama_kec()
  {
    return nama_kec;
  }
  public void setNama_kab(String nama_kab)
  {
    this.nama_kab=(nama_kab==null)?"-":nama_kab;
  }
  public String getNama_kab()
  {
    return nama_kab;
  }

  public void setNama_prop(String nama_prop)
  {
    this.nama_prop=(nama_prop==null)?"-":nama_prop;
  }
  public String getNama_prop()
  {
    return nama_prop;
  }

  public void setAgama(String agama)
  {
    this.agama=(agama==null)?"-":agama;
  }
  public String getAgama()
  {
    return agama;
  }
  public void setJenis_pkrjn(String jenis_pkrjn)
  {
    this.jenis_pkrjn=(jenis_pkrjn==null)?"-":jenis_pkrjn;
  }
  public String getJenis_pkrjn()
  {
    return jenis_pkrjn;
  }

  public void setStat_kwn(String stat_kwn)
  {
    this.stat_kwn=(stat_kwn==null)?"-":stat_kwn;
  }
  public String getStat_kwn()
  {
    return stat_kwn;
  }
  public void setTgl_berlaku(String tgl_berlaku)
  {
    this.tgl_berlaku=(tgl_berlaku==null)?"-":tgl_berlaku;
  }
  public String getTgl_berlaku()
  {
    return tgl_berlaku;
  }
  public void setSystgl(String systgl)
  {
    this.systgl=(systgl==null)?"-":systgl;
  }
  public String getSystgl()
  {
    return systgl;
  }

  public void setNip_pej(String nip_pej)
  {
    this.nip_pej=(nip_pej==null)?"-":nip_pej;
  }
  public String getNip_pej()
  {
    return nip_pej;
  }

  public void setNama_pej(String nama_pej)
  {
    this.nama_pej=(nama_pej==null)?"-":nama_pej;
  }
  public String getNama_pej()
  {
    return nama_pej;
  }

}