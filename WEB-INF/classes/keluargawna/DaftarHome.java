package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface DaftarHome extends javax.ejb.EJBHome {
  public Daftar create() throws CreateException, RemoteException;
}