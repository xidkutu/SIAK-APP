package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface AngotasMove extends javax.ejb.EJBObject {
  public boolean nump_insert(Vector v) throws RemoteException;
  public boolean nump_insert(java.util.Vector v,String source,String no_prop,String no_kab,String no_kec,String no_kel,String no_kk_lma) throws RemoteException;
}