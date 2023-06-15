package kutipan.lahir;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;

import siaktools.logwriter.SiakWriter;

import cetak.lahir.CetakLahirObject;

public class KutipanAktaLahirWNIBean implements SessionBean
{
  private SessionContext sessionContext;
  private String nama_prop,nama_kab;
  private String nik, dsrhk_cttlhr, nama_lgkp, tmpt_lhr, daylhr, monthlhr, yearlhr, day_ctk;
  private String month_ctk, year_ctk, jenis_klmin, anak_ke_lahir, nama_pertma, kwrngrn, tgl_ctk_ktakta ;
  private SiakWriter siakWriter;



public Vector retrieveData(Vector vAkta, String nama_prop, String nama_kab
                        ) throws RemoteException
  {
 Vector vData=new Vector();
    Connection conn=null;
  ConnectorDB connectorDb = new ConnectorDB();
  ResultSet rs=null ;
  Statement stmt = null;
  String query = "";
  String nama_ibu="",nama_ayh="";
  try
  {
    conn = connectorDb.getConnection();
    stmt = conn.createStatement();

    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;

    for(int i=0;i<vAkta.size();i++)
    {
      query = "SELECT * FROM VW_KUTIPAN_AKTA_LAHIR_WNI WHERE NO_AKTA_LAHIR='" +
          ((CetakLahirObject)vAkta.elementAt(i)).getNo_akta_lahir()+"'";
      System.out.println(query);

      rs = stmt.executeQuery(query.trim());
      KutipanLahirObject obj = null;
       while (rs.next())
        {
          System.out.println("Entered Into DATA");
          nama_ibu=rs.getString("nama_ibu");
          nama_ayh=rs.getString("nama_ayh");
          dsrhk_cttlhr = rs.getString("DSRHK_CTTLHR");
          day_ctk = rs.getString("DAY_CTK");
          month_ctk = rs.getString("MONTH_CTK");
          year_ctk = rs.getString("YEAR_CTK");
          tgl_ctk_ktakta = rs.getString("TGL_CTK_KTAKTA");

          obj = new KutipanLahirObject(nama_ibu,nama_ayh, dsrhk_cttlhr, tgl_ctk_ktakta,
                                        day_ctk, month_ctk, year_ctk, nama_prop,
                                        nama_kab );
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
           }
       catch (Exception e1)
       {
         siakWriter.writeFile(e1);
       }
       try{
         if (stmt != null)
          stmt.close();
       }catch(Exception e3)
       {        }
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