package kutipan.akta.kawin;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kutipan.akta.kawin.KutipanAktaKawinObject;

import siaktools.logwriter.SiakWriter;

public class KutipanAktaKawinBean implements SessionBean
{
  private SessionContext sessionContext;
  private String nik,no_akta_kwn,dsrhk_cttlhr,tgl_entry_date,
      tgl_entry_month,tgl_entry_year,tduk_agama,
      nama_pmka_agama,daykwn,monthkwn,yearkwn,tgl_ctk,day_ctk,
      month_ctk,year_ctk,nama_prop,nama_kab;
  private String nama_suami,nama_istri;
  private SiakWriter siakWriter;
  private String nama_tmpt_pnesah;
private String ket_nama_tmpt_pnesah;


  public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab) throws RemoteException
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

      this.nama_prop = nama_prop;
      this.nama_kab = nama_kab;

      for (int i = 0; i < vAkta.size(); i++)
      {
        query = "SELECT * FROM VW_KUTIPAN_AKTA_KAWIN WHERE NO_AKTA_KWN='" +
            ((KutipanAktaKawinObject)vAkta.elementAt(i)).getNo_akta_kwn().trim() + "'";
        System.out.println(query);

        rs = stmt.executeQuery(query.trim());
        KutipanAktaKawinObject obj = null;

        while (rs.next())
        {
          nik = rs.getString("NIK");
          dsrhk_cttlhr = rs.getString("DSRHK_CTTKWN");
          tgl_entry_date = rs.getString("TGL_ENTRY_DATE");
          tgl_entry_month = rs.getString("TGL_ENTRY_MONTH");
          tgl_entry_year = rs.getString("TGL_ENTRY_YEAR");
          tduk_agama = rs.getString("TDUK_AGAMA");
          nama_pmka_agama = rs.getString("NAMA_PMKA_AGAMA");
          daykwn = rs.getString("DAYKWN");
          monthkwn = rs.getString("MONTHKWN");
          yearkwn = rs.getString("YEARKWN");
          tgl_ctk = rs.getString("TGL_CTK");
          day_ctk = rs.getString("DAY_CTK");
          month_ctk = rs.getString("MONTH_CTK");
          year_ctk = rs.getString("YEAR_CTK");
          nama_tmpt_pnesah=rs.getString("NAMA_TMPT_PNESAH");
          ket_nama_tmpt_pnesah=rs.getString("KET_NAMA_TMPT_PNESAH");


          obj = new KutipanAktaKawinObject(nik,
                                           ((KutipanAktaKawinObject)vAkta.elementAt(i)).getNo_akta_kwn().trim(),
                                           dsrhk_cttlhr, tgl_entry_date, tgl_entry_month,
                                           tgl_entry_year,tduk_agama,nama_pmka_agama, daykwn,
                                           monthkwn, yearkwn, tgl_ctk,
                                           day_ctk, month_ctk, year_ctk,
                                           nama_prop, nama_kab, ((KutipanAktaKawinObject)vAkta.elementAt(i)).getNama_suami(),
                                           ((KutipanAktaKawinObject)vAkta.elementAt(i)).getNama_istri(),nama_tmpt_pnesah,ket_nama_tmpt_pnesah);

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