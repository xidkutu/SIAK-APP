package keluargawna;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description:Helper Class Individu Data Information </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: PT.Cybran Technologies</p>
 * @version 1.0
 */

public class Pindah_Wni implements Serializable {
 String no_kk,als_pndh,namakep,niplrh,namacmat,nipcmat,namapetentri,nippetentri,tglentri;
 String alamat_tjpndh,no_rt_tjpndh,no_rw_tjpndh,kodepos_tjpndh,telp_tjpndh;
 String no_prop,no_kab,no_kec,no_kel;
 String jenis_kpndhn,renc_tgl_pindah,t1,t2,t3,klasf_pndh,dusun_tjpndh,nik,nama_kk,nama_prop,nama_kab,nama_kec,nama_kel;
 java.util.Vector vt_agt;
 java.util.Vector col_rec;
 String namabup;
 String no_prop_asl,no_kab_asl,no_kec_asl,no_kel_asl;
 String alamat_asl,no_rt_asl,no_rw_asl,dusun_asl,kodps_asl,telp_asl;

  public Pindah_Wni() { }
  public Pindah_Wni(
  String no_kk,
  String als_pndh,
  String alamat_tjpndh,
  String no_rt_tjpndh,
  String no_rw_tjpndh,
  String kodepos_tjpndh,
  String telp_tjpndh,
  String no_prop,
  String no_kab,
  String no_kec,
  String no_kel,
  String jenis_kpndhn,
  String renc_tgl_pindah,
  String klasf_pndh,
  String namakep,
  String niplrh,
  String namacmat,
  String nipcmat,
  String namapetentri,
  String nippetentri,
  String tglentri,
  String dusun_tjpndh,
  String nik,
  String nama_kk,
  String nama_prop,
  String nama_kab,
  String nama_kec,
  String nama_kel)
  {
    this.no_kk=(no_kk==null)?"":no_kk;
    this.als_pndh=(als_pndh==null)?"":als_pndh;
    this.alamat_tjpndh=(alamat_tjpndh==null)?"":alamat_tjpndh;
    this.no_rt_tjpndh=(no_rt_tjpndh==null)?"":no_rt_tjpndh;
    this.no_rw_tjpndh=(no_rw_tjpndh==null)?"":no_rw_tjpndh;
    this.kodepos_tjpndh=(kodepos_tjpndh==null)?"":kodepos_tjpndh;
    this.telp_tjpndh=(telp_tjpndh==null)?"":telp_tjpndh;
    this.no_prop=(no_prop==null)?"":no_prop;
    this.no_kab=(no_kab==null)?"":no_kab;
    this.no_kec=(no_kec==null)?"":no_kec;
    this.no_kel=(no_kel==null)?"":no_kel;
    this.jenis_kpndhn=(jenis_kpndhn==null)?"":jenis_kpndhn;
    this.renc_tgl_pindah=(renc_tgl_pindah==null)?"":renc_tgl_pindah;
    this.klasf_pndh=(klasf_pndh==null)?"":klasf_pndh;
    this.namakep=(namakep==null)?"":namakep;
    this.niplrh=(niplrh==null)?"":niplrh;
    this.namacmat=(namacmat==null)?"":namacmat;
    this.nipcmat=(nipcmat==null)?"":nipcmat;
    this.namapetentri=(namapetentri==null)?"":namapetentri;
    this.nippetentri=(nippetentri==null)?"":nippetentri;
    this.tglentri=(tglentri==null)?"":tglentri;
    this.dusun_tjpndh=(dusun_tjpndh==null)?"":dusun_tjpndh;
    this.nik=(nik==null)?"":nik;
    this.nama_kk=(nama_kk==null)?"":nama_kk;
    this.nama_prop=(nama_prop==null)?"":nama_prop;
    this.nama_kab=(nama_kab==null)?"":nama_kab;
    this.nama_kec=(nama_kec==null)?"":nama_kec;
    this.nama_kel=(nama_kel==null)?"":nama_kel;
  }

 public Pindah_Wni(
 String no_kk,String als_pndh,String alamat_tjpndh,String no_rt_tjpndh,
 String no_rw_tjpndh,String kodepos_tjpndh,String telp_tjpndh,
 String no_prop,String no_kab,String no_kec,String no_kel,
 String jenis_kpndhn,String renc_tgl_pindah,String klasf_pndh,
 String namakep,String niplrh,String namacmat,String nipcmat,
 String namabup,String namapetentri,String nippetentri,String tglentri,
 String dusun_tjpndh,String nik,String nama_kk,String nama_prop,String nama_kab,
 String nama_kec,String nama_kel,String no_prop_asl,String no_kab_asl,
 String no_kec_asl,String no_kel_asl,String alamat_asl,String no_rt_asl,
 String no_rw_asl,String dusun_asl,String kodps_asl,String telp_asl)
 {
   this.no_kk=(no_kk==null)?"":no_kk;
   this.als_pndh=(als_pndh==null)?"":als_pndh;
   this.alamat_tjpndh=(alamat_tjpndh==null)?"":alamat_tjpndh;
   this.no_rt_tjpndh=(no_rt_tjpndh==null)?"":no_rt_tjpndh;
   this.no_rw_tjpndh=(no_rw_tjpndh==null)?"":no_rw_tjpndh;
   this.kodepos_tjpndh=(kodepos_tjpndh==null)?"":kodepos_tjpndh;
   this.telp_tjpndh=(telp_tjpndh==null)?"":telp_tjpndh;
   this.no_prop=(no_prop==null)?"":no_prop;
   this.no_kab=(no_kab==null)?"":no_kab;
   this.no_kec=(no_kec==null)?"":no_kec;
   this.no_kel=(no_kel==null)?"":no_kel;
   this.jenis_kpndhn=(jenis_kpndhn==null)?"":jenis_kpndhn;
   this.renc_tgl_pindah=(renc_tgl_pindah==null)?"":renc_tgl_pindah;
   this.klasf_pndh=(klasf_pndh==null)?"":klasf_pndh;
   this.namakep=(namakep==null)?"":namakep;
   this.niplrh=(niplrh==null)?"":niplrh;
   this.namacmat=(namacmat==null)?"":namacmat;
   this.nipcmat=(nipcmat==null)?"":nipcmat;
   this.namapetentri=(namapetentri==null)?"":namapetentri;
   this.nippetentri=(nippetentri==null)?"":nippetentri;
   this.tglentri=(tglentri==null)?"":tglentri;

   this.dusun_tjpndh=(dusun_tjpndh==null)?"":dusun_tjpndh;

   System.out.println("Dusun from Tujuan->" + dusun_tjpndh);
   this.nik=(nik==null)?"":nik;
   this.nama_kk=(nama_kk==null)?"":nama_kk;
   this.nama_prop=(nama_prop==null)?"":nama_prop;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   this.nama_kel=(nama_kel==null)?"":nama_kel;
   this.namabup=(namabup==null)?"":namabup;
   //constructor last customized
   //date:11-02-2004
   //owner:Rajesh
  this.no_prop_asl=no_prop_asl;
  this.no_kab_asl=no_kab_asl;
  this.no_kec_asl=no_kec_asl;
  this.no_kel_asl=no_kel_asl;

  this.alamat_asl=(alamat_asl==null)?"":alamat_asl;
  this.no_rt_asl=(no_rt_asl==null)?"":no_rt_asl;
  this.no_rw_asl=(no_rw_asl==null)?"":no_rw_asl;
  this.dusun_asl=(dusun_asl==null)?"":dusun_asl;
  this.kodps_asl=(kodps_asl==null)?"":kodps_asl;
  this.telp_asl=(telp_asl==null)?"":telp_asl;
 }

//New Constructor for Riwayat Tujuan WNI WNA
//data:18-02-2004
//owner:Rajesh


public Pindah_Wni(
String nik,String no_kk,
String nama_kk,String alamat_asl,String no_rt_asl,String no_rw_asl,
String dusun_asl,String kodps_asl,String telp_asl,String no_prop_asl,
String no_kab_asl,String no_kec_asl,String no_kel_asl,
String renc_tgl_pindah,String jenis_kpndhn,String namacmat,
String namakep,String namapetentri,String nippetentri,
String tglentri,String alamat_tjpndh,String no_rt_tjpndh,
String no_rw_tjpndh,String dusun_tjpndh,String kodepos_tjpndh,
String telp_tjpndh,String no_prop,String no_kab,String no_kec,
String no_kel,String nama_prop,String nama_kab,String nama_kec,
String nama_kel)
 {
   this.nik=(nik==null)?"":nik;
   this.no_kk=(no_kk==null)?"":no_kk;
   this.nama_kk=(nama_kk==null)?"":nama_kk;
   this.alamat_asl=(alamat_asl==null)?"":alamat_asl;
   this.no_rt_asl = (no_rt_asl == null) ? "" : no_rt_asl;
   this.no_rw_asl = (no_rw_asl == null) ? "" : no_rw_asl;
   this.dusun_asl = (dusun_asl == null) ? "" : dusun_asl;
   this.kodps_asl = (kodps_asl == null) ? "" : kodps_asl;
   this.telp_asl = (telp_asl == null) ? "" : telp_asl;
   this.no_prop_asl=no_prop_asl;
   this.no_kab_asl=no_kab_asl;
   this.no_kec_asl=no_kec_asl;
   this.no_kel_asl=no_kel_asl;
   this.renc_tgl_pindah=(renc_tgl_pindah==null)?"":renc_tgl_pindah;
   this.jenis_kpndhn=(jenis_kpndhn==null)?"":jenis_kpndhn;
   this.namacmat=(namacmat==null)?"":namacmat;
   this.namakep=(namakep==null)?"":namakep;
   this.namapetentri=(namapetentri==null)?"":namapetentri;
   this.nippetentri=(nippetentri==null)?"":nippetentri;
   this.tglentri=(tglentri==null)?"":tglentri;
   this.alamat_tjpndh=(alamat_tjpndh==null)?"":alamat_tjpndh;
   this.no_rt_tjpndh=(no_rt_tjpndh==null)?"":no_rt_tjpndh;
   this.no_rw_tjpndh=(no_rw_tjpndh==null)?"":no_rw_tjpndh;
   this.dusun_tjpndh=(dusun_tjpndh==null)?"":dusun_tjpndh;
   this.kodepos_tjpndh=(kodepos_tjpndh==null)?"":kodepos_tjpndh;
   this.telp_tjpndh=(telp_tjpndh==null)?"":telp_tjpndh;
   this.no_prop=(no_prop==null)?"":no_prop;
   this.no_kab=(no_kab==null)?"":no_kab;
   this.no_kec=(no_kec==null)?"":no_kec;
   this.no_kel=(no_kel==null)?"":no_kel;
   this.nama_prop=(nama_prop==null)?"":nama_prop;
   this.nama_kab=(nama_kab==null)?"":nama_kab;
   this.nama_kec=(nama_kec==null)?"":nama_kec;
   this.nama_kel=(nama_kel==null)?"":nama_kel;
   /*this.als_pndh=(als_pndh==null)?"":als_pndh;
   this.klasf_pndh=(klasf_pndh==null)?"":klasf_pndh;
   this.niplrh=(niplrh==null)?"":niplrh;
   this.nipcmat=(nipcmat==null)?"":nipcmat;
   this.namabup=(namabup==null)?"":namabup;
   */
 }



public String getAlamatAsal()
{
return alamat_asl;
}

public String getNoRtAsal()
{
  return  no_rt_asl;
}

public String getNoRwAsal()
{
return  no_rw_asl;
}

public String getDusunAsal()
{
return  dusun_asl;
}
public String getKodePosAsal()
{
  return kodps_asl;
}

public String getTelpAsal()
{
  return telp_asl;
}

public String getNoPropAsal()
{
  return no_prop_asl;
 }

 public String getNoKabAsal()
 {
   return no_kab_asl;
  }

  public String getNoKecAsal()
  {
    return no_kec_asl;
   }

   public String getNoKelAsal()
   {
     return no_kel_asl;
    }

public String getNokk()
 {
  return(no_kk);
 }
public String getAlspndh()
  {
   return(als_pndh);
  }

public String getAlatjpndh()
   {
    return(alamat_tjpndh);
   }


public String getNorttjpndh()
    {
     return(no_rt_tjpndh);
    }


public String getNorwtjpndh()
     {
     return(no_rw_tjpndh);
     }


public String getKodepostjpndh()
      {
       return(kodepos_tjpndh);
      }
public String getTelptjpndh()
       {
        return(telp_tjpndh);
       }
public String getNoprop()
        {
         return(no_prop);
        }
public String getNokab()
         {
          return(no_kab);
         }
public String getNokec()
          {
           return(no_kec);
          }
public String getNokel()
           {
            return(no_kel);
           }
public String getJeskpndhn()
            {
             return(jenis_kpndhn);
            }

public String getRenctglpindah()
             {
              return(renc_tgl_pindah);
             }

public String getKlasfpndh()
              {
               return(klasf_pndh);
              }

public String getNamakep()
               {
                return(namakep);
               }

public String getNiplrh()
                {
                 return(niplrh);
                }

public String getNamacmat()
                 {
                  return(namacmat);
                 }


public String getNipcmat()
{
   return(nipcmat);
}

public String getNamapetentri()
{
  return(namapetentri);
 }


public String getNippetentri()
 {
   return(nippetentri);
  }


public String getTglentri()
  {
    return(tglentri);
   }

public String getDusunTujuan()
     {
       return(dusun_tjpndh);
      }

public String getNikk()
{
 return(nik);
}
public String getNamakk()
{
 return(nama_kk);
}
public String getNamaProp()
{
return(nama_prop);
}
public String getNamaKab()
{
 return(nama_kab);
 }
public String getNamaKec()
{
 return(nama_kec);
}
public String getNamaKel()
{
 return(nama_kel);
}
  public java.util.Vector getAngotta()
         {
           return (vt_agt);
         }

public String getNamaBup()
         {

           return (namabup);
         }

   public void setNokk(String no_kk)
    {
this.no_kk=(no_kk==null)?"":no_kk;
    }
   public void setAlspndh(String als_pndh)
     {
this.als_pndh=(als_pndh==null)?"":als_pndh;
     }
   public void setAlatjpndh(String alamat_tjpndh)
      {
this.alamat_tjpndh=(alamat_tjpndh==null)?"":alamat_tjpndh;
      }
   public void setNorttjpndh(String no_rt_tjpndh)
       {
this.no_rt_tjpndh=(no_rt_tjpndh==null)?"":no_rt_tjpndh;
       }
   public void setNorwtjpndh(String no_rw_tjpndh)
        {
this.no_rw_tjpndh=(no_rw_tjpndh==null)?"":no_rw_tjpndh;
        }
   public void setKodepostjpndh(String kodepos_tjpndh)
         {
this.kodepos_tjpndh=(kodepos_tjpndh==null)?"":kodepos_tjpndh;
         }
   public void setTelptjpndh(String telp_tjpndh)
          {
this.telp_tjpndh=(telp_tjpndh==null)?"":telp_tjpndh;
          }
   public void setNoprop(String no_prop)
           {
this.no_prop=(no_prop==null)?"":no_prop;
           }
   public void setNokab(String no_kab)
            {
this.no_kab=(no_kab==null)?"":no_kab;
            }
   public void setNokec(String no_kec)
             {
this.no_kec=(no_kec==null)?"":no_kec;
             }
   public void setNokel(String no_kel)
              {
this.no_kel=(no_kel==null)?"":no_kel;
              }
   public void setJeskpndhn(String jenis_kpndhn)
               {
this.jenis_kpndhn=(jenis_kpndhn==null)?"":jenis_kpndhn;
               }
   public void setRenctglpindah(String renc_tgl_pindah)
                {
this.renc_tgl_pindah=(renc_tgl_pindah==null)?"":renc_tgl_pindah;
                }
   public void setKlasfpndh(String klasf_pndh)
                 {
this.klasf_pndh=(klasf_pndh==null)?"":klasf_pndh;
                 }
   public void setNamakep(String namakep)
                  {
this.namakep=(namakep==null)?"":namakep;
                  }
   public void setNiplrh(String niplrh)
                   {
 this.niplrh=(niplrh==null)?"":niplrh;
                 }
   public void setNamacmat(String namacmat)
                    {
this.namacmat=(namacmat==null)?"":namacmat;
                    }
   public void setNipcmat(String nipcmat)
   {
this.nipcmat=(nipcmat==null)?"":nipcmat;
   }
   public void setNamapetentri(String namapetentri)
   {
   this.namapetentri=(namapetentri==null)?"":namapetentri;
  }
   public void setNippetentri(String nippetentri)
    {
this.nippetentri=(nippetentri==null)?"":nippetentri;
     }
   public void setTglentri(String tglentri)
     {
this.tglentri=(tglentri==null)?"":tglentri;
      }
public void setDusun(String dusun_tjpndh)
{
      this.dusun_tjpndh=(dusun_tjpndh==null)?"":dusun_tjpndh;
 }
 public void setNik(String nik)
 {
this.nik=(nik==null)?"":nik;
 }
 public void setNamakk(String nama_kk)
 {
 this.nama_kk=(nama_kk==null)?"":nama_kk;
 }
 public void setNamaProp(String nama_prop)
 {
this.nama_prop=(nama_prop==null)?"":nama_prop;
 }
 public void setNamaKab(String nama_kab)
 {
this.nama_kab=(nama_kab==null)?"":nama_kab;
  }
 public void setNamaKec(String nama_kec)
 {
 this.nama_kec=(nama_kec==null)?"":nama_kec;
 }
 public void setNamaKel(String nama_kel)
 {
this.nama_kel=(nama_kel==null)?"":nama_kel;
 }
 public void setAngotta(java.util.Vector vt_agt)
       {
         this.vt_agt=vt_agt;
       }

public void setAllAnggota(java.util.Vector col_rec)
              {
             this.col_rec=col_rec;
              }

public java.util.Vector getAllAnggota()
       {
         return(col_rec);
       }

}