package buku.ubahkepkel.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface BukuUbahKepkel extends javax.ejb.EJBObject
{
  public Vector getDataBukuUbahKepkelPenduduk(String no_prop, String no_kab,
                                            String no_kec) throws RemoteException;
}