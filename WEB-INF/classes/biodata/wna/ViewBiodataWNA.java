package biodata.wna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface ViewBiodataWNA extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vNik) throws RemoteException;
}