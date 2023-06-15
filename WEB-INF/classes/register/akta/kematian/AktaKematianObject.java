package register.akta.kematian;

import java.io.Serializable;

public class AktaKematianObject implements Serializable
{
  private String no_akta_mati_jenazah, nik_jenazah, dasar_hkm_mati, persyaratan_mti, kwrngrn_jenazah,
      hari_ini_day, hari_ini_dd, hari_ini_mm, hari_ini_yy, nama_pelpor, pekerjaan_pelpor
      , alamat_pelpor, rt_pelpor, umur_pelpor,
      rw_pelpor, kel_pelpor, kec_pelpor, kab_pelpor, prop_pelpor, tmpt_mati_jenazah,
      tgl_mti_day_jenazah, tgl_mti_string_dd_jenazah, tgl_mti_string_mm_jenazah,
      tgl_mti_string_yy_jenazah, pukul_mti_jenazah, nama_lgkp_jenazah, tmpt_lahir_jenazah,
      tgl_lhr_string_dd_jenazah, tgl_lhr_string_mm_jenazah, tgl_lhr_string_yy_jenazah,
      pekerjaan_jenazah, alamat_jenazah, rt_jenazah, rw_jenazah, kel_jenazah, kec_jenazah,
      kab_jenazah, prop_jenazah, anak_ke_jenazah, jenis_klmin_jenazah, nama_ayah, umur_ayah,
      pekerjaan_ayah, alamat_ayah, rt_ayah, rw_ayah, kel_ayah,
      kec_ayah, kab_ayah, prop_ayah, nama_ibu, umur_ibu,
      pekerjaan_ibu, alamat_ibu, rt_ibu, rw_ibu, kel_ibu, kec_ibu, kab_ibu, prop_ibu, nama_saksi1,
      umur_saksi1, pekerjaan_saksi1, alamat_saksi1,
      rt_saksi1, rw_saksi1, kel_saksi1, kec_saksi1, kab_saksi1, prop_saksi1, nama_saksi2,
      umur_saksi2, pekerjaan_saksi2, alamat_saksi2,
      rt_saksi2, rw_saksi2, kel_saksi2, kec_saksi2, kab_saksi2, prop_saksi2, tgl_cetak_akta;

  public AktaKematianObject(String no_akta_mati_jenazah,String nik_jenazah,String dasar_hkm_mati,
                            String persyaratan_mti,String kwrngrn_jenazah,
      String hari_ini_day,String hari_ini_dd,String hari_ini_mm,String hari_ini_yy,String nama_pelpor
      ,String umur_pelpor,String pekerjaan_pelpor,
      String alamat_pelpor,String rt_pelpor,
      String rw_pelpor,String kel_pelpor,String kec_pelpor,String kab_pelpor,String prop_pelpor,
      String tmpt_mati_jenazah,
      String tgl_mti_day_jenazah,String tgl_mti_string_dd_jenazah,String tgl_mti_string_mm_jenazah,
      String tgl_mti_string_yy_jenazah,String pukul_mti_jenazah,String nama_lgkp_jenazah,
      String tmpt_lahir_jenazah,
      String tgl_lhr_string_dd_jenazah,String tgl_lhr_string_mm_jenazah,String tgl_lhr_string_yy_jenazah,
      String pekerjaan_jenazah,String alamat_jenazah,String rt_jenazah,String rw_jenazah,
      String kel_jenazah,String kec_jenazah,
      String kab_jenazah,String prop_jenazah,String anak_ke_jenazah,String jenis_klmin_jenazah,
      String nama_ayah,String umur_ayah,String pekerjaan_ayah,String alamat_ayah,
      String rt_ayah,String rw_ayah,String kel_ayah,
      String kec_ayah,String kab_ayah,String prop_ayah,String nama_ibu,String umur_ibu,
      String pekerjaan_ibu,String alamat_ibu,String rt_ibu,String rw_ibu,String kel_ibu,String kec_ibu,
      String kab_ibu,String prop_ibu,String nama_saksi1,
      String umur_saksi1, String pekerjaan_saksi1,String alamat_saksi1,
      String rt_saksi1,String rw_saksi1,String kel_saksi1,String kec_saksi1,String kab_saksi1,
      String prop_saksi1,String nama_saksi2,
      String umur_saksi2,String pekerjaan_saksi2,String alamat_saksi2,
      String rt_saksi2,String rw_saksi2,String kel_saksi2,String kec_saksi2,String kab_saksi2,String prop_saksi2,String tgl_cetak_akta)
  {
    this.no_akta_mati_jenazah = (no_akta_mati_jenazah==null)? "-": no_akta_mati_jenazah;
    this.nik_jenazah = (nik_jenazah==null)? "-": nik_jenazah;
    this.dasar_hkm_mati = (dasar_hkm_mati==null)? "-": dasar_hkm_mati;
    this.persyaratan_mti = (persyaratan_mti==null)? "0": persyaratan_mti;
    this.kwrngrn_jenazah = (kwrngrn_jenazah==null)? "-": kwrngrn_jenazah;
    this.hari_ini_day  = (hari_ini_day==null)? "-": hari_ini_day;
    this.hari_ini_dd = (hari_ini_dd==null)? "-": hari_ini_dd;
    this.hari_ini_mm = (hari_ini_mm==null)? "-": hari_ini_mm;
    this.hari_ini_yy = (hari_ini_yy==null)? "-": hari_ini_yy;
    this.nama_pelpor = (nama_pelpor==null)? "-": nama_pelpor;
    this.umur_pelpor = (umur_pelpor==null)? "-": umur_pelpor;
    this.pekerjaan_pelpor = (pekerjaan_pelpor==null)? "-": pekerjaan_pelpor;
    this.alamat_pelpor = (alamat_pelpor==null)? "-": alamat_pelpor;
    this.rt_pelpor = (rt_pelpor==null)? "-": rt_pelpor;
    this.rw_pelpor = (rw_pelpor==null)? "-": rw_pelpor;
    this.kel_pelpor = (kel_pelpor==null)? "-": kel_pelpor;
    this.kec_pelpor = (kec_pelpor==null)? "-": kec_pelpor;
    this.kab_pelpor = (kab_pelpor==null)? "-": kab_pelpor;
    this.prop_pelpor = (prop_pelpor==null)? "-": prop_pelpor;
    this.tmpt_mati_jenazah = (tmpt_mati_jenazah==null)? "-": tmpt_mati_jenazah;
    this.tgl_mti_day_jenazah =(tgl_mti_day_jenazah==null)? "-": tgl_mti_day_jenazah;
    this.tgl_mti_string_dd_jenazah = (tgl_mti_string_dd_jenazah==null)? "-": tgl_mti_string_dd_jenazah;
    this.tgl_mti_string_mm_jenazah = (tgl_mti_string_mm_jenazah==null)? "-": tgl_mti_string_mm_jenazah;
    this.tgl_mti_string_yy_jenazah = (tgl_mti_string_yy_jenazah==null)? "-": tgl_mti_string_yy_jenazah;
    this.pukul_mti_jenazah = (pukul_mti_jenazah==null)? "-": pukul_mti_jenazah;
    this.nama_lgkp_jenazah = (nama_lgkp_jenazah==null)? "-": nama_lgkp_jenazah;
    this.tmpt_lahir_jenazah = (tmpt_lahir_jenazah==null)? "-": tmpt_lahir_jenazah;
    this.tgl_lhr_string_dd_jenazah = (tgl_lhr_string_dd_jenazah==null)? "-": tgl_lhr_string_dd_jenazah;
    this.tgl_lhr_string_mm_jenazah = (tgl_lhr_string_mm_jenazah==null)? "-": tgl_lhr_string_mm_jenazah;
    this.tgl_lhr_string_yy_jenazah = (tgl_lhr_string_yy_jenazah==null)? "-": tgl_lhr_string_yy_jenazah;
    this.pekerjaan_jenazah = (pekerjaan_jenazah==null)? "-": pekerjaan_jenazah;
    this.alamat_jenazah = (alamat_jenazah==null)? "-": alamat_jenazah;
    this.rt_jenazah = (rt_jenazah==null)? "-": rt_jenazah;
    this.rw_jenazah = (rw_jenazah==null)? "-": rw_jenazah;
    this.kel_jenazah = (kel_jenazah==null)? "-": kel_jenazah;
    this.kec_jenazah = (kec_jenazah==null)? "-": kec_jenazah;
    this.kab_jenazah = (kab_jenazah==null)? "-": kab_jenazah;
    this.prop_jenazah = (prop_jenazah==null)? "-": prop_jenazah;
    this.anak_ke_jenazah = (anak_ke_jenazah==null)? "-": anak_ke_jenazah;
    this.jenis_klmin_jenazah = (jenis_klmin_jenazah==null)? "-": jenis_klmin_jenazah;

    this.nama_ayah = (nama_ayah==null)? "-": nama_ayah;
    this.umur_ayah = (umur_ayah==null)? "-": umur_ayah;
    this.pekerjaan_ayah = (pekerjaan_ayah==null)? "-": pekerjaan_ayah;
    this.alamat_ayah = (alamat_ayah==null)? "-": alamat_ayah;
    this.rt_ayah = (rt_ayah==null)? "-": rt_ayah;
    this.rw_ayah = (rw_ayah==null)? "-": rw_ayah;
    this.kel_ayah = (kel_ayah==null)? "-": kel_ayah;
    this.kec_ayah = (kec_ayah==null)? "-": kec_ayah;
    this.kab_ayah = (kab_ayah==null)? "-": kab_ayah;
    this.prop_ayah = (prop_ayah==null)? "-": prop_ayah;

    this.nama_ibu = (nama_ibu==null)? "-": nama_ibu;
    this.umur_ibu = (umur_ibu==null)? "-": umur_ibu;
    this.pekerjaan_ibu = (pekerjaan_ibu==null)? "-": pekerjaan_ibu;
    this.alamat_ibu = (alamat_ibu==null)? "-": alamat_ibu;
    this.rt_ibu = (rt_ibu==null)? "-": rt_ibu;
    this.rw_ibu = (rw_ibu==null)? "-": rw_ibu;
    this.kel_ibu = (kel_ibu==null)? "-": kel_ibu;
    this.kec_ibu = (kec_ibu==null)? "-": kec_ibu;
    this.kab_ibu = (kab_ibu==null)? "-": kab_ibu;
    this.prop_ibu = (prop_ibu==null)? "-": prop_ibu;

    this.nama_saksi1 = (nama_saksi1==null)? "-": nama_saksi1;
    this.umur_saksi1 = (umur_saksi1==null)? "-": umur_saksi1;
    this.pekerjaan_saksi1 = (pekerjaan_saksi1==null)? "-": pekerjaan_saksi1;
    this.alamat_saksi1 = (alamat_saksi1==null)? "-": alamat_saksi1;
    this.rt_saksi1 = (rt_saksi1==null)? "-": rt_saksi1;
    this.rw_saksi1 = (rw_saksi1==null)? "-": rw_saksi1;
    this.kel_saksi1 = (kel_saksi1==null)? "-": kel_saksi1;
    this.kec_saksi1 = (kec_saksi1==null)? "-": kec_saksi1;
    this.kab_saksi1 = (kab_saksi1==null)? "-": kab_saksi1;
    this.prop_saksi1 = (prop_saksi1==null)? "-": prop_saksi1;

    this.nama_saksi2 = (nama_saksi2==null)? "-": nama_saksi2;
    this.umur_saksi2 = (umur_saksi2==null)? "-": umur_saksi2;
    this.pekerjaan_saksi2 = (pekerjaan_saksi2==null)? "-": pekerjaan_saksi2;
    this.alamat_saksi2 = (alamat_saksi2==null)? "-": alamat_saksi2;
    this.rt_saksi2 = (rt_saksi2==null)? "-": rt_saksi2;
    this.rw_saksi2 = (rw_saksi2==null)? "-": rw_saksi2;
    this.kel_saksi2 = (kel_saksi2==null)? "-": kel_saksi2;
    this.kec_saksi2 = (kec_saksi2==null)? "-": kec_saksi2;
    this.kab_saksi2 = (kab_saksi2==null)? "-": kab_saksi2;
    this.prop_saksi2 = (prop_saksi2==null)? "-": prop_saksi2;

    this.tgl_cetak_akta = tgl_cetak_akta;
  }

  public void setUmur_pelpor(String umur_pelpor)
  {
    this.umur_pelpor = umur_pelpor;
  }
  public String getUmur_pelpor()
  {
    return umur_pelpor;
  }
  public void setUmur_ayah(String umur_ayah)
  {
    this.umur_ayah = umur_ayah;
  }
  public String getUmur_ayah()
  {
    return umur_ayah;
  }
  public void setUmur_ibu(String umur_ibu)
  {
    this.umur_ibu = umur_ibu;
  }
  public String getUmur_ibu()
  {
    return umur_ibu;
  }
  public void setUmur_saksi1(String umur_saksi1)
  {
    this.umur_saksi1 = umur_saksi1;
  }
  public String getUmur_saksi1()
  {
    return umur_saksi1;
  }
  public void setUmur_saksi2(String umur_saksi2)
  {
    this.umur_saksi2 = umur_saksi2;
  }
  public String getUmur_saksi2()
  {
    return umur_saksi2;
  }

  public void setTgl_cetak_akta(String tgl_cetak_akta)
  {
    this.tgl_cetak_akta = tgl_cetak_akta;
  }
  public String getTgl_cetak_akta()
  {
    return tgl_cetak_akta;
  }
  public void setNo_akta_mati_jenazah(String no_akta_mati_jenazah)
  {
    this.no_akta_mati_jenazah = no_akta_mati_jenazah;
  }
  public String getNo_akta_mati_jenazah()
  {
    return no_akta_mati_jenazah;
  }
  public void setNik_jenazah(String nik_jenazah)
  {
    this.nik_jenazah = nik_jenazah;
  }
  public String getNik_jenazah()
  {
    return nik_jenazah;
  }
  public void setDasar_hkm_mati(String dasar_hkm_mati)
  {
    this.dasar_hkm_mati = dasar_hkm_mati;
  }
  public String getDasar_hkm_mati()
  {
    return dasar_hkm_mati;
  }
  public void setPersyaratan_mti(String persyaratan_mti)
  {
    this.persyaratan_mti = persyaratan_mti;
  }
  public String getPersyaratan_mti()
  {
    return persyaratan_mti;
  }
  public void setKwrngrn_jenazah(String kwrngrn_jenazah)
  {
    this.kwrngrn_jenazah = kwrngrn_jenazah;
  }
  public String getKwrngrn_jenazah()
  {
    return kwrngrn_jenazah;
  }
  public void setHari_ini_day(String hari_ini_day)
  {
    this.hari_ini_day = hari_ini_day;
  }
  public String getHari_ini_day()
  {
    return hari_ini_day;
  }
  public void setHari_ini_dd(String hari_ini_dd)
  {
    this.hari_ini_dd = hari_ini_dd;
  }
  public String getHari_ini_dd()
  {
    return hari_ini_dd;
  }
  public void setHari_ini_mm(String hari_ini_mm)
  {
    this.hari_ini_mm= hari_ini_mm;
  }
  public String getHari_ini_mm()
  {
    return hari_ini_mm;
  }
  public void setHari_ini_yy(String hari_ini_yy)
  {
    this.hari_ini_yy = hari_ini_yy;
  }
  public String getHari_ini_yy()
  {
    return hari_ini_yy;
  }
  public void setNama_pelpor(String nama_pelpor)
  {
    this.nama_pelpor = nama_pelpor;
  }
  public String getNama_pelpor()
  {
    return nama_pelpor;
  }

  public void setPekerjaan_pelpor(String pekerjaan_pelpor)
  {
    this.pekerjaan_pelpor = pekerjaan_pelpor;
  }
  public String getPekerjaan_pelpor()
  {
    return pekerjaan_pelpor;
  }
  public void setAlamat_pelpor(String alamat_pelpor)
  {
    this.alamat_pelpor = alamat_pelpor;
  }
  public String getAlamat_pelpor()
  {
    return alamat_pelpor;
  }
  public void setRt_pelpor(String rt_pelpor)
  {
    this.rt_pelpor = rt_pelpor;
  }
  public String getRt_pelpor()
  {
    return rt_pelpor;
  }
  public void setRw_pelpor(String rw_pelpor)
  {
    this.rw_pelpor = rw_pelpor;
  }
  public String getRw_pelpor()
  {
    return rw_pelpor;
  }
  public void setKel_pelpor(String kel_pelpor)
  {
    this.kel_pelpor = kel_pelpor;
  }
  public String getKel_pelpor()
  {
    return kel_pelpor;
  }
  public void setKec_pelpor(String kec_pelpor)
  {
    this.kec_pelpor = kec_pelpor;
  }
  public String getKec_pelpor()
  {
    return kec_pelpor;
  }
  public void setKab_pelpor(String kab_pelpor)
  {
    this.kab_pelpor = kab_pelpor;
  }
  public String getKab_pelpor()
  {
    return kab_pelpor;
  }
  public void setProp_pelpor(String prop_pelpor)
  {
    this.prop_pelpor = prop_pelpor;
  }
  public String getProp_pelpor()
  {
    return prop_pelpor;
  }
  public void setTmpt_mati_jenazah(String tmpt_mati_jenazah)
  {
    this.tmpt_mati_jenazah = tmpt_mati_jenazah;
  }
  public String getTmpt_mati_jenazah()
  {
    return tmpt_mati_jenazah;
  }
  public void setTgl_mti_day_jenazah(String tgl_mti_day_jenazah)
  {
    this.tgl_mti_day_jenazah = tgl_mti_day_jenazah;
  }
  public String getTgl_mti_day_jenazah()
  {
    return tgl_mti_day_jenazah;
  }
  public void setTgl_mti_string_dd_jenazah(String tgl_mti_string_dd_jenazah)
  {
    this.tgl_mti_string_dd_jenazah = tgl_mti_string_dd_jenazah;
  }
  public String getTgl_mti_string_dd_jenazah()
  {
    return tgl_mti_string_dd_jenazah;
  }
  public void setTgl_mti_string_mm_jenazah(String tgl_mti_string_mm_jenazah)
  {
    this.tgl_mti_string_mm_jenazah = tgl_mti_string_mm_jenazah;
  }
  public String getTgl_mti_string_mm_jenazah()
  {
    return tgl_mti_string_mm_jenazah;
  }
  public void setTgl_mti_string_yy_jenazah(String tgl_mti_string_yy_jenazah)
  {
    this.tgl_mti_string_yy_jenazah = tgl_mti_string_yy_jenazah;
  }
  public String getTgl_mti_string_yy_jenazah()
  {
    return tgl_mti_string_yy_jenazah;
  }
  public void setPukul_mti_jenazah(String pukul_mti_jenazah)
  {
    this.pukul_mti_jenazah = pukul_mti_jenazah;
  }
  public String getPukul_mti_jenazah()
  {
    return pukul_mti_jenazah;
  }
  public void setNama_lgkp_jenazah(String nama_lgkp_jenazah)
  {
    this.nama_lgkp_jenazah = nama_lgkp_jenazah;
  }
  public String getNama_lgkp_jenazah()
  {
    return nama_lgkp_jenazah;
  }
  public void setTmpt_lahir_jenazah(String tmpt_lahir_jenazah)
  {
    this.tmpt_lahir_jenazah = tmpt_lahir_jenazah;
  }
  public String getTmpt_lahir_jenazah()
  {
    return tmpt_lahir_jenazah;
  }
  public void setTgl_lhr_string_dd_jenazah(String tgl_lhr_string_dd_jenazah)
  {
    this.tgl_lhr_string_dd_jenazah = tgl_lhr_string_dd_jenazah;
  }
  public String getTgl_lhr_string_dd_jenazah()
  {
    return tgl_lhr_string_dd_jenazah;
  }
  public void setTgl_lhr_string_mm_jenazah(String tgl_lhr_string_mm_jenazah)
  {
    this.tgl_lhr_string_mm_jenazah = tgl_lhr_string_mm_jenazah;
  }
  public String getTgl_lhr_string_mm_jenazah()
  {
    return tgl_lhr_string_mm_jenazah;
  }
  public void setTgl_lhr_string_yy_jenazah(String tgl_lhr_string_yy_jenazah)
  {
    this.tgl_lhr_string_yy_jenazah = tgl_lhr_string_yy_jenazah;
  }
  public String getTgl_lhr_string_yy_jenazah()
  {
    return tgl_lhr_string_yy_jenazah;
  }
  public void setPekerjaan_jenazah(String pekerjaan_jenazah)
  {
    this.pekerjaan_jenazah = pekerjaan_jenazah;
  }
  public String getPekerjaan_jenazah()
  {
    return pekerjaan_jenazah;
  }
  public void setAlamat_jenazah(String alamat_jenazah)
  {
    this.alamat_jenazah = alamat_jenazah;
  }
  public String getAlamat_jenazah()
  {
    return alamat_jenazah;
  }
  public void setRt_jenazah(String rt_jenazah)
  {
    this.rt_jenazah = rt_jenazah;
  }
  public String getRt_jenazah()
  {
    return rt_jenazah;
  }
  public void setRw_jenazah(String rw_jenazah)
  {
    this.rw_jenazah = rw_jenazah;
  }
  public String getRw_jenazah()
  {
    return rw_jenazah;
  }
  public void setKel_jenazah(String kel_jenazah)
  {
    this.kel_jenazah = kel_jenazah;
  }
  public String getKel_jenazah()
  {
    return kel_jenazah;
  }
  public void setKec_jenazah(String kec_jenazah)
  {
    this.kec_jenazah = kec_jenazah;
  }
  public String getKec_jenazah()
  {
    return kec_jenazah;
  }
  public void setKab_jenazah(String kab_jenazah)
  {
    this.kab_jenazah = kab_jenazah;
  }
  public String getKab_jenazah()
  {
    return kab_jenazah;
  }
  public void setProp_jenazah(String prop_jenazah)
  {
    this.prop_jenazah = prop_jenazah;
  }
  public String getProp_jenazah()
  {
    return prop_jenazah;
  }
  public void setAnak_ke_jenazah(String anak_ke_jenazah)
  {
    this.anak_ke_jenazah = anak_ke_jenazah;
  }
  public String getAnak_ke_jenazah()
  {
    return anak_ke_jenazah;
  }
  public void setJenis_klmin_jenazah(String jenis_klmin_jenazah)
  {
    this.jenis_klmin_jenazah = jenis_klmin_jenazah;
  }
  public String getJenis_klmin_jenazah()
  {
    return jenis_klmin_jenazah;
  }

  public void setNama_ayah(String nama_ayah)
  {
    this.nama_ayah = nama_ayah;
  }
  public String getNama_ayah()
  {
    return nama_ayah;
  }
  public void setPekerjaan_ayah(String pekerjaan_ayah)
  {
    this.pekerjaan_ayah = pekerjaan_ayah;
  }
  public String getPekerjaan_ayah()
  {
    return pekerjaan_ayah;
  }
  public void setAlamat_ayah(String alamat_ayah)
  {
    this.alamat_ayah = alamat_ayah;
  }
  public String getAlamat_ayah()
  {
    return alamat_ayah;
  }
  public void setRt_ayah(String rt_ayah)
  {
    this.rt_ayah = rt_ayah;
  }
  public String getRt_ayah()
  {
    return rt_ayah;
  }
  public void setRw_ayah(String rw_ayah)
  {
    this.rw_ayah = rw_ayah;
  }
  public String getRw_ayah()
  {
    return rw_ayah;
  }
  public void setKel_ayah(String kel_ayah)
  {
    this.kel_ayah = kel_ayah;
  }
  public String getKel_ayah()
  {
    return kel_ayah;
  }
  public void setKec_ayah(String kec_ayah)
  {
    this.kec_ayah = kec_ayah;
  }
  public String getKec_ayah()
  {
    return kec_ayah;
  }
  public void setKab_ayah(String kab_ayah)
  {
    this.kab_ayah = kab_ayah;
  }
  public String getKab_ayah()
  {
    return kab_ayah;
  }
  public void setProp_ayah(String prop_ayah)
  {
    this.prop_ayah = prop_ayah;
  }
  public String getProp_ayah()
  {
    return prop_ayah;
  }

  public void setNama_ibu(String nama_ibu)
  {
    this.nama_ibu = nama_ibu;
  }
  public String getNama_ibu()
  {
    return nama_ibu;
  }
  public void setPekerjaan_ibu(String pekerjaan_ibu)
  {
    this.pekerjaan_ibu = pekerjaan_ibu;
  }
  public String getPekerjaan_ibu()
  {
    return pekerjaan_ibu;
  }
  public void setAlamat_ibu(String alamat_ibu)
  {
    this.alamat_ibu = alamat_ibu;
  }
  public String getAlamat_ibu()
  {
    return alamat_ibu;
  }
  public void setRt_ibu(String rt_ibu)
  {
    this.rt_ibu = rt_ibu;
  }
  public String getRt_ibu()
  {
    return rt_ibu;
  }
  public void setRw_ibu(String rw_ibu)
  {
    this.rw_ibu = rw_ibu;
  }
  public String getRw_ibu()
  {
    return rw_ibu;
  }
  public void setKel_ibu(String kel_ibu)
  {
    this.kel_ibu = kel_ibu;
  }
  public String getKel_ibu()
  {
    return kel_ibu;
  }
  public void setKec_ibu(String kec_ibu)
  {
    this.kec_ibu = kec_ibu;
  }
  public String getKec_ibu()
  {
    return kec_ibu;
  }
  public void setKab_ibu(String kab_ibu)
  {
    this.kab_ibu = kab_ibu;
  }
  public String getKab_ibu()
  {
    return kab_ibu;
  }
  public void setProp_ibu(String prop_ibu)
  {
    this.prop_ibu = prop_ibu;
  }
  public String getProp_ibu()
  {
    return prop_ibu;
  }

  public void setNama_saksi1(String nama_saksi1)
  {
    this.nama_saksi1 = nama_saksi1;
  }
  public String getNama_saksi1()
  {
    return nama_saksi1;
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

}