package daftar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KunciOtoritas extends javax.ejb.EJBObject
{
  public Vector getDataKunciOtoritas(String no_prop, String no_kab, String no_kec) throws RemoteException;
}