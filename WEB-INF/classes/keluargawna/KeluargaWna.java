package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KeluargaWna extends javax.ejb.EJBObject {
  public Vector daftarKeluarga(String no_kk) throws RemoteException;  /*Old Version*/
  public Vector daftarKeluarga(String no_kk,String source,String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException; /*New Version*/
  public Vector daftarKK(String no_kk,String source) throws RemoteException; /*New Version For Tujuan Only*/
  public java.util.Vector getListHubugan() throws RemoteException;
}