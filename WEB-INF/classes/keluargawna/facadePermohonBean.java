package keluargawna;

import javax.ejb.*;
import java.sql.*;

//new imports

import javax.ejb.EJBHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.util.Properties;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class facadePermohonBean implements SessionBean {
  SessionContext sessionContext;
  ServiceEntity factory;
  DataKeluarga1Home home;
  DataKeluarga1 remote;
  String kk_baru=null;

  private SiakWriter siakWriter;
  private static Context context;
 // private Logger cat;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "facadePermohonBean.class");
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
/*
  private Context getInitialContext() throws NamingException
   {
   Properties h = null;
           try
           {

             h = new Properties();
             h.put(Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");
             h.put(Context.PROVIDER_URL, "t3://localhost:7001");
            }
            catch (Exception ne) {
              siakWriter.writeFile(ne);
            System.out.println("Error in Service Controller=" + ne.toString());
            }
         return new InitialContext(h);
   }
 */

 public String setKKPermohon(PermohonKK obj)
  {

  try
  {

   /*System.out.println(obj.getNewKK());
   System.out.println(obj.getNamalgkp());
   System.out.println(obj.getAlamat());
   System.out.println(obj.getNort() );
   System.out.println(obj.getNorw());
   System.out.println(obj.getDusun());
   System.out.println(obj.getKodepos());
   System.out.println(obj.getTelp());
   System.out.println(obj.getAlsPermohn());
   System.out.println(obj.getNoProp());
   System.out.println(obj.getNoKab());
   System.out.println(obj.getNoKec());
   System.out.println(obj.getNoKel());*/

    obj.setNewKK(genNewKK(obj.getNoProp(),obj.getNoKab(),obj.getNoKec()));
    factory=ServiceEntity.getInstance();
    home = (DataKeluarga1Home) factory.lookup("DataKeluarga1",DataKeluarga1Home.class);

   if (home!=null)
    {
      System.out.println("Look Up Made");
      remote = home.create(obj);
      kk_baru = obj.getNewKK();
      System.out.println("New KK Generated=" + kk_baru);
   //   remote.remove();
    }
 }
  catch(Exception err)
  {
    siakWriter.writeFile(err);
    System.out.println("Error in Session Facade=" + err.toString());
    err.printStackTrace();
  }
return(kk_baru);
}

private String genNewKK(String no_prop,String no_kab,String no_kec)
  {
   Connection db_con=null;
   CallableStatement cs=null;
   String noend=null;
   String tot;
   ConnectorDB con=new ConnectorDB();
   System.out.println("Inside the Gennewkk "+no_prop + no_kab+no_kec);

   try
   {
   tot=no_prop + no_kab+no_kec;
   db_con=con.getConnection();
   //st=db_con.createStatement();
   System.out.println("inside the try"+tot);

              cs = db_con.prepareCall("{? = call getkk(?)}");
              cs.registerOutParameter(1,java.sql.Types.VARCHAR);
              cs.setString(2,tot);
              cs.execute();
              noend = cs.getString(1);
              cs.close();
              System.out.println("Nokk is : "+noend);

   db_con.close();
   }
   catch(Exception exp)
   {
     siakWriter.writeFile(exp);
     noend=null;
   }
   finally{
           try{
   if (cs!=null) cs.close();
      }catch(Exception exp1){ siakWriter.writeFile(exp1);}
     try{
    if (db_con!=null) db_con.close();
    }catch(Exception exp1){ siakWriter.writeFile(exp1);}
  }
  return noend;
}

}