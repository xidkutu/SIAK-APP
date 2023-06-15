package datawilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KabHome extends javax.ejb.EJBHome
{
  public Kab create() throws CreateException, RemoteException;
}
