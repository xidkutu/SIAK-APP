package keluargawna;

public class Pindah_Nup_Anggo implements java.io.Serializable
{
  String nik,stat_hubun,nama_lgkp;
  public Pindah_Nup_Anggo() {
  }
  public Pindah_Nup_Anggo(String stat_hubun,String nik,String nama_lgkp)
  {
    this.stat_hubun=stat_hubun;
    this.nik=nik;
    this.nama_lgkp=nama_lgkp;
  }
  public String getNik()
   {
    return(nik);
   }
public String getStatHubun()
   {
     return(stat_hubun);
   }
public String getNamaLgkp()
   {
     return(nama_lgkp);
   }


public void setNik(String nik)
   {
    this.nik=nik;
   }

public void  setStatHubun()
   {
    this.stat_hubun=stat_hubun;
   }
public void  setNamaLgkp()
   {
    this.nama_lgkp=nama_lgkp;
   }


}