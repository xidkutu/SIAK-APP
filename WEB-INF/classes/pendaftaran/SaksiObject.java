package pendaftaran;

public class SaksiObject
    implements java.io.Serializable {

  private Saksi1Object record1;
  private Saksi2Object record2;
  private Saksi1Object3 record3;
  private Saksi2Object4 record4;
  private PelaporData record5;
  private PelaporDataWna record6;

  private String no_akta_kwn, tgl_akta_kwn;

  public SaksiObject() {
  }

  public SaksiObject(Saksi1Object record1, Saksi2Object record2,
                     Saksi1Object3 record3, Saksi2Object4 record4) {
    this.record1 = record1;
    this.record2 = record2;
    this.record3 = record3;
    this.record4 = record4;
  }

  //added by Yopie
  public SaksiObject(Saksi1Object record1, Saksi2Object record2) {
    this.record1 = record1;
    this.record2 = record2;
  }

  public SaksiObject(Saksi1Object record1, Saksi2Object record2,
                     Saksi1Object3 record3, Saksi2Object4 record4,
                     String no_akta_kwn, String tgl_akta_kwn) {

    this.record1 = record1;
    this.record2 = record2;
    this.record3 = record3;
    this.record4 = record4;

    this.no_akta_kwn = no_akta_kwn;
    this.tgl_akta_kwn = tgl_akta_kwn;

  }

//added by Rajesh
  public SaksiObject(Saksi1Object record1, Saksi2Object record2,
                     Saksi1Object3 record3, Saksi2Object4 record4,
                     PelaporData record5, PelaporDataWna record6,
                     String no_akta_kwn, String tgl_akta_kwn) {
    this.record1 = record1;
    this.record2 = record2;
    this.record3 = record3;
    this.record4 = record4;
    this.record5 = record5;
    this.record6 = record6;

    this.no_akta_kwn = no_akta_kwn;
    this.tgl_akta_kwn = tgl_akta_kwn;

  }

  public void setNo_akta_kwn(String no_akta_kwn) {
    this.no_akta_kwn = no_akta_kwn;
  }

  public String getNo_akta_kwn() {
    return no_akta_kwn;
  }

  public void setTgl_akta_kwn(String tgl_akta_kwn) {
    this.tgl_akta_kwn = tgl_akta_kwn;
  }

  public String getTgl_akta_kwn() {
    return tgl_akta_kwn;
  }

  //end added by Yopie

  public void setSaksi1Record(Saksi1Object record1) {
    this.record1 = record1;
  }

  public Saksi1Object getSaksi1Record() {
    return record1;
  }

  public void setSaksi2Record(Saksi2Object record2) {
    this.record2 = record2;
  }

  public Saksi2Object getSaksi2Record() {
    return record2;
  }

  public void setSaksi1Record3(Saksi1Object3 record3) {
    this.record3 = record3;
  }

  public Saksi1Object3 getSaksi1Record3() {
    return record3;
  }

  public void setSaksi2Record4(Saksi2Object4 record4) {
    this.record4 = record4;
  }

  public Saksi2Object4 getSaksi2Record4() {
    return record4;
  }

//added by Rajesh
  public void setPelaporWni(PelaporData record5) {
    this.record5 = record5;
  }

  public PelaporData getPelaporWni() {
    return record5;
  }

  public void setPelaporWna(PelaporDataWna record6) {
    this.record6 = record6;
  }

  public PelaporDataWna getPelaporWna() {
    return record6;
  }

}
