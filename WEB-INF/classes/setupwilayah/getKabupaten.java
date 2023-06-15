package setupwilayah;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class getKabupaten implements Serializable
{
  public getKabupaten() {
  }
  String no_kab,nama_kab,no_prop;
   public getKabupaten(String no_kab,String nama_kab,String no_prop)
   {
     this.no_kab=(no_kab==null) ?"":no_kab;
     this.nama_kab=(nama_kab==null)?"":nama_kab;
     this.no_prop=(no_prop==null) ?"":no_prop;
   }

   public String getNokab()
    {
      return no_kab;
    }
    public String getNamakab()
   {
     return nama_kab;
   }
   public String getNoProp()
    {
      return no_prop;
    }


   public void setNokab(String no_kab)
   {
   this.no_kab=(no_kab==null) ?"":no_kab;
   }
   public void setNamakab(String nama_kab )
    {
    this.nama_kab=(nama_kab==null)?"":nama_kab;
    }
    public void setNoProp(String no_prop)
   {
   this.no_prop=(no_prop==null) ?"":no_prop;
   }

}
