package keluargawna;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class GetKab implements Serializable
{
  String no_kab,nama_kab,no_prop,tot_kec;

 public GetKab(String no_kab,String nama_kab,String no_prop)
 {
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
 }

 public GetKab(String no_kab,String nama_kab,String no_prop,String tot_kec)
 {
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
   this.tot_kec=tot_kec;
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

public String getTotKec()
  {
return    tot_kec;
  }

public void setTotKec(String tot_kec)
  {
   this.tot_kec=(tot_kec==null)?"":tot_kec;
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