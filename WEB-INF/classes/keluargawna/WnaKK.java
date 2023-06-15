package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface WnaKK extends javax.ejb.EJBObject {
  public String setKKPermohon(PermohonKK_Wna obj) throws RemoteException;
  public PermohonKK_Wna setNewKKSudahPunya(PermohonKK_Wna obj) throws RemoteException;
  public String setNewKKSudahPunya(PermohonKK_Wna obj,String source) throws RemoteException;
  public String genNewKK(String no_prop,String no_kab,String no_kec) throws RemoteException;
}