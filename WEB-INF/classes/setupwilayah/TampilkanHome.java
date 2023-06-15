package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface TampilkanHome extends javax.ejb.EJBHome {
  public Tampilkan create() throws CreateException, RemoteException;
}
