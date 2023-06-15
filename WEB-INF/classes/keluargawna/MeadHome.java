package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface MeadHome extends javax.ejb.EJBHome {
  public Mead create() throws CreateException, RemoteException;
}