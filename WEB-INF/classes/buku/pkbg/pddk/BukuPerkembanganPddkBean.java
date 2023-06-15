package buku.pkbg.pddk;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import kartukeluarga.DataKelurahan;
import siaktools.logwriter.SiakWriter;
import oracle.jdbc.driver.*;

public class BukuPerkembanganPddkBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;
  private String jumlaki,jumperem,jum_lk_prm,lakiwni="",peremwni="",lakiwna="",peremwna="";
  private Vector result=null;
  BukuPerkembanganPddkObject obj=null;

  public Vector getDataBukuPerkembanganPenduduk(String no_prop, String no_kab,
                                           String no_kec, String no_kel) throws RemoteException
  {
    String query="";
    Connection conn=null;
    ResultSet rs = null;
    CallableStatement stmt = null;
    result=new Vector();
    boolean cha=false,chb=false,chc=false;

try
  {
    ConnectorDB connectorDb = new ConnectorDB();
    conn = connectorDb.getConnection();


if (isNull(no_prop) && isNull(no_kab) &&  isNull(no_kec) && isNull(no_kel))
    {
      query = "begin ? :=pkgPerKm.Get_perkem_pddk(?,?,?,?); end;";
     stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param

      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, no_kec.trim());
      stmt.setString(5, no_kel.trim());
      cha=true;
    }

if (isNull(no_prop) && isNull(no_kab) &&  isNull(no_kec) && !cha)
    {
      query = "begin ? :=pkgPerKm.Get_perkem_pddk(?,?,?); end;";
      stmt = conn.prepareCall(query);
// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, no_kec.trim());
            chb=true;
    }

if (isNull(no_prop) && isNull(no_kab) && !cha && !chb)
    {
      query = "begin ? :=pkgPerKm.Get_perkem_pddk(?,?); end;";
      stmt = conn.prepareCall(query);
// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
            chc=true;
    }

if (isNull(no_prop) && !cha && !chb && !chc)
    {
      query = "begin ? :=pkgPerKm.Get_perkem_pddk(?); end;";
      stmt = conn.prepareCall(query);
// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
      stmt.setString(2, no_prop.trim());
    }

      stmt.execute();
      rs = (ResultSet)stmt.getObject(1);

   while(rs.next())
      {
        lakiwni = rs.getString("LAKI_WNI");
        peremwni = rs.getString("PEREM_WNI");
        lakiwna = rs.getString("LAKIR_WNA");
        peremwna = rs.getString("PEREM_WNA");
        jumlaki = rs.getString("JUM_LAKI");
        jumperem = rs.getString("JUM_PEREM");
        jum_lk_prm = rs.getString("JUM_LAKI_PEREM");
        obj = new BukuPerkembanganPddkObject(lakiwni, peremwni, lakiwna, peremwna,
        jumlaki, jumperem,jum_lk_prm);
        result.addElement(obj);
      }
      if(rs!=null) rs.close();
      if(stmt!=null) stmt.close();
      if(conn!=null) conn.close();
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
        if (rs != null)
          rs.close();
      }
      catch(Exception e)
      {
        siakWriter.writeFile(e);
      }
      try
      {
        if (stmt != null)
          stmt.close();
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
  private boolean isNull(String data)
  {
      if ((data!=null) && !(data.trim().equals("0"))) return true;
      return false;
  }
}