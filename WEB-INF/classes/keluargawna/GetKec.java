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

public class GetKec implements Serializable
{
  String no_prop,no_kab,no_kec,nama_kec,NAMA_PEJ, NIP_PEJ,tot_kel;
  public GetKec(String no_kec,String nama_kec,String no_kab,String no_prop)
 {
   this.no_kec=(no_kec==null) ?"":no_kec;
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   this.no_kab=(no_kab==null) ?"":no_kab;
   this.no_prop=(no_prop==null) ?"":no_prop;
 }
 public GetKec(String no_kec,String nama_kec,String no_kab,String no_prop,String NAMA_PEJ,String NIP_PEJ)
  {
    this.no_kec=(no_kec==null) ?"":no_kec;
    this.nama_kec=(nama_kec==null)?"":nama_kec;
    this.no_kab=(no_kab==null) ?"":no_kab;
    this.no_prop=(no_prop==null) ?"":no_prop;
    this.NAMA_PEJ=(NAMA_PEJ==null) ?"":NAMA_PEJ;
    this.NIP_PEJ=(NIP_PEJ==null) ?"":NIP_PEJ;
  }


  public GetKec(String no_kec,String nama_kec,String no_kab,String no_prop,String NAMA_PEJ,String NIP_PEJ,String tot_kel)
   {
     this.no_kec=(no_kec==null) ?"":no_kec;
     this.nama_kec=(nama_kec==null)?"":nama_kec;
     this.no_kab=(no_kab==null) ?"":no_kab;
     this.no_prop=(no_prop==null) ?"":no_prop;
     this.NAMA_PEJ=(NAMA_PEJ==null) ?"":NAMA_PEJ;
     this.NIP_PEJ=(NIP_PEJ==null) ?"":NIP_PEJ;
     this.tot_kel=tot_kel;
   }




 public String getNokec()
  {
    return no_kec;
  }
  public String getNamakec()
 {
   return nama_kec;
 }
 public String getNoKab()
  {
    return no_kab;
  }

  public String getNoProp()
    {
      return no_prop;
    }
  public String getNama_Pej()
      {
        return NAMA_PEJ;
      }

public String getNipPej()
          {
            return NIP_PEJ;
          }
public String getTotKel()
          {
                return tot_kel;
          }

 public void setTotKel(String tot_kel)
          {
  this.tot_kel=(tot_kel==null)?"":tot_kel;
          }

public void setNokec(String no_kec)
 {
 this.no_kec=(no_kec==null) ?"":no_kec;
 }
 public void setNamakec(String nama_kec )
  {
  this.nama_kec=(nama_kec==null)?"":nama_kec;
  }
 public void setNoKab(String no_kab)
   {
   this.no_kab=(no_kab==null) ?"":no_kab;
   }
 public void setNoProp(String no_prop)
    {
   this.no_prop=(no_prop==null) ?"":no_prop;
    }
  public void setNamaPej(String NAMA_PEJ)
      {
  this.NAMA_PEJ=(NAMA_PEJ==null) ?"":NAMA_PEJ;
      }
 public void setNipPej(String NIP_PEJ)
      {

    this.NIP_PEJ=(NIP_PEJ==null) ?"":NIP_PEJ;
      }



}