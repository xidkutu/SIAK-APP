package pendaftaran;

import java.io.*;
import java.math.*;

public class SetupKelPK
    implements Serializable {
  public BigDecimal noKel;
  public BigDecimal noKec;
  public BigDecimal noKab;
  public BigDecimal noProp;

  public SetupKelPK() {
  }

  public SetupKelPK(BigDecimal noKel, BigDecimal noKec, BigDecimal noKab,
                    BigDecimal noProp) {
    this.noKel = noKel;
    this.noKec = noKec;
    this.noKab = noKab;
    this.noProp = noProp;
  }

  public boolean equals(Object obj) {
    if (obj != null) {
      if (this.getClass().equals(obj.getClass())) {
        SetupKelPK that = (SetupKelPK) obj;
        return ( ( (this.noKel == null) && (that.noKel == null)) ||
                (this.noKel != null && this.noKel.equals(that.noKel))) &&
            ( ( (this.noKec == null) && (that.noKec == null)) ||
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
    return (noKel + "" + noKec + noKab + "" + noProp).hashCode();
  }
}
