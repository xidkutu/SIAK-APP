package jmlpddk.agama;

import java.io.Serializable;

public class ListKel implements Serializable
{
  private String no_prop,no_kab,no_kec,no_kel,nama_kel;
 public ListKel(String no_kel,String nama_kel,String no_kec,String no_kab,String no_prop)
  {
    this.no_kel=(no_kel==null) ?"":no_kel;
    this.nama_kel=(nama_kel==null)?"":nama_kel;
    this.no_kec=(no_kec==null) ?"":no_kec;
    this.no_kab=(no_kab==null) ?"":no_kab;
    this.no_prop=(no_prop==null) ?"":no_prop;
  }

  public String getNo_kel()
   {
     return no_kel;
   }
   public String getNama_kel()
  {
    return nama_kel;
  }
 public String getNo_kec()
   {
     return no_kec;
   }
 public String getNo_kab()
      {
        return no_kab;
      }
 public String getNo_prop()
         {
           return no_prop;
         }

public void setNo_kel(String no_kel)
  {
  this.no_kel=(no_kel==null) ?"":no_kel;
  }
public void setNama_kel(String nama_kel )
   {
   this.nama_kel=(nama_kel==null)?"":nama_kel;
   }
public void setNo_kec(String no_kec)
     {
    this.no_kec=(no_kec==null) ?"":no_kec;
     }
public void setNo_kab(String no_kab)
       {
     this.no_kab=(no_kab==null) ?"":no_kab;
       }
public void setNo_prop(String no_prop)
         {
    this.no_prop=(no_prop==null) ?"":no_prop;
     }
}