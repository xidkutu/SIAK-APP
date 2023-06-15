package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface GetNokk extends javax.ejb.EJBObject {
  public Vector Gnokk(String a) throws RemoteException;
  public Vector GnokkNew(String no_kk,String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
}