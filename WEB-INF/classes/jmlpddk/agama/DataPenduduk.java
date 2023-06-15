package jmlpddk.agama;

import java.io.Serializable;

public class DataPenduduk implements Serializable
{
  private String nama;

  private String jmlIslam, jmlKristen, jmlKatolik, jmlBudha, jmlLainnya, jmlPenduduk;
  private String headTitle, jumlahTitle;

  public DataPenduduk(String nama
                      , String jmlIslam,String jmlKristen,String jmlKatolik,String jmlBudha
                      , String jmlLainnya, String jmlPenduduk
                      ,String headTitle,String jumlahTitle)
  {
    this.nama = nama;
    this.jmlIslam = jmlIslam;
    this.jmlKristen = jmlKristen;
    this.jmlKatolik = jmlKatolik;
    this.jmlBudha = jmlBudha;
    this.jmlLainnya = jmlLainnya;
    this.jmlPenduduk = jmlPenduduk;

    this.headTitle = headTitle;
    this.jumlahTitle = jumlahTitle;
  }

 public DataPenduduk(String nama , String jmlIslam,String jmlKristen,String jmlKatolik,
                     String jmlBudha,String jmlLainnya)
  {
    this.nama = nama;
    this.jmlIslam = jmlIslam;
    this.jmlKristen = jmlKristen;
    this.jmlKatolik = jmlKatolik;
    this.jmlBudha = jmlBudha;
    this.jmlLainnya = jmlLainnya;
  }


  public void setHeadTitle(String headTitle)
  {
    this.headTitle = headTitle;
  }
  public String getHeadTitle()
  {
    return headTitle;
  }
  public void setJumlahTitle(String jumlahTitle)
  {
    this.jumlahTitle = jumlahTitle;
  }
  public String getJumlahTitle()
  {
    return jumlahTitle;
  }

  public void setNama(String nama)
  {
    this.nama= nama;
  }
  public String getNama()
  {
    return nama;
  }

  public void setJmlIslam(String jmlIslam)
  {
    this.jmlIslam = jmlIslam;
  }
  public String getJmlIslam()
  {
    return jmlIslam;
  }
  public void setJmlKristen(String jmlKristen)
  {
    this.jmlKristen = jmlKristen;
  }
  public String getJmlKristen()
  {
    return jmlKristen;
  }
  public void setJmlKatolik(String jmlKatolik)
  {
    this.jmlKatolik = jmlKatolik;
  }
  public String getJmlKatolik()
  {
    return jmlKatolik;
  }
  public void setJmlBudha(String jmlBudha)
  {
    this.jmlBudha = jmlBudha;
  }
  public String getJmlBudha()
  {
    return jmlBudha;
  }
  public void setJmlLainnya(String jmlLainnya)
  {
    this.jmlLainnya = jmlLainnya;
  }
  public String getJmlLainnya()
  {
    return jmlLainnya;
  }
  public void setJmlPenduduk(String jmlPenduduk)
  {
    this.jmlPenduduk = jmlPenduduk;
  }
  public String getJmlPenduduk()
  {
    return jmlPenduduk;
  }
}