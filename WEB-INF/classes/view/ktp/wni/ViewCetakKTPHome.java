package view.ktp.wni;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import ktp.wni.*;

public interface ViewCetakKTPHome extends javax.ejb.EJBHome
{
  public ViewCetakKTP create() throws CreateException, RemoteException;
}