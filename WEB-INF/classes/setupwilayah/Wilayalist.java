package setupwilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Wilayalist extends javax.ejb.EJBObject
{
  public getWilayah getWilayahList()throws RemoteException;
}
