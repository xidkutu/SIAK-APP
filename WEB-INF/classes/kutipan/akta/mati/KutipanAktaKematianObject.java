package kutipan.akta.mati;

import java.io.Serializable;
public class KutipanAktaKematianObject implements Serializable
{
  private String dsrhk_cttlhr, daymati, monthmati, yearmati;
  private String day_ctk, month_ctk, year_ctk;
  private String nama_prop, nama_kab, tgl_ctk_ktakta;
  private String tmpt_mati;

  public KutipanAktaKematianObject(String tmpt_mati,String dsrhk_cttlhr,
                                   String daymati,String monthmati,String yearmati,
                                   String day_ctk,String month_ctk,String year_ctk,
                                   String nama_prop, String nama_kab, String tgl_ctk_ktakta
                                   )
  {
    this.tmpt_mati=tmpt_mati;
    this.dsrhk_cttlhr = (dsrhk_cttlhr==null)? "-" : dsrhk_cttlhr;
    this.daymati = (daymati==null)? "-" : daymati;
    this.monthmati = (monthmati==null)? "-" : monthmati;
    this.yearmati = (yearmati==null)? "-" : yearmati;

    this.day_ctk = (day_ctk==null)? "-" : day_ctk;
    this.month_ctk = (month_ctk==null)? "-" : month_ctk;
    this.year_ctk = (year_ctk==null)? "-" : year_ctk;

    this.nama_prop = (nama_prop==null)? "-" : nama_prop;
    this.nama_kab = (nama_kab==null)? "-" : nama_kab;
    this.tgl_ctk_ktakta = (tgl_ctk_ktakta==null)? "-" : tgl_ctk_ktakta;
  }
  public void setTmptMati(String tmpt_mati)
  {
    this.tmpt_mati=tmpt_mati;
  }

  public String getTmptMati()
  {
    return tmpt_mati;
  }
  public void setTgl_ctk_ktakta(String tgl_ctk_ktakta)
  {
    this.tgl_ctk_ktakta = tgl_ctk_ktakta;
  }
  public String getTgl_ctk_ktakta()
  {
    return tgl_ctk_ktakta;
  }
  public void setDsrhk_cttlhr(String dsrhk_cttlhr)
  {
    this.dsrhk_cttlhr = dsrhk_cttlhr;
  }
  public String getDsrhk_cttlhr()
  {
    return dsrhk_cttlhr;
  }
  public void setDaymati(String daymati)
  {
    this.daymati = daymati;
  }
  public String getDaymati()
  {
   return daymati;
  }
  public void setMonthmati(String monthmati)
  {
    this.monthmati = monthmati;
  }
  public String getMonthmati()
  {
   return monthmati;
  }
  public void setYearmati(String yearmati)
  {
    this.yearmati = yearmati;
  }
  public String getYearmati()
  {
   return yearmati;
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