package viewbiodata;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import biodata.*;

public interface ViewCetakBiodataHome extends javax.ejb.EJBHome
{
  public ViewCetakBiodata create() throws CreateException, RemoteException;
}