package pendaftaran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import siak.security.*;

public interface PanelSessionHome extends javax.ejb.EJBHome {
  public PanelSession create() throws CreateException, RemoteException;
}