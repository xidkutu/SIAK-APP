package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface CatatMatiHome
    extends javax.ejb.EJBLocalHome {
  public CatatMati create(BigDecimal nikJnsah) throws CreateException;

  public CatatMati create(BigDecimal nikJnsah, BigDecimal kwrngrnJnsah,
                          BigDecimal ktrunanJnsah, BigDecimal anakKe,
                          String tglMati,
                          String pukul, BigDecimal wktPukul,
                          BigDecimal sbabMati,
                          String tmptMati, BigDecimal ygMnerang,
                          String pnetapPn,
                          String noPnetap, String tglPnetap, BigDecimal nikIbu,
                          BigDecimal kwrngrnIbu, String namaLgkpIbu,
                          String tglLhrIbu,
                          BigDecimal jenisPkrjnIbu, String alamatIbu,
                          BigDecimal noRtIbu,
                          BigDecimal noRwIbu, String dusunIbu,
                          BigDecimal kodeposIbu,
                          String telpIbu, String noPropIbu, String noKabIbu,
                          String noKecIbu, String noKelIbu, BigDecimal nikAyh,
                          BigDecimal kwrngrnAyh, String namaLgkpAyh,
                          String tglLhrAyh,
                          BigDecimal jenisPkrjnAyh, String alamatAyh,
                          BigDecimal noRtAyh,
                          String dusunAyh, BigDecimal noRwAyh,
                          BigDecimal kodeposAyh,
                          String telpAyh, String noPropAyh, String noKabAyh,
                          String noKecAyh, String noKelAyh, BigDecimal nikPlpor,
                          BigDecimal kwrngrnPlpor, String tglMlpor,
                          BigDecimal noProp,
                          BigDecimal noKab, BigDecimal noKec) throws
      CreateException;

  public CatatMati findByPrimaryKey(BigDecimal nikJnsah) throws FinderException;

}