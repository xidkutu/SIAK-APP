package ktp.wni;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import kartukeluarga.*;

public interface CetakKTP extends javax.ejb.EJBObject
{
public int[] updatePrintStatus(Vector vNik, String stat_print, String stat_change) throws RemoteException;
public Vector getAllData(String num_prop,String num_kab,String num_kec,String num_kel,String start,String end,String status_ktp,boolean flag) throws RemoteException;
public String getTotalRecord() throws RemoteException;
public Vector getSpecificNik(String nik,String no_prop, String no_kab, String no_kec, String no_kel,String status_ktp) throws RemoteException;
public Vector getSpecificNama(String nama,String no_prop, String no_kab, String no_kec, String no_kel,String status_ktp) throws RemoteException;
public Vector getAllDataWna(String num_prop,String num_kab,String start,String end,String status_ktp,boolean flag) throws RemoteException;
public String getTotalRecordWna() throws RemoteException;
  public String FileTandaTangan(String deprop, String dekab, String dekec, String dekel) throws RemoteException;
public Vector getSpecificNikWna(String nik,String no_prop, String no_kab,String status_ktp) throws RemoteException;
}