package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface BiodataWnaHome
    extends javax.ejb.EJBLocalHome {
  public BiodataWna create(BigDecimal nik) throws CreateException;

  public BiodataWna findByPrimaryKey(BigDecimal nik) throws FinderException;
}