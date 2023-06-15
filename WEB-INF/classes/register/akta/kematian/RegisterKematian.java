package register.akta.kematian;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RegisterKematian extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab) throws RemoteException;
  public Vector getPersyaratanAktaMati(String no_persyaratan) throws RemoteException;

}