package keluargawna;

public class PermohanAnggota implements java.io.Serializable {
  String nik,stat_hubun;

  public PermohanAnggota(String stat_hubun,String nik) {
    this.stat_hubun=stat_hubun;
    this.nik=nik;
  }

public String getNik()
   {
    return(nik);
   }
public String getStatHubun()
   {
     return(stat_hubun);
   }

public void setNik(String nik)
   {
    this.nik=nik;
   }

public void  setStatHubun()
   {
    this.stat_hubun=stat_hubun;
   }
}
