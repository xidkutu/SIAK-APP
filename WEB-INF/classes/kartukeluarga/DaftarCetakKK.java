package kartukeluarga;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface DaftarCetakKK extends javax.ejb.EJBObject
{
public Vector getAllData(String num_prop,String num_kab,String num_kec,String num_kel,String start,String end,String pflag,String cflag,boolean flag) throws RemoteException;
public String getTotalRecord() throws RemoteException;
public Vector getSpecifickk(String no_kk, String printed, String changed,
                                                   String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException;
public Vector getAllDataWna(String num_prop,String num_kab,String start,String end,String pflag,String cflag,boolean flag) throws RemoteException;
public String getTotalRecordWna() throws RemoteException;
public Vector getSpecifickkWna(String no_kk, String printed, String changed,
                                                   String no_prop, String no_kab) throws RemoteException;
  public Vector getSpecifickkbanyak(String no_kk, String printed, String changed, String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException;
  public Vector getSpecifickknamabanyak(String no_kk, String printed, String changed, String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException;
}
