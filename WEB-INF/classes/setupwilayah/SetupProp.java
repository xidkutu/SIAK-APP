package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface SetupProp extends javax.ejb.EJBObject
{
  public boolean postPropinsi(int a, String str) throws RemoteException;
}
