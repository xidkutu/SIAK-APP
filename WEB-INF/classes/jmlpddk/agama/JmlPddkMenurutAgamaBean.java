package jmlpddk.agama;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;

import siaktools.logwriter.SiakWriter;

public class JmlPddkMenurutAgamaBean implements SessionBean
{
  private SessionContext sessionContext;
  private Vector vProp, vKab, vKec, vKel;
  private Vector vData = new Vector();
  private String nama;
  private String jmlIslam, jmlKristen, jmlKatolik, jmlBudha, jmlLainnya, jmlPenduduk;
  private String totalJmlIslam, totalJmlKristen, totalJmlKatolik, totalJmlBudha, totalJmlLainnya
      , totalJmlPenduduk;
  private SiakWriter siakWriter;

  private String nama_tabel;

  public String getNama_tabel() throws RemoteException
  {
    return nama_tabel;
  }

 public Vector getDataPenduduk(String no_prop, String no_kab, String no_kec,
                                String daritanggal, String sampaitanggal, String nama_tabel) throws RemoteException
  {
    if( vData!=null && vData.size()>0) vData.removeAllElements();
    this.nama_tabel = nama_tabel;

    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    PreparedStatement ps = null;
    String query = "";
    Connection conn=null;
    String nama_lokasi = "", headTitle="", jumlahTitle="";
    try
    {
      conn = connectorDb.getConnection();

      if(no_kab==null && no_kec==null)
      {
        headTitle = "Kabupaten/Kotamadya";
        jumlahTitle = "Jumlah per Propinsi";

        query = "SELECT distinct LM ISLAM,KR KRISTEN,KA KATHOLIK,BD BUDHA,CNT LAIN, getNamaKab(z.no_kab,"+no_prop+") NAMA_Kab "+
            " FROM( "+
            " SELECT "+
            " COUNT(DECODE(UPPER(AGAMA),'ISLAM',1)) LM, "+
            " COUNT(DECODE(upper(AGAMA),'KRISTEN',1)) KR, "+
            " COUNT(DECODE(UPPER(AGAMA),'KATHOLIK',1)) KA, "+
            " COUNT(DECODE(UPPER(AGAMA),'BUDHA',1)) BD "+
            " FROM "+nama_tabel.trim()+" where (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+
            ") X,"+
            " (SELECT COUNT(AGAMA) CNT,NO_Kab FROM "+nama_tabel.trim()+" "+
            " WHERE UPPER(AGAMA) NOT IN('ISLAM','KRISTEN','KATHOLIK', 'BUDHA') "+
            " and (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+
            " GROUP BY NO_Kab) y, "+
            " (SELECT NO_Kab FROM "+nama_tabel.trim()+" "+
            " where (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+") Z "+
            " WHERE"+
            " Y.NO_Kab=Z.NO_Kab ";
        ps = conn.prepareStatement(query);
        nama_lokasi = "NAMA_KAB";
      }
      else if(no_kab!=null && no_kec==null)
      {
        headTitle = "Kecamatan";
        jumlahTitle = "Jumlah per Kabupaten";

        query="SELECT distinct LM ISLAM,KR KRISTEN,KA KATHOLIK,BD BUDHA,CNT LAIN, getNamaKeC(z.no_keC,"+no_kab+","+no_prop+") NAMA_KEC "+
            " FROM( "+
            " SELECT "+
            " COUNT(DECODE(UPPER(AGAMA),'ISLAM',1)) LM, "+
            " COUNT(DECODE(upper(AGAMA),'KRISTEN',1)) KR, "+
            " COUNT(DECODE(UPPER(AGAMA),'KATHOLIK',1)) KA, "+
            " COUNT(DECODE(UPPER(AGAMA),'BUDHA',1)) BD "+
            " FROM "+nama_tabel.trim()+" WHERE (TO_DATE(TGL_ENTRI) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " AND NO_PROP="+no_prop+" AND NO_KAB="+no_kab+
            ") X,"+
            " (SELECT COUNT(AGAMA) CNT,NO_KEC FROM "+nama_tabel.trim()+" "+
            " WHERE UPPER(AGAMA) NOT IN('ISLAM','KRISTEN','KATHOLIK', 'BUDHA') "+
            " and (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+" and no_kab="+no_kab+
            " GROUP BY NO_KEC) y, "+
            " (SELECT NO_KEC FROM "+nama_tabel.trim()+" "+
            " where (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+" and no_kab="+no_kab+") Z "+
            " WHERE "+
            " Y.NO_KEC=Z.NO_KEC ";

        ps = conn.prepareStatement(query);
        nama_lokasi = "NAMA_KEC";
      }
      else if(no_kab!=null && no_kec!=null)
      {
        headTitle = "Desa/Kelurahan";
        jumlahTitle = "Jumlah per Kecamatan";

        query="SELECT distinct LM ISLAM,KR KRISTEN,KA KATHOLIK,BD BUDHA,CNT LAIN,getNamaKel(z.no_kel,"+no_kec+","+no_kab+","+no_prop+") NAMA_KEL "+
            "FROM("+
            "SELECT "+
            "COUNT(DECODE(UPPER(AGAMA),'ISLAM',1)) LM,"+
            "COUNT(DECODE(upper(AGAMA),'KRISTEN',1)) KR,"+
            "COUNT(DECODE(UPPER(AGAMA),'KATHOLIK',1)) KA,"+
            "COUNT(DECODE(UPPER(AGAMA),'BUDHA',1)) BD,"+
            "NO_PROP,NO_KAB,NO_KEC,NO_KEL"+
            " FROM "+nama_tabel.trim()+" where (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec="+no_kec+
            " GROUP BY NO_PROP,NO_KAB,NO_KEC,NO_KEL) X,"+
            " (SELECT COUNT(AGAMA) CNT,NO_PROP,NO_KAB,NO_KEC,NO_KEL FROM "+nama_tabel.trim()+" "+
            " WHERE UPPER(AGAMA) NOT IN('ISLAM','KRISTEN','KATHOLIK', 'BUDHA') "+
            " and (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec="+no_kec+
            " GROUP BY NO_PROP,NO_KAB,NO_KEC,NO_KEL) y, "+
            " (SELECT NO_PROP,NO_KAB,NO_KEC,NO_KEL FROM "+nama_tabel.trim()+" "+
            " where (to_date(tgl_entri) between '"+daritanggal+"' and '"+sampaitanggal+"') "+
            " and no_prop="+no_prop+" and no_kab="+no_kab+" and no_kec="+no_kec+") Z "+
            " WHERE "+
            " X.NO_PROP=Z.NO_PROP "+
            " AND "+
            " X.NO_KAB=Z.NO_KAB "+
            " AND "+
            " X.NO_KEC=Z.NO_KEC "+
            " AND "+
            " X.NO_KEL=Z.NO_KEL "+
            " AND "+
            " Y.NO_PROP=Z.NO_PROP "+
            " AND "+
            " Y.NO_KAB=Z.NO_KAB "+
            " AND "+
            " Y.NO_KEC=Z.NO_KEC "+
            " AND "+
            " Y.NO_KEL=Z.NO_KEL ";

        ps = conn.prepareStatement(query);
        nama_lokasi = "NAMA_KEL";
      }
      System.out.println(query);
      rs = ps.executeQuery();
      System.out.println("nama_lokasi= "+nama_lokasi);
      while(rs.next())
      {
        nama = rs.getString(nama_lokasi.trim());
        System.out.println("*NAMA= "+nama);
        jmlIslam = rs.getString("ISLAM");
        jmlKristen = rs.getString("KRISTEN");
        jmlKatolik = rs.getString("KATHOLIK");
        jmlBudha = rs.getString("BUDHA");
        jmlLainnya = rs.getString("LAIN");
        jmlPenduduk = ""+(Integer.parseInt(jmlIslam)+Integer.parseInt(jmlKristen)
            +Integer.parseInt(jmlKatolik)+Integer.parseInt(jmlBudha)+Integer.parseInt(jmlLainnya));
        DataPenduduk obj = new DataPenduduk( nama
                    ,  jmlIslam, jmlKristen, jmlKatolik, jmlBudha
                    ,  jmlLainnya,  jmlPenduduk, headTitle, jumlahTitle);
        vData.addElement(obj);
      }

      rs.close();
      rs = null;
      ps.close();
      ps=null;
      conn.close();
      System.out.println("AFTER CONN CLOSE");
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
        if(rs!=null)
         {
           rs.close();
         }
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
        e.printStackTrace();
      }
      try
      {
         if(ps!=null)
          {
            ps.close();
          }
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
        e.printStackTrace();
      }
      try
      {
        if(conn!=null && !conn.isClosed())
         {
           conn.close();
         }
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
        e.printStackTrace();
      }

    }
    return vData;
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