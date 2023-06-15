package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface List_Wni extends javax.ejb.EJBObject
{
  public Vector daftarKeluarga(String no_kk) throws RemoteException;

}