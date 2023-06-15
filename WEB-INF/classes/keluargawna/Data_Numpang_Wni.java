package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Data_Numpang_Wni extends javax.ejb.EJBObject {
  public Vector numpangKeluarga(String no_kk, String nik) throws RemoteException;
  public java.util.Vector getListHubugan() throws RemoteException;
}