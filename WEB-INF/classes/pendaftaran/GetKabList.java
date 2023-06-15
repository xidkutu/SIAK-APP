package pendaftaran;
import java.io.Serializable;
public class GetKabList  implements java.io.Serializable
{
  String no_kab,nama_kab,no_prop;
public GetKabList(){}
 public GetKabList(String no_kab,String nama_kab,String no_prop)
 {
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.no_prop=(no_prop==null)?"":no_prop;
 }

 public String getNokab()
  {
    return (no_kab.length() != 2?"0"+no_kab:no_kab);
  }
  public String getNamakab()
 {
   return nama_kab;
 }

 public String getNoProp()
  {
    return no_prop;
  }
}
