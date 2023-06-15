package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface SetupKecHome
    extends javax.ejb.EJBLocalHome {
  public SetupKec create(BigDecimal noKec, BigDecimal noKab, BigDecimal noProp) throws
      CreateException;

  public SetupKec findByPrimaryKey(SetupKecPK pk) throws FinderException;
}