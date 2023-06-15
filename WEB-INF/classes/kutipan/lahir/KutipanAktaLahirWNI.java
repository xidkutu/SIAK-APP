package kutipan.lahir;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface KutipanAktaLahirWNI extends javax.ejb.EJBObject
{
    public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab)
        throws RemoteException;

}