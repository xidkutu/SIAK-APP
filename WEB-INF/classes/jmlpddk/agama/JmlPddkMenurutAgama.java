package jmlpddk.agama;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface JmlPddkMenurutAgama extends javax.ejb.EJBObject
{
  public Vector getDataPenduduk(String no_prop, String no_kab, String no_kec,
                                String daritanggal, String sampaitanggal,
                                String nama_tabel) throws RemoteException;

    public String getNama_tabel() throws RemoteException;
}