package jmlpddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import buku.ubahkepkel.pddk.*;

public interface LampidHome extends javax.ejb.EJBHome {
  public Lampid create() throws CreateException, RemoteException;
}