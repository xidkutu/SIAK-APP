package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Wni_NumpangHome extends javax.ejb.EJBHome {
  public Wni_Numpang create() throws CreateException, RemoteException;
}