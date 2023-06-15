package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface PindahWniWna1Home extends javax.ejb.EJBLocalHome {
  public PindahWniWna1 create(BigDecimal noKk) throws CreateException;
  public PindahWniWna1 create(Pindah_Wni obj) throws CreateException;
  public PindahWniWna1 findByPrimaryKey(BigDecimal noKk) throws FinderException;
}