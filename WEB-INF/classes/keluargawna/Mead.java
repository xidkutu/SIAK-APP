package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;

public interface Mead extends javax.ejb.EJBObject {
   public String setDataKelWna(GdataWna obj,GdataKelu kelu,String t,String m,String j) throws RemoteException;
   public String setBiodata(GdataWna obj,String t,String m,String j) throws RemoteException;
   public boolean setPeruwna(GdataWna obj) throws RemoteException;
}