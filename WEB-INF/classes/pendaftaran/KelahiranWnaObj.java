package pendaftaran;

public class KelahiranWnaObj
    implements java.io.Serializable {

  private BayiDataWna record1 = null;
  private IbuDataWna record2 = null;
  private AyahDataWna record3 = null;
  private PelaporDataWna record4 = null;

  public KelahiranWnaObj() {
  }

  public KelahiranWnaObj(BayiDataWna record1, IbuDataWna record2,
                         AyahDataWna record3, PelaporDataWna record4) {
    this.record1 = record1;
    this.record2 = record2;
    this.record3 = record3;
    this.record4 = record4;
  }

  public void setRecord1(BayiDataWna record1) {
    this.record1 = record1;
  }

  public void setRecord2(IbuDataWna record2) {
    this.record2 = record2;
  }

  public void setRecord3(AyahDataWna record3) {
    this.record3 = record3;
  }

  public void setRecord4(PelaporDataWna record4) {
    this.record4 = record4;
  }

  public BayiDataWna getRecord1() {
    return record1;
  }

  public IbuDataWna getRecord2() {
    return record2;
  }

  public AyahDataWna getRecord3() {
    return record3;
  }

  public PelaporDataWna getRecord4() {
    return record4;
  }
}
