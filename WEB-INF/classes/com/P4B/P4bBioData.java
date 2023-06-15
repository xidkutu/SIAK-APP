package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import java.sql.Connection;
public interface P4bBioData extends javax.ejb.EJBObject {
 public P4BBioObject getDataP4B(String nik,String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
 public P4BBioObject insertP4b(P4BBioObject form) throws RemoteException;
 //public boolean createBiodata(P4BBioObject form,Connection con) throws RemoteException;
}