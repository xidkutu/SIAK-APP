package kutipan.lahir;

import java.io.*;

public class KutipanLahirObject implements Serializable
{
  private String nik, no_akta_lahir, dsrhk_cttlhr, nama_lgkp, tmpt_lhr, anak_ke_lahir, jenis_klmin,
      daylhr, monthlhr, yearlhr, day_ctk, month_ctk, year_ctk, nama_prop, nama_kab;

  private String nama_pertma, kewarganegaraan, tgl_ctk_ktakta;
  private String nama_ibu="";
  private String nama_ayh="";

  public KutipanLahirObject(String nama_ibu,String nama_ayh)
  {
    this.nama_ibu=nama_ibu;
    this.nama_ayh=nama_ayh;
  }
  public KutipanLahirObject(String nik,String no_akta_lahir, String dsrhk_cttlhr,String nama_pertma,
                            String tmpt_lhr,String anak_ke_lahir,String jenis_klmin,
                            String daylhr,String monthlhr,String yearlhr,String day_ctk,String month_ctk,
                            String year_ctk,String nama_prop,String nama_kab, String kewarganegaraan )
  {
    this.nik = nik;
    this.no_akta_lahir = no_akta_lahir;
    this.dsrhk_cttlhr = dsrhk_cttlhr;

    this.nama_pertma = nama_pertma;

    this.tmpt_lhr = tmpt_lhr;
    this.anak_ke_lahir = anak_ke_lahir;
    this.jenis_klmin = jenis_klmin;

    this.daylhr = daylhr;
    this.monthlhr = monthlhr;
    this.yearlhr = yearlhr;
    this.day_ctk = day_ctk;
    this.month_ctk = month_ctk;
    this.year_ctk = year_ctk;

    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
    this.kewarganegaraan = kewarganegaraan;
  }

  public KutipanLahirObject( String nama_ibu,String nama_ayh,String dsrhk_cttlhr, String tgl_ctk_ktakta
                            ,String day_ctk,String month_ctk,
                            String year_ctk,String nama_prop,String nama_kab
      )
  {
    this.nama_ibu=((nama_ibu==null)?"-":nama_ibu);
    this.nama_ayh=((nama_ayh==null)?"-":nama_ayh);
    this.dsrhk_cttlhr = dsrhk_cttlhr;
    this.tgl_ctk_ktakta = tgl_ctk_ktakta;

    this.day_ctk = day_ctk;
    this.month_ctk = month_ctk;
    this.year_ctk = year_ctk;

    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
  }

  public String getNamaIbu()
  {

    return nama_ibu;
  }

  public void setNamaIbu(String nama_ibu)
  {
       this.nama_ibu=((nama_ibu==null)?"-":nama_ibu);
  }

  public String getNamaAyah()
  {

    return nama_ayh;
  }

  public void setNamaAyah(String nama_ayh)
  {
    this.nama_ayh=((nama_ayh==null)?"":nama_ayh);
  }

  public void setTgl_ctk_ktakta(String tgl_ctk_ktakta)
  {
    this.tgl_ctk_ktakta = tgl_ctk_ktakta;
  }
  public String getTgl_ctk_ktakta()
  {
    return tgl_ctk_ktakta;
  }

  public void setKewarganegaraan(String kewarganegaraan)
  {
    this.kewarganegaraan = kewarganegaraan;
  }
  public String getKewarganegaraan()
  {
    return kewarganegaraan;
  }

  public void setNama_pertma(String nama_pertma)
  {
    this.nama_pertma = nama_pertma;
  }
  public String getNama_pertma()
  {
    return nama_pertma;
  }

  public void setAnak_ke_lahir(String anak_ke_lahir)
  {
    this.anak_ke_lahir = anak_ke_lahir;
  }
  public String getAnak_ke_lahir()
  {
    return anak_ke_lahir;
  }
  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }

  public void setNik(String nik)
  {
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
  }
  public void setNo_akta_lahir(String no_akta_lahir)
  {
    this.no_akta_lahir = no_akta_lahir;
  }
  public String getNo_akta_lahir()
  {
    return no_akta_lahir;
  }
  public void setDsrhk_cttlhr(String dsrhk_cttlhr)
  {
    this.dsrhk_cttlhr = dsrhk_cttlhr;
  }
  public String getDsrhk_cttlhr()
  {
    return dsrhk_cttlhr;
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

  public void setDay_ctk(String day_ctk)
  {
    this.day_ctk = day_ctk;
  }
  public String getDay_ctk()
  {
    return day_ctk;
  }
  public void setMonth_ctk(String month_ctk)
  {
    this.month_ctk = month_ctk;
  }
  public String getMonth_ctk()
  {
    return month_ctk;
  }
  public void setYear_ctk(String year_ctk)
  {
    this.year_ctk = year_ctk;
  }
  public String getYear_ctk()
  {
    return year_ctk;
  }

  public void setNama_prop(String nama_prop)
  {
    this.nama_prop = nama_prop;
  }
  public String getNama_prop()
  {
    return nama_prop;
  }
  public void setNama_kab(String nama_kab)
  {
    this.nama_kab = nama_kab;
  }
  public String getNama_kab()
  {
    return nama_kab;
  }
}