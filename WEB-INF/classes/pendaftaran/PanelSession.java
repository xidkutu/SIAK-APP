package pendaftaran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface PanelSession extends javax.ejb.EJBObject {
    public String insertAkses(Vector v,String status) throws RemoteException;
}