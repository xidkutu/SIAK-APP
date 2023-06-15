package pendaftaran;

public class DataWilayahaException
    extends Exception {
  String msg = null;
  public DataWilayahaException() {}

  public DataWilayahaException(String msg) {
    this.msg = msg;
  }

  public String toString() {
    return ("[" + msg + "]");

  }
}
