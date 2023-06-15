package daftar.akta.kawin;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.*;

import siaktools.logwriter.SiakWriter;

public class CetakAktaKawinBean implements SessionBean,java.io.Serializable
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  private String nama_prop, nama_kab, no_prop, no_kab, status, kewarganegaraan;
  private int start, end, pageno, counter;

  private Vector vCetakAktaKawin = new Vector();
  private boolean enabled = true;

  public Vector getAllDataMember(int start, int end, int pageno) throws RemoteException
  {
   Vector vClone = (Vector)vCetakAktaKawin.clone();
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
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;
    Statement stmt = null;
    int result[] = new int[vAkta.size()];
    String update="";

    try
    {
      conn=connectorDb.getConnection();

      stmt = conn.createStatement();

       for(int i=0;i<vAkta.size();i++)
      {
           update = "UPDATE CATAT_KAWIN SET PFLAG='"+pflag+"',CFLAG='N',TGL_CTK_KTAKTA='"
            +vTglCetak.elementAt(i).toString().trim()+"' WHERE NO_AKTA_KWN='"
            + vAkta.elementAt(i).toString().trim()+"'";

        System.out.println(update);
        stmt.addBatch(update.trim());

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

    return result;

  }

  public AktaKawinObject getSpecificAkta(String no_akta_kwn, String printed,
                                         String changed, String type,
                                         String no_prop, String no_kab,String jenis_dok) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn = null;
    Statement stmt = null;
    try
    {
      conn=connectorDb.getConnection();

      stmt = conn.createStatement();
      String query="";

     if (jenis_dok.equals("2"))
       {
         query = "SELECT * FROM VW_CETAK_KAWIN_"+type+" WHERE NO_AKTA_KWN='"+no_akta_kwn.trim()+"' AND NO_PROP="
          +no_prop+" AND NO_KAB="+no_kab +" AND PFLAG='"+printed.trim()+"' AND CFLAG='N'";       }
      else
      {
        query = "SELECT * FROM VW_CETAK_KAWIN_"+type+" WHERE NO_AKTA_KWN='"+no_akta_kwn.trim()+"' AND NO_PROP="
            +no_prop+" AND NO_KAB="+no_kab;
      }

      System.out.println(query);
      ResultSet rsSpecific = stmt.executeQuery(query);

      String nama_negara=null;
      boolean found = false;
      AktaKawinObject obj = null;

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
          ResultSet rsIstri = stmt.executeQuery("SELECT NAMA_LGKP FROM BIODATA_WNI WHERE NIK="+nik_istri.trim());
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_LGKP");
          }
          rsIstri.close();
        }
        else
        {
          ResultSet rsIstri = stmt.executeQuery("SELECT NAMA_PERTMA FROM BIODATA_WNA WHERE NIK="+nik_istri.trim());
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_PERTMA");
          }
          rsIstri.close();
        }
        obj = new AktaKawinObject(no_akta_kwn, nik_suami, nama_suami,
                                  nik_istri, nama_istri, nama_negara, found);

      }
      if(nama_negara==null)
      {
        obj = new AktaKawinObject(found);
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
                        String printed, String changed, String status, String kewarganegaraan,String jenis_dok)
   throws RemoteException
  {
    Connection conn=null;
    ResultSet rs=null ;
    Statement stmt = null;

    String query = "";
    if(vCetakAktaKawin.size()>0) vCetakAktaKawin.removeAllElements();
    this.no_prop = no_prop;
    this.no_kab = no_kab;
    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
    this.status = status;
    this.kewarganegaraan = kewarganegaraan;

    AktaKawinObject obj = null;
    String q = "";
    try
    {
      if(kewarganegaraan!=null && !kewarganegaraan.trim().equalsIgnoreCase(""))
      {
        ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();

      System.out.println("BEFORE CREATE STATEMENT");
      stmt = conn.createStatement();
      System.out.println("AFTER CREATE STATEMENT");

      if (jenis_dok.equals("2"))
      {
      query= "SELECT * FROM VW_CETAK_KAWIN_"+kewarganegaraan.trim()+" WHERE NO_PROP="+no_prop.trim()
          +" AND NO_KAB="+no_kab.trim()+" AND PFLAG='"+printed.trim()+"' AND CFLAG='N'";
      }
      else
      {
       query= "SELECT * FROM VW_CETAK_KAWIN_"+kewarganegaraan.trim()+" WHERE NO_PROP="+no_prop.trim()
       +" AND NO_KAB="+no_kab.trim()+" AND PFLAG='"+printed.trim() +"'";
      }

      System.out.println(query);
      rs = stmt.executeQuery(query.trim());
      int ct = 0;
      String nama_pelapor="";

      while(rs.next())
      {
        String no_akta_kwn = rs.getString("NO_AKTA_KWN");
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
          Statement stmt1 = conn.createStatement();
          ResultSet rsIstri = stmt1.executeQuery("SELECT NAMA_LGKP FROM BIODATA_WNI WHERE NIK="+nik_istri.trim());
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_LGKP");
          }
          rsIstri.close();
          stmt1.close();
        }
        else
        {
          Statement stmt1 = conn.createStatement();
          ResultSet rsIstri = stmt1.executeQuery("SELECT NAMA_PERTMA FROM BIODATA_WNA WHERE NIK="+nik_istri.trim());
          while(rsIstri.next())
          {
            nama_istri = rsIstri.getString("NAMA_PERTMA");
          }
          rsIstri.close();
          stmt1.close();
        }

        obj = new AktaKawinObject( no_akta_kwn, nik_suami, nama_suami, nik_istri
                         , nama_istri, nama_negara);

          vCetakAktaKawin.addElement(obj);
          System.out.println("vCetakAktaKawin.size()= "+vCetakAktaKawin.size());
          System.out.println("CT DATA AKTA KAWIN: "+ct);
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
          conn = null;
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
  public void ejbRemove()
  {
    /**@todo Complete this method*/
  }
  public void ejbActivate()
  {
    /**@todo Complete this method*/
  }
  public void ejbPassivate()
  {
    /**@todo Complete this method*/
  }
  public void setSessionContext(SessionContext sessionContext)
  {
    this.sessionContext = sessionContext;
  }
}