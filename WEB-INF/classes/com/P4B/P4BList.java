package com.P4B;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.valueList.*;

public interface P4BList extends javax.ejb.EJBObject {
 public String executeSelect(Parameter prm) throws RemoteException;
 public void executeSelectPaging(Parameter prm) throws RemoteException;
 public Collection getList() throws RemoteException,IteratorException;
 public int getSize() throws RemoteException,IteratorException;
 public Object getCurrentElement() throws RemoteException,IteratorException;
 public List getPreviousElements(int count) throws RemoteException,IteratorException;
 public List getNextElements(int count) throws RemoteException,IteratorException;
 public void resetIndex() throws RemoteException,IteratorException;
 public int[] updatePrintStatusP4B(Vector vNik) throws RemoteException;
}