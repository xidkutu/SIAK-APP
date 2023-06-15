package parameter.dasar;

import javax.ejb.*;
import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import oracle.jdbc.driver.*;
import siaktools.logwriter.SiakWriter;

public class DemografiBean implements SessionBean
{
  private SessionContext sessionContext;
  private SiakWriter siakWriter;

  public DemografiObject getDemografiData(String no_prop, String no_kab, String year) throws RemoteException
  {
    Connection conn=null;
    ConnectorDB connectorDb = new ConnectorDB();
    ResultSet rs = null;
    CallableStatement stmt = null;
    DemografiObject obj = null;

    try
    {
      conn = connectorDb.getConnection();
      String query = "begin ? := get_demografi(?,?,?); end;";
      stmt = conn.prepareCall(query);

// register the type of the out param - an Oracle specific type
      stmt.registerOutParameter(1, OracleTypes.CURSOR);

// set the in param
      stmt.setString(2, no_prop.trim());
      stmt.setString(3, no_kab.trim());
      stmt.setString(4, year.trim());

// execute and retrieve the result set
      stmt.execute();
      rs = (ResultSet)stmt.getObject(1);

      double md=0d;
      String sex_ratio="", depend_ratio="", cbr="", gfr="", asfr_x1="", asfr_x2="",
          asfr_x3="", asfr_x4="", asfr_x5="", asfr_x6="", asfr_x7="", tfr="", cwr="", cdr="", mmr="", imr_mati="",
          cmr="", apu_kawin="", apu_cerai="", apk_percerain="", imr="", omr="", nmr="";
//glb_tmp_param_dasar
      while(rs.next())
      {
        md = rs.getDouble("MD");
        System.out.println("MD Double: "+md);
        sex_ratio = rs.getString("SEX_RATIO");
        depend_ratio = rs.getString("DEPEND_RATIO");
        cbr =rs.getString("CBR");
        gfr =rs.getString("GFR");
        asfr_x1 =rs.getString("ASFR_X1");
        asfr_x2 =rs.getString("ASFR_X2");
        asfr_x3 =rs.getString("ASFR_X3");
        asfr_x4 =rs.getString("ASFR_X4");
        asfr_x5 =rs.getString("ASFR_X5");
        asfr_x6 =rs.getString("ASFR_X6");
        asfr_x7 =rs.getString("ASFR_X7");
        tfr =rs.getString("TFR");
        cwr =rs.getString("CWR");
        cdr =rs.getString("CDR");
        mmr =rs.getString("MMR");
        imr_mati =rs.getString("IMR_MATI");
        cmr =rs.getString("CMR");
        apu_kawin =rs.getString("APU_KAWIN");
        apu_cerai =rs.getString("APU_CERAI");
        imr =rs.getString("IMR");
        omr =rs.getString("OMR");
        nmr =rs.getString("NMR");

        obj = new DemografiObject(md, sex_ratio, depend_ratio,
                                                  cbr, gfr, asfr_x1, asfr_x2, asfr_x3, asfr_x4,
                                                  asfr_x5, asfr_x6, asfr_x7, tfr, cwr, cdr, mmr,
                                                  imr_mati, cmr, apu_kawin,
                                                  apu_cerai, "0", imr, omr, nmr);

      }

      if(rs!=null)
      {
          rs.close();
          rs = null;
      }
      if(stmt!=null)
      {
          stmt.close();
          stmt=null;
      }
      if(conn!=null)
      {
          conn.close();
          conn=null;
      }
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
    return obj;
  }

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "DemografiBean.class");
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