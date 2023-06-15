package pendaftaran;

import java.math.*;
import javax.ejb.*;

public interface BiodataMatiHome
    extends javax.ejb.EJBLocalHome {
  public BiodataMati create(BigDecimal nik) throws CreateException;

  public BiodataMati create(BigDecimal nik, BigDecimal wnJenazah, String noKtp,
                            String tmptSbl, String namaLgkp, String namaKlrga,
                            BigDecimal jenisKlmin, String tmptLhr,
                            String tglLhr, String alamatJenazah,
                            BigDecimal noRtJenazah, BigDecimal noRwJenazah,
                            String dusunJenazah, BigDecimal kodePos,
                            String telp, String kwrngrn, BigDecimal aktaLhr,
                            String noAktaLhr, BigDecimal golDrh, String agama,
                            BigDecimal statKwn, BigDecimal aktaKwn,
                            String noAktaKwn, String tglKwn,
                            BigDecimal aktaCrai, String noAktaCrai,
                            String tglCrai, BigDecimal statHbkel,
                            BigDecimal klainFsk, BigDecimal pnydngCct,
                            BigDecimal pddkAkh, BigDecimal jenisPkrjn,
                            BigDecimal nikIbu, String namaLgkpIbu,
                            BigDecimal nikAyah, String namaLgkpAyah,
                            String namaKetRt, String namaKetRw,
                            String namaPetReg, BigDecimal nipPetReg,
                            String namaPetEntri, BigDecimal nipPetEntri,
                            String tglEntri, BigDecimal noKk,
                            BigDecimal jenisBntu, BigDecimal noProp,
                            BigDecimal noKab, BigDecimal noKec,
                            BigDecimal noKel, BigDecimal statHidup,
                            String tglUbah, String tglCetakKtp, String
                            tglGantiKtp, String tglPjgKtp, BigDecimal statKtp,
                            BigDecimal alsNumpang, String alamatSpsor,
                            BigDecimal noRtSpsor, BigDecimal noRwSpsor,
                            BigDecimal kodeposSpsor, String teleponSpsor,
                            String datngDari, String tujuanDtng,
                            String noPaspor, String tglPaspor,
                            String tglAkhPaspor, String namaSpsor,
                            BigDecimal tipeSpsor, BigDecimal dokImgr,
                            String noDok, String tmptDtbit, String tglDtbit,
                            String tglAkhDok, String tmptDtngPert,
                            String tglDtngPert, String noStld, String tglDft,
                            String namaDin, String namaKepDin,
                            BigDecimal nipKepDin, String pflag, String cflag) throws
      CreateException;

  public BiodataMati findByPrimaryKey(BigDecimal nik) throws FinderException;
}