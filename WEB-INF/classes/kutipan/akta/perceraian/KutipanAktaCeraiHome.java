package kutipan.akta.perceraian;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import cetak.cerai.*;

public interface KutipanAktaCeraiHome extends javax.ejb.EJBHome {
  public KutipanAktaCerai create() throws CreateException, RemoteException;
}