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
import com.db.connection.*;
import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;

public class AngotasMoveBean implements SessionBean {
   SessionContext sessionContext;
   Numpang_Anggota_Wni detail_record;
   ServiceEntity factory;
   BiodataWna1Home home;
   BiodataWna1 remote;

   BiodataWni3Home home_wni;
   BiodataWni3 remote_wni;

   DataKeluarga2Home  home_kel;
   DataKeluarga2 remote_kel;

   boolean flag;
   private SiakWriter siakWriter;
   private BigDecimal cnt;
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "AngotasMoveBean.class");
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

  public boolean nump_insert(java.util.Vector v)
  {
try
    {
      factory = ServiceEntity.getInstance();
      home = (BiodataWna1Home) factory.lookup("BiodataWna1", BiodataWna1Home.class);
      if(home!=null)
      {
        System.out.println("Updating BiodataWna....");
        for (int i = 0; i < v.size(); i++)
        {
          detail_record = (Numpang_Anggota_Wni) v.elementAt(i);
          remote = home.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
          remote.setNoKk(new BigDecimal(detail_record.getNokktmpt()));
          remote.setAlsNumpang(new BigDecimal(detail_record.getAlsnumpang()));

          if ((! (detail_record.equals("0"))) && (detail_record!=null))
          {
           System.out.println("detail_record.getStatHubun()" + detail_record.getStatHubun());
          if (((detail_record.getStatHubun()!=null)) && (!(detail_record.getStatHubun().trim().equals("0"))) && (!(detail_record.getStatHubun().trim().equals(""))))
            remote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
          }
        }
        System.out.println("Updated BiodataWna !!");
        flag = true;
      }
    }catch(Exception err)
       {
         siakWriter.writeFile(err);
         flag=false;
       }
    return flag;
  }

public boolean nump_insert(java.util.Vector v,String source,String no_prop,String no_kab,String no_kec,String no_kel,String no_kk_lma)
  {
try
    {
      factory = ServiceEntity.getInstance();

 if (source.equals("WNA"))
      {
      home = (BiodataWna1Home) factory.lookup("BiodataWna1", BiodataWna1Home.class);
       cnt=home.getCount(new BigDecimal(no_kk_lma));

      if(home!=null)
      {
        System.out.println("Updating BiodataWna....");

        for (int i = 0; i < v.size(); i++)
        {
          detail_record = (Numpang_Anggota_Wni) v.elementAt(i);
          remote = home.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
          remote.setNoKk(new BigDecimal(detail_record.getNokktmpt()));
          remote.setAlsNumpang(new BigDecimal(detail_record.getAlsnumpang()));

          remote.setNoProp(new BigDecimal(no_prop));
          remote.setNoKab(new BigDecimal(no_kab));
          remote.setNoKec(new BigDecimal(no_kec));
          remote.setNoKel(new BigDecimal(no_kel));

     if ((! (detail_record.equals("0"))) && (detail_record!=null))
          {
           System.out.println("detail_record.getStatHubun()" + detail_record.getStatHubun());
          if (((detail_record.getStatHubun()!=null)) && (!(detail_record.getStatHubun().trim().equals("0"))) && (!(detail_record.getStatHubun().trim().equals(""))))
            remote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
          }
        }
        System.out.println("Updated BiodataWna !!");
        flag = true;
      }
    }
  else if (source.equals("WNI"))
    {
           home_wni = (BiodataWni3Home) factory.lookup("BiodataWni3", BiodataWni3Home.class);
           cnt=home_wni.getCount(new BigDecimal(no_kk_lma));

           if(home_wni!=null)
            {
              System.out.println("Updating BiodataWni....");

              for (int i = 0; i < v.size(); i++)
              {
                detail_record = (Numpang_Anggota_Wni) v.elementAt(i);
                System.out.println("detail_record" + detail_record.getNik());
                remote_wni = home_wni.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
                remote_wni.setNoKk(new BigDecimal(detail_record.getNokktmpt()));
                remote_wni.setAlsNumpang(new BigDecimal(detail_record.getAlsnumpang()));
              System.out.println("no_prop" + no_prop);
              System.out.println("no_kab" + no_kab);
              System.out.println("no_kec" + no_kec);
              System.out.println("no_kel" + no_kel);
                remote_wni.setNoProp(new BigDecimal(no_prop.trim()));
                remote_wni.setNoKab(new BigDecimal(no_kab.trim()));
                remote_wni.setNoKec(new BigDecimal(no_kec.trim()));
                remote_wni.setNoKel(new BigDecimal(no_kel.trim()));

       if ((! (detail_record.equals("0"))) && (detail_record!=null))
                {
                 System.out.println("detail_record.getStatHubun()" + detail_record.getStatHubun());
                if (((detail_record.getStatHubun()!=null)) && (!(detail_record.getStatHubun().trim().equals("0"))) && (!(detail_record.getStatHubun().trim().equals(""))))
                  remote_wni.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
                }
              }
              System.out.println("Updated BiodataWni !!");
              flag = true;
            }
    }
            System.out.println("AngotasMoving total count=" + cnt.toString());
            System.out.println("Total Vector Size=" + (v.size()));

 if ((cnt!=null) && (cnt.toString().equals(String.valueOf(v.size()))))
               {
                 home_kel=(DataKeluarga2Home)factory.lookup("DataKeluarga2",DataKeluarga2Home.class);
                 remote_kel=home_kel.findByPrimaryKey(new BigDecimal(no_kk_lma));
                 remote_kel.remove();
                 System.out.println("Data Keluarga " + no_kk_lma + " removed successfully" );
               }

}catch(Exception err)
       {
          err.printStackTrace();
         siakWriter.writeFile(err);
         flag=false;
       }
    return flag;
  }
}