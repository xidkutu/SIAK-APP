package register.akta.perkawinan;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import riwayat.*;

public interface RegisterAktaKawinHome extends javax.ejb.EJBHome {
  public RegisterAktaKawin create() throws CreateException, RemoteException;
}