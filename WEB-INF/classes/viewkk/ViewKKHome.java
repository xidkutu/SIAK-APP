package viewkk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import kartukeluarga.*;

public interface ViewKKHome extends javax.ejb.EJBHome {
  public ViewKK create() throws CreateException, RemoteException;
}