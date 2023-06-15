package cetak.mati;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.*;

import siaktools.logwriter.SiakWriter;

public class CetakMatiBean implements SessionBean,java.io.Serializable
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  private String nama_prop, nama_kab, no_prop, no_kab, status, kewarganegaraan;
  private int start, end, pageno, counter;

  private Vector vCetakMati = new Vector();
  private boolean enabled = true;
  private String nama = "";

public Vector getAllDataMember(int start, int end, int pageno) throws RemoteException
  {
   Vector vClone = (Vector)vCetakMati.clone();
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

public int[] updatePrintStatus(Vector vAkta, String pflag, String cflag, Vector vTgl_ctk, String update) throws RemoteException
  {

    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    PreparedStatement stmt = null;
    int result[] = new int[vAkta.size()];
    String qUpdate="";
try
    {
      if(update.trim().equalsIgnoreCase("ok"))
        {
          conn = connectorDb.getConnection();
          qUpdate =
              "UPDATE CATAT_MATI SET PFLAG=?,CFLAG=?,TGL_CTK_KTAKTA=? WHERE NO_AKTA_MATI=?";
          stmt = conn.prepareStatement(qUpdate);

          for (int i = 0; i < vAkta.size(); i++) {
            stmt.setString(1, pflag);
            stmt.setString(2, cflag);
            stmt.setString(3, vTgl_ctk.elementAt(i).toString().trim());
            stmt.setString(4, vAkta.elementAt(i).toString().trim());
            stmt.addBatch();
          }
          result = stmt.executeBatch();
          if (vAkta.size() > 0)
            vAkta.removeAllElements();
          if (vTgl_ctk.size() > 0)
            vTgl_ctk.removeAllElements();

          stmt.close();
          conn.close();
        }
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

  public CetakMatiObject getSpecificAkta(String nik_jenasah, String printed, String changed
                                         , String type, String no_prop, String no_kab) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    Statement stmt = null;
    this.no_prop = no_prop;
    this.no_kab = no_kab;

    boolean found = false;
    try
    {
      conn=connectorDb.getConnection();

      stmt = conn.createStatement();
      String query = "SELECT * FROM VW_CETAK_MATI_"+type+" WHERE NO_AKTA_MATI='"
          +nik_jenasah.trim()+"' AND NO_PROP="+no_prop+" AND NO_KAB="+no_kab;
      ResultSet rsSpecific = stmt.executeQuery(query);
      CetakMatiObject obj=null;
      String nama_negara="", nama_pelapor="",q="";

        while (rsSpecific.next())
        {
          String no_akta_mati = rsSpecific.getString("NO_AKTA_MATI");
          if (kewarganegaraan.equalsIgnoreCase("WNI"))
          {
            nama = rsSpecific.getString("NAMALGKP");
            nama_negara = "INDONESIA";
          }
          else {
            nama = rsSpecific.getString("NAMA_JNSAH");
            nama_negara = rsSpecific.getString("KWRNGRN");
          }
          String nik_plpor = rsSpecific.getString("NIK_PLPOR");
          String kwrngrn_plpor = rsSpecific.getString("KWRNGRN_PLPOR");

          String tmpt_lhr = rsSpecific.getString("TMPT_LHR");
          String daylhr = rsSpecific.getString("DAYLHR");
          String monthlhr = rsSpecific.getString("MONTHLHR");
          String yearlhr = rsSpecific.getString("YEARLHR");
          String jenis_klmin = rsSpecific.getString("JENIS_KLMIN");

          if (kwrngrn_plpor.trim().equalsIgnoreCase("1"))
          {
            Statement stmt1 = conn.createStatement();
            q = "SELECT NAMA_LGKP FROM BIODATA_WNI WHERE NIK=" + nik_plpor.trim();
            System.out.println(q);
            ResultSet rsPelapor = stmt1.executeQuery(q);
            while (rsPelapor.next()) {
              nama_pelapor = rsPelapor.getString("NAMA_LGKP");
              System.out.println("NAMA_LGKP= " + nama_pelapor);
            }
            rsPelapor.close();
            stmt1.close();
          }
          else
          {
            Statement stmt1 = conn.createStatement();
            q = "SELECT NAMA_PERTMA FROM BIODATA_WNA WHERE NIK=" +
                nik_plpor.trim();
            System.out.println(q);
            ResultSet rsPelapor = stmt1.executeQuery(q);
            while (rsPelapor.next()) {
              nama_pelapor = rsPelapor.getString("NAMA_PERTMA");
              System.out.println("NAMA_PERTMA= " + nama_pelapor);
            }
            rsPelapor.close();
            stmt1.close();
          }
          found = true;
          obj = new CetakMatiObject(no_akta_mati, rsSpecific.getString("NIK_JNSAH"), nama, nama_negara,
                                    tmpt_lhr, daylhr, monthlhr, yearlhr,
                                    jenis_klmin,
                                    nama_pelapor, found);
        }
        if(nama_pelapor.trim().equalsIgnoreCase(""))
        {
          found=false;
          obj = new CetakMatiObject(found);
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
                        String printed, String changed, String status, String kewarganegaraan)
   throws RemoteException
  {
    Connection conn=null;
    ResultSet rs=null ;
    Statement stmt = null;
    String query = "";

    if(vCetakMati.size()>0) vCetakMati.removeAllElements();
    this.no_prop = no_prop;
    this.no_kab = no_kab;
    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
    this.status = status;
    this.kewarganegaraan = kewarganegaraan;

    CetakMatiObject obj = null;
    String q = "";
    try
    {
      if(kewarganegaraan!=null && !kewarganegaraan.trim().equalsIgnoreCase(""))
      {
        ConnectorDB connectorDb = new ConnectorDB();

      conn = connectorDb.getConnection();
      stmt = conn.createStatement();

      query= "SELECT * FROM VW_CETAK_MATI_"+kewarganegaraan+" WHERE NO_PROP='"+no_prop
          +"' AND NO_KAB='"+no_kab+"' AND PFLAG='"+printed+"' AND CFLAG='"+changed+"'";
      rs = stmt.executeQuery(query);
      int ct = 0;
      String nama_pelapor="", nama_negara="";

      while(rs.next())
      {
        String no_akta_mati = rs.getString("NO_AKTA_MATI");
        String nik_jnsah = rs.getString("NIK_JNSAH");
        if(kewarganegaraan.equalsIgnoreCase("WNI"))
        {
          nama = rs.getString("NAMALGKP");
          nama_negara = "INDONESIA";
        }
        else
        {
          nama = rs.getString("NAMA_JNSAH");
          nama_negara = rs.getString("KWRNGRN");
        }
        String nik_plpor = rs.getString("NIK_PLPOR");
        String kwrngrn_plpor = rs.getString("KWRNGRN_PLPOR");

        String tmpt_lhr = rs.getString("TMPT_LHR");
        String daylhr = rs.getString("DAYLHR");
        String monthlhr = rs.getString("MONTHLHR");
        String yearlhr = rs.getString("YEARLHR");
        String jenis_klmin = rs.getString("JENIS_KLMIN");

        if(kwrngrn_plpor.trim().equalsIgnoreCase("1"))
        {
          q = "SELECT NAMA_LGKP FROM BIODATA_WNI WHERE NIK="+nik_plpor.trim();
          Statement stmt1 = conn.createStatement();
          ResultSet rsPelapor = stmt1.executeQuery(q);
          while(rsPelapor.next())
          {
            nama_pelapor = rsPelapor.getString("NAMA_LGKP");
          }
          rsPelapor.close();
          stmt1.close();
        }
        else
        {
          q = "SELECT NAMA_PERTMA FROM BIODATA_WNA WHERE NIK="+nik_plpor.trim();
          System.out.println(q);
          Statement stmt1 = conn.createStatement();
          ResultSet rsPelapor = stmt1.executeQuery(q);
          while(rsPelapor.next())
          {
            nama_pelapor = rsPelapor.getString("NAMA_PERTMA");
            System.out.println("NAMA_PERTMA= "+nama_pelapor);
          }
          rsPelapor.close();
          stmt1.close();
        }

        obj = new CetakMatiObject( no_akta_mati, nik_jnsah, nama,  nama_negara,
                        tmpt_lhr,  daylhr,  monthlhr,  yearlhr,  jenis_klmin,
                        nama_pelapor);

        if(no_akta_mati !=null && !no_akta_mati.trim().equals(""))
        {
          vCetakMati.addElement(obj);
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