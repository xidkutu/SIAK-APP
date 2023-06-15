package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Get_AllWilayaha extends javax.ejb.EJBObject
{
  public WIlayahInfo getWilayahList()throws RemoteException,WilayahException;
  public WIlayahInfo getWilayahWna(String nprop,String nkab) throws RemoteException,WilayahException;
  public WIlayahInfo getWilayahWna(String nprop, String nkab,String nkec) throws RemoteException,WilayahException;
}