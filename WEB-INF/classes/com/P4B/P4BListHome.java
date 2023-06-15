package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface P4BListHome extends javax.ejb.EJBHome {
  public P4BList create() throws CreateException, RemoteException;
}