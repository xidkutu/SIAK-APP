package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface P4bBioDataHome extends javax.ejb.EJBHome {
  public P4bBioData create() throws CreateException, RemoteException;
}