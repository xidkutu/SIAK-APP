package datawilayah;

import javax.ejb.*;
import java.sql.*;
import java.util.Vector;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import java.io.*;

public class KelBean implements SessionBean
{
  private SessionContext sessionContext;
  private int no_kel,no_kec,no_kab,no_prop;
  private String nama_kel,select,insert,select1;
  private Vector v;
  private SiakWriter siakWriter;
  private String path="",sep_path="";
  ConnectorDB connect = null;
  Connection conn=null;
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
          siakWriter = new SiakWriter(path, "KelBean.class");
        sep_path=res.getString("SEP_PATH");
        path=path.substring(0,path.lastIndexOf(sep_path));
        path=path+sep_path;
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

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
  // Business Logic Implementation
public boolean checkKelurahan(int a,String str,int b,int c,int d)
  {
      this.no_kel = a;
      this.nama_kel = str;
      this.no_kec = b;
      this.no_kab = c;
      this.no_prop = d;
      int i = 0;
      connect=new ConnectorDB();
      select = "SELECT * FROM setup_kel where no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec="+no_kec+" and no_kel="+no_kel;
      Statement st = null;
      ResultSet rs = null;

try
      {
        conn = connect.getConnection();
        st = conn.createStatement();
        rs = st.executeQuery(select);
        int count = 0;
        while(rs.next())
        {
           count++;
           no_kel = rs.getInt(1);
           nama_kel = rs.getString(2);
           no_kec = rs.getInt(3);
           no_kab = rs.getInt(4);
           no_prop = rs.getInt(5);
        }
        if(count != 1)
        {
          insert = "INSERT INTO SETUP_KEL(NO_KEL,NAMA_KEL,NO_KEC,NO_KAB,NO_PROP)VALUES("+no_kel +",'"+nama_kel+"',"+no_kec+","+no_kab+","+no_prop+")";
          i = st.executeUpdate(insert);
        }

       rs.close();
       st.close();
       conn.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }

      finally
      {
        try {
          if (rs != null) rs.close();
        }catch(Exception a1){siakWriter.writeFile(a1);}

        try{
         if (st != null) st.close();
        }catch(Exception b1){siakWriter.writeFile(b1);}

        try{
         if (conn != null) conn.close();
        }catch(Exception c1){siakWriter.writeFile(c1);}
    }

    if(i == 1)
    {
       return true;
    }
    else
    {
       return false;
    }
}

  public Vector list(String prop,String kab,String kec)
  {
     v = new Vector();
     ConnectorDB connect = new ConnectorDB();
     Connection conn=null;
     Statement st1 = null;
     ResultSet rs1 = null;

     try
     {
       conn = connect.getConnection();
       select1 = "SELECT to_char(no_kel,'0000'),nama_kel FROM setup_kel where no_prop="+prop+" and no_kab="+kab+" and no_kec="+kec+" order by no_kel";
       st1 = conn.createStatement();
       rs1 = st1.executeQuery(select1);

       while(rs1.next())
       {
         v.addElement((Object)rs1.getString(1));
         v.addElement((Object)rs1.getString(2));
       }
       rs1.close();
       st1.close();
       conn.close();
       rs1 =null;
       st1=null;
       conn=null;
     }
     catch(Exception e)
     {
       siakWriter.writeFile(e);
       System.out.println("Exception in Select_Kel : " + e);
     }
     finally
     {
       try {
          if (rs1 != null) rs1.close();
        }catch(Exception a1){siakWriter.writeFile(a1);}

       try{
         if (st1 != null) st1.close();
        }catch(Exception b1){siakWriter.writeFile(b1);}

       try{
         if (conn != null) conn.close();
        }catch(Exception c1){siakWriter.writeFile(c1);}
     }
     return (v);
   }


private  void writeKels(String noProp, String noKab, String noKec) {
  ResultSet rs3=null;
  Statement st3=null;
  int iLf = 10;
  char cLf = (char)iLf;
  try{
    File outfile3=new File(path + "kc"+ noProp + noKab +noKec + ".xml");
    FileWriter writer3=new FileWriter(outfile3);
    writer3.write("<?xml version='1.0' encoding='ISO-8859-1'?>"+cLf);
    writer3.write("<rowset>" + cLf);
    st3=conn.createStatement();
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

  } catch(Exception err) {
       err.printStackTrace();
  } finally{
    try {
      if (rs3!=null) rs3.close();
    }catch(Exception err) {}
  }
}


 }



