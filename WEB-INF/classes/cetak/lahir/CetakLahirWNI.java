package cetak.lahir;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import kartukeluarga.*;

public interface CetakLahirWNI extends javax.ejb.EJBObject,java.io.Serializable
{
   public Vector getAllDataMember(int start, int end, int pageno) throws RemoteException;
   public int getTotalRecords() throws RemoteException;
   public boolean getLinkEnabled() throws RemoteException;
   public int getPageNo() throws RemoteException;
   public DataWilayah getDataWilayah() throws RemoteException;
   public CetakLahirObject getSpecificAkta(String no_akta_lahir, String printed,
                                           String changed, String kewarganegaraan,
                                           String no_prop, String no_kab) throws RemoteException;

   public int[] updatePrintStatus(Vector vAkta, String pflag, String cflag, Vector vTgl_ctk, String update) throws RemoteException;
   public void retrieveData(String no_prop, String no_kab, String nama_prop, String nama_kab,
                         String printed, String changed, String status, String kewarganegaraan)
    throws RemoteException;
   public Vector getAllBayiMati(String no_prop,String no_kab) throws RemoteException;
}