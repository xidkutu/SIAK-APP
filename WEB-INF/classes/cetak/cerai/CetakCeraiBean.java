package cetak.cerai;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.*;

import siaktools.logwriter.SiakWriter;

public class CetakCeraiBean implements SessionBean,java.io.Serializable
{
  private SessionContext sessionContext;
  private String nama_prop, nama_kab, no_prop, no_kab, status, kewarganegaraan;
  private int start, end, pageno, counter;

  private Vector vCetakAktaCerai = new Vector();
  private boolean enabled = true;
  private SiakWriter siakWriter;

  public Vector getAllDataMember(int start, int end, int pageno) throws RemoteException
  {
   Vector vClone = (Vector)vCetakAktaCerai.clone();
   Vector v = new Vector();

   this.pageno=pageno;
   this.pageno++;

    if(vClone.size()<=end)
    {
      end = vClone.size();
      enabled = false;
    }
    else enabled=true;

    for(int i=start;i<end;i++)
    {
      v.addElement(vClone.elementAt(i));
    }
    return v;
 }
 public boolean getLinkEnabled() throws RemoteException
 {
   return enabled;
 }
 public int getPageNo()
  {
      return(pageno);
  }
  public int getTotalRecords() throws RemoteException
  {
    return counter;
  }
  public DataWilayah getDataWilayah() throws RemoteException
  {
    return new DataWilayah(no_prop,no_kab,nama_prop,nama_kab,status, kewarganegaraan);
  }

public int[] updatePrintStatus(Vector vAkta, String pflag, String cflag, Vector vTglCetak) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    PreparedStatement stmt = null;
    int result[] = new int[vAkta.size()];
    String update="";
try
{
conn=connectorDb.getConnection();
update = "UPDATE CATAT_CERAI SET PFLAG=?,CFLAG=?,TGL_CTK_KTAKTA=? WHERE NO_AKTA_CRAI=?";
/*      update = "UPDATE CATAT_CERAI SET PFLAG='"+pflag+"',CFLAG='"+cflag+"',TGL_CTK_KTAKTA='"
          +vTglCetak.elementAt(i).toString().trim()+"' WHERE NO_AKTA_CRAI='"
          + vAkta.elementAt(i).toString().trim()+"'";
*/
      stmt = conn.prepareStatement(update);

      for(int i=0;i<vAkta.size();i++)
      {
        stmt.setString(1,pflag);
        stmt.setString(2,cflag);
        stmt.setString(3,vTglCetak.elementAt(i).toString().trim());
        stmt.setString(4,vAkta.elementAt(i).toString().trim());
        stmt.addBatch();
      }
      result = stmt.executeBatch();
      if(vAkta.size()>0)    vAkta.removeAllElements();
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
      try
      {
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

public CetakCeraiObject getSpecificAkta(String no_akta_cerai, String printed, String changed
                                          , String type, String no_prop, String no_kab) throws RemoteException
 {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    this.no_prop = no_prop;
    this.no_kab = no_kab;
    PreparedStatement stmt = null;
    PreparedStatement stmtistri=null;
 try
    {
      conn=connectorDb.getConnection();

/*String query = "SELECT * FROM VW_CETAK_CERAI_"+type+" WHERE NO_AKTA_CRAI='"
          +no_akta_cerai.trim()+"' AND NO_PROP="+no_prop+" AND NO_KAB="+no_kab;
 */
String query = "SELECT * FROM VW_CETAK_CERAI_"+type+" WHERE NO_AKTA_CRAI=? AND NO_PROP=?  AND NO_KAB=?";
stmt = conn.prepareStatement(query);
stmt.setString(1,no_akta_cerai.trim());
stmt.setString(2,no_prop);
stmt.setString(3,no_kab);
ResultSet rsSpecific = stmt.executeQuery();

      boolean found=false;
      CetakCeraiObject obj=null;
      String nama_negara=null;

      while(rsSpecific.next())
      {
        String nik_suami = rsSpecific.getString("NIK_SUAMI");
        String nama_suami = rsSpecific.getString("NAMA_SUAMI");
        String nik_istri = rsSpecific.getString("NIK_ISTRI");
        found = true;
        if(kewarganegaraan.trim().equalsIgnoreCase("WNI"))
        {
          nama_negara = "INDONESIA";
        }
        else
        {
          nama_negara = rsSpecific.getString("KWRNGRN");
        }

        String kwrngrn_istri = rsSpecific.getString("KWRNGRN_ISTRI");
        String nama_istri="";

        if(kwrngrn_istri.trim().equalsIgnoreCase("1"))
        {
          stmtistri=conn.prepareStatement("SELECT NAMA_LGKP FROM BIODATA_WNI WHERE NIK=?");
          stmtistri.setString(1,nik_istri.trim());
          ResultSet rsIstri = stmtistri.executeQuery();
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_LGKP");
          }
          rsIstri.close();
        }
        else
        {
          stmtistri=conn.prepareStatement("SELECT NAMA_PERTMA FROM BIODATA_WNA WHERE NIK=?");
          stmtistri.setString(1,nik_istri.trim());
          ResultSet rsIstri = stmtistri.executeQuery();

          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_PERTMA");
          }
          rsIstri.close();
        }
        obj = new CetakCeraiObject(no_akta_cerai, nik_suami, nama_suami, nik_istri
                         , nama_istri, nama_negara, found);
      }
      if(nama_negara==null)
      {
        obj = new CetakCeraiObject(found);
      }
      rsSpecific.close();
      stmt.close();
      conn.close();
      return obj;
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
           if (stmt != null)
             stmt.close();
         }
         catch (Exception e)
         {
           siakWriter.writeFile(e);
         }
         try
         {
           if (stmtistri != null)
                stmtistri.close();
         }
         catch (Exception e)
         {
           siakWriter.writeFile(e);
         }



         try
         {
            if (conn != null)
              conn.close();
          }
          catch (Exception e)
          {
            siakWriter.writeFile(e);
          }
      }
      return null;
  }

  public void retrieveData(String no_prop, String no_kab, String nama_prop, String nama_kab,
                        String printed, String changed, String status, String kewarganegaraan)
   throws RemoteException
  {
    Connection conn=null;
    ResultSet rs=null ;
    PreparedStatement stmt = null;
    PreparedStatement stmtistri=null;
    String query = "";

    if(vCetakAktaCerai.size()>0) vCetakAktaCerai.removeAllElements();
    this.no_prop = no_prop;
    this.no_kab = no_kab;
    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
    this.status = status;
    this.kewarganegaraan = kewarganegaraan;

    CetakCeraiObject obj = null;
    String q = "";
    try
    {
      if(kewarganegaraan!=null && !kewarganegaraan.trim().equalsIgnoreCase(""))
      {
        ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();

      query= "SELECT * FROM VW_CETAK_CERAI_"+kewarganegaraan+" WHERE NO_PROP=? AND NO_KAB=? AND PFLAG=? AND CFLAG=?";
      stmt = conn.prepareStatement(query);
      stmt.setString(1,no_prop);
      stmt.setString(2,no_kab);
      stmt.setString(3,printed);
      stmt.setString(4,changed);

      rs = stmt.executeQuery();
      int ct = 0;
      String nama_pelapor="";

      while(rs.next())
      {
        String no_akta_kwn = rs.getString("NO_AKTA_CRAI");
        String nik_suami = rs.getString("NIK_SUAMI");
        String nama_suami = rs.getString("NAMA_SUAMI");
        String nik_istri = rs.getString("NIK_ISTRI");

        String nama_negara="";
        if(kewarganegaraan.trim().equalsIgnoreCase("WNI"))
        {
          nama_negara = "INDONESIA";
        }
        else
        {
          nama_negara = rs.getString("KWRNGRN");
        }
        String kwrngrn_istri = rs.getString("KWRNGRN_ISTRI");

        String nama_istri="";
        if(kwrngrn_istri.trim().equalsIgnoreCase("1"))
        {
          stmtistri=conn.prepareStatement("SELECT NAMA_LGKP FROM BIODATA_WNI WHERE NIK=?");
          stmtistri.setString(1,nik_istri.trim());
          ResultSet rsIstri = stmtistri.executeQuery();
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_LGKP");
          }
          rsIstri.close();
        }
        else
        {
          stmtistri=conn.prepareStatement("SELECT NAMA_PERTMA FROM BIODATA_WNA WHERE NIK=?");
          stmtistri.setString(1,nik_istri.trim());
          ResultSet rsIstri = stmtistri.executeQuery();
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_PERTMA");
          }
          rsIstri.close();
        }

        obj = new CetakCeraiObject( no_akta_kwn, nik_suami, nama_suami, nik_istri
                         , nama_istri, nama_negara);
        if(no_akta_kwn !=null && !no_akta_kwn.trim().equals(""))
        {
          vCetakAktaCerai.addElement(obj);
        }
        ct++;
      }
      counter = ct;
      if (stmt!=null) stmt.close();
      if (rs!=null) rs.close();
      if(conn!=null) conn.close();
      }
    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    finally
    {
      start = 1;
      end = 10;
      pageno = 1;
      try
      {
        if (rs != null)
          rs.close();
        if (stmt != null)
          stmt.close();
        if (stmtistri != null)
          stmtistri.close();
      }
      catch (Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (conn != null)
        {
          conn.close();
               }
      }
      catch (Exception e)
      {
       siakWriter.writeFile(e);
      }
      }
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