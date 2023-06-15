package com.wilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import jmlpddk.agama.InfoWilayah;
public interface WilayahSettingModule extends javax.ejb.EJBObject
{
  public InfoWilayah getListWilayah() throws RemoteException;
  public InfoWilayah getListWilayah(String num_prop) throws RemoteException;
  public InfoWilayah getListWilayah(String num_prop,String num_kab,String num_kec) throws RemoteException;
  public InfoWilayah getListWilayah(String num_prop,String num_kab) throws RemoteException;

  public InfoWilayah getListWilayahPusat() throws RemoteException;

  public Vector getDataKelurahan(String no_prop,String no_kab,String no_kec) throws RemoteException;
  public Vector getDataKabupaten(String no_prop) throws RemoteException;
  public Vector getDataKecamatan(String no_prop, String no_kab) throws RemoteException;
}