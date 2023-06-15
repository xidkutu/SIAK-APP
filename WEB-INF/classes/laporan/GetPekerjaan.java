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

public class GetPekerjaan implements Serializable
{
  String namakel,Pelajar,Negurus,Pensin,TKerja,Petai,PTernak,Nlayan,Industri,Kons,transp,Pdagang,pns,tni,polri,jasa,laninya;
  public GetPekerjaan(String namakel,String Pelajar,String Negurus,String Pensin,String TKerja,String Petai,String PTernak,String Nlayan,String Industri,String Kons,String transp,String Pdagang,String pns,String tni,String polri,String jasa,String laninya)
  {
    this.namakel=(namakel==null) ?"":namakel;
    this.Pelajar=(Pelajar==null) ?"":Pelajar;
    this.Negurus=(Negurus==null) ?"":Negurus;
    this.Pensin=(Pensin==null) ?"":Pensin;
    this.TKerja=(TKerja==null) ?"":TKerja;
    this.Petai=(Petai==null) ?"":Petai;
    this.PTernak=(PTernak==null) ?"":PTernak;
    this.Nlayan=(Nlayan==null) ?"":Nlayan;
    this.Industri=(Industri==null) ?"":Industri;
    this.Kons=(Kons==null) ?"":Kons;
    this.transp=(transp==null) ?"":transp;
    this.Pdagang=(Pdagang==null) ?"":Pdagang;
    this.pns=(pns==null) ?"":pns;
    this.tni=(tni==null) ?"":tni;
    this.polri=(polri==null) ?"":polri;
    this.jasa=(jasa==null) ?"":jasa;
    this.laninya=(laninya==null) ?"":laninya;
  }
  public String getNamaKel()
  {
  return namakel;
  }
  public String getPelajar()
  {
  return Pelajar;
  }
  public String getNegurus()
  {
  return Negurus;
  }
  public String getPensin()
  {
  return Pensin;
  }
  public String getTKerja()
  {
  return TKerja;
  }
  public String getPetai()
  {
  return Petai;
  }
  public String getPTernak()
  {
  return PTernak;
  }
  public String getNlayan()
  {
  return Nlayan;
  }
  public String getIndustri()
  {
  return Industri;
  }
  public String getKons()
  {
  return Kons;
  }
  public String getTransp()
  {
  return transp;
  }
  public String getPdagang()
  {
  return Pdagang;
  }
  public String getPns()
  {
  return pns;
  }
  public String getTni()
  {
  return tni;
  }
  public String getPolri()
  {
  return polri;
  }
  public String getJasa()
  {
  return jasa;
  }
  public String getLaninya()
  {
  return laninya;
  }
  public void setNamaKel(String namakel)
    {
this.namakel=(namakel==null) ?"":namakel;
    }
    public void setPelajar(String Pelajar)
    {
 this.Pelajar=(Pelajar==null) ?"":Pelajar;
    }
    public void setNegurus(String Negurus)
    {
this.Negurus=(Negurus==null) ?"":Negurus;
    }
    public void setPensin(String Pensin)
    {
this.Pensin=(Pensin==null) ?"":Pensin;
    }
    public void setTKerja(String TKerja)
    {
this.TKerja=(TKerja==null) ?"":TKerja;
    }
    public void setPetai(String Petai)
    {
this.Petai=(Petai==null) ?"":Petai;
    }
    public void setPTernak(String PTernak)
    {
this.PTernak=(PTernak==null) ?"":PTernak;
    }
    public void setNlayan(String Nlayan)
    {
this.Nlayan=(Nlayan==null) ?"":Nlayan;
    }
    public void setIndustri(String Industri)
    {
this.Industri=(Industri==null) ?"":Industri;
    }
    public void setKons(String Kons)
    {
this.Kons=(Kons==null) ?"":Kons;
    }
    public void setTransp(String transp)
    {
this.transp=(transp==null) ?"":transp;
    }
    public void setPdagang(String Pdagang)
    {
this.Pdagang=(Pdagang==null) ?"":Pdagang;
    }
    public void setPns(String pns)
    {
this.pns=(pns==null) ?"":pns;
    }
    public void setTni(String tni)
    {
 this.tni=(tni==null) ?"":tni;
    }
    public void setPolri(String polri)
    {
    this.polri=(polri==null) ?"":polri;
    }
    public void setJasa(String jasa)
    {
this.jasa=(jasa==null) ?"":jasa;
    }
    public void setLaninya(String laninya)
    {
this.laninya=(laninya==null) ?"":laninya;
    }
}
