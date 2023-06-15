package buku.ubahkepkel.pddk;

import java.io.Serializable;

public class BukuUbahKepkelObject implements Serializable
{
  private String nama_kel, tambahkk, pengukk, jumlahk;

  public BukuUbahKepkelObject(String nama_kel,String tambahkk,String pengukk,String jumlahk)
  {
    this.nama_kel = nama_kel;
    this.tambahkk = tambahkk;
    this.pengukk = pengukk;
    this.jumlahk = jumlahk;
  }
  public void setNama_kel(String nama_kel)
  {
    this.nama_kel = nama_kel;
  }
  public String getNama_kel()
  {
    return nama_kel;
  }
  public void setTambahkk(String tambahkk)
  {
    this.tambahkk = tambahkk;
  }
  public String getTambahkk()
  {
    return tambahkk;
  }
  public void setPengukk(String pengukk)
  {
    this.pengukk = pengukk;
  }
  public String getPengukk()
  {
    return pengukk;
  }
  public void setJumlahk(String jumlahk)
  {
    this.jumlahk = jumlahk;
  }
  public String getJumlahk()
  {
    return jumlahk;
  }
}