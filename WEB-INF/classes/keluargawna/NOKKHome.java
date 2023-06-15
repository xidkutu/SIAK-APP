package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface NOKKHome extends javax.ejb.EJBHome {
  public NOKK create() throws CreateException, RemoteException;
}