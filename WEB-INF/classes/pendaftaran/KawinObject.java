package pendaftaran;

public class KawinObject
    implements java.io.Serializable {

  WniWnaObj record1, record2;

  public KawinObject() {
  }

  public KawinObject(WniWnaObj record1, WniWnaObj record2) {
    this.record1 = record1;
    this.record2 = record2;
  }

  public void setRecord1(WniWnaObj record1) {
    this.record1 = record1;
  }

  public WniWnaObj getRecord1() {
    return record1;
  }

  public void setRecord2(WniWnaObj record2) {
    this.record2 = record2;
  }

  public WniWnaObj getRecord2() {
    return record2;
  }

}