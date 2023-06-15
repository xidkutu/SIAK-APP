package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Wni_Numpang extends javax.ejb.EJBObject {
  public boolean nump_insert(Vector v) throws RemoteException;
}