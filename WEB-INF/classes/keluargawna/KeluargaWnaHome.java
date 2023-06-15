package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KeluargaWnaHome extends javax.ejb.EJBHome {
  public KeluargaWna create() throws CreateException, RemoteException;
}