package pendaftaran;
import java.util.Vector;



public class DataWilayahaListInfo implements java.io.Serializable {

  Vector prop;
  Vector kab;
  Vector kec;
  Vector kel;

  public DataWilayahaListInfo() {
  }
  public DataWilayahaListInfo(Vector prop,Vector kab,Vector kec,Vector kel) {
      this.prop=prop;
      this.kab=kab;this.kec=kec;this.kel=kel;

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
