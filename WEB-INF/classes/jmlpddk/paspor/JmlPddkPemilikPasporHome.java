package jmlpddk.paspor;

import javax.ejb.*;
import java.rmi.*;

public interface JmlPddkPemilikPasporHome extends javax.ejb.EJBHome {
  public JmlPddkPemilikPaspor create() throws CreateException, RemoteException;
}