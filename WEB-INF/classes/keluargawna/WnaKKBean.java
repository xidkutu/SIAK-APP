package keluargawna;

import javax.ejb.*;
import java.sql.*;

//new imports

import javax.ejb.EJBHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import siaktools.logwriter.*;
import java.util.*;
import com.db.connection.*;

 public class WnaKKBean implements SessionBean
{
  SessionContext sessionContext;
  ServiceEntity factory;
  DataKeluarga2Home home=null;
  DataKeluarga2 remote=null;
  String kk_baru=null;
  private static Context context;
  private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "WnaKKBean.class");
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

  public String setKKPermohon(PermohonKK_Wna obj)
    {
   try
    {
    obj.setNewKK(genNewKK(obj.getNoProp(),obj.getNoKab(),obj.getNoKec()));

    factory=ServiceEntity.getInstance();
    home = (DataKeluarga2Home) factory.lookup("DataKeluarga2",DataKeluarga2Home.class);

  if (home!=null)
      {
        remote = home.create(obj);
        kk_baru = obj.getNewKK();
        System.out.println("New KK Generated=" + kk_baru);
      }
    }catch(Exception err)
    {
      err.printStackTrace();
      siakWriter.writeFile(err);
    }
  return(kk_baru);
 }

 public PermohonKK_Wna setNewKKSudahPunya(PermohonKK_Wna obj)
  {
    Connection db_con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
      obj.setNewKK(genNewKK(obj.getNoProp().trim(), obj.getNoKab().trim(),
                            obj.getNoKec().trim()));
      factory = ServiceEntity.getInstance();
      home = (DataKeluarga2Home) factory.lookup("DataKeluarga2",
                                                DataKeluarga2Home.class);
      if (home != null) {
        remote = home.create(obj);
        System.out.println("Created Rmote herer");
        ConnectorDB con = new ConnectorDB();
        db_con = con.getConnection();
        st = db_con.createStatement();
        String sql = "select getnamaprop(" + obj.getNoProp().trim() +
            ") nama_prop,getnamakab(" + obj.getNoKab().trim() + "," +
            obj.getNoProp().trim() + ") nama_kab,getnamakec(" +
            obj.getNoKec().trim() + "," + obj.getNoKab().trim() + "," +
            obj.getNoProp().trim() + ") nama_kec ,getnamakel(" +
            obj.getNoKel().trim() + "," + obj.getNoKec().trim() + "," +
            obj.getNoKab().trim()  + "," + obj.getNoProp().trim() +
            ") nama_kel from dual";
        System.out.println(sql);
        rs = st.executeQuery(sql);

        if (rs != null) {
          while (rs.next()) {
            obj.setNamaProp(rs.getString("nama_prop"));
            obj.setNamaKab(rs.getString("nama_kab"));
            obj.setNamaKec(rs.getString("nama_kec"));
            obj.setNamaKel(rs.getString("nama_kel"));
          }
        }
      }
      st.close();
      rs.close();
      db_con.close();

    }
    catch (Exception err) {
      err.printStackTrace();
      siakWriter.writeFile(err);
    }
    finally {
      try {
        if (db_con != null)
          db_con.close();
      }
      catch (Exception err) {}
      try {
        if (st != null)
          st.close();
      }
      catch (Exception err) {}
      try {
        if (rs != null)
          rs.close();
      }
      catch (Exception err) {}

      return (obj);
    }
}



  public String setNewKKSudahPunya(PermohonKK_Wna obj,String source)
    {
      Connection db_con = null;
      Statement st = null;
      ResultSet rs = null;
     String new_kk="";
      try {
        new_kk=genNewKK(obj.getNoProp().trim(), obj.getNoKab().trim(),
                              obj.getNoKec().trim());

        factory = ServiceEntity.getInstance();
        home = (DataKeluarga2Home) factory.lookup("DataKeluarga2",
                                                  DataKeluarga2Home.class);
        if (home != null) {
          obj.setNewKK(new_kk);
          remote = home.create(obj,source);
          System.out.println("Created Rmote here");

        /*
               ConnectorDB con = new ConnectorDB();
          db_con = con.getConnection();
          st = db_con.createStatement();
          String sql = "select getnamaprop(" + obj.getNoProp().trim() +
              ") nama_prop,getnamakab(" + obj.getNoKab().trim() + "," +
              obj.getNoProp().trim() + ") nama_kab,getnamakec(" +
              obj.getNoKec().trim() + "," + obj.getNoKab().trim() + "," +
              obj.getNoProp().trim() + ") nama_kec ,getnamakel(" +
              obj.getNoKel().trim() + "," + obj.getNoKec().trim() + "," +
              obj.getNoKab().trim()  + "," + obj.getNoProp().trim() +
              ") nama_kel from dual";
          System.out.println(sql);
          rs = st.executeQuery(sql);

          if (rs != null) {
            while (rs.next()) {
              obj.setNamaProp(rs.getString("nama_prop"));
              obj.setNamaKab(rs.getString("nama_kab"));
              obj.setNamaKec(rs.getString("nama_kec"));
              obj.setNamaKel(rs.getString("nama_kel"));
            }
          }*/
        }
    //    st.close();
    //    rs.close();
     //   db_con.close();

      }
      catch (Exception err) {
        err.printStackTrace();
        siakWriter.writeFile(err);
        obj.setNewKK(null);
      }
      /*
      finally {
        try {
          if (db_con != null)
            db_con.close();
        }
        catch (Exception err) {}
        try {
          if (st != null)
            st.close();
        }
        catch (Exception err) {}
        try {
          if (rs != null)
            rs.close();
        }
        catch (Exception err) {}*/
      return (obj.getNewKK());
 }


public String genNewKK(String no_prop,String no_kab,String no_kec)
    {
    Connection db_con=null;
    CallableStatement cs=null;
    String noend="";
    String tot;
    ConnectorDB con=new ConnectorDB();

    try
    {
    tot=no_prop.trim() + no_kab.trim()+no_kec.trim();
    db_con=con.getConnection();

               cs = db_con.prepareCall("{? = call getkk(?)}");
               cs.registerOutParameter(1,java.sql.Types.VARCHAR);
               cs.setString(2,tot);
               cs.execute();
               noend = cs.getString(1);
               cs.close();
    db_con.close();

    }catch(Exception exp){
      exp.printStackTrace();
      siakWriter.writeFile(exp);
      noend=null;
    }
    finally{
            try{
    if (cs!=null) cs.close();
       }catch(Exception exp1){ siakWriter.writeFile(exp1);}
      try{
     if (db_con!=null) db_con.close();
     }catch(Exception exp1){siakWriter.writeFile(exp1); }
   }
   return noend.trim();
 }

 private PermohonKK_Wna getNewKKSudahPunya(String new_kk)
 {
   Connection db_con=null;
   Statement st=null;
   ResultSet rs=null;
   String sql="";
   PermohonKK_Wna new_rec=null;
   String  NO_KK,NAMA_KEP,ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP,NO_PROP,NO_KAB,NO_KEC,NO_KEL,TGL_INSERTION,nama_prop,nama_kab,nama_kec,nama_kel;

  try
     {
       ConnectorDB con=new ConnectorDB();
       db_con=con.getConnection();
       st=db_con.createStatement();
       sql="select trim(to_char(NO_KK,'0000000000000000')) NO_KK,NAMA_KEP,ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP,NO_PROP,NO_KAB,NO_KEC,NO_KEL,TGL_INSERTION,getnamaprop(no_prop) nama_prop,getnamakab(no_kab,no_prop) nama_kab,getnamakec(no_kec,no_kab,no_prop) nama_kec,getnamakel(no_kel,no_kec,no_kab,no_prop) nama_kel from data_keluarga where no_kk=" + new_kk.trim();
       rs=st.executeQuery(sql);

  if (rs!=null)
       {
         while(rs.next())
         {
           NO_KK=rs.getString("NO_KK");
           NAMA_KEP=rs.getString("NAMA_KEP");
           ALAMAT=rs.getString("ALAMAT");
           NO_RT=rs.getString("NO_RT");
           NO_RW=rs.getString("NO_RW");
           DUSUN=rs.getString("DUSUN");
           KODE_POS=rs.getString("KODE_POS");
           TELP=rs.getString("TELP");
           NO_PROP=rs.getString("NO_PROP");
           NO_KAB=rs.getString("NO_KAB");
           NO_KEC=rs.getString("NO_KEC");
           NO_KEL=rs.getString("NO_KEL");
           TGL_INSERTION=DayFormatter.formatDate(rs.getString("TGL_INSERTION"));
           nama_prop=rs.getString("NAMA_PROP");
           nama_kab=rs.getString("NAMA_KAB");
           nama_kec=rs.getString("NAMA_KEC");
           nama_kel=rs.getString("NAMA_KEL");

           new_rec=new PermohonKK_Wna("",NAMA_KEP,
                                            NO_KK,
                                            ALAMAT,
                                            NO_RT,
                                            NO_RW,
                                            DUSUN,
                                            KODE_POS,
                                            TELP,
                                            "",
                                            "",
                                            "",
                                            "",
                                            "",
                                            "",
                                            TGL_INSERTION,
                                            NO_PROP,
                                            NO_KAB,
                                            NO_KEC,
                                            NO_KEL,
                                             nama_prop,
                                            nama_kab,
                                            nama_kec,
                                            nama_kel);
                 System.out.println("new_rec.getAlamat()" + new_rec.getAlamat());
         }
       }
       st.close();
       rs.close();
       db_con.close();

     }catch(Exception kk_err)
     {
         kk_err.printStackTrace();
     }
     finally{
                try{
                  if (db_con!=null) db_con.close();
                }catch(Exception err)
                {     }
                try{
                    if (st!=null) st.close();
                     }catch(Exception err){     }
                try{
                   if (rs!=null) rs.close();
                       }catch(Exception err){     }

}
return new_rec;
 }
}