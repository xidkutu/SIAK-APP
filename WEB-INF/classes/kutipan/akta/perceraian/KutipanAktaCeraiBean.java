package kutipan.akta.perceraian;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kutipan.akta.kawin.KutipanAktaKawinObject;

import siaktools.logwriter.SiakWriter;

public class KutipanAktaCeraiBean implements SessionBean
{
  private SessionContext sessionContext;
  private String nik, dasar_hkm_crai, tgl_entry_date, tgl_entry_month, tgl_entry_year,
      lbg_pngadil_kel_kep, no_kep_pngadil, tgl_srt_date, tgl_srt_month, tgl_srt_year, tmpt_ctt_kwn,
      no_akta_kwn, day_kwn, month_kwn, year_kwn, tgl_ctk, day_ctk, month_ctk, year_ctk;
  private SiakWriter siakWriter;
  private String nama_suami,nama_istri, nama_negara;


  public Vector retrieveData(Vector vAkta) throws RemoteException
  {
     Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    Statement stmt = null;
    String query = "";

    try
    {
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      for (int i = 0; i < vAkta.size(); i++)
      {
        query = "SELECT * FROM VW_KUTIPAN_AKTA_CERAI WHERE NO_AKTA_CRAI='" +
            ((KutipanAktaCeraiObject)vAkta.elementAt(i)).getNo_akta_crai().trim() + "'";
        System.out.println(query);

        rs = stmt.executeQuery(query.trim());
        KutipanAktaCeraiObject obj = null;

        while (rs.next())
        {
          nik = rs.getString("NIK");
          dasar_hkm_crai = rs.getString("DASAR_HKM_CRAI");
          tgl_entry_date = rs.getString("TGL_ENTRY_DATE");
          tgl_entry_month = rs.getString("TGL_ENTRY_MONTH");
          tgl_entry_year = rs.getString("TGL_ENTRY_YEAR");

          lbg_pngadil_kel_kep = rs.getString("LBG_PNGADIL_KEL_KEP");
          no_kep_pngadil = rs.getString("NO_KEP_PNGADIL");
          tgl_srt_date = rs.getString("TGL_SRT_DATE");
          tgl_srt_month = rs.getString("TGL_SRT_MONTH");
          tgl_srt_year = rs.getString("TGL_SRT_YEAR");

          tmpt_ctt_kwn = rs.getString("TMPT_CTT_KWN");
          no_akta_kwn = rs.getString("NO_AKTA_KWN");
          day_kwn = rs.getString("DAY_KWN");
          month_kwn = rs.getString("MONTH_KWN");
          year_kwn = rs.getString("YEAR_KWN");
          tgl_ctk = rs.getString("TGL_CTK");
          day_ctk = rs.getString("DAY_CTK");
          month_ctk = rs.getString("MONTH_CTK");
          year_ctk = rs.getString("YEAR_CTK");

          obj = new KutipanAktaCeraiObject(  nik, ((KutipanAktaCeraiObject)vAkta.elementAt(i)).getNo_akta_crai().trim()
                                             ,  dasar_hkm_crai, tgl_entry_date, tgl_entry_month, tgl_entry_year,
                                             lbg_pngadil_kel_kep, no_kep_pngadil, tgl_srt_date, tgl_srt_month,
                                             tgl_srt_year, tmpt_ctt_kwn,
                                             no_akta_kwn, day_kwn, month_kwn, year_kwn, tgl_ctk, day_ctk,
                                             month_ctk, year_ctk
                                             , ((KutipanAktaCeraiObject)vAkta.elementAt(i)).getNama_suami().trim(),
                                             ((KutipanAktaCeraiObject)vAkta.elementAt(i)).getNama_istri().trim(),
                                             ((KutipanAktaCeraiObject)vAkta.elementAt(i)).getNama_negara().trim() );

          vData.addElement(obj);

        }
        if (rs != null)
          rs.close();

      }
      stmt.close();
      conn.close();
    }
    catch (Exception e)
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