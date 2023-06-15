package ktp.wni;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface CetakKTPHome extends javax.ejb.EJBHome
{
  public CetakKTP create() throws CreateException, RemoteException;
}