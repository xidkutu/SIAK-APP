package keluargawna;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class List_Perpindahan implements Serializable {
  String nik,NAMA_LGKP,stat_hbkel,no_kk,NAMA_KEP,alamat,no_rt,no_rw,dusun,kode_pos,telp;
  String NAMA_PROP,NAMA_KAB,NAMA_KEC,NAMA_KEL;



public List_Perpindahan() {}

 public List_Perpindahan(String nik,String NAMA_LGKP,String stat_hbkel,String no_kk,String NAMA_KEP,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp,String NAMA_PROP,String NAMA_KAB,String NAMA_KEC,String NAMA_KEL)
 {
  this.nik=(nik==null)?"":nik;
  this.NAMA_LGKP=(NAMA_LGKP==null)?"":NAMA_LGKP;
  this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
  this.no_kk=(no_kk==null)?"":no_kk;
  this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
  this.alamat=(alamat==null)?"":alamat;
  this.no_rt=no_rt;
  this.no_rw=(no_rw==null)?"":no_rw;
  this.dusun=(dusun==null)?"":dusun;
  this.kode_pos=(kode_pos==null)?"":kode_pos;
  this.telp=(telp==null)?"":telp;

  this.NAMA_PROP=(NAMA_PROP==null)?"":NAMA_PROP;
  this.NAMA_KAB=(NAMA_KAB==null)?"":NAMA_KAB;
  this.NAMA_KEC=(NAMA_KEC==null)?"":NAMA_KEC;
  this.NAMA_KEL=(NAMA_KEL==null)?"":NAMA_KEL;
  }

public String getNik()
 {
  return(nik);
 }
public String getNamalgkp()
 {
  return(NAMA_LGKP);
 }

 public String getStathbkel()
 {
  return(stat_hbkel);
 }

public String getNokk()
  {
   return(no_kk);
  }
  public String getNamakep()
   {
    return(NAMA_KEP);
   }

public  String getAlamat()
   {
    return(alamat);
   }
public   String getNort()
    {
     return(no_rt);
    }
public   String getNorw()
     {
      return(no_rw);
     }
public    String getDusun()
      {
       return(dusun);
      }
public   String getKodepos()
       {
      return(kode_pos);
     }
public   String getTelp()
    {
     return(telp);
   }

public String getNamaPro()
    {
     return(NAMA_PROP);
    }
public String getNamaKab()
     {
      return(NAMA_KAB);
     }
public String getNamaKec()
      {
       return(NAMA_KEC);
      }
public String getNamaKel()
       {
        return(NAMA_KEL);
       }



public void setNik(String nik)
    {
   this.nik=(nik==null)?"":nik;
    }

public void setNamalgkp(String NAMA_LGKP)
    {
   this.NAMA_LGKP=(NAMA_LGKP==null)?"":NAMA_LGKP;
    }

   public void  setStathbkel(String stat_hbkel)
   {
   this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
   }

   public void setNokk(String no_kk)
     {
   this.no_kk=(no_kk==null)?"":no_kk;
     }
     public void setNamakep(String NAMA_KEP)
         {
       this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
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


public void setNamaPro(String NAMA_PROP)
          {
         this.NAMA_PROP=(NAMA_PROP==null)?"":NAMA_PROP;
          }
public void setNamaKab(String NAMA_KAB)
              {
             this.NAMA_KAB=(NAMA_KAB==null)?"":NAMA_KAB;
              }
public void setNamaKec(String NAMA_KEC)
                  {
                  this.NAMA_KEC=(NAMA_KEC==null)?"":NAMA_KEC;
                  }
public void setNamaKel(String NAMA_KEL)
                      {
                    this.NAMA_KEL=(NAMA_KEL==null)?"":NAMA_KEL;
                      }

}