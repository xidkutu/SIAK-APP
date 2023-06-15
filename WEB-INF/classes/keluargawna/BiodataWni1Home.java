package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWni1Home extends javax.ejb.EJBLocalHome {
  public BiodataWni1 create(BigDecimal nik) throws CreateException;
  public BiodataWni1 findByPrimaryKey(BigDecimal nik) throws FinderException;
}