package siaktools.logwriter;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface XmlReader extends javax.ejb.EJBObject {
 public void writeWilayah() throws RemoteException;
  public void writeProps() throws RemoteException;
  public void writeKabs(String nProp) throws RemoteException;
  public void writeKecs(String noProp, String noKab) throws RemoteException;
  public void writeKels(String noProp, String noKab, String noKec) throws RemoteException;
  public void writePkrjn() throws RemoteException;
  public void writeRumahTangga(String noProp, String noKab, String noKec,String nokel) throws RemoteException;
  public void writeRumahTangga() throws RemoteException;
}
