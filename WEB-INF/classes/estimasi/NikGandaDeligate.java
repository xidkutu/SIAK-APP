package estimasi;
import com.db.connection.ServiceController;
import java.util.Vector;

public class NikGandaDeligate {
static ServiceController factory=null;
static NikGandaHome home=null;
static NikGanda remote=null;

 public static Vector getDataWNI(String date)
 {
     Vector vt_serv=null;
     try
     {
       if (factory==null)  factory=ServiceController.getInstance();
       if (home==null)   home=(NikGandaHome)factory.lookup("NikGanda",NikGandaHome.class);
       if (remote==null)     remote=home.create();
       vt_serv=remote.getDaftarEstimasiNikGandaWNI(date);
     }catch(Exception err)
     {
       err.printStackTrace();
     }
  return vt_serv;
   }

   public static Vector getDataWNI(String no_prop,String no_kab,String date)
   {
       Vector vt_serv=null;
       try
       {
         if (factory==null)  factory=ServiceController.getInstance();
         if (home==null)   home=(NikGandaHome)factory.lookup("NikGanda",NikGandaHome.class);
         if (remote==null)     remote=home.create();
         vt_serv=remote.getDaftarEstimasiNikGandaWNI(no_prop,no_kab,date);
       }catch(Exception err)
       {
         err.printStackTrace();
       }
    return vt_serv;
     }


    public static Vector getDataWNI(String no_prop,String no_kab,String no_kec,String date)
     {
         Vector vt_serv=null;
         try
         {
           if (factory==null)  factory=ServiceController.getInstance();
           if (home==null)   home=(NikGandaHome)factory.lookup("NikGanda",NikGandaHome.class);
           if (remote==null)     remote=home.create();
           vt_serv=remote.getDaftarEstimasiNikGandaWNI(no_prop,no_kab,no_kec,date);
         }catch(Exception err)
         {
           err.printStackTrace();
         }
      return vt_serv;
       }

   public static boolean deleteNik(String level,String nik)
   {
     boolean flag=false;
     try{
     if (factory==null)  factory=ServiceController.getInstance();
       if (home==null)   home=(NikGandaHome)factory.lookup("NikGanda",NikGandaHome.class);
         if (remote==null)     remote=home.create();
           flag=remote.deleteNikGanda(level,nik);
         }catch(Exception err)
         {
           err.printStackTrace();
           flag=false;
         }
         return flag;
   }
}