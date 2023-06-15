package register.akta.perkawinan;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface RegisterAktaKawin extends javax.ejb.EJBObject
{
  public Vector retrieveData(Vector vNoAktaKawin) throws RemoteException;
  public Vector getPersyaratanKawin(String no_persyaratan) throws RemoteException;
}