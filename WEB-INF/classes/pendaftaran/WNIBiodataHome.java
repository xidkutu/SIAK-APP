package pendaftaran;

import java.rmi.*;
import javax.ejb.*;
import java.util.*;

public interface WNIBiodataHome
    extends javax.ejb.EJBHome {
  public WNIBiodata create() throws CreateException, RemoteException;
}
