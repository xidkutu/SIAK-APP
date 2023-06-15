package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface RiwayatTmptDetailWniWnaHome extends javax.ejb.EJBLocalHome {
  public RiwayatTmptDetailWniWna create(BigDecimal nik) throws CreateException;
  public RiwayatTmptDetailWniWna create(String nik,String nlkg,String nolama,String nobru) throws CreateException;
  public RiwayatTmptDetailWniWna findByPrimaryKey(BigDecimal nik) throws FinderException;
}