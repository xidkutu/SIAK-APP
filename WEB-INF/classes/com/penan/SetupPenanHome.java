package com.penan;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import pendaftaran.*;

public interface SetupPenanHome extends javax.ejb.EJBHome {
  public SetupPenan create() throws CreateException, RemoteException;
}