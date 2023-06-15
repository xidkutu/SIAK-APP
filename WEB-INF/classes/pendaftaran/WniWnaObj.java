package pendaftaran;

public class WniWnaObj
    implements java.io.Serializable {

  KelahiranObj record1 = null;
  KelahiranWnaObj record2 = null;

  public WniWnaObj() {
  }

  public WniWnaObj(KelahiranObj record1, KelahiranWnaObj record2) {
    this.record1 = record1;
    this.record2 = record2;
  }

  public KelahiranObj getWniObj() {
    return record1;
  }

  public KelahiranWnaObj getWnaObj() {
    return record2;
  }

  public void setWniObj(KelahiranObj record1) {
    this.record1 = record1;
  }

  public void setWnaObj(KelahiranWnaObj record2) {
    this.record2 = record2;
  }
}