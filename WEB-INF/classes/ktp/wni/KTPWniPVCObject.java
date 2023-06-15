package ktp.wni;

public class KTPWniPVCObject extends KTPWniObject {
  private String img_person;

  public KTPWniPVCObject() {}
  public KTPWniPVCObject(String nik, String img_foto, String img_person) {
      super(nik, img_foto);
      this.img_person = img_person;
  }

  public KTPWniPVCObject(String nik, String nama_lgkp, String tgl_lhr, String alamat )
  {
    super(nik, nama_lgkp, tgl_lhr, alamat);
  }

  public KTPWniPVCObject(String nik, String nama_lgkp, String tgl_lhr, String alamat, boolean found )
  {
    super(nik, nama_lgkp, tgl_lhr, alamat, found);
  }

  public KTPWniPVCObject( String nik, String nama_lgkp, String tmpt_lhr, String tgl_lhr,
                       String jenis_klmin, String gol_drh, String alamat, String no_rt,
                       String no_rw, String nama_kel, String nama_kec, String nama_kab, String nama_prop,
                       String agama, String jenis_pkrjn, String stat_kwn, String tgl_berlaku,
                       String systgl, String img_foto, String kewarganegaraan )
  {
    super(nik, nama_lgkp, tmpt_lhr, tgl_lhr, jenis_klmin, gol_drh, alamat, no_rt,
                       no_rw, nama_kel, nama_kec, nama_kab, nama_prop,
                       agama, jenis_pkrjn, stat_kwn, tgl_berlaku,
                       systgl, img_foto, kewarganegaraan);

  }

  public KTPWniPVCObject( String nik, String nama_lgkp, String tmpt_lhr, String tgl_lhr,
                         String kewarganegaraan,String jenis_klmin, String no_paspor,
                         String no_dok,String tgl_akh_dok,String alamat, String no_rt,
                         String no_rw, String tgl_berlaku,String systgl,String nama_kel, String nama_kec, String nama_kab, String nama_prop,
                         String img_foto)
    {
      super(nik, nama_lgkp, tmpt_lhr, tgl_lhr, kewarganegaraan, jenis_klmin, no_paspor,
                         no_dok, tgl_akh_dok, alamat, no_rt, no_rw, tgl_berlaku, systgl, nama_kel,
                         nama_kec, nama_kab, nama_prop, img_foto);
    }


  public String getImg_person() {
    return img_person;
  }
  public void setImg_person(String img_person) {
    this.img_person = img_person;
  }
}