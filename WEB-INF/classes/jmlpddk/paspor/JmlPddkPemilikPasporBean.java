package jmlpddk.paspor;

import javax.ejb.*;

import java.util.*;
import java.rmi.*;
import com.db.connection.*;
import java.sql.*;
import oracle.jdbc.driver.*;

import jmlpddk.agama.ListProp;
import siaktools.logwriter.SiakWriter;

public class JmlPddkPemilikPasporBean implements SessionBean
{
  private SessionContext sessionContext;
  private Vector vProp;
  private Vector vData = new Vector();
  private SiakWriter siakWriter;
 private ResultSet rs;

 public Vector getDataPenduduk(String no_prop,
                                String no_kab, String no_kec) throws RemoteException
  {

            Connection con=null;
             CallableStatement stmt=null;
              ResultSet rs=null;
              ConnectorDB con_db=null;
              Vector vt_per=null;
              try
                   {
                    con_db = new ConnectorDB();
                    con = con_db.getConnection();

                    if (con != null) {

                      String query = "begin ? := get_paspor(?,?,?); end;";
                      stmt = con.prepareCall(query);

                      stmt.registerOutParameter(1, OracleTypes.CURSOR);

                      stmt.setString(2, no_prop.trim());
                      stmt.setString(3, no_kab.trim());
                      stmt.setString(4, no_kec.trim());
                      stmt.execute();

                      rs = (ResultSet)stmt.getObject(1);

                      vData=new Vector();

                    while(rs.next())
                           {
                    PasporObject record=
                        new PasporObject(rs.getString("NAMA_WIL"),
                                         rs.getString("Ada"),
                                         rs.getString("Tada"));

                             vData.add(record);
                           }
                     }
                     rs.close();
                     stmt.close();
                     con.close();
                     }catch(Exception e3)
                     {
                       System.out.println("Error in Session Facade=" + e3.toString());
                     }
           finally
               {
                 try{
            if(rs!=null)
            {
              rs.close();
             }
            }catch(Exception ee5){  }
            try{
              if(stmt!=null)
                {
                  stmt.close();
                }
            }catch(Exception ee5){ }

                 try{
                     if(con!=null)
                     {
                       con.close();
                     }
                 }catch(Exception ee2){ }

               }
//      System.out.println("size is"+vt_ak.size());
               return(vData);

  }

  public Vector getDataPropinsi() throws RemoteException
  {
    ConnectorDB connectorDb = new ConnectorDB();
    Connection conn=null;
    ResultSet rs= null;
    PreparedStatement ps = null;
    String query = "";

    if(vProp!=null && vProp.size()>0)
    {
      vProp.removeAllElements();
    }
    try
    {
      conn = connectorDb.getConnection();

      if (conn != null) {
        query =
            "select to_char(no_prop,'00') no_prop,nama_prop from setup_prop";
        ps = conn.prepareStatement(query);
        //sql = "select no_prop,nama_prop from setup_prop order by no_prop";
        rs = ps.executeQuery();
        vProp = new Vector();
        if (rs != null) {
          while (rs.next()) {
            ListProp propObj = new ListProp(rs.getString("no_prop"),
                                            rs.getString("nama_prop"));
            vProp.addElement(propObj);
          }
        }
        rs.close();
        ps.close();
        conn.close();
      }
    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
      e.printStackTrace();
    }
    return vProp;
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