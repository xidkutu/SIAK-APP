package keluargawna;

import javax.ejb.*;
import java.util.Vector;
import java.sql.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;


public class Get_AllWilayahaBean implements SessionBean
{
  SessionContext sessionContext;
  Connection con,con1;
  Statement st,st1,st2,st3,st4,st5;
  ResultSet rs,rs1,rs2,rs3,rs4,rs5;
  Vector _vtprop,_vtkab,_vtkec,_vtkel,Wna_kec,Wna_kel;
  ConnectorDB con_db,con_db1;
  String sql,sql1,sql2,sql3,sql4,sql5;
  private SiakWriter siakWriter;


  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "Get_AllWilayahaBean.class");
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

 public WIlayahInfo getWilayahList() throws WilayahException
  {
    WIlayahInfo wilayah_data=null;
    String sql1;
    Statement st_tot=null;
    ResultSet rs_tot=null;

    try
    {

      con_db = new ConnectorDB();
      con = con_db.getConnection();

    if (con != null) {

      st = con.createStatement();

     sql = "select trim(to_char(no_prop,'00')) no_prop ,nama_prop from setup_prop order by no_prop";

      rs = st.executeQuery(sql);

      _vtprop = new Vector();

      if (rs != null) {

        while (rs.next()) {

          GetProp new_record = new GetProp(rs.getString("no_prop"),
                                           rs.getString("nama_prop"));

      sql1 = "select distinct tot_kab from jumlah_wilayah where no_prop=" + rs.getString("no_prop");

      System.out.println(" Before execure !!!!! ");
          st_tot = con.createStatement();
      System.out.println(" After statement execute !!!!! ");
       System.out.println("SQL1" + sql1);
         rs_tot = st_tot.executeQuery(sql1);
   System.out.println(" After execure !!!!! ");

          while (rs_tot.next())
          {
           System.out.println(" Inside while loop for prop execure !!!!! ");
            new_record.setTotKab(rs_tot.getString("tot_kab"));
          }
           System.out.println("new_record.getTotKab()" + new_record.getTotKab());
          _vtprop.addElement(new_record);

          rs_tot.close();
          st_tot.close();
        }
      }
      st.close();
      rs.close();

      st1 = con.createStatement();

      //sql1 = "select no_kab,nama_kab from setup_kab order by no_kab";

      sql1 = "select trim(to_char(no_kab,'00')) no_kab,nama_kab,trim(to_char(no_prop,'00')) no_prop  from setup_kab order by no_prop,no_kab";

      rs1 = st1.executeQuery(sql1);
      _vtkab = new Vector();

      if (rs1 != null) {

        while (rs1.next()) {

          GetKab new_record1 = new GetKab(rs1.getString("no_kab"),
                                          rs1.getString("nama_kab"),
                                          rs1.getString("no_prop"));

          sql1 = "select distinct tot_kec from jumlah_wilayah where no_prop=" +
              rs1.getString("no_prop") + " and no_kab=" +
              rs1.getString("no_kab");

          st_tot = con.createStatement();
          rs_tot = st_tot.executeQuery(sql1);

          while (rs_tot.next()) {
            new_record1.setTotKec(rs_tot.getString("tot_kec"));
          }
          _vtkab.addElement(new_record1);
          System.out.println("new_record1.getTotKec()" +  new_record1.getTotKec() );

                   rs_tot.close();
                    st_tot.close();
        }
      }

      st1.close();
      rs1.close();
      st2 = con.createStatement();

      //sql2 = "select no_kec,nama_kec from setup_kec order by no_kec";

      sql2 = "select trim(to_char(no_kec,'00')) no_kec ,nama_kec,trim(to_char(no_kab,'00')) no_kab,trim(to_char(no_prop,'00')) no_prop  from setup_kec order by no_prop,no_kab,no_kec";
      rs2 = st2.executeQuery(sql2);
      _vtkec = new Vector();
      if (rs2 != null) {

        while (rs2.next()) {
          GetKec new_record2 = new GetKec(rs2.getString("no_kec"),
                                          rs2.getString("nama_kec"),
                                          rs2.getString("no_kab"),
                                          rs2.getString("no_prop"));

          sql1 = "select tot_kel from jumlah_wilayah where no_prop=" +
              rs2.getString("no_prop") + " and no_kab=" +
              rs2.getString("no_kab") + " and no_kec=" +
              rs2.getString("no_kec");

          st_tot = con.createStatement();
          rs_tot = st_tot.executeQuery(sql1);

          while (rs_tot.next()) {
            new_record2.setTotKel(rs_tot.getString("tot_kel"));
          }
           _vtkec.addElement(new_record2);
          System.out.println("new_record2.getTotKel()" +new_record2.getTotKel());
          rs_tot.close();
          st_tot.close();
        }
      }

      st2.close();
      rs2.close();
      st3 = con.createStatement();

      //sql3 = "select no_kel,nama_kel from setup_kel order by no_kel";

sql3 = "select trim(to_char(no_kel,'0000')) no_kel,nama_kel,trim(to_char(no_kec,'00')) no_kec,trim(to_char(no_kab,'00')) no_kab, trim(to_char(no_prop,'00')) no_prop from setup_kel order by no_prop,no_kab,no_kec,no_kel";

      rs3 = st3.executeQuery(sql3);
      _vtkel = new Vector();

      if (rs3 != null) {
        while (rs3.next()) {
          GetKel new_record3 = new GetKel(rs3.getString("no_kel"),
                                          rs3.getString("nama_kel"),
                                          rs3.getString("no_kec"),
                                          rs3.getString("no_kab"),
                                          rs3.getString("no_prop"));
          _vtkel.addElement(new_record3);
        }
      }
      st3.close();
      rs3.close();
      con.close();
    }
  }    catch(Exception e){
      siakWriter.writeFile(e);
         new WilayahException("Error in Get_AllWilayah : "+e.toString());
    }
    finally
    {
      try{
          if(con!=null)
          {
            con.close();
          }
      }catch(Exception e1){siakWriter.writeFile(e1); }

      try{
        if(st!=null)
          {
            st.close();
          }
      }catch(Exception e2){ siakWriter.writeFile(e2);}

      try{
        if(st1!=null)
                {
                  st1.close();
                }
            }catch(Exception e3){siakWriter.writeFile(e3); }

            try{
              if(st2!=null)
                      {
                        st2.close();
                      }
                  }catch(Exception e4){ siakWriter.writeFile(e4); }
                  try{
              if(st3!=null)
                      {
                        st3.close();
                      }
                  }catch(Exception e9){ siakWriter.writeFile(e9); }

                  try{
              if(rs!=null)
                      {
                        rs.close();
                      }
                  }catch(Exception e5){ siakWriter.writeFile(e5); }
 try{
  if(rs1!=null)
  {
      rs1.close();
       }
  }catch(Exception e6){ siakWriter.writeFile(e6); }
  try{
   if(rs2!=null)
 {
  rs2.close();
 }
}catch(Exception e7){ siakWriter.writeFile(e7); }
  try{
     if(rs3!=null)
   {
   rs3.close();
   }
 }catch(Exception e8){ siakWriter.writeFile(e8); }

 }
wilayah_data=new WIlayahInfo(_vtprop,_vtkab,_vtkec,_vtkel);
return (wilayah_data);
}

public WIlayahInfo getWilayahWna(String nprop, String nkab)
  {
    WIlayahInfo wilayah_data=null;
    try
    {
      con_db1 = new ConnectorDB();
      con1 = con_db1.getConnection();
      //System.out.println("in side bean "+ nprop+"  "+nkab+"   "+con1);
      if (con1 != null)
      {
                 st4 = con1.createStatement();
                 sql4 = "select to_char(no_kec,'00') no_kec,nama_kec,to_char(no_kab, '00') no_kab,to_char(no_prop,'00') no_prop, NAMA_PEJ, NIP_PEJ from setup_kec where no_prop="+nprop+" and no_kab="+nkab+"";
                //System.out.println(sql4);
                rs4 = st4.executeQuery(sql4);
                Wna_kec = new Vector();
                if (rs4 != null) {
                  while (rs4.next()) {
                    GetKec new_record4 = new GetKec(rs4.getString("no_kec"),
                                                     rs4.getString("nama_kec"),
                                                     rs4.getString("no_kab"),
                                                     rs4.getString("no_prop"),
                                                     rs4.getString("NAMA_PEJ"),
                                                     rs4.getString("NIP_PEJ"));
                   Wna_kec.addElement(new_record4);
                  }
                }
                st4.close();
                rs4.close();
                st5= con1.createStatement();
                sql5 = "select to_char(no_kel,'0000') no_kel,nama_kel,to_char(no_kec,'00') no_kec,to_char(no_kab,'00') no_kab, to_char(no_prop,'00') no_prop,NAMA_LUR, NIP_LUR from setup_kel where no_prop="+nprop+" and no_kab="+nkab+"";
                //System.out.println(sql5);
                rs5 = st5.executeQuery(sql5);
                  Wna_kel = new Vector();
                  if (rs5 != null) {
                  while (rs5.next()) {
                  GetKel new_record5 = new GetKel(rs5.getString("no_kel"),
                                                   rs5.getString("nama_kel"),
                                                   rs5.getString("no_kec"),
                                                   rs5.getString("no_kab"),
                                                   rs5.getString("no_prop"),
                                                   rs5.getString("NAMA_LUR"),
                                                   rs5.getString("NIP_LUR"));
                   Wna_kel.addElement(new_record5);
                                  }
                                }
                                st5.close();
                                rs5.close();
            }
      con1.close();
    }catch(Exception e){
      siakWriter.writeFile(e);
          System.out.println("Error in Get_AllWilayah : "+e.toString());}
    finally
    {
      try{
          if(con1!=null)
          {
            con1.close();
          }
      }catch(Exception e1){siakWriter.writeFile(e1); }

      try{
        if(st4!=null)
          {
            st4.close();
          }
      }catch(Exception e2){siakWriter.writeFile(e2); }

      try{
        if(st5!=null)
                {
                  st5.close();
                }
            }catch(Exception e3){siakWriter.writeFile(e3); }

    try{
       if(rs4!=null)
          {
              rs4.close();
          }
        }catch(Exception e5){ siakWriter.writeFile(e5); }
      try{
        if(rs5!=null)
        {
          rs5.close();
        }
       }catch(Exception e6){ siakWriter.writeFile(e6); }
    }
wilayah_data=new WIlayahInfo(Wna_kec,Wna_kel);
return (wilayah_data);
  }


 public WIlayahInfo getWilayahWna(String nprop, String nkab,String nkec)
{
  WIlayahInfo wilayah_data=null;

  try
  {
    con_db1 = new ConnectorDB();
    con1 = con_db1.getConnection();
    if (con1 != null)
    {
               st5= con1.createStatement();
               sql5 = "select to_char(no_kel,'0000') no_kel,nama_kel,to_char(no_kec,'00') no_kec,to_char(no_kab,'00') no_kab, to_char(no_prop,'00') no_prop,NAMA_LUR, NIP_LUR from setup_kel where no_prop="+ nprop.trim()+ " and no_kab=" + nkab.trim() + " and no_kec=" + nkec.trim();
              //System.out.println(sql5);
              rs5 = st5.executeQuery(sql5);
                Wna_kel = new Vector();
                if (rs5 != null) {
                while (rs5.next()) {
                GetKel new_record5 = new GetKel(rs5.getString("no_kel"),
                                                 rs5.getString("nama_kel"),
                                                 rs5.getString("no_kec"),
                                                 rs5.getString("no_kab"),
                                                 rs5.getString("no_prop"),
                                                 rs5.getString("NAMA_LUR"),
                                                 rs5.getString("NIP_LUR"));
                 Wna_kel.addElement(new_record5);
                                }
                              }
                              st5.close();
                              rs5.close();
          }
    con1.close();
  }catch(Exception e){
    siakWriter.writeFile(e);
        System.out.println("Error in Get_AllWilayah : "+e.toString());}
  finally
  {
    try{
        if(con1!=null)
        {
          con1.close();
        }
    }catch(Exception e1){siakWriter.writeFile(e1); }

    try{
      if(st5!=null)
              {
                st5.close();
              }
          }catch(Exception e3){siakWriter.writeFile(e3); }

    try{
      if(rs5!=null)
      {
        rs5.close();
      }
     }catch(Exception e6){ siakWriter.writeFile(e6); }
  }
wilayah_data=new WIlayahInfo(Wna_kel);
return (wilayah_data);
}
}