package com.wilayah;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;

import jmlpddk.agama.InfoWilayah;
import jmlpddk.agama.ListProp;
import jmlpddk.agama.ListKab;
import jmlpddk.agama.ListKec;
import jmlpddk.agama.ListKel;
import kartukeluarga.DataKelurahan;

public class WilayahSettingModuleBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector getDataKecamatan(String no_prop, String no_kab) throws RemoteException
  {
    Vector vDataKec = new Vector();
    Connection conn=null;
    Statement stmt = null;
    ResultSet rs = null;
    ListKec dataKec = null;
    try
     {
       ConnectorDB connectorDb = new ConnectorDB();
       conn = connectorDb.getConnection();
       stmt = conn.createStatement();

       String q = "SELECT NO_KEC,NAMA_KEC FROM SETUP_KEC WHERE NO_PROP="+no_prop+" AND NO_KAB="+no_kab + " order by no_prop,no_kab,no_kec";
       System.out.println(q);
       stmt = conn.createStatement();

       rs = stmt.executeQuery(q.trim());
       while(rs.next())
       {
         String nama_kec = rs.getString("NAMA_KEC");
         String no_kec = rs.getString("NO_KEC");

         dataKec = new ListKec(no_kec, nama_kec, no_kab, no_prop);
         vDataKec.addElement(dataKec);
       }
       rs.close();
       rs=null;
       stmt.close();
       stmt=null;
       conn.close();
       conn=null;

     }
     catch(Exception e)
     {
       e.printStackTrace();
     }

     finally
     {
     try {
       if (rs != null)    rs.close();
        }
     catch (Exception e)
     {
       siakWriter.writeFile(e);
     }
     try {
       if (stmt  != null)  stmt.close();

     } catch (Exception e2)
     {
       siakWriter.writeFile(e2);
     }


     try {
       if (conn != null) {
         conn.close();
       }
     }
     catch (Exception e1)
     {
       siakWriter.writeFile(e1);
     }
   }

  return vDataKec;
  }
  public Vector getDataKabupaten(String no_prop) throws RemoteException
  {
    Vector vDataKab = new Vector();
    Connection conn=null;
    Statement stmt = null;
    ResultSet rs = null;
    ListKab dataKab = null;
    try
     {
       ConnectorDB connectorDb = new ConnectorDB();
       conn = connectorDb.getConnection();
       stmt = conn.createStatement();

       String q = "SELECT NO_KAB,NAMA_KAB FROM SETUP_KAB WHERE NO_PROP="+no_prop + " order by no_prop,no_kab";
       System.out.println(q);
       stmt = conn.createStatement();

       rs = stmt.executeQuery(q.trim());
       while(rs.next())
       {
         String nama_kab = rs.getString("NAMA_KAB");
         String no_kab = rs.getString("NO_KAB");

         dataKab = new ListKab(no_kab, nama_kab, no_prop);
         vDataKab.addElement(dataKab);
       }
       rs.close();
       rs=null;
       stmt.close();
       stmt=null;
       conn.close();
       conn=null;

     }
     catch(Exception e)
     {
       e.printStackTrace();
     }

     finally
   {
     try {
       if (rs != null)    rs.close();
        }
     catch (Exception e)
     {
       siakWriter.writeFile(e);
     }
     try {
       if (stmt  != null)  stmt.close();

     } catch (Exception e2)
     {
       siakWriter.writeFile(e2);
     }


     try {
       if (conn != null) {
         conn.close();
       }
     }
     catch (Exception e1)
     {
       siakWriter.writeFile(e1);
     }
   }

  return vDataKab;

  }

  public Vector getDataKelurahan(String no_prop,String no_kab,String no_kec) throws RemoteException
  {
    Vector vDataKelurahan = new Vector();
    Connection conn=null;
    Statement stmt = null;
    ResultSet rsSetup_kel = null;

    try
     {
       ConnectorDB connectorDb = new ConnectorDB();
       conn = connectorDb.getConnection();
       stmt = conn.createStatement();
       DataKelurahan dataKelurahan = null;

       String q = "SELECT NO_KEL,NAMA_KEL FROM SETUP_KEL WHERE NO_PROP="+no_prop
           +" AND NO_KAB="+no_kab+" AND NO_KEC="+no_kec+" order by no_prop,no_kab,no_kec,no_kel";
       System.out.println(q);
       stmt = conn.createStatement();

       rsSetup_kel = stmt.executeQuery(q.trim());
       while(rsSetup_kel.next())
       {
         String nama_kel = rsSetup_kel.getString("NAMA_KEL");
         String no_kel = rsSetup_kel.getString("NO_KEL");

         dataKelurahan = new DataKelurahan(no_kel, nama_kel);
         vDataKelurahan.addElement(dataKelurahan);
       }
       rsSetup_kel.close();
       rsSetup_kel=null;
       stmt.close();
       stmt=null;
       conn.close();
       conn=null;

     }
     catch(Exception e)
     {
       e.printStackTrace();
     }

     finally
   {
     try {
       if (rsSetup_kel != null)    rsSetup_kel.close();
        }
     catch (Exception e)
     {
       siakWriter.writeFile(e);
     }
     try {
       if (stmt  != null)  stmt.close();

     } catch (Exception e2)
     {
       siakWriter.writeFile(e2);
     }


     try {
       if (conn != null) {
         conn.close();
       }
     }
     catch (Exception e1)
     {
       siakWriter.writeFile(e1);
     }
   }

  return vDataKelurahan;
 }


  public InfoWilayah getListWilayah() throws RemoteException
  {
    Connection conn=null;
    System.out.println("PUSATAA");
    InfoWilayah dataWilayah = null;

    ResultSet rs1= null, rs2= null, rs3 = null,rs4=null;
    PreparedStatement ps1 = null, ps2 = null, ps3 = null,ps4=null;
    String query = "";
    Vector vProp=null,vKab=null,vKec=null,vKel=null;
    String sql1;
    Statement st_tot ;
    ResultSet rs_tot;

    try
    {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();

      if (conn != null)
      {
        query =
            "select trim(to_char(no_prop,'00')) no_prop,nama_prop from setup_prop order by no_prop";
        ps1 = conn.prepareStatement(query);
        //sql = "select no_prop,nama_prop from setup_prop order by no_prop";
        rs1 = ps1.executeQuery();
        vProp = new Vector();

        if (rs1 != null)
        {
          while (rs1.next())
          {
   ListProp propObj = new ListProp(rs1.getString("no_prop"),
                                           rs1.getString("nama_prop"));
 sql1 = "select distinct tot_kab from jumlah_wilayah where no_prop=" + rs1.getString("no_prop");

          st_tot = conn.createStatement();
          rs_tot = st_tot.executeQuery(sql1);

        while (rs_tot.next())
                                 {
//                                 System.out.println(" Inside while loop for prop execure !!!!! ");
                                   propObj.setTotKab(rs_tot.getString("tot_kab"));
                                 }
               vProp.addElement(propObj);          //adding every record into vector
               rs_tot.close();
               st_tot.close();
          }
        }
        rs1.close();
        ps1.close();
        rs1=null;
        ps1=null;

       query = "select trim(to_char(no_kab,'00')) no_kab,nama_kab,trim(to_char(no_prop,'00')) no_prop from setup_kab order by no_prop,no_kab";
        ps2 = conn.prepareStatement(query);
        //sql1 = "select no_kab,nama_kab from setup_kab order by no_kab";
        rs2 = ps2.executeQuery();
        vKab = new Vector();
        if (rs2 != null)
        {
          while (rs2.next())
          {
           ListKab kabObj = new ListKab(rs2.getString("no_kab"),
                                         rs2.getString("nama_kab"),
                                         rs2.getString("no_prop"));

        sql1 = "select distinct tot_kec from jumlah_wilayah where no_prop=" +
          rs2.getString("no_prop") + " and no_kab=" +
          rs2.getString("no_kab");

                st_tot = conn.createStatement();
                rs_tot = st_tot.executeQuery(sql1);

          while (rs_tot.next()) {
                kabObj.setTotKec(rs_tot.getString("tot_kec"));
                }
             vKab.addElement(kabObj);     //adding every record into vector
                 rs_tot.close();
                 st_tot.close();
          }
        }

        rs2.close();
        ps2.close();
        rs2=null;
        ps2=null;
  query = "select trim(to_char(no_kec,'00')) no_kec,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kec order by no_prop,no_kab,no_kec";

        ps3 = conn.prepareStatement(query);
        //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
        rs3 = ps3.executeQuery();
        vKec = new Vector();

        if (rs3 != null) {

          while (rs3.next())
          {
            ListKec kecObj = new ListKec(rs3.getString("no_kec"),
                                         rs3.getString("nama_kec"),
                                         rs3.getString("no_kab"),
                                         rs3.getString("no_prop"));
           sql1 = "select tot_kel from jumlah_wilayah where no_prop=" +
           rs3.getString("no_prop") + " and no_kab=" +
           rs3.getString("no_kab") + " and no_kec=" +
           rs3.getString("no_kec");

                  st_tot = conn.createStatement();
                  rs_tot = st_tot.executeQuery(sql1);

          while (rs_tot.next()) {
                 kecObj.setTotKel(rs_tot.getString("tot_kel"));
              }

            vKec.addElement(kecObj); //adding every record into vector
            rs_tot.close();
            st_tot.close();
          }
        }
        rs3.close();
        ps3.close();
        rs3=null;
        ps3=null;

        query = "select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kel order by no_prop,no_kab,no_kec,no_kel";

        ps4 = conn.prepareStatement(query);
        //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
        rs4 = ps4.executeQuery();
        vKel = new Vector();
        if (rs4 != null) {
          while (rs4.next())
          {
            ListKel kelObj = new ListKel(rs4.getString("no_kel"),
                                                   rs4.getString("nama_kel"),
                                                   rs4.getString("no_kec"),
                                                   rs4.getString("no_kab"),
                                                   rs4.getString("no_prop"));

            vKel.addElement(kelObj);
          }
        }
        rs4.close();
        ps4.close();
        rs4=null;
        ps4=null;

      }
      dataWilayah = new InfoWilayah(vProp, vKab, vKec, vKel);
      conn.close();
    }
    catch (Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    finally
    {
      try {
        if (rs1 != null) {
          rs1.close();
        }
        if (rs2 != null) {
          rs2.close();
        }
        if (rs3 != null) {
          rs3.close();
        }

      }
      catch (Exception e)
      {
        siakWriter.writeFile(e);
      }
      try {
        if (ps1 != null) {
          ps1.close();
        }
        if (ps2 != null) {
          ps2.close();
        }
        if (ps3 != null) {
          ps3.close();
        }

      }
      catch (Exception e2)
      {
        siakWriter.writeFile(e2);
      }


      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e1)
      {
        siakWriter.writeFile(e1);
      }
    }
    return dataWilayah;
}

  public InfoWilayah getListWilayahPusat() throws RemoteException
  {
    Connection conn=null;
    System.out.println("PUSATA getListWilayahPusat");
    InfoWilayah dataWilayah = null;

    ResultSet rs1= null, rs2= null, rs3 = null;
    PreparedStatement ps1 = null, ps2 = null, ps3 = null;
    String query = "";
    Vector vProp=null,vKab=null,vKec=null;
    String sql1="";
    Statement st_tot=null;
    ResultSet rs_tot=null;

    try
    {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = connectorDb.getConnection();

      if (conn != null)
      {
        query =
            "select trim(to_char(no_prop,'00')) no_prop,nama_prop from setup_prop order by no_prop";
        ps1 = conn.prepareStatement(query);
        //sql = "select no_prop,nama_prop from setup_prop order by no_prop";
        rs1 = ps1.executeQuery();
        vProp = new Vector();
        if (rs1 != null)
        {
          while (rs1.next())
          {
            ListProp propObj = new ListProp(rs1.getString("no_prop"),
                                            rs1.getString("nama_prop"));



           sql1 = "select distinct tot_kab from jumlah_wilayah where no_prop=" + rs1.getString("no_prop");
           st_tot = conn.createStatement();
            rs_tot = st_tot.executeQuery(sql1);

         while (rs_tot.next())
       {
        System.out.println(" Inside while loop for prop execure !!!!! ");
         propObj.setTotKab(rs_tot.getString("tot_kab"));
       }
       vProp.addElement(propObj);        //adding new record
       rs_tot.close();
       st_tot.close();

          }
        }
        rs1.close();
        ps1.close();
        rs1=null;
        ps1=null;

       query = "select trim(to_char(no_kab,'00')) no_kab,nama_kab,trim(to_char(no_prop,'00')) no_prop from setup_kab order by no_prop,no_kab";
        ps2 = conn.prepareStatement(query);
        //sql1 = "select no_kab,nama_kab from setup_kab order by no_kab";
        rs2 = ps2.executeQuery();
        vKab = new Vector();
        if (rs2 != null)
        {
          while (rs2.next())
          {
            ListKab kabObj = new ListKab(rs2.getString("no_kab"),
                                         rs2.getString("nama_kab"),
                                         rs2.getString("no_prop"));


            sql1 = "select distinct tot_kec from jumlah_wilayah where no_prop=" +
          rs2.getString("no_prop") + " and no_kab=" +
          rs2.getString("no_kab");

         st_tot = conn.createStatement();
         rs_tot = st_tot.executeQuery(sql1);

        while (rs_tot.next()) {
        kabObj.setTotKec(rs_tot.getString("tot_kec"));
      }

            vKab.addElement(kabObj);

                      rs_tot.close();
                      st_tot.close();
          }
        }
        rs2.close();
        ps2.close();
        rs2=null;
        ps2=null;

        query = "select trim(to_char(no_kec,'00')) no_kec,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kec order by no_prop,no_kab,no_kec";

        ps3 = conn.prepareStatement(query);
        //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
        rs3 = ps3.executeQuery();
        vKec = new Vector();

        if (rs3 != null) {
          while (rs3.next())
          {
            ListKec kecObj = new ListKec(rs3.getString("no_kec"),
                                         rs3.getString("nama_kec"),
                                         rs3.getString("no_kab"),
                                         rs3.getString("no_prop"));
           sql1 = "select tot_kel from jumlah_wilayah where no_prop=" +
                          rs3.getString("no_prop") + " and no_kab=" +
                          rs3.getString("no_kab") + " and no_kec=" +
                          rs3.getString("no_kec");

                  st_tot = conn.createStatement();
                  rs_tot = st_tot.executeQuery(sql1);

                      while (rs_tot.next()) {
                        kecObj.setTotKel(rs_tot.getString("tot_kel"));
                      }

                vKec.addElement(kecObj);

                rs_tot.close();
                st_tot.close();

          }
        }
        rs3.close();
        ps3.close();
        rs3=null;
        ps3=null;

      }
      dataWilayah = new InfoWilayah(vProp, vKab, vKec, null);
      conn.close();
    }
    catch (Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    finally
    {
      try {
        if (rs1 != null) {
          rs1.close();
        }
        if (rs2 != null) {
          rs2.close();
        }
        if (rs3 != null) {
          rs3.close();
        }

      }
      catch (Exception e)
      {
        siakWriter.writeFile(e);
      }
      try {
        if (ps1 != null) {
          ps1.close();
        }
        if (ps2 != null) {
          ps2.close();
        }
        if (ps3 != null) {
          ps3.close();
        }

      }
      catch (Exception e2)
      {
        siakWriter.writeFile(e2);
      }


      try {
        if (conn != null) {
          conn.close();
        }
      }
      catch (Exception e1)
      {
        siakWriter.writeFile(e1);
      }
    }
    return dataWilayah;
}

public InfoWilayah getListWilayah(String num_prop) throws RemoteException
   {
     Connection conn=null;
     System.out.println("PROVINCIS");
     InfoWilayah dataWilayah = null;

     ResultSet rs2= null, rs3 = null,rs4=null;
     PreparedStatement ps2 = null, ps3 = null,ps4=null;
     String query = "";
     Vector vKab=null,vKec=null,vKel=null;
String sql1="";
     Statement st_tot=null;
     ResultSet rs_tot=null;
     try
     {
        ConnectorDB connectorDb = new ConnectorDB();
        conn = connectorDb.getConnection();

   if (conn != null)
       {
        query = "select trim(to_char(no_kab,'00')) no_kab,nama_kab,trim(to_char(no_prop,'00')) no_prop from setup_kab where no_prop=" + num_prop.trim() + " order by no_prop,no_kab" ;
         ps2 = conn.prepareStatement(query);
         //sql1 = "select no_kab,nama_kab from setup_kab order by no_kab";
         rs2 = ps2.executeQuery();
         vKab = new Vector();

       if (rs2 != null)
         {
           while (rs2.next())
           {
             ListKab kabObj = new ListKab(rs2.getString("no_kab"),
                                          rs2.getString("nama_kab"),
                                          rs2.getString("no_prop"));

             sql1 = "select distinct tot_kec from jumlah_wilayah where no_prop=" +
                     rs2.getString("no_prop") + " and no_kab=" +
                     rs2.getString("no_kab");

            st_tot = conn.createStatement();
            rs_tot = st_tot.executeQuery(sql1);

      while (rs_tot.next()) {
        kabObj.setTotKec(rs_tot.getString("tot_kec"));
      }
             vKab.addElement(kabObj);   //add record into vector

             rs_tot.close();
             st_tot.close();

           }
     }
         rs2.close();
         ps2.close();
         rs2=null;
         ps2=null;

        query = "select trim(to_char(no_kec,'00')) no_kec,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kec where no_prop=" + num_prop + " order by no_prop,no_kab,no_kec" ;

         ps3 = conn.prepareStatement(query);
         //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
         rs3 = ps3.executeQuery();
         vKec = new Vector();

         if (rs3 != null) {
           while (rs3.next()) {
             ListKec kecObj = new ListKec(rs3.getString("no_kec"),
                                          rs3.getString("nama_kec"),
                                          rs3.getString("no_kab"),
                                          rs3.getString("no_prop"));

             sql1 = "select tot_kel from jumlah_wilayah where no_prop=" +
               rs3.getString("no_prop") + " and no_kab=" +
               rs3.getString("no_kab") + " and no_kec=" +
              rs3.getString("no_kec");

          st_tot = conn.createStatement();
         rs_tot = st_tot.executeQuery(sql1);

               while (rs_tot.next()) {
                      kecObj.setTotKel(rs_tot.getString("tot_kel"));
                             }
             vKec.addElement(kecObj);   //adding new record into vector

             rs_tot.close();
             rs_tot.close();
           }
         }
         rs3.close();
         ps3.close();
         rs3=null;
          ps3=null;

         query = "select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kel where no_prop=" + num_prop + " order by no_prop,no_kab,no_kec,no_kel ";

         ps4 = conn.prepareStatement(query);
         //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
         rs4 = ps4.executeQuery();
         vKel = new Vector();
         if (rs4 != null) {
           while (rs4.next()) {
             ListKel kecObj = new ListKel(rs4.getString("no_kel"),
                                                    rs4.getString("nama_kel"),
                                                    rs4.getString("no_kec"),
                                                    rs4.getString("no_kab"),
                                                    rs4.getString("no_prop"));

             vKel.addElement(kecObj);
           }
         }
         rs4.close();
         ps4.close();
         rs4=null;
         ps4=null;

       }
       dataWilayah = new InfoWilayah(vKab, vKec, vKel);
       conn.close();
      }
     catch (Exception e)
     {
       siakWriter.writeFile(e);
       e.printStackTrace();
     }
     finally
     {
       try {
         if (rs2 != null) {
           rs2.close();
         }
         if (rs3 != null) {
           rs3.close();
         }

       }
       catch (Exception e)
       {
         siakWriter.writeFile(e);
       }
       try {
         if (ps2 != null) {
           ps2.close();
         }
         if (ps3 != null) {
           ps3.close();
         }

       }
       catch (Exception e2)
       {
         siakWriter.writeFile(e2);
       }


       try {
         if (conn != null) {
           conn.close();
         }
       }
       catch (Exception e1)
       {
         siakWriter.writeFile(e1);
       }
     }
     return dataWilayah;
 }

 public InfoWilayah getListWilayah(String num_prop,String num_kab) throws RemoteException
    {
      Connection conn=null;
          System.out.println("KABUPATEN");
      InfoWilayah dataWilayah = null;

      ResultSet  rs3 = null,rs4=null;
      PreparedStatement ps3 = null,ps4=null;
      String query = "";
      Vector vKec=null,vKel=null;
      String sql1="";
      Statement st_tot=null;
      ResultSet rs_tot=null;
      try
      {
         ConnectorDB connectorDb = new ConnectorDB();
    conn = connectorDb.getConnection();
    if (conn != null)
        {
   query = "select trim(to_char(no_kec,'00')) no_kec,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kec where no_prop=" + num_prop + " and no_kab=" + num_kab + " order by no_prop,no_kab,no_kec";

          ps3 = conn.prepareStatement(query);
          //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
          rs3 = ps3.executeQuery();
          vKec = new Vector();

          if (rs3 != null) {
            while (rs3.next()) {
              ListKec kecObj = new ListKec(rs3.getString("no_kec"),
                                           rs3.getString("nama_kec"),
                                           rs3.getString("no_kab"),
                                           rs3.getString("no_prop"));

             sql1 = "select tot_kel from jumlah_wilayah where no_prop=" +
             rs3.getString("no_prop") + " and no_kab=" +
             rs3.getString("no_kab") + " and no_kec=" +
             rs3.getString("no_kec");

         st_tot = conn.createStatement();
         rs_tot = st_tot.executeQuery(sql1);

         while (rs_tot.next()) {
           kecObj.setTotKel(rs_tot.getString("tot_kel"));
         }
          vKec.addElement(kecObj);   //add record into vector
           rs_tot.close();
           st_tot.close();
            }
          }
          rs3.close();
          ps3.close();
          rs3=null;
          ps3=null;

     query = "select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kel where no_prop=" + num_prop + " and no_kab=" + num_kab  + " order by no_prop,no_kab,no_kec,no_kel";

          ps4 = conn.prepareStatement(query);
          //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
          rs4 = ps4.executeQuery();
          vKel = new Vector();
          if (rs4 != null) {
            while (rs4.next()) {
              ListKel kecObj = new ListKel(rs4.getString("no_kel"),
                                                     rs4.getString("nama_kel"),
                                                     rs4.getString("no_kec"),
                                                     rs4.getString("no_kab"),
                                                      rs4.getString("no_prop"));

              vKel.addElement(kecObj);
            }
          }
          rs4.close();
          ps4.close();
          rs4=null;
          ps4=null;
        }
     dataWilayah = new InfoWilayah(vKec, vKel);
     conn.close();
       }
      catch (Exception e)
      {
        siakWriter.writeFile(e);
        e.printStackTrace();
      }
      finally
      {
        try {

          if (rs3 != null) {
            rs3.close();
          }

        }
        catch (Exception e)
        {
          siakWriter.writeFile(e);
        }
        try {
          if (ps3 != null) {
            ps3.close();
          }

        }
        catch (Exception e2)
        {
          siakWriter.writeFile(e2);
        }


        try {
          if (conn != null) {
            conn.close();
          }
        }
        catch (Exception e1)
        {
          siakWriter.writeFile(e1);
        }
      }
      return dataWilayah;
  }


  public InfoWilayah getListWilayah(String num_prop,String num_kab,String num_kec) throws RemoteException
     {
       Connection conn=null;
           System.out.println("KECAMATAN");
       InfoWilayah dataWilayah = null;
       ConnectorDB connectorDb = new ConnectorDB();
       ResultSet  rs4=null;
       PreparedStatement ps4=null;
       String query = "";
       Vector vKel=null;
       try
       {
     conn = connectorDb.getConnection();

     if (conn != null)
         {
     query = "select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop from setup_kel where no_prop=" + num_prop + " and no_kab=" + num_kab + " and no_kec=" + num_kec + " order by no_prop,no_kab,no_kec,no_kel";
           ps4 = conn.prepareStatement(query);
           //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";
           rs4 = ps4.executeQuery();
           vKel = new Vector();
           if (rs4 != null) {
             while (rs4.next()) {
               ListKel kecObj = new ListKel(rs4.getString("no_kel"),
                                                      rs4.getString("nama_kel"),
                                                      rs4.getString("no_kec"),
                                                      rs4.getString("no_kab"),
                                                      rs4.getString("no_prop"));

               vKel.addElement(kecObj);
             }
           }
           rs4.close();
           ps4.close();
           rs4=null;
           ps4=null;
         }
         dataWilayah = new InfoWilayah(vKel);
         conn.close();

        }
       catch (Exception e)
       {
         siakWriter.writeFile(e);
         e.printStackTrace();
       }
       finally
       {
         try {
           if(rs4!=null) rs4.close();
             if(ps4!=null) ps4.close();
           if (conn != null) {
             conn.close();
           }
         }
         catch (Exception e1)
         {
           siakWriter.writeFile(e1);
         }
       }
       return dataWilayah;
   }

  public void WilayahSettingModuleBean() throws CreateException
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
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "WilayahSettingModuleBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    /**@todo Complete this method*/
  }

}