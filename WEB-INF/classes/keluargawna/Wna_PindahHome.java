package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Wna_PindahHome extends javax.ejb.EJBHome {
  public Wna_Pindah create() throws CreateException, RemoteException;
}