package keluargawna;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class pinda_num_suda implements Serializable
{
  String NO_KK_LMA,NAMA_KEPALA_LMA,RENC_TGL,ALMT_LMA,ALMT_RT_LMA,ALMT_RW_LMA,DUSUN_LMA,ALMT_KODEPOS_LMA,ALMT_TELP_LMA,NAMA_CMAT_LMA,NAMA_LUR_LMA,NAMA_PET_LMA,NIP_PET_LMA,TGL_ENTRI_LMA,NO_KK_BRU,NAMA_CAMAT_BRU,NAMA_LUR_BRU,NAMA_PET_BRU,NIP_PET_BRU,TGL_ENTRI_BRU,TGL_DTNG;
  java.util.Vector col_rec;
  public pinda_num_suda() {
  }
  public pinda_num_suda(String NO_KK_LMA,String NAMA_KEPALA_LMA,String RENC_TGL,String ALMT_LMA,String ALMT_RT_LMA,String ALMT_RW_LMA,String DUSUN_LMA,String ALMT_KODEPOS_LMA,String ALMT_TELP_LMA,String NAMA_CMAT_LMA,String NAMA_LUR_LMA,String NAMA_PET_LMA,String NIP_PET_LMA,String TGL_ENTRI_LMA,String NO_KK_BRU,String NAMA_CAMAT_BRU,String NAMA_LUR_BRU,String NAMA_PET_BRU,String NIP_PET_BRU,String TGL_ENTRI_BRU,String TGL_DTNG)
  {
this.NO_KK_LMA=(NO_KK_LMA==null)?"":NO_KK_LMA;
this.NAMA_KEPALA_LMA=(NAMA_KEPALA_LMA==null)?"":NAMA_KEPALA_LMA;
this.RENC_TGL=(RENC_TGL==null)?"":RENC_TGL;
this.ALMT_LMA=(ALMT_LMA==null)?"":ALMT_LMA;
this.ALMT_RT_LMA=(ALMT_RT_LMA==null)?"":ALMT_RT_LMA;
this.ALMT_RW_LMA=(ALMT_RW_LMA==null)?"":ALMT_RW_LMA;
this.DUSUN_LMA=(DUSUN_LMA==null)?"":DUSUN_LMA;
this.ALMT_KODEPOS_LMA=(ALMT_KODEPOS_LMA==null)?"":ALMT_KODEPOS_LMA;
this.ALMT_TELP_LMA=(ALMT_TELP_LMA==null)?"":ALMT_TELP_LMA;
this.NAMA_CMAT_LMA=(NAMA_CMAT_LMA==null)?"":NAMA_CMAT_LMA;
this.NAMA_LUR_LMA=(NAMA_LUR_LMA==null)?"":NAMA_LUR_LMA;
this.NAMA_PET_LMA=(NAMA_PET_LMA==null)?"":NAMA_PET_LMA;
this.NIP_PET_LMA=(NIP_PET_LMA==null)?"":NIP_PET_LMA;
this.TGL_ENTRI_LMA=(TGL_ENTRI_LMA==null)?"":TGL_ENTRI_LMA;
this.NO_KK_BRU=(NO_KK_BRU==null)?"":NO_KK_BRU;
this.NAMA_CAMAT_BRU=(NAMA_CAMAT_BRU==null)?"":NAMA_CAMAT_BRU;
this.NAMA_LUR_BRU=(NAMA_LUR_BRU==null)?"":NAMA_LUR_BRU;
this.NAMA_PET_BRU=(NAMA_PET_BRU==null)?"":NAMA_PET_BRU;
this.NIP_PET_BRU=(NIP_PET_BRU==null)?"":NIP_PET_BRU;
this.TGL_ENTRI_BRU=(TGL_ENTRI_BRU==null)?"":TGL_ENTRI_BRU;
this.TGL_DTNG=(TGL_DTNG==null)?"":TGL_DTNG;
  }

public String getNokk()
{
     return(NO_KK_LMA);
}

public String getNakk()
{
return(NAMA_KEPALA_LMA);
}

public String getRencTgl()
     {
      return(RENC_TGL);
     }
public String getAlmtLam()
      {
       return(ALMT_LMA);
      }
public String getRtLam()
       {
        return(ALMT_RT_LMA);
       }
public String getRwLam()
        {
         return(ALMT_RW_LMA);
        }
public String getDusunLam()
{
return(DUSUN_LMA);
}

public String getKodLam()
{
return(ALMT_KODEPOS_LMA);
}
public String getTelLam()
 {
return(ALMT_TELP_LMA);
 }
public String getNaCatLam()
{
 return(NAMA_CMAT_LMA);
}
public String getNaPetLam()
{
return(NAMA_PET_LMA);
}
public String getNipPetLam()
{
 return(NIP_PET_LMA);
}
public String getTglEntLam()
 {
         return(TGL_ENTRI_LMA);
   }
public String getNokkNum()
      {
       return(NO_KK_BRU);
      }

public String getNaCatBru()
{
return(NAMA_CAMAT_BRU);
}
public String getNaPetBru()
{
 return(NAMA_PET_BRU);
}
public String getNipPetBru()
{
return(NIP_PET_BRU);
}
public String getTglEntBru()
{
return(TGL_ENTRI_BRU);
}
  public String getTglDtng()
  {
   return(TGL_DTNG);
  }
  public String getNaLurLma()
  {
  return(NAMA_LUR_LMA);
  }
  public String getNaLurBru()
  {
  return(NAMA_LUR_BRU);
  }



public void setNokk(String NO_KK_LMA)
      {
this.NO_KK_LMA=(NO_KK_LMA==null)?"":NO_KK_LMA;
      }
public void setNakk(String NAMA_KEPALA_LMA)
              {
this.NAMA_KEPALA_LMA=(NAMA_KEPALA_LMA==null)?"":NAMA_KEPALA_LMA;
              }
public void setRencTgl(String RENC_TGL)
       {
this.RENC_TGL=(RENC_TGL==null)?"":RENC_TGL;
       }
public void setAlmtLam(String ALMT_LMA)
        {
this.ALMT_LMA=(ALMT_LMA==null)?"":ALMT_LMA;
        }
public void setRtLam(String ALMT_RT_LMA)
         {
this.ALMT_RT_LMA=(ALMT_RT_LMA==null)?"":ALMT_RT_LMA;
         }
public void setRwLam(String ALMT_RW_LMA)
          {
this.ALMT_RW_LMA=(ALMT_RW_LMA==null)?"":ALMT_RW_LMA;
          }
public void setDusunLam(String DUSUN_LMA)
{
this.DUSUN_LMA=(DUSUN_LMA==null)?"":DUSUN_LMA;
}

public void setKodLam(String ALMT_KODEPOS_LMA)
  {
this.ALMT_KODEPOS_LMA=(ALMT_KODEPOS_LMA==null)?"":ALMT_KODEPOS_LMA;
  }
public void setTelLam(String ALMT_TELP_LMA)
   {
this.ALMT_TELP_LMA=(ALMT_TELP_LMA==null)?"":ALMT_TELP_LMA;
   }

public void setNaCatLam(String NAMA_CMAT_LMA)
              {
this.NAMA_CMAT_LMA=(NAMA_CMAT_LMA==null)?"":NAMA_CMAT_LMA;
              }
public void setNaPetLam(String NAMA_PET_LMA)
               {
this.NAMA_PET_LMA=(NAMA_PET_LMA==null)?"":NAMA_PET_LMA;
               }
public void setNipPetLam(String NIP_PET_LMA)
                {
this.NIP_PET_LMA=(NIP_PET_LMA==null)?"":NIP_PET_LMA;
                }
public void setTglEntLam(String TGL_ENTRI_LMA)
   {
this.TGL_ENTRI_LMA=(TGL_ENTRI_LMA==null)?"":TGL_ENTRI_LMA;
     }
public void setNokkNum(String NO_KK_BRU)
{
this.NO_KK_BRU=(NO_KK_BRU==null)?"":NO_KK_BRU;
}

public void setNaCatBru(String NAMA_CAMAT_BRU)
  {
this.NAMA_CAMAT_BRU=(NAMA_CAMAT_BRU==null)?"":NAMA_CAMAT_BRU;
  }
  public void setNaPetBru(String NAMA_PET_BRU)
  {
  this.NAMA_PET_BRU=(NAMA_PET_BRU==null)?"":NAMA_PET_BRU;
  }
  public void setNipPetBru(String NIP_PET_BRU)
  {
  this.NIP_PET_BRU=(NIP_PET_BRU==null)?"":NIP_PET_BRU;
  }
  public void setTglEntBru(String TGL_ENTRI_BRU)
  {
  this.TGL_ENTRI_BRU=(TGL_ENTRI_BRU==null)?"":TGL_ENTRI_BRU;
  }
    public void setTglDtng(String TGL_DTNG)
    {
     this.TGL_DTNG=(TGL_DTNG==null)?"":TGL_DTNG;
    }
    public void setNaLurLma(String NAMA_LUR_LMA)
    {
    this.NAMA_LUR_LMA=(NAMA_LUR_LMA==null)?"":NAMA_LUR_LMA;
    }
    public void setNaLurBru(String NAMA_LUR_BRU)
    {
    this.NAMA_LUR_BRU=(NAMA_LUR_BRU==null)?"":NAMA_LUR_BRU;
    }

public java.util.Vector getAllAnggota()
                      {
                      return(col_rec);
                    }

public void setAllAnggota(java.util.Vector col_rec)
{
 this.col_rec=col_rec;
}

}