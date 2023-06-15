package kutipan.akta.mati;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KutipanAktaKematian extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab)
      throws RemoteException;
}