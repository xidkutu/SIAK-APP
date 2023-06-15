package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface GetNokkHome extends javax.ejb.EJBHome {
  public GetNokk create() throws CreateException, RemoteException;
}