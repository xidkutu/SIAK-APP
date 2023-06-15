package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface KelrgaPindahWniWna1Home extends javax.ejb.EJBLocalHome {
  public KelrgaPindahWniWna1 create(BigDecimal nik) throws CreateException;
  public KelrgaPindahWniWna1 findByPrimaryKey(BigDecimal nik) throws FinderException;
  public Collection getAnggota(BigDecimal nokk) throws FinderException;
  public KelrgaPindahWniWna1 create(Pindah_Wni obj, GetKelrgaPindah new_record) throws CreateException;
}