package viewkk;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;

import siaktools.logwriter.SiakWriter;

public class ViewKKBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  private String nama_lgkp, nik, jenis_klmin, tmpt_lhr,
                                 stat_kwn, stat_hbkel, kwrngrn, no_paspor,
                                 dkel_tgl, jenis_pkjrn, pddk_akh, agama,
                                 tgl_lhr, nama_lgkp_ibu, nama_lgkp_ayah, no_dok,
                                 nama_pej, nip_pej, nama_lur, nip_lur;



public int[] updatePrintStatus(Vector vKK, String pflag, String cflag) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    Statement stmt = null;
    int result[] = new int[vKK.size()];
    String update="";

    try
    {
      conn=connectorDb.getConnection();

      stmt = conn.createStatement();

       for(int i=0;i<vKK.size();i++)
      {
        update = "UPDATE data_keluarga SET PFLAG='" + pflag.trim() + "',cflag='" + cflag.trim() + "' WHERE NO_KK="
        + vKK.elementAt(i).toString();

        System.out.println(update);
        stmt.addBatch(update.trim());

      }

      result = stmt.executeBatch();

      if(vKK.size()>0)    vKK.removeAllElements();

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

    return result;
  }

  public int[] updatePrintStatusWna(Vector vKK, String pflag, String cflag) throws RemoteException
    {
      ConnectorDB connectorDb = new ConnectorDB();
      Connection conn=null;
      Statement stmt = null;
      int result[] = new int[vKK.size()];
      String update="";

      try
      {
        conn=connectorDb.getConnection();

        stmt = conn.createStatement();

         for(int i=0;i<vKK.size();i++)
        {
          update = "UPDATE data_keluarga SET PFLAG='Y' WHERE NO_KK="
          + vKK.elementAt(i).toString();

          System.out.println(update);
          stmt.addBatch(update.trim());

        }
        result = stmt.executeBatch();

        if(vKK.size()>0)    vKK.removeAllElements();

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

      return result;
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

  public Vector retrieveData(Vector vNo_kk, String type) throws RemoteException
  {
   Vector vData = new Vector();
   Vector vBigData=new Vector();
   Connection conn=null;
  ConnectorDB connectorDb = new ConnectorDB();
  ResultSet rs=null ;
  Statement stmt = null;

  try
  {
    conn=connectorDb.getConnection();
    stmt = conn.createStatement();

    String query = "";
    String nama_kec="",nama_kel="";

    for(int i=0;i<vNo_kk.size();i++)
    {
      query = "SELECT * FROM VW_KARTU_KEL WHERE NO_KK="+( (ViewDataAlamat)vNo_kk.elementAt(i) ).getNo_kk().trim() + "ORDER BY STAT_HBKEL_TMP, TGL_LHR";

      rs = stmt.executeQuery(query.trim());
      ViewKKObject obj = null;
       vData = new Vector();

         while (rs.next())
         {

          nama_lgkp = rs.getString("NAMA_LGKP");
          nik = rs.getString("NIK");
          jenis_klmin = rs.getString("JENIS_KLMIN");
          tmpt_lhr = rs.getString("TMPT_LHR");
          stat_kwn = rs.getString("STAT_KWN");
          stat_hbkel = rs.getString("STAT_HBKEL");
          kwrngrn = rs.getString("KWRNGRN");
          no_paspor = rs.getString("NO_PASPOR");
          dkel_tgl = rs.getString("DKEL_TGL");
          jenis_pkjrn = rs.getString("JENIS_PKRJN");
          pddk_akh = rs.getString("PDDK_AKH");
          agama = rs.getString("AGAMA");
          tgl_lhr = rs.getString("TGL_LHR");
          nama_lgkp_ibu = rs.getString("NAMA_LGKP_IBU");
          nama_lgkp_ayah = rs.getString("NAMA_LGKP_AYAH");
          no_dok = rs.getString("NO_DOK");

         if(type.trim().equalsIgnoreCase("WNI"))
          {

            obj = new ViewKKObject(nama_lgkp, nik, jenis_klmin, tmpt_lhr,
                                   stat_kwn, stat_hbkel, kwrngrn, no_paspor,
                                   dkel_tgl, jenis_pkjrn, pddk_akh, agama,
                                   tgl_lhr, nama_lgkp_ibu, nama_lgkp_ayah,
                                   no_dok);
          }
          else
          {
            nama_kec = rs.getString("NAMA_KEC");
            nama_kel = rs.getString("NAMA_KEL");

            obj = new ViewKKObject(nama_lgkp, nik, jenis_klmin, tmpt_lhr,
                                   stat_kwn, stat_hbkel, kwrngrn, no_paspor,
                                   dkel_tgl, jenis_pkjrn, pddk_akh, agama,
                                   tgl_lhr, nama_lgkp_ibu, nama_lgkp_ayah,
                                   no_dok, nama_kec, nama_kel);

          }

          vData.addElement(obj);
        }
 vData=sortByAnak(vData);
     if(rs!=null) rs.close();
//added
        if(obj==null)
        {
          obj = new ViewKKObject(nama_lgkp, nik, jenis_klmin, tmpt_lhr,
                                 stat_kwn, stat_hbkel, kwrngrn, no_paspor,
                                 dkel_tgl, jenis_pkjrn, pddk_akh, agama,
                                 tgl_lhr, nama_lgkp_ibu, nama_lgkp_ayah,
                                 no_dok);
          vData.addElement(obj);
        }
//end added
      vBigData.addElement(vData);
    }
    if(stmt!=null) {stmt.close();}

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
    return vBigData;
  }

private Vector sortByAnak(Vector vtDb)
  {
    Vector vt_data=vtDb;
    Vector vt_tmp=new Vector();
    ViewKKObject data=null;

   for(int i=0;i<vt_data.size();i++)
    {
      data=(ViewKKObject)vt_data.elementAt(i);
      if (data.getStat_hbkel().trim().toUpperCase().equals("ANAK"))
      {
        vt_tmp.addElement(data);
      }
    }

    for(int i=0;i<vt_tmp.size();i++)
    {
      ViewKKObject  tmp1= null,tmp2=null;
      for (int j = 0; j < vt_tmp.size(); j++) {
        try{
          if
       (compareDate(((ViewKKObject)vt_tmp.elementAt(j)).getTgl_lhr(),((ViewKKObject)vt_tmp.elementAt(j+1)).getTgl_lhr(),"17-05-2004")==1)
          {
            tmp1 = (ViewKKObject)vt_tmp.get(j);
            tmp2 = (ViewKKObject)vt_tmp.get(j + 1);
            vt_tmp.set(j, tmp2);
            vt_tmp.set(j + 1, tmp1);
          }
        }catch(Exception err)
        {

        }
      }
    }
 int cntr=0;
 for(int i=0;i<vt_data.size();i++)
 {

   data=(ViewKKObject)vt_data.elementAt(i);
   if (data.getStat_hbkel().trim().toUpperCase().equals("ANAK"))
   {
     vt_data.set(i,(ViewKKObject)vt_tmp.elementAt(cntr));
     cntr++;
   }
 }
  return vt_data;
}

  private int compareDate(String first,String second,String today)
    {
      try{
        if ( (getYearPart(today) - getYearPart(first)) <
            (getYearPart(today) - getYearPart(second))) {
          return 1;
        }
      }catch(Exception err)
      {
      }
      return 0;
    }

    private int getYearPart(String date)
    {
      try
      {
        return (Integer.parseInt(date.substring(6, date.length())));
      }catch(Exception erp)
      {
        return 0;
      }
    }
  }
