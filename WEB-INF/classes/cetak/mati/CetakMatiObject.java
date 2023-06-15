package cetak.mati;

import java.io.*;

public class CetakMatiObject implements Serializable
{
  private String no_akta_mati, nik_jnsah, nama;
  private String nama_negara, tmpt_lhr, daylhr, monthlhr, yearlhr, jenis_klmin;
  private String nama_pelapor;
  private boolean found;

  public CetakMatiObject(boolean found)
  {
    this.found = found;
  }
  public CetakMatiObject(String no_akta_mati,String nik_jnsah,String nama, String nama_negara,
                         String tmpt_lhr, String daylhr, String monthlhr, String yearlhr,
                         String jenis_klmin, String nama_pelapor)
  {
    this.no_akta_mati = no_akta_mati;
    this.nik_jnsah = nik_jnsah;
    this.nama = nama;
    this.nama_negara = nama_negara;
    this.tmpt_lhr = tmpt_lhr;
    this.daylhr = daylhr;
    this.monthlhr = monthlhr;
    this.yearlhr = yearlhr;
    this.jenis_klmin = jenis_klmin;

    this.nama_pelapor = nama_pelapor;
  }

  public CetakMatiObject(String no_akta_mati,String nik_jnsah,String nama, String nama_negara,
                         String tmpt_lhr, String daylhr, String monthlhr, String yearlhr,
                         String jenis_klmin, String nama_pelapor, boolean found)
  {
    this.no_akta_mati = no_akta_mati;
    this.nik_jnsah = nik_jnsah;
    this.nama = nama;
    this.found = found;
    this.nama_negara = nama_negara;
    this.tmpt_lhr = tmpt_lhr;
    this.daylhr = daylhr;
    this.monthlhr = monthlhr;
    this.yearlhr = yearlhr;
    this.jenis_klmin = jenis_klmin;

    this.nama_pelapor = nama_pelapor;
  }

  public void setFound(boolean found)
  {
    this.found =found;
  }
  public boolean getFound()
  {
    return found;
  }
  public void setNama_negara(String nama_negara)
  {
    this.nama_negara = nama_negara;
  }
  public String getNama_negara()
  {
    return nama_negara;
  }
  public void setTmpt_lhr(String tmpt_lhr)
  {
    this.tmpt_lhr = tmpt_lhr;
  }
  public String getTmpt_lhr()
  {
    return tmpt_lhr;
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
  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }

  public void setNama_pelapor(String nama_pelapor)
  {
    this.nama_pelapor = nama_pelapor;
  }
  public String getNama_pelapor()
  {
    return nama_pelapor;
  }
  public void setNo_akta_mati(String no_akta_mati)
  {
    this.no_akta_mati = no_akta_mati;
  }
  public String getNo_akta_mati()
  {
    return no_akta_mati;
  }
  public void setNik_jnsah(String nik_jnsah)
  {
    this.nik_jnsah = nik_jnsah;
  }
  public String getNik_jnsah()
  {
    return nik_jnsah;
  }
  public void setNama(String nama)
  {
    this.nama = nama;
  }
  public String getNama()
  {
    return nama;
  }
}