package keluargawna;

import javax.ejb.*;
import java.sql.*;
import javax.ejb.EJBHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.util.Properties;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import java.math.BigDecimal;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class NumpangBean implements SessionBean {
   SessionContext sessionContext;
   Numpang_Anggota_Wni detail_record;
   ServiceEntity factory;
   BiodataWniHome home;
   BiodataWni remote;
   private SiakWriter siakWriter;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "NumpangBean.class");
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
  public boolean nump_insert(java.util.Vector v)
  {

    boolean flag;
    System.out.println("vector size is in numpang  " + v.size());
try
    {
      factory = ServiceEntity.getInstance();
      home = (BiodataWniHome) factory.lookup("BiodataWni_machine2", BiodataWniHome.class);
      for (int i = 0; i < v.size(); i++) {
        detail_record = (Numpang_Anggota_Wni) v.elementAt(i);
        remote = home.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
        remote.setNoKk(new BigDecimal(detail_record.getNokktmpt()));
        remote.setAlsNumpang(new BigDecimal(detail_record.getAlsnumpang()));
        if (!(detail_record.equals("0")))
        remote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
        System.out.println("Look Up Made");
      }
      flag=true;
    }catch(Exception err)
       {
         siakWriter.writeFile(err);
         flag=false;
       }
    return flag;
  }

}