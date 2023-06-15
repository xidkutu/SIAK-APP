package keluargawna;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company:Pt Cyber </p>
 * @author not attributable
 * @version 1.0
 */

public class GetProp implements Serializable
{
 String no_prop,nama_prop,tot_kab;

 public GetProp(String no_prop,String nama_prop)
 {
   this.no_prop=(no_prop==null) ?"":no_prop;
   this.nama_prop=(nama_prop==null)?"":nama_prop;
 }

 public GetProp(String no_prop,String nama_prop,String tot_kab)
 {
   this.no_prop=(no_prop==null) ?"":no_prop;
   this.nama_prop=(nama_prop==null)?"":nama_prop;
   this.tot_kab=tot_kab;
 }

 public String getNoprop()
  {
    return no_prop;
  }

 public String getNamaprop()
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

 public void setNoprop(String no_prop)
 {
 this.no_prop=(no_prop==null) ?"":no_prop;
 }
 public void setNamaprop(String nama_prop )
  {
  this.nama_prop=(nama_prop==null)?"":nama_prop;
  }
}