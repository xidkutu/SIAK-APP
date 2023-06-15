package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface DataKeluargaHome extends javax.ejb.EJBLocalHome {
  public DataKeluarga create(BigDecimal noKk) throws CreateException;
  public DataKeluarga create(GdataWna obj,GdataKelu kelu) throws CreateException;
  public DataKeluarga findByPrimaryKey(BigDecimal noKk) throws FinderException;
}