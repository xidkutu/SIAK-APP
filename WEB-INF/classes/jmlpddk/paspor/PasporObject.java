package jmlpddk.paspor;

import java.io.Serializable;

public class PasporObject implements Serializable
{
  private String nama_kab, paspor_tada, paspor_ada, jmlPenduduk;

  public PasporObject(String nama_kab,String paspor_tada,String paspor_ada,String jmlPenduduk)
  {
    this.nama_kab = nama_kab;
    this.paspor_tada = paspor_tada;
    this.paspor_ada = paspor_ada;
    this.jmlPenduduk = jmlPenduduk;
  }

  public PasporObject(String nama_kab,String paspor_tada,String paspor_ada)
  {
    this.nama_kab = nama_kab;
    this.paspor_tada = paspor_tada;
    this.paspor_ada = paspor_ada;
  }

  public void setJmlPenduduk(String jmlPenduduk)
  {
    this.jmlPenduduk = jmlPenduduk;
  }
  public String getJmlPenduduk()
  {
    return jmlPenduduk;
  }
  public void setNama_kab(String nama_kab)
  {
    this.nama_kab = nama_kab;
  }
  public String getNama_kab()
  {
    return nama_kab;
  }
  public void setPaspor_tada(String paspor_tada)
  {
    this.paspor_tada = paspor_tada;
  }
  public String getPaspor_tada()
  {
    return paspor_tada;
  }
  public void setPaspor_ada(String paspor_ada)
  {
    this.paspor_ada = paspor_ada;
  }
  public String getPaspor_ada()
  {
    return paspor_ada;
  }

}