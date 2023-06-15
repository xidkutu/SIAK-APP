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

public class GetPerkawinan implements Serializable
{
  String namaprop,Laki_Laki,Perempuan,BelumKawin,Kawin,CeraiHidup,CeraiMati,Perkawinan,Perceraian;
  public GetPerkawinan(String namaprop,String Laki_Laki,String Perempuan,String BelumKawin,String Kawin,String CeraiHidup,String CeraiMati,String Perkawinan,String Perceraian)
  {
    this.namaprop=(namaprop==null) ?"":namaprop;
    this.Laki_Laki=(Laki_Laki==null) ?"":Laki_Laki;
    this.Perempuan=(Perempuan==null) ?"":Perempuan;
    this.BelumKawin=(BelumKawin==null) ?"":BelumKawin;
    this.Kawin=(Kawin==null) ?"":Kawin;
    this.CeraiHidup=(CeraiHidup==null) ?"":CeraiHidup;
    this.CeraiMati=(CeraiMati==null) ?"":CeraiMati;
    this.Perkawinan=(Perkawinan==null) ?"":Perkawinan;
    this.Perceraian=(Perceraian==null) ?"":Perceraian;
  }
  public String getNamaProp()
  {
  return namaprop;
  }
  public String getLaki()
  {
  return Laki_Laki;
  }
  public String getPerempuan()
  {
  return Perempuan;
  }
  public String getBelumKawin()
  {
  return BelumKawin;
  }
  public String getKawin()
  {
  return Kawin;
  }
  public String getCeraiHidup()
  {
  return CeraiHidup;
  }
  public String getCeraiMati()
  {
  return CeraiMati;
  }
  public String getPerkawinan()
  {
  return Perkawinan;
  }
  public String getPerceraian()
  {
  return Perceraian;
  }
  public void setNamaProp(String namaprop)
  {
 this.namaprop=(namaprop==null) ?"":namaprop;
  }
public void setLaki(String Laki_Laki)
    {
this.Laki_Laki=(Laki_Laki==null) ?"":Laki_Laki;
    }
public void setPerempuan(String Perempuan)
      {
this.Perempuan=(Perempuan==null) ?"":Perempuan;
      }
public void setBelumKawin(String BelumKawin)
        {
this.BelumKawin=(BelumKawin==null) ?"":BelumKawin;
        }
public void setKawin(String Kawin)
          {
this.Kawin=(Kawin==null) ?"":Kawin;;
          }
public void setCeraiHidup(String CeraiHidup)
            {
this.CeraiHidup=(CeraiHidup==null) ?"":CeraiHidup;
            }
public void setCeraiMati(String CeraiMati)
              {
this.CeraiMati=(CeraiMati==null) ?"":CeraiMati;
              }
public void setPerkawinan(String Perkawinan)
                {
this.Perkawinan=(Perkawinan==null) ?"":Perkawinan;
                }
public void setPerceraian(String Perceraian)
                  {
this.Perceraian=(Perceraian==null) ?"":Perceraian;
                  }
}
