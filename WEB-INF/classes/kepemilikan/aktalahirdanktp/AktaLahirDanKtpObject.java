package kepemilikan.aktalahirdanktp;

import java.io.Serializable;

public class AktaLahirDanKtpObject implements Serializable
{
  private String nama_prop, jumlah_penduduk, ada_akta_lahir, wajib_memiliki_ktp;
  private String telah_memiliki_ktp, belum_memiliki_ktp;

  public AktaLahirDanKtpObject(String nama_prop,String jumlah_penduduk,String ada_akta_lahir
                               ,String wajib_memiliki_ktp
                               ,String telah_memiliki_ktp,String belum_memiliki_ktp)
  {
    this.nama_prop = nama_prop;
    this.jumlah_penduduk = jumlah_penduduk;
    this.ada_akta_lahir = ada_akta_lahir;
    this.wajib_memiliki_ktp = wajib_memiliki_ktp;
    this.telah_memiliki_ktp = telah_memiliki_ktp;
    this.belum_memiliki_ktp = belum_memiliki_ktp;
  }
  public void setNama_prop(String nama_prop)
  {
    this.nama_prop = nama_prop;
  }
  public String getNama_prop()
  {
    return nama_prop;
  }
  public void setJumlah_penduduk(String jumlah_penduduk)
  {
    this.jumlah_penduduk = jumlah_penduduk;
  }
  public String getJumlah_penduduk()
  {
    return jumlah_penduduk;
  }
  public void setAda_akta_lahir(String ada_akta_lahir)
  {
    this.ada_akta_lahir =ada_akta_lahir;
  }
  public String getAda_akta_lahir()
  {
    return ada_akta_lahir;
  }
  public void setWajib_memiliki_ktp(String wajib_memiliki_ktp)
  {
    this.wajib_memiliki_ktp = wajib_memiliki_ktp;
  }
  public String getWajib_memiliki_ktp()
  {
    return wajib_memiliki_ktp;
  }
  public void setTelah_memiliki_ktp(String telah_memiliki_ktp)
  {
    this.telah_memiliki_ktp = telah_memiliki_ktp;
  }
  public String getTelah_memiliki_ktp()
  {
    return telah_memiliki_ktp;
  }
  public void setBelum_memiliki_ktp(String belum_memiliki_ktp)
  {
    this.belum_memiliki_ktp = belum_memiliki_ktp;
  }
  public String getBelum_memiliki_ktp()
  {
    return belum_memiliki_ktp;
  }

}