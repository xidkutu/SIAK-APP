package com.list;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface BioWNIListHome extends javax.ejb.EJBHome {
  public BioWNIList create() throws CreateException, RemoteException;
}