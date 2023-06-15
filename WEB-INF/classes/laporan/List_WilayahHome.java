package laporan;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface List_WilayahHome extends javax.ejb.EJBHome {
  public List_Wilayah create() throws CreateException, RemoteException;
}