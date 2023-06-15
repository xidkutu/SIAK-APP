package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWniP4bHome extends javax.ejb.EJBLocalHome {
  public BiodataWniP4b create(String nik) throws CreateException;
  public BiodataWniP4b findByPrimaryKey(String nik) throws FinderException;
}