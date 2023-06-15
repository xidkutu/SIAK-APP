package viewkk;

import java.io.Serializable;

public class ViewDataAlamat implements Serializable
{
  private String no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos;
  public ViewDataAlamat(String no_kk, String nama_kep, String alamat,
                        String no_rt, String no_rw, String kode_pos)
  {
    this.no_kk = no_kk;
    this.nama_kep = nama_kep;
    this.alamat = alamat;
    this.no_rt = no_rt;
    this.no_rw = no_rw;
    this.kode_pos = kode_pos;
  }

  public void setNo_kk(String no_kk)
  {
    this.no_kk = no_kk;
  }
  public String getNo_kk()
  {
    return no_kk;
  }
  public void setNama_kep(String nama_kep)
  {
    this.nama_kep = nama_kep;
  }
  public String getNama_kep()
  {
    return nama_kep;
  }
  public void setAlamat(String alamat)
  {
    this.alamat = alamat;
  }
  public String getAlamat()
  {
    return alamat;
  }
  public void setNo_rt(String no_rt)
  {
    this.no_rt = no_rt;
  }
  public String getNo_rt()
  {
    return no_rt;
  }
  public void setNo_rw(String no_rw)
  {
    this.no_rw = no_rw;
  }
  public String getNo_rw()
  {
    return no_rw;
  }
  public void setKode_pos(String kode_pos)
  {
    this.kode_pos = kode_pos;
  }
  public String getKode_pos()
  {
    return kode_pos;
  }
}