package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWni3Home extends javax.ejb.EJBLocalHome {
  public BiodataWni3 create(BigDecimal nik) throws CreateException;
  public BiodataWni3 findByPrimaryKey(BigDecimal nik) throws FinderException;
  public BigDecimal getCount(BigDecimal no_kk);
}