package pendaftaran;

import java.math.*;
import java.util.*;
import javax.ejb.*;
import java.sql.*;
import com.db.connection.*;

abstract public class CatatCeraiBean
    implements EntityBean {
  EntityContext entityContext;
  String tgl1 = "", tgl2 = "", tgl3 = "", tgl4 = "", tgl5 = "", tgl6 = "";
  String nik1 = null, nik2 = null, nik3 = null;
  String sysdate = "";
  public java.lang.String ejbCreate(java.lang.String noAktaCrai) throws
      CreateException {
    setNoAktaCrai(noAktaCrai);
    return null;
  }

  public void ejbPostCreate(java.lang.String noAktaCrai) throws CreateException {
    /**@todo Complete this method*/
  }

  public java.lang.String ejbCreate(Vector vt, java.lang.String noAktaCrai) throws
      CreateException {

    tgl1 = getSiakDate(vt.elementAt(23).toString(), vt.elementAt(24).toString(),
                       vt.elementAt(25).toString());
    tgl2 = getSiakDate(vt.elementAt(27).toString(), vt.elementAt(28).toString(),
                       vt.elementAt(29).toString());
    tgl3 = getSiakDate(vt.elementAt(33).toString(), vt.elementAt(34).toString(),
                       vt.elementAt(35).toString());
    tgl4 = getSiakDate(vt.elementAt(45).toString(), vt.elementAt(46).toString(),
                       vt.elementAt(47).toString());

    sysdate = (vt.elementAt(39).toString());

    nik1 = getNik(vt.elementAt(0).toString());
    nik2 = getNik(vt.elementAt(9).toString());
    nik3 = getNik(vt.elementAt(42).toString());

    setNikSuami(getTrimBigDecimalData(nik1));
    setKwrngrnSuami(getTrimBigDecimalData(vt.elementAt(1)));
    setKtrunanSuami(getTrimBigDecimalData(vt.elementAt(4)));
    setStatKwnSblmNkhSuami(getTrimBigDecimalData(vt.elementAt(5)));
    setCraiKe(getTrimBigDecimalData(vt.elementAt(6)));
    setKwnKeSuami(getTrimBigDecimalData(vt.elementAt(7)));
    setIstriKe(getTrimBigDecimalData(vt.elementAt(8)));
    setNikIstri(getTrimBigDecimalData(nik2));
    setKwrngrnIstri(getTrimBigDecimalData(vt.elementAt(10)));
    setKtrunanIstri(getTrimBigDecimalData(vt.elementAt(13).toString()));
    setStatKwnSblmNkhIstri(getTrimBigDecimalData(vt.elementAt(14)));
    setKwnKeIstri(getTrimBigDecimalData(vt.elementAt(15)));
    setJmlAnk(getTrimBigDecimalData(vt.elementAt(16).toString()));
    setYgBtgungPmelAnk(getTrimBigDecimalData(vt.elementAt(17)));
    setYgAjuCrai(getTrimBigDecimalData(vt.elementAt(18)));
    setNoAktaKwn(vt.elementAt(19).toString());
    setTglAktaKwn(vt.elementAt(20).toString());
    setTmptCttKwn(vt.elementAt(21).toString());
    setNoSrtKetPn(vt.elementAt(22).toString());
    setTglSrtKetPn(getTrimData(null, tgl1));
    setNoKepPngadil(getTrimData(null, vt.elementAt(26)));
    setTglSrtKepPngadil(getTrimData(null, tgl2));
    setLbgPngadilKelKep(getTrimData(null, vt.elementAt(30)));
    setTmptLbgPngadil(getTrimData(null, vt.elementAt(31)));
    setSbabCrai(getTrimBigDecimalData(vt.elementAt(32)));
    setTglDraftCraiDrln(getTrimData(null, tgl3));
    setDasarHkmCrai(getTrimBigDecimalData(vt.elementAt(36)));
    setNoAktaCrai(getTrimData(null, noAktaCrai));
    setTglAktaCrai(getTrimData(null, sysdate));
    setNamaPetReg(getTrimData(null, vt.elementAt(37)));
    setNipPetReg(getTrimBigDecimalData(vt.elementAt(38)));
    System.out.println("Step 1");
    setTglEntri(getTrimData(null, sysdate));
    System.out.println("Step 2");
    setNoProp(getTrimBigDecimalData(vt.elementAt(40)));
    System.out.println("Step 3");
    setNoKab(getTrimBigDecimalData(vt.elementAt(41)));
    System.out.println("Step 4");
    setNikPlapor(getTrimBigDecimalData(vt.elementAt(42)));
    System.out.println("Step 5");
    setKwrngrnPlapor(getTrimBigDecimalData(vt.elementAt(43)));
    System.out.println("Step 6");
    setTglMlapor(getTrimData(null, tgl4));
    System.out.println("Step 7");

    setCflag("N");
    setPflag("N");
    return null;
  }

  public void ejbPostCreate(Vector vt, java.lang.String noAktaCrai) throws
      CreateException {
    int cntr=0;
   Connection con=null;
   ResultSet rs=null;
   Statement stmt=null;
   String nikkwrn1="",nikkwrn2="";

 try{
   ConnectorDB condb=new ConnectorDB();
   con=condb.getConnection();

   rs=con.prepareStatement("select nvl(count(NIK_SUAMI),0) cnt from catat_kawin where cflag='N' and nik_suami=" + nik1).executeQuery();

  if (rs.next())
   {
    cntr=rs.getInt("cnt");
   }
   nikkwrn1 = getWarngra(vt.elementAt(0).toString());
   nikkwrn2 = getWarngra(vt.elementAt(9).toString());
   stmt=con.createStatement();

   if (cntr<=1)
   {
     if (nikkwrn1.equals("1"))
     {
       stmt.addBatch("update biodata_wni set STAT_KWN=3,akta_crai=2,NO_AKTA_CRAI='" + noAktaCrai + "' where nik=" + nik1);
     }

     if (nikkwrn1.equals("2"))
     {
       stmt.addBatch("update biodata_wna set STAT_KWN=3 where nik=" + nik1);
     }
   }

   if (nikkwrn2.equals("1"))
      {
            stmt.addBatch("update biodata_wni set STAT_KWN=3,akta_crai=2,NO_AKTA_CRAI='" + noAktaCrai + "' where nik=" + nik2);
      }

    if (nikkwrn2.equals("2"))
      {
            stmt.addBatch("update biodata_wna set STAT_KWN=3 where nik=" + nik2);
      }
   stmt.executeBatch();
   stmt=con.createStatement();
   stmt.addBatch("update catat_kawin set cflag='Y' where no_akta_kwn='" + vt.elementAt(19).toString() + "'");
   stmt.executeBatch();
    }
    catch (Exception err) {
      err.printStackTrace();
    }
    finally{
      try
      {
        if (rs!=null) rs.close();
          rs=null;
      }catch(Exception s1){}
      try
      {
        if (stmt!=null) stmt.close();
          stmt=null;
      }catch(Exception s2){}
      try
      {
        if (con!=null) con.close();
          con=null;
      }catch(Exception s3){}

    }
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNikSuami(java.math.BigDecimal nikSuami);

  public abstract void setKwrngrnSuami(java.math.BigDecimal kwrngrnSuami);

  public abstract void setKtrunanSuami(java.math.BigDecimal ktrunanSuami);

  public abstract void setStatKwnSblmNkhSuami(java.math.BigDecimal
                                              statKwnSblmNkhSuami);

  public abstract void setCraiKe(java.math.BigDecimal craiKe);

  public abstract void setKwnKeSuami(java.math.BigDecimal kwnKeSuami);

  public abstract void setIstriKe(java.math.BigDecimal istriKe);

  public abstract void setNikIstri(java.math.BigDecimal nikIstri);

  public abstract void setKwrngrnIstri(java.math.BigDecimal kwrngrnIstri);

  public abstract void setKtrunanIstri(java.math.BigDecimal ktrunanIstri);

  public abstract void setStatKwnSblmNkhIstri(java.math.BigDecimal
                                              statKwnSblmNkhIstri);

  public abstract void setKwnKeIstri(java.math.BigDecimal kwnKeIstri);

  public abstract void setJmlAnk(java.math.BigDecimal jmlAnk);

  public abstract void setYgBtgungPmelAnk(java.math.BigDecimal ygBtgungPmelAnk);

  public abstract void setYgAjuCrai(java.math.BigDecimal ygAjuCrai);

  public abstract void setNoAktaKwn(java.lang.String noAktaKwn);

  public abstract void setTglAktaKwn(String tglAktaKwn);

  public abstract void setTmptCttKwn(java.lang.String tmptCttKwn);

  public abstract void setNoSrtKetPn(java.lang.String noSrtKetPn);

  public abstract void setTglSrtKetPn(String tglSrtKetPn);

  public abstract void setNoKepPngadil(java.lang.String noKepPngadil);

  public abstract void setTglSrtKepPngadil(String tglSrtKepPngadil);

  public abstract void setLbgPngadilKelKep(java.lang.String lbgPngadilKelKep);

  public abstract void setTmptLbgPngadil(java.lang.String tmptLbgPngadil);

  public abstract void setSbabCrai(java.math.BigDecimal sbabCrai);

  public abstract void setTglDraftCraiDrln(String tglDraftCraiDrln);

  public abstract void setDasarHkmCrai(java.math.BigDecimal dasarHkmCrai);

  public abstract void setNoAktaCrai(java.lang.String noAktaCrai);

  public abstract void setTglAktaCrai(String tglAktaCrai);

  public abstract void setTglCtkKtakta(String tglCtkKtakta);

  public abstract void setNamaPetReg(java.lang.String namaPetReg);

  public abstract void setNipPetReg(java.math.BigDecimal nipPetReg);

  public abstract void setTglEntri(String tglEntri);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setCflag(java.lang.String cflag);

  public abstract void setPflag(java.lang.String pflag);

  public abstract void setNikPlapor(java.math.BigDecimal nikPlapor);

  public abstract void setKwrngrnPlapor(java.math.BigDecimal kwrngrnPlapor);

  public abstract void setTglMlapor(String tglMlapor);

  public abstract java.math.BigDecimal getNikSuami();

  public abstract java.math.BigDecimal getKwrngrnSuami();

  public abstract java.math.BigDecimal getKtrunanSuami();

  public abstract java.math.BigDecimal getStatKwnSblmNkhSuami();

  public abstract java.math.BigDecimal getCraiKe();

  public abstract java.math.BigDecimal getKwnKeSuami();

  public abstract java.math.BigDecimal getIstriKe();

  public abstract java.math.BigDecimal getNikIstri();

  public abstract java.math.BigDecimal getKwrngrnIstri();

  public abstract java.math.BigDecimal getKtrunanIstri();

  public abstract java.math.BigDecimal getStatKwnSblmNkhIstri();

  public abstract java.math.BigDecimal getKwnKeIstri();

  public abstract java.math.BigDecimal getJmlAnk();

  public abstract java.math.BigDecimal getYgBtgungPmelAnk();

  public abstract java.math.BigDecimal getYgAjuCrai();

  public abstract java.lang.String getNoAktaKwn();

  public abstract String getTglAktaKwn();

  public abstract java.lang.String getTmptCttKwn();

  public abstract java.lang.String getNoSrtKetPn();

  public abstract String getTglSrtKetPn();

  public abstract java.lang.String getNoKepPngadil();

  public abstract String getTglSrtKepPngadil();

  public abstract java.lang.String getLbgPngadilKelKep();

  public abstract java.lang.String getTmptLbgPngadil();

  public abstract java.math.BigDecimal getSbabCrai();

  public abstract String getTglDraftCraiDrln();

  public abstract java.math.BigDecimal getDasarHkmCrai();

  public abstract java.lang.String getNoAktaCrai();

  public abstract String getTglAktaCrai();

  public abstract String getTglCtkKtakta();

  public abstract java.lang.String getNamaPetReg();

  public abstract java.math.BigDecimal getNipPetReg();

  public abstract String getTglEntri();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.lang.String getCflag();

  public abstract java.lang.String getPflag();

  public abstract java.math.BigDecimal getNikPlapor();

  public abstract java.math.BigDecimal getKwrngrnPlapor();

  public abstract String getTglMlapor();

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

  private String getNik(String nik) {
    if ( (nik != null) && (!nik.trim().equals("")) && (!nik.trim().equals("0"))) {
      if (nik.trim().startsWith("A")) {
        return nik.trim().substring(1, 17);
      }
      return nik;
    }
    return "";
  }


  private String getWarngra(String nik) {
    if ( (nik != null) && (!nik.trim().equals("")) && (!nik.trim().equals("0"))) {
      if (nik.trim().startsWith("A")) {
        return "2";
      }
      return "1";
    }
    return "";
  }



  private String getSiakDate(String dd, String mm, String yy) {
    if ( (dd == null || dd.trim().equals("") || dd.trim().equals("0")) ||
        (mm == null || mm.trim().equals("") || mm.trim().equals("0"))
        || (yy == null || yy.trim().equals("") || yy.trim().equals("0"))) {
      return null;
    }
    return (dd.trim() + "-" + mm.trim() + "-" + yy.trim());
  }

  private static String getTrimData(Object trimdata) {
    if (trimdata != null) {
      return trimdata.toString().trim();
    }
    return "";
  }

  private static String getTrimData(String val, Object trimdata) {
    if (trimdata != null) {
      if (trimdata.toString().length() == 1) {
        return trimdata.toString();
      }
      if (trimdata.toString().length() > 1) {
        return trimdata.toString().trim();
      }
    }
    return val;
  }

  private static BigDecimal getTrimBigDecimalData(Object trimdata) {
    try {
      if (trimdata != null && !trimdata.toString().equals("")) {
        //kalo ada value
        if (trimdata.toString().startsWith("A")) {
          return new BigDecimal(trimdata.toString().substring(1).trim());
        }
        return new BigDecimal(trimdata.toString().trim());
      }
      if (trimdata.toString().equals("0")) {
        //kalo 0
        return null;
      }
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
    //null ""
    return null;
  }

}