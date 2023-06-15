package viewkk;

import java.io.*;

public class ViewKKObject implements Serializable
{
  private String nama_lgkp, nik, jenis_klmin, tmpt_lhr, stat_kwn, stat_hbkel, kwrngrn, no_paspor;
  private String dkel_tgl, jenis_pkjrn, pddk_akh, agama, tgl_lhr, nama_lgkp_ibu, nama_lgkp_ayah, no_dok;
  private String nama_kec,nama_kel;

  public ViewKKObject(String nama_lgkp, String nik, String jenis_klmin, String tmpt_lhr,
                      String stat_kwn, String stat_hbkel, String kwrngrn, String no_paspor,
                      String dkel_tgl, String jenis_pkjrn, String pddk_akh, String agama,
                      String tgl_lhr, String nama_lgkp_ibu, String nama_lgkp_ayah, String no_dok,
                      String nama_kec, String nama_kel)
  {
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
    this.nik=(nik==null)?"-":nik;
    this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
    this.jenis_pkjrn=(jenis_pkjrn==null)?"-":jenis_pkjrn;
    this.pddk_akh=(pddk_akh==null)?"-":pddk_akh;
    this.agama=(agama==null)?"-":agama;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.nama_lgkp_ibu=(nama_lgkp_ibu==null)?"-":nama_lgkp_ibu;
    this.nama_lgkp_ayah=(nama_lgkp_ayah==null)?"-":nama_lgkp_ayah;
    this.no_dok=(no_dok==null)?"-":no_dok;

    this.stat_hbkel=(stat_hbkel==null)?"-":stat_hbkel;
    this.stat_kwn=(stat_kwn==null)?"-":stat_kwn;
    this.kwrngrn=(kwrngrn==null)?"-":kwrngrn;
    this.no_paspor=(no_paspor==null)?"-":no_paspor;
    this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
    this.dkel_tgl=(dkel_tgl==null)?"-":dkel_tgl;

    this.nama_kec = nama_kec;
    this.nama_kel = nama_kel;
  }

  public ViewKKObject(String nama_lgkp, String nik, String jenis_klmin, String tmpt_lhr,
                      String stat_kwn, String stat_hbkel, String kwrngrn, String no_paspor,
                      String dkel_tgl, String jenis_pkjrn, String pddk_akh, String agama,
                      String tgl_lhr, String nama_lgkp_ibu, String nama_lgkp_ayah, String no_dok
                      )
  {
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
    this.nik=(nik==null)?"-":nik;
    this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
    this.jenis_pkjrn=(jenis_pkjrn==null)?"-":jenis_pkjrn;
    this.pddk_akh=(pddk_akh==null)?"-":pddk_akh;
    this.agama=(agama==null)?"-":agama;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.nama_lgkp_ibu=(nama_lgkp_ibu==null)?"-":nama_lgkp_ibu;
    this.nama_lgkp_ayah=(nama_lgkp_ayah==null)?"-":nama_lgkp_ayah;
    this.no_dok=(no_dok==null)?"-":no_dok;

    this.stat_hbkel=(stat_hbkel==null)?"-":stat_hbkel;
    this.stat_kwn=(stat_kwn==null)?"-":stat_kwn;
    this.kwrngrn=(kwrngrn==null)?"-":kwrngrn;
    this.no_paspor=(no_paspor==null)?"-":no_paspor;
    this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
    this.dkel_tgl=(dkel_tgl==null)?"-":dkel_tgl;

  }
  public void setNama_kec(String nama_kec)
  {
    this.nama_kec = nama_kec;
  }
  public String getNama_kec()
  {
    return nama_kec;
  }

  public void setNama_kel(String nama_kel)
  {
    this.nama_kel = nama_kel;
  }
  public String getNama_kel()
  {
    return nama_kel;
  }

  public void setNama_lgkp(String nama_lgkp)
  {
    this.nama_lgkp= nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }

  public void setNik(String nik)
  {
    this.nik=nik;
  }
  public String getNik()
  {
    return nik;
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

  public void setStat_kwn(String stat_kwn)
  {
    this.stat_kwn = stat_kwn;
  }
  public String getStat_kwn()
  {
    return stat_kwn;
  }

  public void setStat_hbkel(String stat_hbkel)
  {
    this.stat_hbkel = stat_hbkel;
  }

  public String getStat_hbkel()
  {
    return stat_hbkel;
  }

  public void setKwrngrn(String kwrngrn)
  {
    this.kwrngrn = kwrngrn;
  }
  public String getKwrngrn()
  {
    return kwrngrn;
  }

  public void setNo_paspor(String no_paspor)
  {
    this.no_paspor = no_paspor;
  }
  public String getNo_paspor()
  {
    return no_paspor;
  }

  public void setDkel_tgl(String dkel_tgl)
  {
    this.dkel_tgl = dkel_tgl;
  }
  public String getDkel_tgl()
  {
    return dkel_tgl;
  }

  public void setJenis_pkjrn(String jenis_pkjrn)
  {
    this.jenis_pkjrn = jenis_pkjrn;
  }
  public String getJenis_pkjrn()
  {
    return jenis_pkjrn;
  }

  public void setPddk_akh(String pddk_akh)
  {
    this.pddk_akh = pddk_akh;
  }
  public String getPddk_akh()
  {
    return pddk_akh;
  }

  public void setAgama(String agama)
  {
    this.agama = agama;
  }
  public String getAgama()
  {
    return agama;
  }

  public void setTgl_lhr(String tgl_lhr)
  {
    this.tgl_lhr = tgl_lhr;
  }
  public String getTgl_lhr()
  {
    return tgl_lhr;
  }

  public void setNama_lgkp_ibu(String nama_lgkp_ibu)
  {
    this.nama_lgkp_ibu = nama_lgkp_ibu;
  }
  public String getNama_lgkp_ibu()
  {
    return nama_lgkp_ibu;
  }

  public void setNama_lgkp_ayah(String nama_lgkp_ayah)
  {
    this.nama_lgkp_ayah = nama_lgkp_ayah;
  }
  public String getNama_lgkp_ayah()
  {
    return nama_lgkp_ayah;
  }

  public void setNo_dok(String no_dok)
  {
    this.no_dok = no_dok;
  }
  public String getNo_dok()
  {
    return no_dok;
  }

}