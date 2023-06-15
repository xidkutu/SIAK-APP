package com.monitor;

public class MonitorObj {

  private String user_id;
  private String nama_lgkp;
  private String nip;
  private String nama_kantor;
  private String alamat_kantor;
  private String telp;
  private String indate,intime;
  private String remoteip=null;
public MonitorObj(String user_id,String nama_lgkp,String nip,String nama_kantor,String alamat_kantor,String telp,String indate,String intime,String remoteip) {
    this.user_id=user_id;
    this.nama_lgkp=nama_lgkp;
    this.nip=nip;
    this.nama_kantor=nama_kantor;
    this.alamat_kantor=alamat_kantor;
    this.telp=telp;
    this.indate=indate;
    this.intime=intime;
    this.remoteip=remoteip;
}

public String getRemoteIP()
  {
    return remoteip;
  }

 public void setRemoteIP(String remoteip)
   {
      this.remoteip=remoteip;
  }

public String getInDate()
  {
    return indate;
  }

public String getInTime()
{
      return intime;
}

public String getUser_id() {
    return user_id;
 }

public void setUser_id(String user_id) {
    this.user_id = user_id;
  }
  public String getNama_lgkp() {
    return nama_lgkp;
  }
  public void setNama_lgkp(String nama_lgkp) {
    this.nama_lgkp = nama_lgkp;
  }
  public String getNip() {
    return nip;
  }
  public void setNip(String nip) {
    this.nip = nip;
  }
  public String getNama_kantor() {
    return nama_kantor;
  }
  public void setNama_kantor(String nama_kantor) {
    this.nama_kantor = nama_kantor;
  }
  public String getAlamat_kantor() {
    return alamat_kantor;
  }
  public void setAlamat_kantor(String alamat_kantor) {
    this.alamat_kantor = alamat_kantor;
  }
  public String getTelp() {
    return telp;
  }
  public void setTelp(String telp) {
    this.telp = telp;
  }
}