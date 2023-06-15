package kartukeluarga;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface DaftarCetakKKHome extends javax.ejb.EJBHome
{
  public DaftarCetakKK create() throws CreateException, RemoteException;
}
