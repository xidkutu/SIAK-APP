package parameter.dasar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import register.akta.perkawinan.*;

public interface DemografiHome extends javax.ejb.EJBHome {
  public Demografi create() throws CreateException, RemoteException;
}