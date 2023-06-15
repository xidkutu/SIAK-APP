package biodata.wna;

import java.io.Serializable;

public class BiodataWNAObject implements Serializable
{
  private String nama_klrga, nama_pertma, jenis_klmin, tmpt_lhr,tgl_lhr, kwrngrn;
  private String agama, gol_drh, pddk_akh, jenis_pkrjn, stat_kwn, nama_kep, no_kk;
  private String alamat, datng_dari, tujuan_dtng, no_paspor, tgl_paspor, tgl_akh_paspor;
  private String nama_spsor, tipe_spsor, alamat_spsor, no_dok, tmpt_dtbit;
  private String tgl_dtbit, tgl_akh_dok, no_stld, sys_tgl;
  private String no_rt,no_rw,dusun,kodepos,telp,nama_prop,nama_kab,nama_kec,nama_kel;

  public BiodataWNAObject(String nama_klrga,String nama_pertma,String jenis_klmin,String tmpt_lhr,
                          String tgl_lhr,String kwrngrn, String agama,String gol_drh,String pddk_akh,
                          String jenis_pkrjn,String stat_kwn,String nama_kep,String no_kk,
                          String alamat,String no_rt,String no_rw,String dusun,String kodepos,String telp,String nama_prop,String nama_kab,String nama_kec,String nama_kel, String datng_dari,String tujuan_dtng,String no_paspor,
                          String tgl_paspor, String tgl_akh_paspor,
                          String nama_spsor,String tipe_spsor,String alamat_spsor,String no_dok,String tmpt_dtbit,
                          String tgl_dtbit,String tgl_akh_dok,String no_stld, String sys_tgl)
  {
    this.nama_klrga=(nama_klrga==null)?"-":nama_klrga;
    this.nama_pertma =(nama_pertma==null)?"-":nama_pertma;
    this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
    this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.kwrngrn =(kwrngrn==null)?"-":kwrngrn;
    this.gol_drh=(gol_drh==null)?"-":gol_drh;
    this.agama=(agama==null)?"-":agama;
    this.pddk_akh=(pddk_akh==null)?"-":pddk_akh;
    this.jenis_pkrjn=(jenis_pkrjn==null)?"-":jenis_pkrjn;
    this.stat_kwn=(stat_kwn==null)?"-":stat_kwn;
    this.nama_kep =(nama_kep==null)?"-":nama_kep;
    this.no_kk=(no_kk==null)?"-":no_kk;
    this.alamat = (alamat==null)?"-":alamat;
    this.no_rt=(no_rt==null)?"-":no_rt;
    this.no_rw=(no_rw==null)?"-":no_rw;
    this.dusun=(dusun==null)?"-":dusun;
    this.kodepos=(kodepos==null)?"-":kodepos;
    this.telp=(telp==null)?"-":telp;
    this.nama_prop=(nama_prop==null)?"-":nama_prop;
    this.nama_kab=(nama_kab==null)?"-":nama_kab;
    this.nama_kec=(nama_kec==null)?"-":nama_kec;
    this.nama_kel=(nama_kel==null)?"-":nama_kel;
    this.datng_dari = (datng_dari==null)?"-":datng_dari;
    this.tujuan_dtng = (tujuan_dtng==null)?"-":tujuan_dtng;
    this.no_paspor = (no_paspor==null)?"-":no_paspor;
    this.tgl_paspor= (tgl_paspor==null)?"-":tgl_paspor;
    this.tgl_akh_paspor = (tgl_akh_paspor==null)?"-":tgl_akh_paspor;
    this.nama_spsor = (nama_spsor==null)?"-":nama_spsor;
    this.tipe_spsor = (tipe_spsor==null)?"-":tipe_spsor;
    this.alamat_spsor = (alamat_spsor==null)?"-":alamat_spsor;
    this.no_dok = (no_dok==null)?"-":no_dok;
    this.tmpt_dtbit = (tmpt_dtbit==null)?"-":tmpt_dtbit;
    this.tgl_dtbit = (tgl_dtbit==null)?"-":tgl_dtbit;
    this.tgl_akh_dok = (tgl_akh_dok==null)?"-":tgl_akh_dok;
    this.no_stld = (no_stld==null)?"-":no_stld;
    this.sys_tgl=(sys_tgl==null)?"-":sys_tgl;
  }
  public void setSys_tgl(String sys_tgl)
  {
    this.sys_tgl = sys_tgl;
  }
  public String getSys_tgl()
  {
    return sys_tgl;
  }
  public void setNama_klrga(String nama_klrga)
  {
    this.nama_klrga = nama_klrga;
  }
  public String getNama_klrga()
  {
    return nama_klrga;
  }
  public void setNama_pertma(String nama_pertma)
  {
    this.nama_pertma = nama_pertma;
  }
  public String getNama_pertma()
  {
    return nama_pertma;
  }
  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }
  public void setTmpt_lhr(String tmpt_lhr)
  {
    this.tmpt_lhr = tmpt_lhr;
  }
  public String getTmpt_lhr()
  {
    return tmpt_lhr;
  }
  public void setTgl_lhr(String tgl_lhr)
  {
    this.tgl_lhr = tgl_lhr;
  }
  public String getTgl_lhr()
  {
    return tgl_lhr;
  }
  public void setKwrngrn(String kwrngrn)
  {
    this.kwrngrn = kwrngrn;
  }
  public String getKwrngrn()
  {
    return kwrngrn;
  }
  public void setAgama(String agama)
  {
    this.agama =agama;
  }
  public String getAgama()
  {
    return agama;
  }
  public void setGol_drh(String gol_drh)
  {
    this.gol_drh = gol_drh;
  }
  public String getGol_drh()
  {
    return gol_drh;
  }
  public void setPddk_akh(String pddk_akh)
  {
    this.pddk_akh = pddk_akh;
  }
  public String getPddk_akh()
  {
    return pddk_akh;
  }
  public void setJenis_pkrjn(String jenis_pkrjn)
  {
    this.jenis_pkrjn = jenis_pkrjn;
  }
  public String getJenis_pkrjn()
  {
    return jenis_pkrjn;
  }
  public void setStat_kwn(String stat_kwn)
  {
    this.stat_kwn = stat_kwn;
  }
  public String getStat_kwn()
  {
    return stat_kwn;
  }
  public void setNama_kep(String nama_kep)
  {
    this.nama_kep = nama_kep;
  }
  public String getNama_kep()
  {
    return nama_kep;
  }
  public void setNo_kk(String no_kk)
  {
    this.no_kk = no_kk;
  }
  public String getNo_kk()
  {
    return no_kk;
  }
  public void setAlamat(String alamat)
  {
    this.alamat =alamat;
  }
  public String getAlamat()
  {
    return alamat;
  }

  public String getno_rt()
 {
 return  no_rt;
 }
 public String getno_rw()
 {
 return no_rw;
 }
 public String getdusun()
 {
 return dusun;
 }
 public String getkodepos()
 {
 return kodepos;
 }
 public String gettelp()
 {
 return telp;
 }
 public String getnama_prop()
 {
 return nama_prop;
 }
 public String getnama_kab()
 {
 return nama_kab;
 }
 public String getnama_kec()
 {
 return nama_kec;
 }
 public String getnama_kel()
 {
 return nama_kel;
 }



  public void setDatng_dari(String datng_dari)
  {
    this.datng_dari = datng_dari;
  }
  public String getDatng_dari()
  {
    return datng_dari;
  }
  public void setTujuan_dtng(String tujuan_dtng)
  {
    this.tujuan_dtng = tujuan_dtng;
  }
  public String getTujuan_dtng()
  {
    return tujuan_dtng;
  }
  public void setNo_paspor(String no_paspor)
  {
    this.no_paspor = no_paspor;
  }
  public String getNo_paspor()
  {
    return no_paspor;
  }
  public void setTgl_paspor(String tgl_paspor)
  {
    this.tgl_paspor = tgl_paspor;
  }
  public String getTgl_paspor()
  {
    return tgl_paspor;
  }
  public void setTgl_akh_paspor(String tgl_akh_paspor)
  {
    this.tgl_akh_paspor = tgl_akh_paspor;
  }
  public String getTgl_akh_paspor()
  {
    return tgl_akh_paspor;
  }
  public void setNama_spsor(String nama_spsor)
  {
    this.nama_spsor = nama_spsor;
  }
  public String getNama_spsor()
  {
    return nama_spsor;
  }
  public void setTipe_spsor(String tipe_spsor)
  {
    this.tipe_spsor = tipe_spsor;
  }
  public String getTipe_spsor()
  {
    return tipe_spsor;
  }
  public void setAlamat_spsor(String alamat_spsor)
  {
    this.alamat_spsor = alamat_spsor;
  }
  public String getAlamat_spsor()
  {
    return alamat_spsor;
  }
  public void setNo_dok(String no_dok)
  {
    this.no_dok = no_dok;
  }
  public String getNo_dok()
  {
    return no_dok;
  }
  public void setTmpt_dtbit (String tmpt_dtbit)
  {
    this.tmpt_dtbit = tmpt_dtbit;
  }
  public String getTmpt_dtbit()
  {
    return tmpt_dtbit;
  }
  public void setTgl_dtbit(String tgl_dtbit)
  {
    this.tgl_dtbit = tgl_dtbit;
  }
  public String getTgl_dtbit()
  {
    return tgl_dtbit;
  }
  public void setTgl_akh_dok(String tgl_akh_dok)
  {
    this.tgl_akh_dok = tgl_akh_dok;
  }
  public String getTgl_akh_dok()
  {
    return tgl_akh_dok;
  }
  public void setNo_stld(String no_stld)
  {
    this.no_stld = no_stld;
  }
  public String getNo_stld()
  {
    return no_stld;
  }
}