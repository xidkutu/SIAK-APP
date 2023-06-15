package keluargawna;

import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class Individu implements Serializable{
  String NIK,NAMA_KLRGA,NAMA_PERTMA,JENIS_KLMIN,TMPT_LHR,TGL_LHR,KWRNGRN;
  String AGAMA,GOL_DRH,STAT_KWN,PDDK_AKH,JENIS_PKRJN,ALAMAT_SPSOR,NO_RT,NO_RW;
  String KODEPOS,TELEPON,DATNG_DARI,TUJUAN_DTNG,NO_PASPOR,TGL_PASPOR,TGL_AKH_PASPOR;
  String NAMA_SPSOR,TIPE_SPSOR,DOK_IMGR,NO_DOK,TMPT_DTBIT,TGL_DTBIT,TGL_AKH_DOK;
  String TMPT_DTNG_PERT,TGL_DTNG_PERT,NO_STLD,TGL_DFT,NAMA_DIN,NAMA_KEP_DIN;
  String NIP_KEP_DIN,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI,NO_KK,NO_PROP,NO_KAB,STAT_HBKEL;
  String DD_TGL_LAHIR,MM_TGL_LAHIR,YY_TGL_LAHIR,DD_TGL_PASPOR,MM_TGL_PASPOR,ALAMAT;
  String YY_TGL_PASPOR,DD_TGL_AKH_PASPOR,MM_TGL_AKH_PASPOR,YY_TGL_AKH_PASPOR,NAMA_KEP;
  String DD_TGL_DTBIT,MM_TGL_DTBIT,YY_TGL_DTBIT,DD_TGL_AKH_DOK,MM_TGL_AKH_DOK,YY_TGL_AKH_DOK;
  String DD_TGL_DTNG_PERT,MM_TGL_DTNG_PERT,YY_TGL_DTNG_PERT,DD_TGL_DFT,MM_TGL_DFT,YY_TGL_DFT;
  String no_kec,  nama_kec, no_kel,  nama_kel,pflag="",cflag="";

public Individu() {}

public Individu(String NIK,String NAMA_KLRGA,String NAMA_PERTMA,String JENIS_KLMIN,
                  String TMPT_LHR,String DD_TGL_LAHIR,String  MM_TGL_LAHIR,String YY_TGL_LAHIR,
                  String KWRNGRN,String AGAMA,String GOL_DRH,String STAT_KWN,String PDDK_AKH,
                  String JENIS_PKRJN,String ALAMAT_SPSOR,String NO_RT,String NO_RW,String KODEPOS,
                  String TELEPON,String DATNG_DARI,String TUJUAN_DTNG,String NO_PASPOR,
                  String DD_TGL_PASPOR,String  MM_TGL_PASPOR,String YY_TGL_PASPOR,
                  String DD_TGL_AKH_PASPOR,String MM_TGL_AKH_PASPOR,String YY_TGL_AKH_PASPOR,
                  String NAMA_SPSOR,String TIPE_SPSOR,String DOK_IMGR,String NO_DOK,String TMPT_DTBIT,
                  String DD_TGL_DTBIT,String MM_TGL_DTBIT,String YY_TGL_DTBIT,String DD_TGL_AKH_DOK,
                  String MM_TGL_AKH_DOK,String YY_TGL_AKH_DOK,String TMPT_DTNG_PERT,
                  String DD_TGL_DTNG_PERT,String MM_TGL_DTNG_PERT,String YY_TGL_DTNG_PERT,
                  String NO_STLD,String DD_TGL_DFT,String MM_TGL_DFT,String YY_TGL_DFT,
                  String NAMA_DIN,String NAMA_KEP_DIN,String NIP_KEP_DIN,String NAMA_PET_ENTRI,
                  String NIP_PET_ENTRI,String TGL_ENTRI,String NO_KK,String NAMA_KEP,String ALAMAT,
                  String STAT_HBKEL, String no_kec, String nama_kec,String no_kel, String nama_kel)
  {
  this.NIK=(NIK==null)?"":NIK;
  this.NAMA_KLRGA=(NAMA_KLRGA==null)?"":NAMA_KLRGA;
  this.NAMA_PERTMA= (NAMA_PERTMA==null)?"":NAMA_PERTMA;
  this.JENIS_KLMIN=(JENIS_KLMIN==null)?"":JENIS_KLMIN;
  this.TMPT_LHR=(TMPT_LHR==null)?"":TMPT_LHR;
  this.DD_TGL_LAHIR=(DD_TGL_LAHIR==null)?"":DD_TGL_LAHIR;
  this.MM_TGL_LAHIR=(MM_TGL_LAHIR==null)?"":MM_TGL_LAHIR;
  this.YY_TGL_LAHIR=(YY_TGL_LAHIR==null)?"":YY_TGL_LAHIR;
  this.KWRNGRN=(KWRNGRN==null)?"":KWRNGRN;
  this.AGAMA=(AGAMA==null)?"":AGAMA;
  this.GOL_DRH=(GOL_DRH==null)?"":GOL_DRH;
  this.STAT_KWN=(STAT_KWN==null)?"":STAT_KWN;
  this.PDDK_AKH=(PDDK_AKH==null)?"":PDDK_AKH;
  this.JENIS_PKRJN=(JENIS_PKRJN==null)?"":JENIS_PKRJN;
  this.ALAMAT_SPSOR=(ALAMAT_SPSOR==null)?"":ALAMAT_SPSOR;
  this.NO_RT=(NO_RT==null)?"":NO_RT;
  this.NO_RW=(NO_RW==null)?"-":NO_RW;
  this.KODEPOS=(KODEPOS==null)?"-":KODEPOS;
  this.TELEPON=(TELEPON==null)?"-":TELEPON;
  this.DATNG_DARI=(DATNG_DARI==null)?"":DATNG_DARI;
  this.TUJUAN_DTNG=(TUJUAN_DTNG==null)?"":TUJUAN_DTNG;
  this.NO_PASPOR=(NO_PASPOR==null)?"":NO_PASPOR;
  this.DD_TGL_PASPOR=(DD_TGL_PASPOR==null)?"":DD_TGL_PASPOR;
  this.MM_TGL_PASPOR=(MM_TGL_PASPOR==null)?"":MM_TGL_PASPOR;
  this.YY_TGL_PASPOR=(YY_TGL_PASPOR==null)?"":YY_TGL_PASPOR;
  this.DD_TGL_AKH_PASPOR=(DD_TGL_AKH_PASPOR==null)?"":DD_TGL_AKH_PASPOR;
  this.MM_TGL_AKH_PASPOR=(MM_TGL_AKH_PASPOR==null)?"":MM_TGL_AKH_PASPOR;
  this.YY_TGL_AKH_PASPOR=(YY_TGL_AKH_PASPOR==null)?"":YY_TGL_AKH_PASPOR;
  this.NAMA_SPSOR=(NAMA_SPSOR==null)?"":NAMA_SPSOR;
  this.TIPE_SPSOR=(TIPE_SPSOR==null)?"":TIPE_SPSOR;
  this.DOK_IMGR=(DOK_IMGR==null)?"":DOK_IMGR;
  this.NO_DOK=(NO_DOK==null)?"":NO_DOK;
  this.TMPT_DTBIT=(TMPT_DTBIT==null)?"":TMPT_DTBIT;
  this.DD_TGL_DTBIT=(DD_TGL_DTBIT==null)?"":DD_TGL_DTBIT;
  this.MM_TGL_DTBIT=(MM_TGL_DTBIT==null)?"":MM_TGL_DTBIT;
  this.YY_TGL_DTBIT=(YY_TGL_DTBIT==null)?"":YY_TGL_DTBIT;
  this.DD_TGL_AKH_DOK=(DD_TGL_AKH_DOK==null)?"":DD_TGL_AKH_DOK;
  this.MM_TGL_AKH_DOK=(MM_TGL_AKH_DOK==null)?"":MM_TGL_AKH_DOK;
  this.YY_TGL_AKH_DOK=(YY_TGL_AKH_DOK==null)?"":YY_TGL_AKH_DOK;
  this.TMPT_DTNG_PERT=(TMPT_DTNG_PERT==null)?"":TMPT_DTNG_PERT;
  this.DD_TGL_DTNG_PERT=(DD_TGL_DTNG_PERT==null)?"":DD_TGL_DTNG_PERT;
  this.MM_TGL_DTNG_PERT=(MM_TGL_DTNG_PERT==null)?"":MM_TGL_DTNG_PERT;
  this.YY_TGL_DTNG_PERT=(YY_TGL_DTNG_PERT==null)?"":YY_TGL_DTNG_PERT;
  this.NO_STLD=(NO_STLD==null)?"-":NO_STLD;
  this.DD_TGL_DFT=(DD_TGL_DFT==null)?"":DD_TGL_DFT;
  this.MM_TGL_DFT=(MM_TGL_DFT==null)?"":MM_TGL_DFT;
  this.YY_TGL_DFT=(YY_TGL_DFT==null)?"":YY_TGL_DFT;
  this.NAMA_DIN=(NAMA_DIN==null)?"":NAMA_DIN;
  this.NAMA_KEP_DIN=(NAMA_KEP_DIN==null)?"":NAMA_KEP_DIN;
  this.NIP_KEP_DIN=(NIP_KEP_DIN==null)?"":NIP_KEP_DIN;
  this.NAMA_PET_ENTRI=(NAMA_PET_ENTRI==null)?"":NAMA_PET_ENTRI;
  this.NIP_PET_ENTRI=(NIP_PET_ENTRI==null)?"":NIP_PET_ENTRI;
  this.TGL_ENTRI=(TGL_ENTRI==null)?"":TGL_ENTRI;
  this.NO_KK=(NO_KK==null)?"":NO_KK;
  this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
  this.ALAMAT=(ALAMAT==null)?"":ALAMAT;
  this.NO_PROP=(NO_PROP==null)?"":NO_PROP;
  this.NO_KAB=(NO_KAB==null)?"":NO_KAB;
  this.STAT_HBKEL=(STAT_HBKEL==null)?"":STAT_HBKEL;

      this.no_kec = no_kec;
      this.nama_kec=nama_kec;
      this.no_kel = no_kel;
      this.nama_kel= nama_kel;
  }


  public Individu(String NIK,String NAMA_KLRGA,String NAMA_PERTMA,String JENIS_KLMIN,
                  String TMPT_LHR,String DD_TGL_LAHIR,String  MM_TGL_LAHIR,String YY_TGL_LAHIR,
                  String KWRNGRN,String AGAMA,String GOL_DRH,String STAT_KWN,String PDDK_AKH,
                  String JENIS_PKRJN,String ALAMAT_SPSOR,String NO_RT,String NO_RW,String KODEPOS,
                  String TELEPON,String DATNG_DARI,String TUJUAN_DTNG,String NO_PASPOR,
                  String DD_TGL_PASPOR,String  MM_TGL_PASPOR,String YY_TGL_PASPOR,
                  String DD_TGL_AKH_PASPOR,String MM_TGL_AKH_PASPOR,String YY_TGL_AKH_PASPOR,
                  String NAMA_SPSOR,String TIPE_SPSOR,String DOK_IMGR,String NO_DOK,String TMPT_DTBIT,
                  String DD_TGL_DTBIT,String MM_TGL_DTBIT,String YY_TGL_DTBIT,String DD_TGL_AKH_DOK,
                  String MM_TGL_AKH_DOK,String YY_TGL_AKH_DOK,String TMPT_DTNG_PERT,
                  String DD_TGL_DTNG_PERT,String MM_TGL_DTNG_PERT,String YY_TGL_DTNG_PERT,
                  String NO_STLD,String DD_TGL_DFT,String MM_TGL_DFT,String YY_TGL_DFT,
                  String NAMA_DIN,String NAMA_KEP_DIN,String NIP_KEP_DIN,String NAMA_PET_ENTRI,
                  String NIP_PET_ENTRI,String TGL_ENTRI,String NO_KK,String NAMA_KEP,String ALAMAT,
                  String STAT_HBKEL, String no_kec, String nama_kec,String no_kel, String nama_kel,String pflag,String cflag)
  {
  this.NIK=(NIK==null)?"":NIK;
  this.NAMA_KLRGA=(NAMA_KLRGA==null)?"":NAMA_KLRGA;
  this.NAMA_PERTMA= (NAMA_PERTMA==null)?"":NAMA_PERTMA;
  this.JENIS_KLMIN=(JENIS_KLMIN==null)?"":JENIS_KLMIN;
  this.TMPT_LHR=(TMPT_LHR==null)?"":TMPT_LHR;
  this.DD_TGL_LAHIR=(DD_TGL_LAHIR==null)?"":DD_TGL_LAHIR;
  this.MM_TGL_LAHIR=(MM_TGL_LAHIR==null)?"":MM_TGL_LAHIR;
  this.YY_TGL_LAHIR=(YY_TGL_LAHIR==null)?"":YY_TGL_LAHIR;
  this.KWRNGRN=(KWRNGRN==null)?"":KWRNGRN;
  this.AGAMA=(AGAMA==null)?"":AGAMA;
  this.GOL_DRH=(GOL_DRH==null)?"":GOL_DRH;
  this.STAT_KWN=(STAT_KWN==null)?"":STAT_KWN;
  this.PDDK_AKH=(PDDK_AKH==null)?"":PDDK_AKH;
  this.JENIS_PKRJN=(JENIS_PKRJN==null)?"":JENIS_PKRJN;
  this.ALAMAT_SPSOR=(ALAMAT_SPSOR==null)?"":ALAMAT_SPSOR;
  this.NO_RT=(NO_RT==null)?"":NO_RT;
  this.NO_RW=(NO_RW==null)?"-":NO_RW;
  this.KODEPOS=(KODEPOS==null)?"-":KODEPOS;
  this.TELEPON=(TELEPON==null)?"-":TELEPON;
  this.DATNG_DARI=(DATNG_DARI==null)?"":DATNG_DARI;
  this.TUJUAN_DTNG=(TUJUAN_DTNG==null)?"":TUJUAN_DTNG;
  this.NO_PASPOR=(NO_PASPOR==null)?"":NO_PASPOR;
  this.DD_TGL_PASPOR=(DD_TGL_PASPOR==null)?"":DD_TGL_PASPOR;
  this.MM_TGL_PASPOR=(MM_TGL_PASPOR==null)?"":MM_TGL_PASPOR;
  this.YY_TGL_PASPOR=(YY_TGL_PASPOR==null)?"":YY_TGL_PASPOR;
  this.DD_TGL_AKH_PASPOR=(DD_TGL_AKH_PASPOR==null)?"":DD_TGL_AKH_PASPOR;
  this.MM_TGL_AKH_PASPOR=(MM_TGL_AKH_PASPOR==null)?"":MM_TGL_AKH_PASPOR;
  this.YY_TGL_AKH_PASPOR=(YY_TGL_AKH_PASPOR==null)?"":YY_TGL_AKH_PASPOR;
  this.NAMA_SPSOR=(NAMA_SPSOR==null)?"":NAMA_SPSOR;
  this.TIPE_SPSOR=(TIPE_SPSOR==null)?"":TIPE_SPSOR;
  this.DOK_IMGR=(DOK_IMGR==null)?"":DOK_IMGR;
  this.NO_DOK=(NO_DOK==null)?"":NO_DOK;
  this.TMPT_DTBIT=(TMPT_DTBIT==null)?"":TMPT_DTBIT;
  this.DD_TGL_DTBIT=(DD_TGL_DTBIT==null)?"":DD_TGL_DTBIT;
  this.MM_TGL_DTBIT=(MM_TGL_DTBIT==null)?"":MM_TGL_DTBIT;
  this.YY_TGL_DTBIT=(YY_TGL_DTBIT==null)?"":YY_TGL_DTBIT;
  this.DD_TGL_AKH_DOK=(DD_TGL_AKH_DOK==null)?"":DD_TGL_AKH_DOK;
  this.MM_TGL_AKH_DOK=(MM_TGL_AKH_DOK==null)?"":MM_TGL_AKH_DOK;
  this.YY_TGL_AKH_DOK=(YY_TGL_AKH_DOK==null)?"":YY_TGL_AKH_DOK;
  this.TMPT_DTNG_PERT=(TMPT_DTNG_PERT==null)?"":TMPT_DTNG_PERT;
  this.DD_TGL_DTNG_PERT=(DD_TGL_DTNG_PERT==null)?"":DD_TGL_DTNG_PERT;
  this.MM_TGL_DTNG_PERT=(MM_TGL_DTNG_PERT==null)?"":MM_TGL_DTNG_PERT;
  this.YY_TGL_DTNG_PERT=(YY_TGL_DTNG_PERT==null)?"":YY_TGL_DTNG_PERT;
  this.NO_STLD=(NO_STLD==null)?"-":NO_STLD;
  this.DD_TGL_DFT=(DD_TGL_DFT==null)?"":DD_TGL_DFT;
  this.MM_TGL_DFT=(MM_TGL_DFT==null)?"":MM_TGL_DFT;
  this.YY_TGL_DFT=(YY_TGL_DFT==null)?"":YY_TGL_DFT;
  this.NAMA_DIN=(NAMA_DIN==null)?"":NAMA_DIN;
  this.NAMA_KEP_DIN=(NAMA_KEP_DIN==null)?"":NAMA_KEP_DIN;
  this.NIP_KEP_DIN=(NIP_KEP_DIN==null)?"":NIP_KEP_DIN;
  this.NAMA_PET_ENTRI=(NAMA_PET_ENTRI==null)?"":NAMA_PET_ENTRI;
  this.NIP_PET_ENTRI=(NIP_PET_ENTRI==null)?"":NIP_PET_ENTRI;
  this.TGL_ENTRI=(TGL_ENTRI==null)?"":TGL_ENTRI;
  this.NO_KK=(NO_KK==null)?"":NO_KK;
  this.NAMA_KEP=(NAMA_KEP==null)?"":NAMA_KEP;
  this.ALAMAT=(ALAMAT==null)?"":ALAMAT;
  this.NO_PROP=(NO_PROP==null)?"":NO_PROP;
  this.NO_KAB=(NO_KAB==null)?"":NO_KAB;
  this.STAT_HBKEL=(STAT_HBKEL==null)?"":STAT_HBKEL;

      this.no_kec = no_kec;
      this.nama_kec=nama_kec;
      this.no_kel = no_kel;
      this.nama_kel= nama_kel;
      this.pflag=pflag;
      this.cflag=cflag;
  }


public String getpflag()
  {
    return pflag;
  }

  public void setpflag(String pflag)
  {
      this.pflag=pflag;
  }
  public String getcflag()
  {
    return cflag;
  }
  public void setcflag()
  {
      this.cflag=cflag;
  }


public void setNo_kec(String no_kec)
  {
   this.no_kec = no_kec;
  }
  public String getNo_kec()
  {
    return no_kec;
  }
  public void setNo_kel(String no_kel)
    {
     this.no_kel = no_kel;
    }
    public String getNo_kel()
    {
      return no_kel;
    }
    public void setNama_kec(String nama_kec)
      {
       this.nama_kec = nama_kec;
      }
      public String getNama_kec()
      {
        return nama_kec;
      }
      public void setNama_kel(String nama_kel)
        {
         this.nama_kel = nama_kel;
        }
        public String getNama_kel()
        {
          return nama_kel;
        }


public String getNik()
 {
  return(NIK);
 }
 public String getNamaKlrga()
  {
   return(NAMA_KLRGA);
  }
public String getNamaPertma()
   {
    return(NAMA_PERTMA);
   }
public String getJnsKlm()
    {
     return(JENIS_KLMIN);
    }
public String getTmpLhr()
     {
      return(TMPT_LHR);
     }
public String getDdTglLhr()
      {
       return(DD_TGL_LAHIR);
      }
public String getMmTglLhr()
            {
             return(MM_TGL_LAHIR);
            }
public String getYyTglLhr()
                  {
                   return(YY_TGL_LAHIR);
                  }

public String getKwrmgr()
       {
        return(KWRNGRN);
       }
public String getAga()
        {
         return(AGAMA);
        }
public String getGolDrh()
         {
          return(GOL_DRH);
         }
public String getStatKwn()
          {
           return(STAT_KWN);
          }
public String getPddlAkh()
           {
            return(PDDK_AKH);
           }
public String getJenisPkrjn()
            {
             return(JENIS_PKRJN);
            }
public String getAlmtSpr()
             {
              return(ALAMAT_SPSOR);
             }
public String getNoRt()
              {
               return(NO_RT);
              }
public String getNoRw()
               {
                return(NO_RW);
               }
public String getKodPos()
                {
                 return(KODEPOS);
                }
public String getTelPon()
                 {
                  return(TELEPON);
                 }
public String getDatngDari()
                  {
                   return(DATNG_DARI);
                  }
public String getTujuanDtng()
                   {
                    return(TUJUAN_DTNG);
                   }
public String getNoPas()
                    {
                     return(NO_PASPOR);
                    }
public String getDdTglPas()
     {
       return(DD_TGL_PASPOR);
    }
public String getMmTglPas()
      {
      return(MM_TGL_PASPOR);
  }
 public String getYyTglPas()
 {
return(YY_TGL_PASPOR);
}

public String getDdTglAkhPas()
                      {
 return(DD_TGL_AKH_PASPOR);
                      }
public String getMmTglAkhPas()
 {
   return(MM_TGL_AKH_PASPOR);
 }

 public String getYyTglAkhPas()
   {
 return(YY_TGL_AKH_PASPOR);
   }

public String getNamaspr()
                       {
                        return(NAMA_SPSOR);
                       }
public String getTipespr()
                        {
                         return(TIPE_SPSOR);
                        }
public String getDokImgr()
                         {
                          return(DOK_IMGR);
                         }
 public String getNodok()
                          {
                           return(NO_DOK);
                          }
public String getTmptDtbt()
       {
                            return(TMPT_DTBIT);
        }
public String getDdTglDtbt()
      {
                             return(DD_TGL_DTBIT);
   }
public String getMmTglDtbt()
    {
                             return(MM_TGL_DTBIT);
    }

public String getYyTglDtbt()
      {
             return(YY_TGL_DTBIT);
    }

public String getDdTglAkhDok()
                             {
                              return(DD_TGL_AKH_DOK);
                             }
public String getMmTglAkhDok()
         {
   return(MM_TGL_AKH_DOK);
  }

public String getYyTglAkhDok()
        {
          return(YY_TGL_AKH_DOK);
   }

 public String getTmptDtngPert()
                              {
                               return(TMPT_DTNG_PERT);
                              }
 public String getDdTglDtngPert()
                               {
                                return(DD_TGL_DTNG_PERT );
                               }
 public String getMmTglDtngPert()
   {
   return(MM_TGL_DTNG_PERT);
     }

  public String getYyTglDtngPert()
      {
   return(YY_TGL_DTNG_PERT);
      }

public String getNoStld()
                                {
                                 return(NO_STLD);
                                }
public String getDdTglDft()
                                 {
                                  return(DD_TGL_DFT );
                                 }
 public String getMmTglDft()
       {
    return(MM_TGL_DFT );
         }

    public String getYyTglDft()
         {
                return(YY_TGL_DFT);
          }

public String getNamaDin()
                                  {
                                   return(NAMA_DIN);
                                  }
public String getNamaKepDin()
                                   {
                                    return(NAMA_KEP_DIN);
                                   }
public String getNipKepDin()
                                    {
                                     return(NIP_KEP_DIN);
                                    }
public String getNamaPetEnt()
                                     {
                                      return(NAMA_PET_ENTRI);
                                     }
public String getNipPetEnt()
                                      {
                                       return(NIP_PET_ENTRI);
                                      }
public String getTglEnt()
                                       {
                                        return(TGL_ENTRI);
                                       }
public String getNoKk()
         {
 return(NO_KK);
 }
 public String getNamaKep()
         {
 return(NAMA_KEP );
 }
 public String getAlamat()
          {
  return(ALAMAT);
  }

public String getNoProp()
      {
                   return(NO_PROP);
 }
public String getNoKab()
{
return(NO_KAB);
}
public String getStatHbkel()
{
return(STAT_HBKEL);
}





public void setNik(String NIK)
    {
   this.NIK=(NIK==null)?"":NIK;
    }
public void setNamaKlrga(String NAMA_KLRGA)
      {
this.NAMA_KLRGA=(NAMA_KLRGA==null)?"":NAMA_KLRGA;
      }
    public void setNamaPertma(String NAMA_PERTMA)
       {
this.NAMA_PERTMA= (NAMA_PERTMA==null)?"":NAMA_PERTMA;
       }
    public void setJnsKlm(String JENIS_KLMIN)
        {
this.JENIS_KLMIN=(JENIS_KLMIN==null)?"":JENIS_KLMIN;
        }
    public void setTmpLhr(String TMPT_LHR)
         {
this.TMPT_LHR=(TMPT_LHR==null)?"":TMPT_LHR;
         }
    public void setTglLhr(String TGL_LHR)
          {
this.TGL_LHR=(TGL_LHR==null)?"":TGL_LHR;
          }
    public void setKwrmgr(String KWRNGRN)
           {
 this.KWRNGRN=(KWRNGRN==null)?"":KWRNGRN;
           }
    public void setAga(String AGAMA)
            {
this.AGAMA=(AGAMA==null)?"":AGAMA;
            }
    public void setGolDrh(String GOL_DRH)
             {
this.GOL_DRH=(GOL_DRH==null)?"":GOL_DRH;
             }
    public void setStatKwn(String STAT_KWN)
              {
this.STAT_KWN=(STAT_KWN==null)?"":STAT_KWN;
              }
    public void setPddlAkh(String PDDK_AKH)
               {
this.PDDK_AKH=(PDDK_AKH==null)?"":PDDK_AKH;
               }
    public void setJenisPkrjn(String JENIS_PKRJN)
                {
this.JENIS_PKRJN=(JENIS_PKRJN==null)?"":JENIS_PKRJN;
                }
    public void setAlmtSpr(String ALAMAT_SPSOR)
                 {
this.ALAMAT_SPSOR=(ALAMAT_SPSOR==null)?"":ALAMAT_SPSOR;
                 }
    public void setNoRt(String NO_RT)
                  {
this.NO_RT=(NO_RT==null)?"":NO_RT;
                  }
    public void setNoRw(String NO_RW)
                   {
this.NO_RW=(NO_RW=="0")?"":NO_RW;
                   }
    public void setKodPos(String KODEPOS)
                    {
this.KODEPOS=(KODEPOS=="0")?"":KODEPOS;
                    }
    public void setTelPon(String TELEPON)
                     {
this.TELEPON=(TELEPON=="0")?"":TELEPON;
                     }
    public void setDatngDari(String DATNG_DARI)
                      {
this.DATNG_DARI=(DATNG_DARI==null)?"":DATNG_DARI;
                      }
    public void setTujuanDtng(String TUJUAN_DTNG)
                       {
this.TUJUAN_DTNG=(TUJUAN_DTNG==null)?"":TUJUAN_DTNG;
                       }
    public void setNoPas(String NO_PASPOR)
                        {
this.NO_PASPOR=(NO_PASPOR==null)?"":NO_PASPOR;
                        }
    public void setTglPas(String TGL_PASPOR)
                         {
this.TGL_PASPOR=(TGL_PASPOR==null)?"":TGL_PASPOR;
                         }
    public void setTglAkhPas(String TGL_AKH_PASPOR)
                          {
this.TGL_AKH_PASPOR=(TGL_AKH_PASPOR==null)?"":TGL_AKH_PASPOR;
                          }
    public void setNamaspr(String NAMA_SPSOR)
                           {
this.NAMA_SPSOR=(NAMA_SPSOR==null)?"":NAMA_SPSOR;
                           }
    public void setTipespr(String TIPE_SPSOR)
                            {
this.TIPE_SPSOR=(TIPE_SPSOR==null)?"":TIPE_SPSOR;
                            }
    public void setDokImgr(String DOK_IMGR)
                             {
this.DOK_IMGR=(DOK_IMGR==null)?"":DOK_IMGR;
                             }
     public void setNodok(String NO_DOK)
                              {
this.NO_DOK=(NO_DOK==null)?"":NO_DOK;
                              }
    public void setTmptDtbt(String TMPT_DTBIT)
                               {
this.TMPT_DTBIT=(TMPT_DTBIT==null)?"":TMPT_DTBIT;
                               }
    public void setTglDtbt(String TGL_DTBIT)
                                {
this.TGL_DTBIT=(TGL_DTBIT==null)?"":TGL_DTBIT;
                                }
    public void setTglAkhDok(String TGL_AKH_DOK)
                                 {
this.TGL_AKH_DOK=(TGL_AKH_DOK==null)?"":TGL_AKH_DOK;
                                 }
     public void setTmptDtngPert(String TMPT_DTNG_PERT)
                                  {
this.TMPT_DTNG_PERT=(TMPT_DTNG_PERT==null)?"":TMPT_DTNG_PERT;
                                  }
     public void setTglDtngPert(String TGL_DTNG_PERT)
                                   {
this.TGL_DTNG_PERT=(TGL_DTNG_PERT==null)?"":TGL_DTNG_PERT;
                                   }
    public void setNoStld(String NO_STLD)
                                    {
this.NO_STLD=(NO_STLD==null)?"":NO_STLD;
                                    }
    public void setTglDft(String TGL_DFT)
                                     {
this.TGL_DFT=(TGL_DFT==null)?"":TGL_DFT;
                                     }
    public void setNamaDin(String NAMA_DIN)
                                      {
this.NAMA_DIN=(NAMA_DIN==null)?"":NAMA_DIN;
                                      }
    public void setNamaKepDin(String NAMA_KEP_DIN)
                                       {
this.NAMA_KEP_DIN=(NAMA_KEP_DIN==null)?"":NAMA_KEP_DIN;
                                       }
    public void setNipKepDin(String NIP_KEP_DIN)
                                        {
this.NIP_KEP_DIN=(NIP_KEP_DIN==null)?"":NIP_KEP_DIN;
                                        }
    public void setNamaPetEnt(String NAMA_PET_ENTRI)
                                         {
this.NAMA_PET_ENTRI=(NAMA_PET_ENTRI==null)?"":NAMA_PET_ENTRI;
                                         }
    public void setNipPetEnt(String NIP_PET_ENTRI)
                                          {
this.NIP_PET_ENTRI=(NIP_PET_ENTRI==null)?"":NIP_PET_ENTRI;
                                          }
    public void setTglEnt(String TGL_ENTRI)
                                           {
this.TGL_ENTRI=(TGL_ENTRI==null)?"":TGL_ENTRI;
                                           }
    public void setNoKk(String NO_KK)
             {
this.NO_KK=(NO_KK==null)?"":NO_KK;
     }
    public void setNoProp(String NO_PROP)
          {
this.NO_PROP=(NO_PROP==null)?"":NO_PROP;
     }
    public void setNoKab(String NO_KAB)
    {
this.NO_KAB=(NO_KAB==null)?"":NO_KAB;
    }
    public void setStatHbkel(String STAT_HBKEL)
    {
this.STAT_HBKEL=(STAT_HBKEL==null)?"":STAT_HBKEL;
    }
}
