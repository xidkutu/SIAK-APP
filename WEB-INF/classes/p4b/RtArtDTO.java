package p4b;
import java.io.*;
public class RtArtDTO implements Serializable {
    private String noart;
    private String nama;
    private String jenis_kl;
    private String tmplahir;
    private String tgl_lhr;
    private String stkawin;
    private String stdlmrt;

 public RtArtDTO(String noart,String nama,String tgl_lhr,String tmplahir,String jenis_kl,String stkawin,String stdlmrt)
    {
        this.noart=noart;
        this.nama=(nama==null)?"-":nama;
        this.jenis_kl=jenis_kl;
        this.tmplahir=(tmplahir==null)?"-":tmplahir;
        this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
        this.stkawin=(stkawin==null)?"-":stkawin;
        this.stdlmrt=(stdlmrt==null)?"-":stdlmrt;
      }
    public String getJenisKl()
    {
      return getJenisKelamin(jenis_kl);
    }
      public String getNoArt()
      {
        return noart;
      }
      public String getNama() {
        return nama;
      }
      public String getTmplahir() {
        return tmplahir;
      }
      public String getTglLahir() {
        return tgl_lhr;
      }
      public String getStdlmrt() {
        return getStatHubungan(stdlmrt,jenis_kl);
      }
      public String getStkawin() {
        return getStatusKawin(stkawin);
      }
   private String getStatHubungan(String hubun, String sex)
      {
        String hubunkel="";
        switch (Integer.parseInt(hubun)) {
           case  1 : hubunkel="Kepala Keluarga"; break;
           case  2 : if (Integer.parseInt(sex)==1) {hubunkel="Suami";} else if (Integer.parseInt(sex)==2){hubunkel="Istri";}; break;
           case  3 : hubunkel="Anak"; break;
           case  4 : hubunkel="Menantu"; break;
           case  5 : hubunkel="Cucu"; break;
           case  6 : hubunkel="OrangTua"; break;
           case  7 : hubunkel="Mertua"; break;
           case  8 : hubunkel="Famili Lain"; break;
           case  9 : hubunkel="Pembantu"; break;
           case  10 : hubunkel="Lainnya"; break;
        }
      return hubunkel;
    }

   private String   getStatusKawin(String kawin)
      {
        String msg="";
     if (Integer.parseInt(kawin)==1)   msg="Belum Kawin";
     if (Integer.parseInt(kawin)==2)   msg="Kawin";
      if (Integer.parseInt(kawin)==3)   msg="Cerai Hidup";
      if (Integer.parseInt(kawin)==4)   msg="Cerai Mati";
        return msg;
    }

   private String getJenisKelamin(String jenis_kl)
   {
     if (Integer.parseInt(jenis_kl)==1)
       return "L";
     else
       return "P";
   }
}