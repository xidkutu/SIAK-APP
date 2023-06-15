package pendaftaran;

import java.rmi.*;
import java.util.*;
import javax.ejb.*;

public interface WNIBiodata
    extends javax.ejb.EJBObject {
  public Vector getDataIndividu(String no_kk) throws RemoteException;

  public UserInfo compare_KKID(String a) throws RemoteException;

  public UserInfo compare_KKID(String no_prop,String no_kab,String no_kec,String no_kel,String no_kk) throws RemoteException;

  public UserInfo2 compare_KKID1(String str) throws RemoteException;

  public Vector list(String a) throws RemoteException;

  public String insert(Vector v, String s) throws RemoteException;

  public java.util.Vector listKk(String nokk, String nik) throws RemoteException;

  public java.lang.String kepalaKaluarga(Vector v2) throws RemoteException;

  public java.lang.String kepalaKaluarga(Vector v1, Vector v) throws RemoteException;

  public BioDataObj getData(String nik) throws RemoteException;

  //public P4BBioObject getDataP4B(String nik) throws RemoteException;

  public WniWnaObj getDataKlr(String nik1, String nik2, String nik3,
                              String nik4, int levelID) throws RemoteException;

  public java.util.Vector insertLahir(Vector data) throws RemoteException;

  public pendaftaran.KabNikData getLahirData(String nikBayi, String nikSaksi1,
                                             String nikSaksi2) throws CapilException, RemoteException;

  public pendaftaran.MatiKabData getMatiData(String nik, String nikSaksi1,
                                             String nikSaksi2) throws RemoteException;

  public SaksiObject getSaksiData(String nik1, String nik2) throws RemoteException;

  public boolean updateWni(Vector v) throws RemoteException;

 // public boolean updateWniP4B(Vector v) throws RemoteException;

  public String sysDate() throws RemoteException;

  public Vector updateLahir(Vector v) throws RemoteException;

  public Vector updateMati(Vector v) throws RemoteException;

  public boolean insertMati(Vector data) throws RemoteException;

  public KawinObject getKawinData(String nik1, String nik2, String nik3,
                                  String nik4,
                                  String nik5, String nik6, String nik7,
                                  String nik8) throws CapilException, RemoteException;

  public String insertKawin(Vector data) throws RemoteException;

  public SaksiObject getCeraiData(String nik1, String nik2, String nik3) throws CapilException, RemoteException;

  public String insertCerai(Vector data) throws CapilException, RemoteException;

  public WniWnaObj getMatiKec(String nik11, String nik22, String nik33,
                              String nik44, int levelID) throws RemoteException;

  public BioDataObj getDataIbu(String nik) throws RemoteException;
  public BioDataObj getDataAyah(String nik) throws RemoteException;
  public BioSiak getBioPdk(String nik) throws RemoteException;
  public void insert_pdkn(Vector v) throws RemoteException;
  public BioSiak getBioPkjrn(String nik) throws RemoteException;
  public void insert_pkrjn(Vector v) throws RemoteException;

  public BioSiak getBioSiak(String no_prop,String no_kab,String no_kec,String no_kel,String nik) throws RemoteException;
  public BioSiak getBioSiak(String nik) throws RemoteException;
  public int IsJenasahExists(String nik_jenasah) throws RemoteException;
  public Vector matiInsertKabupaten(Vector insertVector,Vector updateVector) throws RemoteException;
}
