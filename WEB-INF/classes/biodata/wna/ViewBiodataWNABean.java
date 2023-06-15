package biodata.wna;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;

import siaktools.logwriter.SiakWriter;

public class ViewBiodataWNABean implements SessionBean
{
  private SessionContext sessionContext;
  private String nama_klrga, nama_pertma, jenis_klmin, tmpt_lhr,tgl_lhr, kwrngrn;
  private String agama, gol_drh, pddk_akh, jenis_pkrjn, stat_kwn, nama_kep, no_kk;
  private String alamat, datng_dari, tujuan_dtng, no_paspor, tgl_paspor, tgl_akh_paspor;
  private String nama_spsor, tipe_spsor, alamat_spsor, no_dok, tmpt_dtbit;
  private String tgl_dtbit, tgl_akh_dok, no_stld,sys_tgl;
  private SiakWriter siakWriter;
  private String no_rt,no_rw,dusun,kodepos,telp,nama_prop,nama_kab,nama_kec,nama_kel;


  public Vector retrieveData(Vector vNik) throws RemoteException
  {
     Vector vData = new Vector();
    Connection conn = null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs=null ;
    PreparedStatement stmt = null;
    String query = "";
    try
    {
      conn = connectorDb.getConnection();
      query = "SELECT * FROM VW_INDIVIDU_WNA WHERE NIK=?";
      stmt = conn.prepareStatement(query);

     for(int i=0;i<vNik.size();i++)
      {
        stmt.setString(1,vNik.elementAt(i).toString().trim());
        rs = stmt.executeQuery();
        BiodataWNAObject obj = null;
          while (rs.next())
          {
            nama_klrga = rs.getString("NAMA_KLRGA");
            nama_pertma = rs.getString("NAMA_PERTMA");
            jenis_klmin = rs.getString("JENIS_KLMIN");
            tmpt_lhr = rs.getString("TMPT_LHR");
            tgl_lhr = rs.getString("TGL_LHR");
            kwrngrn = rs.getString("KWRNGRN");
            agama = rs.getString("AGAMA");
            gol_drh = rs.getString("GOL_DRH");
            pddk_akh = rs.getString("PDDK_AKH");
            jenis_pkrjn = rs.getString("JENIS_PKRJN");
            stat_kwn = rs.getString("STAT_KWN");
            nama_kep = rs.getString("NAMA_KEP");
            no_kk = rs.getString("NO_KK");
            alamat = rs.getString("ALAMAT");
            no_rt=rs.getString("NO_RT");
            no_rw=rs.getString("NO_RW");
            dusun=rs.getString("DUSUN");
            kodepos=rs.getString("KODEPOS");
            telp=rs.getString("TELP");
            nama_prop=rs.getString("nama_prop");
            nama_kab=rs.getString("nama_kab");
            nama_kec=rs.getString("nama_kec");
            nama_kel=rs.getString("nama_kel");
            datng_dari = rs.getString("DATNG_DARI");
            tujuan_dtng = rs.getString("TUJUAN_DTNG");
            no_paspor = rs.getString("NO_PASPOR");
            tgl_paspor = rs.getString("TGL_PASPOR");
            tgl_akh_paspor= rs.getString("TGL_AKH_PASPOR");
            nama_spsor = rs.getString("NAMA_SPSOR");
            tipe_spsor = rs.getString("TIPE_SPSOR");
            alamat_spsor = rs.getString("ALAMAT_SPSOR");
            no_dok = rs.getString("NO_DOK");
            tmpt_dtbit = rs.getString("TMPT_DTBIT");
            tgl_dtbit = rs.getString("TGL_DTBIT");
            tgl_akh_dok = rs.getString("TGL_AKH_DOK");
            no_stld = rs.getString("NO_STLD");
            sys_tgl = rs.getString("SYS_TGL");

            obj = new BiodataWNAObject( nama_klrga, nama_pertma, jenis_klmin, tmpt_lhr,
                          tgl_lhr, kwrngrn,  agama, gol_drh, pddk_akh,
                          jenis_pkrjn, stat_kwn, nama_kep, no_kk,
                          alamat, no_rt,no_rw,dusun,kodepos,telp,nama_prop,nama_kab,nama_kec,nama_kel,datng_dari, tujuan_dtng, no_paspor,
                          tgl_paspor,  tgl_akh_paspor,
                          nama_spsor, tipe_spsor, alamat_spsor, no_dok, tmpt_dtbit,
                          tgl_dtbit, tgl_akh_dok, no_stld, sys_tgl);

            vData.addElement(obj);

          }
          if(rs!=null) rs.close();

      }
      stmt.close();
      conn.close();
    }
    catch(Exception e)
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
         catch (Exception e1)
         {
           siakWriter.writeFile(e1);
         }
         try {
            if (conn != null)
              conn.close();
          }
          catch (Exception e2)
          {
            siakWriter.writeFile(e2);
          }
      }

return vData;
  }

  public void ejbRemove()
  {
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