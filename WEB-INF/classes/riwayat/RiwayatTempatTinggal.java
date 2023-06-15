package riwayat;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RiwayatTempatTinggal extends javax.ejb.EJBObject
{
  public Vector getDataRiwayatTempatTinggal(String nik, int kewarganegaraan,String no_prop,String no_kab,String no_kec) throws RemoteException;
}