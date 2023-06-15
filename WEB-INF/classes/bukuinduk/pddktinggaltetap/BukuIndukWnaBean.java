package bukuinduk.pddktinggaltetap;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.DataKelurahan;
import siaktools.logwriter.SiakWriter;

import jmlpddk.agama.InfoWilayah;
import jmlpddk.agama.ListProp;
import jmlpddk.agama.ListKab;
import jmlpddk.agama.ListKec;
import jmlpddk.agama.ListKel;

public class BukuIndukWnaBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

public Vector getDataBukuIndukPendudukWNA(String no_prop, String no_kab,
                                            String no_kec, String no_kel) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String sql="";
    BukuIndukWnaObject obj = null;
    Vector vData = new Vector();
try
   {
    sql = "SELECT "+
        "TO_CHAR(A.NIK) NIK, "+
        "A.NAMA_PERTMA, "+
        "TO_CHAR(A.NO_KK) NO_KK, "+
        "decode(a.jenis_klmin,1,'Laki-Laki',2,'Perempuan') jenis_klmin, "+
        "A.KWRNGRN, "+
        "A.TMPT_LHR, "+
        "to_char(A.TGL_LHR,'dd/MON/yyyy') TGL_LHR , "+
        "A.NO_PASPOR, "+
        "DECODE(A.DOK_IMGR,2,A.NO_DOK) NO_KITAP, "+
        "A.AGAMA, "+
        "decode(A.Gol_Drh,1,'A',2,'B',3,'AB',4,'O',5,'A+',6,'A-',7,'B+',8,'B-',9,'AB+',10,'AB-',11,'O+',12,'O-') GOL_DRH, "+
        "decode(A.stat_kwn,1,'Married',2,'Single',3,'Divorce',4,'Other') stat_kwn, "+
        "DECODE(A.JENIS_PKRJN,1,'Trading and Industry',2,'Forestry',3,'Mining and Energy', "+
         "4,'Public Work',5,'Farming',6,'Religion',7,'Bank and Financial',8,'Health and Society', "+
         "9,'Tourism',10,'Transportation and Communication',11,'Culture and Education',12,'Others') JENIS_PKRJN," +
          "decode(a.PDDK_AKH,1,'Elementary',2,'Junior High School',3,'Senior High School',4, "+
          "'Diploma',5,'Bachelor',6,'Master',7,'Philosophy of Doctor',8, "+
          "'Others') PDDK_AKH, "+
          "decode(A.STAT_HBKEL,1,'Kepala Keluarga/Head of Family',2,'Suami/Husband',3,'Istri/Wife',4,'Anak/Child',5,'Menantu/Child in Law',6,'Cucu/Grand Child',7,'OrangTua/Parent',8, "+
          "'Mertua/Parent in Law',9,'Famili Lain/Relative',10,'Pembantu/Housemade',11,'Lain/Others') STAT_HBKEL, "+
          "B.ALAMAT "+
          "FROM BIODATA_WNA A , DATA_KELUARGA B "+
          "WHERE A.NO_KK=B.NO_KK "+
          "AND A.NO_PROP=?";
        conn = connectorDb.getConnection();
      if ((no_kab!=null) &&  (no_kab.trim().length()!=0))
      {
        sql=sql + " and a.no_kab=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1,no_prop);
        ps.setString(2,no_kab);
      }

      if ((no_kec!=null) &&  (no_kec.trim().length()!=0))
      {
        sql=sql + " and a.no_kec=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1,no_prop);
        ps.setString(2,no_kab);
        ps.setString(3,no_kec);
      }

       if ((no_kel!=null) &&  (no_kel.trim().length()!=0))
        {
        sql=sql + " and a.no_kel=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1,no_prop);
        ps.setString(2,no_kab);
        ps.setString(3,no_kec);
        ps.setString(4,no_kel);
         }
      rs = ps.executeQuery();
      String nama_pertma="", nik="", no_kk="", alamat="", jenis_klmin="", no_paspor="", no_kitap="", kwrngrn="";
      String tmpt_lhr="", tgl_lhr="", agama="", gol_drh="", stat_kwn="", jenis_pkrjn="", stat_hbkel="", pddk_akh="";

      while(rs.next())
      {
        nama_pertma = rs.getString("NAMA_PERTMA");
        nik = rs.getString("NIK");
        no_kk = rs.getString("NO_KK");
        alamat = rs.getString("ALAMAT");
        jenis_klmin = rs.getString("JENIS_KLMIN");
        kwrngrn = rs.getString("KWRNGRN");
        no_paspor = rs.getString("NO_PASPOR");
        no_kitap = rs.getString("NO_KITAP");
        tmpt_lhr = rs.getString("TMPT_LHR");
        tgl_lhr = rs.getString("TGL_LHR");
        agama = rs.getString("AGAMA");
        gol_drh = rs.getString("GOL_DRH");
        stat_kwn = rs.getString("STAT_KWN");
        jenis_pkrjn = rs.getString("JENIS_PKRJN");
        stat_hbkel = rs.getString("STAT_HBKEL");
        pddk_akh = rs.getString("PDDK_AKH");

        obj = new BukuIndukWnaObject(nama_pertma, nik, no_kk, alamat, jenis_klmin, kwrngrn,
                             no_paspor, no_kitap,  tmpt_lhr, tgl_lhr, agama,
                             gol_drh,  stat_kwn, jenis_pkrjn, stat_hbkel,
                             pddk_akh);
        vData.addElement(obj);
      }

      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      if(conn!=null) conn.close();
    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    finally
    {
      try
      {
        if (rs != null)
          rs.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (ps != null)
          ps.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch(Exception e)
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