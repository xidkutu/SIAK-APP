package daftar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import siak.security.*;

public interface KunciOtoritasHome extends javax.ejb.EJBHome {
  public KunciOtoritas create() throws CreateException, RemoteException;
}