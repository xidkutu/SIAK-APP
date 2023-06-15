package cetak.mati;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface CetakMatiHome extends javax.ejb.EJBHome,java.io.Serializable {
  public CetakMati create() throws CreateException, RemoteException;
}