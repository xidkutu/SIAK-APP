package keluargawna;

public class Numpang_Anggota implements java.io.Serializable
{
  String nik,stat_hubun;
  public Numpang_Anggota() {
  }
  public Numpang_Anggota(String nik,String stat_hubun)
  {
      this.nik=(nik==null)?"":nik;
      this.stat_hubun=(stat_hubun==null)?"":stat_hubun;

    }

  public String getNik()
     {
      return(nik.trim());
     }
  public String getStatHubun()
     {
       return(stat_hubun.trim());
     }

  public void setNik(String nik)
     {
      this.nik=(nik==null)?"":nik;
     }

  public void  setStatHubun()
     {
      this.stat_hubun=(stat_hubun==null)?"":stat_hubun;
     }

}