package ulang;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface OtorisasiCetakUlangHome extends javax.ejb.EJBHome {
  public OtorisasiCetakUlang create() throws CreateException, RemoteException;
}