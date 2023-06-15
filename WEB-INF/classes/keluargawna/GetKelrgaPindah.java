package keluargawna;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class GetKelrgaPindah implements Serializable
{
  String nik,nokk,namakep,stathbkel,jenisklmin,kwrn;
  String nokk_lma="",no_kk_baru="";

  public GetKelrgaPindah(String nik,String nokk_lma,String namakep,String stathbkel,String jenisklmin,String kwrn)
  {
    this.nik=(nik==null) ?"":nik;
    this.nokk_lma=(nokk_lma==null) ?"":nokk_lma;
    this.namakep=(namakep==null) ?"":namakep;
    this.stathbkel=(stathbkel==null) ?"":stathbkel;
    this.jenisklmin=(jenisklmin==null) ?"":jenisklmin;
    this.kwrn=(kwrn==null) ?"":kwrn;
  }

  public GetKelrgaPindah(String nik,String nokk_lma,String no_kk_baru,String namakep,String stathbkel,String jenisklmin,String kwrn)
  {
    this.nik=(nik==null) ?"":nik;
    this.nokk_lma=(nokk_lma==null) ?"":nokk_lma;
    this.no_kk_baru=no_kk_baru;
    this.namakep=(namakep==null) ?"":namakep;
    this.stathbkel=(stathbkel==null) ?"":stathbkel;
    this.jenisklmin=(jenisklmin==null) ?"":jenisklmin;
    this.kwrn=(kwrn==null) ?"":kwrn;
  }

  public String getNik()
  {
    return nik;
  }
  public String getNokk()
   {
     return nokk_lma;
   }

   public String getNoKkBaru()
   {
     return no_kk_baru;
   }

   public String getNamaKep()
  {
    return namakep;
  }
  public String getStatHbkel()
   {
     return stathbkel;
   }
   public String getJenisKlmin()
    {
      return jenisklmin;
    }

 public String getKwrn()
        {
          return kwrn;
        }

public void setNik(String nik)
{
 this.nik=(nik==null) ?"":nik;
}
  public void setNokk(String nokk)
  {
  this.nokk=(nokk==null) ?"":nokk;
  }
  public void setNamaKep(String namakep)
  {
this.namakep=(namakep==null) ?"":namakep;
  }
  public void setStatHbkel(String stathbkel)
  {
this.stathbkel=(stathbkel==null) ?"":stathbkel;
  }
  public void setJenisKlmin(String jenisklmin)
  {
this.jenisklmin=(jenisklmin==null) ?"":jenisklmin;
  }
  public void setKwrn(String kwrn)
  {
this.kwrn=(kwrn==null) ?"":kwrn;
  }
}