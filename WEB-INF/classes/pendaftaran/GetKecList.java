package pendaftaran;
import java.io.Serializable;
public class GetKecList  implements java.io.Serializable
{
  String no_kab,no_kec,nama_kec,no_prop;
  public GetKecList(){}
 public GetKecList(String no_kec,String nama_kec,String no_kab,String no_prop)
 {
   this.no_kec=(no_kec==null) ?"":no_kec;
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.no_prop=(no_prop==null)?"":no_prop;
 }

 public String getNokec()
  {
    return (no_kec.length() != 2?"0"+no_kec:no_kec);
  }
  public String getNamakec()
 {
   return nama_kec;
 }
 public String getNokab()
  {
    return (no_kab.length() != 2?"0"+no_kab:no_kab);
  }
  public String getNoProp()
   {
     return (no_prop.length() != 2?"0"+no_prop:no_prop);
   }

}
