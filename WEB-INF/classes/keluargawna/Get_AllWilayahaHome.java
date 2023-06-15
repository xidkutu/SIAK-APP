package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Get_AllWilayahaHome extends javax.ejb.EJBHome {
  public Get_AllWilayaha create() throws CreateException, RemoteException;
}