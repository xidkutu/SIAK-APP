package bukuinduk.pddktinggaltetap;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import jmlpddk.agama.InfoWilayah;

public interface BukuIndukWna extends javax.ejb.EJBObject
{
    public Vector getDataBukuIndukPendudukWNA(String no_prop, String no_kab,
                                              String no_kec, String no_kel) throws RemoteException;
}