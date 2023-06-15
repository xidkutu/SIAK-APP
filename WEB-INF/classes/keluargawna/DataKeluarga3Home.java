package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface DataKeluarga3Home extends javax.ejb.EJBLocalHome {
  public DataKeluarga3 create(BigDecimal noKk) throws CreateException;
  public DataKeluarga3 create(pinda_num_suda new_record,String n,String np,String nk,String nc,String nl) throws CreateException;
  public DataKeluarga3 create(String n,String np,String nk,String nc,String nl,pinda_num_suda new_record) throws CreateException;
  public DataKeluarga3 findByPrimaryKey(BigDecimal noKk) throws FinderException;
}