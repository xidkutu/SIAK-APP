package pendaftaran;

import java.io.*;

public class UserInfo implements Serializable
{
  public String no_kk,nama_kep,alamat,no_kk1;

   public UserInfo(String no_kk,String nama_kep,String alamat)
   {
    this.no_kk = no_kk;
    this.nama_kep = nama_kep;
    this.alamat = alamat;
   }
   public String getNoKk()
   {
      return no_kk;
   }
    public String getNamaKep()
    {
      return nama_kep;
    }
    public String getAlamat()
    {
      return alamat;
    }
    // set Methods

    public void setNoKk(String no_kk)
    {
      this.no_kk = no_kk;
    }
    public void setNamaKep(String nama_kep)
    {
      this.nama_kep = nama_kep;
    }

    public void setPassword(String alamat)
    {
      this.alamat = alamat;
    }
}
