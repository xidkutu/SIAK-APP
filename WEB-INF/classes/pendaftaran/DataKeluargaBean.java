package pendaftaran;

import java.math.*;
import java.util.*;
import javax.ejb.*;

import com.db.connection.*;
import java.util.ResourceBundle;
import java.util.Locale;
import java.io.*;

abstract public class DataKeluargaBean
    implements EntityBean {
  EntityContext entityContext;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws
      CreateException {
    setNoKk(noKk);
    return null;
  }

  public java.math.BigDecimal ejbCreate(BigDecimal noKk, String namaKep,
                                        String alamat, BigDecimal noRt,
                                        BigDecimal noRw, String dusun,
                                        BigDecimal kodePos, String telp,
                                        BigDecimal alsPrmohon,
                                        BigDecimal alsNumpang,
                                        BigDecimal noProp, BigDecimal noKab,
                                        BigDecimal noKec, BigDecimal noKel,
                                        BigDecimal userid, String tglInsertion,
                                        String tglUpdation, String pflag,
                                        String cflag) throws CreateException {
    setNoKk(noKk);
    setNamaKep(namaKep);
    setAlamat(alamat);
    setNoRt(noRt);

    if (noRw != null && noRw != new BigDecimal("0")) {
      setNoRw(noRw);
    }

    if (dusun != null) {
      setDusun(dusun);
    }

    if (kodePos != null && kodePos != new BigDecimal("0")) {
      setKodePos(kodePos);
    }

    if (telp != null) {
      setTelp(telp);
    }

    if (alsPrmohon != null && alsPrmohon != new BigDecimal("0")) {
      setAlsPrmohon(alsPrmohon);
    }

    if (alsNumpang != null && alsNumpang != new BigDecimal("0")) {
      setAlsNumpang(alsNumpang);
    }

    setNoProp(noProp);
    setNoKab(noKab);
    setNoKec(noKec);
    setNoKel(noKel);
    setUserid(userid);
    setTglInsertion(tglInsertion);
    setTglUpdation(tglUpdation);
    setPflag(pflag);
    setCflag(cflag);
    return null;
  }

  public java.math.BigDecimal ejbCreate(BigDecimal newnik, BigDecimal noKk,
                                        String namaKep, String alamat,
                                        BigDecimal noRt, BigDecimal noRw,
                                        String dusun, BigDecimal kodePos,
                                        String telp, BigDecimal alsPrmohon,
                                        BigDecimal alsNumpang,
                                        BigDecimal noProp, BigDecimal noKab,
                                        BigDecimal noKec, BigDecimal noKel,
                                        BigDecimal userid,
                                        java.lang.String tglInsertion,
                                        java.lang.String tglUpdation,
                                        String pflag, String cflag, Vector v1) throws
      CreateException {
    setNoKk(noKk);
    setNamaKep(namaKep);
    setAlamat(alamat);
    setNoRt(noRt);

    if (noRw != null && noRw != new BigDecimal("0")) {
      setNoRw(noRw);
    }

    if (dusun != null) {
      setDusun(dusun);
    }

    if (kodePos != null && kodePos != new BigDecimal("0")) {
      setKodePos(kodePos);
    }

    if (telp != null) {
      setTelp(telp);
    }
    setAlsPrmohon(null);
    setAlsNumpang(null);
    setNoProp(noProp);
    setNoKab(noKab);
    setNoKec(noKec);
    setNoKel(noKel);
    setTglInsertion(tglInsertion);
    setTglUpdation(tglUpdation);
    setPflag(pflag);
    setCflag(cflag);
    return null;
  }

  public java.math.BigDecimal ejbCreate(DataKeluargaDetailBean bean) throws
      CreateException {
    setNoKk(bean.getNoKk());
    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbPostCreate(BigDecimal noKk, String namaKep, String alamat,
                            BigDecimal noRt, BigDecimal noRw, String dusun,
                            BigDecimal kodePos, String telp,
                            BigDecimal alsPrmohon, BigDecimal alsNumpang,
                            BigDecimal noProp, BigDecimal noKab,
                            BigDecimal noKec, BigDecimal noKel,
                            BigDecimal userid, java.lang.String tglInsertion,
                            java.lang.String tglUpdation, String pflag,
                            String cflag) throws CreateException {
  }

  private String getSiakDate(String dd, String mm, String yy) {
    if ( (dd == null || dd.trim().equals("") || dd.trim().equals("0")) ||
        (mm == null || mm.trim().equals("") || mm.trim().equals("0"))
        || (yy == null || yy.trim().equals("") || yy.trim().equals("0"))) {
      return null;
    }
    return (dd.trim() + "-" + mm.trim() + "-" + yy.trim());
  }

  public pendaftaran.DataKeluargaDetailBean getDetailBean() {
    DataKeluargaDetailBean bean = new DataKeluargaDetailBean(
        getNoKk(),
        getNamaKep(),
        getAlamat(),
        getNoRt(),
        getNoRw(),
        getDusun(),
        getKodePos(),
        getTelp(),
        getAlsPrmohon(),
        getAlsNumpang(),
        getNoProp(),
        getNoKab(),
        getNoKec(),
        getNoKel(),
        getUserid(),
        getTglInsertion(),
        getTglUpdation(),
        getPflag(),
        getCflag());
    return bean;

  }

  public void ejbPostCreate(BigDecimal newnik, BigDecimal noKk, String namaKep,
                            String alamat, BigDecimal noRt, BigDecimal noRw,
                            String dusun, BigDecimal kodePos, String telp,
                            BigDecimal alsPrmohon, BigDecimal alsNumpang,
                            BigDecimal noProp, BigDecimal noKab,
                            BigDecimal noKec, BigDecimal noKel,
                            BigDecimal userid, java.lang.String tglInsertion,
                            java.lang.String tglUpdation, String pflag,
                            String cflag, Vector v1) throws CreateException {
    int i = 0, prop = 0, kab = 0, kec = 0, j = 0, k1 = 0, dd;
    ServiceEntity wniFactory;
    BiodataWni remote = null;
    BiodataWniHome home = null;
    boolean b = false;
    String tgl1 = "", tgl2 = "", tgl3 = "", tgl4 = "", tgl5 = "", tgl6 = "",
        tgl7 = "", tgl8 = "";

    tgl1 = getSiakDate(v1.elementAt(2).toString(), v1.elementAt(3).toString(),
                       v1.elementAt(4).toString());

    tgl2 = getSiakDate(v1.elementAt(8).toString(), v1.elementAt(9).toString(),
                       v1.elementAt(10).toString());

    tgl3 = getSiakDate(v1.elementAt(18).toString(), v1.elementAt(19).toString(),
                       v1.elementAt(20).toString());
    tgl4 = getSiakDate(v1.elementAt(23).toString(), v1.elementAt(24).toString(),
                       v1.elementAt(25).toString());

    int l1 = 0, l2 = 0, l3 = 0, l4 = 0, l5 = 0, l6 = 0, l7 = 0, l8 = 0, l9 = 0,
        l10 = 0, l11 = 0, l12 = 0, l13 = 0, l14 = 0, l15 = 0;
    String sysDate = null;
    sysDate = v1.elementAt(49).toString(); //Setting the SYstem Date
    String select, ss = null, str_prop = null, str_kab = null, str_kec = null,
        str_kel = null;
    String s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
        s16, s17;
    s1 = (v1.elementAt(6).toString().equals("")) ? "0" :
        v1.elementAt(6).toString();
    s2 = (v1.elementAt(11).toString().equals("")) ? "0" :
        v1.elementAt(11).toString();
    s3 = (v1.elementAt(13).toString().equals("")) ? "0" :
        v1.elementAt(13).toString();
    s4 = (v1.elementAt(15).toString().equals("")) ? "0" :
        v1.elementAt(15).toString();
    s5 = (v1.elementAt(16).toString().equals("")) ? "0" :
        v1.elementAt(16).toString();
    s6 = (v1.elementAt(21).toString().equals("")) ? "0" :
        v1.elementAt(21).toString();
    s7 = (v1.elementAt(26).toString().equals("")) ? "0" :
        v1.elementAt(26).toString();
    s8 = (v1.elementAt(27).toString().equals("")) ? "0" :
        v1.elementAt(27).toString();
    s9 = (v1.elementAt(28).toString().equals("")) ? "0" :
        v1.elementAt(28).toString();
    s10 = (v1.elementAt(29).toString().equals("")) ? "0" :
        v1.elementAt(29).toString();
    s11 = (v1.elementAt(30).toString().equals("")) ? "0" :
        v1.elementAt(30).toString();
    s12 = (v1.elementAt(31).toString().equals("")) ? "0" :
        v1.elementAt(31).toString();
    s13 = (v1.elementAt(33).toString().equals("")) ? "0" :
        v1.elementAt(33).toString();
    s14 = (v1.elementAt(38).toString().equals("")) ? "0" :
        v1.elementAt(38).toString();
    s17 = (v1.elementAt(42).toString().equals("")) ? "0" :
        v1.elementAt(42).toString();

    try {

      str_prop = (String) v1.elementAt(43);
      str_kab = (String) v1.elementAt(44);
      str_kec = (String) v1.elementAt(45);
      str_kel = (String) v1.elementAt(46);
      l1 = (v1.elementAt(2).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(2).toString()); // dd
      l2 = (v1.elementAt(3).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(3).toString()); // month
      l3 = (v1.elementAt(4).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(4).toString()); // year

      l4 = Integer.parseInt(v1.elementAt(8).toString()); //dd
      l5 = Integer.parseInt(v1.elementAt(9).toString()); //mm
      l6 = Integer.parseInt(v1.elementAt(10).toString()); //year

      l7 = (v1.elementAt(18).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(18).toString()); //dd
      l8 = (v1.elementAt(19).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(19).toString()); //mm
      l9 = (v1.elementAt(20).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(20).toString()); //yy

      l10 = (v1.elementAt(23).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(23).toString()); //dd
      l11 = (v1.elementAt(24).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(24).toString()); //mm
      l12 = (v1.elementAt(25).toString().equals("")) ? 0 :
          Integer.parseInt(v1.elementAt(25).toString()); //yy

      wniFactory = ServiceEntity.getInstance();

      home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);

      if (home != null) {
        remote = home.create(newnik,
                             v1.elementAt(0).toString(),
                             v1.elementAt(47).toString(),
                             v1.elementAt(1).toString(),
                             tgl1, v1.elementAt(5).toString().trim(),
                             new BigDecimal(s1),
                             v1.elementAt(7).toString(),
                             tgl2,
                             new BigDecimal(s2), v1.elementAt(12).toString(),
                             new BigDecimal(s3),
                             (v1.elementAt(14).toString().equals("Lainnya")) ?
                             v1.elementAt(48).toString() :
                             v1.elementAt(14).toString(),
                             new BigDecimal(s4), new BigDecimal(s5),
                             v1.elementAt(17).toString(),
                             tgl3,
                             new BigDecimal(s6), v1.elementAt(22).toString(),
                             tgl4,
                             new BigDecimal(s7), new BigDecimal(s8),
                             new BigDecimal(s9), new BigDecimal(s10),
                             new BigDecimal(s11), new BigDecimal(s12),
                             v1.elementAt(32).toString(),
                             new BigDecimal(s13), v1.elementAt(34).toString(),
                             v1.elementAt(35).toString(),
                             v1.elementAt(36).toString(),
                             v1.elementAt(37).toString(), new BigDecimal(s14),
                             "NamaPet", new BigDecimal("0"), sysDate,
                             getNoKk(), new BigDecimal("0"),
                             new BigDecimal(str_prop), new BigDecimal(str_kab),
                             new BigDecimal(str_kec),
                             new BigDecimal(str_kel), new BigDecimal("0"),
                             null, //tglUbah
                             null, //tglCetakKtp
                             null, //tglGantiKtp
                             null, //tglPjgKtp
                             new BigDecimal("0"), new BigDecimal("0"), "N", "N");
      }

    }
    catch (Exception ee) {
      try{
        ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                      Locale.getDefault());
                                  String bean_path = res.getString("BEAN_PATH");
         siaktools.logwriter.SiakWriter wr = new siaktools.logwriter.SiakWriter(bean_path);
         wr.writeFile(ee);
       }catch(Exception ferr)
       {

       }
    }

  }

  public void ejbPostCreate(DataKeluargaDetailBean bean) throws CreateException {

    setNamaKep(bean.getNamaKep());
    setAlamat(bean.getAlamat());
    setNoRt(bean.getNoRt());
    setNoRw(bean.getNoRw());
    setDusun(bean.getDusun());
    setKodePos(bean.getKodePos());
    setTelp(bean.getTelp());
    setAlsPrmohon(bean.getAlsPrmohon());
    setAlsNumpang(bean.getAlsNumpang());
    setNoProp(bean.getNoProp());
    setNoKab(bean.getNoKab());
    setNoKec(bean.getNoKec());
    setNoKel(bean.getNoKel());
    setUserid(bean.getUserid());
    setTglInsertion(bean.getTglInsertion());
    setTglUpdation(bean.getTglUpdation());
    setPflag(bean.getPflag());
    setCflag(bean.getCflag());

  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNoKk(java.math.BigDecimal noKk);

  public abstract void setNamaKep(java.lang.String namaKep);

  public abstract void setAlamat(java.lang.String alamat);

  public abstract void setNoRt(java.math.BigDecimal noRt);

  public abstract void setNoRw(java.math.BigDecimal noRw);

  public abstract void setDusun(java.lang.String dusun);

  public abstract void setKodePos(java.math.BigDecimal kodePos);

  public abstract void setTelp(java.lang.String telp);

  public abstract void setAlsPrmohon(java.math.BigDecimal alsPrmohon);

  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setNoKec(java.math.BigDecimal noKec);

  public abstract void setNoKel(java.math.BigDecimal noKel);

  public abstract void setUserid(java.math.BigDecimal userid);

  public abstract void setTglInsertion(java.lang.String tglInsertion);

  public abstract void setTglUpdation(java.lang.String tglUpdation);

  public abstract void setPflag(java.lang.String pflag);

  public abstract void setCflag(java.lang.String cflag);

  public abstract java.math.BigDecimal getNoKk();

  public abstract java.lang.String getNamaKep();

  public abstract java.lang.String getAlamat();

  public abstract java.math.BigDecimal getNoRt();

  public abstract java.math.BigDecimal getNoRw();

  public abstract java.lang.String getDusun();

  public abstract java.math.BigDecimal getKodePos();

  public abstract java.lang.String getTelp();

  public abstract java.math.BigDecimal getAlsPrmohon();

  public abstract java.math.BigDecimal getAlsNumpang();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.math.BigDecimal getNoKec();

  public abstract java.math.BigDecimal getNoKel();

  public abstract java.math.BigDecimal getUserid();

  public abstract java.lang.String getTglInsertion();

  public abstract java.lang.String getTglUpdation();

  public abstract java.lang.String getPflag();

  public abstract java.lang.String getCflag();

  public void ejbLoad() {
    /**@todo Complete this method*/
  }

  public void ejbStore() {
    /**@todo Complete this method*/
  }

  public void ejbActivate() {
    /**@todo Complete this method*/
  }

  public void ejbPassivate() {
    /**@todo Complete this method*/
  }

  public void unsetEntityContext() {
    this.entityContext = null;
  }

  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
}