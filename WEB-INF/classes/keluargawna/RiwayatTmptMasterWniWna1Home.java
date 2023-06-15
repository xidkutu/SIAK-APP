package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface RiwayatTmptMasterWniWna1Home extends javax.ejb.EJBLocalHome {
  public RiwayatTmptMasterWniWna1 create(BigDecimal noKkLma) throws CreateException;
  public RiwayatTmptMasterWniWna1 create(Kedatan_keluarga obj, String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP) throws CreateException;
  public RiwayatTmptMasterWniWna1 create(pinda_num_suda new_record,String np, String nk, String nc, String nl) throws CreateException;
  public RiwayatTmptMasterWniWna1 findByPrimaryKey(BigDecimal noKkLma) throws FinderException;
}