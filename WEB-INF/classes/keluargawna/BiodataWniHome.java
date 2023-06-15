package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWniHome extends javax.ejb.EJBLocalHome {
  public BiodataWni create(BigDecimal nik) throws CreateException;
  public BiodataWni findByPrimaryKey(BigDecimal nik) throws FinderException;
}