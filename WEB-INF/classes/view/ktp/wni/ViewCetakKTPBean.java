package view.ktp.wni;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import ktp.wni.*;

import siaktools.logwriter.SiakWriter;

public class ViewCetakKTPBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  private String nama="", tmpt_lhr="", tgl_lhr="",
      jenis_klmin="", gol_drh="", alamat="", no_rt="",
      no_rw="", nama_kel="", nama_kec="", nama_kab="",
      agama="", jenis_pkrjn="", stat_kwn="", tgl_berlaku="",
      systgl="", nip_pej="", nama_pej="";

  private String nama_prop="", kewarganegaraan="";

  public Vector retrieveData(Vector vNik, String nama_prop, String nama_kab,
                        String nama_kec, String nama_kel,
                        String type) throws RemoteException

  {
    String no_paspor="",no_dok="",tgl_akh_dok="";
    Vector vData=new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs=null ;
    Statement stmt = null;
    String query = "";
    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      this.nama_prop = nama_prop;
      this.nama_kab = nama_kab;

      if(type.trim().equalsIgnoreCase("WNI"))
      {
        this.nama_kec = nama_kec;
        this.nama_kel = nama_kel;
      }
      KTPWniObject ktpObj = null;

      for(int i=0;i<vNik.size();i++)
      {
        if(type.trim().equalsIgnoreCase("WNI"))
        {
          /* query = "SELECT * FROM VW_KTP_WNI WHERE NIK=" +
              ( (KTPWniObject) vNik.elementAt(i)).getNik().trim(); */
          query=" SELECT /*+ INDEX (b IDXALAMATKK) */";
    query=query+"   a.nik, GETGELAR(a.nik) nama_lgkp, UPPER (a.tmpt_lhr) tmpt_lhr,";
    query=query+"   TO_CHAR (a.tgl_lhr, 'dd-mm-yyyy') tgl_lhr,";
    query=query+"      DECODE (a.jenis_klmin, 1, 'LAKI-LAKI', 2, 'PEREMPUAN') jenis_klmin,";
    query=query+"      DECODE (a.gol_drh,";
    query=query+"              1, 'A',";
    query=query+"              2, 'B',";
    query=query+"              3, 'AB',";
    query=query+"              4, 'O',";
    query=query+"              5, 'A+',";
    query=query+"              6, 'A',";
    query=query+"              7, 'B+',";
    query=query+"              8, 'B-',";
    query=query+"              9, 'AB+',";
    query=query+"              10, 'AB-',";
    query=query+"              11, 'O+',";
    query=query+"              12, 'O-'";
    query=query+"             ) gol_drh,";
    query=query+"      UPPER (b.alamat) alamat,";
    query=query+"      DECODE (b.no_rt, NULL, '-', 0, '-', TO_CHAR (b.no_rt, '000')) no_rt,";
    query=query+"      DECODE (b.no_rw, NULL, '-', 0, '-', TO_CHAR (b.no_rw, '000')) no_rw,";
    query=query+"      UPPER (a.agama) agama,";
    query=query+"      UPPER (siakoff.getpkrjn (a.jenis_pkrjn)) jenis_pkrjn,";
    query=query+"      DECODE (a.stat_kwn,";
    query=query+"              1, 'BELUM KAWIN',";
    query=query+"              2, 'KAWIN',";
    query=query+"              3, 'CERAI HIDUP',";
    query=query+"              4, 'CERAI MATI'";
    query=query+"             ) stat_kwn,";
    query=query+"      DECODE";
     query=query+"         (GREATEST (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12), 0),";
     query=query+"          LEAST (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12), 59), CONCAT";
     query=query+"                               (TO_CHAR (a.tgl_lhr, 'dd-mm'),";
     query=query+"                                TO_CHAR (ADD_MONTHS (NVL (a.tgl_cetak_ktp,";
     query=query+"                                                          SYSDATE";
     query=query+"                                                         ),";
     query=query+"                                                     60";
    query=query+"                                                     ),";
    query=query+"                                          '-yyyy'";
   query=query+"                                          )";
   query=query+"                                 ),";
   query=query+"            'seumur hidup'";
  query=query+"            ) tgl_berlaku,";
  query=query+"        TO_CHAR (SYSDATE, 'dd-mm-yyyy') systgl";
 query=query+"    FROM biodata_wni a, data_keluarga b";
 query=query+"   WHERE a.nik = " +  ( (KTPWniObject) vNik.elementAt(i)).getNik().trim() + " AND a.no_kk = b.no_kk";

        }
        else
        {
          query = "SELECT * FROM VW_KTP_WNA WHERE NIK='" +
              ( (KTPWniObject) vNik.elementAt(i)).getNik().trim()+"'";
        }
        System.out.println(query);

        rs = stmt.executeQuery(query.trim());
        KTPWniObject obj = null;

          while (rs.next())
          {
            if(type.trim().equalsIgnoreCase("WNI"))
            {
              nama = rs.getString("NAMA_LGKP");
              no_rt = rs.getString("NO_RT");
              no_rw = rs.getString("NO_RW");
              gol_drh = rs.getString("GOL_DRH");
              agama = rs.getString("AGAMA");
              jenis_pkrjn = rs.getString("JENIS_PKRJN");
              stat_kwn = rs.getString("STAT_KWN");
            }
            else
            {
              nama = rs.getString("NAMA_PERTMA");
              kewarganegaraan = rs.getString("KWRNGRN");
              no_rt = rs.getString("NOMOR_RT");
              no_rw = rs.getString("NOMOR_RW");
              nama_kec = rs.getString("NAMA_KEC");
              nama_kel = rs.getString("NAMA_KEL");
              no_paspor=rs.getString("NO_PASPOR");
              no_dok=rs.getString("NO_DOK");
              tgl_akh_dok=rs.getString("TGL_AKH_DOK");
            }
            tmpt_lhr = rs.getString("TMPT_LHR");
            tgl_lhr = rs.getString("TGL_LHR");
            jenis_klmin = rs.getString("JENIS_KLMIN");
            alamat = rs.getString("ALAMAT");

            tgl_berlaku = rs.getString("TGL_BERLAKU");
            systgl = rs.getString("SYSTGL");

            if(type.trim().equalsIgnoreCase("WNI"))
            {
              obj = new KTPWniObject( ( (KTPWniObject) vNik.elementAt(i)).getNik(),
                                     nama, tmpt_lhr, tgl_lhr,
                                     jenis_klmin, gol_drh, alamat, no_rt,
                                     no_rw, nama_kel, nama_kec, nama_kab,
                                     nama_prop,
                                     agama, jenis_pkrjn, stat_kwn, tgl_berlaku,
                                     systgl,
                                     ( (KTPWniObject) vNik.elementAt(i)).getImg_foto(),
                                     "INDONESIA");
            }
            else
            {
              obj = new KTPWniObject(((KTPWniObject) vNik.elementAt(i)).getNik(),
                                     nama, tmpt_lhr, tgl_lhr,kewarganegaraan,
                                     jenis_klmin, no_paspor,no_dok,tgl_akh_dok,alamat, no_rt,
                                     no_rw, tgl_berlaku,systgl,nama_kel, nama_kec, nama_kab,
                                     nama_prop,( (KTPWniObject) vNik.elementAt(i)).getImg_foto(),( (KTPWniObject) vNik.elementAt(i)).getSignature(),"");
            }

            vData.addElement(obj);

          }
          if(rs!=null) rs.close();

      }
      stmt.close();
      conn.close();
    }
    catch(Exception e)
    {
      e.printStackTrace();
      siakWriter.writeFile(e);
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



    public Vector retrieveDataPVC(Vector vNik, String nama_prop, String nama_kab,
                          String nama_kec, String nama_kel,
                          String type) throws RemoteException
    {
      Vector vData=new Vector();
      String no_paspor="",no_dok="",tgl_akh_dok="";
      Connection conn=null;
      ConnectorDB connectorDb = new ConnectorDB();
      ResultSet rs=null ;
      Statement stmt = null;
      String query = "";
      try
      {
        conn = connectorDb.getConnection();
        stmt = conn.createStatement();

        this.nama_prop = nama_prop;
        this.nama_kab = nama_kab;

        if(type.trim().equalsIgnoreCase("WNI"))
        {
          this.nama_kec = nama_kec;
          this.nama_kel = nama_kel;
        }
        KTPWniObject ktpObj = null;

        for(int i=0;i<vNik.size();i++)
        {
          if(type.trim().equalsIgnoreCase("WNI"))
          {
            query = "SELECT * FROM VW_KTP_WNI WHERE NIK=" +
                ( (KTPWniObject) vNik.elementAt(i)).getNik().trim();
          }
          else
          {
            query = "SELECT * FROM VW_KTP_WNA WHERE NIK='" +
                ( (KTPWniObject) vNik.elementAt(i)).getNik().trim()+"'";
          }
          System.out.println(query);

          rs = stmt.executeQuery(query.trim());
          KTPWniPVCObject obj = null;

            while (rs.next())
            {
              if(type.trim().equalsIgnoreCase("WNI"))
              {
                nama = rs.getString("NAMA_LGKP");
                no_rt = rs.getString("NO_RT");
                no_rw = rs.getString("NO_RW");
                gol_drh = rs.getString("GOL_DRH");
                agama = rs.getString("AGAMA");
                jenis_pkrjn = rs.getString("JENIS_PKRJN");
                stat_kwn = rs.getString("STAT_KWN");
              }
              else
              {
                nama = rs.getString("NAMA_PERTMA");
                kewarganegaraan = rs.getString("KWRNGRN");
                no_rt = rs.getString("NOMOR_RT");
                no_rw = rs.getString("NOMOR_RW");
                nama_kec = rs.getString("NAMA_KEC");
                nama_kel = rs.getString("NAMA_KEL");
                no_paspor=rs.getString("NO_PASPOR");
                no_dok=rs.getString("NO_DOK");
                tgl_akh_dok=rs.getString("TGL_AKH_DOK");
              }
              tmpt_lhr = rs.getString("TMPT_LHR");
              tgl_lhr = rs.getString("TGL_LHR");
              jenis_klmin = rs.getString("JENIS_KLMIN");
              alamat = rs.getString("ALAMAT");

              tgl_berlaku = rs.getString("TGL_BERLAKU");
              systgl = rs.getString("SYSTGL");

              if(type.trim().equalsIgnoreCase("WNI"))
              {
                obj = new KTPWniPVCObject( ( (KTPWniPVCObject) vNik.elementAt(i)).getNik(),
                                       nama, tmpt_lhr, tgl_lhr,
                                       jenis_klmin, gol_drh, alamat, no_rt,
                                       no_rw, nama_kel, nama_kec, nama_kab,
                                       nama_prop,
                                       agama, jenis_pkrjn, stat_kwn, tgl_berlaku,
                                       systgl,
                                       ( (KTPWniObject) vNik.elementAt(i)).getImg_foto(),
                                       "INDONESIA");
                obj.setImg_person(((KTPWniPVCObject) vNik.elementAt(i)).getImg_person());
              }
              else
              {
                obj = new KTPWniPVCObject(((KTPWniPVCObject) vNik.elementAt(i)).getNik(),
                                       nama, tmpt_lhr, tgl_lhr,kewarganegaraan,
                                       jenis_klmin, no_paspor,no_dok,tgl_akh_dok,alamat, no_rt,
                                       no_rw, tgl_berlaku,systgl,nama_kel, nama_kec, nama_kab,
                                       nama_prop,( (KTPWniObject) vNik.elementAt(i)).getImg_foto());
                obj.setImg_person(((KTPWniPVCObject) vNik.elementAt(i)).getImg_person());
              }

              vData.addElement(obj);

            }
            if(rs!=null) rs.close();

        }
        stmt.close();
        conn.close();
      }
      catch(Exception e)
      {
        e.printStackTrace();
        siakWriter.writeFile(e);
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
}