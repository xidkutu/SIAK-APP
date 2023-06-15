package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface AngotasMoveHome extends javax.ejb.EJBHome {
  public AngotasMove create() throws CreateException, RemoteException;
}