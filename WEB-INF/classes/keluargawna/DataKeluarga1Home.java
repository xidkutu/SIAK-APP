package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface DataKeluarga1Home extends javax.ejb.EJBLocalHome {
  public DataKeluarga1 create(BigDecimal noKk) throws CreateException;
  public DataKeluarga1 create(PermohonKK new_record) throws CreateException;
  public DataKeluarga1 findByPrimaryKey(BigDecimal noKk) throws FinderException;
}