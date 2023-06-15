package register.akta.perceraian;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RegisterAktaCerai extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vNoAktaCerai) throws RemoteException;
}