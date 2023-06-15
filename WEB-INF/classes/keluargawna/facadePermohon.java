package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface facadePermohon extends javax.ejb.EJBObject {
  public String setKKPermohon(PermohonKK obj) throws RemoteException;
}