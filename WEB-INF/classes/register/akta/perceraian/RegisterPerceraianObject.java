package register.akta.perceraian;

public class RegisterPerceraianObject implements java.io.Serializable
{
  private String no_akta_crai, dasar_hkm_crai, ini_day, ini_date, current_month, current_year, current_time;
  private String nik_suami, wargn_suami, nama_lgkp_suami, tmpt_lahir_suami, umur_suami, jenis_pkrjn, agama_suami;
  private String alamat_suami, rt_suami, rw_suami, propnama_suami, kabnama_suami, kecnama_suami, kelnama_suami;
  private String nik_istri, wargn_istri, nama_lgkp_istri, tmpt_lahir_istri, umur_istri, jenis_pkrjn_istri;
  private String agama_istri, alamat_istri, rt_istri, rw_istri, propnama_istri, kabnama_istri, kecnama_istri;
  private String kelnama_istri, lbg_pngadil_kel_kep, tmpt_lbg_pngadil, tgl_srt_kep_dt, tgl_srt_kep_mm, tgl_srt_kep_yy;
  private String no_kep_pngadil, kawin_dt, kawin_month, kawin_year, tmpt_ctt_kwn, tgl_srt_ket_dt, tgl_srt_ket_mm;
  private String tgl_srt_ket_yy, no_srt_ket_pn, tgl_ctk_ktakta, no_prop, no_kab, nama_prop, nama_kab;
  private String nama_pelpor,umur_pelpor,pkrjn_perlpor,alamat_pelpor,rt_pelpor,rw_pelpor;
  private  String kel_pelpor,kec_pelpor,kab_pelpor,prop_pelpor;
  private String no_akta_kwn="";
  public RegisterPerceraianObject(String no_akta_crai,String no_akta_kwn,String dasar_hkm_crai,String ini_day,
                                  String ini_date,String current_month,String current_year,
                                  String current_time, String nik_suami,String wargn_suami,
                                  String nama_lgkp_suami,String tmpt_lahir_suami,
                                  String umur_suami,String jenis_pkrjn,String agama_suami,
                                  String alamat_suami,String rt_suami,String rw_suami,
                                  String propnama_suami,String kabnama_suami,
                                  String kecnama_suami,String kelnama_suami,
                                  String nik_istri,String wargn_istri,String nama_lgkp_istri,
                                  String tmpt_lahir_istri,String umur_istri,
                                  String jenis_pkrjn_istri, String agama_istri,String alamat_istri,
                                  String rt_istri,String rw_istri,String propnama_istri,
                                  String kabnama_istri,String kecnama_istri,
                                  String kelnama_istri,String lbg_pngadil_kel_kep,String tmpt_lbg_pngadil,
                                  String tgl_srt_kep_dt,String tgl_srt_kep_mm,String tgl_srt_kep_yy,
                                  String no_kep_pngadil,String kawin_dt,String kawin_month,
                                  String kawin_year,String tmpt_ctt_kwn,String tgl_srt_ket_dt,
                                  String tgl_srt_ket_mm, String tgl_srt_ket_yy,String no_srt_ket_pn,
                                  String tgl_ctk_ktakta,String no_prop,String no_kab,String nama_prop,
                                  String nama_kab,String nama_pelpor,String umur_pelpor,String pkrjn_perlpor,
                                  String alamat_pelpor,String rt_pelpor,String rw_pelpor,String kel_pelpor,
                                  String kec_pelpor,String kab_pelpor,String prop_pelpor)
  {

    this.no_akta_crai = (no_akta_crai==null)?"":no_akta_crai;
    this.no_akta_kwn=(no_akta_kwn==null)?"":no_akta_kwn;
    this.dasar_hkm_crai = (dasar_hkm_crai==null)?"":dasar_hkm_crai;
    this.ini_day = (ini_day==null)?"":ini_day;
    this.ini_date = (ini_date==null)?"":ini_date;
    this.current_month = (current_month==null)?"":current_month;
    this.current_year = (current_year==null)?"":current_year;
    this.current_time = (current_time==null)?"":current_time;
    this.nik_suami = (nik_suami==null)?"":nik_suami;
    this.wargn_suami = (wargn_suami==null)?"":wargn_suami;
    this.nama_lgkp_suami = (nama_lgkp_suami==null)?"":nama_lgkp_suami;
    this.tmpt_lahir_suami = (tmpt_lahir_suami==null)?"":tmpt_lahir_suami;
    this.umur_suami = (umur_suami==null)?"":umur_suami;
    this.jenis_pkrjn = (jenis_pkrjn==null)?"":jenis_pkrjn;
    this.agama_suami = (agama_suami==null)?"":agama_suami;

    this.alamat_suami = (alamat_suami==null)?"":alamat_suami;
    this.rt_suami = (rt_suami==null)?"":rt_suami;
    this.rw_suami = (rw_suami==null)?"":rw_suami;
    this.propnama_suami = (propnama_suami==null)?"":propnama_suami;
    this.kabnama_suami = (kabnama_suami==null)?"":kabnama_suami;
    this.kecnama_suami =(kecnama_suami==null)?"":kecnama_suami;
    this.kelnama_suami=(kelnama_suami==null)?"":kelnama_suami;
    this.nik_istri=(nik_istri==null)?"":nik_istri;
    this.wargn_istri=(wargn_istri==null)?"":wargn_istri;
    this.nama_lgkp_istri=(nama_lgkp_istri==null)?"":nama_lgkp_istri;
    this.tmpt_lahir_istri=(tmpt_lahir_istri==null)?"":tmpt_lahir_istri;

    this.umur_istri=(umur_istri==null)?"":umur_istri;
    this.jenis_pkrjn_istri=(jenis_pkrjn_istri==null)?"":jenis_pkrjn_istri;
    this.agama_istri=(agama_istri==null)?"":agama_istri;
    this.alamat_istri=(alamat_istri==null)?"":alamat_istri;
    this.rt_istri=(rt_istri==null)?"":rt_istri;
    this.rw_istri=(rw_istri==null)?"":rw_istri;
    this.propnama_istri=(propnama_istri==null)?"":propnama_istri;
    this.kabnama_istri=(kabnama_istri==null)?"":kabnama_istri;
    this.kecnama_istri=(kecnama_istri==null)?"":kecnama_istri;
    this.kelnama_istri=(kelnama_istri==null)?"":kelnama_istri;
    this.lbg_pngadil_kel_kep=(lbg_pngadil_kel_kep==null)?"":lbg_pngadil_kel_kep;
    this.tmpt_lbg_pngadil=(tmpt_lbg_pngadil==null)?"":tmpt_lbg_pngadil;
    this.tgl_srt_kep_dt=(tgl_srt_kep_dt==null)?"":tgl_srt_kep_dt;
    this.tgl_srt_kep_mm=(tgl_srt_kep_mm==null)?"":tgl_srt_kep_mm;
    this.tgl_srt_kep_yy=(tgl_srt_kep_yy==null)?"":tgl_srt_kep_yy;
    this.no_kep_pngadil=(no_kep_pngadil==null)?"":no_kep_pngadil;
    this.kawin_dt=(kawin_dt==null)?"":kawin_dt;
    this.kawin_month = (kawin_month==null)?"":kawin_month;
    this.kawin_year = (kawin_year==null)?"":kawin_year;
    this.tmpt_ctt_kwn = (tmpt_ctt_kwn==null)?"":tmpt_ctt_kwn;
    this.tgl_srt_ket_dt = (tgl_srt_ket_dt==null)?"":tgl_srt_ket_dt;
    this.tgl_srt_ket_mm = (tgl_srt_ket_mm==null)?"":tgl_srt_ket_mm;
    this.tgl_srt_ket_yy = (tgl_srt_ket_yy==null)?"":tgl_srt_ket_yy;
    this.no_srt_ket_pn = (no_srt_ket_pn==null)?"":no_srt_ket_pn;
    this.tgl_ctk_ktakta = (tgl_ctk_ktakta==null)?"":tgl_ctk_ktakta;
    this.no_prop = (no_prop==null)?"":no_prop;
    this.no_kab = (no_kab==null)?"":no_kab;
    this.nama_prop = (nama_prop==null)?"":nama_prop;
    this.nama_kab = (nama_kab==null)?"":nama_kab;
    this.nama_pelpor=(nama_pelpor==null)?"":nama_pelpor;
    this.umur_pelpor=(umur_pelpor==null)?"":umur_pelpor;
    this.pkrjn_perlpor=(pkrjn_perlpor==null)?"":pkrjn_perlpor;
    this.alamat_pelpor=(alamat_pelpor==null)?"":alamat_pelpor;
    this.rt_pelpor=(rt_pelpor==null)?"":rt_pelpor;
    this.rw_pelpor=(rw_pelpor==null)?"":rw_pelpor;
    this.kel_pelpor=(kel_pelpor==null)?"":kel_pelpor;
    this.kec_pelpor=(kec_pelpor==null)?"":kec_pelpor;
    this.kab_pelpor=(kab_pelpor==null)?"":kab_pelpor;
    this.prop_pelpor=(prop_pelpor==null)?"":prop_pelpor;
  }


public String getNoAktakwn()
  {
    return no_akta_kwn;
  }

  public void setNoAktaKwn()
  {
    this.no_akta_kwn=no_akta_kwn;
  }

public String getNamaPelapor()
  {

    return nama_pelpor;
  }

  public void setNamaPelapor(String nama_pelpor)
  {
    this.nama_pelpor=nama_pelpor;
  }

public String   getUmurPelapor()
  {
    return umur_pelpor;
  }

public void setUmurPelapor()
  {
    this.umur_pelpor=umur_pelpor;
  }

public String getPkrjn_pelpor()
  {
    return pkrjn_perlpor;
  }

public void setPkrjn_pelpor()
  {
     this.pkrjn_perlpor=pkrjn_perlpor;
  }

  public String getAlamat_pelpor()
    {
      return alamat_pelpor;
    }

  public void setAlamat_pelpor()
    {
       this.alamat_pelpor=alamat_pelpor;
    }

 public String getRt_pelpor()
      {
        return rt_pelpor;
      }

 public void setRt_pelpor()
      {
         this.rt_pelpor=rt_pelpor;
      }

      public String getRw_pelpor()
           {
             return rw_pelpor;
           }

      public void setRw_pelpor()
           {
              this.rw_pelpor=rw_pelpor;
           }


           public String getKel_pelpor()
                {
                  return kel_pelpor;
                }

           public void setKel_pelpor()
                {
                   this.kel_pelpor=kel_pelpor;
                }


                public String getKec_pelpor()
                     {
                       return kec_pelpor;
                     }

                public void setKec_pelpor()
                     {
                        this.kec_pelpor=kec_pelpor;
                     }

                     public String getKab_pelpor()
                          {
                            return kab_pelpor;
                          }

                     public void setKab_pelpor()
                          {
                             this.kab_pelpor=kab_pelpor;
                          }

                          public String getProp_pelpor()
                               {
                                 return prop_pelpor;
                               }

                          public void setProp_pelpor()
                               {
                                  this.prop_pelpor=prop_pelpor;
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
  public void setIni_day(String ini_day)
  {
    this.ini_day = ini_day;
  }
  public String getIni_day()
  {
    return ini_day;
  }
  public void setIni_date(String ini_date)
  {
    this.ini_date = ini_date;
  }
  public String getIni_date()
  {
    return ini_date;
  }
  public void setCurrent_month(String current_month)
  {
    this.current_month = current_month;
  }
  public String getCurrent_month()
  {
    return current_month;
  }
  public void setCurrent_year(String current_year)
  {
    this.current_year = current_year;
  }
  public String getCurrent_year()
  {
    return current_year;
  }
  public void setCurrent_time(String current_time)
  {
    this.current_time = current_time;
  }
  public String getCurrent_time()
  {
    return current_time;
  }

  public void setNik_suami(String nik_suami)
  {
    this.nik_suami = nik_suami;
  }
  public String getNik_suami()
  {
    return nik_suami;
  }
  public void setWargn_suami(String wargn_suami)
  {
    this.wargn_suami = wargn_suami;
  }
  public String getWargn_suami()
  {
    return wargn_suami;
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
  public void setUmur_suami(String umur_suami)
  {
    this.umur_suami =umur_suami;
  }
  public String getUmur_suami()
  {
    return umur_suami;
  }
  public void setJenis_pkrjn(String jenis_pkrjn)
  {
    this.jenis_pkrjn = jenis_pkrjn;
  }
  public String getJenis_pkrjn()
  {
    return jenis_pkrjn;
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
  public void setNik_istri(String nik_istri)
  {
    this.nik_istri = nik_istri;
  }
  public String getNik_istri()
  {
    return nik_istri;
  }
  public void setWargn_istri(String wargn_istri)
  {
    this.wargn_istri = wargn_istri;
  }
  public String getWargn_istri()
  {
    return wargn_istri;
  }
  public void setNama_lgkp_istri(String nama_lgkp_istri)
  {
    this.nama_lgkp_istri = nama_lgkp_istri;
  }
  public String getNama_lgkp_istri()
  {
    return nama_lgkp_istri;
  }
  public void setTmpt_lahir_istri(String tmpt_lahir_istri)
  {
    this.tmpt_lahir_istri = tmpt_lahir_istri;
  }
  public String getTmpt_lahir_istri()
  {
    return tmpt_lahir_istri;
  }
  public void setUmur_istri(String umur_istri)
  {
    this.umur_istri = umur_istri;
  }
  public String getUmur_istri()
  {
    return umur_istri;
  }
  public void setJenis_pkrjn_istri(String jenis_pkrjn_istri)
  {
    this.jenis_pkrjn_istri =jenis_pkrjn_istri;
  }
  public String getJenis_pkrjn_istri()
  {
    return jenis_pkrjn_istri;
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
  public void setLbg_pngadil_kel_kep(String lbg_pngadil_kel_kep)
  {
    this.lbg_pngadil_kel_kep = lbg_pngadil_kel_kep;
  }
  public String getLbg_pngadil_kel_kep()
  {
    return lbg_pngadil_kel_kep;
  }
  public void setTmpt_lbg_pngadil(String tmpt_lbg_pngadil)
  {
    this.tmpt_lbg_pngadil = tmpt_lbg_pngadil;
  }
  public String getTmpt_lbg_pngadil()
  {
    return tmpt_lbg_pngadil;
  }
  public void setTgl_srt_kep_dt(String tgl_srt_kep_dt)
  {
    this.tgl_srt_kep_dt= tgl_srt_kep_dt;
  }
  public String getTgl_srt_kep_dt()
  {
    return tgl_srt_kep_dt;
  }
  public void setTgl_srt_kep_mm(String tgl_srt_kep_mm)
  {
    this.tgl_srt_kep_mm = tgl_srt_kep_mm;
  }
  public String getTgl_srt_kep_mm()
  {
    return tgl_srt_kep_mm;
  }
  public void setTgl_srt_kep_yy(String tgl_srt_kep_yy)
  {
    this.tgl_srt_kep_yy= tgl_srt_kep_yy;
  }
  public String getTgl_srt_kep_yy()
  {
    return tgl_srt_kep_yy;
  }

  public void setNo_kep_pngadil(String no_kep_pngadil)
  {
    this.no_kep_pngadil = no_kep_pngadil;
  }
  public String getNo_kep_pngadil()
  {
    return no_kep_pngadil;
  }
  public void setKawin_dt(String kawin_dt)
  {
    this.kawin_dt = kawin_dt;
  }
  public String getKawin_dt()
  {
    return kawin_dt;
  }
  public void setKawin_month(String kawin_month)
  {
    this.kawin_month = kawin_month;
  }
  public String getKawin_month()
  {
    return kawin_month;
  }
  public void setKawin_year(String kawin_year)
  {
    this.kawin_year = kawin_year;
  }
  public String getKawin_year()
  {
    return kawin_year;
  }

  public void setTmpt_ctt_kwn(String tmpt_ctt_kwn)
  {
    this.tmpt_ctt_kwn = tmpt_ctt_kwn;
  }
  public String getTmpt_ctt_kwn()
  {
    return tmpt_ctt_kwn;
  }
  public void setTgl_srt_ket_dt(String tgl_srt_ket_dt)
  {
    this.tgl_srt_ket_dt = tgl_srt_ket_dt;
  }
  public String getTgl_srt_ket_dt()
  {
    return tgl_srt_ket_dt;
  }
  public void setTgl_srt_ket_mm(String tgl_srt_ket_mm)
  {
    this.tgl_srt_ket_mm = tgl_srt_ket_mm;
  }
  public String getTgl_srt_ket_mm()
  {
    return tgl_srt_ket_mm;
  }
  public void setTgl_srt_ket_yy(String tgl_srt_ket_yy)
  {
    this.tgl_srt_ket_yy = tgl_srt_ket_yy;
  }
  public String getTgl_srt_ket_yy()
  {
    return tgl_srt_ket_yy;
  }

  public void setNo_srt_ket_pn(String no_srt_ket_pn)
  {
    this.no_srt_ket_pn = no_srt_ket_pn;
  }
  public String getNo_srt_ket_pn()
  {
    return no_srt_ket_pn;
  }
  public void setTgl_ctk_ktakta(String tgl_ctk_ktakta)
  {
    this.tgl_ctk_ktakta = tgl_ctk_ktakta;
  }
  public String getTgl_ctk_ktakta()
  {
    return tgl_ctk_ktakta;
  }
  public void setNo_prop(String no_prop)
  {
    this.no_prop = no_prop;
  }
  public String getNo_prop()
  {
    return no_prop;
  }
  public void setNo_kab(String no_kab)
  {
    this.no_kab = no_kab;
  }
  public String getNo_kab()
  {
    return no_kab;
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
    this.nama_kab =  nama_kab;
  }
  public String getNama_kab()
  {
    return  nama_kab;
  }
}