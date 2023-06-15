package biodata;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface BiodataHome extends javax.ejb.EJBHome {
  public Biodata create() throws CreateException, RemoteException;
}