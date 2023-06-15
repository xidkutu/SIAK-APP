package estimasi;
import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;
public class NikGandaBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "NikGandaBean");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    /**@todo Complete this method*/
  }

  public Vector getDaftarEstimasiNikGandaWNI(String date) throws RemoteException
  {
    //System.out.println("Entered into BEAN");
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    String query="";
    String tgl_qry="";
    String nik="", no_kk="", alamat="", nama_lgkp="", tmpt_lhr="", tgl_lhr="", nama_ibu="",
                nama_ayh="", no_prop="", no_kab="", no_kec="", no_kel="", nama_prop="",
                nama_kab="", nama_kec="", nama_kel="", nama_pet_entri="", nip_pet_entri="",
                tgl_entri="", gen_date="";
if (date!=null && !date.trim().equals("")) tgl_qry=" where tgl_entri='" + date + "'";

 try
    {

      conn = connectorDb.getConnection();
      query="select * from nik_ganda_wni";
      query=query+tgl_qry;
      ////System.out.println(query);
      rs=conn.prepareStatement(query).executeQuery();

   while(rs.next())
      {
        nik=rs.getString("nik");
        no_kk=rs.getString("no_kk");
        alamat=rs.getString("alamat");
        nama_lgkp=rs.getString("nama_lgkp");
        tmpt_lhr=rs.getString("tmpt_lhr");
        tgl_lhr=rs.getString("tgl_lhr");
        nama_ibu=rs.getString("nama_ibu");
        nama_ayh=rs.getString("nama_ayh");
        no_prop=rs.getString("no_prop");
        no_kab=rs.getString("no_kab");
        no_kec=rs.getString("no_kec");
        no_kel=rs.getString("no_kel");
        nama_prop=rs.getString("nama_prop");
        nama_kab=rs.getString("nama_kab");
        nama_kec=rs.getString("nama_kec");
        nama_kel=rs.getString("nama_kel");
        nama_pet_entri=rs.getString("nama_pet_entri");
        nip_pet_entri=rs.getString("nip_pet_entri");
        tgl_entri=rs.getString("tgl_entri");
        gen_date=rs.getString("gen_date");
        NikGandaObject obj = new NikGandaObject(nik, no_kk, alamat, nama_lgkp, tmpt_lhr, tgl_lhr, nama_ibu,
                    nama_ayh, no_prop, no_kab, no_kec, no_kel, nama_prop,
                    nama_kab, nama_kec, nama_kel, nama_pet_entri, nip_pet_entri,
                    tgl_entri, gen_date);
        vData.addElement(obj);
      }
      rs.close();
      conn.close();
      rs = null;
      conn = null;
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      try
      {
        if (rs != null)
          rs.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (conn != null)
          conn.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
    }
    return vData;
  }

public Vector getDaftarEstimasiNikGandaWNI(String num_prop,String num_kab,String date) throws RemoteException
   {
     Vector vData = new Vector();
      Connection conn=null;
      ConnectorDB connectorDb = new ConnectorDB();
      ResultSet rs = null;
      String query="";
      String tgl_qry="";
      String nik="", no_kk="", alamat="", nama_lgkp="", tmpt_lhr="", tgl_lhr="", nama_ibu="",
                  nama_ayh="", no_prop="", no_kab="", no_kec="", no_kel="", nama_prop="",
                  nama_kab="", nama_kec="", nama_kel="", nama_pet_entri="", nip_pet_entri="",
                  tgl_entri="", gen_date="";

 if (date!=null && !date.trim().equals("")) tgl_qry=" and tgl_entri='" + date + "'";

 query=" SELECT to_char(nik) nik,to_char(a.no_kk) no_kk,getAlamat(a.no_kk) alamat ,nama_lgkp,tmpt_lhr,";
 query=query+" tgl_lhr,nama_lgkp_ibu nama_ibu,nama_lgkp_ayah nama_ayh,no_prop,no_kab,no_kec,no_kel,";
 query=query+" getnamaprop (a.no_prop) nama_prop, getnamakab (a.no_kab, a.no_prop) nama_kab,";
 query=query+" getnamakec (a.no_kec, a.no_kab, a.no_prop) nama_kec,";
 query=query+" getnamakel (a.no_kel, a.no_kec, a.no_kab, a.no_prop) nama_kel,";
 query=query+" a.nama_pet_entri, a.nip_pet_entri, a.tgl_entri, SYSDATE gen_date";
 query=query+" FROM biodata_wni a";
 query=query+" where 3 is not null";
 query=query+" and nik=any(";
 query=query+" SELECT nik FROM biodata_wni a";
 query=query+" where no_prop=" + num_prop + " and no_kab="+ num_kab + tgl_qry;
 query=query+" and rowid <>ANY(SELECT ROWID FROM biodata_wni b";
 query=query+" WHERE ";
 query=query+" ( ";
 query=query+" upper(a.nama_lgkp)=upper(b.nama_lgkp)";
 query=query+" and upper(a.tmpt_lhr) = upper(b.tmpt_lhr)";
 query=query+" and a.tgl_lhr=b.tgl_lhr";
 query=query+" )";
 query=query+" )";
 query=query+" )";
 query=query+ "order by nama_lgkp,tmpt_lhr,TGL_LHR,no_kk";
try
      {
        conn = connectorDb.getConnection();
        rs=conn.prepareStatement(query).executeQuery();

   while(rs.next())
        {
          nik=rs.getString("nik");
          no_kk=rs.getString("no_kk");
          alamat=rs.getString("alamat");
          nama_lgkp=rs.getString("nama_lgkp");
          tmpt_lhr=rs.getString("tmpt_lhr");
          tgl_lhr=rs.getString("tgl_lhr");
          nama_ibu=rs.getString("nama_ibu");
          nama_ayh=rs.getString("nama_ayh");
          no_prop=rs.getString("no_prop");
          no_kab=rs.getString("no_kab");
          no_kec=rs.getString("no_kec");
          no_kel=rs.getString("no_kel");
          nama_prop=rs.getString("nama_prop");
          nama_kab=rs.getString("nama_kab");
          nama_kec=rs.getString("nama_kec");
          nama_kel=rs.getString("nama_kel");
          nama_pet_entri=rs.getString("nama_pet_entri");
          nip_pet_entri=rs.getString("nip_pet_entri");
          tgl_entri=rs.getString("tgl_entri");
          gen_date=rs.getString("gen_date");
          NikGandaObject obj = new NikGandaObject(nik, no_kk, alamat, nama_lgkp, tmpt_lhr, tgl_lhr, nama_ibu,
                      nama_ayh, no_prop, no_kab, no_kec, no_kel, nama_prop,
                      nama_kab, nama_kec, nama_kel, nama_pet_entri, nip_pet_entri,
                      tgl_entri, gen_date);
          vData.addElement(obj);
        }
        rs.close();
        conn.close();
        rs = null;
        conn = null;
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      finally
      {
        try
        {
          if (rs != null)
            rs.close();
        }
        catch(Exception e)
        {
          siakWriter.writeFile(e);
        }
        try
        {
          if (conn != null)
            conn.close();
        }
        catch(Exception e)
        {
          siakWriter.writeFile(e);
        }
      }
      return vData;
   }


public Vector getDaftarEstimasiNikGandaWNI(String num_prop,String num_kab,String num_kec,String date) throws RemoteException
{
        Vector vData = new Vector();
        Connection conn=null;
        ConnectorDB connectorDb = new ConnectorDB();
        ResultSet rs = null;
        String query="";
        String tgl_qry="";
        String nik="", no_kk="", alamat="", nama_lgkp="", tmpt_lhr="", tgl_lhr="", nama_ibu="",
                    nama_ayh="", no_prop="", no_kab="", no_kec="", no_kel="", nama_prop="",
                    nama_kab="", nama_kec="", nama_kel="", nama_pet_entri="", nip_pet_entri="",
                    tgl_entri="", gen_date="";

   if (date!=null && !date.trim().equals("")) tgl_qry=" and tgl_entri='" + date + "'";

   query=" SELECT to_char(nik) nik,to_char(a.no_kk) no_kk,getAlamat(a.no_kk) alamat ,nama_lgkp,tmpt_lhr,";
   query=query+" tgl_lhr,nama_lgkp_ibu nama_ibu,nama_lgkp_ayah nama_ayh,no_prop,no_kab,no_kec,no_kel,";
   query=query+" getnamaprop (a.no_prop) nama_prop, getnamakab (a.no_kab, a.no_prop) nama_kab,";
   query=query+" getnamakec (a.no_kec, a.no_kab, a.no_prop) nama_kec,";
   query=query+" getnamakel (a.no_kel, a.no_kec, a.no_kab, a.no_prop) nama_kel,";
   query=query+" a.nama_pet_entri, a.nip_pet_entri, a.tgl_entri, SYSDATE gen_date";
   query=query+" FROM biodata_wni a";
   query=query+" where 3 is not null";
   query=query+" and nik=any(";
   query=query+" SELECT nik FROM biodata_wni a";
   query=query+" where no_prop=" + num_prop + " and no_kab="+ num_kab + " and no_kec=" + num_kec + tgl_qry;
   query=query+" and rowid <>ANY(SELECT ROWID FROM biodata_wni b";
   query=query+" WHERE ";
   query=query+" ( ";
   query=query+" upper(a.nama_lgkp)=upper(b.nama_lgkp)";
   query=query+" and upper(a.tmpt_lhr) = upper(b.tmpt_lhr)";
   query=query+" and a.tgl_lhr=b.tgl_lhr";
   query=query+" )";
   query=query+" )";
   query=query+" )";
   query=query+ "order by nama_lgkp,tmpt_lhr,TGL_LHR,no_kk";
try
        {
          conn = connectorDb.getConnection();
          rs=conn.prepareStatement(query).executeQuery();

     while(rs.next())
          {

            nik=rs.getString("nik");
            no_kk=rs.getString("no_kk");
            alamat=rs.getString("alamat");
            nama_lgkp=rs.getString("nama_lgkp");
            tmpt_lhr=rs.getString("tmpt_lhr");
            tgl_lhr=rs.getString("tgl_lhr");
            nama_ibu=rs.getString("nama_ibu");
            nama_ayh=rs.getString("nama_ayh");
            no_prop=rs.getString("no_prop");
            no_kab=rs.getString("no_kab");
            no_kec=rs.getString("no_kec");
            no_kel=rs.getString("no_kel");
            nama_prop=rs.getString("nama_prop");
            nama_kab=rs.getString("nama_kab");
            nama_kec=rs.getString("nama_kec");
            nama_kel=rs.getString("nama_kel");
            nama_pet_entri=rs.getString("nama_pet_entri");
            nip_pet_entri=rs.getString("nip_pet_entri");
            tgl_entri=rs.getString("tgl_entri");
            gen_date=rs.getString("gen_date");

            NikGandaObject obj = new NikGandaObject(nik, no_kk, alamat, nama_lgkp, tmpt_lhr, tgl_lhr, nama_ibu,
                        nama_ayh, no_prop, no_kab, no_kec, no_kel, nama_prop,
                        nama_kab, nama_kec, nama_kel, nama_pet_entri, nip_pet_entri,
                        tgl_entri, gen_date);
            vData.addElement(obj);
          }
          rs.close();
          conn.close();
          rs = null;
          conn = null;
        }
        catch(Exception e)
        {
          e.printStackTrace();
        }
        finally
        {
          try
          {
            if (rs != null)
              rs.close();
          }
          catch(Exception e)
          {
            siakWriter.writeFile(e);
          }
          try
          {
            if (conn != null)
              conn.close();
          }
          catch(Exception e)
          {
            siakWriter.writeFile(e);
          }
        }
        return vData;
      }


public boolean deleteNikGanda(String level,String nik) throws RemoteException
      {
        boolean flag=false;
        CallableStatement cs = null;
        ConnectorDB connectorDb = new ConnectorDB();
        Connection conn = connectorDb.getConnection();
        try
        {
          cs = conn.prepareCall("{call deleteNikGanda(?,?)}");
          cs.setString(1, level);
          cs.setString(2, nik);
          cs.execute();
          flag=true;
        }catch(Exception err)
        {
          err.printStackTrace();
          flag=false;
        }
        finally
         {
           try
           {
             if (cs != null)
               cs.close();
           }
           catch(Exception e)
           {
             siakWriter.writeFile(e);
           }
           try
           {
             if (conn != null)
               conn.close();
           }
           catch(Exception e)
           {
             siakWriter.writeFile(e);
           }
         }

return flag;
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

  public Vector getDaftarEstimasiNikGandaWNA(String date) throws RemoteException
  {
    return null;
  }

  public Vector getDaftarEstimasiNikGandaWNA(String no_prop,String no_kab,String date) throws RemoteException
  {
    return null;
  }

  public Vector getDaftarEstimasiNikGandaWNA(String no_prop,String no_kab,String no_kec,String date) throws RemoteException
  {
    return null;
  }

}
