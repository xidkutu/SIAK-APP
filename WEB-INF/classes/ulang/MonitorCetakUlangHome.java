package ulang;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface MonitorCetakUlangHome extends javax.ejb.EJBHome {
  public MonitorCetakUlang create() throws CreateException, RemoteException;
}