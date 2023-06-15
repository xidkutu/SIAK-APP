package siak.security;

import java.io.Serializable;

public class SecurityObject implements Serializable
{
  private String user_id, nama_lgkp, nip,division;

  private String tmpt_lhr, tgl_lhr,jenis_klmn, gologan, pengkat,jabatan,nama_kantor,alamat_kantor, telp;

  public SecurityObject(String nama_lgkp, String nip, String tmpt_lhr,
                        String tgl_lhr, String jenis_klmn, String gologan,
                        String pengkat, String jabatan, String nama_kantor,
                        String alamat_kantor, String telp, String user_id)
  {
    this.user_id = user_id;
    this.nama_lgkp = nama_lgkp;
    this.nip = nip;
    this.division = division;

    this.tmpt_lhr = tmpt_lhr;
    this.tgl_lhr = tgl_lhr;
    this.jenis_klmn =jenis_klmn;
    this.gologan=gologan;
    this.pengkat = pengkat;
    this.jabatan = jabatan;
    this.nama_kantor = nama_kantor;
    this.alamat_kantor =alamat_kantor;
    this.telp = telp;
  }

  public SecurityObject(String user_id, String nama_lgkp, String nip, String division)
  {
    this.user_id = user_id;
    this.nama_lgkp = nama_lgkp;
    this.nip = nip;
    this.division = division;
  }
  public void setUser_id(String user_id)
  {
    this.user_id = user_id;
  }
  public String getUser_id()
  {
    return user_id;
  }
  public void setNama_lgkp(String nama_lgkp)
  {
    this.nama_lgkp = nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }
  public void setNip(String nip)
  {
    this.nip = nip;
  }
  public String getNip()
  {
    return nip;
  }
  public void setDivision(String division)
  {
    this.division = division;
  }
  public String getDivision()
  {
    return division;
  }

  public void setTmpt_lhr(String tmpt_lhr)
  {
    this.tmpt_lhr = tmpt_lhr;
  }
  public String getTmpt_lhr()
  {
    return tmpt_lhr;
  }
  public void setTgl_lhr(String tgl_lhr)
  {
    this.tgl_lhr = tgl_lhr;
  }
  public String getTgl_lhr()
  {
    return tgl_lhr;
  }
  public void setJenis_klmn(String jenis_klmn)
  {
    this.jenis_klmn = jenis_klmn;
  }
  public String getJenis_klmn()
  {
    return jenis_klmn;
  }
  public void setGologan(String gologan)
  {
    this.gologan = gologan;
  }
  public String getGologan()
  {
    return gologan;
  }
  public void setPengkat(String pengkat)
  {
    this.pengkat = pengkat;
  }
  public String getPengkat()
  {
    return pengkat;
  }
  public void setJabatan(String jabatan)
  {
    this.jabatan = jabatan;
  }
  public String getJabatan()
  {
    return jabatan;
  }
  public void setNama_kantor(String nama_kantor)
  {
    this.nama_kantor = nama_kantor;
  }
  public String getNama_kantor()
  {
    return nama_kantor;
  }

  public void setAlamat_kantor(String alamat_kantor)
  {
    this.alamat_kantor = alamat_kantor;
  }
  public String getAlamat_kantor()
  {
    return alamat_kantor;
  }
  public void setTelp(String telp)
  {
    this.telp = telp;
  }
  public String getTelp()
  {
    return telp;
  }
}