package keluargawna;
import java.util.Vector;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class WIlayahInfo implements java.io.Serializable {

  Vector prop;
  Vector kab;
  Vector kec;
  Vector kel;

  public WIlayahInfo(Vector kec, Vector kel)
  {
    this.kec=kec;
    this.kel=kel;
  }

    public Vector getWnakec()
        {
          return(kec);
        }

    public Vector getWnakel()
            {
              return(kel);
            }

  public WIlayahInfo(Vector prop,Vector kab,Vector kec,Vector kel) {
    this.prop=prop;
    this.kab=kab;this.kec=kec;this.kel=kel;

    }

   public WIlayahInfo(Vector kel)
    {
      this.kel=kel;
    }


public Vector getPropinsi()
    {
      return(prop);
    }
public Vector getKabupaten()
    {
      return(kab);
    }
public Vector getKecamtan()
        {
          return(kec);
        }

public Vector getKelurahan()
            {
              return(kel);
            }
}
