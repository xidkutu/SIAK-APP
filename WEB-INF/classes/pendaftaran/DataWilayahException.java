package pendaftaran;

public class DataWilayahException extends Exception {
  String msg=null;
   public DataWilayahException(){}
  public DataWilayahException(String msg) {
    this.msg=msg;
  }
 public String toString()
    {
     return("[" + msg + "]");

    }
}
