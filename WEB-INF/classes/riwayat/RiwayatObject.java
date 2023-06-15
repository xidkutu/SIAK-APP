package riwayat;

import java.io.*;

public class RiwayatObject implements Serializable {
  private String nik;
  private String nama_lengkp;
  private String no_kk;
  private String nama_kk;
  private String almt;
  private String rt;
  private String rw;
  private String dusun;
  private String kode_pos;
  private String telp;
  private String renc_tgl;
  private String tgl_dtng;
  private String nama_camat;
  private String nama_lur;
  private String nama_pet;

  public RiwayatObject() {
  }

  public RiwayatObject(String nik,String nama_lengkp,String no_kk,
                       String nama_kk,String almt,String rt,
                       String rw,String dusun,String kode_pos,
                        String telp, String renc_tgl,String tgl_dtng,
                        String nama_camat,String nama_lur,String nama_pet)
  {
    this.nik = nik;
    this.nama_lengkp = nama_lengkp;
    this.no_kk = no_kk;
    this.nama_kk = nama_kk;
    this.almt = (almt==null)?"-":almt;
    this.rt = (rt==null)?"-":rt;
    this.rw = (rw==null)?"-":rw;
    this.dusun=(dusun==null)?"-":dusun;
    this.kode_pos=(kode_pos==null)?"-":kode_pos;
    this.telp=(telp==null)?"-":telp;
    this.renc_tgl = (renc_tgl==null)?"-":renc_tgl;
    this.tgl_dtng = (tgl_dtng==null)?"-":tgl_dtng;
    this.nama_camat=(nama_camat==null)?"-":nama_camat;
    this.nama_lur=(nama_lur==null)?"-":nama_lur;
    this.nama_pet=(nama_pet==null)?"-":nama_pet;
  }


  public String getNik() {
    return nik;
  }
  public void setNik(String nik) {
    this.nik = nik;
  }
  public String getNama_lengkp() {
    return nama_lengkp;
  }
  public void setNama_lengkp(String nama_lengkp) {
    this.nama_lengkp = nama_lengkp;
  }
  public String getNo_kk() {
    return no_kk;
  }
  public void setNo_kk(String no_kk) {
    this.no_kk = no_kk;
  }
  public String getNama_kk() {
    return nama_kk;
  }
  public void setNama_kk(String nama_kk) {
    this.nama_kk = nama_kk;
  }
  public String getAlmt() {
    return (almt.trim()+" , NO.RT : " + rt.trim() + " , NO_RW : " + rw.trim() + " , Dusun : " + dusun.trim() + " , Kode pos :" + kode_pos.trim() + " , Telp : " + telp.trim());
  }
  public void setAlmt(String almt) {
    this.almt = almt;
  }
  public String getRt() {
    return rt;
  }
  public void setRt(String rt) {
    this.rt = rt;
  }
  public String getRw() {
    return rw;
  }
  public void setRw(String rw) {
    this.rw = rw;
  }
  public String getDusun() {
    return dusun;
  }
  public void setDusun(String dusun) {
    this.dusun = dusun;
  }
  public String getKode_pos() {
    return kode_pos;
  }
  public void setKode_pos(String kode_pos) {
    this.kode_pos = kode_pos;
  }
  public String getTelp() {
    return telp;
  }
  public void setTelp(String telp) {
    this.telp = telp;
  }
  public String getRenc_tgl() {
    return renc_tgl;
  }
  public void setRenc_tgl(String renc_tgl) {
    this.renc_tgl = renc_tgl;
  }
  public String getTgl_dtng() {
    return tgl_dtng;
  }
  public void setTgl_dtng(String tgl_dtng) {
    this.tgl_dtng = tgl_dtng;
  }
  public String getNama_camat() {
    return nama_camat;
  }
  public void setNama_camat(String nama_camat) {
    this.nama_camat = nama_camat;
  }
  public String getNama_lur() {
    return nama_lur;
  }
  public void setNama_lur(String nama_lur) {
    this.nama_lur = nama_lur;
  }
  public String getNama_pet() {
    return nama_pet;
  }
  public void setNama_pet(String nama_pet) {
    this.nama_pet = nama_pet;
  }
  private void writeObject(ObjectOutputStream oos) throws IOException {
    oos.defaultWriteObject();
  }
  private void readObject(ObjectInputStream ois) throws ClassNotFoundException, IOException {
    ois.defaultReadObject();
  }
}