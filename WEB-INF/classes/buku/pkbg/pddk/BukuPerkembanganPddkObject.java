package buku.pkbg.pddk;

import java.io.Serializable;

public class BukuPerkembanganPddkObject implements Serializable
{
  private String lakiwni, peremwni, lakiwna, peremwna,jumlaki,jumperem,jumlkprm;

  public BukuPerkembanganPddkObject( String lakiwni,String peremwni,
  String lakiwna,String peremwna,String jumlaki,
  String jumperem,String jumlkprm)
  {
    this.lakiwni = lakiwni;
    this.peremwni = peremwni;
    this.lakiwna = lakiwna;
    this.peremwna = peremwna;
    this.jumlaki=jumlaki;
    this.jumperem=jumperem;
    this.jumlkprm=jumlkprm;
  }

  public void setLakiwni(String lakiwni)
  {
    this.lakiwni = lakiwni;
  }

  public String getLakiwni()
  {
    return lakiwni;
  }

  public void setPeremwni(String peremwni)
  {
    this.peremwni = peremwni;
  }

  public String getPeremwni()
  {
    return peremwni;
  }

  public void setLakiwna(String lakiwna)
  {
    this.lakiwna = lakiwna;
  }

  public String getLakiwna()
  {
    return lakiwna;
  }

  public void setPeremwna(String peremwna)
  {
    this.peremwna = peremwna;
  }

  public String getPeremwna()
  {
    return peremwna;
  }

  public void setJumlaki(String jumlaki)
  {
    this.jumlaki = jumlaki;
  }

  public String getJumlaki()
  {
    return jumlaki;
  }

  public void setJumPerem(String jumperem)
  {
    this.jumperem = jumperem;
  }

  public String getJumPerem()
  {
    return jumperem;
  }

  public void setJumLkPrm(String jumlkprm)
  {
    this.jumlkprm = jumlkprm;
  }

  public String getJumLkPrm()
  {
    return jumlkprm;
  }
}