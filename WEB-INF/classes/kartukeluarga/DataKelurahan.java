package kartukeluarga;

import java.io.*;

public class DataKelurahan implements Serializable
{
  private String no_kel, nama_kel, nama_lur, nip_lur,jabatan="";

  public DataKelurahan(String no_kel,String nama_kel)
  {
    this.no_kel = no_kel;
    this.nama_kel = nama_kel;
  }

  public DataKelurahan(String no_kel,String nama_kel, String nama_lur, String nip_lur)
  {
    this.no_kel = no_kel;
    this.nama_kel = nama_kel;

    this.nama_lur = nama_lur;
    this.nip_lur = nip_lur;
  }

public DataKelurahan(String no_kel,String nama_kel, String jabatan,String nama_lur, String nip_lur)
  {
    this.no_kel = no_kel;
    this.nama_kel = nama_kel;
    this.jabatan=jabatan;
    this.nama_lur = nama_lur;
    this.nip_lur = nip_lur;
  }

public void setJabatan(String jab)
  {
    this.jabatan=jab;
  }

public String getJabatan()
  {
    return jabatan;
  }
  public void setNama_lur(String nama_lur)
  {
    this.nama_lur = nama_lur;
  }
  public String getNama_lur()
  {
    return nama_lur;
  }

  public void setNip_lur(String nip_lur)
  {
    this.nip_lur = nip_lur;
  }
  public String getNip_lur()
  {
    return nip_lur;
  }

  public void setNo_kel(String no_kel)
  {
    this.no_kel=no_kel;
  }
  public String getNo_kel()
  {
    return no_kel;
  }
  public void setNama_kel(String nama_kel)
  {
    this.nama_kel=nama_kel;
  }
  public String getNama_kel()
  {
    return nama_kel;
  }
}
