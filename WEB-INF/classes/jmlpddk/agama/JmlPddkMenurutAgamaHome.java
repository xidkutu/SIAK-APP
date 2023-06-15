package jmlpddk.agama;

import javax.ejb.*;
import java.rmi.*;

public interface JmlPddkMenurutAgamaHome extends javax.ejb.EJBHome
{
  public JmlPddkMenurutAgama create() throws CreateException, RemoteException;
}