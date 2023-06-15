package laporan;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class GetWajib implements Serializable
{
  String Nik,NamaLgkp,Alamat,JenisKlmin,StatKtp;
  public GetWajib(String Nik,String NamaLgkp,String Alamat,String JenisKlmin,String StatKtp)
  {
    this.Nik=(Nik==null) ?"":Nik;
    this.NamaLgkp=(NamaLgkp==null) ?"":NamaLgkp;
    this.Alamat=(Alamat==null) ?"":Alamat;
    this.JenisKlmin=(JenisKlmin==null) ?"":JenisKlmin;
    this.StatKtp=(StatKtp==null) ?"":StatKtp;
  }
  public String getNik()
  {
  return Nik;
  }
  public String getNamaLgkp()
  {
  return NamaLgkp;
  }
  public String getAlamat()
  {
  return Alamat;
  }
  public String getJenisKlmin()
  {
  return JenisKlmin;
  }
  public String getStatKtp()
  {
  return StatKtp;
  }
  public void setNik(String Nik)
  {
  this.Nik=(Nik==null) ?"":Nik;
  }
  public void setNamaLgkp(String  NamaLgkp)
  {
this.NamaLgkp=(NamaLgkp==null) ?"":NamaLgkp;
  }
  public void setAlamat(String Alamat)
  {
this.Alamat=(Alamat==null) ?"":Alamat;
  }
  public void setJenisKlmin(String JenisKlmin)
  {
this.JenisKlmin=(JenisKlmin==null) ?"":JenisKlmin;
  }
  public void setStatKtp(String StatKtp)
  {
 this.StatKtp=(StatKtp==null) ?"":StatKtp;
  }
}
