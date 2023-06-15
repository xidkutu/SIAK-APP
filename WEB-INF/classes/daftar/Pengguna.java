package daftar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import pendaftaran.*;

public interface Pengguna extends javax.ejb.EJBObject
{
  public Vector getDataPengguna(String no_prop, String no_kab, String no_kec) throws RemoteException;
  public Vector getDataAdministrasiPengguna(String no_prop, String no_kab, String no_kec) throws RemoteException;
  public boolean deleteDataAdministrasiPengguna(String user_id) throws RemoteException;
  public boolean changeStatus(String user_id, String currentStatus) throws RemoteException;

  public boolean resetLogin(Login home) throws RemoteException;
}