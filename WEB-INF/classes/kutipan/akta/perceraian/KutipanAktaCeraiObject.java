package kutipan.akta.perceraian;

import java.io.Serializable;

public class KutipanAktaCeraiObject implements Serializable
{
  private String nik, no_akta_crai, dasar_hkm_crai, tgl_entry_date, tgl_entry_month, tgl_entry_year,
      lbg_pngadil_kel_kep, no_kep_pngadil, tgl_srt_date, tgl_srt_month, tgl_srt_year, tmpt_ctt_kwn,
      no_akta_kwn, day_kwn, month_kwn, year_kwn, tgl_ctk, day_ctk, month_ctk, year_ctk,nik_istri="";;

  private String nama_suami,nama_istri, nama_negara;

  public KutipanAktaCeraiObject(String no_akta_crai,String nama_suami,String nama_istri, String nama_negara )
  {
    this.no_akta_crai = no_akta_crai;
    this.nama_suami = nama_suami;
    this.nama_istri = nama_istri;
    this.nama_negara = nama_negara;
  }
//Added on 24 April 2004 by rajesh
  //Begin
  public KutipanAktaCeraiObject(String no_akta_crai,String nama_suami,String nama_istri, String nama_negara,String nik_istri)
  {
    this.no_akta_crai = no_akta_crai;
    this.nama_suami = nama_suami;
    this.nama_istri = nama_istri;
    this.nama_negara = nama_negara;
    this.nik_istri=nik_istri;
  }
  //End

  public KutipanAktaCeraiObject( String nik,String no_akta_crai, String dasar_hkm_crai,String tgl_entry_date,String tgl_entry_month,String tgl_entry_year,
      String lbg_pngadil_kel_kep,String no_kep_pngadil,String tgl_srt_date,String tgl_srt_month,String tgl_srt_year,String tmpt_ctt_kwn,
      String no_akta_kwn,String day_kwn,String month_kwn,String year_kwn,String tgl_ctk,String day_ctk,String month_ctk,String year_ctk
      ,String nama_suami,String nama_istri, String nama_negara )
  {
    this.nik = nik;
    this.no_akta_crai = (no_akta_crai==null)?"":no_akta_crai;
    this.dasar_hkm_crai = (dasar_hkm_crai==null)?"":dasar_hkm_crai;
    this.tgl_entry_date = (tgl_entry_date==null)?"":tgl_entry_date;
    this.tgl_entry_month = (tgl_entry_month==null)?"":tgl_entry_month;
    this.tgl_entry_year = (tgl_entry_year==null)?"":tgl_entry_year;

    this.lbg_pngadil_kel_kep = (lbg_pngadil_kel_kep==null)?"":lbg_pngadil_kel_kep;
    this.no_kep_pngadil = (no_kep_pngadil==null)?"":no_kep_pngadil;
    this.tgl_srt_date = (tgl_srt_date==null)?"":tgl_srt_date;
    this.tgl_srt_month = (tgl_srt_month==null)?"":tgl_srt_month;
    this.tgl_srt_year = (tgl_srt_year==null)?"":tgl_srt_year;

    this.tmpt_ctt_kwn = (tmpt_ctt_kwn==null)?"":tmpt_ctt_kwn;
    this.no_akta_kwn = (no_akta_kwn==null)?"":no_akta_kwn;
    this.day_kwn = (day_kwn==null)?"":day_kwn;
    this.month_kwn = (month_kwn==null)?"":month_kwn;
    this.year_kwn = (year_kwn==null)?"":year_kwn;
    this.tgl_ctk = (tgl_ctk==null)?"":tgl_ctk;
    this.day_ctk = (day_ctk==null)?"":day_ctk;
    this.month_ctk = (month_ctk==null)?"":month_ctk;
    this.year_ctk = (year_ctk==null)?"":year_ctk;

    this.nama_suami = (nama_suami==null)?"":nama_suami;
    this.nama_istri = (nama_istri==null)?"":nama_istri;
    this.nama_negara = (nama_negara==null)?"":nama_negara;
  }
//Added on 24 April 2004 by rajesh
  //Begin
  public void setNikIstri(String nik_istri)
  {
        this.nik_istri= nik_istri;
  }

  public String getNikIstri()
  {
    return nik_istri;
  }
//end
  public void setNama_suami(String nama_suami)
  {
    this.nama_suami = nama_suami;
  }
  public String getNama_suami()
  {
    return nama_suami;
  }
  public void setNama_istri(String nama_istri)
  {
    this.nama_istri = nama_istri;
  }
  public String getNama_istri()
  {
    return nama_istri;
  }
  public void setNama_negara(String nama_negara)
  {
    this.nama_negara = nama_negara;
  }
  public String getNama_negara()
  {
    return nama_negara;
  }

  public void setNik(String nik)
  {
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
  }
  public void setNo_akta_crai(String no_akta_crai)
  {
    this.no_akta_crai = no_akta_crai;
  }
  public String getNo_akta_crai()
  {
    return no_akta_crai;
  }
  public void setDasar_hkm_crai(String dasar_hkm_crai)
  {
    this.dasar_hkm_crai = dasar_hkm_crai;
  }
  public String getDasar_hkm_crai()
  {
    return dasar_hkm_crai;
  }
  public void setTgl_entry_date(String tgl_entry_date)
  {
    this.tgl_entry_date = tgl_entry_date;
  }
  public String getTgl_entry_date()
  {
    return tgl_entry_date;
  }
  public void setTgl_entry_month(String tgl_entry_month)
  {
    this.tgl_entry_month = tgl_entry_month;
  }
  public String getTgl_entry_month()
  {
    return tgl_entry_month;
  }
  public void setTgl_entry_year(String tgl_entry_year)
  {
    this.tgl_entry_year = tgl_entry_year;
  }
  public String getTgl_entry_year()
  {
    return tgl_entry_year;
  }

  public void setTmpt_ctt_kwn(String tmpt_ctt_kwn)
  {
    this.tmpt_ctt_kwn = tmpt_ctt_kwn;
  }
  public String getTmpt_ctt_kwn()
  {
    return tmpt_ctt_kwn;
  }
  public void setNo_akta_kwn(String no_akta_kwn)
  {
    this.no_akta_kwn = no_akta_kwn;
  }
  public String getNo_akta_kwn()
  {
    return no_akta_kwn;
  }
  public void setDay_kwn(String day_kwn)
  {
    this.day_kwn = day_kwn;
  }
  public String getDay_kwn()
  {
    return day_kwn;
  }
  public void setMonth_kwn(String month_kwn)
  {
    this.month_kwn = month_kwn;
  }
  public String getMonth_kwn()
  {
    return month_kwn;
  }
  public void setYear_kwn(String year_kwn)
  {
    this.year_kwn = year_kwn;
  }
  public String getYear_kwn()
  {
    return year_kwn;
  }

  public void setTgl_ctk(String tgl_ctk)
  {
    this.tgl_ctk = tgl_ctk;
  }
  public String getTgl_ctk()
  {
    return tgl_ctk;
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

  public void setLbg_pngadil_kel_kep(String lbg_pngadil_kel_kep)
  {
    this.lbg_pngadil_kel_kep = lbg_pngadil_kel_kep;
  }
  public String getLbg_pngadil_kel_kep()
  {
    return lbg_pngadil_kel_kep;
  }
  public void setNo_kep_pngadil(String no_kep_pngadil)
  {
    this.no_kep_pngadil = no_kep_pngadil;
  }
  public String getNo_kep_pngadil()
  {
    return no_kep_pngadil;
  }
  public void setTgl_srt_date(String tgl_srt_date)
  {
    this.tgl_srt_date  =tgl_srt_date;
  }
  public String getTgl_srt_date()
  {
    return tgl_srt_date;
  }
  public void setTgl_srt_month(String tgl_srt_month)
  {
    this.tgl_srt_month = tgl_srt_month;
  }
  public String getTgl_srt_month()
  {
    return tgl_srt_month;
  }
  public void setTgl_srt_year(String tgl_srt_year)
  {
    this.tgl_srt_year  =tgl_srt_year;
  }
  public String getTgl_srt_year()
  {
    return tgl_srt_year;
  }

}