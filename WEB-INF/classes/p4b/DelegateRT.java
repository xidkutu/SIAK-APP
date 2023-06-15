package p4b;
import java.util.*;
import com.db.connection.*;

public class DelegateRT {
RTP4BFacadeHome home=null;
RTP4BFacade remote=null;

public Vector getDaftarData(String no_prop,String no_kab,String no_kec,String no_kel)
  {
    ServiceController factory=null;
    Vector collection=null;
           try{
            /* factory = ServiceController.getInstance();
             home = (RTP4BFacadeHome) factory.lookup("RTP4BFacade", RTP4BFacadeHome.class);
             remote = home.create();
             collection=remote.getDaftarAnggotaRumahTangga(no_prop,no_kab,no_kec,no_kel,Integer.parseInt(start),Integer.parseInt(end));
          */
           collection=new ReadRT().getDaftarAnggotaRumahTangga(no_prop,no_kab,no_kec,no_kel);
           }catch(Exception err)
           {
             err.printStackTrace();
           }
           System.out.println("Collection SIZE"+ collection.size());
return collection;
  }
  public Vector getDaftarData(String no_prop,String no_kab,String no_kec,String no_kel,String name)
  {
    ServiceController factory=null;
    Vector collection=null;
           try{
            /* factory = ServiceController.getInstance();
             home = (RTP4BFacadeHome) factory.lookup("RTP4BFacade", RTP4BFacadeHome.class);
             remote = home.create();
             collection=remote.getDaftarAnggotaRumahTangga(no_prop,no_kab,no_kec,no_kel,Integer.parseInt(start),Integer.parseInt(end));
          */
           collection=new ReadRT().getDaftarAnggotaRumahTangga(no_prop,no_kab,no_kec,no_kel,name);
           }catch(Exception err)
           {
             err.printStackTrace();
           }
           System.out.println("Collection SIZE"+ collection.size());
return collection;
  }

}