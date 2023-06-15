package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Num_Wna_DataHome extends javax.ejb.EJBHome {
  public Num_Wna_Data create() throws CreateException, RemoteException;
}
