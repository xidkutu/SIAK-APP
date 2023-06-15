package siak.security;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface SecurityAuthorizeHome extends javax.ejb.EJBHome {
  public SecurityAuthorize create() throws CreateException, RemoteException;
}