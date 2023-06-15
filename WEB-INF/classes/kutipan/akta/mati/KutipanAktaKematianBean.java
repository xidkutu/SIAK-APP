package kutipan.akta.mati;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kutipan.akta.mati.KutipanAktaKematianObject;
import cetak.mati.CetakMatiObject;

import siaktools.logwriter.SiakWriter;

public class KutipanAktaKematianBean implements SessionBean
{
  private SessionContext sessionContext;
  private String nik, dsrhk_cttlhr, daymati, monthmati, yearmati, nama;
  private String tmpt_lhr, kwrngrn, anak_ke, jenis_klmin, daylhr, monthlhr, yearlhr;
  private String day_ctk, month_ctk, year_ctk, nama_prop, nama_kab, tgl_ctk_ktakta;
  private SiakWriter siakWriter;
  private String tmpt_mati;

  public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab)
      throws RemoteException
  {
  Vector vData = new Vector();
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

    for(int i=0;i<vAkta.size();i++)
    {
      query = "SELECT * FROM VW_KUTIPAN_AKTA_MATI WHERE NO_AKTA_MATI='" +
          ((CetakMatiObject)vAkta.elementAt(i)).getNo_akta_mati()+"'";
      rs = stmt.executeQuery(query.trim());
      KutipanAktaKematianObject obj = null;
       while (rs.next())
        {
          tmpt_mati=rs.getString("TMPT_MATI");
          dsrhk_cttlhr = rs.getString("DSRHK_CTTLHR");
          day_ctk = rs.getString("DAY_CTK");
          month_ctk = rs.getString("MONTH_CTK");
          year_ctk = rs.getString("YEAR_CTK");
          daymati = rs.getString("DAYMATI");
          monthmati = rs.getString("MONTHMATI");
          yearmati= rs.getString("YEARMATI");
          tgl_ctk_ktakta = rs.getString("TGL_CTK_KTAKTA");
          obj = new KutipanAktaKematianObject(tmpt_mati,dsrhk_cttlhr,
                                  daymati, monthmati, yearmati,
                                  day_ctk, month_ctk, year_ctk,
                                  nama_prop,  nama_kab, tgl_ctk_ktakta);
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
}