package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;
import com.db.connection.*;

public interface RiwayatTmptMasterWniWnaHome extends javax.ejb.EJBLocalHome {
  public RiwayatTmptMasterWniWna create(BigDecimal noKkLma) throws CreateException;
  public RiwayatTmptMasterWniWna create(pinda_num_suda new_record) throws CreateException;
  public RiwayatTmptMasterWniWna create(Kedatan_keluarga obj, String ALAMAT,String NO_RT,String NO_RW,String DUSUN,String KODE_POS,String TELP) throws CreateException;
  public RiwayatTmptMasterWniWna findByPrimaryKey(BigDecimal noKkLma) throws FinderException;
}