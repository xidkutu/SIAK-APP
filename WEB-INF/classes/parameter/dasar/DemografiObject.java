package parameter.dasar;

public class DemografiObject implements java.io.Serializable
{
  private String sex_ratio, depend_ratio, cbr, gfr, asfr_x1, asfr_x2, asfr_x3, asfr_x4;
  private String asfr_x5, asfr_x6, asfr_x7, tfr, cwr, cdr, mmr, imr_mati, cmr, apu_kawin;
  private String apu_cerai, apk_percerain, imr, omr, nmr;
  private double md;

  public DemografiObject(double dMd, String sex_ratio, String depend_ratio, String cbr, String gfr, String asfr_x1,
                         String asfr_x2, String asfr_x3, String asfr_x4, String asfr_x5, String asfr_x6,
                         String asfr_x7, String tfr, String cwr, String cdr, String mmr, String imr_mati,
                         String cmr, String apu_kawin, String apu_cerai, String apk_percerain, String imr,
                         String omr, String nmr)
  {
    this.md = dMd;
    this.sex_ratio = sex_ratio;
    this.depend_ratio = depend_ratio;
    this.cbr =cbr;
    this.gfr =gfr;
    this.asfr_x1 =asfr_x1;
    this.asfr_x2 =asfr_x2;
    this.asfr_x3 =asfr_x3;
    this.asfr_x4 =asfr_x4;
    this.asfr_x5 =asfr_x5;
    this.asfr_x6 =asfr_x6;
    this.asfr_x7 =asfr_x7;
    this.tfr =tfr;
    this.cwr =cwr;
    this.cdr =cdr;
    this.mmr =mmr;
    this.imr_mati =imr_mati;
    this.cmr =cmr;
    this.apu_kawin =apu_kawin;
    this.apu_cerai =apu_cerai;
    this.apk_percerain =apk_percerain;
    this.imr =imr;
    this.omr =omr;
    this.nmr =nmr;

  }
  public void setMd(double md)
  {
    this.md = md;
  }
  public double getMd()
  {
    return md;
  }

  public void setSex_ratio(String sex_ratio)
  {
    this.sex_ratio = sex_ratio;
  }
  public String getSex_ratio()
  {
    return sex_ratio;
  }
  public void setDepend_ratio(String depend_ratio)
  {
    this.depend_ratio = depend_ratio;
  }
  public String getDepend_ratio()
  {
    return depend_ratio;
  }
  public void setCbr(String cbr)
  {
    this.cbr = cbr;
  }
  public String getCbr()
  {
    return cbr;
  }
  public void setGfr(String gfr)
  {
    this.gfr = gfr;
  }
  public String getGfr()
  {
    return gfr;
  }
  public void setAsfr_x1(String asfr_x1)
  {
    this.asfr_x1 = asfr_x1;
  }
  public String getAsfr_x1()
  {
    return asfr_x1;
  }
  public void setAsfr_x2(String asfr_x2)
  {
    this.asfr_x2 = asfr_x2;
  }
  public String getAsfr_x2()
  {
    return asfr_x2;
  }
  public void setAsfr_x3(String asfr_x3)
  {
    this.asfr_x3 = asfr_x3;
  }
  public String getAsfr_x3()
  {
    return asfr_x3;
  }
  public void setAsfr_x4(String asfr_x4)
  {
    this.asfr_x4 = asfr_x4;
  }
  public String getAsfr_x4()
  {
    return asfr_x4;
  }

  public void setAsfr_x5(String asfr_x5)
  {
    this.asfr_x5 = asfr_x5;
  }
  public String getAsfr_x5()
  {
    return asfr_x5;
  }
  public void setAsfr_x6(String asfr_x6)
  {
    this.asfr_x6 = asfr_x6;
  }
  public String getAsfr_x6()
  {
    return asfr_x6;
  }
  public void setAsfr_x7(String asfr_x7)
  {
    this.asfr_x7 = asfr_x7;
  }
  public String getAsfr_x7()
  {
    return asfr_x7;
  }
  public void setTfr(String tfr)
  {
    this.tfr = tfr;
  }
  public String getTfr()
  {
    return tfr;
  }

  public void setCwr(String cwr)
  {
    this.cwr =cwr;
  }
  public String getCwr()
  {
    return cwr;
  }
  public void setCdr(String cdr)
  {
    this.cdr =cdr;
  }
  public String getCdr()
  {
    return cdr;
  }
  public void setMmr(String mmr)
  {
    this.mmr = mmr;
  }
  public String getMmr()
  {
    return mmr;
  }
  public void setImr_mati(String imr_mati)
  {
    this.imr_mati = imr_mati;
  }
  public String getImr_mati()
  {
    return imr_mati;
  }
  public void setCmr(String cmr)
  {
    this.cmr =cmr;
  }
  public String getCmr()
  {
    return cmr;
  }
  public void setApu_kawin(String apu_kawin)
  {
    this.apu_kawin = apu_kawin;
  }
  public String getApu_kawin()
  {
    return apu_kawin;
  }
  public void setApu_cerai(String apu_cerai)
  {
    this.apu_cerai = apu_cerai;
  }
  public String getApu_cerai()
  {
    return apu_cerai;
  }
  public void setApk_percerain(String apk_percerain)
  {
    this.apk_percerain  =apk_percerain;
  }
  public String getApk_percerain()
  {
    return apk_percerain;
  }
    public void setImr(String imr)
   {
     this.imr = imr;
   }
   public String getImr()
   {
     return imr;
   }
   public void setOmr(String omr)
   {
    this.omr = omr;
  }
  public String getOmr()
  {
    return omr;
  }
  public void setNmr(String nmr)
  {
   this.nmr = nmr;
 }
 public String getNmr()
 {
   return nmr;
 }

}