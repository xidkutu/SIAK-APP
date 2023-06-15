package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface SetupKabHome
    extends javax.ejb.EJBLocalHome {
  public SetupKab create(BigDecimal noKab, BigDecimal noProp) throws
      CreateException;

  public SetupKab findByPrimaryKey(SetupKabPK pk) throws FinderException;
}