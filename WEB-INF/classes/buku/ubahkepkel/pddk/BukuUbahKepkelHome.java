package buku.ubahkepkel.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import connection.*;

public interface BukuUbahKepkelHome extends javax.ejb.EJBHome {
  public BukuUbahKepkel create() throws CreateException, RemoteException;
}