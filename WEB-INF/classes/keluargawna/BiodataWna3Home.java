package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWna3Home extends javax.ejb.EJBLocalHome {
  public BiodataWna3 create(BigDecimal nik) throws CreateException;
  public BiodataWna3 findByPrimaryKey(BigDecimal nik) throws FinderException;
}