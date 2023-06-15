package pendaftaran;

import java.io.*;
import java.math.*;

public class SetupKecPK
    implements Serializable {

  public BigDecimal noKec;
  public BigDecimal noKab;
  public BigDecimal noProp;

  public SetupKecPK() {
  }

  public SetupKecPK(BigDecimal noKec, BigDecimal noKab, BigDecimal noProp) {
    this.noKec = noKec;
    this.noKab = noKab;
    this.noProp = noProp;
  }

  public boolean equals(Object obj) {
    if (obj != null) {
      if (this.getClass().equals(obj.getClass())) {
        SetupKecPK that = (SetupKecPK) obj;
        return ( ( (this.noKec == null) && (that.noKec == null)) ||
                (this.noKec != null && this.noKec.equals(that.noKec))) &&
            ( ( (this.noKab == null) && (that.noKab == null)) ||
             (this.noKab != null && this.noKab.equals(that.noKab))) &&
            ( ( (this.noProp == null) && (that.noProp == null)) ||
             (this.noProp != null && this.noProp.equals(that.noProp)));
      }
    }
    return false;
  }

  public int hashCode() {
    return (noKec + "" + noKab + noProp).hashCode();
  }
}
