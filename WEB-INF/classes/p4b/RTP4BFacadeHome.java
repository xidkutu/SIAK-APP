package p4b;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RTP4BFacadeHome extends javax.ejb.EJBHome {
  public RTP4BFacade create() throws CreateException, RemoteException;
}