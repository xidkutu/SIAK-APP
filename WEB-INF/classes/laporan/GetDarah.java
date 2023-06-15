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
public class GetDarah implements Serializable
{
String namakel,A,B,AB,O,APLUS,AMINUS,BPLUS,BMINUS,ABPLUS,ABMINUS,OPLUS,OMINUS,TIDAK_TAHU;

 public GetDarah(String namakel,String A,String B,String AB,String O,String APLUS,String AMINUS,String BPLUS,String BMINUS,String ABPLUS,String ABMINUS,String OPLUS,String OMINUS,String TIDAK_TAHU)
   {
    this.namakel=(namakel==null) ?"":namakel;
    this.A=(A==null) ?"":A;
    this.B=(B==null) ?"":B;
    this.AB=(AB==null) ?"":AB;
    this.O=(O==null) ?"":O;
    this.APLUS=(APLUS==null)?"":APLUS;
    this.AMINUS=(AMINUS==null)?"":AMINUS;
    this.BPLUS=(BPLUS==null)?"":BPLUS;
    this.BMINUS=(BMINUS==null)?"":BMINUS;
    this.ABPLUS=(ABPLUS==null)?"":ABPLUS;
    this.ABMINUS=(ABMINUS==null)?"":ABMINUS;
    this.OPLUS=(OPLUS==null)?"":OPLUS;
    this.OMINUS=(OMINUS==null)?"":OMINUS;
    this.TIDAK_TAHU=(TIDAK_TAHU==null)?"":TIDAK_TAHU;
  }

  public String getNamaKel()
{
return namakel;
}
  public String getA()
  {
  return A;
  }
  public String getB()
  {
  return B;
  }
  public String getO()
  {
  return O;
  }
  public String getAb()
  {
  return AB;
  }

  public String getAPlus()
      {
      return APLUS;
  }

      public String getAMinus()
                {
    return AMINUS;
      }


          public String getBPlus()
              {
return BPLUS;
          }

              public String getBMinus()
                  {
return BMINUS;
              }

public String getABPlus()
              {
                return ABPLUS;
              }
  public String getABMinus()
  {
    return ABMINUS;
  }

                  public String getOPlus()
                      {
return OPLUS;
                  }

                      public String getOMinus()
                          {
return OMINUS;
                      }

             public String getTidakTahuDong()
                              {
                                    return TIDAK_TAHU;
                          }

 public void  setNamaKel(String namakel)
{
  this.namakel=(namakel==null) ?"":namakel;
}
  public void setA(String A)
  {
   this.A=(A==null) ?"":A;
  }
  public void  setB(String B)
  {
   this.B=(B==null) ?"":B;
  }
  public void  setO(String O)
  {
   this.O=(O==null) ?"":O;
  }
  public void setAb(String AB)
  {
   this.AB=(AB==null) ?"":AB;
  }
}
