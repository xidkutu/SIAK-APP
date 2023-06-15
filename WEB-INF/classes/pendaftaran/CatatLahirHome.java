package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface CatatLahirHome
    extends javax.ejb.EJBLocalHome {
  public CatatLahir create(String nikBayi) throws CreateException;

  public CatatLahir create(String nikBayi, BigDecimal tmptDilhr,
                           String pukulLhr,
                           BigDecimal wktPklLhr, BigDecimal jenisKlahir,
                           BigDecimal anakKeLahir,
                           BigDecimal pnlngBayi, String brtBayi, String nikIbu,
                           String namaIbu,
                           String tglLhrIbu, BigDecimal jenisPkrjnIbu,
                           String alamatIbu,
                           BigDecimal noRtIbu, BigDecimal noRwIbu,
                           String dusunIbu,
                           BigDecimal kodeposIbu, String telpIbu,
                           String namaKelIbu,
                           String noKelIbu, String noKecIbu, String noKabIbu,
                           String noPropIbu, BigDecimal kwrngrnIbu,
                           BigDecimal ketrunanIbu,
                           String bangsaIbu, String tglCttKwnIbu, String nikAyh,
                           String namaAyh,
                           String tglLhirAyh, BigDecimal jenisPkrjnAyh,
                           String alamatAyh,
                           BigDecimal noRtAyh, BigDecimal noRwAyh,
                           String dusunAyh,
                           BigDecimal kodeposAyh, String telpAyh,
                           String noKelAyh,
                           String noKecAyh, String noKabAyh, String noPropAyh,
                           BigDecimal kwrngrnAyh, BigDecimal ketrunanAyh,
                           String bangsaAyh,
                           String tglCttKwnAyh, String nikPlpor,
                           String tglMlpor, BigDecimal userId,
                           BigDecimal noProp, BigDecimal noKab,
                           BigDecimal noKec, String tglEntri,
                           String cflag, String pflag) throws CreateException;

  public CatatLahir findByPrimaryKey(String nikBayi) throws FinderException;

}