package buku.rekapitulasi.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import buku.pkbg.pddk.*;

public interface BukuRekPddkHome extends javax.ejb.EJBHome {
  public BukuRekPddk create() throws CreateException, RemoteException;
}