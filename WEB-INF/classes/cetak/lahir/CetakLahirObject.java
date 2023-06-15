package cetak.lahir;

import java.io.*;
public class CetakLahirObject implements Serializable
{
  private String no_akta_lahir, nik, nama_lgkp, nama_ibu, nama_ayah, anak_ke_lahir;
  private String daylhr, monthlhr, yearlhr, jenis_klmin, nama_negara, tmpt_lhr;
  private boolean found;

  public CetakLahirObject(boolean found)
  {
    this.found = found;
  }
  public CetakLahirObject( String no_akta_lahir, String nik, String nama_lgkp, String anak_ke_lahir,
                          String nama_ibu, String nama_ayah,String tmpt_lhr,
                          String daylhr,String monthlhr,
                          String yearlhr,String jenis_klmin, String nama_negara, boolean found )
  {
    this.no_akta_lahir = (no_akta_lahir==null)? "" : no_akta_lahir;
    this.nik = (nik==null)? "" : nik;
    this.nama_lgkp= (nama_lgkp==null)? "" : nama_lgkp;
    this.anak_ke_lahir = (anak_ke_lahir==null)? "" : anak_ke_lahir;
    this.nama_ayah = (nama_ayah==null)? "" : nama_ayah;
    this.nama_ibu = (nama_ibu==null)? "" : nama_ibu;
    this.found = found;
    this.daylhr = (daylhr==null)? "" : daylhr;
    this.monthlhr = (monthlhr==null)? "" : monthlhr;
    this.yearlhr = (yearlhr==null)? "" : yearlhr;
    this.jenis_klmin = (jenis_klmin==null)? "" : jenis_klmin;
    this.nama_negara = (nama_negara==null)? "" : nama_negara;
    this.tmpt_lhr = (tmpt_lhr==null)? "" : tmpt_lhr;
  }
  public CetakLahirObject( String no_akta_lahir, String nik, String nama_lgkp, String anak_ke_lahir,
                          String nama_ibu, String nama_ayah,String tmpt_lhr,
                          String daylhr,String monthlhr,
                          String yearlhr,String jenis_klmin, String nama_negara )
  {
    this.no_akta_lahir = (no_akta_lahir==null)? "" : no_akta_lahir;
    this.nik = (nik==null)? "" : nik;
    this.nama_lgkp= (nama_lgkp==null)? "" : nama_lgkp;
    this.anak_ke_lahir = (anak_ke_lahir==null)? "" : anak_ke_lahir;
    this.nama_ayah = (nama_ayah==null)? "" : nama_ayah;
    this.nama_ibu = (nama_ibu==null)? "" : nama_ibu;
    this.found = found;
    this.daylhr = (daylhr==null)? "" : daylhr;
    this.monthlhr = (monthlhr==null)? "" : monthlhr;
    this.yearlhr = (yearlhr==null)? "" : yearlhr;
    this.jenis_klmin = (jenis_klmin==null)? "" : jenis_klmin;
    this.nama_negara = (nama_negara==null)? "" : nama_negara;
    this.tmpt_lhr = (tmpt_lhr==null)? "" : tmpt_lhr;
  }

  public void setFound(boolean found)
  {
    this.found = found;
  }
  public boolean getFound()
  {
    return found;
  }

  public void setAnak_ke_lahir(String anak_ke_lahir)
  {
    this.anak_ke_lahir = anak_ke_lahir;
  }
  public String getAnak_ke_lahir()
  {
    return anak_ke_lahir;
  }
  public void setTmpt_lhr(String tmpt_lhr)
  {
    this.tmpt_lhr = tmpt_lhr;
  }
  public String getTmpt_lhr()
  {
    return tmpt_lhr;
  }
  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }

  public void setDaylhr(String daylhr)
  {
    this.daylhr = daylhr;
  }
  public String getDaylhr()
  {
    return daylhr;
  }

  public void setMonthlhr(String monthlhr)
  {
    this.monthlhr = monthlhr;
  }
  public String getMonthlhr()
  {
    return monthlhr;
  }
  public void setYearlhr(String yearlhr)
  {
    this.yearlhr = yearlhr;
  }
  public String getYearlhr()
  {
    return yearlhr;
  }

  public void setNama_negara(String nama_negara)
  {
    this.nama_negara = nama_negara;
  }

  public String getNama_negara()
  {
    return nama_negara;
  }
  public void setNo_akta_lahir(String no_akta_lahir)
  {
    this.no_akta_lahir = no_akta_lahir;
  }
  public String getNo_akta_lahir()
  {
    return no_akta_lahir;
  }
  public void setNik(String nik)
  {
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
  }

  public void setNama_lgkp()
  {
    this.nama_lgkp = nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }

  public void setNama_ayah()
  {
    this.nama_ayah = nama_ayah;
  }
  public String getNama_ayah()
  {
    return nama_ayah;
  }
  public void setNama_ibu()
  {
    this.nama_ibu = nama_ibu;
  }
  public String getNama_ibu()
  {
    return nama_ibu;
  }

}