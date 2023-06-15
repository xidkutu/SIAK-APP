package ktp.wni;

public class InfoKTP  implements java.io.Serializable{
private  String nik=null;
private String tgl_berlku=null;

  public InfoKTP(String nik,String tgl_berlku)
            {
                 this.nik=nik;
                 this.tgl_berlku=tgl_berlku;
            }

public void setNik(String nik)
                        {
                           this.nik=nik;
                        }

public String getNik()
                        {
                          return nik;
                        }

public void setTglBerlku(String tgl_berlku)
                        {
                           this.tgl_berlku=tgl_berlku;
                        }
public String getTglBerlku()
                        {
                          return tgl_berlku;
                        }

}



