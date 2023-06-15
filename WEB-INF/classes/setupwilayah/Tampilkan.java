package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Tampilkan extends javax.ejb.EJBObject
{
  public Vector noProf() throws RemoteException;
}
