package pendaftaran;
import java.io.Serializable;
public class GetKelList  implements java.io.Serializable
{
  String no_kab,no_kec,no_kel,nama_kel,no_prop;

  public GetKelList(){}

  public GetKelList(String no_kel,String nama_kel,String no_kec,String no_kab,String no_prop)
  {
    this.no_kel=(no_kel==null) ?"":no_kel;
    this.nama_kel=(nama_kel==null)?"":nama_kel;
    this.no_kec = (no_kec==null)?"":no_kec;
    this.no_kab = (no_kab==null)?"":no_kab;
    this.no_prop = (no_prop==null)?"":no_prop;

  }

  public String getNokel()
   {
     return no_kel;
   }
   public String getNamakel()
  {
    return nama_kel;
  }
  public String getNokec()
  {
    return (no_kec.length() != 2?"0"+no_kec:no_kec);
  }
  public String getNokab()
   {
     return (no_kab.length() != 2?"0"+no_kab:no_kab);
   }
   public String getNoProp()
    {
      return (no_prop.length() != 2?"0"+no_prop:no_prop);
    }


  public void setNokel(String no_kel)
  {
  this.no_kel=(no_kel==null) ?"":no_kel;
  }
  public void setNamakel(String nama_kel )
   {
   this.nama_kel=(nama_kel==null)?"":nama_kel;
   }
}
