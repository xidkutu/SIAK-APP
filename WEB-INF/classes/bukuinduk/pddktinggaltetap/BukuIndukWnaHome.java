package bukuinduk.pddktinggaltetap;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface BukuIndukWnaHome extends javax.ejb.EJBHome {
  public BukuIndukWna create() throws CreateException, RemoteException;
}