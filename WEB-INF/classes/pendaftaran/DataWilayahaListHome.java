package pendaftaran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface DataWilayahaListHome extends javax.ejb.EJBHome {
  public DataWilayahaList create() throws CreateException, RemoteException;
}
