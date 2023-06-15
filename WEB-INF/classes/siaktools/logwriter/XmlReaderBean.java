package siaktools.logwriter;
import javax.ejb.*;
import oracle.jdbc.*;
import com.db.connection.*;
import java.sql.*;
import java.io.*;
import java.util.Locale;
import java.util.ResourceBundle;
import java.rmi.RemoteException;

public class XmlReaderBean implements SessionBean {
  SessionContext sessionContext;
  ServiceController factory;
  private String path="";
  private String sep_path="";

  public void ejbCreate() throws CreateException {
    try{
       ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
       path = res.getString("BEAN_PATH");
       sep_path=res.getString("SEP_PATH");
       path=path.substring(0,path.lastIndexOf(sep_path));
       path=path+sep_path;
   }catch(Exception err)
    {
      err.printStackTrace();
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
 public void writePkrjn() throws RemoteException
  {
   Connection con=null;
   Statement st=null;
   ResultSet rs=null;
    int iLf = 10;
    char cLf = (char)iLf;
try{
      ConnectorDB conn = new ConnectorDB();
      con = conn.getConnection();
      st = con.createStatement();
      rs = st.executeQuery("select * from pkrjn_master order by no");
      File outfile = new File(path + "pkrjn.xml");
      FileWriter writer = new FileWriter(outfile);
      writer.write("<?xml version='1.0' encoding='ISO-8859-1'?>" + cLf);
      writer.write("<rowset>" + cLf);
      while (rs.next()) {
             writer.write("<row>" + cLf);
        writer.write("<No>" + rs.getString("no") + "</No>" + cLf);
        writer.write("<Descr>" + rs.getString("DESCRIP") + "</Descr>" + cLf);
        writer.write("</row>" + cLf);
      }
       writer.write("</rowset>" + cLf);
       writer.close();
      rs.close();
      st.close();
      con.close();
    }catch(Exception err)
    {
      err.printStackTrace();
    }
finally
      {
        try
           {
             if (rs!=null) rs.close();
           }catch(Exception err)
           {

           }
           try
                          {
                            if (con!=null) con.close();
                          }catch(Exception err)
                          {

                          }
      }
  }

  public void writeWilayah()
  {
    Connection con=null;
    ResultSet rs=null;
    ResultSet rs1=null;
    ResultSet rs2=null;
    ResultSet rs3=null;
    ResultSet rs4=null;

    PreparedStatement st=null;
    PreparedStatement st1=null;
    PreparedStatement st2=null;
    PreparedStatement st3=null;
    PreparedStatement st4=null;

    int iLf = 10;
    char cLf = (char)iLf;

    try{
      ConnectorDB conn=new ConnectorDB();
      con=conn.getConnection();
      st=con.prepareStatement("select trim(to_char(no_prop,'00')) no_prop,nama_prop from setup_prop order by no_prop");
      rs=st.executeQuery();
      File outfile=new File(path + "setup_prop.xml");
      FileWriter writer=new FileWriter(outfile);
      writer.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
      writer.write("<rowset>" + cLf);

      while(rs.next())
      {
         writer.write("<row>" + cLf);
            writer.write("<Noprop>" + rs.getString("no_prop") + "</Noprop>" + cLf);
            writer.write("<NamaProp>" + rs.getString("nama_prop") + "</NamaProp>" + cLf);
         writer.write("</row>" + cLf);

        st1=con.prepareStatement("select trim(to_char(no_kab,'00')) no_kab,nama_kab,trim(to_char(no_prop,'00')) no_prop,nvl(jabatan,' ') jabatan,nvl(NAMA_PEJ,' ') NAMA_PEJ,nvl(NIP_PEJ,' ') NIP_PEJ,nvl(STAT_PNDTNG,' ') STAT_PNDTNG  from setup_kab where no_prop=" + rs.getString("no_prop") + " order by no_prop,no_kab ");
        rs1=st1.executeQuery();

        File outfile1=new File(path + "p"+rs.getString("no_prop") + ".xml");
        FileWriter writer1=new FileWriter(outfile1);
        writer1.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);

        writer1.write("<rowset>" + cLf);

          while(rs1.next())
                {
                  writer1.write("<row>" + cLf);
                  writer1.write("<NoKab>" + rs1.getString("no_kab") + "</NoKab>" + cLf);
                  writer1.write("<NamaKab>" + rs1.getString("nama_kab") + "</NamaKab>" + cLf);
                  writer1.write("<NoProp>" + rs1.getString("no_prop") + "</NoProp>" + cLf);
                  writer1.write("<Jabatan>" + rs1.getString("jabatan") + "</Jabatan>" + cLf);
                  writer1.write("<NamaPej>" + rs1.getString("nama_pej") + "</NamaPej>" + cLf);
                  writer1.write("<NipPej>" + rs1.getString("nip_pej") + "</NipPej>" + cLf);
                  writer1.write("<StatPndtng>" + rs1.getString("stat_pndtng") + "</StatPndtng>" + cLf);
                  writer1.write("</row>" + cLf);

                    File outfile2=new File(path + "kb"+rs1.getString("no_prop") + rs1.getString("no_kab") + ".xml");
                      FileWriter writer2=new FileWriter(outfile2);;
                                writer2.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
                                      writer2.write("<rowset>" + cLf);

                                          st2=con.prepareStatement("select trim(to_char(no_kec,'00')) no_kec,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop,nvl(jabatan,' ') jabatan,nvl(nama_pej,' ') nama_pej,nvl(STAT_PNDTNG,' ') STAT_PNDTNG,nvl(NIP_PEJ,' ') NIP_PEJ   from setup_kec where no_prop=" + rs1.getString("no_prop") + " and no_kab=" +  rs1.getString("no_kab") + " order by no_prop,no_kab,no_kec");
                                             rs2=st2.executeQuery();

                                               while(rs2.next())
                                               {
                                                 writer2.write("<row>" + cLf);
                                                 writer2.write("<NoKec>" + rs2.getString("NO_KEC") + "</NoKec>" + cLf);
                                                 writer2.write("<NamaKec>" + rs2.getString("NAMA_KEC") + "</NamaKec>" + cLf);
                                                 writer2.write("<NoKab>" + rs2.getString("NO_KAB") + "</NoKab>" + cLf);
                                                 writer2.write("<NoProp>" + rs2.getString("NO_PROP") + "</NoProp>" + cLf);
                                                 writer2.write("<Jabatan>" + rs2.getString("JABATAN") + "</Jabatan>" + cLf);
                                                 writer2.write("<NamaPej>" + rs2.getString("NAMA_PEJ") + "</NamaPej>" + cLf);
                                                 writer2.write("<StatPndtng>" + rs2.getString("STAT_PNDTNG") + "</StatPndtng>" + cLf);
                                                 writer2.write("<NipPej>" + rs2.getString("NIP_PEJ") + "</NipPej>" + cLf);
                                                 writer2.write("</row>" + cLf);

                                                    File outfile3=new File(path + "kc"+rs2.getString("no_prop") + rs2.getString("no_kab") + rs2.getString("no_kec") + ".xml");
                                                    FileWriter writer3=new FileWriter(outfile3);
                                                    writer3.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
                                                    writer3.write("<rowset>" + cLf);

                                                   st3=con.prepareStatement("Select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop,nvl(jabatan,' ') jabatan,nvl(nama_lur,' ') nama_lur,nvl(nip_lur,' ') nip_lur from setup_kel where no_prop=" + rs2.getString("no_prop") + " and no_kab=" + rs2.getString("no_kab") + " and no_kec=" + rs2.getString("no_kec") +" order by no_prop,no_kab,no_kec,no_kel");
                                                   rs3=st3.executeQuery();

                                                    while(rs3.next())
                                                    {
                                                      writer3.write("<row>" + cLf);
                                                      writer3.write("<NoKel>" + rs3.getString("NO_KEL") + "</NoKel>" + cLf);
                                                      writer3.write("<NamaKel>" + rs3.getString("NAMA_KEL") + "</NamaKel>" + cLf);
                                                      writer3.write("<NoKec>" + rs3.getString("NO_KEC") + "</NoKec>" + cLf);
                                                      writer3.write("<NoKab>" + rs3.getString("NO_KAB") + "</NoKab>" + cLf);
                                                      writer3.write("<NoProp>" + rs3.getString("NO_PROP") + "</NoProp>" + cLf);
                                                      writer3.write("<Jabatan>" + rs3.getString("JABATAN") + "</Jabatan>" + cLf);
                                                      writer3.write("<NamaLur>" + rs3.getString("NAMA_LUR") + "</NamaLur>" + cLf);
                                                      writer3.write("<NipLur>" + rs3.getString("NIP_LUR") + "</NipLur>" + cLf);
                                                      writer3.write("</row>" + cLf);
                                                    }
                                                    writer3.write("</rowset>" + cLf);
                                                    try{
                                                      writer3.close();
                                                    }catch(Exception e1)
                                                    {
                                                    }
                                                    try{
                                                      rs3.close();
                                                    }catch(Exception e2)
                                                    {
                                                    }
                                                    try{
                                                      st3.close();
                                                    }catch(Exception e3)
                                                    {

                                                    }
                                                    finally{
                                                      rs3 = null;
                                                      st3 = null;
                                                    }
                                               }
                                        writer2.write("</rowset>" + cLf);
                                        try{
                                          writer2.close();
                                        }catch(Exception e4)
                                        {
                                        }
                                        try {
                                          rs2.close();
                                        }
                                        catch (Exception e5) {
                                        }
                                        try {
                                          st2.close();
                                        }
                                        catch (Exception e6) {
                                        }
                                        finally {
                                          rs2 = null;
                                          st2 = null;
                                        }

                 }
        writer1.write("</rowset>" + cLf);

        try{
        writer1.close();
}catch(Exception e4)
{
}
try {
  rs1.close();
}
catch (Exception e5) {
}
try {
  st1.close();
}
catch (Exception e6) {
}
finally {
  rs1 = null;
  st1 = null;
}

   }

      writer.write("</rowset>" + cLf);

      try{
            writer.close();
}catch(Exception e4)
{
}
try {
rs.close();
}
catch (Exception e5) {
}
try {
st.close();
}
catch (Exception e6) {
}
finally {
rs = null;
st = null;
}

          try{
      con.close();
          }catch(Exception conerr)
          {

          }



    }catch(Exception err)
    {
         err.printStackTrace();
    }

finally{

      try
      {
        if (rs!=null) rs.close();
      }catch(Exception err)
      {

      }

            try
            {
              if (st!=null) st.close();
            }catch(Exception err)
            {

            }


                  try
                  {
                    if (con!=null) con.close();
                  }catch(Exception err)
                  {

                  }
    }
  }

  public void writeProps() {
    Connection con=null;
    ResultSet rs=null;
    Statement st=null;

    int iLf = 10;
    char cLf = (char)iLf;

    try {
      ConnectorDB conn=new ConnectorDB();
      con=conn.getConnection();
      st=con.createStatement();
      rs=st.executeQuery("select trim(to_char(no_prop,'00')) no_prop,nama_prop from setup_prop");
      File outfile=new File(path + "setup_prop.xml");
      FileWriter writer=new FileWriter(outfile);
      writer.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
      writer.write("<rowset>" + cLf);

      while(rs.next()) {
        writer.write("<row>" + cLf);
        writer.write("<Noprop>" + rs.getString("no_prop") + "</Noprop>" + cLf);
        writer.write("<NamaProp>" + rs.getString("nama_prop") + "</NamaProp>" + cLf);
        writer.write("</row>" + cLf);
      }

      writer.write("</rowset>" + cLf);
      writer.close();

      rs.close();
      st.close();
      con.close();

    } catch(Exception err) {
      err.printStackTrace();
    } finally {
      try {
        if (rs!=null) rs.close();
      } catch(Exception err) {}
      try {
        if (st!=null) st.close();
      } catch(Exception err) {}
      try {
        if (con!=null) con.close();
      } catch(Exception err) {}
    }
  }

  public void writeKabs(String noProp) {
    Connection con=null;
    ResultSet rs1=null;
    Statement st1=null;

    int iLf = 10;
    char cLf = (char)iLf;

    try {
      ConnectorDB conn=new ConnectorDB();
      con=conn.getConnection();

      st1=con.createStatement();

      rs1=st1.executeQuery("select trim(to_char(no_kab,'00')) no_kab,nama_kab,trim(to_char(no_prop,'00')) no_prop,nvl(jabatan,' ') jabatan,nvl(NAMA_PEJ,' ') NAMA_PEJ,nvl(NIP_PEJ,' ') NIP_PEJ,nvl(STAT_PNDTNG,' ') STAT_PNDTNG  from setup_kab where no_prop=" +noProp + " order by no_prop ");
      File outfile1=new File(path + "p"+ noProp + ".xml");
      FileWriter writer1=new FileWriter(outfile1);
      writer1.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
      writer1.write("<rowset>" + cLf);

      while(rs1.next()) {
          writer1.write("<row>" + cLf);
          writer1.write("<NoKab>" + rs1.getString("no_kab") + "</NoKab>" + cLf);
          writer1.write("<NamaKab>" + rs1.getString("nama_kab") + "</NamaKab>" + cLf);
          writer1.write("<NoProp>" + rs1.getString("no_prop") + "</NoProp>" + cLf);
          writer1.write("<Jabatan>" + rs1.getString("jabatan") + "</Jabatan>" + cLf);
          writer1.write("<NamaPej>" + rs1.getString("nama_pej") + "</NamaPej>" + cLf);
          writer1.write("<NipPej>" + rs1.getString("nip_pej") + "</NipPej>" + cLf);
          writer1.write("<StatPndtng>" + rs1.getString("stat_pndtng") + "</StatPndtng>" + cLf);
          writer1.write("</row>" + cLf);
      }
      writer1.write("</rowset>" + cLf);
      writer1.close();
      rs1.close();
      st1.close();
      rs1=null;
      st1=null;
      con.close();
    } catch(Exception err) {
      err.printStackTrace();
    } finally{
      try {
        if (con!=null) con.close();
      } catch(Exception err) {}
    }
  }

  public void writeKecs(String noProp, String noKab) {
    Connection con=null;
    ResultSet rs2=null;

    Statement st2=null;

    int iLf = 10;
    char cLf = (char)iLf;

    try {
      ConnectorDB conn=new ConnectorDB();
      con=conn.getConnection();
      File outfile2= new File(path + "kb"+ noProp + noKab + ".xml");
      FileWriter writer2=new FileWriter(outfile2);;
      writer2.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
      writer2.write("<rowset>" + cLf);

      st2=con.createStatement();
      rs2=st2.executeQuery("select trim(to_char(no_kec,'00')) no_kec,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop,nvl(jabatan,' ') jabatan,nvl(nama_pej,' ') nama_pej,nvl(STAT_PNDTNG,' ') STAT_PNDTNG,nvl(NIP_PEJ,' ') NIP_PEJ   from setup_kec where no_prop=" + noProp + " and no_kab=" +  noKab);

      while(rs2.next()) {
        writer2.write("<row>" + cLf);
        writer2.write("<NoKec>" + rs2.getString("NO_KEC") + "</NoKec>" + cLf);
        writer2.write("<NamaKec>" + rs2.getString("NAMA_KEC") + "</NamaKec>" + cLf);
        writer2.write("<NoKab>" + rs2.getString("NO_KAB") + "</NoKab>" + cLf);
        writer2.write("<NoProp>" + rs2.getString("NO_PROP") + "</NoProp>" + cLf);
        writer2.write("<Jabatan>" + rs2.getString("JABATAN") + "</Jabatan>" + cLf);
        writer2.write("<NamaPej>" + rs2.getString("NAMA_PEJ") + "</NamaPej>" + cLf);
        writer2.write("<StatPndtng>" + rs2.getString("STAT_PNDTNG") + "</StatPndtng>" + cLf);
        writer2.write("<NipPej>" + rs2.getString("NIP_PEJ") + "</NipPej>" + cLf);
        writer2.write("</row>" + cLf);
      }
      writer2.write("</rowset>" + cLf);
      writer2.close();
      rs2.close();
      st2.close();
      rs2=null;
      st2=null;
      con.close();

    } catch(Exception err) {
      err.printStackTrace();
    } finally{
      try {
        if (con!=null) con.close();
      } catch(Exception err) {}
    }
  }

  public void writeKels(String noProp, String noKab, String noKec) {
    Connection con=null;
    ResultSet rs3=null;

    Statement st3=null;

    int iLf = 10;
    char cLf = (char)iLf;

    try{
      ConnectorDB conn=new ConnectorDB();
      File outfile3=new File(path + "kc"+ noProp + noKab +noKec + ".xml");
      FileWriter writer3=new FileWriter(outfile3);
      writer3.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
      writer3.write("<rowset>" + cLf);
      st3=con.createStatement();
      rs3=st3.executeQuery("Select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop,nvl(jabatan,' ') jabatan,nvl(nama_lur,' ') nama_lur,nvl(nip_lur,' ') nip_lur from setup_kel where no_prop=" + noProp + " and no_kab=" + noKab + " and no_kec=" + noKec );

      while(rs3.next()) {
        writer3.write("<row>" + cLf);
        writer3.write("<NoKel>" + rs3.getString("NO_KEL") + "</NoKel>" + cLf);
        writer3.write("<NamaKel>" + rs3.getString("NAMA_KEL") + "</NamaKel>" + cLf);
        writer3.write("<NoKec>" + rs3.getString("NO_KEC") + "</NoKec>" + cLf);
        writer3.write("<NoKab>" + rs3.getString("NO_KAB") + "</NoKab>" + cLf);
        writer3.write("<NoProp>" + rs3.getString("NO_PROP") + "</NoProp>" + cLf);
        writer3.write("<Jabatan>" + rs3.getString("JABATAN") + "</Jabatan>" + cLf);
        writer3.write("<NamaLur>" + rs3.getString("NAMA_LUR") + "</NamaLur>" + cLf);              writer3.write("<NipLur>" + rs3.getString("NIP_LUR") + "</NipLur>" + cLf);
        writer3.write("</row>" + cLf);
      }
      writer3.write("</rowset>" + cLf);
      writer3.close();
      rs3.close();
      st3.close();
      rs3=null;
      st3=null;
      con.close();

    } catch(Exception err) {
         err.printStackTrace();
    } finally{
      try {
        if (con!=null) con.close();
      }catch(Exception err) {}
    }
  }

 public void writeRumahTangga(String noProp, String noKab, String noKec,String nokel) {
   Connection con=null;
   ResultSet rs3=null;
   ResultSet rs4=null;
   int iLf = 10;
   char cLf = (char)iLf;
   String old_kk="";
   String new_kk="";
   boolean first=true;
   int pgno=1,counter=1;
   int sno=0;
   int runno=0;
   String sql1="  SELECT to_char(sysdate,'dd-mm-yyyy') now, getnamaprop(DATA_KELUARGA_P4B.no_prop) nama_prop, getnamakab(DATA_KELUARGA_P4B.no_kab,DATA_KELUARGA_P4B.no_prop) nama_kab,getnamakec(DATA_KELUARGA_P4B.no_kec,DATA_KELUARGA_P4B.no_kab,DATA_KELUARGA_P4B.no_prop) nama_kec,getnamakel(DATA_KELUARGA_P4B.no_kel,DATA_KELUARGA_P4B.no_kec,DATA_KELUARGA_P4B.no_kab,DATA_KELUARGA_P4B.no_prop) nama_kel,";
   sql1=sql1+ " SUBSTR(DATA_KELUARGA_P4B.junction,11,4) NBS, SUBSTR(DATA_KELUARGA_P4B.junction,15) NURT,TO_CHAR(DATA_KELUARGA_P4B.no_kk) no_kk, nama_kep,(alamat||',RT :'|| trim(to_char(no_rt,'000'))||',RW :'||trim(to_char(no_rw,'000'))||',KodePos :'||kode_pos||',Telp :'||telp) alamat,TO_CHAR(nik) nik,nama_lgkp,DECODE(JENIS_KLMIN,1,'L',2,'P') JK,TMPT_LHR,";
   sql1=sql1+ " to_char(TGL_LHR,'dd-mm-yyyy') TGL_LHR, getUmur(TGL_LHR,stat_kwn) UMUR,DECODE(GOL_DRH,1,'A',2,'B',3,'AB',4,'O',13,'-') GOL_DRH, getAgamaDescr(agama) agama,getstatus(stat_kwn) stat_kwn,DECODE(STAT_HBKEL,";
   sql1=sql1+ " 1,'Kepala Keluarga',2,'Suami',3,'Istri',4,'Anak',5,'Menantu',6,'Cucu',7,'OrangTua',8,'Mertua',";
   sql1=sql1+  " 9,'Famili Lain',10,'Pembantu',11,'Lainnya') SHDRT,getpddkn(PDDK_AKH) PDDK_AKH ,";
   sql1=sql1+  " getpkrjn(JENIS_PKRJN) JENIS_PKRJN,NAMA_LGKP_IBU,NAMA_LGKP_AYAH FROM BIODATA_WNI_P4B,";
   sql1=sql1+  " DATA_KELUARGA_P4B WHERE BIODATA_WNI_P4B.no_kk=DATA_KELUARGA_P4B.no_kk ";
   sql1=sql1+ " and DATA_KELUARGA_P4B.no_prop=" + noProp + " and DATA_KELUARGA_P4B.no_kab=" + noKab + " and DATA_KELUARGA_P4B.no_kec=" + noKec + " and DATA_KELUARGA_P4B.no_kel=" + nokel + " order by SUBSTR(DATA_KELUARGA_P4B.junction,11,4),SUBSTR(DATA_KELUARGA_P4B.junction,15),DATA_KELUARGA_P4B.no_kk,STAT_HBKEL";
try{
     ConnectorDB conn=new ConnectorDB();
     con=conn.getConnection();
     File outfile3=new File(path + "rtangga"+ noProp + noKab +noKec + nokel+ ".xml");
     FileWriter writer3=new FileWriter(outfile3);
     rs3=con.prepareStatement(sql1).executeQuery();

while (rs3.next()) {
         if (first)
         {
        writer3.write("<?xml version='1.0' encoding='ISO-8859-1'?>" + cLf);
 writer3.write("<rowset nama_prop='" + rs3.getString("nama_prop") +
       "' nama_kab='" + rs3.getString("nama_kab") +
       "' nama_kec='" + rs3.getString("nama_kec") +
       "' nama_kel='" + rs3.getString("nama_kel") +
       "' now='" +
       rs3.getString("now") + "'>" + cLf);
    writer3.write("<page no='" + pgno + "'>" + cLf);
         }
         if (rs3.getString("umur").equals("Y"))  sno++;
         if (rs3.getString("no_kk").trim().equals(old_kk.trim())) {
           runno++;
           writer3.write("<tail vote=\"" + rs3.getString("umur") + "\" sno=\"" + sno + "\" run_no=\"" + runno + "\">" + cLf);
           writer3.write("<nik>" + rs3.getString("nik") +
                          "</nik>" + cLf);
            writer3.write("<nama_lgkp>" + rs3.getString("nama_lgkp") +
                          "</nama_lgkp>" + cLf);
            writer3.write("<jk>" + rs3.getString("jk") + "</jk>" + cLf);
            writer3.write("<tmpt_lhr>" + rs3.getString("tmpt_lhr") +
                          "</tmpt_lhr>" + cLf);
            writer3.write("<tgl_lhr>" + rs3.getString("tgl_lhr") + "</tgl_lhr>" +
                          cLf);
            writer3.write("<gol_drh>" + rs3.getString("gol_drh") + "</gol_drh>" +
                          cLf);
            writer3.write("<agama>" + rs3.getString("agama") + "</agama>" + cLf);
            writer3.write("<stat_kwn>" + rs3.getString("stat_kwn") +
                          "</stat_kwn>" + cLf);
            writer3.write("<shdrt>" + rs3.getString("shdrt") + "</shdrt>" + cLf);
            writer3.write("<pddk_akh>" + rs3.getString("pddk_akh") +
                          "</pddk_akh>" + cLf);
            writer3.write("<jenis_pkrjn>" + rs3.getString("jenis_pkrjn") +
                          "</jenis_pkrjn>" + cLf);
            writer3.write("<nama_lgkp_ibu>" + rs3.getString("nama_lgkp_ibu") +
                          "</nama_lgkp_ibu>" + cLf);
            writer3.write("<nama_lgkp_ayah>" + rs3.getString("nama_lgkp_ayah") +
                          "</nama_lgkp_ayah>" + cLf);
            writer3.write("<paraf></paraf>" + cLf);
            writer3.write("</tail>" + cLf);

         }
         else {
           if (!first)  writer3.write("</kk>" + cLf);

           sno=1;
           runno=1;
           writer3.write("<kk nbs='" + rs3.getString("NBS") + "' nurt='" +
                         rs3.getString("NURT") + "' no_kk='" +
                         rs3.getString("no_kk") + "' nama_kep=\"" +
                         rs3.getString("nama_kep") + "\" alamat=\"" +
                         rs3.getString("alamat") + "\">" + cLf);
           writer3.write("<tail vote=\"" + rs3.getString("umur") + "\" sno=\"" + sno + "\" run_no=\"" + runno + "\">" + cLf);
           writer3.write("<nik>" + rs3.getString("nik") +
                          "</nik>" + cLf);
           writer3.write("<nama_lgkp>" + rs3.getString("nama_lgkp") +
                         "</nama_lgkp>" + cLf);
           writer3.write("<jk>" + rs3.getString("jk") + "</jk>" + cLf);
           writer3.write("<tmpt_lhr>" + rs3.getString("tmpt_lhr") +
                         "</tmpt_lhr>" + cLf);
           writer3.write("<tgl_lhr>" + rs3.getString("tgl_lhr") + "</tgl_lhr>" +
                         cLf);
           writer3.write("<gol_drh>" + rs3.getString("gol_drh") + "</gol_drh>" +
                         cLf);
           writer3.write("<agama>" + rs3.getString("agama") + "</agama>" + cLf);
           writer3.write("<stat_kwn>" + rs3.getString("stat_kwn") +
                         "</stat_kwn>" + cLf);
           writer3.write("<shdrt>" + rs3.getString("shdrt") + "</shdrt>" + cLf);
           writer3.write("<pddk_akh>" + rs3.getString("pddk_akh") +
                         "</pddk_akh>" + cLf);
           writer3.write("<jenis_pkrjn>" + rs3.getString("jenis_pkrjn") +
                         "</jenis_pkrjn>" + cLf);
           writer3.write("<nama_lgkp_ibu>" + rs3.getString("nama_lgkp_ibu") +
                         "</nama_lgkp_ibu>" + cLf);
           writer3.write("<nama_lgkp_ayah>" + rs3.getString("nama_lgkp_ayah") +
                         "</nama_lgkp_ayah>" + cLf);
           writer3.write("<paraf></paraf>" + cLf);
           writer3.write("</tail>" + cLf);

         }

         if ((counter==14) && (pgno==1))
         {
           writer3.write("</kk>" + cLf);
           writer3.write("</page>" + cLf);
           counter=1;
           pgno++;
           writer3.write("<page no='" + pgno + "'>" + cLf);
          writer3.write("<kk nbs='" + rs3.getString("NBS") + "' nurt='" +
                        rs3.getString("NURT") + "' no_kk='" +
                        rs3.getString("no_kk") + "' nama_kep=\"" +
                        rs3.getString("nama_kep") + "\" alamat=\"" +
                        rs3.getString("alamat") + "\">" + cLf);

         }
         else if ((counter==18) && (pgno>1))
         {
           writer3.write("</kk>" + cLf);
           writer3.write("</page>" + cLf);
           counter=1;
           pgno++;
           writer3.write("<page no='" + pgno + "'>" + cLf);
           writer3.write("<kk nbs='" + rs3.getString("NBS") + "' nurt='" +
                  rs3.getString("NURT") + "' no_kk='" +
                  rs3.getString("no_kk") + "' nama_kep=\"" +
                  rs3.getString("nama_kep") + "\" alamat=\"" +
                  rs3.getString("alamat") + "\">" + cLf);
         }
         old_kk = rs3.getString("no_kk");
         counter++;
         first=false;
       }
       writer3.write("</kk>" + cLf);
     writer3.write("</page>" + cLf);
     writer3.write("</rowset>" + cLf);
     writer3.close();
   } catch(Exception err) {
        err.printStackTrace();
   } finally{
     try {
       rs3.close();
       rs4.close();
       con.close();
     }catch(Exception err) {}
   }
 }


 public void writeRumahTangga() {
   Connection con=null;
   ResultSet rs=null;
   ResultSet rs3=null;
   ResultSet rs4=null;
   PreparedStatement ps1=null,ps2=null;
   int iLf = 10;
   char cLf = (char)iLf;
   String old_kk="";
   String new_kk="";
   boolean first;
   int pgno=1,counter=1;
   int sno=0;
   int runno=0;
   try{
     ConnectorDB conn=new ConnectorDB();
     con=conn.getConnection();

     ps1=con.prepareStatement("select trim(to_char(no_prop,'00')) no_prop,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_kec,'00')) no_kec,no_kel from setup_kel where no_prop=36 and no_kab=03");
     rs = ps1.executeQuery();


     while(rs.next())
     {

       pgno=1;
       counter=1;
       first=true;
       sno=0;
       runno=0;
       File outfile3 = new File(path + "rtangga" + rs.getString("no_prop") + rs.getString("no_kab") + rs.getString("no_kec") +
                                rs.getString("no_kel") + ".xml");
       FileWriter writer3 = new FileWriter(outfile3);
       String sql1="  SELECT to_char(sysdate,'dd-mm-yyyy') now, getnamaprop(DATA_KELUARGA_P4B.no_prop) nama_prop, getnamakab(DATA_KELUARGA_P4B.no_kab,DATA_KELUARGA_P4B.no_prop) nama_kab,getnamakec(DATA_KELUARGA_P4B.no_kec,DATA_KELUARGA_P4B.no_kab,DATA_KELUARGA_P4B.no_prop) nama_kec,getnamakel(DATA_KELUARGA_P4B.no_kel,DATA_KELUARGA_P4B.no_kec,DATA_KELUARGA_P4B.no_kab,DATA_KELUARGA_P4B.no_prop) nama_kel,";
       sql1=sql1+ " SUBSTR(DATA_KELUARGA_P4B.junction,11,4) NBS, SUBSTR(DATA_KELUARGA_P4B.junction,15) NURT,TO_CHAR(DATA_KELUARGA_P4B.no_kk) no_kk, nama_kep,(alamat||',RT :'|| trim(to_char(no_rt,'000'))||',RW :'||trim(to_char(no_rw,'000'))||',KodePos :'||kode_pos||',Telp :'||telp) alamat,TO_CHAR(nik) nik,nama_lgkp,DECODE(JENIS_KLMIN,1,'L',2,'P') JK,TMPT_LHR,";
       sql1=sql1+ " to_char(TGL_LHR,'dd-mm-yyyy') TGL_LHR, getUmur(TGL_LHR,stat_kwn) UMUR,DECODE(GOL_DRH,1,'A',2,'B',3,'AB',4,'O',13,'-') GOL_DRH, getAgamaDescr(agama) agama,getstatus(stat_kwn) stat_kwn,DECODE(STAT_HBKEL,";
       sql1=sql1+ " 1,'Kepala Keluarga',2,'Suami',3,'Istri',4,'Anak',5,'Menantu',6,'Cucu',7,'OrangTua',8,'Mertua',";
       sql1=sql1+  " 9,'Famili Lain',10,'Pembantu',11,'Lainnya') SHDRT,getpddkn(PDDK_AKH) PDDK_AKH ,";
       sql1=sql1+  " getpkrjn(JENIS_PKRJN) JENIS_PKRJN,NAMA_LGKP_IBU,NAMA_LGKP_AYAH FROM BIODATA_WNI_P4B,";
       sql1=sql1+  " DATA_KELUARGA_P4B WHERE BIODATA_WNI_P4B.no_kk=DATA_KELUARGA_P4B.no_kk ";
      sql1=sql1+ " and DATA_KELUARGA_P4B.no_prop=" + rs.getString("no_prop") + " and DATA_KELUARGA_P4B.no_kab=" + rs.getString("no_kab") + " and DATA_KELUARGA_P4B.no_kec=" + rs.getString("no_kec") + " and DATA_KELUARGA_P4B.no_kel=" + rs.getString("no_kel") + " order by SUBSTR(DATA_KELUARGA_P4B.junction,11,4),SUBSTR(DATA_KELUARGA_P4B.junction,15),DATA_KELUARGA_P4B.no_kk,STAT_HBKEL";
   //     sql1=sql1+ " and DATA_KELUARGA_P4B.no_prop=36 and DATA_KELUARGA_P4B.no_kab=03 order by SUBSTR(DATA_KELUARGA_P4B.junction,11,4),SUBSTR(DATA_KELUARGA_P4B.junction,15),DATA_KELUARGA_P4B.no_kk,STAT_HBKEL";

       ps2=con.prepareStatement(sql1);
       rs3 = ps2.executeQuery();


     while (rs3.next()) {

       if (first)
       {
       writer3.write("<?xml version='1.0' encoding='ISO-8859-1'?>" + cLf);
       writer3.write("<rowset nama_prop='" + rs3.getString("nama_prop") +
             "' nama_kab='" + rs3.getString("nama_kab") +
             "' nama_kec='" + rs3.getString("nama_kec") +
             "' nama_kel='" + rs3.getString("nama_kel") +
             "' now='" +
             rs3.getString("now") + "'>" + cLf);
          writer3.write("<page no='" + pgno + "'>" + cLf);
       }

         if (rs3.getString("umur").equals("Y"))
           sno++;
         if (rs3.getString("no_kk").trim().equals(old_kk.trim())) {
              runno++;
           writer3.write("<tail vote=\"" + rs3.getString("umur") + "\" sno=\"" + sno + "\" run_no=\"" + runno + "\">" + cLf);
           writer3.write("<nik>" + rs3.getString("nik") +
                          "</nik>" + cLf);
           writer3.write("<nama_lgkp>" + rs3.getString("nama_lgkp") +
                         "</nama_lgkp>" + cLf);
           writer3.write("<jk>" + rs3.getString("jk") + "</jk>" + cLf);
           writer3.write("<tmpt_lhr>" + rs3.getString("tmpt_lhr") +
                         "</tmpt_lhr>" + cLf);
           writer3.write("<tgl_lhr>" + rs3.getString("tgl_lhr") + "</tgl_lhr>" +
                         cLf);
           writer3.write("<gol_drh>" + rs3.getString("gol_drh") + "</gol_drh>" +
                         cLf);
           writer3.write("<agama>" + rs3.getString("agama") + "</agama>" + cLf);
           writer3.write("<stat_kwn>" + rs3.getString("stat_kwn") +
                         "</stat_kwn>" + cLf);
           writer3.write("<shdrt>" + rs3.getString("shdrt") + "</shdrt>" + cLf);
           writer3.write("<pddk_akh>" + rs3.getString("pddk_akh") +
                         "</pddk_akh>" + cLf);
           writer3.write("<jenis_pkrjn>" + rs3.getString("jenis_pkrjn") +
                         "</jenis_pkrjn>" + cLf);
           writer3.write("<nama_lgkp_ibu>" + rs3.getString("nama_lgkp_ibu") +
                         "</nama_lgkp_ibu>" + cLf);
           writer3.write("<nama_lgkp_ayah>" + rs3.getString("nama_lgkp_ayah") +
                         "</nama_lgkp_ayah>" + cLf);
           writer3.write("<paraf></paraf>" + cLf);
           writer3.write("</tail>" + cLf);
         }
         else {
           if (!first)
             writer3.write("</kk>" + cLf);
           sno = 1;
           runno=1;
           writer3.write("<kk nbs='" + rs3.getString("NBS") + "' nurt='" +
                         rs3.getString("NURT") + "' no_kk='" +
                         rs3.getString("no_kk") + "' nama_kep=\"" +
                         rs3.getString("nama_kep") + "\" alamat=\"" +
                         rs3.getString("alamat") + "\">" + cLf);
           writer3.write("<tail vote=\"" + rs3.getString("umur") + "\" sno=\"" + sno + "\" run_no=\"" + runno + "\">" + cLf);
           writer3.write("<nik>" + rs3.getString("nik") +
                          "</nik>" + cLf);
           writer3.write("<nama_lgkp>" + rs3.getString("nama_lgkp") +
                         "</nama_lgkp>" + cLf);
           writer3.write("<jk>" + rs3.getString("jk") + "</jk>" + cLf);
           writer3.write("<tmpt_lhr>" + rs3.getString("tmpt_lhr") +
                         "</tmpt_lhr>" + cLf);
           writer3.write("<tgl_lhr>" + rs3.getString("tgl_lhr") + "</tgl_lhr>" +
                         cLf);
           writer3.write("<gol_drh>" + rs3.getString("gol_drh") + "</gol_drh>" +
                         cLf);
           writer3.write("<agama>" + rs3.getString("agama") + "</agama>" + cLf);
           writer3.write("<stat_kwn>" + rs3.getString("stat_kwn") +
                         "</stat_kwn>" + cLf);
           writer3.write("<shdrt>" + rs3.getString("shdrt") + "</shdrt>" + cLf);
           writer3.write("<pddk_akh>" + rs3.getString("pddk_akh") +
                         "</pddk_akh>" + cLf);
           writer3.write("<jenis_pkrjn>" + rs3.getString("jenis_pkrjn") +
                         "</jenis_pkrjn>" + cLf);
           writer3.write("<nama_lgkp_ibu>" + rs3.getString("nama_lgkp_ibu") +
                         "</nama_lgkp_ibu>" + cLf);
           writer3.write("<nama_lgkp_ayah>" + rs3.getString("nama_lgkp_ayah") +
                         "</nama_lgkp_ayah>" + cLf);
           writer3.write("<paraf></paraf>" + cLf);
           writer3.write("</tail>" + cLf);
         }

         if ( (counter == 14) && (pgno == 1)) {
           writer3.write("</kk>" + cLf);
           writer3.write("</page>" + cLf);
           counter = 1;
           pgno++;
           writer3.write("<page no='" + pgno + "'>" + cLf);
           writer3.write("<kk nbs='" + rs3.getString("NBS") + "' nurt='" +
                         rs3.getString("NURT") + "' no_kk='" +
                         rs3.getString("no_kk") + "' nama_kep=\"" +
                         rs3.getString("nama_kep") + "\" alamat=\"" +
                         rs3.getString("alamat") + "\">" + cLf);
         }
         else if ( (counter == 18) && (pgno > 1)) {
           writer3.write("</kk>" + cLf);
           writer3.write("</page>" + cLf);
           counter = 1;
           pgno++;
           writer3.write("<page no='" + pgno + "'>" + cLf);
           writer3.write("<kk nbs='" + rs3.getString("NBS") + "' nurt='" +
                         rs3.getString("NURT") + "' no_kk='" +
                         rs3.getString("no_kk") + "' nama_kep=\"" +
                         rs3.getString("nama_kep") + "\" alamat=\"" +
                         rs3.getString("alamat") + "\">" + cLf);
         }
         old_kk = rs3.getString("no_kk");
         counter++;
         first = false;
       }
       ps2.close();
       rs3.close();
       writer3.write("</kk>" + cLf);
       writer3.write("</page>" + cLf);
       writer3.write("</rowset>" + cLf);
       writer3.close();
     }
     ps1.close();
     rs.close();
   } catch(Exception err) {
        err.printStackTrace();
   } finally{
     try {
       rs3.close();
       rs4.close();
       con.close();
     }catch(Exception err) {}
   }
 }

  public void setSessionContext(SessionContext sessionContext) {
    this.sessionContext = sessionContext;
  }
}
