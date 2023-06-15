package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface List_WniHome extends javax.ejb.EJBHome {
  public List_Wni create() throws CreateException, RemoteException;
}