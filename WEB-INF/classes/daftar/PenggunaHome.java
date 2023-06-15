package daftar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface PenggunaHome extends javax.ejb.EJBHome {
  public Pengguna create() throws CreateException, RemoteException;
}