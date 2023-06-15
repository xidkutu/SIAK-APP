package estimasi;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import parameter.dasar.*;

public interface NikGandaHome extends javax.ejb.EJBHome {
  public NikGanda create() throws CreateException, RemoteException;
}