package register.akta.kematian;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import jmlpddk.paspor.*;

public interface RegisterKematianHome extends javax.ejb.EJBHome
{
  public RegisterKematian create() throws CreateException, RemoteException;
}