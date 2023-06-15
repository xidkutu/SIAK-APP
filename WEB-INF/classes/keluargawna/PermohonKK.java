package keluargawna;

public class PermohonKK  implements java.io.Serializable {
String nik_per,nama_lgkp,no_kk_semula,alamat,no_rt,no_rw,dusun,kode_pos,telp,als_permohn,nama_pet_entri,nip_pet_entri,tgl_entri,no_prop,no_kab,no_kec,no_kel;
String new_kk=null;
java.util.Vector vt_agt;

public PermohonKK(String nik_per,String nama_lgkp,String no_kk_semula,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp,String als_permohn,String nama_pet_entri,String nip_pet_entri,String tgl_entri,String no_prop,String no_kab,String no_kec,String no_kel)
 {
   this.nik_per=(nik_per==null)?"":nik_per;
   this.nama_lgkp=(nama_lgkp==null)?"":nama_lgkp;
   this.no_kk_semula=(no_kk_semula==null)?"":no_kk_semula;
   this.alamat=(alamat==null)?"":alamat;
   this.no_rt=no_rt;
   this.no_rw=(no_rw.equals(""))?"0":no_rw;
   this.dusun=(dusun==null)?"":dusun;
   this.kode_pos=(kode_pos==null)?"0":kode_pos;
   this.telp=(telp==null)?"0":telp;
   this.als_permohn=(als_permohn==null)?"0":als_permohn;
   this.nama_pet_entri=(nama_pet_entri==null)?"":nama_pet_entri;
   this.nip_pet_entri=(nip_pet_entri==null)?"":nip_pet_entri;
   this.tgl_entri=(tgl_entri==null)?"":tgl_entri;
   this.no_prop=no_prop;
   this.no_kab=no_kab;
   this.no_kec=no_kec;
   this.no_kel=no_kel;
  }
 public String getNikPer()
 {
  return(nik_per);
 }
public String getNamalgkp()
 {
  return(nama_lgkp);
 }

public String getNoKKSemula()
  {
   return(no_kk_semula);
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

   public   String getAlsPermohn()
       {
    return(als_permohn);
      }
 public   String getNamaPetEntri()
          {
           return(nama_pet_entri);
         }
  public   String getNipPerEntri()
    {
     return(nip_pet_entri);
   }
   public   String getTglEntri()
  {
   return(tgl_entri);
 }

public String getNoProp()
 {
   return(no_prop);
 }
 public String getNoKab()
 {
   return(no_kab);
 }
 public String getNoKec()
  {
    return(no_kec);
  }
  public String getNoKel()
   {
     return(no_kel);
   }
public String getNewKK()
   {
     return(this.new_kk);
   }

public java.util.Vector getAnggota()
 {
     return(vt_agt);

 }
 public void setNikPer(String nik_per)
  {
this.nik_per=(nik_per==null)?"":nik_per;
  }

 public void setNamalgkp(String nama_lgkp)
  {
 this.nama_lgkp=(nama_lgkp==null)?"":nama_lgkp;
  }

 public void setNoKKSemula(String no_kk_semula)
   {
 this.no_kk_semula=(no_kk_semula==null)?"":no_kk_semula;
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

 public  void setAlsPermohn(String als_permohn)
        {
       this.als_permohn=(als_permohn==null)?"":als_permohn;
       }
 public   void setNamaPetEntri(String nama_pet_entri)
                {
                  this.nama_pet_entri=(nama_pet_entri==null)?"":nama_pet_entri;
               }
 public  void  setNipPetEntri(String nip_pet_entri)
          {
            this.nip_pet_entri=(nip_pet_entri==null)?"":nip_pet_entri;

         }
public   void setTglEntri(String tgl_entri)
        {
            this.tgl_entri=(tgl_entri==null)?"":tgl_entri;
       }

 public void setNoProp(String no_prop)
        {
          this.no_prop=no_prop;
       }
 public void  setNoKab(String no_kab)
        {
          this.no_kab=no_kab;
        }
public void  setNoKec(String no_kec)
         {
           this.no_kec=no_kec;
         }
public void  setNoKel(String no_kel)
          {
            this.no_kel=no_kel;
          }
public void setAngotta(java.util.Vector vt_agt)
       {
         this.vt_agt=vt_agt;
       }
public void  setNewKK(String new_kk)
      {
    this.new_kk=(new_kk==null)?"":new_kk;
      }
}
