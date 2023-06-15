package manage;

import java.io.Serializable;

public class KendaliProsesObject implements Serializable {
  private String no_prop;
  private String no_kab;
  private String no_srt_mdn;
  private String tgl_srt_mdn;
  private String no_srt_asl;
  private String tgl_srt_asl;
  private String ktp_start;
  private String ktp_end;
  private String ktp_idx;
  private String kk_start;
  private String kk_end;
  private String kk_idx;
  private String lahir_start;
  private String lahir_end;
  private String lahir_idx;
  private String kawin_start;
  private String kawin_end;
  private String kawin_idx;
  private String cerai_start;
  private String cerai_end;
  private String cerai_idx;
  private String mati_start;
  private String mati_end;
  private String mati_idx;
  private String png_start;
  private String png_end;
  private String png_idx;
  private String nm_pet_oto;
  private String nip_pet_oto;
  private String jab_pet_oto;
  private String user_id;
  private String tgl_entry;
  private String stat_ktp;
  private String stat_kk;
  private String stat_lahir;
  private String stat_kawin;
  private String stat_cerai;
  private String stat_mati;
  private String stat_png;
  private String nk_max;

  public KendaliProsesObject(String no_prop, String no_kab, String no_srt_mdn, String tgl_srt_mdn, String no_srt_asl, String tgl_srt_asl,
String ktp_start, String ktp_end, String ktp_idx, String kk_start, String kk_end, String kk_idx, String lahir_start,
String lahir_end, String lahir_idx, String kawin_start, String kawin_end, String kawin_idx, String cerai_start,
String cerai_end, String cerai_idx, String mati_start, String mati_end, String mati_idx, String png_start,
String png_end, String png_idx, String nm_pet_oto, String nip_pet_oto, String jab_pet_oto, String user_id,
String tgl_entry, String stat_ktp, String stat_kk, String stat_lahir, String stat_kawin, String stat_cerai,
String stat_mati, String stat_png, String nk_max
)
  {
    this.no_prop=        no_prop;
    this.no_kab = no_kab;
    this.no_srt_mdn = no_srt_mdn;
    this.tgl_srt_mdn = tgl_srt_mdn;
    this.no_srt_asl = no_srt_asl;
    this.tgl_srt_asl = tgl_srt_asl;
    this.ktp_start = ktp_start;
    this.ktp_end = ktp_end;
    this.ktp_idx = ktp_idx;
    this.kk_start = kk_start;
    this.kk_end = kk_end;
    this.kk_idx = kk_idx;
    this.lahir_start = lahir_start;
    this.lahir_end = lahir_end;
    this.lahir_idx = lahir_idx;
    this.kawin_start = kawin_start;
    this.kawin_end = kawin_end;
    this.kawin_idx = kawin_idx;
    this.cerai_start = cerai_start;
    this.cerai_end = cerai_end;
    this.cerai_idx = cerai_idx;
    this.mati_start = mati_start;
    this.mati_end = mati_end;
    this.mati_idx = mati_idx;
    this.png_start = png_start;
    this.png_end = png_end;
    this.png_idx = png_idx;
    this.nm_pet_oto = nm_pet_oto;
    this.nip_pet_oto = nip_pet_oto;
    this.jab_pet_oto = jab_pet_oto;
    this.user_id = user_id;
    this.tgl_entry = tgl_entry;
    this.stat_ktp = stat_ktp;
    this.stat_kk = stat_kk;
    this.stat_lahir = stat_lahir;
    this.stat_kawin = stat_kawin;
    this.stat_cerai = stat_cerai;
    this.stat_mati = stat_mati;
    this.stat_png = stat_png;
    this.nk_max = nk_max;


  }

  public String getNo_prop() {
    return no_prop;
  }
  public void setNo_prop(String no_prop) {
    this.no_prop = no_prop;
  }
  public String getNo_kab() {
    return no_kab;
  }
  public void setNo_kab(String no_kab) {
    this.no_kab = no_kab;
  }
  public String getNo_srt_mdn() {
    return no_srt_mdn;
  }
  public void setNo_srt_mdn(String no_srt_mdn) {
    this.no_srt_mdn = no_srt_mdn;
  }
  public String getTgl_srt_mdn() {
    return tgl_srt_mdn;
  }
  public void setTgl_srt_mdn(String tgl_srt_mdn) {
    this.tgl_srt_mdn = tgl_srt_mdn;
  }
  public String getNo_srt_asl() {
    return no_srt_asl;
  }
  public void setNo_srt_asl(String no_srt_asl) {
    this.no_srt_asl = no_srt_asl;
  }
  public String getTgl_srt_asl() {
    return tgl_srt_asl;
  }
  public void setTgl_srt_asl(String tgl_srt_asl) {
    this.tgl_srt_asl = tgl_srt_asl;
  }
  public String getKtp_start() {
    return ktp_start;
  }
  public void setKtp_start(String ktp_start) {
    this.ktp_start = ktp_start;
  }
  public String getKtp_end() {
    return ktp_end;
  }
  public void setKtp_end(String ktp_end) {
    this.ktp_end = ktp_end;
  }
  public String getKtp_idx() {
    return ktp_idx;
  }
  public void setKtp_idx(String ktp_idx) {
    this.ktp_idx = ktp_idx;
  }
  public String getKk_start() {
    return kk_start;
  }
  public void setKk_start(String kk_start) {
    this.kk_start = kk_start;
  }
  public String getKk_end() {
    return kk_end;
  }
  public void setKk_end(String kk_end) {
    this.kk_end = kk_end;
  }
  public String getKk_idx() {
    return kk_idx;
  }
  public void setKk_idx(String kk_idx) {
    this.kk_idx = kk_idx;
  }
  public String getLahir_start() {
    return lahir_start;
  }
  public void setLahir_start(String lahir_start) {
    this.lahir_start = lahir_start;
  }
  public String getLahir_end() {
    return lahir_end;
  }
  public void setLahir_end(String lahir_end) {
    this.lahir_end = lahir_end;
  }
  public String getLahir_idx() {
    return lahir_idx;
  }
  public void setLahir_idx(String lahir_idx) {
    this.lahir_idx = lahir_idx;
  }
  public String getKawin_start() {
    return kawin_start;
  }
  public void setKawin_start(String kawin_start) {
    this.kawin_start = kawin_start;
  }
  public String getKawin_end() {
    return kawin_end;
  }
  public void setKawin_end(String kawin_end) {
    this.kawin_end = kawin_end;
  }
  public String getKawin_idx() {
    return kawin_idx;
  }
  public void setKawin_idx(String kawin_idx) {
    this.kawin_idx = kawin_idx;
  }
  public String getCerai_start() {
    return cerai_start;
  }
  public void setCerai_start(String cerai_start) {
    this.cerai_start = cerai_start;
  }
  public String getCerai_end() {
    return cerai_end;
  }
  public void setCerai_end(String cerai_end) {
    this.cerai_end = cerai_end;
  }
  public String getCerai_idx() {
    return cerai_idx;
  }
  public void setCerai_idx(String cerai_idx) {
    this.cerai_idx = cerai_idx;
  }
  public String getMati_start() {
    return mati_start;
  }
  public void setMati_start(String mati_start) {
    this.mati_start = mati_start;
  }
  public String getMati_end() {
    return mati_end;
  }
  public void setMati_end(String mati_end) {
    this.mati_end = mati_end;
  }
  public String getMati_idx() {
    return mati_idx;
  }
  public void setMati_idx(String mati_idx) {
    this.mati_idx = mati_idx;
  }
  public String getPng_start() {
    return png_start;
  }
  public void setPng_start(String png_start) {
    this.png_start = png_start;
  }
  public String getPng_end() {
    return png_end;
  }
  public void setPng_end(String png_end) {
    this.png_end = png_end;
  }
  public String getPng_idx() {
    return png_idx;
  }
  public void setPng_idx(String png_idx) {
    this.png_idx = png_idx;
  }
  public String getNm_pet_oto() {
    return nm_pet_oto;
  }
  public void setNm_pet_oto(String nm_pet_oto) {
    this.nm_pet_oto = nm_pet_oto;
  }
  public String getNip_pet_oto() {
    return nip_pet_oto;
  }
  public void setNip_pet_oto(String nip_pet_oto) {
    this.nip_pet_oto = nip_pet_oto;
  }
  public String getJab_pet_oto() {
    return jab_pet_oto;
  }
  public void setJab_pet_oto(String jab_pet_oto) {
    this.jab_pet_oto = jab_pet_oto;
  }
  public String getUser_id() {
    return user_id;
  }
  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }
  public String getTgl_entry() {
    return tgl_entry;
  }
  public void setTgl_entry(String tgl_entry) {
    this.tgl_entry = tgl_entry;
  }
  public String getStat_ktp() {
    return stat_ktp;
  }
  public void setStat_ktp(String stat_ktp) {
    this.stat_ktp = stat_ktp;
  }
  public String getStat_kk() {
    return stat_kk;
  }
  public void setStat_kk(String stat_kk) {
    this.stat_kk = stat_kk;
  }
  public String getStat_lahir() {
    return stat_lahir;
  }
  public void setStat_lahir(String stat_lahir) {
    this.stat_lahir = stat_lahir;
  }
  public String getStat_kawin() {
    return stat_kawin;
  }
  public void setStat_kawin(String stat_kawin) {
    this.stat_kawin = stat_kawin;
  }
  public String getStat_cerai() {
    return stat_cerai;
  }
  public void setStat_cerai(String stat_cerai) {
    this.stat_cerai = stat_cerai;
  }
  public String getStat_mati() {
    return stat_mati;
  }
  public void setStat_mati(String stat_mati) {
    this.stat_mati = stat_mati;
  }
  public String getStat_png() {
    return stat_png;
  }
  public void setStat_png(String stat_png) {
    this.stat_png = stat_png;
  }
  public String getNk_max() {
    return nk_max;
  }
  public void setNk_max(String nk_max) {
    this.nk_max = nk_max;
  }

}