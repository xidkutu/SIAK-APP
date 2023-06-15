package setupwilayah;
import javax.ejb.*;
import java.util.Vector;
import java.sql.*;
import com.db.connection.ConnectorDB;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class WilayalistBean implements SessionBean
{
  SessionContext sessionContext;
  Connection con;
  ConnectorDB con_db;
  Statement st,st1;
  ResultSet rs,rs1;
  Vector _vtprop,_vtkab;
  String sql,sql1;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "KabBean.class");
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
  public getWilayah getWilayahList()
  {
    getWilayah wilayah_data=null;
    try
    {
      con_db = new ConnectorDB();
      con = con_db.getConnection();

      if (con != null) {
        st = con.createStatement();
        sql = "select no_prop,nama_prop from setup_prop";
        rs = st.executeQuery(sql);
        _vtprop = new Vector();
        if (rs != null) {
          while (rs.next()) {
            getProvinsi new_record = new getProvinsi(rs.getString("no_prop"),
                                             rs.getString("nama_prop"));
           _vtprop.addElement(new_record);
          }
        }
        st.close();
        rs.close();

        st1 = con.createStatement();

        sql1 = "select no_kab,nama_kab,no_prop from setup_kab";
        rs1 = st1.executeQuery(sql1);
        _vtkab = new Vector();
        if (rs1 != null) {
          while (rs1.next()) {
            getKabupaten new_record1 = new getKabupaten(rs1.getString("no_kab"),
                                             rs1.getString("nama_kab"),
                                             rs1.getString("no_prop"));
           _vtkab.addElement(new_record1);
          }
        }
        st1.close();
        rs1.close();

            }
      con.close();

    }
    catch(Exception e)
    {
      siakWriter.writeFile(e);
    System.out.println(e.toString());
  }
    finally
    {
      try{
          if(con!=null){con.close();}
      }catch(Exception e1){ }

      try{
        if(st!=null){st.close();}
      }catch(Exception e2){siakWriter.writeFile(e2); }

      try{
        if(st1!=null){st1.close();}
            }catch(Exception e3){siakWriter.writeFile(e3); }

       try{
              if(rs!=null){rs.close();}
                  }catch(Exception e5){ siakWriter.writeFile(e5); }
       try{
           if(rs1!=null){rs1.close();}
           }catch(Exception e6){ siakWriter.writeFile(e6); }
      }
wilayah_data=new getWilayah(_vtprop,_vtkab);
return (wilayah_data);
}
}
