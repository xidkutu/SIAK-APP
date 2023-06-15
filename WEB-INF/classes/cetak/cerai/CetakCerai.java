package cetak.cerai;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

import kartukeluarga.*;

public interface CetakCerai extends javax.ejb.EJBObject,java.io.Serializable
{
  public Vector getAllDataMember(int start, int end, int pageno) throws RemoteException;
  public int getTotalRecords() throws RemoteException;
  public boolean getLinkEnabled() throws RemoteException;
  public int getPageNo() throws RemoteException;
  public DataWilayah getDataWilayah() throws RemoteException;
  public CetakCeraiObject getSpecificAkta(String no_akta_cerai, String printed, String changed
                                          , String type, String no_prop, String no_kab) throws RemoteException;

  public int[] updatePrintStatus(Vector vAkta, String pflag, String cflag,Vector vTglCetak) throws RemoteException;
  public void retrieveData(String no_prop, String no_kab, String nama_prop, String nama_kab,
                        String printed, String changed, String status, String kewarganegaraan)
   throws RemoteException;

}