package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Per_WnaHome extends javax.ejb.EJBHome {
  public Per_Wna create() throws CreateException, RemoteException;
}