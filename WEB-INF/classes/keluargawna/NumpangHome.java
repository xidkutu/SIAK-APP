package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface NumpangHome extends javax.ejb.EJBHome {
  public Numpang create() throws CreateException, RemoteException;
}