package estimasi;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface NikGanda extends javax.ejb.EJBObject
{
  public Vector getDaftarEstimasiNikGandaWNI(String date) throws RemoteException;
  public Vector getDaftarEstimasiNikGandaWNI(String no_prop,String no_kab,String date) throws RemoteException;
  public Vector getDaftarEstimasiNikGandaWNI(String no_prop,String no_kab,String no_kec,String date) throws RemoteException;
  public Vector getDaftarEstimasiNikGandaWNA(String date) throws RemoteException;
  public Vector getDaftarEstimasiNikGandaWNA(String no_prop,String no_kab,String date) throws RemoteException;
  public Vector getDaftarEstimasiNikGandaWNA(String no_prop,String no_kab,String no_kec,String date) throws RemoteException;
  public boolean deleteNikGanda(String level,String nik) throws RemoteException;
}