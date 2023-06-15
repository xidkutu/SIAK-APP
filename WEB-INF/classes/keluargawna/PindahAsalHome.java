package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface PindahAsalHome extends javax.ejb.EJBHome {
  public PindahAsal create() throws CreateException, RemoteException;
}