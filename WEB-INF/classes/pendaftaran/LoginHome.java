package pendaftaran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import siaktools.logwriter.*;

public interface LoginHome extends javax.ejb.EJBHome,java.io.Serializable{
  public Login create() throws CreateException, RemoteException;
}