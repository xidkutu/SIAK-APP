package kepemilikan.aktalahirdanktp;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface AktaLahirDanKTP extends javax.ejb.EJBObject
{
    public String getSysdate() throws RemoteException;
    public Vector getDataKepemilikanAktaLahirDanKTP() throws RemoteException;
}