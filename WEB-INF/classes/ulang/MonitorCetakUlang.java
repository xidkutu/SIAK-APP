package ulang;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface MonitorCetakUlang extends javax.ejb.EJBObject {
  public void addCetakUlangAction(String dokumen, String field, Vector list, String authBy, String authTo, Date authDate) throws RemoteException;
  public Vector findAllCetakUlang() throws RemoteException;
}