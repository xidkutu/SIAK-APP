package keluargawna;

  public class PermohonKK_Wna  implements java.io.Serializable {
  String nik_per,NAMA_PRA,no_kk_semula,alamat,no_rt,no_rw,dusun,kode_pos,telp;
  String als_permohn,ndin,nkdin,nkedin,nama_pet_entri,nip_pet_entri,tgl_entri,no_prop,no_kab,no_kec,no_kel;
  String new_kk=null;
  String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
  java.util.Vector vt_agt;

  public PermohonKK_Wna(String nik_per,String NAMA_PRA,String no_kk_semula,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp,String als_permohn,String ndin,String nkdin,String nkedin,String nama_pet_entri,String nip_pet_entri,String tgl_entri,String no_prop,String no_kab,String no_kec,String no_kel)
   {
     this.nik_per=(nik_per==null)?"":nik_per;
     this.NAMA_PRA=(NAMA_PRA==null)?"":NAMA_PRA;
     this.no_kk_semula=(no_kk_semula==null)?"":no_kk_semula;
     this.alamat=(alamat==null)?"":alamat;
     this.no_rt=no_rt;
     this.no_rw=(no_rw.equals(""))?"0":no_rw;
     this.dusun=(dusun==null)?"-":dusun;
     this.kode_pos=(kode_pos==null)?"0":kode_pos;
     this.telp=(telp==null)?"0":telp;
     this.als_permohn=(als_permohn==null)?"0":als_permohn;
     this.ndin=(ndin==null)?"":ndin;
     this.nkdin=(nkdin==null)?"":nkdin;
     this.nkedin=(nkedin==null)?"0":nkedin;
     this.nama_pet_entri=(nama_pet_entri==null)?"":nama_pet_entri;
     this.nip_pet_entri=(nip_pet_entri==null)?"":nip_pet_entri;
     this.tgl_entri=(tgl_entri==null)?"":tgl_entri;
     this.no_prop=no_prop;
     this.no_kab=no_kab;
     this.no_kec=no_kec;
     this.no_kel=no_kel;
    }

  public PermohonKK_Wna(String nik_per,String NAMA_PRA,String no_kk_semula,String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp,String als_permohn,String ndin,String nkdin,String nkedin,String nama_pet_entri,String nip_pet_entri,String tgl_entri,String no_prop,String no_kab,String no_kec,String no_kel,String nama_prop,String nama_kab,String nama_kec,String nama_kel)
 {
   this.nik_per=(nik_per==null)?"":nik_per;
   this.NAMA_PRA=(NAMA_PRA==null)?"":NAMA_PRA;
   this.no_kk_semula=(no_kk_semula==null)?"":no_kk_semula;
   this.alamat=(alamat==null)?"":alamat;
   this.no_rt=no_rt;
   this.no_rw=(no_rw.equals(""))?"0":no_rw;
   this.dusun=(dusun==null)?"-":dusun;
   this.kode_pos=(kode_pos==null)?"0":kode_pos;
   this.telp=(telp==null)?"0":telp;
   this.als_permohn=(als_permohn==null)?"0":als_permohn;
   this.ndin=(ndin==null)?"":ndin;
   this.nkdin=(nkdin==null)?"":nkdin;
   this.nkedin=(nkedin==null)?"0":nkedin;
   this.nama_pet_entri=(nama_pet_entri==null)?"":nama_pet_entri;
   this.nip_pet_entri=(nip_pet_entri==null)?"":nip_pet_entri;
   this.tgl_entri=(tgl_entri==null)?"":tgl_entri;
   this.no_prop=no_prop;
   this.no_kab=no_kab;
   this.no_kec=no_kec;
   this.no_kel=no_kel;
   this.nama_prop=nama_prop;
   this.nama_kab=nama_kab;
   this.nama_kec=nama_kec;
   this.nama_kel=nama_kel;

  }
public String getNamaProp()
  {
    return nama_prop;
  }

  public String getNamaKab()
  {
    return nama_kab;
  }

  public String getNamaKec()
  {
    return nama_kec;
  }
  public String getNamaKel()
    {

      return nama_kel;
    }

    public void setNamaProp(String nama_prop)
      {
        this.nama_prop=nama_prop;
      }

      public void setNamaKab(String nama_kab)
      {
        this.nama_kab=nama_kab;
      }
      public void setNamaKec(String nama_kec)
      {
        this.nama_kec=nama_kec;

      }
      public void setNamaKel(String nama_kel)
        {

        this.nama_kel=nama_kel;
        }


   public String getNikPer()
   {
    return(nik_per);
   }
  public String getNamaPra()
   {
    return(NAMA_PRA);
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

  public   String getNdin()
               {
            return(ndin);
              }

   public   String getNkDin()
                     {
                  return(nkdin);
                    }

   public   String getNkeDin()
                           {
                        return(nkedin);
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

   public void setNamaPra(String NAMA_PRA)
    {
   this.NAMA_PRA=(NAMA_PRA==null)?"":NAMA_PRA;
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
    public  void setNDin(String ndin)
                 {
                  this.ndin=(ndin==null)?"":ndin;
                }
   public  void setNkDin(String nkdin)
                        {
                       this.nkdin=(nkdin==null)?"":nkdin;
                       }
   public  void setNkeDin(String nkedin)
                               {
                              this.nkedin=(nkedin==null)?"0":nkedin;
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