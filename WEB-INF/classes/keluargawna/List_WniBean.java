package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.sql.*;
import siaktools.logwriter.*;
import com.db.connection.*;

public class List_WniBean implements SessionBean {
  SessionContext sessionContext;
  Vector ve;
  String no_kk;
  String sql;
  Statement st;
  ConnectorDB con_db;
  Connection con;
  ResultSet rs;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "List_WniBean.class");
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
  public Vector daftarKeluarga(String no_kk)
  {
    this.no_kk = no_kk;

  try
    {
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();

    if (con!=null)
             {
st = con.createStatement();
sql = "select * from daftar_pindah_keluarga where no_kk=" + no_kk;
               rs = st.executeQuery(sql);
               System.out.println(sql);
               ve = new Vector();
                if (rs != null) {
                while (rs.next()) {
  List_Perpindahan new_record = new List_Perpindahan(rs.getString("NIK"),
                                                      rs.getString("NAMA_LGKP"),
                                                      rs.getString("STAT_HBKEL"),
                                                      rs.getString("NO_KK"),
                                                      rs.getString("NAMA_KEP"),
                                                      rs.getString("ALAMAT"),
                                                      rs.getString("NO_RT"),
                                                      rs.getString("NO_RW"),
                                                      rs.getString("DUSUN"),
                                                      rs.getString("KODE_POS"),
                                                      rs.getString("TELP"),
                                                      rs.getString("NAMA_PROP"),
                                                      rs.getString("NAMA_KAB"),
                                                      rs.getString("NAMA_KEC"),
                                                      rs.getString("NAMA_KEL"));
ve.addElement(new_record);

                     }

               }

               rs.close();
               st.close();
               con.close();
             }
   }catch(Exception e)
   {
     e.printStackTrace();
     siakWriter.writeFile(e);
   }

   finally{
     try {
               if (rs != null)
                 rs.close();
             }  catch (Exception x) {siakWriter.writeFile(x);}

            try{
              if (st!=null) st.close();
              }catch(Exception y){siakWriter.writeFile(y);}

               try{
              if (con!=null) con.close();
              }catch(Exception z){siakWriter.writeFile(z);}
           }
  return ve;
 }
}