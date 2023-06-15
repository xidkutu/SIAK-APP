package ulang;

import java.util.*;

public class UlangObject implements java.io.Serializable{
  private String authBy;
  private String authTo;
  private String itemAuth;
  private Date dateAuth;
  private String jenisDoc;
  private int countCetak;

  public UlangObject() {};

  public UlangObject(String authBy, String authTo, String itemAuth, Date dateAuth, String jenisDoc, int countCetak) {
    this.authBy= authBy;
    this.authTo = authTo;
    this.itemAuth = itemAuth;
    this.dateAuth = dateAuth;
    this.jenisDoc = jenisDoc;
    this.countCetak = countCetak;
  }
  public String getAuthBy() {
    return authBy;
  }
  public void setAuthBy(String authBy) {
    this.authBy = authBy;
  }
  public String getAuthTo() {
    return authTo;
  }
  public void setAuthTo(String authTo) {
    this.authTo = authTo;
  }
  public String getItemAuth() {
    return itemAuth;
  }
  public void setItemAuth(String itemAuth) {
    this.itemAuth = itemAuth;
  }
  public java.util.Date getDateAuth() {
    return dateAuth;
  }
  public void setDateAuth(java.util.Date dateAuth) {
    this.dateAuth = dateAuth;
  }
  public String getJenisDoc() {
    return jenisDoc;
  }
  public void setJenisDoc(String jenisDoc) {
    this.jenisDoc = jenisDoc;
  }
  public int getCountCetak() {
    return countCetak;
  }
  public void setCountCetak(int countCetak) {
    this.countCetak = countCetak;
  }
}