package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface SetupKelHome
    extends javax.ejb.EJBLocalHome {
  public SetupKel create(BigDecimal noKel, BigDecimal noKec, BigDecimal noKab,
                         BigDecimal noProp) throws CreateException;

  public SetupKel findByPrimaryKey(SetupKelPK pk) throws FinderException;
}