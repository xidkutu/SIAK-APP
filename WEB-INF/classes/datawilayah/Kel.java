package datawilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Kel extends javax.ejb.EJBObject
{
  public boolean checkKelurahan(int a,String str,int b,int c,int d) throws RemoteException;
  public Vector list(String prop,String kab,String kec) throws RemoteException;
}
