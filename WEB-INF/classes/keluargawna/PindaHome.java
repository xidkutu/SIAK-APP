package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface PindaHome extends javax.ejb.EJBHome {
  public Pinda create() throws CreateException, RemoteException;
}