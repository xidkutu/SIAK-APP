package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KecHome extends javax.ejb.EJBHome {
  public Kec create() throws CreateException, RemoteException;
}
