package keluargawna;

import javax.ejb.*;
import java.sql.*;
import com.db.connection.*;

//new imports

import javax.ejb.EJBHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.util.*;
import java.math.BigDecimal;
import siaktools.logwriter.*;

public class Wna_PindahBean implements SessionBean
{
  private SiakWriter siakWriter;

  String str=null,nokk,name,nik,np,nk,nc,nl;
  String ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP;
  SessionContext sessionContext;

  private static Context context;

  keluargawna.PindahWniWnaHome home, home5, home9,home13;
  keluargawna.PindahWniWna remote, remote5, remote9,remote13;

  KelrgaPindahWniWnaHome home1, home4,home14;
  KelrgaPindahWniWna remote1, remote4,remote14;

  BiodataWna2Home home2;
  BiodataWna2 remote2;

  DataKeluarga3Home home6,home11;
  DataKeluarga3 remote6,remote11;

   RiwayatTmptMasterWniWnaHome home7,home8,home12;
   RiwayatTmptMasterWniWna remote7,remote8,remote12;

   boolean flag=false;
   Pindah_Wni pin_data=null;
   Pindah_Anggota pin_ago=null;
   pinda_num_suda num_data=null;
   Vector vt_ago,agt_vector;
   int i,j,k;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "Wna_PindahBean.class");
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
  public boolean setPinda_wna(Pindah_Wni obj,Vector vt)
  {
    ServiceEntity factory = null;
        try{
            System.out.println("Inside WnaPindaBean");
            factory=ServiceEntity.getInstance();
            home = (PindahWniWnaHome) factory.lookup("PindahWniWna", PindahWniWnaHome.class);
            if (home != null) {
            System.out.println("Look Up Made");
            remote = home.create(obj, vt);
            flag=true;
           }
        }
        catch(Exception e)
        {
          siakWriter.writeFile(e);
          System.out.println("Error in WnaPindaBean=" + e.toString());
          flag=false;
        }

    return flag;
  }
  public boolean setNumpang_Wna(pinda_num_suda new_record,String t)
  {
   Pindah_Nup_Anggo detail_record;
   agt_vector=new_record.getAllAnggota();
   this.j=Integer.parseInt(t);
   this.k=agt_vector.size();
       ServiceEntity factory = null;
    try{
      factory = ServiceEntity.getInstance();
      home2 = (BiodataWna2Home) factory.lookup("BiodataWna2",
          BiodataWna2Home.class);

      if (home2 != null)
      {
        System.out.println("vector size of ango"+agt_vector.size());
        System.out.println("Updating Biodata Wna...");
        for(int cntr=0;cntr<agt_vector.size();cntr++)
        {
     detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);

     System.out.println("Nik=" + detail_record.getNik());
     System.out.println("nama lkgp "+detail_record.getNamaLgkp());
     System.out.println("Stat hbkel"+detail_record.getStatHubun());
     System.out.println("updated No Kk=" + new_record.getNokkNum());

     remote2=home2.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
     remote2.setNoKk(new BigDecimal(new_record.getNokkNum()));  //updation of nokk  happens
               if (!(detail_record.getStatHubun().equals("0")))
                {
                 remote2.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
                }
                k++;
        }
        try{
          home7 = (RiwayatTmptMasterWniWnaHome) factory.lookup("RiwayatTmptMasterWniWna",
          RiwayatTmptMasterWniWnaHome.class);

          if (home7 != null)
          {
             remote7=home7.create(new_record);
          }

           }catch(Exception rdm){
             siakWriter.writeFile(rdm);
             System.out.println("error in pinda bean Riwayat  section "+ rdm.toString());
            flag=false;}

     System.out.println(this.j);
     System.out.println(this.k);
     if(this.j==this.k)
     {
           try{
              home5 = (PindahWniWnaHome) factory.lookup(
                  "PindahWniWna",
                  PindahWniWnaHome.class);

               if (home5 != null)
               {
                  System.out.println("Deleteting record in pindah wni wna for : "+new_record.getNokk());
                  remote5=home5.findByPrimaryKey(new BigDecimal(new_record.getNokk()));
                     if(remote5!=null)
                      {
                         remote5.remove();
                      }

                   }
            }
            catch(Exception pin)
            {
              siakWriter.writeFile(pin);
              System.out.println("error in pinda bean PindahWniWna section "+ pin.toString());
              flag=false;
          }
     }

              try{
              home4 = (KelrgaPindahWniWnaHome) factory.lookup(
                  "KelrgaPindahWniWna",
                  KelrgaPindahWniWnaHome.class);

               if (home4 != null)
               {
                  for(int cntr=0;cntr<agt_vector.size();cntr++)
                  {
                     detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);

                     System.out.println("Nik=" + detail_record.getNik());
                     remote4=home4.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
                     if(remote4!=null)
                      {
                         remote4.remove();
                      }

                   }
                   flag = true;
              }
            }catch(Exception kel){
              siakWriter.writeFile(kel);
            System.out.println("error in pinda bean KelrgaPindahWniWna section "+ kel.toString());
            flag=false;}

       }
   }catch(Exception np){
     siakWriter.writeFile(np);
     System.out.println("error in bean "+ np.toString());
     flag=false; }

  return flag;
}
public String setSudah_Wna(pinda_num_suda new_record,String t,String s,String n)
 {      int i,j,k;
        Pindah_Nup_Anggo detail_record;
        agt_vector=new_record.getAllAnggota();
        j=Integer.parseInt(t);
        k=agt_vector.size();
        System.out.println("size in jsp"+j);
        System.out.println("vector size is"+k);
        System.out.println(s);
        int x=s.length();
        System.out.println("length is:"+x);
        np=s.substring(0,2);
        nk=s.substring(2,4);
        nc=s.substring(4,6);
        nl=s.substring(6,x);
        System.out.println(np+ "  " +nk+"  "+nc+"  "+nl);
        String m=np+nk+nc;
        ServiceEntity factory = null;
        nokk=genNewKK(m);
        new_record.setNokkNum(nokk);
        System.out.println("new kk is :"+nokk+"  "+new_record.getNokkNum());;

        System.out.println("nik is "+n);
        StringTokenizer st = new StringTokenizer(n,",");
        while (st.hasMoreTokens())
         {
          nik=st.nextToken();
          name=st.nextToken();
         }
         System.out.println("nama kk is"+name+" nik i s :"+nik);
         try{
          factory = ServiceEntity.getInstance();
               home6 = (DataKeluarga3Home) factory.lookup(
                   "DataKeluarga3",
                   DataKeluarga3Home.class);

                if (home6 != null)
                {
                  remote6=home6.create(name,np,nk,nc,nl,new_record);
                }

                str=new_record.getNokkNum()+name;

          }catch(Exception dt)
            {
              siakWriter.writeFile(dt);
              System.out.println("error in DataKeluarga bean  section "+dt.toString());
              str=null; }
     try{
          home12 = (RiwayatTmptMasterWniWnaHome) factory.lookup("RiwayatTmptMasterWniWna",
          RiwayatTmptMasterWniWnaHome.class);

          if (home12 != null)
          {
             System.out.println("Inserting Riwayat Master..");
             remote12=home12.create(new_record);
          }

           }catch(Exception rdm)
             {
               siakWriter.writeFile(rdm);
               System.out.println("error in pinda bean Riwayat  section "+rdm.toString());
               str=null;}

                 System.out.println(j);
                 System.out.println(k);
                 if(j==k)
                 {
                       try{
                          home13 = (PindahWniWnaHome) factory.lookup(
                              "PindahWniWna",
                              PindahWniWnaHome.class);

                           if (home13 != null)
                           {
                              System.out.println("Deleteting record in pindah wni wna for :"+new_record.getNokk());
                              remote13=home13.findByPrimaryKey(new BigDecimal(new_record.getNokk()));
                                 if(remote13!=null)
                                  {
                                     remote13.remove();
                                  }

                               }
                        }catch(Exception pin){
                          siakWriter.writeFile(pin);
                        System.out.println("error in pinda bean PindahWniWna section "+pin.toString());
                        str=null;}
                 }

                          try{
                          home14 = (KelrgaPindahWniWnaHome) factory.lookup(
                              "KelrgaPindahWniWna",
                              KelrgaPindahWniWnaHome.class);

                           if (home14 != null)
                           {
                              for(int cntr=0;cntr<agt_vector.size();cntr++)
                              {
                                 detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);

                                 System.out.println("Removing Kelrga Pinda Wni Nik=" +detail_record.getNik());
                                 remote14=home14.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
                                 if(remote14!=null)
                                  {
                                     remote14.remove();
                                  }

                               }
                             }
                        }catch(Exception kel){
                          siakWriter.writeFile(kel);
                          System.out.println("error in pinda bean KelrgaPindahWniWna section "+kel.toString());
                          str=null;}

   return str;
 }





 private String genNewKK(String st)
 {
  Connection db_con=null;
  CallableStatement cs=null;
  String noend=null;
  String tot;
  ConnectorDB con=new ConnectorDB();
  System.out.println("Inside the Gennewkk "+st);

  try
  {
  db_con=con.getConnection();
  //st=db_con.createStatement();
  System.out.println("inside the try"+st);

             cs = db_con.prepareCall("{? = call getkk(?)}");
             cs.registerOutParameter(1,java.sql.Types.VARCHAR);
             cs.setString(2,st);
             cs.execute();
             noend = cs.getString(1);
             cs.close();
             System.out.println("Nokk is : "+noend);

  db_con.close();
  }catch(Exception exp){
siakWriter.writeFile(exp);
  noend=null;
  }
  finally{
          try{
  if (cs!=null) cs.close();
     }catch(Exception exp1){siakWriter.writeFile(exp1); }
    try{
   if (db_con!=null) db_con.close();
   }catch(Exception exp1){siakWriter.writeFile(exp1); }
 }
 return noend;
}

}