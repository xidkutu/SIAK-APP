/*Under Construction and deployment*/
package biodata;
import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.DataKelurahan;
import kartukeluarga.DataWilayah;
import siaktools.logwriter.SiakWriter;
import oracle.jdbc.driver.*;

public class BiodataBean implements SessionBean
{
  private SessionContext sessionContext;

  String tot_rec="";
  String tot_rec_p4b="";
  String tot_rec_wna="";

  private String no_prop,no_kab,no_kec,no_kel,nama_prop,nama_kab,nama_kec,status;
  private String stat_print="", stat_change="";
  private SiakWriter siakWriter;

public Vector getSpecificNik(String nik, String printed, String changed,
                                         String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException
  {

   Vector vData = new Vector();
   ConnectorDB connectorDb = new ConnectorDB();
   BiodataWNIObject obj=null;
   Connection conn=null;
   ResultSet rs = null;
   CallableStatement stmt = null;
   String query = "";
   Statement st=null;
   conn=connectorDb.getConnection();

 try
  {
      query = "begin ? := get_biodata_specific(?,?,?,?,?,?,?); end;";
      stmt = conn.prepareCall(query);
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
      stmt.setString(2, nik.trim());
      stmt.setString(3, no_prop.trim());
      stmt.setString(4, no_kab.trim());
      stmt.setString(5, no_kec.trim());
      stmt.setString(6, no_kel.trim());
      stmt.setString(7, printed.trim());
      stmt.setString(8, changed.trim());
      stmt.execute();
      rs = (ResultSet)stmt.getObject(1);
   while (rs.next())
    {
    String no_kk = rs.getString("NO_KK");
    String nik_num = rs.getString("NIK");
    String nama_lgkp = rs.getString("NAMA_LGKP");
    String jenis_klmin = rs.getString("JENIS_KLMIN");
    String alamat = rs.getString("ALAMAT");
    obj = new BiodataWNIObject(no_kk, nik_num, nama_lgkp, jenis_klmin, alamat, printed, changed);
    vData.addElement(obj);
   }

  rs.close();
  rs = null;
  stmt.close();
  stmt = null;
  conn.close();
} catch (Exception e)
  {
  siakWriter.writeFile(e);
  e.printStackTrace();
}
finally{
  try{
        if (rs!=null) rs.close();
  }catch(Exception err)    {    }

  try{
    if (stmt!=null) stmt.close();

  }catch(Exception err1)    {    }

  try{
    if (conn!=null) conn.close();
  }catch(Exception err2)   {   }
}
return vData;
}

public Vector getSpecificNikP4B(String nik, String printed, String changed,
                                           String no_prop, String no_kab, String no_kec, String no_kel) throws RemoteException
    {

     Vector vData = new Vector();
     ConnectorDB connectorDb = new ConnectorDB();
     BiodataWNIObject obj=null;
     Connection conn=null;
     ResultSet rs = null;
     PreparedStatement stmt = null;
     String query = "";
     Statement st=null;
     conn=connectorDb.getConnection();
    try
    {
//a.no_prop,a.no_kab,a.no_kec,a.no_kel,a.pflag,a.cflag
      query="SELECT TO_CHAR(a.nik,'0000000000000000') nik,TO_CHAR(a.no_kk,'0000000000000000') no_kk," +
          " nama_lgkp,DECODE(a.JENIS_KLMIN,1,'Laki-laki',2,'Perempuan') JENIS_KLMIN," +
          " b.almt_t alamat FROM biodata_wni_p4b a,TABLE(GetalmtpivotP4B(a.NO_KK)) b " +
          " where nik=? and cflag='N' and pflag=? order by tgl_entri DESC";
       stmt = conn.prepareStatement(query);
       stmt.setString(1,nik.trim());
       stmt.setString(2,printed);
       rs = stmt.executeQuery();

 while (rs.next())
      {
      String no_kk = rs.getString("NO_KK");
      String nik_num = rs.getString("NIK");
      String nama_lgkp = rs.getString("NAMA_LGKP");
      String jenis_klmin = rs.getString("JENIS_KLMIN");
      String alamat = rs.getString("ALAMAT");
      obj = new BiodataWNIObject(no_kk, nik_num, nama_lgkp, jenis_klmin, alamat, printed, changed);
      vData.addElement(obj);
      }
    rs.close();
    rs = null;
    stmt.close();
    stmt = null;
    conn.close();
  } catch (Exception e)
    {
    siakWriter.writeFile(e);
    e.printStackTrace();
  }
  finally{
    try{
          if (rs!=null) rs.close();
    }catch(Exception err)    {    }

    try{
      if (stmt!=null) stmt.close();

    }catch(Exception err1)    {    }

    try{
      if (conn!=null) conn.close();
    }catch(Exception err2)   {   }
  }
  return vData;
  }

public Vector getSpecificNikWna(String nik, String printed, String changed,
                                           String no_prop, String no_kab ) throws RemoteException
{
     Vector vData = new Vector();
     ConnectorDB connectorDb = new ConnectorDB();
     BiodataWNIObject obj=null;
     Connection conn=null;
     ResultSet rs = null;
     CallableStatement stmt = null;
     String query = "";
     Statement st=null;
     conn=connectorDb.getConnection();
     String new_nik=new String("");
    try
    {
        query = "begin ? := get_biodata_specific_wna(?,?,?,?,?); end;";
        stmt = conn.prepareCall(query);
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setString(2, nik.trim());
        stmt.setString(3, no_prop.trim());
        stmt.setString(4, no_kab.trim());
        stmt.setString(5, printed.trim());
        stmt.setString(6, changed.trim());
        stmt.execute();
        rs = (ResultSet)stmt.getObject(1);
 while (rs.next())
      {
      String no_kk = rs.getString("NO_KK");
      String nik_num = rs.getString("NIK");
      String nama_lgkp = rs.getString("NAMA_PERTMA");
      String jenis_klmin = rs.getString("JENIS_KLMIN");
      String alamat = rs.getString("ALAMAT");
      obj = new BiodataWNIObject(no_kk, nik_num, nama_lgkp, jenis_klmin, alamat, printed, changed);
      vData.addElement(obj);
     }
    rs.close();
    rs = null;
    stmt.close();
    stmt = null;
    conn.close();
  } catch (Exception e)
    {
    siakWriter.writeFile(e);
    e.printStackTrace();
  }
  finally{
    try{
          if (rs!=null) rs.close();
    }catch(Exception err)    {    }

    try{
      if (stmt!=null) stmt.close();

    }catch(Exception err1)    {    }

    try{
      if (conn!=null) conn.close();
    }catch(Exception err2)   {   }
  }
  return vData;
  }

public int[] updatePrintStatus(Vector vNik) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    PreparedStatement stmt = null;
    int result[] = new int[vNik.size()];
    String update="";
    try
    {
      conn=connectorDb.getConnection();
      update = "UPDATE BIODATA_WNI SET PFLAG='Y' WHERE NIK=?";
      stmt = conn.prepareStatement(update);
      for(int i=0;i<vNik.size();i++)
      {
        stmt.setString(1,vNik.elementAt(i).toString());
        stmt.addBatch();
      }
      result = stmt.executeBatch();
      if(vNik.size()>0) vNik.removeAllElements();
      stmt.close();
      stmt = null;
      conn.close();
      conn=null;
    }
    catch(Exception ex)
    {
      siakWriter.writeFile(ex);
      ex.printStackTrace();
    }
    finally
    {
      try
      {
        if (stmt != null)
          stmt.close();
      }
      catch (Exception e1)
      {
        siakWriter.writeFile(e1);
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch (Exception e2)
      {
        siakWriter.writeFile(e2);
      }
    }
    return result;
}

public int[] updatePrintStatusP4B(Vector vNik) throws RemoteException
{
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    PreparedStatement stmt = null;
    int result[] = new int[vNik.size()];
    String update="";
    try
    {
      conn=connectorDb.getConnection();
      update = "UPDATE BIODATA_WNI_P4B SET PFLAG='Y' WHERE NIK=?";
      stmt = conn.prepareStatement(update);
      for(int i=0;i<vNik.size();i++)
      {
        stmt.setString(1,vNik.elementAt(i).toString());
        stmt.addBatch();
      }
      result = stmt.executeBatch();
      stmt.close();
      stmt = null;
      conn.close();
      conn=null;
    }
    catch(Exception ex)
    {
      siakWriter.writeFile(ex);
      ex.printStackTrace();
    }
    finally
    {
      try
      {
        if (stmt != null)
          stmt.close();
      }
      catch (Exception e1)
      {
        siakWriter.writeFile(e1);
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch (Exception e2)
      {
        siakWriter.writeFile(e2);
      }
    }
    return result;
  }

public int[] updatePrintStatusWna(Vector vNik) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    PreparedStatement stmt = null;
    int result[] = new int[vNik.size()];
    String update="";
    try
    {
      conn=connectorDb.getConnection();
      update = "UPDATE BIODATA_WNA SET PFLAG='Y' WHERE NIK=?";
      stmt = conn.prepareStatement(update);
      for(int i=0;i<vNik.size();i++)
      {
        stmt.setString(1,vNik.elementAt(i).toString().substring(1));
        stmt.addBatch();
      }
      result = stmt.executeBatch();
      if(vNik.size()>0) vNik.removeAllElements();
      stmt.close();
      stmt = null;
      conn.close();
      conn=null;
    }
    catch(Exception ex)
    {
      siakWriter.writeFile(ex);
      ex.printStackTrace();
    }
    finally
    {
      try
      {
        if (stmt != null)
          stmt.close();
      }
      catch (Exception e1)
      {
        siakWriter.writeFile(e1);
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch (Exception e2)
      {
        siakWriter.writeFile(e2);
      }
   }
   return result;
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
public Vector getAllData(String num_prop,String num_kab,String num_kec,String num_kel,String start,String end,String pflag,String cflag,boolean flag)
  {
    Vector vData = new Vector();
    ConnectorDB connectorDb = new ConnectorDB();
    BiodataWNIObject obj=null;
    Connection conn=null;
    ResultSet rs = null;
    CallableStatement stmt = null;
    String query = "";
    PreparedStatement st=null;
    conn=connectorDb.getConnection();
 try{
    if (flag==false)
    {
    if (pflag.trim().equals("Y") && cflag.trim().equals("Y"))
    {
          query="select count(*) cnt from vw_daftar_cetak_biodata_wni where no_prop=? and no_kab=? and no_kec=? and no_kel=? and pflag in('Y','N') and cflag='Y'";
          st=conn.prepareStatement(query);
          st.setString(1,num_prop);
          st.setString(2,num_kab);
          st.setString(3,num_kec);
          st.setString(4,num_kel);
    }
     else if (pflag.trim().equals("Y") && cflag.trim().equals("N"))
     {
       query="select count(*) cnt from vw_daftar_cetak_biodata_wni where no_prop=? and no_kab=? and no_kec=? and no_kel=? and pflag in('Y') and cflag in('Y','N')";
               st=conn.prepareStatement(query);
               st.setString(1,num_prop);
               st.setString(2,num_kab);
               st.setString(3,num_kec);
               st.setString(4,num_kel);
     }
     else
     {
          query= "select count(*) cnt from vw_daftar_cetak_biodata_wni where no_prop=? and no_kab=? and no_kec=? and no_kel=? and pflag=? and cflag=?";
               st=conn.prepareStatement(query);
               st.setString(1,num_prop);
               st.setString(2,num_kab);
               st.setString(3,num_kec);
               st.setString(4,num_kel);
               st.setString(5,pflag);
               st.setString(6,cflag);
     }
     rs=st.executeQuery();
     while (rs.next())
     {
       tot_rec=rs.getString(1);
     }
     rs.close();
     rs=null;
     st.close();
     st=null;
   }
       query = "begin ? := get_biodata_tampil(?,?,?,?,?,?,?,?); end;";
       stmt = conn.prepareCall(query);
       stmt.registerOutParameter(1, OracleTypes.CURSOR);
       stmt.setString(2, num_prop.trim());
       stmt.setString(3, num_kab.trim());
       stmt.setString(4, num_kec.trim());
       stmt.setString(5, num_kel.trim());
       stmt.setString(6, start.trim());
       stmt.setString(7, end.trim());
       stmt.setString(8, pflag.trim());
       stmt.setString(9, cflag.trim());
       stmt.execute();
       rs = (ResultSet)stmt.getObject(1);
       while (rs.next())
       {
         String no_kk = rs.getString("NO_KK");
         String nik = rs.getString("NIK");
         String nama_lgkp = rs.getString("NAMA_LGKP");
         String jenis_klmin = rs.getString("JENIS_KLMIN");
         String alamat = rs.getString("ALAMAT");
         obj = new BiodataWNIObject(no_kk, nik, nama_lgkp, jenis_klmin, alamat, pflag, cflag);
         vData.addElement(obj);
       }
   rs.close();
   rs = null;
   stmt.close();
   stmt = null;
   conn.close();
 } catch (Exception e)
 {
   siakWriter.writeFile(e);
   e.printStackTrace();
 }
 finally{
   try{
         if (rs!=null) rs.close();
   }catch(Exception err)    {    }

   try{
     if (stmt!=null) stmt.close();

   }catch(Exception err1)    {    }

   try{
     if (conn!=null) conn.close();
   }catch(Exception err2)   {   }

}
 return vData;
}

public Vector getAllDataP4B(String num_prop,String num_kab,String num_kec,String num_kel,String start,String end,String pflag,String cflag,boolean flag)
    {

      Vector vData = new Vector();
      ConnectorDB connectorDb = new ConnectorDB();
      BiodataWNIObject obj=null;
      Connection conn=null;
      ResultSet rs = null;
      CallableStatement stmt = null;
      String query = "";
      PreparedStatement st=null;
      conn=connectorDb.getConnection();

try{
      if (flag==false)
           {
        if (pflag.trim().equals("Y") && cflag.trim().equals("Y"))
            {
              query="select count(*) cnt from biodata_wni_p4b where no_prop=? and no_kab=? and no_kec=? and no_kel=? and pflag in('Y','N') and cflag='N'";
              st=conn.prepareStatement(query);
              st.setString(1,num_prop);
              st.setString(2,num_kab);
              st.setString(3,num_kec);
              st.setString(4,num_kel);
            }
           else if (pflag.trim().equals("Y") && cflag.trim().equals("N"))
           {
             query="select count(*) cnt from biodata_wni_p4b where no_prop=? and no_kab=? and no_kec=? and no_kel=? and pflag in('Y') and cflag='N'";
             st=conn.prepareStatement(query);
             st.setString(1,num_prop);
             st.setString(2,num_kab);
             st.setString(3,num_kec);
             st.setString(4,num_kel);
           }
          else
          {
            query= "select count(*) cnt from biodata_wni_p4b where no_prop=? and no_kab=? and no_kec=? and no_kel=? and pflag=? and cflag=?";
            st=conn.prepareStatement(query);
            st.setString(1,num_prop);
            st.setString(2,num_kab);
            st.setString(3,num_kec);
            st.setString(4,num_kel);
            st.setString(5,pflag);
            st.setString(6,cflag);
          }
          rs=st.executeQuery();
          while (rs.next())
          {
            tot_rec_p4b=rs.getString(1);
          }

          rs.close() ;
          rs=null;
          st.close();
          st=null;
        }
         query = "begin ? := get_bio_tampil_p4b(?,?,?,?,?,?,?,?); end;";//// gak ada
         stmt = conn.prepareCall(query);
         stmt.registerOutParameter(1, OracleTypes.CURSOR);
         stmt.setString(2, num_prop.trim());
         stmt.setString(3, num_kab.trim());
         stmt.setString(4, num_kec.trim());
         stmt.setString(5, num_kel.trim());
         stmt.setString(6, start.trim());
         stmt.setString(7, end.trim());
         stmt.setString(8, pflag.trim());
         stmt.setString(9, cflag.trim());
         stmt.execute();
         rs = (ResultSet)stmt.getObject(1);
     while (rs.next())
       {
       String no_kk = rs.getString("NO_KK");
       String nik = rs.getString("NIK");
       String nama_lgkp = rs.getString("NAMA_LGKP");
       String jenis_klmin = rs.getString("JENIS_KLMIN");
       String alamat = rs.getString("ALAMAT");
       obj = new BiodataWNIObject(no_kk, nik, nama_lgkp, jenis_klmin, alamat, pflag, cflag);
       vData.addElement(obj);
      }
     rs.close();
     rs = null;
     stmt.close();
     stmt = null;
     conn.close();
   } catch (Exception e)
     {
     siakWriter.writeFile(e);
     e.printStackTrace();
   }
   finally{
     try{
           if (rs!=null) rs.close();
     }catch(Exception err)    {    }

     try{
       if (stmt!=null) stmt.close();

     }catch(Exception err1)    {    }

     try{
       if (conn!=null) conn.close();
     }catch(Exception err2)   {   }

  }
  return vData;
}

public Vector getAllDataWna(String num_prop,String num_kab,String start,String end,String pflag,String cflag,boolean flag)
    {
      Vector vData = new Vector();
      ConnectorDB connectorDb = new ConnectorDB();
      BiodataWNIObject obj=null;
      Connection conn=null;
      ResultSet rs = null;
      CallableStatement stmt = null;
      String query = "";
      PreparedStatement st=null;
      conn=connectorDb.getConnection();


   try{
         if (flag==false)
           {
           if (pflag.trim().equals("Y") && cflag.trim().equals("Y"))
            {
              query="select count(*) cnt from vw_daftar_cetak_biodata_wna where no_prop=? and no_kab=? and pflag in('Y','N') and cflag='Y'" ;
              st=conn.prepareStatement(query);
              st.setString(1,num_prop);
              st.setString(2,num_kab);
            }
           else if (pflag.trim().equals("Y") && cflag.trim().equals("N"))
           {
             query="select count(*) cnt from vw_daftar_cetak_biodata_wna where no_prop=? and no_kab=? and pflag in('Y') and cflag in('Y','N')";
             st=conn.prepareStatement(query);
             st.setString(1,num_prop);
             st.setString(2,num_kab);
           }
          else
          {
            query= "select count(*) cnt from vw_daftar_cetak_biodata_wna where no_prop=? and no_kab=? and pflag=? and cflag=?";
            st=conn.prepareStatement(query);
            st.setString(1,num_prop);
            st.setString(2,num_kab);
            st.setString(3,pflag);
            st.setString(4,cflag);
          }
          rs=st.executeQuery();
        while (rs.next())
                 {
                tot_rec_wna=rs.getString(1);
                 }
         rs.close() ;
         rs=null;
         st.close();
         st=null;
      }
         query = "begin ? := get_biodata_tampil_wna(?,?,?,?,?,?); end;";
         stmt = conn.prepareCall(query);
         stmt.registerOutParameter(1, OracleTypes.CURSOR);
         stmt.setString(2, num_prop.trim());
         stmt.setString(3, num_kab.trim());
         stmt.setString(4, start.trim());
         stmt.setString(5, end.trim());
         stmt.setString(6, pflag.trim());
         stmt.setString(7, cflag.trim());
         stmt.execute();
         rs = (ResultSet)stmt.getObject(1);
     while (rs.next())
       {
       String no_kk = rs.getString("NO_KK");
       String nik = rs.getString("NIK");
       String nama_lgkp = rs.getString("NAMA_PERTMA");
       String jenis_klmin = rs.getString("JENIS_KLMIN");
       String alamat = rs.getString("ALAMAT");
       obj = new BiodataWNIObject(no_kk, nik, nama_lgkp, jenis_klmin, alamat, pflag, cflag);
       vData.addElement(obj);
      }
     rs.close();
     rs = null;
     stmt.close();
     stmt = null;
     conn.close();
   } catch (Exception e)
     {
     siakWriter.writeFile(e);
     e.printStackTrace();
   }
   finally{
     try{
           if (rs!=null) rs.close();
     }catch(Exception err)    {    }

     try{
       if (stmt!=null) stmt.close();

     }catch(Exception err1)    {    }

     try{
       if (conn!=null) conn.close();
     }catch(Exception err2)   {   }

  }
   return vData;
  }

  public String getTotalRecord() {
    return tot_rec;
  }

  public String getTotalRecordP4B() {
    return tot_rec_p4b;
  }

       public String getTotalRecordWna()
              {
              return tot_rec_wna;
              }

}