package viewbiodata;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

import biodata.BiodataWNIObject;

public interface ViewCetakBiodata extends javax.ejb.EJBObject
{
 // public Vector getBiodata() throws RemoteException;
//  public Vector getBiodataP4B() throws RemoteException;
  public Vector retrieveData(Vector vNik) throws RemoteException;
  public Vector retrieveDataP4B(Vector vNik) throws RemoteException;
}