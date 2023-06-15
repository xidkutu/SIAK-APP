package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Daftar extends javax.ejb.EJBObject {
  public Vector daftarKeluarga(String no_kk, String nik) throws RemoteException;
  public java.util.Vector getListHubugan() throws RemoteException;
}