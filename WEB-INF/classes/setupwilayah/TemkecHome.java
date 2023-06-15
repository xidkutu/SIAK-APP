package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface TemkecHome extends javax.ejb.EJBHome {
  public Temkec create() throws CreateException, RemoteException;
}
