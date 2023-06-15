package pendaftaran;

import java.io.*;
import java.math.*;

public class DataKeluargaDetailBean
    implements Serializable {
  private BigDecimal noKk;
  private String namaKep;
  private String alamat;
  private BigDecimal noRt;
  private BigDecimal noRw;
  private String dusun;
  private BigDecimal kodePos;
  private String telp;
  private BigDecimal alsPrmohon;
  private BigDecimal alsNumpang;
  private BigDecimal noProp;
  private BigDecimal noKab;
  private BigDecimal noKec;
  private BigDecimal noKel;
  private BigDecimal userid;
  private String tglInsertion;
  private String tglUpdation;
  private String pflag;
  private String cflag;

  public DataKeluargaDetailBean(BigDecimal noKk, String namaKep, String alamat,
                                BigDecimal noRt, BigDecimal noRw,
                                String dusun, BigDecimal kodePos, String telp,
                                BigDecimal alsPrmohon, BigDecimal alsNumpang,
                                BigDecimal noProp, BigDecimal noKab,
                                BigDecimal noKec, BigDecimal noKel,
                                BigDecimal userid,
                                String tglInsertion, String tglUpdation,
                                String pflag, String cflag
                                ) {
    this.noKk = noKk;
    this.namaKep = namaKep;
    this.alamat = alamat;
    this.noRt = noRt;
    this.noRw = noRw;
    this.dusun = dusun;
    this.kodePos = kodePos;
    this.telp = telp;
    this.alsPrmohon = alsPrmohon;
    this.alsNumpang = alsNumpang;
    this.noProp = noProp;
    this.noKab = noKab;
    this.noKec = noKec;
    this.noKel = noKel;
    this.userid = userid;
    this.tglInsertion = tglInsertion;
    this.tglUpdation = tglUpdation;
    this.pflag = pflag;
    this.cflag = cflag;
  }

  public String getAlamat() {
    return alamat;
  }

  public BigDecimal getAlsNumpang() {
    return alsNumpang;
  }

  public BigDecimal getAlsPrmohon() {
    return alsPrmohon;
  }

  public String getCflag() {
    return cflag;
  }

  public String getDusun() {
    return dusun;
  }

  public BigDecimal getKodePos() {
    return kodePos;
  }

  public String getNamaKep() {
    return namaKep;
  }

  public BigDecimal getNoKab() {
    return noKab;
  }

  public BigDecimal getNoKec() {
    return noKec;
  }

  public BigDecimal getNoKel() {
    return noKel;
  }

  public BigDecimal getNoKk() {
    return noKk;
  }

  public BigDecimal getNoProp() {
    return noProp;
  }

  public BigDecimal getNoRt() {
    return noRt;
  }

  public BigDecimal getNoRw() {
    return noRw;
  }

  public String getPflag() {
    return pflag;
  }

  public String getTelp() {
    return telp;
  }

  public String getTglInsertion() {
    return tglInsertion;
  }

  public String getTglUpdation() {
    return tglUpdation;
  }

  public BigDecimal getUserid() {
    return userid;
  }

  public void setUserid(BigDecimal userid) {
    this.userid = userid;
  }

  public void setTglUpdation(String tglUpdation) {
    this.tglUpdation = parsing(tglUpdation);
  }

  public void setTglInsertion(String tglInsertion) {
    this.tglInsertion = parsing(tglInsertion);
  }

  public void setTelp(String telp) {
    this.telp = telp;
  }

  public void setPflag(String pflag) {
    this.pflag = pflag;
  }

  public void setNoRw(BigDecimal noRw) {
    this.noRw = noRw;
  }

  public void setNoRt(BigDecimal noRt) {
    this.noRt = noRt;
  }

  public void setNoProp(BigDecimal noProp) {
    this.noProp = noProp;
  }

  public void setNoKk(BigDecimal noKk) {
    this.noKk = noKk;
  }

  public void setNoKel(BigDecimal noKel) {
    this.noKel = noKel;
  }

  public void setNoKec(BigDecimal noKec) {
    this.noKec = noKec;
  }

  public void setNoKab(BigDecimal noKab) {
    this.noKab = noKab;
  }

  public void setNamaKep(String namaKep) {
    this.namaKep = namaKep;
  }

  public void setDusun(String dusun) {
    this.dusun = dusun;
  }

  public void setCflag(String cflag) {
    this.cflag = cflag;
  }

  public void setAlsPrmohon(BigDecimal alsPrmohon) {
    this.alsPrmohon = alsPrmohon;
  }

  public void setAlsNumpang(BigDecimal alsNumpang) {
    this.alsNumpang = alsNumpang;
  }

  public void setAlamat(String alamat) {
    this.alamat = alamat;
  }

  private String parsing(String tgl) {
    /*
        String tanggal = "", bulan = "", tahun = "";
        if (tgl!=null) {
     java.util.StringTokenizer parser = new java.util.StringTokenizer(tgl.substring(0, 10), "-");
     tanggal = parser.nextToken();
     if (tanggal.length() == 4) {
       tahun = tanggal;
       bulan = parser.nextToken();
       tanggal = parser.nextToken();
     }
     else {
       return tgl;
     }
        }
        return tanggal +"-"+ bulan +"-"+ tahun;
     */
    return DayFormatter.formatDate(tgl);
  }

}
