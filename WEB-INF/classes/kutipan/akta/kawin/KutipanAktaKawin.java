package kutipan.akta.kawin;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KutipanAktaKawin extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab) throws RemoteException;
}