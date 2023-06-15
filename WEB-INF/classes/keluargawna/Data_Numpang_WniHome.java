package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Data_Numpang_WniHome extends javax.ejb.EJBHome {
  public Data_Numpang_Wni create() throws CreateException, RemoteException;
}