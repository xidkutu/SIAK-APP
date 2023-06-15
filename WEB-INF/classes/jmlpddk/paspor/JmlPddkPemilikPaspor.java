package jmlpddk.paspor;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface JmlPddkPemilikPaspor extends javax.ejb.EJBObject
{
    public Vector getDataPropinsi() throws RemoteException;
    public Vector getDataPenduduk(String no_prop,
                                  String no_kab, String no_kec) throws RemoteException;

}