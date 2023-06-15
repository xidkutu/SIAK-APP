package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface SetupPropHome extends javax.ejb.EJBHome {
  public SetupProp create() throws CreateException, RemoteException;
}
