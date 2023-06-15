package siaktools.logwriter;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface XmlReaderHome extends javax.ejb.EJBHome {
  public XmlReader create() throws CreateException, RemoteException;
}