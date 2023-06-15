package calonpemilih;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import bukuinduk.pddktinggaltetap.*;

public interface NamaCalonPemilihHome extends javax.ejb.EJBHome {
  public NamaCalonPemilih create() throws CreateException, RemoteException;
}