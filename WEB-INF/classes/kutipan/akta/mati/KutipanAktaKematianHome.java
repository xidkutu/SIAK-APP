package kutipan.akta.mati;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import cetak.mati.*;

public interface KutipanAktaKematianHome extends javax.ejb.EJBHome {
  public KutipanAktaKematian create() throws CreateException, RemoteException;
}