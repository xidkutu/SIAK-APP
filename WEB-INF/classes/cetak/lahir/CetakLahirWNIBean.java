package cetak.lahir;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.*;
import siaktools.logwriter.SiakWriter;

public class CetakLahirWNIBean implements SessionBean,java.io.Serializable
      {
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  private String nama_prop, nama_kab, no_prop, no_kab, status, kewarganegaraan, nama_negara;
  private int start, end, pageno, counter;
  private Vector vCetakLahir = new Vector();
  private boolean enabled = true;

public Vector getAllDataMember(int start, int end, int pageno) throws RemoteException
  {
   Vector vClone = (Vector)vCetakLahir.clone();
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
    Statement stmt = null;
    int result[] = new int[vAkta.size()];
    String qUpdate="";
try
  {
      conn=connectorDb.getConnection();
      stmt = conn.createStatement();
      for(int i=0;i<vAkta.size();i++)
      {
        if(update.trim().equalsIgnoreCase("okkutipan"))
        {
       qUpdate = "UPDATE CATAT_LAHIR SET PFLAG='"+pflag+"',CFLAG='"+cflag+"',TGL_CTK_KTAKTA='"
       +vTgl_ctk.elementAt(i).toString().trim()+"' WHERE NO_AKTA_LAHIR='"
       + vAkta.elementAt(i).toString().trim()+"'";
        }
        else
        {
          qUpdate = "UPDATE CATAT_LAHIR SET PFLAG='"+pflag+"',CFLAG='"+cflag+"',TGL_CTK_KTAKTA='"
              +vTgl_ctk.elementAt(i).toString().trim()+"' WHERE NIK_BAYI='"
              + vAkta.elementAt(i).toString().trim()+"'";
        }
        stmt.addBatch(qUpdate.trim());
      }
      result = stmt.executeBatch();

  if(vAkta.size()>0)    vAkta.removeAllElements();
      stmt.close();
      conn.close();
    }
    catch(Exception e)
    {
      try{
        e.printStackTrace();
        siakWriter.writeFile(e);
        conn.rollback();
      }catch(Exception err)
      {
          System.out.println("Transaction Rollbacked");
      }
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

  public CetakLahirObject getSpecificAkta(String no_akta_lahir, String printed,
  String changed, String kewarganegaraan,
  String no_prop, String no_kab) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    Statement stmt = null;
    this.no_prop = no_prop;
    this.no_kab = no_kab;
 try
    {
      conn=connectorDb.getConnection();
      stmt = conn.createStatement();
      String query = "SELECT * FROM VW_CETAK_LAHIRAN_"+kewarganegaraan.trim()
          +" WHERE NO_AKTA_LAHIR='"
          +no_akta_lahir.trim()+"' AND NO_PROP="+no_prop+" AND NO_KAB="+no_kab;
      ResultSet rsSpecific = stmt.executeQuery(query);
      CetakLahirObject obj=null;
      String nama=null, nama_negara=null;
      boolean found =false;
      while(rsSpecific.next())
      {
        String nik = rsSpecific.getString("NIK");
        String tmpt_lhr = rsSpecific.getString("TMPT_LHR");
        String daylhr = rsSpecific.getString("DAYLHR");
        String monthlhr = rsSpecific.getString("MONTHLHR");
        String yearlhr = rsSpecific.getString("YEARLHR");
        String jenis_klmin = rsSpecific.getString("JENIS_KLMIN");
    if(kewarganegaraan.trim().equalsIgnoreCase("WNI"))
        {
          nama = rsSpecific.getString("NAMA_LGKP");
          nama_negara = "INDONESIA";
        }
    else if(kewarganegaraan.trim().equalsIgnoreCase("WNA"))
        {
          nama = rsSpecific.getString("NAMA_PERTMA");
          nama_negara = rsSpecific.getString("KWRNGRN");
        }
        String nama_ibu = rsSpecific.getString("NAMA_IBU");
        String nama_ayah = ((rsSpecific.getString("NAMA_AYH")==null)?"-":rsSpecific.getString("NAMA_AYH"));
        String anak_ke_lahir = rsSpecific.getString("ANAK_KE_LAHIR");
        found =true;
        obj = new CetakLahirObject( no_akta_lahir,  nik,  nama,anak_ke_lahir,
                           nama_ibu,  nama_ayah, tmpt_lhr,
                           daylhr, monthlhr,
                           yearlhr, jenis_klmin,  nama_negara, found);
      }
      if(nama==null)
      {
        obj = new CetakLahirObject( found );
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
    if(vCetakLahir.size()>0) vCetakLahir.removeAllElements();
    this.no_prop = no_prop;
    this.no_kab = no_kab;
    this.nama_prop = nama_prop;
    this.nama_kab = nama_kab;
    this.status = status;
    this.kewarganegaraan = kewarganegaraan;
    CetakLahirObject obj = null;
try
    {
 if(kewarganegaraan!=null && !kewarganegaraan.trim().equalsIgnoreCase(""))
      {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();
      stmt = conn.createStatement();
      query= "SELECT * FROM VW_CETAK_LAHIRAN_"+kewarganegaraan+" WHERE NO_PROP='"+no_prop
          +"' AND NO_KAB='"+no_kab+"' AND PFLAG='"+printed+"' AND CFLAG='"+changed+"'";
      rs = stmt.executeQuery(query);
      int ct = 0;
      String nama=null, nama_negara=null;
      while(rs.next())
      {
        String no_akta_lahir = rs.getString("NO_AKTA_LAHIR");
        String nik = rs.getString("NIK");
        String tmpt_lhr = rs.getString("TMPT_LHR");
        String daylhr = rs.getString("DAYLHR");
        String monthlhr = rs.getString("MONTHLHR");
        String yearlhr = rs.getString("YEARLHR");
        String jenis_klmin = rs.getString("JENIS_KLMIN");
        String anak_ke_lahir = rs.getString("ANAK_KE_LAHIR");
        if(kewarganegaraan.trim().equalsIgnoreCase("WNI"))
        {
          nama = rs.getString("NAMA_LGKP");
          nama_negara = "INDONESIA";
        }
        else if(kewarganegaraan.trim().equalsIgnoreCase("WNA"))
        {
          nama = rs.getString("NAMA_PERTMA");
          nama_negara = rs.getString("KWRNGRN");
        }
        String nama_ibu = rs.getString("NAMA_IBU");
        String nama_ayah = ((rs.getString("NAMA_AYH")==null)?"-":rs.getString("NAMA_AYH"));

        obj = new CetakLahirObject( no_akta_lahir,  nik,  nama, anak_ke_lahir,
                           nama_ibu,  nama_ayah, tmpt_lhr,
                           daylhr, monthlhr,
                           yearlhr, jenis_klmin,  nama_negara);

        if(no_akta_lahir !=null && !no_akta_lahir.trim().equals(""))
        {
          vCetakLahir.addElement(obj);
        }
        ct++;
      }
      counter = ct;
      if (stmt!=null) stmt.close();
      if (rs!=null) rs.close();
      if(conn!=null) conn.close();

      rs=null;
      stmt=null;
      conn=null;
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
      end = 15;
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
 public Vector getAllBayiMati(String no_prop,String no_kab)
 {
   return null;
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