package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface WnaKKHome extends javax.ejb.EJBHome {
  public WnaKK create() throws CreateException, RemoteException;
}