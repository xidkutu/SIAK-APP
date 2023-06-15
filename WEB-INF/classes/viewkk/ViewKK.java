package viewkk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

import java.util.*;

public interface ViewKK extends javax.ejb.EJBObject
{
  public int[] updatePrintStatus(Vector vKKObject, String pflag, String cflag) throws RemoteException;
  public Vector retrieveData(Vector vNo_kk, String type) throws RemoteException;
  public int[] updatePrintStatusWna(Vector vKK, String pflag, String cflag) throws RemoteException;
}