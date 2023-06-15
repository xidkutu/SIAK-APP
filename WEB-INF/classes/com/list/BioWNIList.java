package com.list;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.valueList.*;

public interface BioWNIList extends javax.ejb.EJBObject {
  public String executeSelect(Parameter prm) throws RemoteException;
public void executeSelectPaging(Parameter prm) throws RemoteException;
public Collection getList() throws RemoteException;
public int getSize() throws com.valueList.IteratorException, RemoteException;
public Object getCurrentElement() throws com.valueList.IteratorException, RemoteException;
public List getPreviousElements(int count) throws com.valueList.IteratorException, RemoteException;
public List getNextElements(int count) throws com.valueList.IteratorException, RemoteException;
public void resetIndex() throws com.valueList.IteratorException, RemoteException;
public int[] updatePrintStatusBio(Vector vNik) throws RemoteException;

}