package laporan;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface List_Wilayah extends javax.ejb.EJBObject
{
  public Vector getTotJumlah(String no_prop,String no_kab,String no_kec,String no_kel,String thu) throws RemoteException;
  public Vector getTotJumlahp4b(String no_prop,String no_kab,String no_kec,String no_kel,String thu) throws RemoteException;
  public Vector getTotCacat(String no_prop,String no_kab,String no_kec) throws RemoteException;
  public Vector getTotDarah(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi) throws RemoteException;
  public Vector getTotAkhir(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi) throws RemoteException;
public Vector getTotAkhirp4b(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi) throws RemoteException;
  public Hashtable getTotPekerj(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi) throws RemoteException;

  public Vector getRatio() throws RemoteException;
  public Vector getPerKawinan() throws RemoteException;
  public Vector getBukuPenWni(String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
  public Vector getBukuPenduduk(String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
  public Vector getBukuWajib(String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
  public Vector getStatPerkawin(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi) throws RemoteException;
  public Vector getAgama(String no_prop,String no_kab,String no_kec) throws RemoteException;
 public Vector getAgamap4b(String no_prop,String no_kab,String no_kec) throws RemoteException;

}
