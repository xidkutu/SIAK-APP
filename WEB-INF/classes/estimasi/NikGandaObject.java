package estimasi;
import java.util.Vector;
public class NikGandaObject implements java.io.Serializable
{
 String  nik="", no_kk="", alamat="", nama_lgkp="", tmpt_lhr="", tgl_lhr="", nama_ibu="",
                nama_ayh="", no_prop="", no_kab="", no_kec="", no_kel="", nama_prop="",
                nama_kab="", nama_kec="", nama_kel="", nama_pet_entri="", nip_pet_entri="",
                tgl_entri="", gen_date="";

public NikGandaObject(String nik, String no_kk, String alamat, String nama_lgkp, String tmpt_lhr, String tgl_lhr, String nama_ibu,
                           String nama_ayh, String no_prop, String no_kab, String no_kec, String no_kel, String nama_prop,
                           String nama_kab, String nama_kec, String nama_kel, String nama_pet_entri, String nip_pet_entri,
                           String tgl_entri, String gen_date
)
  {
    this.nik=nik;
    this.no_kk=no_kk;
    this.alamat=(alamat==null)?"-":alamat;
    this.nama_lgkp=nama_lgkp;
    this.tmpt_lhr=tmpt_lhr;
    this.tgl_lhr=tgl_lhr;
    this.nama_ibu=(nama_ibu==null)?"-":nama_ibu;
    this.nama_ayh=(nama_ayh==null)?"-":nama_ayh ;
    this.no_prop=no_prop;
    this.no_kab=no_kab;
    this.no_kec=no_kec;
    this.no_kel=no_kel;
    this.nama_prop=nama_prop;
    this.nama_kab=nama_kab;
    this.nama_kec=nama_kec;
    this.nama_kel=nama_kel;
    this.nama_pet_entri=nama_pet_entri;
    this.nip_pet_entri=nip_pet_entri;
    this.tgl_entri=tgl_entri;
    this.gen_date=gen_date;
  }

   public String getNik()
   {
     return nik;
   }
   public String getNokk()
   {
     return no_kk;
   }

   public String getNamaLgkp()
   {
     return nama_lgkp;
   }
   public String getAlamat()
   {
     return alamat;
   }

   public String getTmptLhr()
   {
     return tmpt_lhr;
   }

  public String getTglLhr()
  {
    return tgl_lhr;
  }

  public String getNamaIbu()
  {
    return nama_ibu;
  }

 public String getNamaAyah()
 {
   return nama_ayh;
 }

 public String getNoProp()
 {
   return no_prop;
 }

 public String getNoKab()
 {
   return no_kab;
 }
 public String getNoKec()
 {
   return no_kec;
 }
 public String getNoKel()
 {
   return no_kel;
 }
 public String getNamaProp()
 {
   return nama_prop;
 }
 public String getNamaKab()
 {
   return nama_kab;
 }
 public String getNamaKec()
 {
   return nama_kec;
 }
 public String getNamaKel()
 {
   return nama_kel;
 }

 public String getNamaPetEntri()
 {
   return nama_pet_entri;
 }

 public String getNipPetEntri()
 {
   return nip_pet_entri;
 }
 public String getTglEntri()
 {
   return tgl_entri;
 }

 public String getGenDate()
 {
   return gen_date;
 }
}