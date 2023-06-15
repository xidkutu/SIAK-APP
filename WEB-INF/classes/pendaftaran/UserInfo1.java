package pendaftaran;

import java.io.*;
import java.util.Date;

public class UserInfo1 implements Serializable
{
  public String user_id,password,level_id,division,no_prop,no_kab,no_kec,
      module_code,user_status,nama_prop,nama_kab,nama_kec,mod_ref_file,
      kab_jabatan,kab_nama_pej,kab_nip_pej,kec_jabatan,kec_nama_pej,kec_nip_pej,
      nama_petugas,nip_petugas,jenis_klmin_petugas,auth_key,
      daily_pin,today,now;
String stat_pndtng_kab="",stat_pndtng_kec="";
  Date tgl_lhr_petugas;

  public UserInfo1(String user_id,
                   String password,
                   String level_id,
                   String division,
                   String no_prop,
                   String no_kab,
                   String no_kec,
                   String module_code,
                   String user_status,
                   String nama_prop,
                   String nama_kab,
                   String nama_kec,
                   String mod_ref_file,
                   String kab_jabatan,
                   String kab_nama_pej,
                   String kab_nip_pej,
                   String kec_jabatan,
                   String kec_nama_pej,
                   String kec_nip_pej,
                   String nama_petugas,
                   String nip_petugas,
                   java.util.Date tgl_lhr_petugas,
                   String jenis_klmin_petugas,
                   String auth_key,
                   String daily_pin,
                   String today,
                   String now)
  {
    this.user_id=user_id;
    this.password=password;
    this.level_id=level_id;
    this.division=(division == null || division == "")?null:division;
    this.no_prop=(no_prop==null || no_prop=="")?"":no_prop;
    this.no_kab=(no_kab==null || no_kab=="")?"":no_kab;
    this.no_kec=(no_kec==null || no_kec=="")?"":no_kec;
    this.module_code=module_code;
    this.user_status=user_status;
    this.nama_prop=(nama_prop==null || nama_prop=="")?"":nama_prop;
    this.nama_kab=(nama_kab==null || nama_kab=="")?"":nama_kab;
    this.nama_kec=(nama_kec==null || nama_kec=="")?"":nama_kec;
    this.mod_ref_file=mod_ref_file;
    this.kab_jabatan=(kab_jabatan==null || kab_jabatan=="")?"":kab_jabatan;
    this.kab_nama_pej=(kab_nama_pej==null || kab_nama_pej=="")?"":kab_nama_pej;
    this.kab_nip_pej=(kab_nip_pej==null || kab_nip_pej=="")?"":kab_nip_pej;
    this.kec_jabatan=(kec_jabatan==null || kec_jabatan=="")?"":kec_jabatan;
    this.kec_nama_pej=(kec_nama_pej==null || kec_nama_pej=="")?"":kec_nama_pej;
    this.kec_nip_pej=(kec_nip_pej==null || kec_nip_pej=="")?"":kec_nip_pej;
    this.nama_petugas=(nama_petugas==null || nama_petugas=="")?"":nama_petugas;
    this.nip_petugas=(nip_petugas==null || nip_petugas=="")?"":nip_petugas;
    this.tgl_lhr_petugas=(tgl_lhr_petugas==null )? new Date():tgl_lhr_petugas;
    this.jenis_klmin_petugas=(jenis_klmin_petugas==null || jenis_klmin_petugas=="")?"":jenis_klmin_petugas;
    this.auth_key=(auth_key != null)?auth_key:"";
    this.daily_pin=daily_pin;
    this.today=today;
    this.now=now;
  }



  public UserInfo1(String user_id,
                   String password,
                   String level_id,
                   String division,
                   String no_prop,
                   String no_kab,
                   String no_kec,
                   String module_code,
                   String user_status,
                   String nama_prop,
                   String nama_kab,
                   String nama_kec,
                   String mod_ref_file,
                   String kab_jabatan,
                   String kab_nama_pej,
                   String kab_nip_pej,
                   String kec_jabatan,
                   String kec_nama_pej,
                   String kec_nip_pej,
                   String nama_petugas,
                   String nip_petugas,
                   java.util.Date tgl_lhr_petugas,
                   String jenis_klmin_petugas,
                   String auth_key,
                   String daily_pin,
                   String today,
                   String now,String stat_pndtng_kab,String stat_pndtng_kec)
  {
    this.user_id=user_id;
    this.password=password;
    this.level_id=level_id;
    this.division=(division == null || division == "")?null:division;
    this.no_prop=(no_prop==null || no_prop=="")?"":no_prop;
    this.no_kab=(no_kab==null || no_kab=="")?"":no_kab;
    this.no_kec=(no_kec==null || no_kec=="")?"":no_kec;
    this.module_code=module_code;
    this.user_status=user_status;
    this.nama_prop=(nama_prop==null || nama_prop=="")?"":nama_prop;
    this.nama_kab=(nama_kab==null || nama_kab=="")?"":nama_kab;
    this.nama_kec=(nama_kec==null || nama_kec=="")?"":nama_kec;
    this.mod_ref_file=mod_ref_file;
    this.kab_jabatan=(kab_jabatan==null || kab_jabatan=="")?"":kab_jabatan;
    this.kab_nama_pej=(kab_nama_pej==null || kab_nama_pej=="")?"":kab_nama_pej;
    this.kab_nip_pej=(kab_nip_pej==null || kab_nip_pej=="")?"":kab_nip_pej;
    this.kec_jabatan=(kec_jabatan==null || kec_jabatan=="")?"":kec_jabatan;
    this.kec_nama_pej=(kec_nama_pej==null || kec_nama_pej=="")?"":kec_nama_pej;
    this.kec_nip_pej=(kec_nip_pej==null || kec_nip_pej=="")?"":kec_nip_pej;
    this.nama_petugas=(nama_petugas==null || nama_petugas=="")?"":nama_petugas;
    this.nip_petugas=(nip_petugas==null || nip_petugas=="")?"":nip_petugas;
    this.tgl_lhr_petugas=(tgl_lhr_petugas==null )? new Date():tgl_lhr_petugas;
    this.jenis_klmin_petugas=(jenis_klmin_petugas==null || jenis_klmin_petugas=="")?"":jenis_klmin_petugas;
    this.auth_key=(auth_key != null)?auth_key:"";
    this.daily_pin=daily_pin;
    this.today=today;
    this.now=now;
    this.stat_pndtng_kab=stat_pndtng_kab;
    this.stat_pndtng_kec=stat_pndtng_kec;
}

  // Get Methods

public String getStatpndtngkab()
  {
    return stat_pndtng_kab;
  }
  public void setStatpndtngkab()
  {
    this.stat_pndtng_kab=stat_pndtng_kab;
  }

  public String getStatpndtngkec()
    {
      return stat_pndtng_kec;
    }

    public void setStatpndtngkec()
    {
      this.stat_pndtng_kec=stat_pndtng_kec;
    }

public void setPin(String pin)
    {
     this.daily_pin=pin;
    }
public void setAuth_key(String key)
    {
      this.auth_key=key;
    }

public String getUserId()
    {
     return user_id;
    }
    public String getPassword()
    {
      return password;
    }
    public String getLevelId()
    {
      return level_id;
    }
    public String getDivision()
    {
      return division;
    }
    public String getNoProp()
    {
      return no_prop;
    }
    public String getNoKab()
    {
      return no_kab;
    }
    public String getNoKec()
    {
      return no_kec;
    }

    public String getModuleCode()
    {
      return module_code;
    }
    public String getUserStatus()
    {
      return user_status;
    }

    public String getNamaProp()
    {
      return nama_prop;
    }

    public String getNamaKab()
    {
      return nama_kab;
    }
    public String getNamaKec()
    {
      return nama_kec;
    }
    public String getModRefFile()
    {
       return mod_ref_file;
    }
    public String getKabJabatan()
    {
       return kab_jabatan;
    }
    public String getKabNamaPej()
    {
       return kab_nama_pej;
    }
    public String getKabNipPej()
    {
       return kab_nip_pej;
    }
    public String getKecJabata()
    {
       return kec_jabatan;
    }

    public String getKecNamaPej()
    {
       return kec_nama_pej;
    }
    public String getKecNipPej()
    {
       return kec_nip_pej;
    }
    public String getNamaPetugas()
    {
      System.out.println("Get Nama = " + nama_petugas);
       return nama_petugas;
    }
    public String getNipPetugas()
    {
            System.out.println("Get Nip = " + nip_petugas);
       return nip_petugas;
    }
    public Date getTglLhrPetugas()
    {
       return tgl_lhr_petugas;
    }
    public String getJenisKlminPetugas()
    {
       return jenis_klmin_petugas;
    }
    public String getAuthKey()
    {
       return auth_key;
    }
    public String getDailyPin()
    {
       return daily_pin;
    }
    public String getToday()
    {
       return today;
    }
    public String getNow()
    {
       return now;
    }
}
