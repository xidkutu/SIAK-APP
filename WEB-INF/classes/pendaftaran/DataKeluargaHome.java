package pendaftaran;

import java.math.*;
import java.util.*;
import javax.ejb.*;

public interface DataKeluargaHome
    extends javax.ejb.EJBLocalHome {
  public DataKeluarga create(BigDecimal noKk) throws CreateException;

  public DataKeluarga create(BigDecimal noKk, String namaKep, String alamat,
                             BigDecimal noRt, BigDecimal noRw, String dusun,
                             BigDecimal kodePos, String telp,
                             BigDecimal alsPrmohon, BigDecimal alsNumpang,
                             BigDecimal noProp, BigDecimal noKab,
                             BigDecimal noKec, BigDecimal noKel,
                             BigDecimal userid, String tglInsertion,
                             String tglUpdation, String pflag, String cflag) throws
      CreateException;

  public DataKeluarga create(BigDecimal newnik, BigDecimal noKk, String namaKep,
                             String alamat, BigDecimal noRt, BigDecimal noRw,
                             String dusun, BigDecimal kodePos, String telp,
                             BigDecimal alsPrmohon, BigDecimal alsNumpang,
                             BigDecimal noProp, BigDecimal noKab,
                             BigDecimal noKec, BigDecimal noKel,
                             BigDecimal userid, String tglInsertion,
                             String tglUpdation, String pflag, String cflag,
                             Vector v1) throws CreateException;

  public DataKeluarga create(DataKeluargaDetailBean bean) throws
      CreateException;

  public DataKeluarga findByPrimaryKey(BigDecimal noKk) throws FinderException;
}