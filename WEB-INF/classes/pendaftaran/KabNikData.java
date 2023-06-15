package pendaftaran;

public class KabNikData
    implements java.io.Serializable {
  private SaksiObject recordSaksi;

  private LahiObject recordBayi;
  private PelaporNikData recordPelapor;

  public KabNikData() {
  }

  public KabNikData(LahiObject recordBayi, PelaporNikData recordPelapor,
                    SaksiObject recordSaksi) {
    this.recordBayi = recordBayi;
    this.recordPelapor = recordPelapor;

    this.recordSaksi = recordSaksi;
  }

  public void setRecordSaksi(SaksiObject recordSaksi) {
    this.recordSaksi = recordSaksi;
  }

  public SaksiObject getRecordSaksi() {
    return recordSaksi;
  }

  public KabNikData(LahiObject recordBayi, PelaporNikData recordPelapor) {
    this.recordBayi = recordBayi;
    this.recordPelapor = recordPelapor;
  }

  public void setRecordBayi(LahiObject recordBayi) {
    this.recordBayi = recordBayi;
  }

  public LahiObject getRecordBayi() {
    return recordBayi;
  }

  public void setRecordPelapor(PelaporNikData recordPelapor) {
    this.recordPelapor = recordPelapor;
  }

  public PelaporNikData getRecordPelapor() {
    return recordPelapor;
  }

}