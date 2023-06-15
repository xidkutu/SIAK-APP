package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface PindahAsal extends javax.ejb.EJBObject
{
public boolean setPinda_wna(Pindah_Wni obj) throws RemoteException;
public Pindah_Wni getPinda_wna(String no_kk,String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
public boolean setKeluarga_Pindah(Kedatan_keluarga obj) throws RemoteException;
public String setSudah_Pindah(pinda_num_suda new_record,String t,String s,String n) throws RemoteException;
public boolean setNumpang_Wna(pinda_num_suda new_record,String np,String nk,String nc,String nl) throws RemoteException;
}