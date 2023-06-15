package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import pendaftaran.*;

public interface DataKeluarga4Home extends javax.ejb.EJBLocalHome {
  public DataKeluarga4 create(BigDecimal noKk) throws CreateException;
  public DataKeluarga4 findByPrimaryKey(BigDecimal noKk) throws FinderException;
  public DataKeluarga4 create(Kedatan_keluarga obj, String ALAMAT, String NO_RT, String NO_RW, String DUSUN, String KODE_POS, String TELP) throws CreateException;
  public DataKeluarga4 create(pinda_num_suda new_record, String name, String np, String nk, String nc, String nl) throws CreateException;
}