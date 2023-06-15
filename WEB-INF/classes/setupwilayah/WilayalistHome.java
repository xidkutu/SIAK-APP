package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface WilayalistHome extends javax.ejb.EJBHome {
  public Wilayalist create() throws CreateException, RemoteException;
}
