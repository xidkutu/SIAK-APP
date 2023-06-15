package pendaftaran;

import javax.ejb.*;
import java.util.Vector;
import com.db.connection.ConnectorDB;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class DataWilayahaListBean implements SessionBean {
  SessionContext sessionContext;
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
  public DataWilayahaListInfo getWilayahList()
  {
    ConnectorDB connect = new ConnectorDB();
    String sql,sql1,sql2,sql3;
    DataWilayahaListInfo wilayah_data=null;
    Vector _vtprop =null,_vtkab=null,_vtkec=null,_vtkel=null;
    Connection conn=null;
    Statement stprop = null, stkab=null, stkec=null,stkel=null;
    ResultSet rsprop = null, rskab=null,rskec=null,rskel=null;

    try
    {
      conn = connect.getConnection();
      if (conn != null) {
//        sql = "select no_prop,nama_prop from setup_prop order by no_prop";
  sql = "select no_prop,nama_prop from setup_prop";
        stprop = conn.createStatement();
        rsprop = stprop.executeQuery(sql);
        _vtprop = new Vector();
        if (rsprop != null) {
          while (rsprop.next()) {
            GetPropList new_record = new GetPropList(rsprop.getString("no_prop"),
                                             rsprop.getString("nama_prop"));
           _vtprop.addElement(new_record);
          }
        }
       stprop.close();
       rsprop.close();

      //  sql1 = "select no_kab,nama_kab,no_prop from setup_kab order by no_kab";
        sql1 = "select no_kab,nama_kab,no_prop from setup_kab";
        stkab = conn.createStatement();
        rskab = stkab.executeQuery(sql1);
        _vtkab = new Vector();
        if (rskab != null) {
          while (rskab.next()) {
            GetKabList new_record1 = new GetKabList(rskab.getString("no_kab"),
                                             rskab.getString("nama_kab"),
                                             rskab.getString("no_prop"));
           _vtkab.addElement(new_record1);
          }
        }
        stkab.close();
        rskab.close();

//      sql2 = "select no_kec,nama_kec,no_kab,no_prop from setup_kec order by no_kec";
            sql2 = "select no_kec,nama_kec,no_kab,no_prop from setup_kec";
            stkec = conn.createStatement();
                rskec = stkec.executeQuery(sql2);
                _vtkec = new Vector();
                if (rskec != null) {
                  while (rskec.next()) {
                    GetKecList new_record2 = new GetKecList(rskec.getString("no_kec"),
                                                     rskec.getString("nama_kec"),
                                                     rskec.getString("no_kab"),
                                                     rskec.getString("no_prop"));
                   _vtkec.addElement(new_record2);
                  }
                }
                stkec.close();
                rskec.close();
//                sql3 = "select no_kel,nama_kel,no_kec,no_kab,no_prop from setup_kel order by no_kel";
 sql3 = "select no_kel,nama_kel,no_kec,no_kab,no_prop from setup_kel";
 stkel = conn.createStatement();
  rskel = stkel.executeQuery(sql3);
                  _vtkel = new Vector();
                  if (rskel != null) {
                  while (rskel.next()) {
                  GetKelList new_record3 = new GetKelList(rskel.getString("no_kel"),
                                                   rskel.getString("nama_kel"),
                                                   rskel.getString("no_kec"),
                                                   rskel.getString("no_kab"),
                                                     rskel.getString("no_prop"));
                   _vtkel.addElement(new_record3);
                                  }
                                }
                                stkel.close();
                                rskel.close();
            }

      conn.close();

    }catch(Exception e){
      System.out.println("Exception in DataWilayah : " + e);
      siakWriter.writeFile(e);
    }
    finally
    {
      try{
          if(conn!=null)
          {
            conn.close();
          }
      }catch(Exception e1){ siakWriter.writeFile(e1);}

      try{
        if(stprop!=null)
          {
            stprop.close();
          }
      }catch(Exception e2){siakWriter.writeFile(e2); }

      try{
        if(stkab!=null)
                {
                  stkab.close();
                }
            }catch(Exception e3){siakWriter.writeFile(e3); }

            try{
              if(stkec!=null)
                      {
                        stkec.close();
                      }
                  }catch(Exception e4){ siakWriter.writeFile(e4); }
                  try{
              if(stkel!=null)
                      {
                        stkel.close();
                      }
                  }catch(Exception e9){ siakWriter.writeFile(e9); }

                  try{
              if(rsprop!=null)
                      {
                        rsprop.close();
                      }
                  }catch(Exception e5){ siakWriter.writeFile(e5); }
 try{
  if(rskab!=null)
  {
      rskab.close();
       }
  }catch(Exception e6){ siakWriter.writeFile(e6); }
  try{
   if(rskec!=null)
 {
  rskec.close();
 }
}catch(Exception e7){ siakWriter.writeFile(e7); }
  try{
     if(rskel!=null)
   {
   rskel.close();
   }
 }catch(Exception e8){ siakWriter.writeFile(e8); }

 }
wilayah_data=new DataWilayahaListInfo(_vtprop,_vtkab,_vtkec,_vtkel);
return (wilayah_data);
}
 }
