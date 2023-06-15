package kutipan.akta.perceraian;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KutipanAktaCerai extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vAkta) throws RemoteException;

}