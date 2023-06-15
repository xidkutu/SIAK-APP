package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface DataKeluarga1Home extends javax.ejb.EJBLocalHome {
  public DataKeluarga1 create(String noKk) throws CreateException;
  public DataKeluarga1 createKK(P4BBioObject form) throws CreateException;
  public DataKeluarga1 findByPrimaryKey(String noKk) throws FinderException;
}