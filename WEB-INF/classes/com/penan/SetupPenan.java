package com.penan;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface SetupPenan extends javax.ejb.EJBObject {
  public boolean setupKec(String nokec, String nokab, String noprop, String jabatan, String namapej, String status, String nippej) throws RemoteException;
  public boolean setupKel(String nokel, String nokec, String nokab, String noprop, String jabakel, String namapejkel, String niplur) throws RemoteException;
  public boolean setupKab(String nokab, String noprop, String jabatan, String namapej, String status, String nippej) throws RemoteException;
  public boolean setupKec2(String nokec, String nokab, String noprop, String jabatan, String namapej, String status, String nippej, String flttd) throws RemoteException;
  public boolean setup_kel2(String nokel, String nokec, String nokab, String noprop, String jabakel, String namapejkel, String niplur, String flttd) throws RemoteException;
  public String FileTandaTangan(String deprop, String dekab, String dekec, String dekel) throws RemoteException;
}