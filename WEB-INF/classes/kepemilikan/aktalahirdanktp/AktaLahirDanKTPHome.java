package kepemilikan.aktalahirdanktp;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import register.akta.kematian.*;

public interface AktaLahirDanKTPHome extends javax.ejb.EJBHome
{
  public AktaLahirDanKTP create() throws CreateException, RemoteException;
}