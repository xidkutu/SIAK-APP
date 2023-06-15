package kutipan.akta.kawin;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import daftar.akta.kawin.*;

public interface KutipanAktaKawinHome extends javax.ejb.EJBHome {
  public KutipanAktaKawin create() throws CreateException, RemoteException;
}