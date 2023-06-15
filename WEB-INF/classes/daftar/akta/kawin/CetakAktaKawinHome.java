package daftar.akta.kawin;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import kutipan.akta.mati.*;

public interface CetakAktaKawinHome extends javax.ejb.EJBHome,java.io.Serializable {
  public CetakAktaKawin create() throws CreateException, RemoteException;
}