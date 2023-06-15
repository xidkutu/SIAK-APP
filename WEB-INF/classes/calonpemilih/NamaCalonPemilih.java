package calonpemilih;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

import jmlpddk.agama.InfoWilayah;

public interface NamaCalonPemilih extends javax.ejb.EJBObject
{
  public Vector getDataCalonPemilih(String no_prop, String no_kab,
                                    String no_kec, String no_kel) throws RemoteException;
  public Vector getDataCalonPemilihFor(String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException;
}