package ktp.wni;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;

import kartukeluarga.*;
import siaktools.logwriter.SiakWriter;
import oracle.jdbc.driver.*;

import java.util.StringTokenizer;

public class CetakKTPBean implements SessionBean
{
  private SessionContext sessionContext;
  private Vector vKtp = new Vector();
  private SiakWriter siakWriter;
  String tot_rec="",tot_rec_wna="";

public int[] updatePrintStatus(Vector vNik, String stat_print, String stat_change) throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();

    Statement stmt = null;
    int result[] = new int[vNik.size()];
    String update="";
    Connection conn=null;
try
    {
      conn=connectorDb.getConnection();
      stmt = conn.createStatement();
for(int i=0;i<vNik.size();i++)
      {
        if(((InfoKTP)vNik.elementAt(i)).getNik().trim().startsWith("A"))
        {
            if ((stat_print.equals("1")) || (stat_print.equals("3")))
            {
              update =
                  "UPDATE BIODATA_WNA SET STAT_KTP=1,TGL_CETAK_KTP=sysdate,tgl_pjg_ktp='" +
                  ( (InfoKTP) (vNik.elementAt(i))).getTglBerlku().trim() +
                  "' WHERE NIK="
                  + ( (InfoKTP) (vNik.elementAt(i))).getNik().trim().substring(1);
            }
            else if (stat_print.equals("2"))
            {
              update =
                  "UPDATE BIODATA_WNA SET STAT_KTP=1,TGL_GANTI_KTP=sysdate " +
                  " WHERE NIK=" + ( (InfoKTP) (vNik.elementAt(i))).getNik().trim().substring(1);
            }
        }
        else
        {

          if ((stat_print.equals("1")) || (stat_print.equals("3")))
          {
            update =
                "UPDATE BIODATA_WNI SET STAT_KTP=1,TGL_CETAK_KTP=sysdate,tgl_pjg_ktp='" +
                ( (InfoKTP) (vNik.elementAt(i))).getTglBerlku().trim() +
                "' WHERE NIK='"
                + ( (InfoKTP) (vNik.elementAt(i))).getNik().trim() + "'";
          }
          else if (stat_print.equals("2"))
          {
            update =
                "UPDATE BIODATA_WNI SET STAT_KTP=1,TGL_GANTI_KTP=sysdate " +
                " WHERE NIK='" + ( (InfoKTP) (vNik.elementAt(i))).getNik().trim() + "'";
          }


        }
        //System.out.println(update);
        stmt.addBatch(update.trim());

      }

      result = stmt.executeBatch();

      for(int i=0;i<result.length;i++)
      {
        //System.out.println("result["+i+"]="+result[i]);
      }
     if(vNik.size()>0)    vNik.removeAllElements();
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

  public void ejbCreate() throws CreateException {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "CetakKTPBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    /**@todo Complete this method*/
  }

public Vector getAllData(String num_prop, String num_kab, String num_kec, String num_kel, String start, String end, String status_ktp, boolean flag)
    {
      Vector vData = new Vector();
      ConnectorDB connectorDb = new ConnectorDB();
      KTPWniObject obj=null;
      Connection conn=null;
      ResultSet rs = null;
      CallableStatement stmt = null;
      String query = "";
      Statement st=null;
      conn=connectorDb.getConnection();
      String stat_ktp=null;
      //System.out.println("start"+ start);
      //System.out.println("end"+ end);
  try{
               stat_ktp=status_ktp;
     if (flag==false)
           {
          /*
         if (status_ktp.equals("1"))
         {
           query = "select count(*) from vw_daftar_ktp_wni where no_prop=" + num_prop +
               " and no_kab=" + num_kab + " and no_kec=" + num_kec +
               " and no_kel=" + num_kel + " and stat_ktp is null";
            stat_ktp="1";
         }
         else if (status_ktp.equals("2"))
         {
           query = "select count(*) from vw_daftar_ktp_wni where no_prop=" + num_prop +
           " and no_kab=" + num_kab + " and no_kec=" + num_kec +
           " and no_kel=" + num_kel + " and stat_ktp=1" +
           " and tgl_pjg_ktp is not null and sysdate<(to_date(tgl_pjg_ktp)-30)";
           stat_ktp="2";
         }
         else if (status_ktp.equals("3"))
         {
           query = "select count(*) from vw_daftar_ktp_wni where no_prop=" + num_prop +
           " and no_kab=" + num_kab + " and no_kec=" + num_kec +
           " and no_kel=" + num_kel + " and stat_ktp=1 " +
           " and tgl_pjg_ktp is not null and sysdate>=(to_date(tgl_pjg_ktp)-30)";
           stat_ktp="3";
         }
            */

           if (status_ktp.equals("1"))
        {
       query="SELECT COUNT (*)   FROM (SELECT   /*+ ORDERED INDEX (b SYS_C003714) USE_NL (b)*/";
       query=query+" a.nik, a.nama_lgkp, TO_CHAR (a.tgl_lhr,'dd-mm-yyyy') tgl_lhr, b.alamat,";
       query=query+"a.stat_ktp, a.no_prop, a.no_kab, a.no_kec, a.no_kel,";
       query=query+"a.tgl_pjg_ktp   FROM biodata_wni a, data_keluarga b";
       query=query+" WHERE a.no_kk = b.no_kk   AND (   (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12) >= 17)";
       query=query+" OR (a.stat_kwn > 1)  )";
       query=query+"  AND a.no_prop ="+num_prop;
       query=query+" AND a.no_kab =" + num_kab;
       query=query+"  AND a.no_kec = " + num_kec;
       query=query+"  AND a.no_kel = " + num_kel;
       query=query+"  AND a.stat_ktp IS NULL";
       query=query+" ORDER BY a.tgl_entri DESC) vw_daftar_ktp_wni";
       }
else if (status_ktp.equals("2"))
        {
       query="SELECT COUNT (*)   FROM (SELECT   /*+ ORDERED INDEX (b SYS_C003714) USE_NL (b)*/";
       query=query+" a.nik, a.nama_lgkp, TO_CHAR (a.tgl_lhr,'dd-mm-yyyy') tgl_lhr, b.alamat,";
       query=query+"a.stat_ktp, a.no_prop, a.no_kab, a.no_kec, a.no_kel,";
       query=query+"a.tgl_pjg_ktp   FROM biodata_wni a, data_keluarga b";
       query=query+" WHERE a.no_kk = b.no_kk   AND (   (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12) >= 17)";
       query=query+" OR (a.stat_kwn > 1)  )";
       query=query+"  AND a.no_prop ="+num_prop;
       query=query+" AND a.no_kab =" + num_kab;
       query=query+"  AND a.no_kec = " + num_kec;
       query=query+"  AND a.no_kel = " + num_kel;
       query=query+"  AND stat_ktp=1 and tgl_pjg_ktp is not null and sysdate<(to_date(tgl_pjg_ktp)-30)";
       query=query+" ORDER BY a.tgl_entri DESC) vw_daftar_ktp_wni";
       }
else if (status_ktp.equals("3"))
        {
query="SELECT COUNT (*)   FROM (SELECT   /*+ ORDERED INDEX (b SYS_C003714) USE_NL (b)*/";
       query=query+" a.nik, a.nama_lgkp, TO_CHAR (a.tgl_lhr,'dd-mm-yyyy') tgl_lhr, b.alamat,";
       query=query+"a.stat_ktp, a.no_prop, a.no_kab, a.no_kec, a.no_kel,";
       query=query+"a.tgl_pjg_ktp   FROM biodata_wni a, data_keluarga b";
       query=query+" WHERE a.no_kk = b.no_kk   AND (   (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12) >= 17)";
       query=query+" OR (a.stat_kwn > 1)  )";
       query=query+"  AND a.no_prop ="+num_prop;
       query=query+" AND a.no_kab =" + num_kab;
       query=query+"  AND a.no_kec = " + num_kec;
       query=query+"  AND a.no_kel = " + num_kel;
       query=query+"  AND stat_ktp=1 and tgl_pjg_ktp is not null and sysdate>=(to_date(tgl_pjg_ktp)-30)";
       query=query+" ORDER BY a.tgl_entri DESC) vw_daftar_ktp_wni";
       }

          st=conn.createStatement();
          rs=st.executeQuery(query);

         while (rs.next())
                 {
                tot_rec=rs.getString(1);
                 }

         rs.close() ;
         rs=null;
         st.close();
         st=null;
      }

//     //System.out.println("begin ? := get_ktp_tampil(" + num_prop + "," + num_kab + "," + num_kec + "," + num_kel + "," + start + "," + end + "," + stat_ktp);
         query = "begin ? := get_ktp_tampil(?,?,?,?,?,?,?); end;";
         stmt = conn.prepareCall(query);
         stmt.registerOutParameter(1, OracleTypes.CURSOR);
         stmt.setString(2, num_prop.trim());
         stmt.setString(3, num_kab.trim());
         stmt.setString(4, num_kec.trim());
         stmt.setString(5, num_kel.trim());
         stmt.setString(6, start.trim());
         stmt.setString(7, end.trim());
         stmt.setString(8, stat_ktp);

      //System.out.println(stmt);
         stmt.execute();

         rs = (ResultSet)stmt.getObject(1);

     while (rs.next())
       {
       String nik = rs.getString("NIK");
       String nama_lgkp = rs.getString("NAMA_LGKP");
       String tgl_lhr = rs.getString("TGL_LHR");
       String alamat = rs.getString("ALAMAT");
       obj = new KTPWniObject(nik,nama_lgkp,tgl_lhr,alamat);
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
     }catch(Exception err2)
     {
            System.out.println("Error from BEAN");
     err2.printStackTrace();
     }

  }
   return vData;
  }

public Vector getAllDataWna(String num_prop, String num_kab, String start, String end, String status_ktp, boolean flag)
      {
        Vector vData = new Vector();
        ConnectorDB connectorDb = new ConnectorDB();
        KTPWniObject obj=null;
        Connection conn=null;
        ResultSet rs = null;
        CallableStatement stmt = null;
        String query = "";
        Statement st=null;
        conn=connectorDb.getConnection();
        String stat_ktp=null;

    try{
      stat_ktp=status_ktp;
       if (flag==false)
             {
           if (status_ktp.equals("1"))
           {
             query = "select count(*) from vw_daftar_ktp_wna where no_prop=" + num_prop +
                 " and no_kab=" + num_kab + " and stat_ktp is null";
              stat_ktp="1";
           }
           else if (status_ktp.equals("2"))
           {
             query = "select count(*) from vw_daftar_ktp_wna where no_prop=" + num_prop +
             " and no_kab=" + num_kab  + " and stat_ktp=1" +
             " and tgl_pjg_ktp is not null and sysdate<(to_date(tgl_pjg_ktp)-30)";
             stat_ktp="2";
           }
           else if (status_ktp.equals("3"))
           {
             query = "select count(*) from vw_daftar_ktp_wna where no_prop=" + num_prop +
             " and no_kab=" + num_kab  + " and stat_ktp=1 " +
             " and tgl_pjg_ktp is not null and sysdate>=(to_date(tgl_pjg_ktp)-30)";
             stat_ktp="3";
           }
           //System.out.println(query);
            st=conn.createStatement();
            rs=st.executeQuery(query);

          while (rs.next())
                   {
                  tot_rec_wna=rs.getString(1);
                   }

           rs.close() ;
           rs=null;
           st.close();
           st=null;
   }
           query = "begin ? := get_ktp_tampil_wna(?,?,?,?,?); end;";
           stmt = conn.prepareCall(query);
           stmt.registerOutParameter(1, OracleTypes.CURSOR);
           stmt.setString(2, num_prop.trim());
           stmt.setString(3, num_kab.trim());
           stmt.setString(4, start.trim());
           stmt.setString(5, end.trim());
           stmt.setString(6, stat_ktp);

           stmt.execute();

           rs = (ResultSet)stmt.getObject(1);

       while (rs.next())
         {
         String nik = rs.getString("NIK");
         String nama_lgkp = rs.getString("NAMA_PERTMA");
         String tgl_lhr = rs.getString("TGL_LHR");
         String alamat = rs.getString("ALAMAT");
         obj = new KTPWniObject(nik,nama_lgkp,tgl_lhr,alamat);
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

public Vector getSpecificNik(String nik, String no_prop, String no_kab, String no_kec, String no_kel, String status_ktp) throws RemoteException
   {
     Vector vData = new Vector();
     ConnectorDB connectorDb = new ConnectorDB();
     KTPWniObject obj=null;
     Connection conn=null;
     ResultSet rs = null;
     String query = "";
     Statement st=null;
     conn=connectorDb.getConnection();
    try
    {
      /*
      if (status_ktp.equals("1"))
          {
          query = "SELECT nik,nama_lgkp,TGL_LHR,ALAMAT,STAT_KTP,no_prop,no_kab,no_kec ";
          query = query + " FROM vw_daftar_ktp_wni ";
          query = query + " WHERE nik in( " + nik + " ) ";
          query = query + "  AND  NO_PROP= " + no_prop;
          query = query + "  AND no_kab= " + no_kab + "  AND no_kec= " + no_kec  +  " AND no_kel= " + no_kel;
          query = query + " AND stat_ktp IS NULL AND TGL_PJG_KTP IS NULL";
      }
else if (status_ktp.equals("2"))
  {
          query=" SELECT nik, nama_lgkp, TGL_LHR, ALAMAT, STAT_KTP, no_prop, " ;
             query=query + " no_kab, no_kec ";
             query=query + " FROM vw_daftar_ktp_wni " ;
             query=query + " WHERE nik IN(" + nik + ")";
             query=query + " AND NO_PROP = " + no_prop;
             query=query +  " AND no_kab = " + no_kab + " AND no_kec = " + no_kec + " AND no_kel = " + no_kel;
             query=query +  " AND stat_ktp = 1 " ;
             query=query +  " AND TGL_PJG_KTP IS NOT NULL AND SYSDATE < ";
             query=query +  " (TO_DATE(TGL_PJG_KTP) - 30)";
   }
else if (status_ktp.equals("3"))
        {
query=" SELECT nik, nama_lgkp, TGL_LHR, ALAMAT, STAT_KTP, no_prop, " ;
query=query+ "  no_kab, no_kec ";
query=query+ " FROM vw_daftar_ktp_wni ";
query=query+ "  WHERE nik IN( " + nik + ")";
query=query+ "   AND NO_PROP = " + no_prop;
query=query+ " AND no_kab = " + no_kab + " AND no_kec = " + no_kec + " AND no_kel = " + no_kel;
query=query+ "   AND stat_ktp = 1";
query=query+ "  AND TGL_PJG_KTP IS NOT NULL AND SYSDATE >= " ;
query=query+ " (TO_DATE(TGL_PJG_KTP) - 30)";
    }
          */
         if (status_ktp.equals("1"))
                {

      query=" SELECT vw_daftar_ktp_wni.nik, vw_daftar_ktp_wni.nama_lgkp,";
      query=query+ "    vw_daftar_ktp_wni.tgl_lhr, vw_daftar_ktp_wni.alamat,";
      query=query+ "         vw_daftar_ktp_wni.stat_ktp, vw_daftar_ktp_wni.no_prop,";
      query=query+ "         vw_daftar_ktp_wni.no_kab, vw_daftar_ktp_wni.no_kec";
      query=query+ "    FROM (SELECT   /*+ ORDERED USE_NL (b)*/";
      query=query+ "                   a.nik, a.nama_lgkp, TO_CHAR (a.tgl_lhr,";
      query=query+ "                                                'dd-mm-yyyy') tgl_lhr, b.alamat,";
      query=query+ "                   a.stat_ktp, a.no_prop, a.no_kab, a.no_kec, a.no_kel,";
      query=query+ "                   a.tgl_pjg_ktp";
      query=query+ "              FROM biodata_wni a, data_keluarga b";
      query=query+ "             WHERE a.no_kk = b.no_kk";
      query=query+ "               AND (   (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12) >= 17)";
      query=query+ "                    OR (a.stat_kwn > 1))";
      query=query+ "               AND a.nik in( " + nik + " ) ";
      query=query+ "               AND a.no_prop = " + no_prop;
      query=query+ "               AND a.no_kab = " + no_kab;
      query=query+ "               AND a.no_kec = " + no_kec;
      query=query+ "               AND a.no_kel = " + no_kel;
      query=query+ "               AND a.stat_ktp IS NULL";
      query=query+ "               AND a.tgl_pjg_ktp IS NULL";
      query=query+ "          ORDER BY a.tgl_entri DESC) vw_daftar_ktp_wni";
              }
      else if (status_ktp.equals("2"))
        {

      query=" SELECT vw_daftar_ktp_wni.nik, vw_daftar_ktp_wni.nama_lgkp,";
      query=query+ "    vw_daftar_ktp_wni.tgl_lhr, vw_daftar_ktp_wni.alamat,";
      query=query+ "         vw_daftar_ktp_wni.stat_ktp, vw_daftar_ktp_wni.no_prop,";
      query=query+ "         vw_daftar_ktp_wni.no_kab, vw_daftar_ktp_wni.no_kec";
      query=query+ "    FROM (SELECT   /*+ ORDERED USE_NL (b)*/";
      query=query+ "                   a.nik, a.nama_lgkp, TO_CHAR (a.tgl_lhr,";
      query=query+ "                                                'dd-mm-yyyy') tgl_lhr, b.alamat,";
      query=query+ "                   a.stat_ktp, a.no_prop, a.no_kab, a.no_kec, a.no_kel,";
      query=query+ "                   a.tgl_pjg_ktp";
      query=query+ "              FROM biodata_wni a, data_keluarga b";
      query=query+ "             WHERE a.no_kk = b.no_kk";
      query=query+ "               AND (   (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12) >= 17)";
      query=query+ "                    OR (a.stat_kwn > 1))";
      query=query+ "               AND a.nik in( " + nik + " ) ";
      query=query+ "               AND a.no_prop = " + no_prop;
      query=query+ "               AND a.no_kab = " + no_kab;
      query=query+ "               AND a.no_kec = " + no_kec;
      query=query+ "               AND a.no_kel = " + no_kel;
      query=query+ "               AND a.stat_ktp=1";
      query=query+ "               AND a.TGL_PJG_KTP IS NOT NULL AND SYSDATE < (TO_DATE(TGL_PJG_KTP) - 30)";
      query=query+ "          ORDER BY a.tgl_entri DESC) vw_daftar_ktp_wni";
      }
      else if (status_ktp.equals("3"))
              {

         query=" SELECT vw_daftar_ktp_wni.nik, vw_daftar_ktp_wni.nama_lgkp,";
      query=query+ "    vw_daftar_ktp_wni.tgl_lhr, vw_daftar_ktp_wni.alamat,";
      query=query+ "         vw_daftar_ktp_wni.stat_ktp, vw_daftar_ktp_wni.no_prop,";
      query=query+ "         vw_daftar_ktp_wni.no_kab, vw_daftar_ktp_wni.no_kec";
      query=query+ "    FROM (SELECT   /*+ ORDERED USE_NL (b)*/";
      query=query+ "                   a.nik, a.nama_lgkp, TO_CHAR (a.tgl_lhr,";
      query=query+ "                                                'dd-mm-yyyy') tgl_lhr, b.alamat,";
      query=query+ "                   a.stat_ktp, a.no_prop, a.no_kab, a.no_kec, a.no_kel,";
      query=query+ "                   a.tgl_pjg_ktp";
      query=query+ "              FROM biodata_wni a, data_keluarga b";
      query=query+ "             WHERE a.no_kk = b.no_kk";
      query=query+ "               AND (   (FLOOR (MONTHS_BETWEEN (SYSDATE, a.tgl_lhr) / 12) >= 17)";
      query=query+ "                    OR (a.stat_kwn > 1))";
      query=query+ "               AND a.nik in( " + nik + " ) ";
      query=query+ "               AND a.no_prop = " + no_prop;
      query=query+ "               AND a.no_kab = " + no_kab;
      query=query+ "               AND a.no_kec = " + no_kec;
      query=query+ "               AND a.no_kel = " + no_kel;
      query=query+ "               AND a.stat_ktp=1";
      query=query+ "               AND a.TGL_PJG_KTP IS NOT NULL AND SYSDATE >= (TO_DATE(TGL_PJG_KTP) - 30)";
      query=query+ "          ORDER BY a.tgl_entri DESC) vw_daftar_ktp_wni";
           }


    //System.out.println(query);
   rs = conn.prepareStatement(query).executeQuery();
      while (rs.next())
      {
          String nik_num = rs.getString("NIK");
          String nama_lgkp = rs.getString("NAMA_LGKP");
          String tgl_lhr = rs.getString("TGL_LHR");
          String alamat = rs.getString("ALAMAT");
          obj = new KTPWniObject(nik_num,nama_lgkp,tgl_lhr,alamat);

      vData.addElement(obj);
     }

    rs.close();
    rs = null;
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
      if (conn!=null) conn.close();
    }catch(Exception err2)   {   }
  }
  return vData;
  }

public Vector getSpecificNama(String nama, String no_prop, String no_kab, String no_kec, String no_kel, String status_ktp) throws RemoteException
     {
   StringTokenizer tokens=new StringTokenizer(nama,",");
   String nama_query="where (";
   int elementno=1;
   Vector vectornames=new Vector();
     while(tokens.hasMoreElements())
     {
       if (elementno>1) nama_query=nama_query+" or ";
       nama_query=nama_query+" UPPER(nama_lgkp) in(?)";
       vectornames.addElement(tokens.nextElement());
       elementno++;
     }
     nama_query=nama_query+")";
       Vector vData = new Vector();
       ConnectorDB connectorDb = new ConnectorDB();
       KTPWniObject obj=null;
       Connection conn=null;
       ResultSet rs = null;
       String query = "";
       conn=connectorDb.getConnection();
       PreparedStatement stmt=null;
      try
      {
        if (status_ktp.equals("1"))
            {
            query = "SELECT nik,nama_lgkp,TGL_LHR,ALAMAT,STAT_KTP,no_prop,no_kab,no_kec ";
            query = query + " FROM vw_daftar_ktp_wni ";
            query = query + nama_query;
            query = query + "  AND  NO_PROP= " + no_prop;
            query = query + "  AND no_kab= " + no_kab + "  AND no_kec= " + no_kec  +  " AND no_kel= " + no_kel;
            query = query + " AND stat_ktp IS NULL AND TGL_PJG_KTP IS NULL";
        }
      else if (status_ktp.equals("2"))
          {
            query=" SELECT nik, nama_lgkp, TGL_LHR, ALAMAT, STAT_KTP, no_prop, " ;
               query=query + " no_kab, no_kec ";
               query=query + " FROM vw_daftar_ktp_wni " ;
               query=query +  nama_query;
               query=query + " AND NO_PROP = " + no_prop;
               query=query +  " AND no_kab = " + no_kab + " AND no_kec = " + no_kec + " AND no_kel = " + no_kel;
               query=query +  " AND stat_ktp = 1 " ;
               query=query +  " AND TGL_PJG_KTP IS NOT NULL AND SYSDATE < ";
               query=query +  " (TO_DATE(TGL_PJG_KTP) - 30)";
      }
      else if (status_ktp.equals("3"))
          {
  query=" SELECT nik, nama_lgkp, TGL_LHR, ALAMAT, STAT_KTP, no_prop, " ;
  query=query+ "  no_kab, no_kec ";
  query=query+ " FROM vw_daftar_ktp_wni ";
  query=query+   nama_query;
  query=query+ "   AND NO_PROP = " + no_prop;
  query=query+ " AND no_kab = " + no_kab + " AND no_kec = " + no_kec + " AND no_kel = " + no_kel;
  query=query+ "   AND stat_ktp = 1";
  query=query+ "  AND TGL_PJG_KTP IS NOT NULL AND SYSDATE >= " ;
  query=query+ " (TO_DATE(TGL_PJG_KTP) - 30)";
      }
      stmt=conn.prepareStatement(query);
      System.out.println(query);
     for(int i=1;i<elementno;i++)
      {
        stmt.setString(i,vectornames.get(i-1).toString().toUpperCase());
      }
      rs = stmt.executeQuery();
        while (rs.next())
        {
            String nik_num = rs.getString("NIK");
            String nama_lgkp = rs.getString("NAMA_LGKP");
            String tgl_lhr = rs.getString("TGL_LHR");
            String alamat = rs.getString("ALAMAT");
            obj = new KTPWniObject(nik_num,nama_lgkp,tgl_lhr,alamat);
        vData.addElement(obj);
       }
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


public Vector getSpecificNikWna(String nik, String no_prop, String no_kab, String status_ktp) throws RemoteException
     {
       Vector vData = new Vector();
       ConnectorDB connectorDb = new ConnectorDB();
       KTPWniObject obj=null;
       Connection conn=null;
       ResultSet rs = null;
       CallableStatement stmt = null;
       String query = "";
       Statement st=null;
       conn=connectorDb.getConnection();
     try
      {
          query = "begin ? := get_ktp_specific_wna(?,?,?,?); end;";
          stmt = conn.prepareCall(query);
          stmt.registerOutParameter(1, OracleTypes.CURSOR);
          stmt.setString(2, nik.trim());
          stmt.setString(3, no_prop.trim());
          stmt.setString(4, no_kab.trim());
          stmt.setString(5, status_ktp);
          stmt.execute();

          rs = (ResultSet)stmt.getObject(1);

        while (rs.next())
        {
            String nik_num = rs.getString("NIK");
            String nama_lgkp = rs.getString("NAMA_PERTMA");
            String tgl_lhr = rs.getString("TGL_LHR");
            String alamat = rs.getString("ALAMAT");
            obj = new KTPWniObject(nik_num,nama_lgkp,tgl_lhr,alamat);

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


public String getTotalRecord()
         {
         return tot_rec;
         }

public String getTotalRecordWna()
                 {
                 return tot_rec_wna;
                 }
  public String FileTandaTangan(String deprop,String dekab,String dekec,String dekel) {
    String kembali="";
     Connection conn=null;
     ConnectorDB connectorDb = new ConnectorDB();
     ResultSet rs = null;
     Statement stmt = null;
     try
     {
       conn = connectorDb.getConnection();
       stmt = conn.createStatement();

       String query = "select FILE_TTD from setup_kel where no_prop=" + deprop + "and no_kab=" +
       dekab + "and no_kec=" + dekec + "and no_kel=" + dekel;

       rs = stmt.executeQuery(query.trim());
       while (rs.next()) {
        kembali = rs.getString("FILE_TTD");
        }

        if(rs!=null) {rs.close();}

        if(stmt!=null) {stmt.close();}

     }
     catch(Exception e) {
       e.printStackTrace();
       //siakWriter.writeFile(e);
     }


     return kembali;

  }


}