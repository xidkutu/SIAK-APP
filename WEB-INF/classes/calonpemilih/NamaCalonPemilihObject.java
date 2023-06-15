package calonpemilih;

import java.io.Serializable;

public class NamaCalonPemilihObject implements Serializable
{
  private String nik, nama_lgkp, tmptgllhr, jenis_klmin, pnydng_cc, jenis_pkrjn, pddk_akh;

  public NamaCalonPemilihObject(String nik, String nama_lgkp,String tmptgllhr,
                                String jenis_klmin,String pnydng_cc,String jenis_pkrjn,String pddk_akh)
  {
    this.nik = nik;
    this.nama_lgkp = nama_lgkp;
    this.tmptgllhr = tmptgllhr;
    this.jenis_klmin = jenis_klmin;
    this.pnydng_cc = pnydng_cc;
    this.jenis_pkrjn = jenis_pkrjn;
    this.pddk_akh = pddk_akh;
  }
  public NamaCalonPemilihObject(String nik, String nama_lgkp,String tmptgllhr,
                                String jenis_klmin,String pnydng_cc,String jenis_pkrjn,String pddk_akh,
                                String umur_usia,String nikah,String klmin_de,String alamat,
                                String keterangan)
  {
    this.nik = nik;
    this.nama_lgkp = nama_lgkp;
    this.tmptgllhr = tmptgllhr;
    this.jenis_klmin = jenis_klmin;
    this.pnydng_cc = pnydng_cc;
    this.jenis_pkrjn = jenis_pkrjn;
    this.pddk_akh = pddk_akh;
    this.umur_usia = umur_usia;
    this.nikah = nikah;
    this.klmin_de = klmin_de;
    this.alamat = alamat;
    this.keterangan = keterangan;
  }

  public void setNik(String nik)
  {
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
  }
  public void setNama_lgkp(String nama_lgkp)
  {
    this.nama_lgkp = nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }
  public void setTmptgllhr(String tmptgllhr)
  {
    this.tmptgllhr = tmptgllhr;
  }
  public String getTmptgllhr()
  {
    return tmptgllhr;
  }
  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }
  public void setPnydng_cc(String pnydng_cc)
  {
    this.pnydng_cc = pnydng_cc;
  }
  public String getPnydng_cc()
  {
    return pnydng_cc;
  }
  public void setJenis_pkrjn(String jenis_pkrjn)
  {
    this.jenis_pkrjn = jenis_pkrjn;
  }
  public String getJenis_pkrjn()
  {
    return jenis_pkrjn;
  }
  public void setPddk_akh(String pddk_akh)
  {
    this.pddk_akh = pddk_akh;
  }
  public String getPddk_akh()
  {
    return pddk_akh;
  }
  public String getUmur_usia() {
    return umur_usia;
  }
  public void setUmur_usia(String umur_usia) {
    this.umur_usia = umur_usia;
  }
  public String getNikah() {
    return nikah;
  }
  public void setNikah(String nikah) {
    this.nikah = nikah;
  }
  public String getKlmin_de() {
    return klmin_de;
  }
  public void setKlmin_de(String klmin_de) {
    this.klmin_de = klmin_de;
  }
  public String getAlamat() {
    return alamat;
  }
  public void setAlamat(String alamat) {
    this.alamat = alamat;
  }
  public String getKeterangan() {
    return keterangan;
  }
  public void setKeterangan(String keterangan) {
    this.keterangan = keterangan;
  }
  private String umur_usia;
  private String nikah;
  private String klmin_de;
  private String alamat;
  private String keterangan;
}