package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface PindahWniWnaHome extends javax.ejb.EJBLocalHome {
  public PindahWniWna create(BigDecimal noKk) throws CreateException;
  public PindahWniWna create(Pindah_Wni obj, java.util.Vector vt) throws CreateException;
  public PindahWniWna findByPrimaryKey(BigDecimal noKk) throws FinderException;
}