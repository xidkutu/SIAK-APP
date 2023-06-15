package biodata;

import java.io.*;

public class BiodataWNIObject implements Serializable
{
  private String no_kk, nik, nama_lgkp, jenis_klmin, alamat;

  private String tmpt_lhr, tgl_lhr, gol_drh, agama, pddk_akh, jenis_pkrjn, pnydng_cct, stat_kwn
      , stat_hbkel, nik_ibu, nama_lgkp_ibu, nik_ayah, nama_lgkp_ayah, tmpt_sbl, no_paspor
      , tgl_akh_paspor, no_akta_lhr, no_akta_kwn, tgl_kwn, no_akta_cerai, tgl_cerai, systgl;
  private String no_rt="",no_rw="",dusun="",kode_pos="",telp="",nama_prop="",nama_kab="",nama_kec="",nama_kel="";
  private String printed, changed;
  private boolean found;

  public BiodataWNIObject(boolean found)
  {
    this.found = found;
  }

  public BiodataWNIObject(String no_kk, String nik)
  {
    this.no_kk = no_kk;
    this.nik = nik;
  }

  public BiodataWNIObject(String no_kk, String nik, String nama_lgkp,
                          String jenis_klmin, String alamat
                          , String printed, String changed, boolean found)
  {
    this.no_kk = no_kk;
    this.nik = nik;
    this.nama_lgkp = nama_lgkp;
    this.jenis_klmin=jenis_klmin;
    this.alamat = alamat;
    this.found = found;
    this.printed = printed;
    this.changed = changed;
    this.found = found;
  }
  public BiodataWNIObject(String no_kk, String nik, String nama_lgkp,
                          String jenis_klmin, String alamat
                          , String printed, String changed)
  {
    this.no_kk = no_kk;
    this.nik = nik;
    this.nama_lgkp = nama_lgkp;
    this.jenis_klmin=jenis_klmin;
    this.alamat = alamat;
    this.found = found;
    this.printed = printed;
    this.changed = changed;
  }

  public BiodataWNIObject( String nik,String nama_lgkp,String tmpt_lhr,String tgl_lhr,
                           String jenis_klmin,String gol_drh,String agama,
                           String pddk_akh,String jenis_pkrjn,String pnydng_cct,String stat_kwn,
                           String stat_hbkel,String nik_ibu,
                           String nama_lgkp_ibu,String nik_ayah,String nama_lgkp_ayah,String tmpt_sbl,
                           String alamat,String no_rt,String no_rw,String dusun,String kode_pos,String telp,
                           String nama_prop,String nama_kab,String nama_kec,String nama_kel,String no_kk,
                           String no_paspor,String tgl_akh_paspor,String no_akta_lhr,String no_akta_kwn,String tgl_kwn,
                           String no_akta_cerai,String tgl_cerai,String systgl)
  {
    this.no_kk=(no_kk==null)?"-":no_kk;
    this.nik=(nik==null)?"-":nik;
    this.nama_lgkp=(nama_lgkp==null)?"-":nama_lgkp;
    this.jenis_klmin=(jenis_klmin==null)?"-":jenis_klmin;
    this.alamat=(alamat==null)?"-":alamat;
    this.no_rt=no_rt;
    this.no_rw=no_rw;
    this.dusun=dusun;
    this.kode_pos=kode_pos;
    this.telp=telp;
    this.nama_prop=nama_prop;
    this.nama_kab=nama_kab;
    this.nama_kec=nama_kec;
    this.nama_kel=nama_kel;
    this.tmpt_lhr=(tmpt_lhr==null)?"-":tmpt_lhr;
    this.tgl_lhr=(tgl_lhr==null)?"-":tgl_lhr;
    this.gol_drh=(gol_drh==null)?"-":gol_drh;
    this.agama=(agama==null)?"-":agama;
    this.pddk_akh=(pddk_akh==null)?"-":pddk_akh;
    this.jenis_pkrjn=(jenis_pkrjn==null)?"-":jenis_pkrjn;
    this.pnydng_cct=(pnydng_cct==null)?"-":pnydng_cct;
    this.stat_kwn=(stat_kwn==null)?"-":stat_kwn;
    this.stat_hbkel=(stat_hbkel==null)?"-":stat_hbkel;
    this.nik_ibu=(nik_ibu==null)?"-":nik_ibu;

    this.nama_lgkp_ibu=(nama_lgkp_ibu==null)?"-":nama_lgkp_ibu;
    if(nama_lgkp_ibu!=null && nama_lgkp_ibu.equalsIgnoreCase("")) nama_lgkp_ibu="-";

    this.nik_ayah=(nik_ayah==null)?"-":nik_ayah;
    this.nama_lgkp_ayah=(nama_lgkp_ayah==null)?"-":nama_lgkp_ayah;
    this.tmpt_sbl=(tmpt_sbl==null)?"-":tmpt_sbl;

    this.no_paspor=(no_paspor==null)?"-":no_paspor;
    this.tgl_akh_paspor=(tgl_akh_paspor==null)?"-":tgl_akh_paspor;
    this.no_akta_lhr=(no_akta_lhr==null)?"-":no_akta_lhr;
    this.no_akta_kwn=(no_akta_kwn==null)?"-":no_akta_kwn;
    this.tgl_kwn=(tgl_kwn==null)?"-":tgl_kwn;
    this.no_akta_cerai=(no_akta_cerai==null)?"-":no_akta_cerai;
    this.tgl_cerai=(tgl_cerai==null)?"-":tgl_cerai;

    this.systgl=(systgl==null)?"-":systgl;
  }

  public void setFound(boolean found)
  {
    this.found = found;
  }
  public boolean getFound()
  {
    return found;
  }
  public void setNo_kk(String no_kk)
  {
    if(no_kk==null) no_kk="-";
    this.no_kk = no_kk;
  }
  public String getNo_kk()
  {
    return no_kk;
  }
  public void setNik(String nik)
  {
    if(nik==null) nik="-";
    this.nik = nik;
  }
  public String getNik()
  {
    return nik;
  }
  public void setNama_lgkp(String nama_lgkp)
  {
    if(nama_lgkp==null) nama_lgkp="-";
    this.nama_lgkp = nama_lgkp;
  }
  public String getNama_lgkp()
  {
    return nama_lgkp;
  }

  public void setJenis_klmin(String jenis_klmin)
  {
    if(jenis_klmin==null) jenis_klmin="-";
    this.jenis_klmin = jenis_klmin;
  }
  public String getJenis_klmin()
  {
    return jenis_klmin;
  }
  public void setAlamat(String alamat)
  {
    this.alamat = alamat;
  }
  public String getAlamat()
  {
    return alamat;
  }

  public void setNoRt(String no_rt)
{
   this.no_rt=no_rt;
}
public String getNoRt()
{
  return no_rt;
}

public void setNoRw(String no_rw)
{
 this.no_rw=no_rw;
}
public String getNoRw()
{
return no_rw;
}

  public void setDusun(String dusun)
  {
   this.dusun=dusun;
  }
  public String getDusun()
  {
  return dusun;
  }

  public void setKodepos(String kode_pos)
  {
   this.kode_pos=kode_pos;
  }
  public String getKodepos()
  {
  return kode_pos;
  }

  public void setTelp(String telp)
  {
   this.telp=telp;
  }
  public String getTelp()
  {
  return telp;
  }


  public void setNamaProp(String nama_prop)
  {
   this.nama_prop=nama_prop;
  }
  public String getNamaProp()
  {
  return nama_prop;
  }

  public void setNamaKab(String nama_kab)
  {
   this.nama_kab=nama_kab;
  }
  public String getNamaKab()
  {
  return nama_kab;
  }

  public void setNamaKec(String nama_kec)
  {
   this.nama_kec=nama_kec;
  }

  public String getNamaKec()
  {
  return nama_kec;
  }


  public void setNamaKel(String nama_kel)
  {
   this.nama_kel=nama_kel;
  }

  public String getNamaKel()
  {
  return nama_kel;
  }

  public void setTmpt_lhr(String tmpt_lhr)
  {
    if(tmpt_lhr==null) tmpt_lhr="-";
    this.tmpt_lhr = tmpt_lhr;
  }
  public String getTmpt_lhr()
  {
    return tmpt_lhr;
  }

  public void setStat_kwn(String stat_kwn)
  {
    if(stat_kwn==null) stat_kwn="-";
    this.stat_kwn = stat_kwn;
  }
  public String getStat_kwn()
  {
    return stat_kwn;
  }

  public void setStat_hbkel(String stat_hbkel)
  {
    if(stat_hbkel==null) stat_hbkel="-";
    this.stat_hbkel = stat_hbkel;
  }

  public String getStat_hbkel()
  {
    return stat_hbkel;
  }
  public void setNo_paspor(String no_paspor)
  {
    if(no_paspor==null) no_paspor="-";
    this.no_paspor = no_paspor;
  }
  public String getNo_paspor()
  {
    return no_paspor;
  }
  public void setJenis_pkrjn(String jenis_pkrjn)
  {
    if(jenis_pkrjn==null) jenis_pkrjn="-";
    this.jenis_pkrjn = jenis_pkrjn;
  }
  public String getJenis_pkrjn()
  {
    return jenis_pkrjn;
  }

  public void setPddk_akh(String pddk_akh)
  {
    if(pddk_akh==null) pddk_akh="-";
    this.pddk_akh = pddk_akh;
  }
  public String getPddk_akh()
  {
    return pddk_akh;
  }

  public void setAgama(String agama)
  {
    if(agama==null) agama="-";
    this.agama = agama;
  }
  public String getAgama()
  {
    return agama;
  }

  public void setTgl_lhr(String tgl_lhr)
  {
    if(tgl_lhr==null) tgl_lhr="-";
    this.tgl_lhr = tgl_lhr;
  }
  public String getTgl_lhr()
  {
    return tgl_lhr;
  }

  public void setNama_lgkp_ibu(String nama_lgkp_ibu)
  {
    if(nama_lgkp_ibu==null || nama_lgkp_ibu.equalsIgnoreCase("")) nama_lgkp_ibu="-";
    this.nama_lgkp_ibu = nama_lgkp_ibu;
  }
  public String getNama_lgkp_ibu()
  {
    return nama_lgkp_ibu;
  }

  public void setNama_lgkp_ayah(String nama_lgkp_ayah)
  {
    if(nama_lgkp_ayah==null) nama_lgkp_ayah="-";
    this.nama_lgkp_ayah = nama_lgkp_ayah;
  }
  public String getNama_lgkp_ayah()
  {
    return nama_lgkp_ayah;
  }
  public void setTgl_akh_paspor(String tgl_akh_paspor)
  {
    if(tgl_akh_paspor==null) tgl_akh_paspor="-";
    this.tgl_akh_paspor = tgl_akh_paspor;
  }
  public String getTgl_akh_paspor()
  {
    return tgl_akh_paspor;
  }
  public void setGol_drh(String gol_drh)
  {
    if(gol_drh==null) gol_drh="-";
    this.gol_drh = gol_drh;
  }
  public String getGol_drh()
  {
    return gol_drh;
  }

  public void setNik_ibu(String nik_ibu)
  {
    if(nik_ibu==null) nik_ibu="-";
    this.nik_ibu = nik_ibu;
  }
  public String getNik_ibu()
  {
    return nik_ibu;
  }

  public void setNik_ayah(String nik_ayah)
  {
    if(nik_ayah==null) nik_ayah="-";
    this.nik_ayah = nik_ayah;
  }
  public String getNik_ayah()
  {
    return nik_ayah;
  }

  public void setTmpt_sbl(String tmpt_sbl)
  {
    if(tmpt_sbl==null) tmpt_sbl="-";
    this.tmpt_sbl = tmpt_sbl;
  }
  public String getTmpt_sbl()
  {
    return tmpt_sbl;
  }

  public void setSystgl(String systgl)
  {
    if(systgl==null) systgl="-";
    this.systgl = systgl;
  }
  public String getSystgl()
  {
    return systgl;
  }
  public void no_akta_lhr(String no_akta_lhr)
  {
    if(no_akta_lhr==null) no_akta_lhr="-";
    this.no_akta_lhr = no_akta_lhr;
  }
  public String getNo_akta_lhr()
  {
    return no_akta_lhr;
  }

  public void no_akta_kwn(String no_akta_kwn)
  {
    if(no_akta_kwn==null) no_akta_kwn="-";
    this.no_akta_kwn = no_akta_kwn;
  }
  public String getNo_akta_kwn()
  {
    return no_akta_kwn;
  }

  public void no_akta_cerai(String no_akta_cerai)
  {
    if(no_akta_cerai==null) no_akta_cerai="-";
    this.no_akta_cerai = no_akta_cerai;
  }
  public String getNo_akta_cerai()
  {
    return no_akta_cerai;
  }

  public void setTgl_kwn(String tgl_kwn)
  {
    if(tgl_kwn==null) tgl_kwn="-";
    this.tgl_kwn = tgl_kwn;
  }
  public String getTgl_kwn()
  {
    return tgl_kwn;
  }

  public void setTgl_cerai(String tgl_cerai)
  {
    if(tgl_cerai==null) tgl_cerai="-";
    this.tgl_cerai = tgl_cerai;
  }
  public String getTgl_cerai()
  {
    return tgl_cerai;
  }
  public void setPnydng_cct(String pnydng_cct)
  {
    if(pnydng_cct==null) pnydng_cct="-";
    this.pnydng_cct = pnydng_cct;
  }
  public String getPnydng_cct()
  {
    return pnydng_cct;
  }
}
