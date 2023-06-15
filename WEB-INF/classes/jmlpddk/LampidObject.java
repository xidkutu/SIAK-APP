package jmlpddk;

import java.io.Serializable;

public class LampidObject implements Serializable
{
  private String lahirlaki, lahirperem, matilaki, matiperem, pindlakidalam, pindperemdalam;
  private String pindahlakiluar, pindahperemluar, dtnglakidalam, dtngperemdalam, dtnglakiluar;
  private String dtngperemluar, laki_akhr, perum_akhr, jumlakk;
  private String laki_awal,perum_awal;

  public LampidObject(String lahirlaki, String lahirperem,String matilaki,String matiperem
                      ,String pindlakidalam,String pindperemdalam, String pindahlakiluar,
                      String pindahperemluar,String dtnglakidalam,String dtngperemdalam,
                      String dtnglakiluar, String dtngperemluar,String laki_akhr,String perum_akhr
                      , String jumlakk)
  {
    this.lahirlaki = lahirlaki;
    this.lahirperem = lahirperem;
    this.matilaki = matilaki;
    this.matiperem = matiperem;
    this.pindlakidalam = pindlakidalam;
    this.pindperemdalam = pindperemdalam;
    this.pindahlakiluar = pindahlakiluar;
    this.pindahperemluar = pindahperemluar;
    this.dtnglakidalam = dtnglakidalam;
    this.dtngperemdalam = dtngperemdalam;
    this.dtnglakiluar = dtnglakiluar;
    this.dtngperemluar = dtngperemluar;
    this.laki_akhr = laki_akhr;
    this.perum_akhr = perum_akhr;
    this.jumlakk = jumlakk;
  }

  public LampidObject(String laki_awal,String perum_awal,String lahirlaki, String lahirperem,String matilaki,String matiperem
                       ,String pindlakidalam,String pindperemdalam, String pindahlakiluar,
                       String pindahperemluar,String dtnglakidalam,String dtngperemdalam,
                       String dtnglakiluar, String dtngperemluar,String laki_akhr,
                       String perum_akhr,String jumlakk)
   {
     this.laki_awal=laki_awal;
     this.perum_awal=perum_awal;
     this.lahirlaki = lahirlaki;
     this.lahirperem = lahirperem;
     this.matilaki = matilaki;
     this.matiperem = matiperem;
     this.pindlakidalam = pindlakidalam;
     this.pindperemdalam = pindperemdalam;
     this.pindahlakiluar = pindahlakiluar;
     this.pindahperemluar = pindahperemluar;
     this.dtnglakidalam = dtnglakidalam;
     this.dtngperemdalam = dtngperemdalam;
     this.dtnglakiluar = dtnglakiluar;
     this.dtngperemluar = dtngperemluar;
     this.laki_akhr = laki_akhr;
     this.perum_akhr = perum_akhr;
     this.jumlakk = jumlakk;
   }
  public String getLakiAwal()
   {
     return laki_awal;
   }

  public void setLakiAwal(String laki_awal)
   {
     this.laki_awal=laki_awal;
   }

   public String getPerumAwal()
   {
     return perum_awal;
   }

   public void setPerumAwal(String perum_awal)
   {
     this.perum_awal=perum_awal;
   }

  public void setLahirlaki(String lahirlaki)
  {
    this.lahirlaki = lahirlaki;
  }
  public String getLahirlaki()
  {
    return lahirlaki;
  }

  public void setLahirperem(String lahirperem)
  {
    this.lahirperem = lahirperem;
  }
  public String getLahirperem()
  {
    return lahirperem;
  }
  public void setMatilaki(String matilaki)
  {
    this.matilaki = matilaki;
  }
  public String getMatilaki()
  {
    return matilaki;
  }
  public void setMatiperem(String matiperem)
  {
    this.matiperem = matiperem;
  }
  public String getMatiperem()
  {
    return matiperem;
  }
  public void setPindlakidalam(String pindlakidalam)
  {
    this.pindlakidalam = pindlakidalam;
  }
  public String getPindlakidalam()
  {
    return pindlakidalam;
  }
  public void setPindperemdalam(String pindperemdalam)
  {
    this.pindperemdalam = pindperemdalam;
  }
  public String getPindperemdalam()
  {
    return pindperemdalam;
  }
  public void setPindahlakiluar(String pindahlakiluar)
  {
    this.pindahlakiluar  =pindahlakiluar;
  }
  public String getPindahlakiluar()
  {
    return pindahlakiluar;
  }
  public void setPindahperemluar(String pindahperemluar)
  {
    this.pindahperemluar = pindahperemluar;
  }
  public String getPindahperemluar()
  {
    return pindahperemluar;
  }
  public void setDtnglakidalam(String dtnglakidalam)
  {
    this.dtnglakidalam = dtnglakidalam;
  }
  public String getDtnglakidalam()
  {
    return dtnglakidalam;
  }
  public void setDtngperemdalam(String dtngperemdalam)
  {
    this.dtngperemdalam = dtngperemdalam;
  }
  public String getDtngperemdalam()
  {
    return dtngperemdalam;
  }
  public void setDtnglakiluar(String dtnglakiluar)
  {
    this.dtnglakiluar = dtnglakiluar;
  }
  public String getDtnglakiluar()
  {
    return dtnglakiluar;
  }
  public void setDtngperemluar(String dtngperemluar)
  {
    this.dtngperemluar = dtngperemluar;
  }
  public String getDtngperemluar()
  {
    return dtngperemluar;
  }
  public void setLakiAkhr(String laki_akhr)
  {
    this.laki_akhr = laki_akhr;
  }
  public String getLakiAkhr()
  {
    return laki_akhr;
  }
  public void setPerumAkhr(String perum_akhr)
  {
    this.perum_akhr = perum_akhr;
  }
  public String getPerumAkhr()
  {
    return perum_akhr;
  }

  public void setJumlakk(String jumlakk)
  {
    this.jumlakk = jumlakk;
  }
  public String getJumlakk()
  {
    return jumlakk;
  }
}