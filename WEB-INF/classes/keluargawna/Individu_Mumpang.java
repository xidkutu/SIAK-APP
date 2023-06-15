package keluargawna;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class Individu_Mumpang implements Serializable
{
  String nik,nama_lgkp,stat_hbkel,no_kk,nama_kep,alamat,no_rt,no_rw,dusun,kode_pos,telp;



public Individu_Mumpang() {}

 public Individu_Mumpang(String nik,String nama_lgkp,String stat_hbkel,String no_kk,String nama_kep,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp)
 {
  this.nik=(nik==null)?"":nik;
  this.nama_lgkp=(nama_lgkp==null)?"":nama_lgkp;
  this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
  this.no_kk=(no_kk==null)?"":no_kk;
  this.nama_kep=(nama_kep==null)?"":nama_kep;
  this.alamat=(alamat==null)?"":alamat;
  this.no_rt=(no_rt==null)?"":no_rt;
  this.no_rw=(no_rw==null)?"":no_rw;
  this.dusun=(dusun==null)?"":dusun;
  this.kode_pos=(kode_pos==null)?"":kode_pos;
  this.telp=(telp==null)?"":telp;
  }

public String getNik()
 {
  return(nik.trim());
 }
public String getNamalgkp()
 {
  return(nama_lgkp.trim().toUpperCase());
 }

 public String getStathbkel()
 {
  return(stat_hbkel.trim());
 }

public String getNokk()
  {
   return(no_kk.trim());
  }
  public String getNamaKep()
    {
     return(nama_kep.trim().toUpperCase());
    }

public  String getAlamat()
   {
    return(alamat.trim().toUpperCase());
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
       return(dusun.trim().toUpperCase());
      }
public   String getKodepos()
       {
      return(kode_pos.trim());
     }
public   String getTelp()
    {
     return(telp.trim());
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
     public void setNamaKep(String nama_kep)
     {
       this.nama_kep=(nama_kep==null)?"":nama_kep;
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
