package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Kec extends javax.ejb.EJBObject
{
  public boolean setKec(int a, int b, int c, String d) throws RemoteException;
}
