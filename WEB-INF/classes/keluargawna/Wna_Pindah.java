package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Wna_Pindah extends javax.ejb.EJBObject
{
  public boolean setPinda_wna(Pindah_Wni obj,Vector vt) throws RemoteException;
  public boolean setNumpang_Wna(pinda_num_suda new_record,String t) throws RemoteException;
  public String setSudah_Wna(pinda_num_suda new_record,String t,String s,String n) throws RemoteException;
}