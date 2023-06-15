package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Per_Wna extends javax.ejb.EJBObject {
  public Vector getBiodataWna(String no_kk, String no_prop, String no_kab) throws RemoteException;
}