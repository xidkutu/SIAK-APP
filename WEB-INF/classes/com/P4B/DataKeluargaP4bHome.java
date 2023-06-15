package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface DataKeluargaP4bHome extends javax.ejb.EJBLocalHome {
  public DataKeluargaP4b create(String noKk) throws CreateException;
  public DataKeluargaP4b findByPrimaryKey(String noKk) throws FinderException;
}