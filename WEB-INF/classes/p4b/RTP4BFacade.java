package p4b;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RTP4BFacade extends javax.ejb.EJBObject {
  public Vector getDaftarAnggotaRumahTangga(String noProp, String noKab, String noKec, String noKel, int offset, int length) throws RemoteException;
}