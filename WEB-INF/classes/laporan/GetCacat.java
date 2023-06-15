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

public class GetCacat implements Serializable
{
  String Nama_Kel,Fisik,Netra,Rungu,MentalJiwa,FisikMental,Lainnya;
  public GetCacat(String Nama_Kel,String Fisik,String Netra,String Rungu,String MentalJiwa,String FisikMental,String Lainnya)
  {
    this.Nama_Kel=(Nama_Kel==null) ?"":Nama_Kel;
    this.Fisik=(Fisik==null) ?"":Fisik;
    this.Netra=(Netra==null) ?"":Netra;
    this.Rungu=(Rungu==null) ?"":Rungu;
    this.MentalJiwa=(MentalJiwa==null) ?"":MentalJiwa;
    this.FisikMental=(FisikMental==null) ?"":FisikMental;
    this.Lainnya=(Lainnya==null) ?"":Lainnya;
  }
  public String getNamaKel()
  {
  return Nama_Kel;
  }
  public String getFisik()
  {
  return Fisik;
  }
  public String getNetra()
    {
    return Netra;
    }
 public String getRungu()
      {
      return Rungu;
      }
public String getMentalJiwa()
        {
        return MentalJiwa;
        }
public String getFisikMental()
        {
        return FisikMental;
        }
public String getLainnya()
          {
          return Lainnya;
          }

public void setNamaKel(String Nama_Kel)
            {
this.Nama_Kel=(Nama_Kel==null) ?"":Nama_Kel;
            }
public void  setFisik(String Fisik)
            {
this.Fisik=(Fisik==null) ?"":Fisik;
            }
public void setNetra(String Netra)
              {
this.Netra=(Netra==null) ?"":Netra;
              }
public void setRungu(String Rungu)
                {
this.Rungu=(Rungu==null) ?"":Rungu;
                }
public void setMentalJiwa(String MentalJiwa)
                  {
this.MentalJiwa=(MentalJiwa==null) ?"":MentalJiwa;
                  }
public void setFisikMental(String FisikMental)
                  {
this.FisikMental=(FisikMental==null) ?"":FisikMental;
                  }
public void setLainnya(String Lainnya)
                    {
this.Lainnya=(Lainnya==null) ?"":Lainnya;
                    }
}
