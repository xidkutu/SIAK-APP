package register.akta.perceraian;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import register.akta.perkawinan.*;

public interface RegisterAktaCeraiHome extends javax.ejb.EJBHome {
  public RegisterAktaCerai create() throws CreateException, RemoteException;
}