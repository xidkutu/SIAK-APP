package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Pinda extends javax.ejb.EJBObject
{
 public boolean setPinda_wni(Pindah_Wni obj,Vector vt) throws RemoteException;
  public Pindah_Wni getPinda_wni(String no_kk) throws RemoteException;
  public boolean setNumpang_Pindah(pinda_num_suda new_record,String t) throws RemoteException;
 public boolean setKeluarga_Pindah(Kedatan_keluarga obj) throws RemoteException;
  public String setSudah_Pindah(pinda_num_suda new_record,String t,String s,String n) throws RemoteException;
}