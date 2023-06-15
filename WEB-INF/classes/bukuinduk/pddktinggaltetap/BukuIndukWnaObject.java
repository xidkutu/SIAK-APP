package bukuinduk.pddktinggaltetap;

import java.io.Serializable;

public class BukuIndukWnaObject implements Serializable
{
  private String nama_pertma, nik, no_kk, alamat, jenis_klmin, kwrngrn, no_paspor, no_kitap;
  private String tmpt_lhr, tgl_lhr, agama, gol_drh, stat_kwn, jenis_pkrjn, stat_hbkel, pddk_akh;

  public BukuIndukWnaObject(String nama_pertma,String nik,String no_kk,String alamat,String jenis_klmin,
                            String kwrngrn, String no_paspor,String no_kitap, String tmpt_lhr,String tgl_lhr,String agama,
                            String gol_drh, String stat_kwn,String jenis_pkrjn,String stat_hbkel,
                            String pddk_akh)
  {
    this.nama_pertma = (nama_pertma==null)? "-" : nama_pertma;
    this.nik = (nik==null)? "-" : nik;
    this.no_kk = (no_kk==null)? "-" : no_kk;
    this.alamat = (alamat==null)? "-" : alamat;
    this.jenis_klmin = (jenis_klmin==null)? "-" : jenis_klmin;
    this.kwrngrn = (kwrngrn==null)? "-" : kwrngrn;

    this.no_paspor = (no_paspor==null)? "-" : no_paspor;
    this.no_kitap = (no_kitap==null)? "-" : no_kitap;
    this.tmpt_lhr = (tmpt_lhr==null)? "-" : tmpt_lhr;
    this.tgl_lhr =(tgl_lhr==null)? "-" : tgl_lhr;
    this.agama = (agama==null)? "-" : agama;
    this.gol_drh = (gol_drh==null)? "-" : gol_drh;
    this.stat_kwn = (stat_kwn==null)? "-" : stat_kwn;
    this.jenis_pkrjn = (jenis_pkrjn==null)? "-" : jenis_pkrjn;
    this.stat_hbkel = (stat_hbkel==null)? "-" : stat_hbkel;
    this.pddk_akh = (pddk_akh==null)? "-" : pddk_akh;
  }
  public void setKwrngrn(String kwrngrn)
  {
    this.kwrngrn = kwrngrn;
  }
  public String getKwrngrn()
  {
    return kwrngrn;
  }
  public void setNama_pertma(String nama_pertma)
  {
    this.nama_pertma = nama_pertma;
  }
  public String getNama_pertma()
  {
    return nama_pertma;
  }
  public void setNik(String nik)
  {
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
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
    this.alamat = alamat;
  }
  public String getAlamat()
  {
    return alamat;
  }
  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }
  public void setNo_paspor(String no_paspor)
  {
    this.no_paspor  = no_paspor;
  }
  public String getNo_paspor()
  {
    return no_paspor;
  }
  public void setNo_kitap(String no_kitap)
  {
    this.no_kitap = no_kitap;
  }
  public String getNo_kitap()
  {
    return no_kitap;
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
  public void setStat_kwn(String stat_kwn)
  {
    this.stat_kwn = stat_kwn;
  }
  public String getStat_kwn()
  {
    return stat_kwn;
  }

  public void setJenis_pkrjn(String jenis_pkrjn)
  {
    this.jenis_pkrjn = jenis_pkrjn;
  }
  public String getJenis_pkrjn()
  {
    return jenis_pkrjn;
  }
  public void setStat_hbkel(String stat_hbkel)
  {
    this.stat_hbkel = stat_hbkel;
  }
  public String getStat_hbkel()
  {
    return stat_hbkel;
  }
  public void setPddk_akh(String pddk_akh)
  {
    this.pddk_akh = pddk_akh;
  }
  public String getPddk_akh()
  {
    return pddk_akh;
  }
}