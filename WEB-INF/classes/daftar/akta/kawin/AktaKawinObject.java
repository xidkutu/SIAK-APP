package daftar.akta.kawin;

import java.io.Serializable;

public class AktaKawinObject implements Serializable
{
  private String no_akta_kwn, nik_suami, nama_suami, nik_istri, nama_istri, nama_negara;
  private boolean found;

  public AktaKawinObject(boolean found)
  {
    this.found=found;
  }
  public AktaKawinObject(String no_akta_kwn,String nik_suami,String nama_suami,String nik_istri
                         ,String nama_istri, String nama_negara, boolean found)
  {
    this.no_akta_kwn = no_akta_kwn;
    this.nik_suami = nik_suami;
    this.nama_suami = nama_suami;
    this.nik_istri = nik_istri;
    this.nama_istri = nama_istri;
    this.nama_negara = nama_negara;

    this.found=found;
  }
  public AktaKawinObject(String no_akta_kwn,String nik_suami,String nama_suami,String nik_istri
                         ,String nama_istri, String nama_negara)
  {
    this.no_akta_kwn = no_akta_kwn;
    this.nik_suami = nik_suami;
    this.nama_suami = nama_suami;
    this.nik_istri = nik_istri;
    this.nama_istri = nama_istri;
    this.nama_negara = nama_negara;
  }

  public void setFound(boolean found)
  {
    this.found = found;
  }
  public boolean getFound()
  {
    return found;
  }
  public void setNama_negara(String nama_negara)
  {
    this.nama_negara = nama_negara;
  }
  public String getNama_negara()
  {
    return nama_negara;
  }
  public void setNo_akta_kwn(String no_akta_kwn)
  {
    this.no_akta_kwn = no_akta_kwn;
  }
  public String getNo_akta_kwn()
  {
    return no_akta_kwn;
  }
  public void setNik_suami(String nik_suami)
  {
    this.nik_suami = nik_suami;
  }
  public String getNik_suami()
  {
    return nik_suami;
  }
  public void setNama_suami(String nama_suami)
  {
    this.nama_suami = nama_suami;
  }
  public String getNama_suami()
  {
    return nama_suami;
  }
  public void setNik_istri(String nik_istri)
  {
    this.nik_istri = nik_istri;
  }
  public String getNik_istri()
  {
    return nik_istri;
  }

  public void setNama_istri(String nama_istri)
  {
    this.nama_istri = nama_istri;
  }
  public String getNama_istri()
  {
    return nama_istri;
  }

}