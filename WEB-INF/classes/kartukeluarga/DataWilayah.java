package kartukeluarga;
import java.io.*;

public class DataWilayah implements Serializable
{
private String no_prop,no_kab,no_kec,no_kel;
private String nama_prop,nama_kab,nama_kec;

private String status, kewarganegaraan;

  public DataWilayah(String no_prop, String no_kab, String no_kec, String no_kel, String nama_prop, String nama_kab, String nama_kec, String status)
  {
    this.no_prop=no_prop;
    this.no_kab=no_kab;
    this.no_kec=no_kec;
    this.no_kel=no_kel;
    this.nama_prop=nama_prop;
    this.nama_kab =nama_kab;
    this.nama_kec=nama_kec;

    this.status=status;
 }

 public DataWilayah(String no_prop, String no_kab, String nama_prop, String nama_kab, String status)
 {
   this.no_prop=no_prop;
   this.no_kab=no_kab;
   this.nama_prop=nama_prop;
   this.nama_kab =nama_kab;

   this.status=status;
}

 public DataWilayah(String no_prop, String no_kab, String nama_prop, String nama_kab
                    , String status, String kewarganegaraan)
 {
   this.no_prop=no_prop;
   this.no_kab=no_kab;

   this.nama_prop=nama_prop;
   this.nama_kab =nama_kab;
   this.status=status;
   this.kewarganegaraan = kewarganegaraan;
 }
public void setKewarganegaraan(String kewarganegaraan)
 {
   this.kewarganegaraan = kewarganegaraan;
 }
 public String getKewarganegaraan()
 {
   return kewarganegaraan;
 }
public void setNo_prop(String no_prop)
 {
   this.no_prop = no_prop;
 }
 public String getNo_prop()
 {
   return no_prop;
 }
 public void setNo_kab(String no_kab)
 {
   this.no_kab = no_kab;
 }
 public String getNo_kab()
 {
   return no_kab;
 }
 public void setNo_kec(String no_kec)
 {
   this.no_kec = no_kec;
 }
 public String getNo_kec()
 {
   return no_kec;
 }
 public void setNo_kel(String no_kel)
{
  this.no_kel = no_kel;
}
public String getNo_kel()
{
  return no_kel;
}

public void setNama_prop(String nama_prop)
{
  this.nama_prop = nama_prop;
}
public String getNama_prop()
{
  return nama_prop;
}
public void setNama_kab(String nama_kab)
{
  this.nama_kab = nama_kab;
}
public String getNama_kab()
{
  return nama_kab;
}
public void setNama_kec(String nama_kec)
{
  this.nama_kec = nama_kec;
}
public String getNama_kec()
{
  return nama_kec;
}

public void setStatus(String status)
{
  this.status=status;
}
public String getStatus()
{
  return status;
}

}
