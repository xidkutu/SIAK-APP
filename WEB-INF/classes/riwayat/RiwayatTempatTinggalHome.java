package riwayat;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RiwayatTempatTinggalHome extends javax.ejb.EJBHome {
  public RiwayatTempatTinggal create() throws CreateException, RemoteException;
}