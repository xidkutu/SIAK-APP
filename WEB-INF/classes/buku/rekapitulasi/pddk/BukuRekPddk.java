package buku.rekapitulasi.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface BukuRekPddk extends javax.ejb.EJBObject
{
//  public String getSysdate() throws RemoteException;
  public Vector getDataBukuPerkembanganPenduduk(String no_prop, String no_kab,
                                            String no_kec) throws RemoteException;

}