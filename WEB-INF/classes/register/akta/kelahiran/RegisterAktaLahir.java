package register.akta.kelahiran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RegisterAktaLahir extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vNik, String nama_prop, String nama_kab) throws RemoteException;
  public Vector getPersyaratanLahir(String no_persyaratan) throws RemoteException;
}