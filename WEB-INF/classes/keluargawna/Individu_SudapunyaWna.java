package keluargawna;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class Individu_SudapunyaWna implements Serializable{
String nik="",NAMA_PERTMA="",stat_hbkel="",no_kk="",alamat="",no_rt="",no_rw="",dusun="",kode_pos="",telp="";
String NO_PROP="",NO_KAB="",NO_KEC="",NO_KEL="",NAMA_PROP="",NAMA_KAB="",NAMA_KEC="",NAMA_KEL="",NAMA_KEP="";
String JENIS_KLMIN="",KWRNGRN="";
String kec_jabatan="",kec_nama_pej="",kec_nip_pej="",kel_jabatan="",kel_nama_lur="",kel_nip_lur="";
String nama_kep_lma="",nik_kep_lma="";
int umur=0,stat_kwn=0;

public Individu_SudapunyaWna() {}

 public Individu_SudapunyaWna(String nik,
                              String NAMA_PERTMA,
                              String stat_hbkel,String no_kk,
                              String NAMA_KEP,
                              String alamat,
                              String no_rt,String no_rw,
                              String dusun,String kode_pos,String telp,
                              String NO_PROP,String NO_KAB,String NO_KEC,
                              String NO_KEL,String NAMA_PROP,
                              String NAMA_KAB,String NAMA_KEC,String NAMA_KEL,int umur,int stat_kwn)
 {
  this.nik=(nik==null)?"":nik;
  this.NAMA_PERTMA=(NAMA_PERTMA==null)?"":NAMA_PERTMA;
  this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
  this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
  this.no_kk=(no_kk==null)?"":no_kk;
  this.alamat=(alamat==null)?"":alamat;
  this.no_rt=no_rt;
  this.no_rw=(no_rw==null)?"0":no_rw;
  this.dusun=(dusun==null)?"0":dusun;
  this.kode_pos=(kode_pos==null)?"":kode_pos;
  this.telp=(telp==null)?"":telp;

  this.NO_PROP=(NO_PROP==null)?"0":NO_PROP;
  this.NO_KAB=(NO_KAB==null)?"0":NO_KAB;
  this.NO_KEC=(NO_KEC==null)?"0":NO_KEC;
  this.NO_KEL=(NO_KEL==null)?"0":NO_KEL;

  this.NAMA_PROP=(NAMA_PROP==null)?"":NAMA_PROP;
  this.NAMA_KAB=(NAMA_KAB==null)?"":NAMA_KAB;
  this.NAMA_KEC=(NAMA_KEC==null)?"":NAMA_KEC;
  this.NAMA_KEL=(NAMA_KEL==null)?"":NAMA_KEL;
  this.umur=umur;
  this.stat_kwn=stat_kwn;
   }

  public Individu_SudapunyaWna(String nik,String NAMA_PERTMA,String JENIS_KLMIN,
                               String KWRNGRN,String stat_hbkel,String no_kk,String NAMA_KEP,
                               String alamat,String no_rt,String no_rw,String dusun,
                               String kode_pos,String telp,String NO_PROP,String NO_KAB,
                               String NO_KEC,String NO_KEL,String NAMA_PROP,String NAMA_KAB,
                               String NAMA_KEC,String NAMA_KEL)
 {
  this.nik=(nik==null)?"":nik;
  this.NAMA_PERTMA=(NAMA_PERTMA==null)?"":NAMA_PERTMA;
  this.JENIS_KLMIN=(JENIS_KLMIN==null)?"":JENIS_KLMIN;
  this.KWRNGRN=(KWRNGRN==null)?"":KWRNGRN;
  this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
  this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
  this.no_kk=(no_kk==null)?"":no_kk;
  this.alamat=(alamat==null)?"":alamat;
  this.no_rt=no_rt;
  this.no_rw=(no_rw==null)?"0":no_rw;
  this.dusun=(dusun==null)?"0":dusun;
  this.kode_pos=(kode_pos==null)?"":kode_pos;
  this.telp=(telp==null)?"":telp;

  this.NO_PROP=(NO_PROP==null)?"0":NO_PROP;
  this.NO_KAB=(NO_KAB==null)?"0":NO_KAB;
  this.NO_KEC=(NO_KEC==null)?"0":NO_KEC;
  this.NO_KEL=(NO_KEL==null)?"0":NO_KEL;

  this.NAMA_PROP=(NAMA_PROP==null)?"":NAMA_PROP;
  this.NAMA_KAB=(NAMA_KAB==null)?"":NAMA_KAB;
  this.NAMA_KEC=(NAMA_KEC==null)?"":NAMA_KEC;
  this.NAMA_KEL=(NAMA_KEL==null)?"":NAMA_KEL;
  }

   public Individu_SudapunyaWna(String nik,String NAMA_PERTMA,String JENIS_KLMIN,
                               String KWRNGRN,String stat_hbkel,String no_kk,String NAMA_KEP,
                               String alamat,String no_rt,String no_rw,String dusun,String kode_pos,
                               String telp,String NO_PROP,String NO_KAB,String NO_KEC,String NO_KEL,
                               String NAMA_PROP,String NAMA_KAB,String NAMA_KEC,String NAMA_KEL,
                               String kec_jabatan,String kec_nama_pej,String kec_nip_pej,
                               String kel_jabatan,String kel_nama_lur,String kel_nip_lur)
 {
  this.nik=(nik==null)?"":nik;
  this.NAMA_PERTMA=(NAMA_PERTMA==null)?"":NAMA_PERTMA;
  this.JENIS_KLMIN=(JENIS_KLMIN==null)?"":JENIS_KLMIN;
  this.KWRNGRN=(KWRNGRN==null)?"":KWRNGRN;
  this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
  this.stat_hbkel= (stat_hbkel==null)?"":stat_hbkel;
  this.no_kk=(no_kk==null)?"":no_kk;
  this.alamat=(alamat==null)?"":alamat;
  this.no_rt=(no_rt==null)?"-":no_rt;
  this.no_rw=(no_rw==null)?"-":no_rw;
  this.dusun=(dusun==null)?"-":dusun;
  this.kode_pos=(kode_pos==null)?"":kode_pos;
  this.telp=(telp==null)?"":telp;

  this.NO_PROP=(NO_PROP==null)?"0":NO_PROP;
  this.NO_KAB=(NO_KAB==null)?"0":NO_KAB;
  this.NO_KEC=(NO_KEC==null)?"0":NO_KEC;
  this.NO_KEL=(NO_KEL==null)?"0":NO_KEL;

  this.NAMA_PROP=(NAMA_PROP==null)?"":NAMA_PROP;
  this.NAMA_KAB=(NAMA_KAB==null)?"":NAMA_KAB;
  this.NAMA_KEC=(NAMA_KEC==null)?"":NAMA_KEC;
  this.NAMA_KEL=(NAMA_KEL==null)?"":NAMA_KEL;

  this.kec_jabatan= (kec_jabatan==null)?"":kec_jabatan;
  this.kec_nama_pej=(kec_nama_pej==null)?"":kec_nama_pej;
  this.kec_nip_pej=(kec_nip_pej==null)?"":kec_nip_pej;
  this.kel_jabatan=(kel_jabatan==null)?"":kel_jabatan;
  this.kel_nama_lur=(kel_nama_lur==null)?"":kel_nama_lur;
  this.kel_nip_lur=(kel_nip_lur==null)?"":kel_nip_lur;
  }

public int getUmur()
  {
    return umur;
  }
public void setUmur(int umur)
  {
    this.umur=umur;
  }
public int getStatKwn()
  {
    return stat_kwn;
  }
public void setStatKwn(int stat_kwn)
  {
    this.stat_kwn=stat_kwn;
  }

public String getNik()
 {
  return(nik);
 }
public String getNamapra()
 {
  return(NAMA_PERTMA);
 }
 public String getJenisKlmin()
 {
  return(JENIS_KLMIN);
 }
 public String getKwrngrn()
  {
   return(KWRNGRN);
  }
 public String getNamaKep()
  {
   return(NAMA_KEP);
  }

 public String getStathbkel()
 {
  return(stat_hbkel);
 }

public String getNokk()
  {
   return(no_kk);
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
public   String getNoPro()
       {
        return(NO_PROP);
      }
public   String getNoKab()
          {
           return(NO_KAB);
         }
public   String getNoKec()
             {
              return(NO_KEC);
            }
public   String getNoKel()
                {
                 return(NO_KEL);
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

public String getKecJabatan()
       {
         return(kec_jabatan);
       }


       public String getKecNamaPej()
              {
                return(kec_nama_pej);
              }

              public String getKecNipPej()
                     {
                       return(kec_nip_pej);
                     }

                     public String getKelJabatan()
                            {
                              return(kel_jabatan);
                            }

                            public String getKelNamaLur()
                                   {
                                     return(kel_nama_lur);
                                   }

                                   public String getKelNipLur()
                                          {
                                            return(kel_nip_lur);
                                          }
                                     public String getNikKepLama()
                                            {
                                                     return(nik_kep_lma);
                                            }
                                                  public String getNamaKepLama()
                                                               {
                                                           return(nama_kep_lma);
                                                               }

                                       public void setNikKepLama(String nik_lma)
                                              {
                                             this.nik_kep_lma=(nik_lma==null)?"":nik_lma;
                                              }

                                              public void setNamaKepLama(String nama_lma)
                                                  {
                                                 this.nama_kep_lma=(nama_lma==null)?"":nama_lma;
                                                  }

public void setNik(String nik)
    {
   this.nik=(nik==null)?"":nik;
    }

public void setNamapra(String NAMA_PERTMA)
    {
   this.NAMA_PERTMA=(NAMA_PERTMA==null)?"":NAMA_PERTMA;
    }
public void setNamaKep(String NAMA_KEP)
      {
this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
      }
public void setJenisKlmin(String JENIS_KLMIN)
          {
this.JENIS_KLMIN=(JENIS_KLMIN==null)?"":JENIS_KLMIN;
          }
public void setKwrngrn(String KWRNGRN)
              {
  this.KWRNGRN=(KWRNGRN==null)?"":KWRNGRN;
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

public void setNoPro(String NO_PROP)
                {
              this.NO_PROP=(NO_PROP==null)?"":NO_PROP;
            }
public void setNoKab(String NO_KAB)
    {
 this.NO_KAB=(NO_KAB==null)?"":NO_KAB;
  }
public void setNoKec(String NO_KEC)
    {
    this.NO_KEC=(NO_KEC==null)?"":NO_KEC;
       }
public void setNoKel(String NO_KEL)
        {
        this.NO_KEL=(NO_KEL==null)?"":NO_KEL;
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

                   public void  setKecJabatan()
                             {
                               this.kec_jabatan= (kec_jabatan==null)?"":kec_jabatan;
                             }

                           public void setKecNamaPej()
                                    {
                                      this.kec_nama_pej=(kec_nama_pej==null)?"":kec_nama_pej;
                                    }

                                    public void setKecNipPej()
                                           {
                                             this.kec_nip_pej=(kec_nip_pej==null)?"":kec_nip_pej;
                                           }

                                           public void setKelJabatan()
                                                  {
                                                    this.kel_jabatan=(kel_jabatan==null)?"":kel_jabatan;
                                                  }

                                                  public void setKelNamaLur()
                                                         {
                                                           this.kel_nama_lur=(kel_nama_lur==null)?"":kel_nama_lur;
                                                         }

                                                         public void setKelNipLur()
                                                                {
                                                           this.kel_nip_lur=(kel_nip_lur==null)?"":kel_nip_lur;
                                                                }



}
