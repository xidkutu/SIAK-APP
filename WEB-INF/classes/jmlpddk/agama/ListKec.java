package jmlpddk.agama;

import java.io.Serializable;

public class ListKec implements Serializable
{
 private String no_prop,no_kab,no_kec,nama_kec,tot_kel;
 public ListKec(String no_kec,String nama_kec,String no_kab,String no_prop)
 {
   this.no_kec=(no_kec==null) ?"":no_kec;
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
 }
 public ListKec(String no_kec,String nama_kec,String no_kab,String no_prop,String tot_kel)
 {
   this.no_kec=(no_kec==null) ?"":no_kec;
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
   this.tot_kel=tot_kel;
 }


 public void setNo_kec(String no_kec)
 {
 this.no_kec=(no_kec==null) ?"":no_kec;
 }
 public String getNo_kec()
  {
    return no_kec;
  }
  public void setNama_kec(String nama_kec )
   {
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   }

  public String getNama_kec()
 {
   return nama_kec;
 }
 public void setNo_kab(String no_kab)
   {
   this.no_kab=(no_kab==null) ?"":no_kab;
   }

 public String getNo_kab()
  {
    return no_kab;
  }

  public void setNo_prop(String no_prop)
     {
    this.no_prop=(no_prop==null) ?"":no_prop;
     }

  public String getNo_prop()
    {
      return no_prop;
    }

 public String getTotKel()
          {
                return tot_kel;
          }

 public void setTotKel(String tot_kel)
          {
  this.tot_kel=(tot_kel==null)?"":tot_kel;
          }
}