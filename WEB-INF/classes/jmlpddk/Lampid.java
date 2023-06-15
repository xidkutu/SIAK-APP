package jmlpddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Lampid extends javax.ejb.EJBObject
{
  public Vector getDataLampid(String no_prop, String no_kab,
                              String no_kec, String year) throws RemoteException;
}