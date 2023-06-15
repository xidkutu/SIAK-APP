package kutipan.akta.kawin;

import java.io.Serializable;

public class KutipanAktaKawinObject implements Serializable
{
  private String nik,no_akta_kwn,dsrhk_cttlhr,tgl_entry_date,
      tgl_entry_month,tgl_entry_year,tduk_agama,
      nama_pmka_agama,daykwn,monthkwn,yearkwn,tgl_ctk,day_ctk,
      month_ctk,year_ctk,nama_prop,nama_kab;
  private String nama_suami,nama_istri, nama_negara;
  private String nama_tmpt_pnesah,ket_nama_tmpt_pnesah;
  private String nik_istri="";
  public KutipanAktaKawinObject(String no_akta_kwn,String nama_suami,String nama_istri, String nama_negara )
  {
    this.no_akta_kwn = no_akta_kwn;
    this.nama_suami = nama_suami;
    this.nama_istri = nama_istri;
    this.nama_negara = nama_negara;
  }
//Added on 21 April 2004 by Rajesh
//Begin
  public KutipanAktaKawinObject(String no_akta_kwn,String nama_suami,String nama_istri, String nama_negara,String nik_istri )
  {
    this.no_akta_kwn = no_akta_kwn;
    this.nama_suami = nama_suami;
    this.nama_istri = nama_istri;
    this.nama_negara = nama_negara;
    this.nik_istri=nik_istri;
  }

//End
  public KutipanAktaKawinObject(String nik,String no_akta_kwn,String dsrhk_cttlhr,String tgl_entry_date,
      String tgl_entry_month,String tgl_entry_year,String tduk_agama,
      String nama_pmka_agama,String daykwn,String monthkwn,String yearkwn,String tgl_ctk,String day_ctk,
      String month_ctk,String year_ctk,String nama_prop,String nama_kab
      , String nama_suami, String nama_istri)
  {
    this.nik = nik;
    this.no_akta_kwn = no_akta_kwn;
    this.dsrhk_cttlhr = dsrhk_cttlhr;

    this.tgl_entry_date =tgl_entry_date;//1
    this.tgl_entry_month = tgl_entry_month;//2
    this.tgl_entry_year = tgl_entry_year;//3
    this.tduk_agama = tduk_agama;
    this.nama_pmka_agama = nama_pmka_agama;

    this.daykwn = daykwn;
    this.monthkwn = monthkwn;
    this.yearkwn = yearkwn;
    this.tgl_ctk = tgl_ctk;
    this.day_ctk = day_ctk;
    this.month_ctk = month_ctk;
    this.year_ctk = year_ctk;
    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
    this.nama_suami = nama_suami;
    this.nama_istri = nama_istri;
  }


  public KutipanAktaKawinObject(String nik,String no_akta_kwn,String dsrhk_cttlhr,String tgl_entry_date,
     String tgl_entry_month,String tgl_entry_year,String tduk_agama,
     String nama_pmka_agama,String daykwn,String monthkwn,String yearkwn,String tgl_ctk,String day_ctk,
     String month_ctk,String year_ctk,String nama_prop,String nama_kab
     , String nama_suami, String nama_istri,String nama_tmpt_pnesah,
String ket_nama_tmpt_pnesah
)
 {
   this.nik = nik;
   this.no_akta_kwn = (no_akta_kwn==null)?"":no_akta_kwn;
   this.dsrhk_cttlhr = (dsrhk_cttlhr==null)?"":dsrhk_cttlhr;

   this.tgl_entry_date =(tgl_entry_date==null)?"":tgl_entry_date;//1
   this.tgl_entry_month = (tgl_entry_month==null)?"":tgl_entry_month;//2
   this.tgl_entry_year = (tgl_entry_year==null)?"":tgl_entry_year;//3
   this.tduk_agama = (tduk_agama==null)?"":tduk_agama;
   this.nama_pmka_agama = (nama_pmka_agama==null)?"":nama_pmka_agama;

   this.daykwn = (daykwn==null)?"":daykwn;
   this.monthkwn = (monthkwn==null)?"":monthkwn;
   this.yearkwn = (yearkwn==null)?"":yearkwn;
   this.tgl_ctk = (tgl_ctk==null)?"":tgl_ctk;
   this.day_ctk = (day_ctk==null)?"":day_ctk;
   this.month_ctk = (month_ctk==null)?"":month_ctk;
   this.year_ctk = (year_ctk==null)?"":year_ctk;
   this.nama_prop = (nama_prop==null)?"":nama_prop;
   this.nama_kab = (nama_kab==null)?"":nama_kab;
   this.nama_suami = (nama_suami==null)?"":nama_suami;
   this.nama_istri = (nama_istri==null)?"":nama_istri;
   this.nama_tmpt_pnesah=(nama_tmpt_pnesah==null)?"":nama_tmpt_pnesah;
   this.ket_nama_tmpt_pnesah=(ket_nama_tmpt_pnesah==null)?"":ket_nama_tmpt_pnesah;
 }


//Added on 21 April 2004 by Rajesh
//Begin
public void setNikIstri(String nik_istri)
 {
   this.nik_istri=nik_istri;
 }

public String getNikIstri()
 {
  return  nik_istri;
 }
//End

public String getNamaTmptPnesah()
 {
   return (nama_tmpt_pnesah==null)?"":nama_tmpt_pnesah;
 }
 public void setNamaTmptPnesah(String nama_tmpt_pnesah)
 {
   this.nama_tmpt_pnesah=nama_tmpt_pnesah;
 }

 public String getKettmptpnesah()
 {
   return (ket_nama_tmpt_pnesah==null)?"":ket_nama_tmpt_pnesah;
 }

 public void setKettmptpnesah(String ket_nama_tmpt_pnesah)
 {
   this.ket_nama_tmpt_pnesah=ket_nama_tmpt_pnesah;
 }

  public void setNik(String nik)
  {
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
  }

  public void setNo_akta_kwn(String no_akta_kwn)
  {
    this.no_akta_kwn = no_akta_kwn;
  }
  public String getNo_akta_kwn()
  {
    return no_akta_kwn;
  }
  public void setDsrhk_cttlhr(String dsrhk_cttlhr)
  {
    this.dsrhk_cttlhr = dsrhk_cttlhr;
  }
  public String getDsrhk_cttlhr()
  {
    return dsrhk_cttlhr;
  }
  public void setDaykwn(String daykwn)
  {
    this.daykwn = daykwn;
  }
  public String getDaykwn()
  {
    return daykwn;
  }

  public void setMonthkwn(String monthkwn)
  {
    this.monthkwn = monthkwn;
  }
  public String getMonthkwn()
  {
    return monthkwn;
  }
  public void setYearkwn(String yearkwn)
  {
    this.yearkwn = yearkwn;
  }
  public String getYearkwn()
  {
    return yearkwn;
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
  public void setTgl_ctk(String tgl_ctk)
  {
    this.tgl_ctk = tgl_ctk;
  }
  public String getTgl_ctk()
  {
    return tgl_ctk;
  }
  public void setNama_pmka_agama(String nama_pmka_agama)
  {
    this.nama_pmka_agama = nama_pmka_agama;
  }
  public String getNama_pmka_agama()
  {
    return nama_pmka_agama;
  }
  public void setTduk_agama(String tduk_agama)
  {
    this.tduk_agama = tduk_agama;
  }
  public String getTduk_agama()
  {
    return tduk_agama;
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
  public void setNama_negara(String nama_negara)
  {
    this.nama_negara = nama_negara;
  }
  public String getNama_negara()
  {
    return nama_negara;
  }
}