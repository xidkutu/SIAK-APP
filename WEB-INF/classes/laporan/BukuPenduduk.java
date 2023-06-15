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

public class BukuPenduduk implements Serializable
{ String Nik,NamaLgkp,Jenis_Klmin,TmptTglLhr,Agama,Kwargan,PDDK_AKH,JENIS_PKRJN,Alamat,Tgl_Ktp;
  public BukuPenduduk(String Nik,String NamaLgkp,String Jenis_Klmin,String TmptTglLhr,String Agama,String Kwargan,String PDDK_AKH,String JENIS_PKRJN,String Alamat,String Tgl_Ktp)
  {
    this.Nik=(Nik==null) ?"":Nik;
    this.NamaLgkp=(NamaLgkp==null) ?"":NamaLgkp;
    this.Jenis_Klmin=(Jenis_Klmin==null) ?"":Jenis_Klmin;
    this.TmptTglLhr=(TmptTglLhr==null) ?"":TmptTglLhr;
    this.Agama=(Agama==null) ?"":Agama;
    this.Kwargan=(Kwargan==null) ?"":Kwargan;
    this.PDDK_AKH=(PDDK_AKH==null) ?"":PDDK_AKH;
    this.JENIS_PKRJN=(JENIS_PKRJN==null) ?"":JENIS_PKRJN;
    this.Alamat=(Alamat==null) ?"":Alamat;
    this.Tgl_Ktp=(Tgl_Ktp==null) ?"":Tgl_Ktp;
  }
  public String getNik()
  {
  return Nik;
  }
  public String getNamaLgkp()
  {
  return NamaLgkp;
  }
  public String getJenisKlmin()
  {
  return Jenis_Klmin;
  }
  public String getTmptTglLhr()
  {
  return TmptTglLhr;
  }
  public String getAgama()
  {
  return Agama;
  }
  public String getKwargan()
  {
  return Kwargan;
  }
  public String getPddkAkh()
  {
  return PDDK_AKH;
  }
  public String getJenisPkrjan()
  {
  return JENIS_PKRJN;
  }
  public String getAlamat()
  {
  return Alamat;
  }
  public String getTgl_Ktp()
  {
  return Tgl_Ktp;
  }
  public void setNik(String Nik)
  {
this.Nik=(Nik==null) ?"":Nik;
  }
  public void setNamaLgkp(String NamaLgkp)
  {
this.NamaLgkp=(NamaLgkp==null) ?"":NamaLgkp;
  }
  public void setJenisKlmin(String Jenis_Klmin)
  {
this.Jenis_Klmin=(Jenis_Klmin==null) ?"":Jenis_Klmin;
  }
  public void setTmptTglLhr(String TmptTglLhr)
  {
this.TmptTglLhr=(TmptTglLhr==null) ?"":TmptTglLhr;
  }
  public void setAgama(String Agama)
  {
this.Agama=(Agama==null) ?"":Agama;
  }
  public void setKwargan(String Kwargan)
  {
this.Kwargan=(Kwargan==null) ?"":Kwargan;
  }
  public void setPddkAkh(String PDDK_AKH)
  {
this.PDDK_AKH=(PDDK_AKH==null) ?"":PDDK_AKH;
  }
  public void setJenisPkrjan(String JENIS_PKRJN)
  {
this.JENIS_PKRJN=(JENIS_PKRJN==null) ?"":JENIS_PKRJN;
  }
  public void  setAlamat(String Alamat)
  {
this.Alamat=(Alamat==null) ?"":Alamat;;
  }
  public void  setTgl_Ktp(String Tgl_Ktp)
  {
this.Tgl_Ktp=(Tgl_Ktp==null) ?"":Tgl_Ktp;
  }
}
