package pendaftaran;

import java.math.*;
import java.util.*;
import javax.ejb.*;

import com.db.connection.*;

abstract public class CatatKawinBean
    implements EntityBean {
EntityContext entityContext;
  String tgl1 = "";
  String tgl2 = "";
  String tgl3 = "";
  String tgl4 = "";
  String tgl5 = "";
  String tgl6 = "";
  String tgl7 = "";
  String sysDate = "";
  String nik1 = "";
  String nik2 = "";
  String nik3 = "";
  String nik4 = "";
  String nik5 = "";
  String nik6 = "";
  String nik7 = "";
  String nik8 = "";
  String tgl_akta_kawin="";

  public java.lang.String ejbCreate(java.lang.String noAktaKwn) throws CreateException {
    setNoAktaKwn(noAktaKwn);
    return null;
  }

  public void ejbPostCreate(java.lang.String noAktaKwn) throws CreateException {
    /**@todo Complete this method*/
  }

public java.lang.String ejbCreate(Vector vt, java.lang.String noAktaKwn, java.lang.String daftarAnak, java.lang.String prystrtn) throws CreateException {
    //tgl_lhr_ayh_suami

  tgl1 = getSiakDate(vt.elementAt(10).toString(), vt.elementAt(11).toString(),
                       vt.elementAt(12).toString());
    System.out.println(tgl1);
//tgl_lhr_ibu_suami      tgl1 = getSiakDate(vt.elementAt(10).toString(), vt.elementAt(11).toString(), vt.elementAt(12).toString());
//tgl_lhr_ibu_suami
    tgl2 = getSiakDate(vt.elementAt(27).toString(), vt.elementAt(28).toString(),
                       vt.elementAt(29).toString());
        System.out.println(tgl2);
//tgl_lhr_ayh_istri
    tgl3 = getSiakDate(vt.elementAt(50).toString(), vt.elementAt(51).toString(),
                       vt.elementAt(52).toString());
        System.out.println(tgl3);
//tgl_lhr_ibu_istri
    tgl4 = getSiakDate(vt.elementAt(67).toString(), vt.elementAt(68).toString(),
                       vt.elementAt(69).toString());
        System.out.println(tgl4);
//tgl_pembktan_kwn
    tgl5 = getSiakDate(vt.elementAt(87).toString(), vt.elementAt(88).toString(),
                       vt.elementAt(89).toString());
        System.out.println(tgl5);
//tgl_mlapor
    tgl6 = getSiakDate(vt.elementAt(93).toString(), vt.elementAt(94).toString(),
                       vt.elementAt(95).toString());
        System.out.println(tgl6);
//tgl_dft_kwn
    tgl7 = getSiakDate(vt.elementAt(110).toString(), vt.elementAt(111).toString(),
                       vt.elementAt(112).toString());
        System.out.println(tgl7);
//today
    sysDate = vt.elementAt(115).toString();
    try{
       tgl_akta_kawin = vt.elementAt(125).toString();
     }catch(Exception errtgl)
     {

     }
    //nik suami
    nik1 = getNik(vt.elementAt(0).toString());
// nik ayah suami
    nik2 = getNik(vt.elementAt(7).toString());
// nik ibu suami
    nik3 = getNik(vt.elementAt(24).toString());
// nik istri
    nik4 = getNik(vt.elementAt(41).toString());
// nik ayh istri
    nik5 = getNik(vt.elementAt(47).toString());
// nik ibu istri
    nik6 = getNik(vt.elementAt(64).toString());
// saksi1
    nik7 = getNik(vt.elementAt(81).toString());
// saksi2
    nik8 = getNik(vt.elementAt(84).toString());

    setNikSuami(getTrimBigDecimalData(nik1));
    setKwrngrnSuami(getTrimBigDecimalData(vt.elementAt(1)));
    setKtrunanSuami(getTrimBigDecimalData(vt.elementAt(2)));
    setKwnKeSuami(getTrimBigDecimalData(vt.elementAt(3)));
    setIstriKe(getTrimBigDecimalData(vt.elementAt(4)));
    setNikAyhDrSuami(getTrimBigDecimalData(nik2));
    setKwrngrnAyhSuami(getTrimBigDecimalData(vt.elementAt(8)));
    setNamaAyhSuami(vt.elementAt(9).toString());
    setTglLhrAyhSuami(getTrimData(null, tgl1));
    setJenisPkrjnAyhSuami(getTrimBigDecimalData(vt.elementAt(13)));
    setAlamatAyhSuami(getTrimData(null, vt.elementAt(14)));
    setRtAyhSuami(getTrimBigDecimalData(vt.elementAt(15)));
    setRwAyhSuami(getTrimBigDecimalData(vt.elementAt(16)));
    setDusunAyhSuami(getTrimData(null, vt.elementAt(17)));
    setTlpAyhSuami(getTrimData(null, vt.elementAt(19)));
    setNoPropAyhSuami(getTrimData(null, vt.elementAt(20)));
    setNoKabAyhSuami(getTrimData(null, vt.elementAt(21)));
    setNoKecAyhSuami(getTrimData(null, vt.elementAt(22)));
    setNoKelAyhSuami(getTrimData(null, vt.elementAt(23)));
    setNikIbuDrSuami(getTrimBigDecimalData(nik3));
    setKwrngrnIbuSuami(getTrimBigDecimalData(vt.elementAt(25)));
    setNamaIbuSuami(getTrimData(null, vt.elementAt(26)));
    setTglLhrIbuSuami(getTrimData(null, tgl2));
    setJenisPkrjnIbuSuami(getTrimBigDecimalData(vt.elementAt(30)));
    setAlamatIbuSuami(getTrimData(null, vt.elementAt(31)));
    setRtIbuSuami(getTrimBigDecimalData(vt.elementAt(32)));
    setRwIbuSuami(getTrimBigDecimalData(vt.elementAt(33)));
    setDusunIbuSuami(getTrimData(null, vt.elementAt(34)));
    setKposIbuSuami(getTrimBigDecimalData(vt.elementAt(35)));
    setTlpIbuSuami(getTrimData(null, vt.elementAt(36)));
    setNoPropIbuSuami(getTrimData(null, vt.elementAt(37)));
    setNoKabIbuSuami(getTrimData(null, vt.elementAt(38)));
    setNoKecIbuSuami(getTrimData(null, vt.elementAt(39)));
    setNoKelIbuSuami(getTrimData(null, vt.elementAt(40)));
    setNikIstri(getTrimBigDecimalData(nik4));
    setKwrngrnIstri(getTrimBigDecimalData(vt.elementAt(42)));
    setKtrunanIstri(getTrimBigDecimalData(vt.elementAt(43)));
    setKwnKeIstri(getTrimBigDecimalData(vt.elementAt(44)));
    setNikAyhDrIstri(getTrimBigDecimalData(nik5));
    setKwrngrnAyhDrIstri(getTrimBigDecimalData(vt.elementAt(48)));
    setNamaAyhIstri(getTrimData(null, vt.elementAt(49)));
    setTglLhrAyhIstri(getTrimData(null, tgl3));
    setJenisPkrjnAyhIstri(getTrimBigDecimalData(vt.elementAt(53)));
    setAlamatAyhIstri(getTrimData(null, vt.elementAt(54)));
    setRtAyhIstri(getTrimBigDecimalData(vt.elementAt(55)));
    setRwAyhIstri(getTrimBigDecimalData(vt.elementAt(56)));
    setDusunAyhIstri(getTrimData(null, vt.elementAt(57)));
    setKposAyhIstri(getTrimBigDecimalData(vt.elementAt(58)));
    setTlpAyhIstri(getTrimData(null, vt.elementAt(59)));
    setNoPropAyhIstri(getTrimData(null, vt.elementAt(60)));
    setNoKabAyhIstri(getTrimData(null, vt.elementAt(61)));
    setNoKecAyhIstri(getTrimData(null, vt.elementAt(62)));
    setNoKelAyhIstri(getTrimData(null, vt.elementAt(63)));
    setNikIbuDrIstri(getTrimBigDecimalData(nik6));
    setKwrngrnIbuDrIstri(getTrimBigDecimalData(vt.elementAt(65)));
    setNamaIbuIstri(getTrimData(null, vt.elementAt(66)));
    setTglLhrIbuIstri(getTrimData(null, tgl4));
    setJenisPkrjnIbuIstri(getTrimBigDecimalData(vt.elementAt(70)));
    setAlamatIbuIstri(getTrimData(null, vt.elementAt(71)));
    setRtIbuIstri(getTrimBigDecimalData(vt.elementAt(72)));
    setRwIbuIstri(getTrimBigDecimalData(vt.elementAt(73)));
    setDusunIbuIstri(getTrimData(null, vt.elementAt(74)));
    setKposIbuIstri(getTrimBigDecimalData(vt.elementAt(75)));
    setTlpIbuIstri(getTrimData(null, vt.elementAt(76)));
    setNoPropIbuIstri(getTrimData(null, vt.elementAt(77)));
    setNoKabIbuIstri(getTrimData(null, vt.elementAt(78)));
    setNoKecIbuIstri(getTrimData(null, vt.elementAt(79)));
    setNoKelIbuIstri(getTrimData(null, vt.elementAt(80)));
    setNikSksi1(getTrimBigDecimalData(nik7));
    setKwrngrnSksi1(getTrimBigDecimalData(vt.elementAt(82)));
    setNikSksi2(getTrimBigDecimalData(nik8));
    setKwrngrnSksi2(getTrimBigDecimalData(vt.elementAt(85)));
    setTglPembktanKwn(getTrimData(null, tgl5));
    if (getTrimData(null, vt.elementAt(90)) != null) {
      setJam( (vt.elementAt(90).toString() + ":" + vt.elementAt(91).toString() +
               "" + vt.elementAt(92).toString()).trim());
    }
    setTglMlapor(getTrimData(null, tgl6));
    setTdukAgama(getTrimData(null, vt.elementAt(96)));
    setNamaTmptPnesah(getTrimData(null, vt.elementAt(97)));
    setKetNamaTmptPnesah(getTrimData(null, vt.elementAt(98)));
    setNamaPmkaAgama(getTrimData(null, vt.elementAt(99)));
    setAlamatPmkaAgama(getTrimData(null, vt.elementAt(100)));
    setRtPmkaAgama(getTrimBigDecimalData(vt.elementAt(101).toString()));
    setRwPmkaAgama(getTrimBigDecimalData(vt.elementAt(102).toString()));
    setDusunPmkaAgama(getTrimData(null, vt.elementAt(103)));
    setKposPmkaAgama(getTrimBigDecimalData(vt.elementAt(104).toString()));
    setTlpPmkaAgama(getTrimData(null, vt.elementAt(105)));
    setNoPropPmkaAgama(getTrimData(null, vt.elementAt(106)));
    setNoKabPmkaAgama(getTrimData(null, vt.elementAt(107)));
    setNoKecPmkaAgama(getTrimData(null, vt.elementAt(108)));
    setNoKelPmkaAgama(getTrimData(null, vt.elementAt(109)));
    setTglDftKwnLn(getTrimData(null, tgl7));
    setIjnDutKwnWna(getTrimData(null, vt.elementAt(113)));
    setDsrhkCttlkwn(getTrimBigDecimalData(vt.elementAt(114)));
    setPsyrat(getTrimData(null, prystrtn));
    setNoAktaKwn(getTrimData(null, noAktaKwn));
    setTglAktaKwn(getTrimData(sysDate, tgl_akta_kawin));
    setNamaKepDes(getTrimData(null, vt.elementAt(116)));
    setNipLrh(getTrimBigDecimalData(vt.elementAt(117)));
    setNamaPetReg(getTrimData(null, vt.elementAt(118)));
    setNipPetReg(getTrimBigDecimalData(vt.elementAt(119).toString()));
    setNamaPlpor(getTrimData(null, vt.elementAt(120)));
    setTglEntri(getTrimData(null, sysDate));
    setNoProp(getTrimBigDecimalData(vt.elementAt(121)));
    setNoKab(getTrimBigDecimalData(vt.elementAt(122)));
    setCflag("N");
    setPflag("N");
    setStatSebelSuami(getTrimData(null, vt.elementAt(123)));
    setStatSebelIstri(getTrimData(null, vt.elementAt(124)));
    setDaftarAnak(getTrimData(null, daftarAnak));
    return null;
  }

  public void ejbPostCreate(Vector vt, java.lang.String noAktaKwn, java.lang.String daftarAnak, java.lang.String prystrtn) throws CreateException {
    ServiceEntity wniFactory = null;
    BiodataWni remote = null;
    BiodataWniHome home = null;
    BiodataWna remoteWna = null;
    BiodataWnaHome homeWna = null;

    try {
      wniFactory = ServiceEntity.getInstance();
      home = (BiodataWniHome) wniFactory.lookup("BiodataWni", BiodataWniHome.class);
      homeWna = (BiodataWnaHome) wniFactory.lookup("BiodataWna", BiodataWnaHome.class);

      if (getTrimData(null, vt.elementAt(1)) != null) {
        if ( (vt.elementAt(1).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(new BigDecimal(nik1.trim()));
          remote.setStatKwn(new BigDecimal("2"));
          remote.setAktaKwn(new BigDecimal("2"));
          remote.setNoAktaKwn(noAktaKwn.trim());
          System.out.println("vt.elementAt(5)=" + vt.elementAt(5));
          System.out.println("vt.elementAt(6)=" + vt.elementAt(6));
          remote.setPddkAkh(getTrimBigDecimalData(vt.elementAt(5)));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(6)));
        }
        if ( (vt.elementAt(1).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(new BigDecimal(nik1.trim()));
          remoteWna.setStatKwn(new BigDecimal("2"));
          System.out.println("vt.elementAt(5)=" + vt.elementAt(5));
          System.out.println("vt.elementAt(6)=" + vt.elementAt(6));
          remoteWna.setPddkAkh(getTrimBigDecimalData(vt.elementAt(5)));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(6)));
        }
      }

      if (getTrimData(null, nik2) != null) {
        if ( (vt.elementAt(8).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik2));
          System.out.println("vt.elementAt(13)=" + vt.elementAt(13));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(13)));
        }
        if ( (vt.elementAt(8).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik2));
          System.out.println("vt.elementAt(13)=" + vt.elementAt(13));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(13)));
        }
      }

      if (getTrimData(null, nik3) != null) {
        if ( (vt.elementAt(25).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik3));
          System.out.println("vt.elementAt(30)=" + vt.elementAt(30));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(30)));
        }
        if ( (vt.elementAt(25).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik3));
          System.out.println("vt.elementAt(30)=" + vt.elementAt(30));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(30)));
        }
      }

      if (getTrimData(null, vt.elementAt(42)) != null) {
        if ( (vt.elementAt(42).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik4));
          remote.setStatKwn(new BigDecimal("2"));
          remote.setAktaKwn(new BigDecimal("2"));
          remote.setNoAktaKwn(noAktaKwn.trim());
          System.out.println("vt.elementAt(45)=" + vt.elementAt(45));
          System.out.println("vt.elementAt(46)=" + vt.elementAt(46));
          remote.setPddkAkh(getTrimBigDecimalData(vt.elementAt(45)));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(46)));
        }
        if ( (vt.elementAt(1).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik4));
          remoteWna.setStatKwn(new BigDecimal("2"));
          System.out.println("vt.elementAt(45)=" + vt.elementAt(45));
          System.out.println("vt.elementAt(46)=" + vt.elementAt(46));
          remoteWna.setPddkAkh(getTrimBigDecimalData(vt.elementAt(45)));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(46)));
        }
      }
      if (getTrimData(null, nik5) != null) {
        if ( (vt.elementAt(48).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik5));
          System.out.println("vt.elementAt(53)=" + vt.elementAt(53));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(53)));
        }
        if ( (vt.elementAt(48).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik5));
          System.out.println("vt.elementAt(53)=" + vt.elementAt(53));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(53)));
        }
      }
      if (getTrimData(null, nik6) != null) {
        if ( (vt.elementAt(65).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik6));
          System.out.println("vt.elementAt(70)=" + vt.elementAt(70));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(70)));
        }
        if ( (vt.elementAt(65).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik6));
          System.out.println("vt.elementAt(70)=" + vt.elementAt(70));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(70)));
        }
      }

      if (getTrimData(null, nik7) != null) {
        if ( (vt.elementAt(82).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik7));
          System.out.println("vt.elementAt(83)=" + vt.elementAt(83));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(83)));
        }
        if ( (vt.elementAt(82).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik7));
          System.out.println("vt.elementAt(83)=" + vt.elementAt(83));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(83)));
        }
      }
      if (getTrimData(null, nik8) != null) {
        if ( (vt.elementAt(85).toString().toString()).equals("1")) {
          remote = home.findByPrimaryKey(getTrimBigDecimalData(nik8));
          System.out.println("vt.elementAt(86)=" + vt.elementAt(86));
          remote.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(86)));
        }
        if ( (vt.elementAt(85).toString().toString()).equals("2")) {
          remoteWna = homeWna.findByPrimaryKey(getTrimBigDecimalData(nik8));
          System.out.println("vt.elementAt(86)=" + vt.elementAt(86));
          remoteWna.setJenisPkrjn(getTrimBigDecimalData(vt.elementAt(86)));
        }
      }

    }
    catch (Exception err) {

    }

  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNikSuami(java.math.BigDecimal nikSuami);

  public abstract void setKwrngrnSuami(java.math.BigDecimal kwrngrnSuami);

  public abstract void setKtrunanSuami(java.math.BigDecimal ktrunanSuami);

  public abstract void setKwnKeSuami(java.math.BigDecimal kwnKeSuami);

  public abstract void setIstriKe(java.math.BigDecimal istriKe);

  public abstract void setNikAyhDrSuami(java.math.BigDecimal nikAyhDrSuami);

  public abstract void setKwrngrnAyhSuami(java.math.BigDecimal kwrngrnAyhSuami);

  public abstract void setNamaAyhSuami(java.lang.String namaAyhSuami);

  public abstract void setTglLhrAyhSuami(java.lang.String tglLhrAyhSuami);

  public abstract void setJenisPkrjnAyhSuami(java.math.BigDecimal jenisPkrjnAyhSuami);

  public abstract void setAlamatAyhSuami(java.lang.String alamatAyhSuami);

  public abstract void setRtAyhSuami(java.math.BigDecimal rtAyhSuami);

  public abstract void setRwAyhSuami(java.math.BigDecimal rwAyhSuami);

  public abstract void setDusunAyhSuami(java.lang.String dusunAyhSuami);

  public abstract void setKposAyhSuami(java.math.BigDecimal kposAyhSuami);

  public abstract void setTlpAyhSuami(java.lang.String tlpAyhSuami);

  public abstract void setNoPropAyhSuami(java.lang.String noPropAyhSuami);

  public abstract void setNoKabAyhSuami(java.lang.String noKabAyhSuami);

  public abstract void setNoKecAyhSuami(java.lang.String noKecAyhSuami);

  public abstract void setNoKelAyhSuami(java.lang.String noKelAyhSuami);

  public abstract void setNikIbuDrSuami(java.math.BigDecimal nikIbuDrSuami);

  public abstract void setKwrngrnIbuSuami(java.math.BigDecimal kwrngrnIbuSuami);

  public abstract void setNamaIbuSuami(java.lang.String namaIbuSuami);

  public abstract void setTglLhrIbuSuami(java.lang.String tglLhrIbuSuami);

  public abstract void setJenisPkrjnIbuSuami(java.math.BigDecimal jenisPkrjnIbuSuami);

  public abstract void setAlamatIbuSuami(java.lang.String alamatIbuSuami);

  public abstract void setRtIbuSuami(java.math.BigDecimal rtIbuSuami);

  public abstract void setRwIbuSuami(java.math.BigDecimal rwIbuSuami);

  public abstract void setDusunIbuSuami(java.lang.String dusunIbuSuami);

  public abstract void setKposIbuSuami(java.math.BigDecimal kposIbuSuami);

  public abstract void setTlpIbuSuami(java.lang.String tlpIbuSuami);

  public abstract void setNoPropIbuSuami(java.lang.String noPropIbuSuami);

  public abstract void setNoKabIbuSuami(java.lang.String noKabIbuSuami);

  public abstract void setNoKecIbuSuami(java.lang.String noKecIbuSuami);

  public abstract void setNoKelIbuSuami(java.lang.String noKelIbuSuami);

  public abstract void setNikIstri(java.math.BigDecimal nikIstri);

  public abstract void setKwrngrnIstri(java.math.BigDecimal kwrngrnIstri);

  public abstract void setKtrunanIstri(java.math.BigDecimal ktrunanIstri);

  public abstract void setKwnKeIstri(java.math.BigDecimal kwnKeIstri);

  public abstract void setNikAyhDrIstri(java.math.BigDecimal nikAyhDrIstri);

  public abstract void setKwrngrnAyhDrIstri(java.math.BigDecimal kwrngrnAyhDrIstri);

  public abstract void setNamaAyhIstri(java.lang.String namaAyhIstri);

  public abstract void setTglLhrAyhIstri(java.lang.String tglLhrAyhIstri);

  public abstract void setJenisPkrjnAyhIstri(java.math.BigDecimal jenisPkrjnAyhIstri);

  public abstract void setAlamatAyhIstri(java.lang.String alamatAyhIstri);

  public abstract void setRtAyhIstri(java.math.BigDecimal rtAyhIstri);

  public abstract void setRwAyhIstri(java.math.BigDecimal rwAyhIstri);

  public abstract void setDusunAyhIstri(java.lang.String dusunAyhIstri);

  public abstract void setKposAyhIstri(java.math.BigDecimal kposAyhIstri);

  public abstract void setTlpAyhIstri(java.lang.String tlpAyhIstri);

  public abstract void setNoPropAyhIstri(java.lang.String noPropAyhIstri);

  public abstract void setNoKabAyhIstri(java.lang.String noKabAyhIstri);

  public abstract void setNoKecAyhIstri(java.lang.String noKecAyhIstri);

  public abstract void setNoKelAyhIstri(java.lang.String noKelAyhIstri);

  public abstract void setNikIbuDrIstri(java.math.BigDecimal nikIbuDrIstri);

  public abstract void setKwrngrnIbuDrIstri(java.math.BigDecimal kwrngrnIbuDrIstri);

  public abstract void setNamaIbuIstri(java.lang.String namaIbuIstri);

  public abstract void setTglLhrIbuIstri(java.lang.String tglLhrIbuIstri);

  public abstract void setJenisPkrjnIbuIstri(java.math.BigDecimal jenisPkrjnIbuIstri);

  public abstract void setAlamatIbuIstri(java.lang.String alamatIbuIstri);

  public abstract void setRtIbuIstri(java.math.BigDecimal rtIbuIstri);

  public abstract void setRwIbuIstri(java.math.BigDecimal rwIbuIstri);

  public abstract void setDusunIbuIstri(java.lang.String dusunIbuIstri);

  public abstract void setKposIbuIstri(java.math.BigDecimal kposIbuIstri);

  public abstract void setTlpIbuIstri(java.lang.String tlpIbuIstri);

  public abstract void setNoPropIbuIstri(java.lang.String noPropIbuIstri);

  public abstract void setNoKabIbuIstri(java.lang.String noKabIbuIstri);

  public abstract void setNoKecIbuIstri(java.lang.String noKecIbuIstri);

  public abstract void setNoKelIbuIstri(java.lang.String noKelIbuIstri);

  public abstract void setNikSksi1(java.math.BigDecimal nikSksi1);

  public abstract void setKwrngrnSksi1(java.math.BigDecimal kwrngrnSksi1);

  public abstract void setNikSksi2(java.math.BigDecimal nikSksi2);

  public abstract void setKwrngrnSksi2(java.math.BigDecimal kwrngrnSksi2);

  public abstract void setTglPembktanKwn(java.lang.String tglPembktanKwn);

  public abstract void setJam(java.lang.String jam);

  public abstract void setTglMlapor(java.lang.String tglMlapor);

  public abstract void setTdukAgama(java.lang.String tdukAgama);

  public abstract void setNamaTmptPnesah(java.lang.String namaTmptPnesah);

  public abstract void setKetNamaTmptPnesah(java.lang.String ketNamaTmptPnesah);

  public abstract void setNamaPmkaAgama(java.lang.String namaPmkaAgama);

  public abstract void setAlamatPmkaAgama(java.lang.String alamatPmkaAgama);

  public abstract void setRtPmkaAgama(java.math.BigDecimal rtPmkaAgama);

  public abstract void setRwPmkaAgama(java.math.BigDecimal rwPmkaAgama);

  public abstract void setDusunPmkaAgama(java.lang.String dusunPmkaAgama);

  public abstract void setKposPmkaAgama(java.math.BigDecimal kposPmkaAgama);

  public abstract void setTlpPmkaAgama(java.lang.String tlpPmkaAgama);

  public abstract void setNoPropPmkaAgama(java.lang.String noPropPmkaAgama);

  public abstract void setNoKabPmkaAgama(java.lang.String noKabPmkaAgama);

  public abstract void setNoKecPmkaAgama(java.lang.String noKecPmkaAgama);

  public abstract void setNoKelPmkaAgama(java.lang.String noKelPmkaAgama);

  public abstract void setTglDftKwnLn(java.lang.String tglDftKwnLn);

  public abstract void setIjnDutKwnWna(java.lang.String ijnDutKwnWna);

  public abstract void setDsrhkCttlkwn(java.math.BigDecimal dsrhkCttlkwn);

  public abstract void setPsyrat(java.lang.String psyrat);

  public abstract void setNoAktaKwn(java.lang.String noAktaKwn);

  public abstract void setTglAktaKwn(java.lang.String tglAktaKwn);

  public abstract void setTglCtkKtakta(java.lang.String tglCtkKtakta);

  public abstract void setNamaKepDes(java.lang.String namaKepDes);

  public abstract void setNipLrh(java.math.BigDecimal nipLrh);

  public abstract void setNamaPetReg(java.lang.String namaPetReg);

  public abstract void setNipPetReg(java.math.BigDecimal nipPetReg);

  public abstract void setNamaPlpor(java.lang.String namaPlpor);

  public abstract void setTglEntri(java.lang.String tglEntri);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setCflag(java.lang.String cflag);

  public abstract void setPflag(java.lang.String pflag);

  public abstract void setStatSebelSuami(java.lang.String statSebelSuami);

  public abstract void setStatSebelIstri(java.lang.String statSebelIstri);
  public abstract void setDaftarAnak(java.lang.String daftarAnak);

  public abstract java.math.BigDecimal getNikSuami();

  public abstract java.math.BigDecimal getKwrngrnSuami();

  public abstract java.math.BigDecimal getKtrunanSuami();

  public abstract java.math.BigDecimal getKwnKeSuami();

  public abstract java.math.BigDecimal getIstriKe();

  public abstract java.math.BigDecimal getNikAyhDrSuami();

  public abstract java.math.BigDecimal getKwrngrnAyhSuami();

  public abstract java.lang.String getNamaAyhSuami();

  public abstract java.lang.String getTglLhrAyhSuami();

  public abstract java.math.BigDecimal getJenisPkrjnAyhSuami();

  public abstract java.lang.String getAlamatAyhSuami();

  public abstract java.math.BigDecimal getRtAyhSuami();

  public abstract java.math.BigDecimal getRwAyhSuami();

  public abstract java.lang.String getDusunAyhSuami();

  public abstract java.math.BigDecimal getKposAyhSuami();

  public abstract java.lang.String getTlpAyhSuami();

  public abstract java.lang.String getNoPropAyhSuami();

  public abstract java.lang.String getNoKabAyhSuami();

  public abstract java.lang.String getNoKecAyhSuami();

  public abstract java.lang.String getNoKelAyhSuami();

  public abstract java.math.BigDecimal getNikIbuDrSuami();

  public abstract java.math.BigDecimal getKwrngrnIbuSuami();

  public abstract java.lang.String getNamaIbuSuami();

  public abstract java.lang.String getTglLhrIbuSuami();

  public abstract java.math.BigDecimal getJenisPkrjnIbuSuami();

  public abstract java.lang.String getAlamatIbuSuami();

  public abstract java.math.BigDecimal getRtIbuSuami();

  public abstract java.math.BigDecimal getRwIbuSuami();

  public abstract java.lang.String getDusunIbuSuami();

  public abstract java.math.BigDecimal getKposIbuSuami();

  public abstract java.lang.String getTlpIbuSuami();

  public abstract java.lang.String getNoPropIbuSuami();

  public abstract java.lang.String getNoKabIbuSuami();

  public abstract java.lang.String getNoKecIbuSuami();

  public abstract java.lang.String getNoKelIbuSuami();

  public abstract java.math.BigDecimal getNikIstri();

  public abstract java.math.BigDecimal getKwrngrnIstri();

  public abstract java.math.BigDecimal getKtrunanIstri();

  public abstract java.math.BigDecimal getKwnKeIstri();

  public abstract java.math.BigDecimal getNikAyhDrIstri();

  public abstract java.math.BigDecimal getKwrngrnAyhDrIstri();

  public abstract java.lang.String getNamaAyhIstri();

  public abstract java.lang.String getTglLhrAyhIstri();

  public abstract java.math.BigDecimal getJenisPkrjnAyhIstri();

  public abstract java.lang.String getAlamatAyhIstri();

  public abstract java.math.BigDecimal getRtAyhIstri();

  public abstract java.math.BigDecimal getRwAyhIstri();

  public abstract java.lang.String getDusunAyhIstri();

  public abstract java.math.BigDecimal getKposAyhIstri();

  public abstract java.lang.String getTlpAyhIstri();

  public abstract java.lang.String getNoPropAyhIstri();

  public abstract java.lang.String getNoKabAyhIstri();

  public abstract java.lang.String getNoKecAyhIstri();

  public abstract java.lang.String getNoKelAyhIstri();

  public abstract java.math.BigDecimal getNikIbuDrIstri();

  public abstract java.math.BigDecimal getKwrngrnIbuDrIstri();

  public abstract java.lang.String getNamaIbuIstri();

  public abstract java.lang.String getTglLhrIbuIstri();

  public abstract java.math.BigDecimal getJenisPkrjnIbuIstri();

  public abstract java.lang.String getAlamatIbuIstri();

  public abstract java.math.BigDecimal getRtIbuIstri();

  public abstract java.math.BigDecimal getRwIbuIstri();

  public abstract java.lang.String getDusunIbuIstri();

  public abstract java.math.BigDecimal getKposIbuIstri();

  public abstract java.lang.String getTlpIbuIstri();

  public abstract java.lang.String getNoPropIbuIstri();

  public abstract java.lang.String getNoKabIbuIstri();

  public abstract java.lang.String getNoKecIbuIstri();

  public abstract java.lang.String getNoKelIbuIstri();

  public abstract java.math.BigDecimal getNikSksi1();

  public abstract java.math.BigDecimal getKwrngrnSksi1();

  public abstract java.math.BigDecimal getNikSksi2();

  public abstract java.math.BigDecimal getKwrngrnSksi2();

  public abstract java.lang.String getTglPembktanKwn();

  public abstract java.lang.String getJam();

  public abstract java.lang.String getTglMlapor();

  public abstract java.lang.String getTdukAgama();

  public abstract java.lang.String getNamaTmptPnesah();

  public abstract java.lang.String getKetNamaTmptPnesah();

  public abstract java.lang.String getNamaPmkaAgama();

  public abstract java.lang.String getAlamatPmkaAgama();

  public abstract java.math.BigDecimal getRtPmkaAgama();

  public abstract java.math.BigDecimal getRwPmkaAgama();

  public abstract java.lang.String getDusunPmkaAgama();

  public abstract java.math.BigDecimal getKposPmkaAgama();

  public abstract java.lang.String getTlpPmkaAgama();

  public abstract java.lang.String getNoPropPmkaAgama();

  public abstract java.lang.String getNoKabPmkaAgama();

  public abstract java.lang.String getNoKecPmkaAgama();

  public abstract java.lang.String getNoKelPmkaAgama();

  public abstract java.lang.String getTglDftKwnLn();

  public abstract java.lang.String getIjnDutKwnWna();

  public abstract java.math.BigDecimal getDsrhkCttlkwn();

  public abstract java.lang.String getPsyrat();

  public abstract java.lang.String getNoAktaKwn();

  public abstract java.lang.String getTglAktaKwn();

  public abstract java.lang.String getTglCtkKtakta();

  public abstract java.lang.String getNamaKepDes();

  public abstract java.math.BigDecimal getNipLrh();

  public abstract java.lang.String getNamaPetReg();

  public abstract java.math.BigDecimal getNipPetReg();

  public abstract java.lang.String getNamaPlpor();

  public abstract java.lang.String getTglEntri();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.lang.String getCflag();

  public abstract java.lang.String getPflag();

  public abstract java.lang.String getStatSebelSuami();

  public abstract java.lang.String getStatSebelIstri();
  public abstract java.lang.String getDaftarAnak();

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
    // System.out.println("trimdata"+trimdata.toString());
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

  private String getFmtCode(String code) {
    if ( (code != null) && (!code.trim().equals(""))) {
      if (code.length() == 1) {
        return ("0".trim() + code.trim());
      }
      return code.trim();
    }
    return "";
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

  private String getSiakDate(String dd, String mm, String yy) {
    if ( (dd == null || dd.trim().equals("") || dd.trim().equals("0")) ||
        (mm == null || mm.trim().equals("") || mm.trim().equals("0"))
        || (yy == null || yy.trim().equals("") || yy.trim().equals("0"))) {
      return null;
    }
    return (dd.trim() + "-" + mm.trim() + "-" + yy.trim());
  }

  public java.util.Collection ejbHomeGetAllPerkawinan(java.math.BigDecimal nikSuami) {
    try {
      return ejbSelectAllPerkawinan(nikSuami);
    }
    catch (FinderException ex) {
      return null;
    }
  }

  public abstract java.util.Collection ejbSelectAllPerkawinan(java.math.BigDecimal nikSuami) throws FinderException;

}
