package cetak.cerai;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import kutipan.akta.kawin.*;

public interface CetakCeraiHome extends javax.ejb.EJBHome,java.io.Serializable {
  public CetakCerai create() throws CreateException, RemoteException;
}