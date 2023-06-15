package daftar;

import java.io.Serializable;

public class PenggunaObject implements Serializable
{
  private String nama_pengguna,kata_kunci,level_id,division;

  private String status, nama_lengkap, nip, tmpt_tgl, jenis_klmin, golongan, jabatan, nama_kantor;
  private String alamat_telp;

  public PenggunaObject(String nama_pengguna,String kata_kunci,String level_id,String division)
  {
    this.nama_pengguna = nama_pengguna;
    this.kata_kunci = kata_kunci;
    this.level_id = level_id;
    this.division = division;
  }

  public PenggunaObject(String nama_pengguna,String nama_lengkap
                        ,String nip,String tmpt_tgl, String jenis_klmin, String golongan
                        , String jabatan, String nama_kantor, String alamat_telp, String status)
  {
    this.nama_pengguna = nama_pengguna;

    this.nama_lengkap = nama_lengkap;
    this.nip = nip;
    this.tmpt_tgl = tmpt_tgl;
    this.jenis_klmin = jenis_klmin;
    this.golongan = golongan;
    this.jabatan = jabatan;
    this.nama_kantor = nama_kantor;
    this.alamat_telp = alamat_telp;

    this.status = status;
  }

  public void setStatus(String status)
  {
    this.status = status;
  }
  public String getStatus()
  {
    return status;
  }
  public void setAlamat_telp(String alamat_telp)
  {
    this.alamat_telp = alamat_telp;
  }
  public String getAlamat_telp()
  {
    return alamat_telp;
  }
  public void setNip(String nip)
  {
    this.nip = nip;
  }
  public String getNip()
  {
    return nip;
  }
  public void setTmpt_tgl(String tmpt_tgl)
  {
    this.tmpt_tgl = tmpt_tgl;
  }
  public String getTmpt_tgl()
  {
    return tmpt_tgl;
  }

  public void setJenis_klmin(String jenis_klmin)
  {
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }
  public void setGolongan(String golongan)
  {
    this.golongan = golongan;
  }
  public String getGolongan()
  {
    return golongan;
  }
  public void setNama_kantor(String nama_kantor)
  {
    this.nama_kantor = nama_kantor;
  }
  public String getNama_kantor()
  {
    return nama_kantor;
  }
  public void setJabatan(String jabatan)
  {
    this.jabatan = jabatan;
  }
  public String getJabatan()
  {
    return jabatan;
  }

  public void setNama_pengguna(String nama_pengguna)
  {
    this.nama_pengguna = nama_pengguna;
  }
  public String getNama_pengguna()
  {
    return nama_pengguna;
  }

  public void setNama_lengkap(String nama_lengkap)
  {
    this.nama_lengkap = nama_lengkap;
  }
  public String getNama_lengkap()
  {
    return nama_lengkap;
  }

  public void setKata_kunci(String kata_kunci)
  {
    this.kata_kunci = kata_kunci;
  }
  public String getKata_kunci()
  {
    return kata_kunci;
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
}