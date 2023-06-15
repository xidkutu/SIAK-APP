package keluargawna;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class Individu_sudapunya implements Serializable{
String nik,nama_lgkp,stat_hbkel,no_kk,alamat,no_rt,no_rw,dusun,kode_pos,telp;
String nama_prop="",nama_kab="",nama_kec="",nama_kel="";


public Individu_sudapunya() {}

 public Individu_sudapunya(String nik,String nama_lgkp,String stat_hbkel,String no_kk,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp)
 {
  this.nik=(nik==null)?"":nik;
  this.nama_lgkp=(nama_lgkp==null)?"":nama_lgkp;
  this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
  this.no_kk=(no_kk==null)?"":no_kk;
  this.alamat=(alamat==null)?"":alamat;
  this.no_rt=no_rt;
  this.no_rw=(no_rw==null)?"":no_rw;
  this.dusun=(dusun==null)?"":dusun;
  this.kode_pos=(kode_pos==null)?"":kode_pos;
  this.telp=(telp==null)?"":telp;
  }

 public Individu_sudapunya(String nik,String nama_lgkp,String stat_hbkel,String no_kk,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp,String nama_prop,String nama_kab,String nama_kec,String nama_kel)
  {
   this.nik=(nik==null)?"":nik;
   this.nama_lgkp=(nama_lgkp==null)?"":nama_lgkp;
   this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
   this.no_kk=(no_kk==null)?"":no_kk;
   this.alamat=(alamat==null)?"":alamat;
   this.no_rt=no_rt;
   this.no_rw=(no_rw==null)?"":no_rw;
   this.dusun=(dusun==null)?"":dusun;
   this.kode_pos=(kode_pos==null)?"":kode_pos;
   this.telp=(telp==null)?"":telp;
   this.nama_prop=nama_prop;
   this.nama_kab=nama_kab;
   this.nama_kec=nama_kec;
   this.nama_kel =nama_kel;
   }

public String getNik()
 {
  return(nik);
 }
public String getNamalgkp()
 {
  return(nama_lgkp.toUpperCase());
 }

 public String getStathbkel()
 {
  return(stat_hbkel);
 }

public String getNokk()
  {
   return(no_kk.trim());
  }

public  String getAlamat()
   {
    return(alamat.toUpperCase());
   }
public   String getNort()
    {
     return(no_rt.trim());
    }
public   String getNorw()
     {
      return(no_rw.trim());
     }
public    String getDusun()
      {
       return(dusun.toUpperCase());
      }
public   String getKodepos()
       {
      return(kode_pos.trim());
     }
public   String getTelp()
    {
     return(telp.trim());
   }

   public   String getNamaProp()
       {
        return(nama_prop.trim());
      }

      public   String getNamaKab()
          {
           return(nama_kab.trim());
         }

         public   String getNamaKec()
             {
              return(nama_kec.trim());
            }

 public   String getNamaKel()
     {
                 return(nama_kel.trim());
 }


  public void setNik(String nik)
    {
   this.nik=(nik==null)?"":nik;
    }

   public void setNamalgkp(String nama_lgkp)
    {
   this.nama_lgkp=(nama_lgkp==null)?"":nama_lgkp;
    }

   public void  setStathbkel(String stat_hbkel)
   {
   this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
   }

   public void setNokk(String no_kk)
     {
   this.no_kk=(no_kk==null)?"":no_kk;
     }

   public  void setAlamat(String alamat)
      {
   this.alamat=(alamat==null)?"":alamat;
      }
   public   void setNort(String no_rt)
       {
   this.no_rt=(no_rt==null)?"":no_rt;
       }
   public   void setNorw(String no_rw)
        {
   this.no_rw=(no_rw==null)?"":no_rw;
        }

   public    void setDusun(String dusun)
         {
        this.dusun=(dusun==null)?"":dusun;
         }
   public   void setKodepos(String kode_pos)
          {
        this.kode_pos=(kode_pos==null)?"":kode_pos;
        }
   public void setTelp(String telp)
          {
        this.telp=(telp==null)?"":telp;
      }
}
