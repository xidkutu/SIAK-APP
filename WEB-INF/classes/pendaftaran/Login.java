package pendaftaran;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Login extends javax.ejb.EJBObject,java.io.Serializable{
  public Vector list(String no_prop, String no_kab, String no_kec) throws RemoteException;
  public boolean insertUserReg(Vector v) throws RemoteException;
  public boolean ubahPwd(String user, String old_pwd, String new_pwd) throws RemoteException;
  public UserInfo1 validate(String login, String pwd) throws RemoteException;
  public UserInfo1 validate(String login) throws RemoteException;
  public SessionContext getSessionContext() throws RemoteException;
}
