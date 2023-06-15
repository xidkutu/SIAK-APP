package estimasi;

import java.util.Vector;

public class NikGandaObjectWna implements java.io.Serializable
{
  private String nama_lgkp, tmpt_lhr, tgl_lhr;
  private String nama_ibu, nama_ayah, nik, no_kk, alamat;

  private String no_paspor, kwrngrn, nama_klrga;

  public NikGandaObjectWna(String nama_pertma, String nama_klrga, String tgl_lhr,
                        String no_paspor,String nik,String no_kk,String kwrngrn,String alamat, int combination)
  {
    this.nama_lgkp = nama_lgkp;
    this.tgl_lhr = tgl_lhr;
    this.nama_klrga = nama_klrga;
    this.no_paspor = no_paspor;
    this.nik = nik;
    this.no_kk = no_kk;
    this.kwrngrn = kwrngrn;
    this.alamat= alamat;

  }
  public void setNama_klrga(String nama_klrga)
  {
    this.nama_klrga = nama_klrga;
  }
  public String getNama_klrga()
  {
    return nama_klrga;
  }
  public NikGandaObjectWna(String nama_lgkp,String tgl_lhr,
                        String no_paspor,String nik,String no_kk,String kwrngrn,String alamat)
  {
    this.nama_lgkp = nama_lgkp;
    this.tgl_lhr = tgl_lhr;

    this.no_paspor = no_paspor;
    this.nik = nik;
    this.no_kk = no_kk;
    this.kwrngrn = kwrngrn;
    this.alamat= alamat;

  }
  public void setNo_paspor(String no_paspor)
  {
    this.no_paspor = no_paspor;
  }
  public String getNo_paspor()
  {
    return no_paspor;
  }
  public void setKwrngrn(String kwrngrn)
  {
    this.kwrngrn = kwrngrn;
  }
  public String getKwrngrn()
  {
    return kwrngrn;
  }

  public NikGandaObjectWna(String nama_lgkp,String tmpt_lhr,String tgl_lhr,
                        String nama_ibu,String nama_ayah,String nik,String no_kk,String alamat)
  {
    this.nama_lgkp = nama_lgkp;
    this.tmpt_lhr = tmpt_lhr;
    this.tgl_lhr = tgl_lhr;

    this.nama_ibu = nama_ibu;
    this.nama_ayah = nama_ayah;
    this.nik = nik;
    this.no_kk = no_kk;
    this.alamat= alamat;
  }

  public void setNama_lgkp(String nama_lgkp)
  {
    this.nama_lgkp = nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
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
  public void setNama_ibu(String nama_ibu)
  {
    this.nama_ibu = nama_ibu;
  }
  public String getNama_ibu()
  {
    return nama_ibu;
  }
  public void setNama_ayah(String nama_ayah)
  {
    this.nama_ayah = nama_ayah;
  }
  public String getNama_ayah()
  {
    return nama_ayah;
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

}
