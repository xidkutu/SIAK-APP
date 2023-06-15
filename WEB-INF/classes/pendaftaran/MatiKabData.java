package pendaftaran;

public class MatiKabData
    implements java.io.Serializable {

  MatiObject recordJnsah;
  PelaporNikMatiData recordPelapor;
  SaksiObject recordSaksi;

  public MatiKabData() {
  }

  public MatiKabData(MatiObject recordJnsah, PelaporNikMatiData recordPelapor,
                     SaksiObject recordSaksi) {
    this.recordJnsah = recordJnsah;
    this.recordPelapor = recordPelapor;
    this.recordSaksi = recordSaksi;
  }

  public void setRecordSaksi(SaksiObject recordSaksi) {
    this.recordSaksi = recordSaksi;
  }

  public SaksiObject getRecordSaksi() {
    return recordSaksi;
  }

  public void setRecordJnsah(MatiObject recordJnsah) {
    this.recordJnsah = recordJnsah;
  }

  public MatiObject getRecordJnsah() {
    return recordJnsah;
  }

  public void setRecordPelapor(PelaporNikMatiData recordPelapor) {
    this.recordPelapor = recordPelapor;
  }

  public PelaporNikMatiData getRecordPelapor() {
    return recordPelapor;
  }

}
