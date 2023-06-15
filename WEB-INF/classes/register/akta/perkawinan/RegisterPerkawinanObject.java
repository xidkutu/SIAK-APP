package register.akta.perkawinan;

public class RegisterPerkawinanObject implements java.io.Serializable
{
  private String no_akta_kawin_suami,nik_suami,nik_istri,dsrhk_cttlhr;
  private String m_ini_day,m_current_date,m_current_month,m_current_year,m_current_time;
  private String persyaratan_kawin,kwrngrn_suami,nama_lgkp_suami,tmpt_lahir_suami;
  private String tgl_lhr_day_suami,tgl_lhr_string_dd_suami,tgl_lhr_string_mm_suami;
  private String tgl_lhr_string_yy_suami,agama_suami,alamat_suami,rt_suami,rw_suami,propnama_suami;
  private String kabnama_suami,kecnama_suami,kelnama_suami,kwrngrn_istri,nama_lgkp_istri,sebel_istri;
  private String tmpt_lahir_istri,tgl_lhr_day_istri,tgl_lhr_string_dd_istri,tgl_lhr_string_mm_istri;
  private String tgl_lhr_string_yy_istri,agama_istri,alamat_istri,rt_istri,rw_istri,propnama_istri;
  private String kabnama_istri,kecnama_istri,kelnama_istri,nama_ayah_suami,umur_ayah_suami,pekerjaan_ayah_suami;
  private String alamat_ayah,rt_ayah_suami,rw_ayah_suami,kel_ayah_suami,kec_ayah_suami,kab_ayah_suami,prop_ayah_suami;
  private String nama_ibu_suami,umur_ibu_suami,pekerjaan_ibu_suami,alamat_ibu_suami,rt_ibu_suami;
  private String rw_ibu_suami,kel_ibu_suami,kec_ibu_sami,kab_ibu_suami,prop_ibu_suami,nama_ayah_istri;
  private String umur_ayah_istri,pekerjaan_ayah_istri,alamat_ayah_istri,rt_ayah_istri,rw_ayah_istri;
  private String kel_ayah_istri,kec_ayah_istri,kab_ayah_istri,prop_ayah_istri,nama_ibu_istri;
  private String umur_ibu_istri,pekerjaan_ibu_istri,alamat_ibu_istri,rt_ibu_istri,rw_ibu_istri,kel_ibu_istri,kec_ibu_istri,kab_ibu_istri,prop_ibu_istri;
  private String nama_pmka,alamat_pmka,rt_pmka,rw_pmka,prop_pmka,kab_pmka,kec_pmka,kel_pmka,nama_saksi1;
  private String umur_saksi1,pekerjaan_saksi1,alamat_saksi1,rt_saksi1,rw_saksi1,kel_saksi1,kec_saksi1,kab_saksi1;
  private String prop_saksi1,nama_saksi2,umur_saksi2,pekerjaan_saksi2,alamat_saksi2,rt_saksi2,rw_saksi2,kel_saksi2,kec_saksi2,kab_saksi2,prop_saksi2,tgl_cetak_akta;
  private String KWN_DATE,KWN_MONTH,KWN_YEAR;
  private String NAMA_TMPT_PNESAH="";
  String KET_NAMA_TMPT_PNESAH="";
  private String umur_suami, pekarjan_suami, m_agama_ayah_suami, m_agama_ibu_suami, m_umur_istri, m_pekarjan_istri, m_agama_ayah_istri, m_agama_ibu_istri;
  private String tiduk_agama, sebel_suami, agama_saksi1, agama_saksi2;

 public RegisterPerkawinanObject(String no_akta_kawin_suami,String nik_suami,String nik_istri,String dsrhk_cttlhr,
                                  String m_ini_day,String m_current_date,String m_current_month,String m_current_year,String m_current_time,
                                  String persyaratan_kawin,String kwrngrn_suami,String nama_lgkp_suami,String tmpt_lahir_suami,
                                  String tgl_lhr_day_suami,String tgl_lhr_string_dd_suami,String tgl_lhr_string_mm_suami,
                                  String tgl_lhr_string_yy_suami,String agama_suami,String alamat_suami,String rt_suami,String rw_suami,String propnama_suami,
                                  String kabnama_suami,String kecnama_suami,String kelnama_suami,String kwrngrn_istri,String nama_lgkp_istri,String sebel_istri,
                                  String tmpt_lahir_istri,String tgl_lhr_day_istri,String tgl_lhr_string_dd_istri,String tgl_lhr_string_mm_istri,
                                  String tgl_lhr_string_yy_istri,String agama_istri,String alamat_istri,String rt_istri,String rw_istri,String propnama_istri,
                                  String kabnama_istri,String kecnama_istri,String kelnama_istri,String nama_ayah_suami,String umur_ayah_suami,String pekerjaan_ayah_suami,
                                  String alamat_ayah,String rt_ayah_suami,String rw_ayah_suami,String kel_ayah_suami,String kec_ayah_suami,String kab_ayah_suami,String prop_ayah_suami,
                                  String nama_ibu_suami,String umur_ibu_suami,String pekerjaan_ibu_suami,String alamat_ibu_suami,String rt_ibu_suami,
                                  String rw_ibu_suami,String kel_ibu_suami,String kec_ibu_sami,String kab_ibu_suami,String prop_ibu_suami,String nama_ayah_istri,
                                  String umur_ayah_istri,String pekerjaan_ayah_istri,String alamat_ayah_istri,String rt_ayah_istri,String rw_ayah_istri,
                                  String kel_ayah_istri,String kec_ayah_istri,String kab_ayah_istri,String prop_ayah_istri,String nama_ibu_istri,
                                  String umur_ibu_istri,String pekerjaan_ibu_istri,String alamat_ibu_istri,String rt_ibu_istri,
                                  String rw_ibu_istri,String kel_ibu_istri,String kec_ibu_istri,String kab_ibu_istri,String prop_ibu_istri,
                                  String nama_pmka,String KWN_DATE,String KWN_MONTH,String KWN_YEAR,
                                  String NAMA_TMPT_PNESAH ,String KET_NAMA_TMPT_PNESAH ,
                                  String nama_saksi1,
                                  String umur_saksi1,String pekerjaan_saksi1,String alamat_saksi1,String rt_saksi1,String rw_saksi1,String kel_saksi1,String kec_saksi1,String kab_saksi1,
                                  String prop_saksi1,String nama_saksi2,String umur_saksi2,String pekerjaan_saksi2,String alamat_saksi2,String rt_saksi2,String rw_saksi2,
                                  String kel_saksi2,String kec_saksi2,String kab_saksi2,String prop_saksi2,String tgl_cetak_akta,
                                  String umur_suami, String pekarjan_suami, String m_agama_ayah_suami,
                                  String m_agama_ibu_suami, String m_umur_istri,
                                  String m_pekarjan_istri, String m_agama_ayah_istri,
                                  String m_agama_ibu_istri, String tiduk_agama, String sebel_suami,
                                  String agama_saksi1, String agama_saksi2)
  {
    this.no_akta_kawin_suami=(no_akta_kawin_suami==null)?"-":no_akta_kawin_suami;
    this.nik_suami=(nik_suami==null)?"-":nik_suami;
    this.nik_istri=(nik_istri==null)?"-":nik_istri;
    this.dsrhk_cttlhr=(dsrhk_cttlhr==null)?"-":dsrhk_cttlhr;
    this.m_ini_day=(m_ini_day==null)?"-":m_ini_day;
    this.m_current_date=(m_current_date==null)?"-":m_current_date;
    this.m_current_month=(m_current_month==null)?"-":m_current_month;
    this.m_current_year=(m_current_year==null)?"-":m_current_year;
    this.m_current_time=(m_current_time==null)?"-":m_current_time;
    this.persyaratan_kawin=(persyaratan_kawin==null)?"-":persyaratan_kawin;
    this.kwrngrn_suami=(kwrngrn_suami==null)?"-":kwrngrn_suami;
    this.nama_lgkp_suami=(nama_lgkp_suami==null)?"-":nama_lgkp_suami;
    this.tmpt_lahir_suami=(tmpt_lahir_suami==null)?"-":tmpt_lahir_suami;
    this.tgl_lhr_day_suami=(tgl_lhr_day_suami==null)?"-":tgl_lhr_day_suami;
    this.tgl_lhr_string_dd_suami=(tgl_lhr_string_dd_suami==null)?"-":tgl_lhr_string_dd_suami;
    this.tgl_lhr_string_mm_suami=(tgl_lhr_string_mm_suami==null)?"-":tgl_lhr_string_mm_suami;
    this.tgl_lhr_string_yy_suami=(tgl_lhr_string_yy_suami==null)?"-":tgl_lhr_string_yy_suami;
    this.agama_suami=(agama_suami==null)?"-":agama_suami;
    this.alamat_suami=(alamat_suami==null)?"-":alamat_suami;
    this.rt_suami=(rt_suami==null)?"-":rt_suami;
    this.rw_suami=(rw_suami==null)?"-":rw_suami;
    this.propnama_suami=(propnama_suami==null)?"-":propnama_suami;
    this.kabnama_suami=(kabnama_suami==null)?"-":kabnama_suami;
    this.kecnama_suami=(kecnama_suami==null)?"-":kecnama_suami;
    this.kelnama_suami=(kelnama_suami==null)?"-":kelnama_suami;
    this.kwrngrn_istri=(kwrngrn_istri==null)?"-":kwrngrn_istri;
    this.nama_lgkp_istri=(nama_lgkp_istri==null)?"-":nama_lgkp_istri;
    this.sebel_istri=(sebel_istri==null)?"-":sebel_istri;
    this.tmpt_lahir_istri=(tmpt_lahir_istri==null)?"-":tmpt_lahir_istri;
    this.tgl_lhr_day_istri=(tgl_lhr_day_istri==null)?"-":tgl_lhr_day_istri;
    this.tgl_lhr_string_dd_istri=(tgl_lhr_string_dd_istri==null)?"-":tgl_lhr_string_dd_istri;
    this.tgl_lhr_string_mm_istri=(tgl_lhr_string_mm_istri==null)?"-":tgl_lhr_string_mm_istri;
    this.tgl_lhr_string_yy_istri=(tgl_lhr_string_yy_istri==null)?"-":tgl_lhr_string_yy_istri;
    this.agama_istri=(agama_istri==null)?"-":agama_istri;
    this.alamat_istri=(alamat_istri==null)?"-":alamat_istri;
    this.rt_istri=(rt_istri==null)?"-":rt_istri;
    this.rw_istri=(rw_istri==null)?"-":rw_istri;
    this.propnama_istri=(propnama_istri==null)?"-":propnama_istri;
    this.kabnama_istri=(kabnama_istri==null)?"-":kabnama_istri;
    this.kecnama_istri=(kecnama_istri==null)?"-":kecnama_istri;
    this.kelnama_istri=(kelnama_istri==null)?"-":kelnama_istri;
    this.nama_ayah_suami=(nama_ayah_suami==null)?"-":nama_ayah_suami;
    this.umur_ayah_suami=(umur_ayah_suami==null)?"-":umur_ayah_suami;
    this.pekerjaan_ayah_suami=(pekerjaan_ayah_suami==null)?"-":pekerjaan_ayah_suami;
    this.alamat_ayah=(alamat_ayah==null)?"-":alamat_ayah;
    this.rt_ayah_suami=(rt_ayah_suami==null)?"-":rt_ayah_suami;
    this.rw_ayah_suami=(rw_ayah_suami==null)?"-":rw_ayah_suami;
    this.kel_ayah_suami=(kel_ayah_suami==null)?"-":kel_ayah_suami;
    this.kec_ayah_suami=(kec_ayah_suami==null)?"-":kec_ayah_suami;
    this.kab_ayah_suami=(kab_ayah_suami==null)?"-":kab_ayah_suami;
    this.prop_ayah_suami=(prop_ayah_suami==null)?"-":prop_ayah_suami;
    this.nama_ibu_suami=(nama_ibu_suami==null)?"-":nama_ibu_suami;
    this.umur_ibu_suami=(umur_ibu_suami==null)?"-":umur_ibu_suami;
    this.pekerjaan_ibu_suami=(pekerjaan_ibu_suami==null)?"-":pekerjaan_ibu_suami;
    this.alamat_ibu_suami=(alamat_ibu_suami==null)?"-":alamat_ibu_suami;
    this.rt_ibu_suami=(rt_ibu_suami==null)?"-":rt_ibu_suami;
    this.rw_ibu_suami=(rw_ibu_suami==null)?"-":rw_ibu_suami;
    this.kel_ibu_suami=(kel_ibu_suami==null)?"-":kel_ibu_suami;
    this.kec_ibu_sami=(kec_ibu_sami==null)?"-":kec_ibu_sami;
    this.kab_ibu_suami=(kab_ibu_suami==null)?"-":kab_ibu_suami;
    this.prop_ibu_suami=(prop_ibu_suami==null)?"-":prop_ibu_suami;
    this.nama_ayah_istri=(nama_ayah_istri==null)?"-":nama_ayah_istri;
    this.umur_ayah_istri=(umur_ayah_istri==null)?"-":umur_ayah_istri;
    this.pekerjaan_ayah_istri=(pekerjaan_ayah_istri==null)?"-":pekerjaan_ayah_istri;
    this.alamat_ayah_istri=(alamat_ayah_istri==null)?"-":alamat_ayah_istri;
    this.rt_ayah_istri=(rt_ayah_istri==null)?"-":rt_ayah_istri;
    this.rw_ayah_istri=(rw_ayah_istri==null)?"-":rw_ayah_istri;
    this.kel_ayah_istri=(kel_ayah_istri==null)?"-":kel_ayah_istri;
    this.kec_ayah_istri=(kec_ayah_istri==null)?"-":kec_ayah_istri;
    this.kab_ayah_istri=(kab_ayah_istri==null)?"-":kab_ayah_istri;
    this.prop_ayah_istri=(prop_ayah_istri==null)?"-":prop_ayah_istri;
    this.nama_ibu_istri=(nama_ibu_istri==null)?"-":nama_ibu_istri;
    this.umur_ibu_istri=(umur_ibu_istri==null)?"-":umur_ibu_istri;
    this.pekerjaan_ibu_istri=(pekerjaan_ibu_istri==null)?"-":pekerjaan_ibu_istri;
    this.alamat_ibu_istri=(alamat_ibu_istri==null)?"-":alamat_ibu_istri;
    this.rt_ibu_istri=(rt_ibu_istri==null)?"-":rt_ibu_istri;
    this.rw_ibu_istri=(rw_ibu_istri==null)?"-":rw_ibu_istri;
    this.kel_ibu_istri=(kel_ibu_istri==null)?"-":kel_ibu_istri;
    this.kec_ibu_istri=(kec_ibu_istri==null)?"-":kec_ibu_istri;
    this.kab_ibu_istri=(kab_ibu_istri==null)?"-":kab_ibu_istri;
    this.prop_ibu_istri=(prop_ibu_istri==null)?"-":prop_ibu_istri;
    this.nama_pmka=(nama_pmka==null)?"-":nama_pmka;

    this.KWN_DATE=(KWN_DATE==null)?"-":KWN_DATE;
    this.KWN_MONTH=(KWN_MONTH==null)?"-":KWN_MONTH;
    this.KWN_YEAR=(KWN_YEAR==null)?"-":KWN_YEAR;
    this.NAMA_TMPT_PNESAH= (NAMA_TMPT_PNESAH==null)?"-":NAMA_TMPT_PNESAH;
    this.KET_NAMA_TMPT_PNESAH=(KET_NAMA_TMPT_PNESAH==null)?"-":KET_NAMA_TMPT_PNESAH;
    this.nama_saksi1=(nama_saksi1==null)?"-":nama_saksi1;
    this.umur_saksi1=(umur_saksi1==null)?"-":umur_saksi1;
    this.pekerjaan_saksi1=(pekerjaan_saksi1==null)?"-":pekerjaan_saksi1;
    this.alamat_saksi1=(alamat_saksi1==null)?"-":alamat_saksi1;
    this.rt_saksi1=(rt_saksi1==null)?"-":rt_saksi1;
    this.rw_saksi1=(rw_saksi1==null)?"-":rw_saksi1;
    this.kel_saksi1=(kel_saksi1==null)?"-":kel_saksi1;
    this.kec_saksi1=(kec_saksi1==null)?"-":kec_saksi1;
    this.kab_saksi1=(kab_saksi1==null)?"-":kab_saksi1;
    this.prop_saksi1=(prop_saksi1==null)?"-":prop_saksi1;
    this.nama_saksi2=(nama_saksi2==null)?"-":nama_saksi2;
    this.umur_saksi2=(umur_saksi2==null)?"-":umur_saksi2;
    this.pekerjaan_saksi2=(pekerjaan_saksi2==null)?"-":pekerjaan_saksi2;
    this.alamat_saksi2=(alamat_saksi2==null)?"-":alamat_saksi2;
    this.rt_saksi2=(rt_saksi2==null)?"-":rt_saksi2;
    this.rw_saksi2=(rw_saksi2==null)?"-":rw_saksi2;
    this.kel_saksi2=(kel_saksi2==null)?"-":kel_saksi2;
    this.kec_saksi2=(kec_saksi2==null)?"-":kec_saksi2;
    this.kab_saksi2=(kab_saksi2==null)?"-":kab_saksi2;
    this.prop_saksi2=(prop_saksi2==null)?"-":prop_saksi2;
    this.tgl_cetak_akta=(tgl_cetak_akta==null)?"-":tgl_cetak_akta;

    this.umur_suami = (umur_suami==null)?"-":umur_suami;
    this.pekarjan_suami=(pekarjan_suami==null)?"-":pekarjan_suami;
    this.m_agama_ayah_suami=(m_agama_ayah_suami==null)?"-":m_agama_ayah_suami;
    this.m_agama_ibu_suami=(m_agama_ibu_suami==null)?"-":m_agama_ibu_suami;
    this.m_umur_istri=(m_umur_istri==null)?"-":m_umur_istri;
    this.m_pekarjan_istri=(m_pekarjan_istri==null)?"-":m_pekarjan_istri;
    this.m_agama_ayah_istri=(m_agama_ayah_istri==null)?"-":m_agama_ayah_istri;
    this.m_agama_ibu_istri=(m_agama_ibu_istri==null)?"-":m_agama_ibu_istri;

    this.tiduk_agama = (tiduk_agama==null)?"-":tiduk_agama;
    this.sebel_suami = (sebel_suami==null)?"-":sebel_suami;
    this.agama_saksi1 = (agama_saksi1==null)?"-":agama_saksi1;
    this.agama_saksi2 = (agama_saksi2==null)?"-":agama_saksi2;
  }


  public String     getNamaTmptPnesah()
      {
        return NAMA_TMPT_PNESAH;

      }
    public void setNamaTmptPnesah(String NAMA_TMPT_PNESAH)
    {
         this.NAMA_TMPT_PNESAH= (NAMA_TMPT_PNESAH==null)?"-":NAMA_TMPT_PNESAH;
    }


    public String     getKetNamaTmptPnesah()
        {
       return KET_NAMA_TMPT_PNESAH;
        }
      public void setKetNamaTmptPnesah(String KET_NAMA_TMPT_PNESAH)
      {
      this.KET_NAMA_TMPT_PNESAH=(KET_NAMA_TMPT_PNESAH==null)?"-":KET_NAMA_TMPT_PNESAH;
      }


  public void setNo_akta_kawin_suami(String no_akta_kawin_suami)
  {
    this.no_akta_kawin_suami = no_akta_kawin_suami;
  }
  public String getNo_akta_kawin_suami()
  {
    return no_akta_kawin_suami;
  }
  public void setNik_suami(String nik_suami)
  {
    this.nik_suami = nik_suami;
  }
  public String getNik_suami()
  {
    return nik_suami;
  }
  public void setNik_istri(String nik_istri)
  {
    this.nik_istri = nik_istri;
  }
  public String getNik_istri()
  {
    return nik_istri;
  }
  public void setDsrhk_cttlhr(String dsrhk_cttlhr)
  {
    this.dsrhk_cttlhr = dsrhk_cttlhr;
  }
  public String getDsrhk_cttlhr()
  {
    return dsrhk_cttlhr;
  }
  public void setM_ini_day(String m_ini_day)
  {
    this.m_ini_day = m_ini_day;
  }
  public String getM_ini_day()
  {
    return m_ini_day;
  }
  public void setM_current_date(String m_current_date)
  {
    this.m_current_date = m_current_date;
  }
  public String getM_current_date()
  {
    return m_current_date;
  }
  public void setM_current_month(String m_current_month)
  {
    this.m_current_month = m_current_month;
  }
  public String getM_current_month()
  {
    return m_current_month;
  }
  public void setM_current_year(String m_current_year)
  {
    this.m_current_year = m_current_year;
  }
  public String getM_current_year()
  {
    return m_current_year;
  }
  public void setM_current_time(String m_current_time)
  {
    this.m_current_time = m_current_time;
  }
  public String getM_current_time()
  {
    return m_current_time;
  }
  public void setPersyaratan_kawin(String persyaratan_kawin)
  {
    this.persyaratan_kawin = persyaratan_kawin;
  }

  public String getPersyaratan_kawin()
  {
    return persyaratan_kawin;
  }

  public void setKwrngrn_suami(String kwrngrn_suami)
  {
    this.kwrngrn_suami = kwrngrn_suami;
  }
  public String getKwrngrn_suami()
  {
    return kwrngrn_suami;
  }
  public void setNama_lgkp_suami(String nama_lgkp_suami)
  {
    this.nama_lgkp_suami = nama_lgkp_suami;
  }
  public String getNama_lgkp_suami()
  {
    return nama_lgkp_suami;
  }
  public void setTmpt_lahir_suami(String tmpt_lahir_suami)
  {
    this.tmpt_lahir_suami = tmpt_lahir_suami;
  }
  public String getTmpt_lahir_suami()
  {
    return tmpt_lahir_suami;
  }
  public void setTgl_lhr_day_suami(String tgl_lhr_day_suami)
  {
    this.tgl_lhr_day_suami = tgl_lhr_day_suami;
  }
  public String getTgl_lhr_day_suami()
  {
    return tgl_lhr_day_suami;
  }
  public void setTgl_lhr_string_dd_suami(String tgl_lhr_string_dd_suami)
  {
    this.tgl_lhr_string_dd_suami = tgl_lhr_string_dd_suami;
  }
  public String getTgl_lhr_string_dd_suami()
  {
    return tgl_lhr_string_dd_suami;
  }
  public void setTgl_lhr_string_mm_suami(String tgl_lhr_string_mm_suami)
  {
    this.tgl_lhr_string_mm_suami = tgl_lhr_string_mm_suami;
  }
  public String getTgl_lhr_string_mm_suami()
  {
    return tgl_lhr_string_mm_suami;
  }
  public void setTgl_lhr_string_yy_suami(String tgl_lhr_string_yy_suami)
  {
    this.tgl_lhr_string_yy_suami = tgl_lhr_string_yy_suami;
  }
  public String getTgl_lhr_string_yy_suami()
  {
    return tgl_lhr_string_yy_suami;
  }
  public void setAgama_suami(String agama_suami)
  {
    this.agama_suami = agama_suami;
  }
  public String getAgama_suami()
  {
    return agama_suami;
  }

  public void setAlamat_suami(String alamat_suami)
  {
    this.alamat_suami = alamat_suami;
  }
  public String getAlamat_suami()
  {
    return alamat_suami;
  }
   public void setRt_suami(String rt_suami)
   {
     this.rt_suami = rt_suami;
   }
   public String getRt_suami()
   {
     return rt_suami;
   }
   public void setRw_suami(String rw_suami)
   {
     this.rw_suami = rw_suami;
   }
   public String getRw_suami()
   {
     return rw_suami;
   }
   public void setPropnama_suami(String propnama_suami)
   {
     this.propnama_suami = propnama_suami;
   }
   public String getPropnama_suami()
   {
     return propnama_suami;
   }

   public void setKabnama_suami(String kabnama_suami)
   {
     this.kabnama_suami = kabnama_suami;
   }
   public String getKabnama_suami()
   {
     return kabnama_suami;
   }
   public void setKecnama_suami(String kecnama_suami)
   {
     this.kecnama_suami = kecnama_suami;
   }
   public String getKecnama_suami()
   {
     return kecnama_suami;
   }
   public void setKelnama_suami(String kelnama_suami)
   {
     this.kelnama_suami = kelnama_suami;
   }
   public String getKelnama_suami()
   {
     return kelnama_suami;
   }
   public void setKwrngrn_istri(String kwrngrn_istri)
   {
     this.kwrngrn_istri = kwrngrn_istri;
   }
   public String getKwrngrn_istri()
   {
     return kwrngrn_istri;
   }
   public void setNama_lgkp_istri(String nama_lgkp_istri)
   {
     this.nama_lgkp_istri = nama_lgkp_istri;
   }
   public String getNama_lgkp_istri()
   {
     return nama_lgkp_istri;
   }
   public void setSebel_istri(String sebel_istri)
   {
     this.sebel_istri = sebel_istri;
   }
   public String getSebel_istri()
   {
     return sebel_istri;
   }

   public void setTmpt_lahir_istri(String tmpt_lahir_istri)
   {
     this.tmpt_lahir_istri = tmpt_lahir_istri;
   }
   public String getTmpt_lahir_istri()
   {
     return tmpt_lahir_istri;
   }
   public void setTgl_lhr_day_istri(String tgl_lhr_day_istri)
   {
     this.tgl_lhr_day_istri = tgl_lhr_day_istri;
   }
   public String getTgl_lhr_day_istri()
   {
     return tgl_lhr_day_istri;
   }
   public void setTgl_lhr_string_dd_istri(String tgl_lhr_string_dd_istri)
   {
     this.tgl_lhr_string_dd_istri = tgl_lhr_string_dd_istri;
   }
   public String getTgl_lhr_string_dd_istri()
   {
     return tgl_lhr_string_dd_istri;
   }
   public void setTgl_lhr_string_mm_istri(String tgl_lhr_string_mm_istri)
   {
     this.tgl_lhr_string_mm_istri = tgl_lhr_string_mm_istri;
   }
   public String getTgl_lhr_string_mm_istri()
   {
     return tgl_lhr_string_mm_istri;
   }
   public void setTgl_lhr_string_yy_istri(String tgl_lhr_string_yy_istri)
   {
     this.tgl_lhr_string_yy_istri = tgl_lhr_string_yy_istri;
   }
   public String getTgl_lhr_string_yy_istri()
   {
     return tgl_lhr_string_yy_istri;
   }
   public void setAgama_istri(String agama_istri)
   {
     this.agama_istri = agama_istri;
   }
   public String getAgama_istri()
   {
     return agama_istri;
   }
   public void setAlamat_istri(String alamat_istri)
   {
     this.alamat_istri = alamat_istri;
   }
   public String getAlamat_istri()
   {
     return alamat_istri;
   }
   public void setRt_istri(String rt_istri)
   {
     this.rt_istri = rt_istri;
   }
   public String getRt_istri()
   {
     return rt_istri;
   }
   public void setRw_istri(String rw_istri)
   {
     this.rw_istri = rw_istri;
   }
   public String getRw_istri()
   {
     return rw_istri;
   }
   public void setPropnama_istri(String propnama_istri)
   {
     this.propnama_istri = propnama_istri;
   }
   public String getPropnama_istri()
   {
     return propnama_istri;
   }
   //,,kelnama_istri,nama_ayah_suami,umur_ayah_suami,pekerjaan_ayah_suami
   public void setKabnama_istri(String kabnama_istri)
   {
     this.kabnama_istri = kabnama_istri;
   }
   public String getKabnama_istri()
   {
     return kabnama_istri;
   }
   public void setKecnama_istri(String kecnama_istri)
   {
     this.kecnama_istri = kecnama_istri;
   }
   public String getKecnama_istri()
   {
     return kecnama_istri;
   }
   public void setKelnama_istri(String kelnama_istri)
   {
     this.kelnama_istri = kelnama_istri;
   }
   public String getKelnama_istri()
   {
     return kelnama_istri;
   }

 public void setNama_ayah_suami(String nama_ayah_suami)
 {
   this.nama_ayah_suami=nama_ayah_suami;
 }
 public String getNama_ayah_suami()
 {
   return nama_ayah_suami;
 }
 public void setUmur_ayah_suami(String umur_ayah_suami)
 {
   this.umur_ayah_suami=umur_ayah_suami;
 }
 public String getUmur_ayah_suami()
 {
   return umur_ayah_suami;
 }
 public void setPekerjaan_ayah_suami(String pekerjaan_ayah_suami)
 {
   this.pekerjaan_ayah_suami=pekerjaan_ayah_suami;
 }
 public String getPekerjaan_ayah_suami()
 {
   return pekerjaan_ayah_suami;
 }
 public void setAlamat_ayah(String alamat_ayah)
 {
   this.alamat_ayah = alamat_ayah;
 }
 public String getAlamat_ayah()
 {
   return alamat_ayah;
 }
 public void setRt_ayah_suami(String rt_ayah_suami)
 {
   this.rt_ayah_suami = rt_ayah_suami;
 }
 public String getRt_ayah_suami()
 {
   return rt_ayah_suami;
 }
 public void setRw_ayah_suami(String rw_ayah_suami)
 {
   this.rw_ayah_suami = rw_ayah_suami;
 }
 public String getRw_ayah_suami()
 {
   return rw_ayah_suami;
 }

 public void setKel_ayah_suami(String kel_ayah_suami)
 {
   this.kel_ayah_suami = kel_ayah_suami;
 }
 public String getKel_ayah_suami()
 {
   return kel_ayah_suami;
 }
 public void setKec_ayah_suami(String kec_ayah_suami)
 {
   this.kec_ayah_suami = kec_ayah_suami;
 }
 public String getKec_ayah_suami()
 {
   return kec_ayah_suami;
 }
 public void setKab_ayah_suami(String kab_ayah_suami)
 {
   this.kab_ayah_suami = kab_ayah_suami;
 }
 public String getKab_ayah_suami()
 {
   return kab_ayah_suami;
 }
 public void setProp_ayah_suami(String prop_ayah_suami)
 {
   this.prop_ayah_suami = prop_ayah_suami;
 }
 public String getProp_ayah_suami()
 {
   return prop_ayah_suami;
 }

 public void setNama_ibu_suami(String nama_ibu_suami)
 {
   this.nama_ibu_suami =nama_ibu_suami;
 }
 public String getNama_ibu_suami()
 {
   return nama_ibu_suami;
 }
 public void setUmur_ibu_suami(String umur_ibu_suami)
 {
   this.umur_ibu_suami =umur_ibu_suami;
 }
 public String getUmur_ibu_suami()
 {
   return umur_ibu_suami;
 }
 public void setPekerjaan_ibu_suami(String pekerjaan_ibu_suami)
 {
   this.pekerjaan_ibu_suami =pekerjaan_ibu_suami;
 }
 public String getPekerjaan_ibu_suami()
 {
   return pekerjaan_ibu_suami;
 }
 public void setAlamat_ibu_suami(String alamat_ibu_suami)
 {
   this.alamat_ibu_suami = alamat_ibu_suami;
 }
 public String getAlamat_ibu_suami()
 {
   return alamat_ibu_suami;
 }
 public void setRt_ibu_suami(String rt_ibu_suami)
 {
   this.rt_ibu_suami = rt_ibu_suami;
 }
 public String getRt_ibu_suami()
 {
   return rt_ibu_suami;
 }
 public void setRw_ibu_suami(String rw_ibu_suami)
 {
   this.rw_ibu_suami = rw_ibu_suami;
 }
 public String getRw_ibu_suami()
 {
   return rw_ibu_suami;
 }

 public void setKel_ibu_suami(String kel_ibu_suami)
 {
   this.kel_ibu_suami = kel_ibu_suami;
 }
 public String getKel_ibu_suami()
 {
   return kel_ibu_suami;
 }
 public void setKec_ibu_suami(String kec_ibu_sami)
 {
   this.kec_ibu_sami = kec_ibu_sami;
 }
 public String getKec_ibu_suami()
 {
   return kec_ibu_sami;
 }
 public void setKab_ibu_suami(String kab_ibu_suami)
 {
   this.kab_ibu_suami = kab_ibu_suami;
 }
 public String getKab_ibu_suami()
 {
   return kab_ibu_suami;
 }
 public void setProp_ibu_suami(String prop_ibu_suami)
 {
   this.prop_ibu_suami = prop_ibu_suami;
 }
 public String getProp_ibu_suami()
 {
   return prop_ibu_suami;
 }
 public void setNama_ayah_istri(String nama_ayah_istri)
 {
   this.nama_ayah_istri = nama_ayah_istri;
 }
 public String getNama_ayah_istri()
 {
   return nama_ayah_istri;
 }
 public void setUmur_ayah_istri(String umur_ayah_istri)
 {
   this.umur_ayah_istri = umur_ayah_istri;
 }
 public String getUmur_ayah_istri()
 {
   return umur_ayah_istri;
 }
 public void setPekerjaan_ayah_istri(String pekerjaan_ayah_istri)
 {
   this.pekerjaan_ayah_istri = pekerjaan_ayah_istri;
 }
 public String getPekerjaan_ayah_istri()
 {
   return pekerjaan_ayah_istri;
 }
 public void setAlamat_ayah_istri(String alamat_ayah_istri)
 {
   this.alamat_ayah_istri = alamat_ayah_istri;
 }
 public String getAlamat_ayah_istri()
 {
   return alamat_ayah_istri;
 }
 public void setRt_ayah_istri(String rt_ayah_istri)
 {
   this.rt_ayah_istri = rt_ayah_istri;
 }
 public String getRt_ayah_istri()
 {
   return rt_ayah_istri;
 }
 public void setRw_ayah_istri(String rw_ayah_istri)
 {
   this.rw_ayah_istri = rw_ayah_istri;
 }
 public String getRw_ayah_istri()
 {
   return rw_ayah_istri;
 }
public void setKel_ayah_istri(String kel_ayah_istri)
{
  this.kel_ayah_istri = kel_ayah_istri;
}
public String getKel_ayah_istri()
{
  return kel_ayah_istri;
}
public void setKec_ayah_istri(String kec_ayah_istri)
{
  this.kec_ayah_istri = kec_ayah_istri;
}
public String getKec_ayah_istri()
{
  return kec_ayah_istri;
}
public void setKab_ayah_istri(String kab_ayah_istri)
{
  this.kab_ayah_istri = kab_ayah_istri;
}
public String getKab_ayah_istri()
{
  return kab_ayah_istri;
}
public void setProp_ayah_istri(String prop_ayah_istri)
{
  this.prop_ayah_istri = prop_ayah_istri;
}
public String getProp_ayah_istri()
{
  return prop_ayah_istri;
}
public void setNama_ibu_istri(String nama_ibu_istri)
{
  this.nama_ibu_istri = nama_ibu_istri;
}
public String getNama_ibu_istri()
{
  return nama_ibu_istri;
}
public void setUmur_ibu_istri(String umur_ibu_istri)
{
  this.umur_ibu_istri = umur_ibu_istri;
}
public String getUmur_ibu_istri()
{
 return umur_ibu_istri;
}
  public void setPekerjaan_ibu_istri(String pekerjaan_ibu_istri)
  {
    this.pekerjaan_ibu_istri = pekerjaan_ibu_istri;
  }
  public String getPekerjaan_ibu_istri()
  {
    return pekerjaan_ibu_istri;
  }
  public void setAlamat_ibu_istri(String alamat_ibu_istri)
  {
    this.alamat_ibu_istri = alamat_ibu_istri;
  }
  public String getAlamat_ibu_istri()
  {
    return alamat_ibu_istri;
  }
  public void setRt_ibu_istri(String rt_ibu_istri)
  {
    this.rt_ibu_istri = rt_ibu_istri;
  }
  public String getRt_ibu_istri()
  {
    return rt_ibu_istri;
  }
  public void setRw_ibu_istri(String rw_ibu_istri)
  {
    this.rw_ibu_istri = rw_ibu_istri;
  }
  public String getRw_ibu_istri()
  {
    return rw_ibu_istri;
  }
  public void setKel_ibu_istri(String kel_ibu_istri)
  {
    this.kel_ibu_istri = kel_ibu_istri;
  }
  public String getKel_ibu_istri()
  {
    return kel_ibu_istri;
  }
  public void setKec_ibu_istri(String kec_ibu_istri)
  {
    this.kec_ibu_istri = kec_ibu_istri;
  }
  public String getKec_ibu_istri()
  {
    return kec_ibu_istri;
  }
  public void setKab_ibu_istri(String kab_ibu_istri)
  {
    this.kab_ibu_istri = kab_ibu_istri;
  }
  public String getKab_ibu_istri()
  {
    return kab_ibu_istri;
  }
  public void setProp_ibu_istri(String prop_ibu_istri)
  {
    this.prop_ibu_istri = prop_ibu_istri;
  }
  public String getProp_ibu_istri()
  {
    return prop_ibu_istri;
  }
  public void setNama_pmka(String nama_pmka)
  {
    this.nama_pmka = nama_pmka;
  }
  public String getNama_pmka()
  {
    return nama_pmka;
  }

  public void setKwnDate(String kwn_date)
  {
    this.KWN_DATE=kwn_date;
  }

  public String getKwnDate()
  {
    return KWN_DATE;

  }

 public void setKwnMonth(String kwn_month)
{
       this.KWN_MONTH=kwn_month;
}

public String getKwnMonth()
{
return KWN_MONTH;
}

  public void setKwnYear(String kwn_year)
  {
       this.KWN_YEAR=kwn_year;
  }

  public String getKwnYear()
  {
return KWN_YEAR;
  }

 public void setAlamat_pmka(String alamat_pmka)
 {
   this.alamat_pmka = alamat_pmka;
 }
 public String getAlamat_pmka()
 {
   return alamat_pmka;
 }
 public void setRt_pmka(String rt_pmka)
 {
   this.rt_pmka = rt_pmka;
 }
 public String getRt_pmka()
 {
   return rt_pmka;
 }
 public void setRw_pmka(String rw_pmka)
 {
   this.rw_pmka = rw_pmka;
 }
 public String getRw_pmka()
 {
   return rw_pmka;
 }
 public void setProp_pmka(String prop_pmka)
 {
   this.prop_pmka = prop_pmka;
 }
 public String getProp_pmka()
 {
   return prop_pmka;
 }
 public void setKab_pmka(String kab_pmka)
 {
   this.kab_pmka = kab_pmka;
 }
 public String getKab_pmka()
 {
   return kab_pmka;
 }
 public void setKec_pmka(String kec_pmka)
 {
   this.kec_pmka = kec_pmka;
 }
 public String getKec_pmka()
 {
   return kec_pmka;
 }
 public void setKel_pmka(String kel_pmka)
 {
   this.kel_pmka = kel_pmka;
 }
 public String getKel_pmka()
 {
   return kel_pmka;
 }

 public void setNama_saksi1(String nama_saksi1)
 {
   this.nama_saksi1 = nama_saksi1;
 }
 public String getNama_saksi1()
 {
   return nama_saksi1;
 }
  public void setUmur_saksi1(String umur_saksi1)
  {
    this.umur_saksi1 = umur_saksi1;
  }
  public String getUmur_saksi1()
  {
    return umur_saksi1;
  }
  public void setPekerjaan_saksi1(String pekerjaan_saksi1)
  {
    this.pekerjaan_saksi1 = pekerjaan_saksi1;
  }
  public String getPekerjaan_saksi1()
  {
    return pekerjaan_saksi1;
  }
  public void setAlamat_saksi1(String alamat_saksi1)
  {
    this.alamat_saksi1 = alamat_saksi1;
  }
  public String getAlamat_saksi1()
  {
    return alamat_saksi1;
  }
 public void setRt_saksi1(String rt_saksi1)
 {
   this.rt_saksi1 = rt_saksi1;
 }
 public String getRt_saksi1()
 {
   return rt_saksi1;
 }
 public void setRw_saksi1(String rw_saksi1)
 {
   this.rw_saksi1 = rw_saksi1;
 }
 public String getRw_saksi1()
 {
   return rw_saksi1;
 }
 public void setKel_saksi1(String kel_saksi1)
 {
   this.kel_saksi1 = kel_saksi1;
 }
 public String getKel_saksi1()
 {
   return kel_saksi1;
 }
 public void setKec_saksi1(String kec_saksi1)
 {
   this.kec_saksi1 = kec_saksi1;
 }
 public String getKec_saksi1()
 {
   return kec_saksi1;
 }
 public void setKab_saksi1(String kab_saksi1)
 {
   this.kab_saksi1 = kab_saksi1;
 }
 public String getKab_saksi1()
 {
   return kab_saksi1;
 }
  public void setProp_saksi1(String prop_saksi1)
  {
    this.prop_saksi1 = prop_saksi1;
  }
  public String getProp_saksi1()
  {
    return prop_saksi1;
  }
 public void setNama_saksi2(String nama_saksi2)
 {
   this.nama_saksi2 = nama_saksi2;
 }
 public String getNama_saksi2()
 {
   return nama_saksi2;
 }
  public void setUmur_saksi2(String umur_saksi2)
  {
    this.umur_saksi2 = umur_saksi2;
  }
  public String getUmur_saksi2()
  {
    return umur_saksi2;
  }
  public void setPekerjaan_saksi2(String pekerjaan_saksi2)
  {
    this.pekerjaan_saksi2 = pekerjaan_saksi2;
  }
  public String getPekerjaan_saksi2()
  {
    return pekerjaan_saksi2;
  }
  public void setAlamat_saksi2(String alamat_saksi2)
  {
    this.alamat_saksi2 = alamat_saksi2;
  }
  public String getAlamat_saksi2()
  {
    return alamat_saksi2;
  }
 public void setRt_saksi2(String rt_saksi2)
 {
   this.rt_saksi2 = rt_saksi2;
 }
 public String getRt_saksi2()
 {
   return rt_saksi2;
 }
 public void setRw_saksi2(String rw_saksi2)
 {
   this.rw_saksi2 = rw_saksi2;
 }
 public String getRw_saksi2()
 {
   return rw_saksi2;
 }
 public void setKel_saksi2(String kel_saksi2)
 {
   this.kel_saksi2 = kel_saksi2;
 }
 public String getKel_saksi2()
 {
   return kel_saksi2;
 }
 public void setKec_saksi2(String kec_saksi2)
 {
   this.kec_saksi2 = kec_saksi2;
 }
 public String getKec_saksi2()
 {
   return kec_saksi2;
 }
 public void setKab_saksi2(String kab_saksi2)
 {
   this.kab_saksi2 = kab_saksi2;
 }
 public String getKab_saksi2()
 {
   return kab_saksi2;
 }
  public void setProp_saksi2(String prop_saksi2)
  {
    this.prop_saksi2 = prop_saksi2;
  }
  public String getProp_saksi2()
  {
    return prop_saksi2;
  }
  public void setTgl_cetak_akta(String tgl_cetak_akta)
  {
    this.tgl_cetak_akta = tgl_cetak_akta;
  }
  public String getTgl_cetak_akta()
  {
    return tgl_cetak_akta;
  }

  public void setUmur_suami(String umur_suami)
  {
    this.umur_suami=umur_suami;
  }
  public String getUmur_suami()
  {
    return umur_suami;
  }
  public void setPekarjan_suami(String pekarjan_suami)
  {
    this.pekarjan_suami=pekarjan_suami;
  }
  public String getPekarjan_suami()
  {
    return pekarjan_suami;
  }
  public void setM_agama_ayah_suami(String m_agama_ayah_suami)
  {
    this.m_agama_ayah_suami = m_agama_ayah_suami;
  }
  public String getM_agama_ayah_suami()
  {
    return m_agama_ayah_suami;
  }
  public void setM_agama_ibu_suami(String m_agama_ibu_suami)
  {
    this.m_agama_ibu_suami = m_agama_ibu_suami;
  }
  public String getM_agama_ibu_suami()
  {
    return m_agama_ibu_suami;
  }
  public void setM_umur_istri(String m_umur_istri)
  {
    this.m_umur_istri = m_umur_istri;
  }
  public String getM_umur_istri()
  {
    return m_umur_istri;
  }
  public void setM_pekarjan_istri(String m_pekarjan_istri)
  {
    this.m_pekarjan_istri = m_pekarjan_istri;
  }
  public String getM_pekarjan_istri()
  {
    return m_pekarjan_istri;
  }
  public void setM_agama_ayah_istri(String m_agama_ayah_istri)
  {
    this.m_agama_ayah_istri = m_agama_ayah_istri;
  }
  public String getM_agama_ayah_istri()
  {
    return m_agama_ayah_istri;
  }
  public void setM_agama_ibu_istri(String m_agama_ibu_istri)
  {
    this.m_agama_ibu_istri = m_agama_ibu_istri;
  }
  public String getM_agama_ibu_istri()
  {
    return m_agama_ibu_istri;
  }

  public void setTiduk_agama(String tiduk_agama)
  {
    this.tiduk_agama = tiduk_agama;
  }
  public String getTiduk_agama()
  {
    return tiduk_agama;
  }
  public void setSebel_suami(String sebel_suami)
  {
    this.sebel_suami = sebel_suami;
  }
  public String getSebel_suami()
  {
    return sebel_suami;
  }
  public void setAgama_saksi1(String agama_saksi1)
  {
    this.agama_saksi1 = agama_saksi1;
  }
  public String getAgama_saksi1()
  {
    return agama_saksi1;
  }
  public void setAgama_saksi2(String agama_saksi2)
  {
    this.agama_saksi2 = agama_saksi2;
  }
  public String getAgama_saksi2()
  {
    return agama_saksi2;
  }

}