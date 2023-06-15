package pendaftaran;

import java.io.Serializable;
public class GetPropList implements java.io.Serializable
{
 String no_prop,nama_prop;
 public GetPropList(){}
 public GetPropList(String no_prop,String nama_prop)
 {
   this.no_prop=(no_prop==null) ?"":no_prop;
   this.nama_prop=(nama_prop==null)?"":nama_prop;
 }

 public String getNoprop()
  {
    return (no_prop.length() != 2?"0"+no_prop:no_prop);
  }
  public String getNamaprop()
 {
   return nama_prop;
 }

 public void setNoprop(String no_prop)
 {
 this.no_prop=(no_prop==null) ?"":no_prop;
 }
 public void setNamaprop(String nama_prop )
  {
  this.nama_prop=(nama_prop==null)?"":nama_prop;
  }
}
