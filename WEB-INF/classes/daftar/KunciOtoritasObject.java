package daftar;

import java.io.Serializable;

public class KunciOtoritasObject implements Serializable
{
  private String now, kunci_otoritas, nama_pengguna, nama_lgkp, level_id, division, nama_kantor, alamat_telp;

  public KunciOtoritasObject(String now, String kunci_otoritas,String nama_pengguna,
                             String nama_lgkp,String level_id,String division,
                             String nama_kantor,String alamat_telp)
  {
    this.now = now;
    this.kunci_otoritas = kunci_otoritas;
    this.nama_pengguna = nama_pengguna;
    this.nama_lgkp = nama_lgkp;
    this.level_id = level_id;
    this.division = division;
    this.nama_kantor = nama_kantor;
    this.alamat_telp = alamat_telp;
  }

  public void setNow(String now)
  {
    this.now = now;
  }
  public String getNow()
  {
    return now;
  }
  public void setKunci_otoritas(String kunci_otoritas)
  {
    this.kunci_otoritas = kunci_otoritas;
  }
  public String getKunci_otoritas()
  {
    return kunci_otoritas;
  }
  public void setNama_pengguna(String nama_pengguna)
  {
    this.nama_pengguna = nama_pengguna;
  }
  public String getNama_pengguna()
  {
    return nama_pengguna;
  }
  public void setNama_lgkp(String nama_lgkp)
  {
    this.nama_lgkp = nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }
  public void setLevel_id(String level_id)
  {
    this.level_id = level_id;
  }
  public String getLevel_id()
  {
    return level_id;
  }
  public void setDivision(String division)
  {
    this.division = division;
  }
  public String getDivision()
  {
    return division;
  }
  public void setNama_kantor(String nama_kantor)
  {
    this.nama_kantor = nama_kantor;
  }
  public String getNama_kantor()
  {
    return nama_kantor;
  }
  public void setAlamat_telp(String alamat_telp)
  {
    this.alamat_telp = alamat_telp;
  }
  public String getAlamat_telp()
  {
    return alamat_telp;
  }
}