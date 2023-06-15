package jmlpddk.agama;

import java.io.Serializable;

public class ListKab implements Serializable
{
 private String no_kab,nama_kab,no_prop,tot_kec;
 public ListKab(String no_kab,String nama_kab,String no_prop)
 {
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
 }


 public ListKab(String no_kab,String nama_kab,String no_prop,String tot_kec)
 {
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
   this.tot_kec=tot_kec;
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

  public void setNama_kab(String nama_kab )
  {
  this.nama_kab=(nama_kab==null)?"":nama_kab;
  }
  public String getNama_kab()
  {
   return nama_kab;
  }

  public String getTotKec()
  {
         return    tot_kec;
  }

public void setTotKec(String tot_kec)
  {
   this.tot_kec=(tot_kec==null)?"":tot_kec;
  }

}