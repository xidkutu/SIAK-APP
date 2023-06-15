package biodata;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

import kartukeluarga.DataWilayah;

public interface Biodata extends javax.ejb.EJBObject
{
    public int[] updatePrintStatus(Vector vNik) throws RemoteException;
    public int[] updatePrintStatusP4B(Vector vNik) throws RemoteException;
    public int[] updatePrintStatusWna(Vector vNik) throws RemoteException;
    public Vector getAllData(String num_prop,String num_kab,String num_kec,String num_kel,String start,String end,String pflag,String cflag,boolean flag) throws RemoteException;
    public Vector getAllDataP4B(String num_prop,String num_kab,String num_kec,String num_kel,String start,String end,String pflag,String cflag,boolean flag) throws RemoteException;
    public Vector getAllDataWna(String num_prop,String num_kab,String start,String end,String pflag,String cflag,boolean flag) throws RemoteException;
    public Vector getSpecificNik(String nik, String printed, String changed,
                                 String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException;
    public Vector getSpecificNikP4B(String nik, String printed, String changed,
                                    String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException;
    public Vector getSpecificNikWna(String nik, String printed, String changed,
                                    String no_prop, String no_kab ) throws RemoteException;
    public String getTotalRecord() throws RemoteException;
    public String getTotalRecordP4B() throws RemoteException;
    public String getTotalRecordWna() throws RemoteException;
  }
