package buku.rekapitulasi.pddk;

import java.io.Serializable;

public class BukuRekapPddkObject implements Serializable
{
  private String lakiwni, peremwni, lakiwna, peremwna, lahirlakiwni, lahirperemwni,
      lahirlakiwna, lahirperemwna, matilakiwni, matiperemwni, matilakiwna, matiperemwna,
      pindahlakiwni, pindahperemwni, pindahlakiwna, pindahperemwna, datanglakiwni,datangperemwni,
      datanglakiwna, datangperemwna;
  private String nama_kel;

  public BukuRekapPddkObject( String nama_kel, String lakiwni,String peremwni,String lakiwna,String peremwna,
                                     String lahirlakiwni,String lahirperemwni,String lahirlakiwna,
                                     String lahirperemwna,String matilakiwni,String matiperemwni,
                                     String matilakiwna,String matiperemwna,String pindahlakiwni,
                                     String pindahperemwni,String pindahlakiwna,String pindahperemwna,
                                     String datanglakiwni,String datangperemwni,String datanglakiwna,
                                     String datangperemwna)
  {
    this.nama_kel = nama_kel;
    this.lakiwni = lakiwni;
    this.peremwni = peremwni;
    this.lakiwna = lakiwna;
    this.peremwna = peremwna;

    this.lahirlakiwni = lahirlakiwni;
    this.lahirlakiwna = lahirlakiwna;
    this.lahirperemwni = lahirperemwni;
    this.lahirperemwna = lahirperemwna;

    this.matilakiwni = matilakiwni;
    this.matiperemwni = matiperemwni;
    this.matilakiwna = matilakiwna;
    this.matiperemwna = matiperemwna;

    this.pindahlakiwni = pindahlakiwni;
    this.pindahperemwni = pindahperemwni;
    this.pindahlakiwna = pindahlakiwna;
    this.pindahperemwna = pindahperemwna;

    this.datanglakiwni = datanglakiwni;
    this.datangperemwni = datangperemwni;
    this.datanglakiwna = datanglakiwna;
    this.datangperemwna = datangperemwna;
  }

  public void setNama_kel(String nama_kel)
  {
    this.nama_kel = nama_kel;
  }
  public String getNama_kel()
  {
    return nama_kel;
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

  public void setLahirlakiwni(String lahirlakiwni)
  {
    this.lahirlakiwni = lahirlakiwni;
  }
  public String getLahirlakiwni()
  {
    return lahirlakiwni;
  }
  public void setLahirlakiwna(String lahirlakiwna)
  {
    this.lahirlakiwna = lahirlakiwna;
  }
  public String getLahirlakiwna()
  {
    return lahirlakiwna;
  }
  public void setLahirperemwni(String lahirperemwni)
  {
    this.lahirperemwni = lahirperemwni;
  }
  public String getLahirperemwni()
  {
    return lahirperemwni;
  }
  public void setLahirperemwna(String lahirperemwna)
  {
    this.lahirperemwna = lahirperemwna;
  }
  public String getLahirperemwna()
  {
    return lahirperemwna;
  }

  public void setMatilakiwni(String matilakiwni)
  {
    this.matilakiwni = matilakiwni;
  }
  public String getMatilakiwni()
  {
    return matilakiwni;
  }
  public void setMatilakiwna(String matilakiwna)
  {
    this.matilakiwna = matilakiwna;
  }
  public String getMatilakiwna()
  {
    return matilakiwna;
  }
  public void setMatiperemwni(String matiperemwni)
  {
    this.matiperemwni = matiperemwni;
  }
  public String getMatiperemwni()
  {
    return matiperemwni;
  }
  public void setMatiperemwna(String matiperemwna)
  {
    this.matiperemwna = matiperemwna;
  }
  public String getMatiperemwna()
  {
    return matiperemwna;
  }

  public void setPindahlakiwni(String pindahlakiwni)
  {
    this.pindahlakiwni = pindahlakiwni;
  }
  public String getPindahlakiwni()
  {
    return pindahlakiwni;
  }
  public void setPindahlakiwna(String pindahlakiwna)
  {
    this.pindahlakiwna = pindahlakiwna;
  }
  public String getPindahlakiwna()
  {
    return pindahlakiwna;
  }
  public void setPindahperemwni(String pindahperemwni)
  {
    this.pindahperemwni = pindahperemwni;
  }
  public String getPindahperemwni()
  {
    return pindahperemwni;
  }
  public void setPindahperemwna(String pindahperemwna)
  {
    this.pindahperemwna = pindahperemwna;
  }
  public String getPindahperemwna()
  {
    return pindahperemwna;
  }

  public void setDatanglakiwni(String datanglakiwni)
  {
    this.datanglakiwni = datanglakiwni;
  }
  public String getDatanglakiwni()
  {
    return datanglakiwni;
  }
  public void setDatanglakiwna(String datanglakiwna)
  {
    this.datanglakiwna = datanglakiwna;
  }
  public String getDatanglakiwna()
  {
    return datanglakiwna;
  }
  public void setDatangperemwni(String datangperemwni)
  {
    this.datangperemwni = datangperemwni;
  }
  public String getDatangperemwni()
  {
    return datangperemwni;
  }
  public void setDatangperemwna(String datangperemwna)
  {
    this.datangperemwna = datangperemwna;
  }
  public String getDatangperemwna()
  {
    return datangperemwna;
  }
}