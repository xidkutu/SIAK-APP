package setupwilayah;
import java.util.Vector;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class getWilayah implements java.io.Serializable {

  Vector prop;
  Vector kab;
  public getWilayah(Vector prop,Vector kab) {
    this.prop=prop;
    this.kab=kab;

    }
   public Vector getPropinsi()
    {
      return(prop);
    }
  public Vector getKabupaten()
    {
      return(kab);
    }
}
