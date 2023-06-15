package pendaftaran;

import java.math.*;
import javax.ejb.*;
import java.util.*;

public interface BiodataWniHome
    extends javax.ejb.EJBLocalHome {
  public BiodataWni create(BigDecimal nik) throws CreateException;

  public BiodataWni create(BigDecimal nik, String noKtp, String tmptSbl, String noPaspor, String tglAkhPaspor, String namaLgkp, BigDecimal jenisKlmin, String tmptLhr, String tglLhr, BigDecimal aktaLhr, String noAktaLhr, BigDecimal golDrh, String agama, BigDecimal statKwn, BigDecimal aktaKwn, String noAktaKwn, String tglKwn, BigDecimal aktaCrai, String noAktaCrai, String tglCrai, BigDecimal statHbkel, BigDecimal klainFsk, BigDecimal pnydngCct, BigDecimal pddkAkh, BigDecimal jenisPkrjn, BigDecimal nikIbu, String namaLgkpIbu, BigDecimal nikAyah, String namaLgkpAyah, String namaKetRt, String namaKetRw, String namaPetReg, BigDecimal nipPetReg, String namaPetEntri, BigDecimal nipPetEntri, String tglEntri, BigDecimal noKk, BigDecimal jenisBntu, BigDecimal noProp, BigDecimal noKab, BigDecimal noKec, BigDecimal noKel, BigDecimal statHidup, String tglUbah, String tglCetakKtp, String tglGantiKtp, String tglPjgKtp, BigDecimal statKtp, BigDecimal alsNumpang, String pflag, String cflag) throws CreateException;

  public BiodataWni create(BiodataWniDetailBean bean) throws CreateException;
  public BiodataWni findByPrimaryKey(BigDecimal nik) throws FinderException;


//  public BiodataWni findByNoKk(BigDecimal noKk) throws FinderException;
}