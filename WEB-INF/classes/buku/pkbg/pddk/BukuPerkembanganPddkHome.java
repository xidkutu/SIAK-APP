package buku.pkbg.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import calonpemilih.*;

public interface BukuPerkembanganPddkHome extends javax.ejb.EJBHome {
  public BukuPerkembanganPddk create() throws CreateException, RemoteException;
}