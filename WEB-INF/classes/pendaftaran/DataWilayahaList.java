package pendaftaran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface DataWilayahaList extends javax.ejb.EJBObject {
  public DataWilayahaListInfo getWilayahList() throws RemoteException;
}
