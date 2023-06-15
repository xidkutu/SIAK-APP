package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWnaHome extends javax.ejb.EJBLocalHome {
  public BiodataWna create(BigDecimal nik) throws CreateException;
  public BiodataWna create(GdataWna obj) throws CreateException;
  public BiodataWna findByPrimaryKey(BigDecimal nik) throws FinderException;
}