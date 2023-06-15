package kartukeluarga;
import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;
import java.io.*;
import siaktools.logwriter.*;
import oracle.jdbc.driver.*;

public class DaftarCetakKKBean implements SessionBean
{
  private SessionContext sessionContext;

  private SiakWriter siakWriter;
  String tot_rec="";
  String tot_rec_wna="";

  public void ejbCreate() throws CreateException {
    try
    {

      System.out.println("New EJB Created");
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "DaftarCetakKKBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    /**@todo Complete this method*/
  }

  public void ejbRemove()
  {
    System.out.println("EJB Removed Called");
    }

  public void ejbActivate()
  {
    /**@todo Complete this method*/
  }
  public void ejbPassivate()
  {

  }

  public void setSessionContext(SessionContext sessionContext)
  {
    this.sessionContext = sessionContext;
  }

public Vector getAllData(String num_prop, String num_kab, String num_kec, String num_kel, String start, String end, String pflag, String cflag, boolean flag)
    {

      Vector vData = new Vector();
      ConnectorDB connectorDb = new ConnectorDB();
      DaftarKKObject obj=null;
      Connection conn=null;
      ResultSet rs = null;
      CallableStatement stmt = null;
      String query = "";
      Statement st=null;
      conn=connectorDb.getConnection();

 try{
      System.out.println("daftarkk flag=" +flag);
      if (flag==false)
           {
         /*  if (pflag.trim().equals("Y") && cflag.trim().equals("Y"))
            {
         query="select count(*) cnt from daftar_kk_wni where no_prop=" + num_prop +
            " and no_kab=" + num_kab + " and no_kec=" + num_kec  + " and no_kel=" + num_kel +
            " and pflag in('Y','N') and cflag='Y'" ;
           }
           else if (pflag.trim().equals("Y") && cflag.trim().equals("N"))
           {
             query="select count(*) cnt from daftar_kk_wni where no_prop=" + num_prop +
               " and no_kab=" + num_kab + " and no_kec=" + num_kec  + " and no_kel=" + num_kel +
                " and pflag in('Y') and cflag in('Y','N')";
           }
          else
          {
            query= "select count(*) cnt from daftar_kk_wni where no_prop=" + num_prop +
             " and no_kab=" + num_kab + " and no_kec=" + num_kec  + " and no_kel=" + num_kel +
              " and pflag='" + pflag.trim()  + "' and cflag='" +  cflag.trim() + "'";
          } */

         if (pflag.trim().equals("Y") && cflag.trim().equals("Y"))
           {

query=query+"SELECT /*+ FIRST_ROWS */";
query=query+"       COUNT (*)";
query=query+"  FROM (SELECT   data_keluarga.no_kk, GETGELARKK(data_keluarga.no_kk) nama_kep,";
query=query+"                 UPPER (data_keluarga.alamat) alamat,";
query=query+"                 DECODE (data_keluarga.no_rt,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         TO_CHAR (data_keluarga.no_rt, '000')";
query=query+"                        ) no_rt,";
query=query+"                 DECODE (data_keluarga.no_rw,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         TO_CHAR (data_keluarga.no_rw, '000')";
query=query+"                        ) no_rw,";
query=query+"                 DECODE (data_keluarga.kode_pos,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         data_keluarga.kode_pos";
query=query+"                        ) kode_pos,";
query=query+"                 data_keluarga.no_prop, data_keluarga.no_kab,";
query=query+"                 data_keluarga.no_kec, data_keluarga.no_kel,";
query=query+"                 data_keluarga.pflag, data_keluarga.cflag";
query=query+"            FROM data_keluarga";
query=query+"           WHERE EXISTS (SELECT biodata_wni.no_kk";
query=query+"                           FROM biodata_wni";
query=query+"                          WHERE biodata_wni.no_kk = data_keluarga.no_kk)";
query=query+"             AND data_keluarga.tgl_insertion IS NOT NULL";
query=query+"             AND data_keluarga.no_prop = "+num_prop;
query=query+"             AND data_keluarga.no_kab = "+num_kab;
query=query+"             AND data_keluarga.no_kec = "+num_kec;
query=query+"             AND data_keluarga.no_kel = "+num_kel;
query=query+"             AND data_keluarga.pflag in('Y','N')";
query=query+"             AND data_keluarga.cflag = 'Y'";
query=query+"        ORDER BY data_keluarga.tgl_insertion DESC) daftar_kk_wni";
         }
else if (pflag.trim().equals("Y") && cflag.trim().equals("N"))
          {
query=query+"SELECT /*+ FIRST_ROWS */";
query=query+"       COUNT (*)";
query=query+"  FROM (SELECT   data_keluarga.no_kk, GETGELARKK(data_keluarga.no_kk) nama_kep,";
query=query+"                 UPPER (data_keluarga.alamat) alamat,";
query=query+"                 DECODE (data_keluarga.no_rt,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         TO_CHAR (data_keluarga.no_rt, '000')";
query=query+"                        ) no_rt,";
query=query+"                 DECODE (data_keluarga.no_rw,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         TO_CHAR (data_keluarga.no_rw, '000')";
query=query+"                        ) no_rw,";
query=query+"                 DECODE (data_keluarga.kode_pos,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         data_keluarga.kode_pos";
query=query+"                        ) kode_pos,";
query=query+"                 data_keluarga.no_prop, data_keluarga.no_kab,";
query=query+"                 data_keluarga.no_kec, data_keluarga.no_kel,";
query=query+"                 data_keluarga.pflag, data_keluarga.cflag";
query=query+"            FROM data_keluarga";
query=query+"           WHERE EXISTS (SELECT biodata_wni.no_kk";
query=query+"                           FROM biodata_wni";
query=query+"                          WHERE biodata_wni.no_kk = data_keluarga.no_kk)";
query=query+"             AND data_keluarga.tgl_insertion IS NOT NULL";
query=query+"             AND data_keluarga.no_prop = "+num_prop;
query=query+"             AND data_keluarga.no_kab = "+num_kab;
query=query+"             AND data_keluarga.no_kec = "+num_kec;
query=query+"             AND data_keluarga.no_kel = "+num_kel;
query=query+"             AND data_keluarga.pflag ='Y'";
query=query+"             AND data_keluarga.cflag in('Y','N')";
query=query+"        ORDER BY data_keluarga.tgl_insertion DESC) daftar_kk_wni";
       }

else
         {
query=query+"SELECT /*+ FIRST_ROWS */";
query=query+"       COUNT (*)";
query=query+"  FROM (SELECT   data_keluarga.no_kk, GETGELARKK(data_keluarga.no_kk) nama_kep,";
query=query+"                 UPPER (data_keluarga.alamat) alamat,";
query=query+"                 DECODE (data_keluarga.no_rt,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         TO_CHAR (data_keluarga.no_rt, '000')";
query=query+"                        ) no_rt,";
query=query+"                 DECODE (data_keluarga.no_rw,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         TO_CHAR (data_keluarga.no_rw, '000')";
query=query+"                        ) no_rw,";
query=query+"                 DECODE (data_keluarga.kode_pos,";
query=query+"                         NULL, '-',";
query=query+"                         0, '-',";
query=query+"                         data_keluarga.kode_pos";
query=query+"                        ) kode_pos,";
query=query+"                 data_keluarga.no_prop, data_keluarga.no_kab,";
query=query+"                 data_keluarga.no_kec, data_keluarga.no_kel,";
query=query+"                 data_keluarga.pflag, data_keluarga.cflag";
query=query+"            FROM data_keluarga";
query=query+"           WHERE EXISTS (SELECT biodata_wni.no_kk";
query=query+"                           FROM biodata_wni";
query=query+"                          WHERE biodata_wni.no_kk = data_keluarga.no_kk)";
query=query+"             AND data_keluarga.tgl_insertion IS NOT NULL";
query=query+"             AND data_keluarga.no_prop = "+num_prop;
query=query+"             AND data_keluarga.no_kab = "+num_kab;
query=query+"             AND data_keluarga.no_kec = "+num_kec;
query=query+"             AND data_keluarga.no_kel = "+num_kel;
query=query+"             AND data_keluarga.pflag ='"+pflag.trim()+"'";
query=query+"             AND data_keluarga.cflag ='"+cflag.trim()+"'";
query=query+"        ORDER BY data_keluarga.tgl_insertion DESC) daftar_kk_wni";
}


          System.out.println(query);

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
         query = "begin ? := get_kk_tampil(?,?,?,?,?,?,?,?); end;";
         stmt = conn.prepareCall(query);


         System.out.println("STEP 4");

         stmt.registerOutParameter(1, OracleTypes.CURSOR);
         System.out.println("STEP 5");
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
              String nama_kep = rs.getString("NAMA_KEP");
              String alamat = rs.getString("ALAMAT");
              String no_rt = rs.getString("NO_RT");
              String no_rw = rs.getString("NO_RW");
              String kode_pos = rs.getString("KODE_POS");
              obj = new DaftarKKObject(no_kk, nama_kep, alamat, pflag, cflag,
                                       no_rt, no_rw, kode_pos);
              vData.addElement(obj);
       }

     rs.close();
     rs = null;
     stmt.close();
     stmt = null;
     conn.close();
   }
   catch (Exception e)
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

public Vector getSpecifickk(String no_kk, String printed, String changed, String no_prop, String no_kab, String no_kec, String no_kel)
  {
            Vector vData = new Vector();
            ConnectorDB connectorDb = new ConnectorDB();
            DaftarKKObject obj=null;
            Connection conn=null;
            ResultSet rs = null;
            CallableStatement stmt = null;
            String query = "";
            Statement st=null;
            conn=connectorDb.getConnection();

           try{

               query = "begin ? := get_kk_specific(?,?,?,?,?,?,?); end;";
               stmt = conn.prepareCall(query);
               System.out.println("getspesifik kk : "+no_kk.trim());
               stmt.registerOutParameter(1, OracleTypes.CURSOR);
               stmt.setString(2, no_kk.trim());
               stmt.setString(3, no_prop.trim());
               stmt.setString(4, no_kab.trim());
               stmt.setString(5, no_kec.trim());
               stmt.setString(6, no_kel.trim());
               stmt.setString(7, printed.trim());
               stmt.setString(8, changed.trim());

               stmt.execute();

               rs = (ResultSet)stmt.getObject(1);
               int jumlahrecord=0;

               while (rs.next())
              {
                 String num_kk = rs.getString("NO_KK");
                 String nama_kep = rs.getString("NAMA_KEP");
                 String alamat = rs.getString("ALAMAT");
                 String no_rt = rs.getString("NO_RT");
                 String no_rw = rs.getString("NO_RW");
                 String kode_pos = rs.getString("KODE_POS");
                 obj = new DaftarKKObject(num_kk, nama_kep, alamat, printed, changed,
                                          no_rt, no_rw, kode_pos);
                 vData.addElement(obj);
                 jumlahrecord=jumlahrecord+1;
         }

           System.out.println("daftarCetakKK getkkspesifik jumlah baris : "+jumlahrecord );
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

public Vector getAllDataWna(String num_prop, String num_kab, String start, String end, String pflag, String cflag, boolean flag)
             {
               Vector vData = new Vector();
               ConnectorDB connectorDb = new ConnectorDB();
               DaftarKKObject obj=null;
               Connection conn=null;
               ResultSet rs = null;
               CallableStatement stmt = null;
               String query = "";
               Statement st=null;
               conn=connectorDb.getConnection();
      try{

            if (flag==false)
                    {
                    if (pflag.trim().equals("Y") && cflag.trim().equals("Y"))
                     {
                  query="select count(*) cnt from daftar_kk where no_prop=" + num_prop +
                     " and no_kab=" + num_kab + " and pflag in('Y','N') and cflag='Y'" ;
                    }
                    else if (pflag.trim().equals("Y") && cflag.trim().equals("N"))
                    {
                      query="select count(*) cnt from daftar_kk where no_prop=" + num_prop +
                        " and no_kab=" + num_kab + " and pflag in('Y') and cflag in('Y','N')";
                    }
                   else
                   {
                     query= "select count(*) cnt from daftar_kk where no_prop=" + num_prop +
                      " and no_kab=" + num_kab + " and pflag='" + pflag.trim()  + "' and cflag='" +  cflag.trim() + "'";
                   }

                   System.out.println(query);
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

              query = "begin ? := get_kk_tampil_wna(?,?,?,?,?,?); end;";
                  stmt = conn.prepareCall(query);

                  System.out.println("STEP 4");

                  stmt.registerOutParameter(1, OracleTypes.CURSOR);
                  System.out.println("STEP 5");
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
                       String nama_kep = rs.getString("NAMA_KEP");
                       String alamat = rs.getString("ALAMAT");
                       String no_rt = rs.getString("NO_RT");
                       String no_rw = rs.getString("NO_RW");
                       String kode_pos = rs.getString("KODE_POS");
                       obj = new DaftarKKObject(no_kk, nama_kep, alamat, pflag, cflag,
                                                no_rt, no_rw, kode_pos);
                       vData.addElement(obj);
                    }
              rs.close();
              rs = null;
              stmt.close();
              stmt = null;
              conn.close();
            }
            catch (Exception e)
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

public String getTotalRecordWna()
                   {
                   return tot_rec_wna;
                   }

public Vector getSpecifickkWna(String no_kk, String printed, String changed, String no_prop, String no_kab)
 {
                               Vector vData = new Vector();
                               ConnectorDB connectorDb = new ConnectorDB();
                               DaftarKKObject obj=null;
                               Connection conn=null;
                               ResultSet rs = null;
                               CallableStatement stmt = null;
                               String query = "";
                               Statement st=null;
                               conn=connectorDb.getConnection();

                              try{
                                 query = "begin ? := get_kk_specific_wna(?,?,?,?,?); end;";
                                  stmt = conn.prepareCall(query);

                                  stmt.registerOutParameter(1, OracleTypes.CURSOR);
                                  stmt.setString(2, no_kk.trim());
                                  stmt.setString(3, no_prop.trim());
                                  stmt.setString(4, no_kab.trim());
                                  stmt.setString(5, printed.trim());
                                  stmt.setString(6, changed.trim());

                                  stmt.execute();

                                  rs = (ResultSet)stmt.getObject(1);

                                  while (rs.next())
                                 {
                                    String num_kk = rs.getString("NO_KK");
                                    String nama_kep = rs.getString("NAMA_KEP");
                                    String alamat = rs.getString("ALAMAT");
                                    String no_rt = rs.getString("NO_RT");
                                    String no_rw = rs.getString("NO_RW");
                                    String kode_pos = rs.getString("KODE_POS");
                                    obj = new DaftarKKObject(num_kk, nama_kep, alamat, printed, changed,
                                                             no_rt, no_rw, kode_pos);
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
  public Vector getSpecifickkbanyak(String no_kk, String printed, String changed, String no_prop, String no_kab, String no_kec, String no_kel) {
    /**@todo Complete this method*/
    Vector vData = new Vector();
    ConnectorDB connectorDb = new ConnectorDB();
    DaftarKKObject obj=null;
    Connection conn=null;
    ResultSet rs = null;
    String query = "";
    Statement st=null;
    conn=connectorDb.getConnection();
   try
   {
    //((stat_print='Y') AND (stat_change='Y'))
     if (printed.equals("Y") && changed.equals("Y") )
     {
       query = "SELECT no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos, no_prop, no_kab," +
       "no_kec, no_kel, pflag, cflag   FROM data_keluarga " +
       " WHERE no_kk IN("+ no_kk + ")  AND NO_PROP="+no_prop+" " +
       " AND no_kab="+ no_kab +" AND no_kec="+no_kec+" AND no_kel="+no_kel+" " +
       " AND pflag IN('Y','N') AND cflag='"+changed+"'";

     }
     else if (printed.equals("Y") && changed.equals("N") )
     {
       query ="SELECT no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos, no_prop, no_kab," +
       "no_kec, no_kel, pflag, cflag   FROM data_keluarga " +
       " WHERE no_kk IN("+ no_kk + ")  AND NO_PROP="+no_prop+" " +
       " AND no_kab="+ no_kab +" AND no_kec="+ no_kec +" AND no_kel="+ no_kel +" " +
       " AND pflag IN('Y') AND cflag IN('Y','N')";

     }
     else {
       query ="SELECT no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos, no_prop, no_kab," +
       "no_kec, no_kel, pflag, cflag   FROM data_keluarga " +
       " WHERE no_kk IN("+ no_kk + ")  AND NO_PROP="+no_prop+" " +
       " AND no_kab="+ no_kab +" AND no_kec="+ no_kec +" AND no_kel="+ no_kel +" " +
       " AND pflag='"+printed+"' AND cflag='"+changed+"'";

     }
     //ambil data

     rs = conn.prepareStatement(query).executeQuery();
        while (rs.next())
        {
            String dekk = rs.getString("no_kk");
            String denama = rs.getString("nama_kep");
            String dealamat = rs.getString("alamat");
            String dert = rs.getString("no_rt");
            String derw = rs.getString("no_rw");
            String depos = rs.getString("kode_pos");
            String deprop = rs.getString("no_prop");
            String dekab = rs.getString("no_kab");
            String dekec = rs.getString("no_kec");
            String dekel = rs.getString("no_kel");
            String depflag = rs.getString("pflag");
            String decflag = rs.getString("cflag");

            obj = new DaftarKKObject(dekk,denama,dealamat,dert,derw,depos,deprop,dekab,dekec,dekel,depflag,decflag);

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
  public Vector getSpecifickknamabanyak(String no_kk, String printed, String changed, String no_prop, String no_kab, String no_kec, String no_kel) {
    /**@todo Complete this method*/
    Vector vData = new Vector();
    ConnectorDB connectorDb = new ConnectorDB();
    DaftarKKObject obj=null;
    Connection conn=null;
    ResultSet rs = null;
    String query = "";
    Statement st=null;
    conn=connectorDb.getConnection();
   try
   {
    //((stat_print='Y') AND (stat_change='Y'))
     if (printed.equals("Y") && changed.equals("Y") )
     {
       query = "SELECT no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos, no_prop, no_kab," +
       "no_kec, no_kel, pflag, cflag   FROM data_keluarga " +
       " WHERE nama_kep LIKE '%"+ no_kk + "%'  AND NO_PROP="+no_prop+" " +
       " AND no_kab="+ no_kab +" AND no_kec="+no_kec+" AND no_kel="+no_kel+" " +
       " AND pflag IN('Y','N') AND cflag='"+changed+"'";

     }
     else if (printed.equals("Y") && changed.equals("N") )
     {
       query ="SELECT no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos, no_prop, no_kab," +
       "no_kec, no_kel, pflag, cflag   FROM data_keluarga " +
       " WHERE nama_kep LIKE '%"+ no_kk + "%'  AND NO_PROP="+no_prop+" " +
       " AND no_kab="+ no_kab +" AND no_kec="+ no_kec +" AND no_kel="+ no_kel +" " +
       " AND pflag IN('Y') AND cflag IN('Y','N')";

     }
     else {
       query ="SELECT no_kk, nama_kep, alamat, no_rt, no_rw, kode_pos, no_prop, no_kab," +
       "no_kec, no_kel, pflag, cflag   FROM data_keluarga " +
       " WHERE nama_kep LIKE '%"+ no_kk + "%'  AND NO_PROP="+no_prop+" " +
       " AND no_kab="+ no_kab +" AND no_kec="+ no_kec +" AND no_kel="+ no_kel +" " +
       " AND pflag='"+printed+"' AND cflag='"+changed+"'";

     }
     //ambil data

     rs = conn.prepareStatement(query).executeQuery();
        while (rs.next())
        {
            String dekk = rs.getString("no_kk");
            String denama = rs.getString("nama_kep");
            String dealamat = rs.getString("alamat");
            String dert = rs.getString("no_rt");
            String derw = rs.getString("no_rw");
            String depos = rs.getString("kode_pos");
            String deprop = rs.getString("no_prop");
            String dekab = rs.getString("no_kab");
            String dekec = rs.getString("no_kec");
            String dekel = rs.getString("no_kel");
            String depflag = rs.getString("pflag");
            String decflag = rs.getString("cflag");

            obj = new DaftarKKObject(dekk,denama,dealamat,dert,derw,depos,deprop,dekab,dekec,dekel,depflag,decflag);

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

}
