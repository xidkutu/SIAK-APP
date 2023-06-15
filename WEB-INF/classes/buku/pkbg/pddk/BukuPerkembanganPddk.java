package buku.pkbg.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import jmlpddk.agama.InfoWilayah;

public interface BukuPerkembanganPddk extends javax.ejb.EJBObject
{
  public Vector getDataBukuPerkembanganPenduduk(String no_prop, String no_kab,
                                                       String no_kec, String no_kel) throws RemoteException;
}