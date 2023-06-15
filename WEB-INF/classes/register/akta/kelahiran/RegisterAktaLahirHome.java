package register.akta.kelahiran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import kutipan.akta.perceraian.*;

public interface RegisterAktaLahirHome extends javax.ejb.EJBHome {
  public RegisterAktaLahir create() throws CreateException, RemoteException;
}