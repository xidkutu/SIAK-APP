package com.wilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface WilayahSettingModuleHome extends javax.ejb.EJBHome {
  public WilayahSettingModule create() throws CreateException, RemoteException;
}