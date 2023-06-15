package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWna2Home extends javax.ejb.EJBLocalHome {
  public BiodataWna2 create(BigDecimal nik) throws CreateException;
  public BiodataWna2 findByPrimaryKey(BigDecimal nik) throws FinderException;
}