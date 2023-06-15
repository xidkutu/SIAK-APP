package datawilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KelHome extends javax.ejb.EJBHome {
  public Kel create() throws CreateException, RemoteException;
}
