package com.helpdesk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.monitor.*;

public interface HelpDeskHome extends javax.ejb.EJBHome {
  public HelpDesk create() throws CreateException, RemoteException;
}