package cetak.lahir;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface CetakLahirWNIHome extends javax.ejb.EJBHome,java.io.Serializable
{
  public CetakLahirWNI create() throws CreateException, RemoteException;
}