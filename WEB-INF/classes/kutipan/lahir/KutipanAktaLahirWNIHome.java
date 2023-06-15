package kutipan.lahir;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import cetak.lahir.*;
import kutipan.lahir.*;

public interface KutipanAktaLahirWNIHome extends javax.ejb.EJBHome
{
  public KutipanAktaLahirWNI create() throws CreateException, RemoteException;
}