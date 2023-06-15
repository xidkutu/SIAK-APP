package jmlpddk;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import siaktools.logwriter.SiakWriter;
import oracle.jdbc.driver.*;

public class LampidBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public Vector getDataLampid(String no_prop, String no_kab,
                              String no_kec, String year) throws RemoteException
  {
    Vector vData = new Vector();
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    CallableStatement stmt = null;

    try
    {
      conn = connectorDb.getConnection();
      String query = "begin ? := get_LAMPID_baru(?,?,?,?); end;";
      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);
// set the in param
      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, no_kec.trim());
      stmt.setString(5, year.trim());

// execute and retrieve the result set
      stmt.execute();
      rs = (ResultSet)stmt.getObject(1);
      String laki_awal,perum_awal,lahirlaki="", lahirperem="", matilaki="", matiperem="", pindlakidalam="", pindperemdalam="",
      pindahlakiluar="", pindahperemluar="", dtnglakidalam="", dtngperemdalam="", dtnglakiluar="",
      dtngperemluar="", laki_akhr="", perum_akhr="", jumlakk="";
      int ct=1;

   while(rs.next())
      {
        laki_awal=rs.getString("LAKI_AWAL");
        perum_awal=rs.getString("PERUM_AWAL");
        lahirlaki = rs.getString("LAHIRLAKI");
        lahirperem = rs.getString("LAHIRPEREM");
        matilaki = rs.getString("MATILAKI");
        matiperem = rs.getString("MATIPEREM");
        pindlakidalam = rs.getString("PINDLAKIDALAM");
        pindperemdalam = rs.getString("PINDPEREMDALAM");
        pindahlakiluar = rs.getString("PINDAHLAKILUAR");
        pindahperemluar = rs.getString("PINDAHPEREMLUAR");
        dtnglakidalam = rs.getString("DTNGLAKIDALAM");
        dtngperemdalam = rs.getString("DTNGPEREMDALAM");
        dtnglakiluar = rs.getString("DTNGLAKILUAR");
        dtngperemluar = rs.getString("DTNGPEREMLUAR");
        laki_akhr = rs.getString("LAKI_AKHR");
        perum_akhr = rs.getString("PERUM_AKHR");
        jumlakk = rs.getString("JUMLAKK");
        ct++;
        LampidObject obj = new LampidObject(laki_awal,perum_awal,lahirlaki, lahirperem, matilaki, matiperem, pindlakidalam, pindperemdalam,
                               pindahlakiluar, pindahperemluar, dtnglakidalam, dtngperemdalam, dtnglakiluar,
                               dtngperemluar, laki_akhr, perum_akhr, jumlakk);
         vData.addElement(obj);
      }

      if(rs!=null) rs.close();
      if(stmt!=null) stmt.close();
      if(conn!=null) conn.close();
    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
      System.out.println("ERROR FROM BEAN" + e.toString());
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
    return vData;

  }

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "LampidBean.class");
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
