package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWni2Home extends javax.ejb.EJBLocalHome {
  public BiodataWni2 create(BigDecimal nik) throws CreateException;
  public BiodataWni2 findByPrimaryKey(BigDecimal nik) throws FinderException;
}