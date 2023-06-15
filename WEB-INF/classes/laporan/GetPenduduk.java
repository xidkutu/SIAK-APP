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

public class GetPenduduk implements Serializable
{
  String Nik,NamaLgkp,NoKk,Alamat,TmptLhr,TglLhr,Jenis_Klmin,Stat_Kwn,agama,PDDK_AKH,JENIS_PKRJN,Gol_Drh,STAT_HBKEL;
  public GetPenduduk(String Nik,String NamaLgkp,String NoKk,String Alamat,String TmptLhr,String TglLhr,String Jenis_Klmin,String Stat_Kwn,String agama,String PDDK_AKH,String JENIS_PKRJN,String Gol_Drh,String STAT_HBKEL)
  {
    this.Nik=(Nik==null) ?"":Nik;
    this.NamaLgkp=(NamaLgkp==null) ?"":NamaLgkp;
    this.NoKk=(NoKk==null) ?"":NoKk;
    this.Alamat=(Alamat==null) ?"":Alamat;
    this.TmptLhr=(TmptLhr==null) ?"":TmptLhr;
    this.TglLhr=(TglLhr==null) ?"":TglLhr;
    this.Jenis_Klmin=(Jenis_Klmin==null) ?"":Jenis_Klmin;
    this.Stat_Kwn=(Stat_Kwn==null) ?"":Stat_Kwn;
    this.agama=(agama==null) ?"":agama;
    this.PDDK_AKH=(PDDK_AKH==null) ?"":PDDK_AKH;
    this.JENIS_PKRJN=(JENIS_PKRJN==null) ?"":JENIS_PKRJN;
    this.Gol_Drh=(Gol_Drh==null) ?"":Gol_Drh;
    this.STAT_HBKEL=(STAT_HBKEL==null) ?"":STAT_HBKEL;
  }
  public String getNik()
  {
  return Nik;
  }
  public String getNamaLgkp()
  {
  return NamaLgkp;
  }
  public String getNoKk()
  {
  return NoKk;
  }
  public String getAlamat()
  {
  return Alamat;
  }
  public String getTmptLhr()
  {
  return TmptLhr;
  }
  public String getTglLhr()
  {
  return TglLhr;
  }
  public String getJenis_Klmin()
  {
  return Jenis_Klmin;
  }
  public String getStat_Kwn()
  {
  return Stat_Kwn;
  }
  public String getagama()
  {
  return agama;
  }
  public String getPddk_Akh()
  {
  return PDDK_AKH;
  }
  public String getJenis_Pkrjan()
  {
  return JENIS_PKRJN;
  }
  public String getGol_Drh()
  {
  return Gol_Drh;
  }
  public String getStat_Hbkel()
  {
  return STAT_HBKEL;
  }

public void setNik(String Nik)
    {
this.Nik=(Nik==null) ?"":Nik;
    }
public void setNamaLgkp(String NamaLgkp)
    {
 this.NamaLgkp=(NamaLgkp==null) ?"":NamaLgkp;
    }
public void  setNoKk(String NoKk)
    {
this.NoKk=(NoKk==null) ?"":NoKk;
    }
public void setAlamat(String Alamat)
    {
this.Alamat=(Alamat==null) ?"":Alamat;
    }
public void setTmptLhr(String TmptLhr)
    {
this.TmptLhr=(TmptLhr==null) ?"":TmptLhr;
    }
public void setTglLhr(String TglLhr)
    {
this.TglLhr=(TglLhr==null) ?"":TglLhr;
    }
public void setJenis_Klmin(String Jenis_Klmin)
    {
this.Jenis_Klmin=(Jenis_Klmin==null) ?"":Jenis_Klmin;
    }
public void  setStat_Kwn(String Stat_Kwn)
    {
this.Stat_Kwn=(Stat_Kwn==null) ?"":Stat_Kwn;
    }
public void setagama(String agama)
    {
this.agama=(agama==null) ?"":agama;
    }
public void setPddk_Akh(String PDDK_AKH)
    {
this.PDDK_AKH=(PDDK_AKH==null) ?"":PDDK_AKH;
    }
public void setJenis_Pkrjan(String JENIS_PKRJN)
    {
this.JENIS_PKRJN=(JENIS_PKRJN==null) ?"":JENIS_PKRJN;
    }
public void  setGol_Drh(String Gol_Drh)
    {
this.Gol_Drh=(Gol_Drh==null) ?"":Gol_Drh;
    }
public void setStat_Hbkel(String STAT_HBKEL)
    {
this.STAT_HBKEL=(STAT_HBKEL==null) ?"":STAT_HBKEL;
    }
}
