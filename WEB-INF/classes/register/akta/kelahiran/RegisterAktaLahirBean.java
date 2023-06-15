package register.akta.kelahiran;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import register.akta.kelahiran.RegisterKelahiranObject;
import oracle.jdbc.driver.*;

import siaktools.logwriter.SiakWriter;

public class RegisterAktaLahirBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  private String no_akta_lahir_bayi, dsrhk_cttlhr, persyaratan_bayi, hari_ini_day, hari_ini_dd,
      hari_ini_mm, hari_ini_yy, nama_pelpor, umur_pelpor,
      pekerjaan_pelpor, alamat_pelpor, rt_pelpor, rw_pelpor, kel_pelpor, kec_pelpor, kab_pelpor, prop_pelpor,
      tmpt_lahir_bayi, tgl_lhr_day_bayi, tgl_lhr_string_dd_bayi, tgl_lhr_string_mm_bayi,
      tgl_lhr_string_yy_bayi, pukul_lhr_bayi, nama_lgkp_bayi, anak_ke_lahir_bayi, jenis_kelamin_bayi,
      nama_ayah, umur_ayah, pekerjaan_ayah, alamat_ayah, rt_ayah,
      rw_ayah, kel_ayah, kec_ayah, kab_ayah, prop_ayah, nama_ibu, umur_ibu, pekerjaan_ibu, alamat_ibu, rt_ibu, rw_ibu, kel_ibu, kec_ibu, kab_ibu,
      prop_ibu, nama_saksi1, umur_saksi1, pekerjaan_saksi1,
      alamat_saksi1, rt_saksi1, rw_saksi1, kel_saksi1, kec_saksi1, kab_saksi1, prop_saksi1, nama_saksi2,
      umur_saksi2, pekerjaan_saksi2, alamat_saksi2, rt_saksi2,
      rw_saksi2, kel_saksi2, kec_saksi2, kab_saksi2, prop_saksi2;

  private String nama_prop,nama_kab, kwrngrn_bayi, tgl_cetak_akta;

  public Vector getPersyaratanLahir(String no_persyaratan) throws RemoteException
  {
    StringTokenizer st = new StringTokenizer(no_persyaratan, ",");
    String token = "";

    Vector vPersyaratan = new Vector();
    if(vPersyaratan.size()>0) vPersyaratan.removeAllElements();

    Hashtable hPersyaratan = new Hashtable();
        hPersyaratan.put( new Integer(1),"Copy KTP dan KK Orang Tua" );
    hPersyaratan.put( new Integer(2), "Surat Keterangan Lahir dari RS/Dokter/Bidan" );
        hPersyaratan.put( new Integer(3),"Akta Kawin Orang Tua" );
    hPersyaratan.put( new Integer(4),"Keterangan Lahir dari kelurahan" );
       hPersyaratan.put( new Integer(5),"Passport Orang Tua" );
    hPersyaratan.put( new Integer(6),"Surat Kewarganegaraan Orang Tua" );

    int number = 0;

    while(st.hasMoreTokens())
    {
        token = st.nextToken();
        number = Integer.parseInt(token);

        vPersyaratan.addElement(hPersyaratan.get( new Integer(token) ).toString());
    }

    return vPersyaratan;
  }
  public Vector retrieveData(Vector vNik, String nama_prop, String nama_kab) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    //Statement stmt = null;
    //String query = "";
    CallableStatement stmt = null;
    try
    {
      conn = connectorDb.getConnection();

      this.nama_prop = nama_prop;
      this.nama_kab = nama_kab;

      for (int i = 0; i < vNik.size(); i++)
      {
        String query = "begin ? := get_akta_lhr(?); end;";

        stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
        stmt.setString(2, vNik.elementAt(i).toString().trim());

// execute and retrieve the result set
        stmt.execute();
        rs = (ResultSet)stmt.getObject(1);
        RegisterKelahiranObject obj = null;

// print the results

        while (rs.next())
        {
          no_akta_lahir_bayi = rs.getString("NO_AKTA_LAHIR_BAYI");
          dsrhk_cttlhr = rs.getString("DSRHK_CTTLHR");
          persyaratan_bayi = rs.getString("PERSYARATAN_BAYI");
          hari_ini_day = rs.getString("HARI_INI_DAY");
          hari_ini_dd = rs.getString("HARI_INI_DD");
          hari_ini_mm = rs.getString("HARI_INI_MM");
          hari_ini_yy = rs.getString("HARI_INI_YY");
          nama_pelpor = rs.getString("NAMA_PELPOR");
          umur_pelpor = rs.getString("UMUR_PELPOR");
          pekerjaan_pelpor = rs.getString("PEKERJAAN_PELPOR");
          alamat_pelpor = rs.getString("ALAMAT_PELPOR");
          rt_pelpor = rs.getString("RT_PELPOR");
          rw_pelpor = rs.getString("RW_PERLPOR");
          kel_pelpor = rs.getString("KEL_PELPOR");
          kec_pelpor = rs.getString("KEC_PELPOR");
          kab_pelpor = rs.getString("KAB_PELPOR");
          prop_pelpor = rs.getString("PROP_PELPOR");
          tmpt_lahir_bayi = rs.getString("TMPT_LAHIR_BAYI");
          tgl_lhr_day_bayi = rs.getString("TGL_LHR_DAY_BAYI");
          tgl_lhr_string_dd_bayi = rs.getString("TGL_LHR_STRING_DD_BAYI");
          tgl_lhr_string_mm_bayi = rs.getString("TGL_LHR_STRING_MM_BAYI");
          tgl_lhr_string_yy_bayi = rs.getString("TGL_LHR_STRING_YY_BAYI");
          pukul_lhr_bayi = rs.getString("PUKUL_LHR_BAYI");
          nama_lgkp_bayi = rs.getString("NAMA_LGKP_BAYI");
          anak_ke_lahir_bayi = rs.getString("ANAK_KE_LAHIR_BAYI");
          jenis_kelamin_bayi = rs.getString("JENIS_KELAMIN_BAYI");

          nama_ayah = rs.getString("NAMA_AYAH");
          umur_ayah = rs.getString("UMUR_AYAH");
          pekerjaan_ayah = rs.getString("PEKERJAAN_AYAH");
          alamat_ayah = rs.getString("ALAMAT_AYAH");
          rt_ayah = rs.getString("RT_AYAH");
          rw_ayah = rs.getString("RW_AYAH");
          kel_ayah = rs.getString("KEL_AYAH");
          kec_ayah = rs.getString("KEC_AYAH");
          kab_ayah = rs.getString("KAB_AYAH");
          prop_ayah = rs.getString("PROP_AYAH");

          nama_ibu = rs.getString("NAMA_IBU");
          umur_ibu = rs.getString("UMUR_IBU");
          pekerjaan_ibu = rs.getString("PEKERJAAN_IBU");
          alamat_ibu = rs.getString("ALAMAT_IBU");
          rt_ibu = rs.getString("RT_IBU");
          rw_ibu = rs.getString("RW_IBU");
          kel_ibu = rs.getString("KEL_IBU");
          kec_ibu = rs.getString("KEC_IBU");
          kab_ibu = rs.getString("KAB_IBU");
          prop_ibu = rs.getString("PROP_IBU");

          nama_saksi1 = rs.getString("NAMA_SAKSI1");
          umur_saksi1 = rs.getString("UMUR_SAKSI1");
          pekerjaan_saksi1 = rs.getString("PEKERJAAN_SAKSI1");
          alamat_saksi1 = rs.getString("ALAMAT_SAKSI1");
          rt_saksi1 = rs.getString("RT_SAKSI1");
          rw_saksi1 = rs.getString("RW_SAKSI1");
          kel_saksi1 = rs.getString("KEL_SAKSI1");
          kec_saksi1 = rs.getString("KEC_SAKSI1");
          kab_saksi1 = rs.getString("KAB_SAKSI1");
          prop_saksi1 = rs.getString("PROP_SAKSI1");

          nama_saksi2 = rs.getString("NAMA_SAKSI2");
          umur_saksi2 = rs.getString("UMUR_SAKSI2");
          pekerjaan_saksi2 = rs.getString("PEKERJAAN_SAKSI2");
          alamat_saksi2 = rs.getString("ALAMAT_SAKSI2");
          rt_saksi2 = rs.getString("RT_SAKSI2");
          rw_saksi2 = rs.getString("RW_SAKSI2");
          kel_saksi2 = rs.getString("KEL_SAKSI2");
          kec_saksi2 = rs.getString("KEC_SAKSI2");
          kab_saksi2 = rs.getString("KAB_SAKSI2");
          prop_saksi2 = rs.getString("PROP_SAKSI2");
          kwrngrn_bayi = rs.getString("KWRNGRN_BAYI");
          tgl_cetak_akta = rs.getString("TGL_CETAK_AKTA");
          obj = new RegisterKelahiranObject( no_akta_lahir_bayi, vNik.elementAt(i).toString().trim(), dsrhk_cttlhr,
                                  persyaratan_bayi, hari_ini_day, hari_ini_dd,
                                  hari_ini_mm, hari_ini_yy,
                                  nama_pelpor, umur_pelpor,
                                  pekerjaan_pelpor, alamat_pelpor,
                                  rt_pelpor, rw_pelpor, kel_pelpor,
                                  kec_pelpor, kab_pelpor,
                                  prop_pelpor, tmpt_lahir_bayi,
                                  tgl_lhr_day_bayi,
                                  tgl_lhr_string_dd_bayi,
                                  tgl_lhr_string_mm_bayi,
                                  tgl_lhr_string_yy_bayi,
                                  pukul_lhr_bayi, nama_lgkp_bayi,
                                  anak_ke_lahir_bayi,
                                  jenis_kelamin_bayi, nama_ayah, umur_ayah,
                                  pekerjaan_ayah, alamat_ayah,
                                  rt_ayah, rw_ayah, kel_ayah,
                                  kec_ayah, kab_ayah, prop_ayah,
                                  nama_ibu, umur_ibu,
                                  pekerjaan_ibu, alamat_ibu, rt_ibu,
                                  rw_ibu, kel_ibu, kec_ibu,
                                  kab_ibu, prop_ibu, nama_saksi1,umur_saksi1,
                                  pekerjaan_saksi1, alamat_saksi1,
                                  rt_saksi1,
                                  rw_saksi1, kel_saksi1, kec_saksi1,
                                  kab_saksi1, prop_saksi1,
                                  nama_saksi2, umur_saksi2,
                                  pekerjaan_saksi2, alamat_saksi2,
                                  rt_saksi2,
                                  rw_saksi2, kel_saksi2, kec_saksi2,
                                  kab_saksi2, prop_saksi2, kwrngrn_bayi, tgl_cetak_akta);

          vData.addElement(obj);
        }
        if (rs != null)
          rs.close();

        stmt.close();
      }
      conn.close();
    }
    catch (Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }

    finally
    {
      try {
        if (rs != null)
          rs.close();
        if (stmt != null)
          stmt.close();
      }
      catch (Exception e)
      {
        siakWriter.writeFile(e);
      }
      try {
        if (conn != null)
          conn.close();
      }
      catch (Exception e)
      {
        siakWriter.writeFile(e);
      }
    }
return vData;
  }
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, this.getClass().getName());
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

    /**@todo Complete this method*/
  }
  public void ejbRemove() {
    /**@todo Complete this method*/
  }
  public void ejbActivate() {
    /**@todo Complete this method*/
  }
  public void ejbPassivate() {
    /**@todo Complete this method*/
  }
  public void setSessionContext(SessionContext sessionContext) {
    this.sessionContext = sessionContext;
  }
}