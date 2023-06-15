package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface BiodataWni1Home extends javax.ejb.EJBLocalHome {
  public BiodataWni1 create(String nik) throws CreateException;
  public BiodataWni1 createBio(P4BBioObject form) throws CreateException;
  public BiodataWni1 findByPrimaryKey(String nik) throws FinderException;
}