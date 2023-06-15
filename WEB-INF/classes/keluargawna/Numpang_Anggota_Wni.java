package keluargawna;

public class Numpang_Anggota_Wni implements java.io.Serializable
{
  String nik,stat_hubun,no_kk_tmpt,als_numpang,nama_lgkp="",nama_kep="";
  String hbkl_old="";
  public Numpang_Anggota_Wni() {
  }

  public Numpang_Anggota_Wni(String stat_hubun,String nik,String no_kk_tmpt,String als_numpang)
    {
      this.stat_hubun=stat_hubun;
      this.nik=nik;
      this.no_kk_tmpt=no_kk_tmpt;
      this.als_numpang=als_numpang;
    }

    public Numpang_Anggota_Wni(String stat_hubun,String nik,String nama_lgkp,String no_kk_tmpt,String nama_kep,String als_numpang)
      {
        this.stat_hubun=stat_hubun;
        this.nik=nik;
        this.no_kk_tmpt=no_kk_tmpt;
        this.als_numpang=als_numpang;
        this.nama_lgkp=nama_lgkp;
        this.nama_kep=nama_kep;
      }

//Get Methods
      public Numpang_Anggota_Wni(String stat_hubun,String nik,String nama_lgkp,String no_kk_tmpt,String nama_kep,String als_numpang,String hbkel_old)
         {
           this.stat_hubun=stat_hubun;
           this.nik=nik;
           this.no_kk_tmpt=no_kk_tmpt;
           this.als_numpang=als_numpang;
           this.nama_lgkp=nama_lgkp;
           this.nama_kep=nama_kep;
           this.hbkl_old= hbkl_old;
         }


public String getOldHbkel()
         {
           return hbkl_old;
         }
  public String getNik()
     {
      return(nik.trim());
     }
  public String getStatHubun()
     {
       return(stat_hubun.trim());
     }

  public String getNokktmpt()
        {
         return(no_kk_tmpt.trim());
        }

   public String getAlsnumpang()
           {
            return(als_numpang.trim());
           }

           public String getNamaLgkp()
                   {
                    return(nama_lgkp.trim());
                   }

                   public String getNamaKep()
                           {
                            return(nama_kep.trim());
                           }


//Set Methods
  public void setNik(String nik)
     {
      this.nik=nik;
     }

  public void  setStatHubun()
     {
      this.stat_hubun=stat_hubun;
     }

   public void  setNokktmpt()
        {
         this.no_kk_tmpt=no_kk_tmpt;
        }

   public void  setAlsnumpang()
    {
            this.als_numpang=als_numpang;
          }

          public void settNamaLgkp()
                  {
                   this.nama_lgkp=nama_lgkp;
                  }

                  public void setNamaKep()
                          {
                          this.nama_kep=nama_kep;
                          }

}