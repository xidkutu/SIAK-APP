package pendaftaran;

import java.io.*;
import java.math.*;

public class SetupKabPK
    implements Serializable {
  public BigDecimal noKab;
  public BigDecimal noProp;

  public SetupKabPK() {
  }

  public SetupKabPK(BigDecimal noKab, BigDecimal noProp) {
    this.noKab = noKab;
    this.noProp = noProp;
  }

  public boolean equals(Object obj) {
    if (obj != null) {
      if (this.getClass().equals(obj.getClass())) {
        SetupKabPK that = (SetupKabPK) obj;
        return ( ( (this.noKab == null) && (that.noKab == null)) ||
                (this.noKab != null && this.noKab.equals(that.noKab))) &&
            ( ( (this.noProp == null) && (that.noProp == null)) ||
             (this.noProp != null && this.noProp.equals(that.noProp)));
      }
    }
    return false;
  }

  public int hashCode() {
    return (noKab + "" + noProp).hashCode();
  }
}
