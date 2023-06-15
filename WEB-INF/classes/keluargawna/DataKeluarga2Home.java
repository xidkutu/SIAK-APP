package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface DataKeluarga2Home extends javax.ejb.EJBLocalHome {
  public DataKeluarga2 create(BigDecimal noKk) throws CreateException;
  public DataKeluarga2 create(PermohonKK_Wna new_record) throws CreateException;
  public DataKeluarga2 create(PermohonKK_Wna new_record, String source) throws CreateException;
  public DataKeluarga2 findByPrimaryKey(BigDecimal noKk) throws FinderException;
}