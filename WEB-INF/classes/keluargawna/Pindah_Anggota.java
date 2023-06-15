package keluargawna;

public class Pindah_Anggota implements java.io.Serializable
{
  String nik,namalkg,stathbkel,jenisklm,kwrngrn;
  public Pindah_Anggota(String nik,String namalkg,String stathbkel,String jenisklm,String kwrngrn)
  {
    this.nik=(nik==null)?"":nik;
    this.namalkg=(namalkg==null)?"":namalkg;
    this.stathbkel=(stathbkel==null)?"":stathbkel;
    this.jenisklm=(jenisklm==null)?"":jenisklm;
    this.kwrngrn=(kwrngrn==null)?"":kwrngrn;
  }

  public Pindah_Anggota(String nik,String namalkg,String stathbkel)
  {
    this.nik=(nik==null)?"":nik;
    this.namalkg=(namalkg==null)?"":namalkg;
    this.stathbkel=(stathbkel==null)?"":stathbkel;
  }
  public String getNik()
   {
    return(nik);
   }
public String getNamalkg()
      {
       return(namalkg);
      }
public String getStathbkel()
         {
          return(stathbkel);
         }
public String getJenisklm()
{
return(jenisklm);
}
public String getKwrngrn()
{
return(kwrngrn);
}
public void setNik(String nik)
            {
this.nik=(nik==null)?"":nik;
            }
public void  setNamalkg(String namalkg)
               {
 this.namalkg=(namalkg==null)?"":namalkg;
               }
public void setStathbkel(String stathbkel)
 {
 this.stathbkel=(stathbkel==null)?"":stathbkel;
 }
 public void  setJenisklm(String jenisklm)
                {
  this.jenisklm=(jenisklm==null)?"":jenisklm;
                }
 public void setKwrngrn(String kwrngrn)
  {
      this.kwrngrn=(kwrngrn==null)?"":kwrngrn;
  }

}