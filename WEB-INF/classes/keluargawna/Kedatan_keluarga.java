package keluargawna;
import java.io.*;

/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class Kedatan_keluarga implements Serializable
{
  String NO_KK,NAMA_KK,ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP,TGL_UPDATION,NO_PROP,NO_KAB,NO_KEC,NO_KEL,TGL_ENTRI;
  String NAMA_CMAT_LMA,NAMA_LUR_LMA,NAMA_PET_LMA,NIP_PET_LMA,TGL_ENTRI_LMA,NAMA_CAMAT_BRU,NAMA_LUR_BRU,NAMA_PET_BRU,NIP_PET_BRU;
  String NO_KK_LMA,NAMA_KEPALA_LMA, RENC_TGL,ALMT_LMA,ALMT_RT_LMA,ALMT_RW_LMA,DUSUN_LMA,ALMT_KODEPOS_LMA,ALMT_TELP_LMA,NO_KK_BRU,TGL_ENTRI_BRU,TGL_DTNG;
  String no_prop_tuj="",no_kab_tuj="",no_kec_tuj="",no_kel_tuj="";
  String no_kk_tuj="",alamat_tuj="",no_rt_tuj="",no_rw_tuj="",dusun_tuj="",kodepos_tuj="",telp_tuj="";
  String source="";
  java.util.Vector vt_ago;
  String no_prop_asl=null;String no_kab_asl=null;
String no_kec_asl=null;String no_kel_asl=null;
String pdh="";
  public Kedatan_keluarga()
  {
  }

  public Kedatan_keluarga(String NO_PROP,String NO_KAB,String NO_KEC,String NO_KEL,String NO_KK,String NAMA_KK,String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP,String TGL_UPDATION,String NAMA_CMAT_LMA,String NAMA_LUR_LMA,String NAMA_PET_LMA,String NIP_PET_LMA,String TGL_ENTRI_LMA,String NAMA_CAMAT_BRU,String NAMA_LUR_BRU,String NAMA_PET_BRU,String NIP_PET_BRU,String RENC_TGL,String TGL_ENTRI)
  {

    this.NO_PROP=(NO_PROP==null)?"0":NO_PROP;
    this.NO_KAB=(NO_KAB==null)?"0":NO_KAB;
    this.NO_KEC=(NO_KEC==null)?"0":NO_KEC;
    this.NO_KEL=(NO_KEL==null)?"0":NO_KEL;
    this.NO_KK=(NO_KK==null)?"":NO_KK;
    this.NAMA_KK=(NAMA_KK==null)?"":NAMA_KK;
    this.ALAMAT=(ALAMAT==null)?"":ALAMAT;
    this.NO_RT=(NO_RT==null)?"":NO_RT;
    this.NO_RW=(NO_RW==null)?"0":NO_RW;
    this.DUSUN=(DUSUN==null)?"0":DUSUN;
    this.KODE_POS=(KODE_POS==null)?"":KODE_POS;
    this.TELP=(TELP==null)?"":TELP;
    this.TGL_UPDATION=(TGL_UPDATION==null)?"":TGL_UPDATION;
    this.NAMA_CMAT_LMA=(NAMA_CMAT_LMA==null)?"":NAMA_CMAT_LMA;
    this.NAMA_LUR_LMA=(NAMA_LUR_LMA==null)?"":NAMA_LUR_LMA;
    this.NAMA_PET_LMA=(NAMA_PET_LMA==null)?"":NAMA_PET_LMA;
    this.NIP_PET_LMA=(NIP_PET_LMA==null)?"":NIP_PET_LMA;
    this.TGL_ENTRI_LMA=(TGL_ENTRI_LMA==null)?"":TGL_ENTRI_LMA;
    this.NAMA_CAMAT_BRU=(NAMA_CAMAT_BRU==null)?"":NAMA_CAMAT_BRU;
    this.NAMA_LUR_BRU=(NAMA_LUR_BRU==null)?"":NAMA_LUR_BRU;
    this.NAMA_PET_BRU=(NAMA_PET_BRU==null)?"":NAMA_PET_BRU;
    this.NIP_PET_BRU=(NIP_PET_BRU==null)?"":NIP_PET_BRU;
    this.RENC_TGL=(RENC_TGL==null)?"":RENC_TGL;
    this.TGL_ENTRI=(TGL_ENTRI==null)?"":TGL_ENTRI;
 }

/*
New Modified Constructor for Riwayat WNI WNA
Date: 17-02-2004
Owner:Rajesh
*/
public Kedatan_keluarga(String no_kk_tuj,
String NO_KK_LMA,String NAMA_KEPALA_LMA,
String ALMT_LMA,String ALMT_RT_LMA,
String ALMT_RW_LMA,String DUSUN_LMA,
String ALMT_KODEPOS_LMA,String ALMT_TELP_LMA,
String RENC_TGL,String NAMA_CMAT_LMA,String NAMA_LUR_LMA,
String NAMA_PET_LMA,String NIP_PET_LMA,
String TGL_ENTRI_LMA,String alamat_tuj,
String no_rt_tuj,String no_rw_tuj,
String dusun_tuj,String kodepos_tuj,String telp_tuj,
String no_prop_tuj,String no_kab_tuj,
String no_kec_tuj,String no_kel_tuj,
String NAMA_CAMAT_BRU,String NAMA_LUR_BRU,
String NAMA_PET_BRU,String NIP_PET_BRU,
String TGL_ENTRI_BRU,String TGL_DTNG,String no_prop_asl,String no_kab_asl,
String no_kec_asl,String no_kel_asl)
    {
     //Under optimization

 this.no_kk_tuj=no_kk_tuj;
 this.NO_KK_LMA=NO_KK_LMA;
 this.NAMA_KEPALA_LMA=NAMA_KEPALA_LMA;
 this.ALMT_LMA=ALMT_LMA;
 this.ALMT_RT_LMA=ALMT_RT_LMA;
 this.ALMT_RW_LMA=ALMT_RW_LMA;
 this.DUSUN_LMA=DUSUN_LMA;
 this.ALMT_KODEPOS_LMA=ALMT_KODEPOS_LMA;
 this.ALMT_TELP_LMA=ALMT_TELP_LMA;
 this.RENC_TGL=RENC_TGL;
 this.NAMA_CMAT_LMA=NAMA_CMAT_LMA;
 this.NAMA_LUR_LMA=NAMA_LUR_LMA;
 this.NAMA_PET_LMA=NAMA_PET_LMA;
 this.NIP_PET_LMA=NIP_PET_LMA;
 this.TGL_ENTRI_LMA=TGL_ENTRI_LMA;
 this.alamat_tuj=alamat_tuj;
 this.no_rt_tuj=no_rt_tuj;
 this.no_rw_tuj=no_rw_tuj;
 this.dusun_tuj=dusun_tuj;
 this.kodepos_tuj=kodepos_tuj;
 this.telp_tuj=telp_tuj;
 this.no_prop_tuj=no_prop_tuj;
 this.no_kab_tuj=no_kab_tuj;
 this.no_kec_tuj=no_kec_tuj;
 this.no_kel_tuj= no_kel_tuj;
 this.NAMA_CAMAT_BRU=NAMA_CAMAT_BRU;
 this.NAMA_LUR_BRU=NAMA_LUR_BRU;
 this.NAMA_PET_BRU=NAMA_PET_BRU;
 this.NIP_PET_BRU=NIP_PET_BRU;
 this.TGL_ENTRI_BRU=TGL_ENTRI_BRU;
 this.TGL_DTNG=TGL_DTNG;

 this.no_prop_asl=no_prop_asl;
 this.no_kab_asl=no_kab_asl;
this.no_kec_asl=no_kec_asl;
this.no_kel_asl=no_kel_asl;
}
/*Newly Added Functions*/
/*Date 17-02-2004*/
/*Start Function*/

public String getNoPropAsl()
{

  return no_prop_asl;
  }

  public String getNoKabAsl()
  {
    return no_kab_asl;
  }

  public String getNoKecAsl()
  {
    return no_kec_asl;
  }

  public String getNoKelAsl()
  {
    return no_kel_asl;
  }

/*End Function*/

public String getAlamatTuj()
      {
        return alamat_tuj;
      }

public String getRtTuj()
      {
        return no_rt_tuj;
      }

      public void setSource(String source)
      {

         this.source=source;
      }

      public String getSource()
      {
        return source;
      }

  public String getRwTuj()
  {
    return no_rw_tuj;
  }
  public String getDusunTuj()
  {
    return dusun_tuj;
  }

  public String getKodeposTuj()
  {
    return kodepos_tuj;
  }

  public String getTelpTuj()
  {
    return telp_tuj;
  }

  public String getTglEntri()
  {
   return(TGL_ENTRI);
  }

  public String getNoProp()
  {
   return(no_prop_tuj);
  }

  public String getNoKab()
  {
   return(no_kab_tuj);
  }

  public String getNoKec()
  {
   return(no_kec_tuj);
  }

  public String getNoKel()
  {
   return(no_kel_tuj);
  }

public String getNokk()  //deprecated
{
 return(NO_KK);
}

public String getNO_KK_LMA()
  {
    return NO_KK_LMA;
  }

 public String getNAMA_KEPALA_LMA()
 {
   return NAMA_KEPALA_LMA;
 }

 public String getRENC_TGL()
 {
   return RENC_TGL;
 }

public String getALMT_LMA()
 {
   return ALMT_LMA;
 }


public String getALMT_RT_LMA()
 {
   return ALMT_RT_LMA;
 }

public String getALMT_RW_LMA()
 {
   return ALMT_RW_LMA;
 }

public String getDUSUN_LMA()
 {

   return DUSUN_LMA;
 }

 public String getALMT_KODEPOS_LMA()
 {

   return ALMT_KODEPOS_LMA;
 }

public String getALMT_TELP_LMA()
 {
   return ALMT_TELP_LMA;
 }

 public String getNAMA_CMAT_LMA()
 {

   return NAMA_CMAT_LMA;
 }
 public String getNAMA_LUR_LMA()
 {
   return NAMA_LUR_LMA;
 }

public String getNAMA_PET_LMA()
 {
   return NAMA_PET_LMA;

 }

public String getNIP_PET_LMA()
 {
   return NIP_PET_LMA;
 }
 public String getTGL_ENTRI_LMA()
 {
   return TGL_ENTRI_LMA;
 }

 public String getNO_KK_BRU()
 {
   return no_kk_tuj;
 }
 public String getNAMA_CAMAT_BRU()
 {
   return NAMA_CAMAT_BRU;
 }

 public String getNAMA_LUR_BRU()
 {
   return NAMA_LUR_BRU;
 }

 public String getNAMA_PET_BRU()
 {
   return NAMA_PET_BRU;
 }

 public String getNIP_PET_BRU()
 {
   return NIP_PET_BRU;
 }

 public String getTGL_ENTRI_BRU()
 {
   return TGL_ENTRI_BRU;
 }

 public String getTGL_DTNG()
 {
   return TGL_DTNG;
 }

  public String getNaKk() //deprecated
{
 return(NAMA_KK);
}
public String getAlm()
  {
   return(ALAMAT);
  }
public String getRt()
  {
   return(NO_RT);
  }
public String getRw()
  {
   return(NO_RW);
  }
public String getDus()
  {
   return(DUSUN);
  }
public String getKod()
  {
   return(KODE_POS);
  }
public String getTlp()
  {
   return(TELP);
  }
public String getTglUpd()
  {
   return(TGL_UPDATION);
  }
public String getNaCat()
    {
     return(NAMA_CMAT_LMA);
    }

public String getNaLur()
      {
       return(NAMA_LUR_LMA);
      }
public String getNaPet()
        {
         return(NAMA_PET_LMA);
        }
public String getNiPet()
          {
           return(NIP_PET_LMA);
          }
public String getTglLma()
            {
             return(TGL_ENTRI_LMA);
            }
public String getCatBru()
              {
               return(NAMA_CAMAT_BRU);
              }
public String getLurBru()
                {
                 return(NAMA_LUR_BRU);
                }
public String getPetBru()
                  {
                   return(NAMA_PET_BRU);
                  }
public String getNiBru()
{
 return(NIP_PET_BRU);
}
public String getReTgl()
  {
   return(RENC_TGL);
  }

public java.util.Vector getAngo()
{
return(vt_ago);
}
public void setAngo(java.util.Vector vt_ago )
{
 this.vt_ago=vt_ago;
}


public void setReTgl(String RENC_TGL)
      {
this.RENC_TGL=(RENC_TGL==null)?"":RENC_TGL;
      }

public void setNoProp(String NO_PROP)
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

public void setNokk(String NO_KK)
  {
   this.NO_KK=(NO_KK==null)?"":NO_KK;
  }
public void setNaKK(String NAMA_KK)
    {
this.NAMA_KK=(NAMA_KK==null)?"":NAMA_KK;
    }

public void  setAlm(String ALAMAT)
   {
      this.ALAMAT=(ALAMAT==null)?"":ALAMAT;
   }
public void setRt(String NO_RT)
   {
      this.NO_RT=(NO_RT==null)?"":NO_RT;
   }
public void setRw(String NO_RW)
   {
     this.NO_RW=(NO_RW==null)?"":NO_RW;
   }
public void setDus(String DUSUN)
   {
      this.DUSUN=(DUSUN==null)?"":DUSUN;
   }
public void setKod(String KODE_POS)
   {
      this.KODE_POS=(KODE_POS==null)?"":KODE_POS;
   }
public void setTlp(String TELP)
   {
      this.TELP=(TELP==null)?"":TELP;
   }
 public void  setTglUpd(String TGL_UPDATION)
   {
      this.TGL_UPDATION=(TGL_UPDATION==null)?"":TGL_UPDATION;
   }

public void setNaCat(String NAMA_CMAT_LMA)
       {
   this.NAMA_CMAT_LMA=(NAMA_CMAT_LMA==null)?"":NAMA_CMAT_LMA;
       }

public void setNaLur(String  NAMA_LUR_LMA)
         {
   this.NAMA_LUR_LMA=(NAMA_LUR_LMA==null)?"":NAMA_LUR_LMA;
         }
public void setNaPet(String NAMA_PET_LMA)
           {
   this.NAMA_PET_LMA=(NAMA_PET_LMA==null)?"":NAMA_PET_LMA;
           }
public void setNiPet(String NIP_PET_LMA)
             {
   this.NIP_PET_LMA=(NIP_PET_LMA==null)?"":NIP_PET_LMA;
             }
public void setTglLma(String TGL_ENTRI_LMA)
               {
   this.TGL_ENTRI_LMA=(TGL_ENTRI_LMA==null)?"":TGL_ENTRI_LMA;;
               }
public void setCatBru(String NAMA_CAMAT_BRU)
                 {
this.NAMA_CAMAT_BRU=(NAMA_CAMAT_BRU==null)?"":NAMA_CAMAT_BRU;;
                 }
public void setLurBru(String NAMA_LUR_BRU)
                   {
 this.NAMA_LUR_BRU=(NAMA_LUR_BRU==null)?"":NAMA_LUR_BRU;
                   }
public void setPetBru(String NAMA_PET_BRU)
                     {
   this.NAMA_PET_BRU=(NAMA_PET_BRU==null)?"":NAMA_PET_BRU;
                     }
public void setNiBru(String NIP_PET_BRU)
   {
   this.NIP_PET_BRU=(NIP_PET_BRU==null)?"":NIP_PET_BRU;
   }

public void setTglEntri(String TGL_ENTRI)
{
this.TGL_ENTRI=(TGL_ENTRI==null)?"":TGL_ENTRI;
}

public void setStatusPindah(String pdh)
   {
     this.pdh=pdh;
   }
public String getStatusPindah()
   {
     return pdh;
   }
}