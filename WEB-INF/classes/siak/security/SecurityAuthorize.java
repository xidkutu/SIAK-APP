package siak.security;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface SecurityAuthorize extends javax.ejb.EJBObject
{
  public Vector getDaftarPengguna(int level, String divisi,String no_prop,
                                  String no_kab, String no_kec) throws RemoteException;
    public SecurityObject getDataPenggunaUser(String user_id) throws RemoteException;
  public boolean authorizeUser(Vector user_auth_id , String user_auth_by) throws RemoteException;
}