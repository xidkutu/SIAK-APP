package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Num_Wna_Data extends javax.ejb.EJBObject {
  public Vector numpangKeluarga(String no_kk,String no_prop,String no_kab) throws RemoteException;
  public Vector numpangKeluarga(String no_kk_lma,String no_kk_baru,String num_prop,String num_kab) throws RemoteException;
  public Vector numpangKeluarga(String no_kk_lma,String no_kk_baru,String num_prop,String num_kab,String num_kec,String source) throws RemoteException;
  public Vector numpangKeluarga(String no_kk_lma,String no_kk_baru,String num_prop,String num_kab,String num_kec,String num_kel,String source) throws RemoteException;
  public Vector numpangKeluarga_new(String no_kk,String num_prop,String num_kab,String num_kec,String num_kel,String source) throws RemoteException;
  public java.util.Vector getListHubugan() throws RemoteException;
  public Vector numpangTujuan(String no_kk_lma,String no_kk_baru,String source) throws RemoteException;
}
