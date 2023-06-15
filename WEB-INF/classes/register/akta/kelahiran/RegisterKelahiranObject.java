package register.akta.kelahiran;

import java.io.Serializable;

public class RegisterKelahiranObject implements Serializable
{
  private String no_akta_lahir_bayi, nik_bayi, dsrhk_cttlhr, persyaratan_bayi, hari_ini_day, hari_ini_dd,
      hari_ini_mm, hari_ini_yy, nama_pelpor, umur_pelpor,
      pekerjaan_pelpor, alamat_pelpor, rt_pelpor, rw_pelpor, kel_pelpor, kec_pelpor, kab_pelpor, prop_pelpor,
      tmpt_lahir_bayi, tgl_lhr_day_bayi, tgl_lhr_string_dd_bayi, tgl_lhr_string_mm_bayi,
      tgl_lhr_string_yy_bayi, pukul_lhr_bayi, nama_lgkp_bayi, anak_ke_lahir_bayi, jenis_kelamin_bayi,
      nama_ayah, umur_ayah, pekerjaan_ayah, alamat_ayah, rt_ayah,
      rw_ayah, kel_ayah, kec_ayah, kab_ayah, prop_ayah, nama_ibu, umur_ibu, pekerjaan_ibu, alamat_ibu,
      rt_ibu, rw_ibu, kel_ibu, kec_ibu, kab_ibu,
      prop_ibu, nama_saksi1, umur_saksi1, pekerjaan_saksi1,
      alamat_saksi1, rt_saksi1, rw_saksi1, kel_saksi1, kec_saksi1, kab_saksi1, prop_saksi1, nama_saksi2,
      umur_saksi2, pekerjaan_saksi2, alamat_saksi2, rt_saksi2,
      rw_saksi2, kel_saksi2, kec_saksi2, kab_saksi2, prop_saksi2, kwrngrn_bayi, tgl_cetak_akta;

  public RegisterKelahiranObject(String no_akta_lahir_bayi,String nik_bayi,String dsrhk_cttlhr,
                                 String persyaratan_bayi,String hari_ini_day,String hari_ini_dd,
      String hari_ini_mm,String hari_ini_yy,String nama_pelpor,String umur_pelpor, String pekerjaan_pelpor,String alamat_pelpor,
      String rt_pelpor,String rw_pelpor,String kel_pelpor,String kec_pelpor,String kab_pelpor,
      String prop_pelpor,String tmpt_lahir_bayi,String tgl_lhr_day_bayi,String tgl_lhr_string_dd_bayi,
      String tgl_lhr_string_mm_bayi,String tgl_lhr_string_yy_bayi,String pukul_lhr_bayi,String nama_lgkp_bayi,
      String anak_ke_lahir_bayi,String jenis_kelamin_bayi, String nama_ayah,String umur_ayah,
      String pekerjaan_ayah,String alamat_ayah,
      String rt_ayah,String rw_ayah,String kel_ayah,String kec_ayah,String kab_ayah,String prop_ayah,
      String nama_ibu,String umur_ibu,
      String pekerjaan_ibu,String alamat_ibu,String rt_ibu,String rw_ibu,String kel_ibu,String kec_ibu,
      String kab_ibu,String prop_ibu,String nama_saksi1,String umur_saksi1,String pekerjaan_saksi1,String alamat_saksi1,String rt_saksi1,
      String rw_saksi1,String kel_saksi1,String kec_saksi1,String kab_saksi1,String prop_saksi1,
      String nama_saksi2,String umur_saksi2,
      String pekerjaan_saksi2,String alamat_saksi2,String rt_saksi2,
      String rw_saksi2,String kel_saksi2,String kec_saksi2,String kab_saksi2, String prop_saksi2,
      String kwrngrn_bayi, String tgl_cetak_akta)
  {
    this.no_akta_lahir_bayi = no_akta_lahir_bayi;
    this.nik_bayi = nik_bayi;
    this.dsrhk_cttlhr = dsrhk_cttlhr;
    this.persyaratan_bayi = persyaratan_bayi;
    this.hari_ini_day = hari_ini_day;
    this.hari_ini_dd = hari_ini_dd;
    this.hari_ini_mm = hari_ini_mm;
    this.hari_ini_yy = hari_ini_yy;
    this.nama_pelpor = nama_pelpor;
    this.umur_pelpor = umur_pelpor;
    this.pekerjaan_pelpor = pekerjaan_pelpor;
    this.alamat_pelpor = alamat_pelpor;
    this.rt_pelpor = rt_pelpor;
    this.rw_pelpor = rw_pelpor;
    this.kel_pelpor = kel_pelpor;
    this.kec_pelpor = kec_pelpor;
    this.kab_pelpor = kab_pelpor;
    this.prop_pelpor = prop_pelpor;
    this.tmpt_lahir_bayi = tmpt_lahir_bayi;
    this.tgl_lhr_day_bayi = tgl_lhr_day_bayi;
    this.tgl_lhr_string_dd_bayi = tgl_lhr_string_dd_bayi;
    this.tgl_lhr_string_mm_bayi = tgl_lhr_string_mm_bayi;
    this.tgl_lhr_string_yy_bayi = tgl_lhr_string_yy_bayi;
    this.pukul_lhr_bayi = pukul_lhr_bayi;
    this.nama_lgkp_bayi = nama_lgkp_bayi;
    this.anak_ke_lahir_bayi = anak_ke_lahir_bayi;
    this.jenis_kelamin_bayi = jenis_kelamin_bayi;
    this.nama_ayah = nama_ayah;
    this.umur_ayah = umur_ayah;
    this.pekerjaan_ayah = pekerjaan_ayah;
    this.alamat_ayah = alamat_ayah;
    this.rt_ayah = rt_ayah;
    this.rw_ayah = rw_ayah;
    this.kel_ayah = kel_ayah;
    this.kab_ayah = kab_ayah;
    this.kec_ayah = kec_ayah;
    this.prop_ayah = prop_ayah;

    this.nama_ibu = nama_ibu;
    this.umur_ibu = umur_ibu;
    this.pekerjaan_ibu = pekerjaan_ibu;
    this.alamat_ibu = alamat_ibu;
    this.rt_ibu = rt_ibu;
    this.rw_ibu = rw_ibu;
    this.kel_ibu = kel_ibu;
    this.kab_ibu = kab_ibu;
    this.kec_ibu = kec_ibu;
    this.prop_ibu = prop_ibu;

    this.nama_saksi1 = nama_saksi1;
    this.umur_saksi1 = umur_saksi1;
    this.pekerjaan_saksi1 = pekerjaan_saksi1;
    this.alamat_saksi1 = alamat_saksi1;
    this.rt_saksi1 = rt_saksi1;
    this.rw_saksi1 = rw_saksi1;
    this.kel_saksi1 = kel_saksi1;
    this.kab_saksi1 = kab_saksi1;
    this.kec_saksi1 = kec_saksi1;
    this.prop_saksi1 = prop_saksi1;

    this.nama_saksi2 = nama_saksi2;
    this.umur_saksi2 = umur_saksi2;
    this.pekerjaan_saksi2 = pekerjaan_saksi2;
    this.alamat_saksi2 = alamat_saksi2;
    this.rt_saksi2 = rt_saksi2;
    this.rw_saksi2 = rw_saksi2;
    this.kel_saksi2 = kel_saksi2;
    this.kab_saksi2 = kab_saksi2;
    this.kec_saksi2 = kec_saksi2;
    this.prop_saksi2 = prop_saksi2;

    this.kwrngrn_bayi = kwrngrn_bayi;
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
  public void setKwrngrn_bayi(String kwrngrn_bayi)
  {
    this.kwrngrn_bayi = kwrngrn_bayi;
  }
  public String getKwrngrn_bayi()
  {
    return kwrngrn_bayi;
  }
  public void setNo_akta_lahir_bayi(String no_akta_lahir_bayi)
  {
    this.no_akta_lahir_bayi = no_akta_lahir_bayi;
  }
  public String getNo_akta_lahir_bayi()
  {
    return no_akta_lahir_bayi;
  }
  public void setNik_bayi(String nik_bayi)
  {
    this.nik_bayi = nik_bayi;
  }
  public String getNik_bayi()
  {
    return nik_bayi;
  }
  public void setDsrhk_cttlhr(String dsrhk_cttlhr)
  {
    this.dsrhk_cttlhr = dsrhk_cttlhr;
  }
  public String getDsrhk_cttlhr()
  {
    return dsrhk_cttlhr;
  }
  public void setPersyaratan_bayi(String persyaratan_bayi)
  {
    this.persyaratan_bayi = persyaratan_bayi;
  }
  public String getPersyaratan_bayi()
  {
    return persyaratan_bayi;
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
    this.hari_ini_mm = hari_ini_mm;
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
  public void setTmpt_lahir_bayi(String tmpt_lahir_bayi)
  {
    this.tmpt_lahir_bayi = tmpt_lahir_bayi;
  }
  public String getTmpt_lahir_bayi()
  {
    return tmpt_lahir_bayi;
  }
  public void setTgl_lhr_day_bayi(String tgl_lhr_day_bayi)
  {
    this.tgl_lhr_day_bayi = tgl_lhr_day_bayi;
  }
  public String getTgl_lhr_day_bayi()
  {
    return tgl_lhr_day_bayi;
  }
  public void setTgl_lhr_string_dd_bayi(String tgl_lhr_string_dd_bayi)
  {
    this.tgl_lhr_string_dd_bayi = tgl_lhr_string_dd_bayi;
  }
  public String getTgl_lhr_string_dd_bayi()
  {
    return tgl_lhr_string_dd_bayi;
  }
  public void setTgl_lhr_string_mm_bayi(String tgl_lhr_string_mm_bayi)
  {
    this.tgl_lhr_string_mm_bayi = tgl_lhr_string_mm_bayi;
  }
  public String getTgl_lhr_string_mm_bayi()
  {
    return tgl_lhr_string_mm_bayi;
  }
  public void setTgl_lhr_string_yy_bayi(String tgl_lhr_string_yy_bayi)
  {
    this.tgl_lhr_string_yy_bayi = tgl_lhr_string_yy_bayi;
  }
  public String getTgl_lhr_string_yy_bayi()
  {
    return tgl_lhr_string_yy_bayi;
  }
  public void setPukul_lhr_bayi(String pukul_lhr_bayi)
  {
    this.pukul_lhr_bayi = pukul_lhr_bayi;
  }
  public String getPukul_lhr_bayi()
  {
    return pukul_lhr_bayi;
  }
  public void setNama_lgkp_bayi(String nama_lgkp_bayi)
  {
    this.nama_lgkp_bayi = nama_lgkp_bayi;
  }
  public String getNama_lgkp_bayi()
  {
    return nama_lgkp_bayi;
  }
  public void setAnak_ke_lahir_bayi(String anak_ke_lahir_bayi)
  {
    this.anak_ke_lahir_bayi = anak_ke_lahir_bayi;
  }
  public String getAnak_ke_lahir_bayi()
  {
    return anak_ke_lahir_bayi;
  }
  public void setJenis_kelamin_bayi(String jenis_kelamin_bayi)
  {
    this.jenis_kelamin_bayi = jenis_kelamin_bayi;
  }
  public String getJenis_kelamin_bayi()
  {
    return jenis_kelamin_bayi;
  }
//ayah
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
//end ayah
//ibu
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
//end ibu
//saksi1
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
//end saksi1
//saksi2
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
//end saksi1

}