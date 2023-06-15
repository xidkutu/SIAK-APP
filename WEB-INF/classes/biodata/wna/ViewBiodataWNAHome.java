package biodata.wna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import register.akta.*;

import biodata.wna.*;

public interface ViewBiodataWNAHome extends javax.ejb.EJBHome
{
  public ViewBiodataWNA create() throws CreateException, RemoteException;
}