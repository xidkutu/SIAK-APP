package keluargawna;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class WilayahException extends Exception {
  String msg=null;
  public WilayahException(String msg) {
    this.msg=msg;
  }
 public String toString()
    {
     return("[" + msg + "]");

    }
}