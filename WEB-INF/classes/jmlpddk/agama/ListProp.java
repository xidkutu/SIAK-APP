package jmlpddk.agama;

import java.io.Serializable;

public class ListProp implements Serializable
{
  private String no_prop,nama_prop,tot_kab;

  public ListProp(String no_prop,String nama_prop)
  {
    this.no_prop=(no_prop==null) ?"":no_prop;
    this.nama_prop=(nama_prop==null)?"":nama_prop;
  }

  public ListProp(String no_prop,String nama_prop,String tot_kab)
    {
      this.no_prop=(no_prop==null) ?"":no_prop;
      this.nama_prop=(nama_prop==null)?"":nama_prop;
       this.tot_kab=tot_kab;
    }


  public String getNo_prop()
  {
     return no_prop;
  }
  public void setNo_prop(String no_prop)
  {
     this.no_prop=(no_prop==null) ?"":no_prop;
  }

  public void setNama_prop(String nama_prop )
  {
      this.nama_prop=(nama_prop==null)?"":nama_prop;
  }
  public String getNama_prop()
  {
    return nama_prop;
  }

 public String getTotKab()
 {

  return tot_kab;
 }

public void setTotKab(String tot_kab)
{
  this.tot_kab=(tot_kab==null)?"":tot_kab;
}

}