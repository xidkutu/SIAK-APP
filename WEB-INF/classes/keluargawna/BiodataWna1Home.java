package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWna1Home extends javax.ejb.EJBLocalHome {
  public BiodataWna1 create(BigDecimal nik) throws CreateException;
  public BiodataWna1 findByPrimaryKey(BigDecimal nik) throws FinderException;
  public BigDecimal getCount(BigDecimal no_kk) throws FinderException;
}