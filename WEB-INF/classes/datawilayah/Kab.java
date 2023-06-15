package datawilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Kab extends javax.ejb.EJBObject
{
  public boolean checkPropinsi(int a,String str,int b) throws RemoteException;
  public Vector list(String prop) throws RemoteException;
}
