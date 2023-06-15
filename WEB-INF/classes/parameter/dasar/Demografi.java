package parameter.dasar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Demografi extends javax.ejb.EJBObject
{
  public DemografiObject getDemografiData(String no_prop, String no_kab, String year) throws RemoteException;
}