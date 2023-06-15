package pendaftaran;

public class KelahiranObj
    implements java.io.Serializable {

//private BioDataObj record1,record2,record3,record4;

  private BayiData record1 = null;
  private IbuData record2 = null;
  private AyahData record3 = null;
  private PelaporData record4 = null;

  public KelahiranObj() {
  }

  // public KelahiranObj(BioDataObj record1,BioDataObj record2,BioDataObj record3,BioDataObj record4) {
  public KelahiranObj(BayiData record1, IbuData record2, AyahData record3,
                      PelaporData record4) {
    this.record1 = record1;
    this.record2 = record2;
    this.record3 = record3;
    this.record4 = record4;
  }

  public void setRecord1(BayiData record1) {
    this.record1 = record1;
  }

  public void setRecord2(IbuData record2) {
    this.record2 = record2;
  }

  public void setRecord3(AyahData record3) {
    this.record3 = record3;
  }

  public void setRecord4(PelaporData record4) {
    this.record4 = record4;
  }

  public BayiData getRecord1() {
    return record1;
  }

  public IbuData getRecord2() {
    return record2;
  }

  public AyahData getRecord3() {
    return record3;
  }

  public PelaporData getRecord4() {
    return record4;
  }
}