package kartukeluarga;

import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class DaftarKKObject implements Serializable
{
  private String nomorkk="",namakep="",alamat="",printed="",changed="";
  private String no_rt="", no_rw="", kode_pos="";
  private boolean found;
  private String no_prop;
  private String no_kab;
  private String no_kec;
  private String no_kel;
  private String pflag;
  private String cflag;

  public DaftarKKObject(String nomorkk,String namakep,String alamat)
  {
    this.nomorkk = nomorkk;
    this.namakep = namakep;
    this.alamat = (alamat == null) ? "" : alamat;
    this.printed = "";
    this.changed = "";
 }
 public DaftarKKObject(boolean found)
 {
    this.found = found;
 }
  public DaftarKKObject(String nomorkk,String namakep,String alamat,String printed,String changed
                        ,String no_rt, String no_rw, String kode_pos,  boolean found)
  {
    this.nomorkk=nomorkk;
    this.namakep=namakep;
    this.alamat=(alamat==null)?"":alamat;
    this.printed=(printed==null)?"":printed;
    this.changed=(changed==null)?"":changed;

    this.no_rt = no_rt;
    this.no_rw = no_rw;
    this.kode_pos = kode_pos;
    this.found = found;

  }
  public DaftarKKObject(String nomorkk,String namakep,String alamat,String printed,String changed
                        ,String no_rt, String no_rw, String kode_pos)
  {
    this.nomorkk=nomorkk;
    this.namakep=namakep;
    this.alamat=(alamat==null)?"":alamat;
    this.printed=(printed==null)?"":printed;
    this.changed=(changed==null)?"":changed;
    this.no_rt = no_rt;
    this.no_rw = no_rw;
    this.kode_pos = kode_pos;
  }
  public DaftarKKObject(String nokk, String nmkep, String alamat, String nort, String norw,
                        String kodepos, String noprop, String nokab, String nokec,
                        String nokel, String pflag, String cflag)
  {
    this.nomorkk=nokk;
    this.namakep=nmkep;
    this.alamat=(alamat==null)?"":alamat;
    this.no_rt=(nort==null)?"":nort;
    this.no_rw=(norw==null)?"":norw;
    this.kode_pos=(kodepos==null)?"":kodepos;
    this.no_prop=noprop;
    this.no_kab=nokab;
    this.no_kec=nokec;
    this.no_kel=nokel;
    this.pflag=pflag;
    this.cflag=cflag;
  }
  public void setFound(boolean found)
  {
    this.found = found;
  }
  public boolean getFound()
  {
    return found;
  }
  public void setKode_pos(String kode_pos)
  {
    this.kode_pos = kode_pos;
  }
  public String getKode_pos()
  {
    return kode_pos.trim();
  }
  public void setNo_rt(String no_rt)
  {
    this.no_rt = no_rt ;
  }
  public String getNo_rt()
  {
    return no_rt.trim() ;
  }
  public void setNo_rw(String no_rw)
  {
    this.no_rw = no_rw;
  }
  public String getNo_rw()
  {
    return no_rw.trim();
  }

  public String getNomorKK()
  {
    return this.nomorkk=(nomorkk==null)?"-":nomorkk.trim();
  }
  public void setNomorKK(String nomorkk)
  {
    this.nomorkk=nomorkk;
  }

  public String getNamaKep()
  {
    return this.namakep=(namakep==null)?"-":namakep.trim();
  }
  public void setNamaKep(String namakep)
  {
    this.namakep=namakep;
  }

  public String getAlamat()
  {
    return this.alamat=(alamat==null)?"-":alamat.trim();
  }
  public void setAlamat(String alamat)
  {
    this.alamat=alamat;
  }

  public String getPrinted()
  {
    return this.printed=(printed==null)?"":printed;
  }
  public void setPrinted(String printed)
  {
    this.printed=printed;
  }

  public String getChanged()
  {
    return this.changed=(changed==null)?"":changed;
  }
  public void setChanged(String changed)
  {
    this.changed=changed;
  }
  public String getNo_prop() {
    return no_prop;
  }
  public void setNo_prop(String no_prop) {
    this.no_prop = no_prop;
  }
  public String getNo_kab() {
    return no_kab;
  }
  public void setNo_kab(String no_kab) {
    this.no_kab = no_kab;
  }
  public String getNo_kec() {
    return no_kec;
  }
  public void setNo_kec(String no_kec) {
    this.no_kec = no_kec;
  }
  public String getNo_kel() {
    return no_kel;
  }
  public void setNo_kel(String no_kel) {
    this.no_kel = no_kel;
  }
  public String getPflag() {
    return pflag;
  }
  public void setPflag(String pflag) {
    this.pflag = pflag;
  }
  public String getCflag() {
    return cflag;
  }
  public void setCflag(String cflag) {
    this.cflag = cflag;
  }

}
