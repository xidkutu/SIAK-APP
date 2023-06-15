package view.ktp.wni;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface ViewCetakKTP extends javax.ejb.EJBObject
{
   public Vector retrieveData(Vector vNik, String nama_prop, String nama_kab,
                          String nama_kec, String nama_kel,
                          String type) throws RemoteException;
    public Vector retrieveDataPVC(Vector vNik, String nama_prop, String nama_kab,
                          String nama_kec, String nama_kel,
                         String type) throws RemoteException;
}