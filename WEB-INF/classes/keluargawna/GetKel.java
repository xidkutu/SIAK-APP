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

public class GetKel implements Serializable
{
  String no_prop,no_kab,no_kec,no_kel,nama_kel,NAMA_LUR, NIP_LUR;
 public GetKel(String no_kel,String nama_kel,String no_kec,String no_kab,String no_prop)
  {
    this.no_kel=(no_kel==null) ?"":no_kel;
    this.nama_kel=(nama_kel==null)?"":nama_kel;
    this.no_kec=(no_kec==null) ?"":no_kec;
    this.no_kab=(no_kab==null) ?"":no_kab;
    this.no_prop=(no_prop==null) ?"":no_prop;
  }
  public GetKel(String no_kel,String nama_kel,String no_kec,String no_kab,String no_prop,String NAMA_LUR,String NIP_LUR)
  {
      this.no_kel=(no_kel==null) ?"":no_kel;
      this.nama_kel=(nama_kel==null)?"":nama_kel;
      this.no_kec=(no_kec==null) ?"":no_kec;
      this.no_kab=(no_kab==null) ?"":no_kab;
      this.no_prop=(no_prop==null) ?"":no_prop;
      this.NAMA_LUR=(NAMA_LUR==null) ?"":NAMA_LUR;
      this.NIP_LUR=(NIP_LUR==null) ?"":NIP_LUR;
    }

  public String getNokel()
   {
     return no_kel;
   }
   public String getNamakel()
  {
    return nama_kel;
  }
 public String getNoKec()
   {
     return no_kec;
   }
 public String getNoKab()
      {
        return no_kab;
      }
 public String getNoProp()
         {
           return no_prop;
         }
public String getNamaLur()
             {
               return NAMA_LUR;
             }
public String getNipLur()
                {
                  return NIP_LUR;
                }


public void setNokel(String no_kel)
  {
  this.no_kel=(no_kel==null) ?"":no_kel;
  }
public void setNamakel(String nama_kel )
   {
   this.nama_kel=(nama_kel==null)?"":nama_kel;
   }
public void setNoKec(String no_kec)
     {
    this.no_kec=(no_kec==null) ?"":no_kec;
     }
public void setNoKab(String no_kab)
       {
     this.no_kab=(no_kab==null) ?"":no_kab;
       }
public void setNoProp(String no_prop)
         {
    this.no_prop=(no_prop==null) ?"":no_prop;
     }
public void setNamaLur(String NAMA_LUR)
        {
      this.NAMA_LUR=(NAMA_LUR==null) ?"":NAMA_LUR;
        }
 public void setNipLur(String NIP_LUR)
          {

      this.NIP_LUR=(NIP_LUR==null) ?"":NIP_LUR;
      }


}