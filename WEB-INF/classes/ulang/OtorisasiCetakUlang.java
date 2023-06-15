package ulang;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import pendaftaran.UserInfo1;

public interface OtorisasiCetakUlang extends javax.ejb.EJBObject {
  public String createOtorisasiKey(UserInfo1 op, UserInfo1 supv) throws RemoteException, OtorisasiException;
  public boolean cekOtorisasi(UserInfo1 op, UserInfo1 supv, String otorisasiKey) throws RemoteException, OtorisasiException;
}