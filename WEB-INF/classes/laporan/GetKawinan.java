package laporan;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class GetKawinan implements Serializable
{
String  NAMA_WIL,LAKI_BLM_KWN,PEREM_BLM_KWN,LAKI_KWN,PEREM_KWN,LAKI_CRAIHDP,PEREM_CRAIHDP;
String LAKI_CRAIMATI,PEREM_CRAIMATI,AKTA_KWN_ADA,AKTA_KWN_TADA,AKTA_CRAI_ADA,AKTA_CRAI_TADA;


//Constructor
  public GetKawinan(String NAMA_WIL,String LAKI_BLM_KWN,String PEREM_BLM_KWN,String LAKI_KWN,String PEREM_KWN,String LAKI_CRAIHDP,String PEREM_CRAIHDP,String LAKI_CRAIMATI,String PEREM_CRAIMATI,String AKTA_KWN_ADA,String AKTA_KWN_TADA,String AKTA_CRAI_ADA,String AKTA_CRAI_TADA)
  {
    //implementation for Constructor

        this.NAMA_WIL = (NAMA_WIL==null)?"":NAMA_WIL;
        this.LAKI_BLM_KWN=(LAKI_BLM_KWN==null)?"":LAKI_BLM_KWN;
        this.PEREM_BLM_KWN=(PEREM_BLM_KWN==null)?"":PEREM_BLM_KWN;
        this.LAKI_KWN=(LAKI_KWN==null)?"":LAKI_KWN;
        this.PEREM_KWN=(PEREM_KWN==null)?"":PEREM_KWN;
        this.LAKI_CRAIHDP=(LAKI_CRAIHDP==null)?"":LAKI_CRAIHDP;
        this.PEREM_CRAIHDP=(PEREM_CRAIHDP==null)?"":PEREM_CRAIHDP;
        this.LAKI_CRAIMATI=(LAKI_CRAIMATI==null)?"":LAKI_CRAIMATI;
        this.PEREM_CRAIMATI=(PEREM_CRAIMATI==null)?"":PEREM_CRAIMATI;
        this.AKTA_KWN_ADA=(AKTA_KWN_ADA==null)?"":AKTA_KWN_ADA;
        this.AKTA_KWN_TADA=(AKTA_KWN_TADA==null)?"":AKTA_KWN_TADA;
        this.AKTA_CRAI_ADA=(AKTA_CRAI_ADA==null)?"":AKTA_CRAI_ADA;
        this.AKTA_CRAI_TADA=(AKTA_CRAI_TADA==null)?"":AKTA_CRAI_TADA;
  }

//using get bisa baca data
  public String getNamaWil()
  {
  return NAMA_WIL;
  }

  //using set bisa assign baru data
  public void setNamaWil(String NAMA_WIL)
  {
    this.NAMA_WIL = (NAMA_WIL==null)?"":NAMA_WIL;
  }

  public String getLakiBlmKwn()
  {
    return LAKI_BLM_KWN;
  }

  public void setLakiBlmKwn(String LAKI_BLM_KWN)
  {
    this.LAKI_BLM_KWN=(LAKI_BLM_KWN==null)?"":LAKI_BLM_KWN;
  }

 public String getPerumBlmKwn()
 {
   return PEREM_BLM_KWN;
 }

 public void setPerumBlmKwn(String PEREM_BLM_KWN)
 {
   this.PEREM_BLM_KWN=(PEREM_BLM_KWN==null)?"":PEREM_BLM_KWN;
 }


 public String getLakiKwn()
 {
   return LAKI_KWN;

 }

 public void setLakiKwn(String LAKI_KWN)
 {

     this.LAKI_KWN=(LAKI_KWN==null)?"":LAKI_KWN;
 }


 public String getPerumKwn()
  {
  return PEREM_KWN;
 }

 public void setPerumKwn(String PEREM_KWN)
 {
   this.PEREM_KWN=(PEREM_KWN==null)?"":PEREM_KWN;

 }

 public String getLakiCeraiHidup()
 {

return LAKI_CRAIHDP;
 }

 public void setLakiCeraiHidup(String LAKI_CRAIHDP)
 {
    this.LAKI_CRAIHDP=(LAKI_CRAIHDP==null)?"":LAKI_CRAIHDP;
 }

 public String getPerumCeraiHidup()
 {
   return PEREM_CRAIHDP;
 }

 public void setPerumCeraiHidup(String PEREM_CRAIHDP)
 {
 this.PEREM_CRAIHDP=(PEREM_CRAIHDP==null)?"":PEREM_CRAIHDP;
 }

 public String getLakiCeraiMati()
 {
return LAKI_CRAIMATI;
 }

 public void setLakiCeraiMati(String LAKI_CRAIMATI)
 {
this.LAKI_CRAIMATI=(LAKI_CRAIMATI==null)?"":LAKI_CRAIMATI;
 }

 public String getPerumCeraiMati()
 {
return PEREM_CRAIMATI;
 }

 public void setPerumCeraiMati(String PEREM_CRAIMATI)
 {
   this.PEREM_CRAIMATI=(PEREM_CRAIMATI==null)?"":PEREM_CRAIMATI;

 }

 public String getAktaKwnAda()
 {
return AKTA_KWN_ADA;
 }

 public void setAktaKwnAda(String AKTA_KWN_ADA)
 {
     this.AKTA_KWN_ADA=(AKTA_KWN_ADA==null)?"":AKTA_KWN_ADA;

 }

 public String getAktaKwnTada()
 {
return AKTA_KWN_TADA;
 }

 public void setAktaKwnTada(String AKTA_KWN_TADA)
 {
    this.AKTA_KWN_TADA=(AKTA_KWN_TADA==null)?"":AKTA_KWN_TADA;
 }

 public String getAktaCeraiAda()
 {
     return AKTA_CRAI_ADA;
 }

 public void setAktaCeraiAda(String AKTA_CRAI_ADA)
 {

this.AKTA_CRAI_ADA=(AKTA_CRAI_ADA==null)?"":AKTA_CRAI_ADA;
 }

 public String getAktaCeraiTada()
 {
return AKTA_CRAI_TADA;
 }

 public void setAktaCeraiTada(String AKTA_CRAI_TADA)
 {
    this.AKTA_CRAI_TADA=(AKTA_CRAI_TADA==null)?"":AKTA_CRAI_TADA;
 }

}