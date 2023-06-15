package p4b;

import java.io.*;
import java.util.*;
public class RtDTO implements Serializable {

    private String kdprop;
    private String kdkabu;
    private String kdkeca;
    private String kdkelr;
    private String nbs;
    private String nurt;
    private String no_kk;
    private String alamat;
    private Vector anggotaKeluarga=null;
 public RtDTO(String kdprop,String kdkabu,String kdkeca,
                       String kdkelr,String nbs,String nurt,String no_kk,String alamat)
       {
         this.kdprop=kdprop;
         this.kdkabu=kdkabu;
         this.kdkeca=kdkeca;
         this.kdkelr=kdkelr;
         this.nbs=nbs;
         this.nurt=nurt;
         this.no_kk=(no_kk==null)?"-":no_kk;
         this.alamat=(alamat==null)?"-":alamat;
       }

     public String getNoKK() {
         return no_kk;
       }


  public String getAlamat() {
    return alamat;
  }
   public String getKdkabu() {
    return kdkabu;
  }
  public String getKdkelr() {
    return kdkelr;
  }
  public String getNbs() {
    return nbs;
  }
  public String getNurt() {
    return nurt;
  }

  public String getKdprop() {
    return kdprop;
  }
  public String getKdkeca() {
    return kdkeca;
  }
  public void setAnggotaKeluarga(Vector anggotaKeluarga) {
    this.anggotaKeluarga = anggotaKeluarga;
  }

  public Vector getAnggotaKeluarga() {
    return anggotaKeluarga;
  }
}