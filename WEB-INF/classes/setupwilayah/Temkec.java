package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Temkec extends javax.ejb.EJBObject
{
  public Vector show(String prop, String kab) throws RemoteException;
}
