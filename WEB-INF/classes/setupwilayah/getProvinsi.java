package setupwilayah;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company:Pt Cyber </p>
 * @author not attributable
 * @version 1.0
 */

public class getProvinsi implements Serializable
{
  public getProvinsi() {
  }
  String no_prop,nama_prop;
   public getProvinsi(String no_prop,String nama_prop)
   {
     this.no_prop=(no_prop==null) ?"":no_prop;
     this.nama_prop=(nama_prop==null)?"":nama_prop;
   }

   public String getNoprop()
    {
      return no_prop;
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
