package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface NOKK extends javax.ejb.EJBObject
{
  public Vector verifyNik(String a) throws RemoteException;
  public String verifyKK(String a) throws RemoteException;
  /* added newly 2-apr-2004
   begin
   */
  public Vector verifyNikNew(String a,String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
public String verifyKKNew(String a,String no_prop,String no_kab,String no_kec,String no_kel) throws RemoteException;
  /* End*/
}