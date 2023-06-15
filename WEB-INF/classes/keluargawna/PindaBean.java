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
import java.util.*;
import java.math.BigDecimal;

import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;

public class PindaBean implements SessionBean
{
  SessionContext sessionContext;
  Collection det_rec = null;
  ConnectorDB con_db;
  Connection con;
  Statement st, st1;
  PreparedStatement ps;
  ResultSet rs;
  String sql,str=null,nokk,name,nik,np,nk,nc,nl;
  String ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP;
  private SiakWriter siakWriter;
  ServiceEntity factory, factory1, factory2, factory3, factory4, factory5,
      factory6, factory7,factory8,factory9,factory10,factory11,factory12,factory13,factory14;
  private static Context context;

  keluargawna.PindahWniWnaHome home, home5, home9,home13;
  keluargawna.PindahWniWna remote, remote5, remote9,remote13;

  KelrgaPindahWniWnaHome home1, home4,home14;
  KelrgaPindahWniWna remote1, remote4,remote14;

  BiodataWni1Home home2,home10;
  BiodataWni1 remote2,remote10;

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
       siakWriter = new SiakWriter(path, "PindaBean.class");
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
 public boolean setPinda_wni(Pindah_Wni obj,Vector vt)
  {
        try{
            factory=ServiceEntity.getInstance();
            home = (PindahWniWnaHome) factory.lookup("PindahWniWna", PindahWniWnaHome.class);
            if (home != null) {
            System.out.println("Look Up Made");
            remote = home.create(obj, vt);
            flag=true;
           }
        }catch(Exception e){
          siakWriter.writeFile(e);
          System.out.println("Error in Bean=" + e.toString());
          flag=false;  }

    return flag;
  }

  public Pindah_Wni getPinda_wni(String no_kk)
  {
    try
        {

          factory = ServiceEntity.getInstance();
          home = (PindahWniWnaHome) factory.lookup("PindahWniWna",
                                                     PindahWniWnaHome.class);
          if (home != null) {
            remote = home.findByPrimaryKey(new BigDecimal(no_kk));

       if (remote != null) {
       pin_data=new Pindah_Wni(String.valueOf(remote.getNoKk()),
                                      String.valueOf(remote.getAlsPndh()) ,
                                      remote.getAlamatTjpndh(),
                                      String.valueOf(remote.getNoRtTjpndh()),
                                      String.valueOf(remote.getNoRwTjpndh()),
                                      String.valueOf(remote.getKodeposTjpndh()),
                                      String.valueOf(remote.getTelpTjpndh()),
                                      String.valueOf(remote.getNoProp()),
                                      String.valueOf(remote.getNoKab()),
                                      String.valueOf(remote.getNoKec()),
                                      String.valueOf(remote.getNoKel()),
                                      String.valueOf(remote.getJenisKpndhn()),
                                      remote.getRencTgl(),
                                      String.valueOf(remote.getKlasfPndh()),
                                      remote.getNamaKep(),
                                      String.valueOf(remote.getNipPetEntri()),
                                      remote.getNamaCmat(),
                                      String.valueOf(remote.getNipPetEntri()),
                                      remote.getNamaPetEntri(),
                                      String.valueOf(remote.getNipPetEntri()),
                                      DayFormatter.formatDate(remote.getTglEntri()),
                                      remote.getDusun(),
                                      String.valueOf(remote.getNik()),
                                      remote.getNamaKk(),
                                      remote.getNamaProp(),
                                      remote.getNamaKab(),
                                      remote.getNamaKec(),
                                      remote.getNamaKel());

            }

          }
      }
        catch(Exception e)
          {
            siakWriter.writeFile(e);
            System.out.println("Error in Bean=" + e.toString());
        }

   try{
          factory1 = ServiceEntity.getInstance();
          home1 = (KelrgaPindahWniWnaHome) factory1.lookup("KelrgaPindahWniWna",
              KelrgaPindahWniWnaHome.class);

          if (home1 != null) {
            det_rec = home1.getAnggota(new BigDecimal(no_kk));
           java.util.Iterator itr_rec = det_rec.iterator();
           vt_ago=new Vector();
 while(itr_rec.hasNext())
  {
  KelrgaPindahWniWna det_records=(KelrgaPindahWniWna)itr_rec.next();
  pin_ago=new Pindah_Anggota(String.valueOf(det_records.getNik()),det_records.getNamaLgkp(),det_records.getStatHbkel());
  vt_ago.add(pin_ago);
 }
   pin_data.setAllAnggota(vt_ago);
      }
        }catch(Exception kl){
          siakWriter.writeFile(kl);
         System.out.println(kl.toString()) ;

        }
    return pin_data;
  }


  public boolean setNumpang_Pindah(pinda_num_suda new_record,String t)
    {
     Pindah_Nup_Anggo detail_record;
     agt_vector=new_record.getAllAnggota();
     this.j=Integer.parseInt(t);
     this.k=agt_vector.size();
      try{
        factory2 = ServiceEntity.getInstance();
        home2 = (BiodataWni1Home) factory2.lookup("BiodataWni1",
            BiodataWni1Home.class);

        if (home2 != null)
        {
          System.out.println("vector size of ango"+agt_vector.size());
          System.out.println("Updating Biodata Wni...");
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
            factory6 = ServiceEntity.getInstance();
            home7 = (RiwayatTmptMasterWniWnaHome) factory6.lookup("RiwayatTmptMasterWniWna",
            RiwayatTmptMasterWniWnaHome.class);

            if (home7 != null)
            {
               remote7=home7.create(new_record);
            }

             }catch(Exception rdm){

               System.out.println("error in pinda bean Riwayat  section "+ rdm.toString());
              flag=false;}

       System.out.println(this.j);
       System.out.println(this.k);
       if(this.j==this.k)
       {
             try{
                factory5 = ServiceEntity.getInstance();
                home5 = (PindahWniWnaHome) factory5.lookup(
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
              }catch(Exception pin){
                siakWriter.writeFile(pin);
              System.out.println("error in pinda bean PindahWniWna section "+ pin.toString());
              flag=false;}
       }

                try{
                factory4 = ServiceEntity.getInstance();
                home4 = (KelrgaPindahWniWnaHome) factory4.lookup(
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
  public boolean setKeluarga_Pindah(Kedatan_keluarga obj)
  {

    try{
      con_db = new ConnectorDB();
      con = ConnectorDB.getConnection();
      st = con.createStatement();
      sql="select ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP from data_keluarga where no_kk="+obj.getNokk();
      System.out.println(sql);
      rs=st.executeQuery(sql);
      if(rs!=null)
      {
        while(rs.next())
        {
           ALAMAT=rs.getString("ALAMAT");
           NO_RT=rs.getString("NO_RT");
           NO_RW=rs.getString("NO_RW");
           DUSUN=rs.getString("DUSUN");
           KODE_POS=rs.getString("KODE_POS");
           TELP=rs.getString("TELP");
        }
        System.out.println("alsmat is "+ALAMAT+" "+NO_RT);
        try{

            factory8 = ServiceEntity.getInstance();
            home8 = (RiwayatTmptMasterWniWnaHome) factory8.lookup("RiwayatTmptMasterWniWna",
            RiwayatTmptMasterWniWnaHome.class);

            if (home8 != null)
            {
               remote8=home8.create(obj,ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP);
            }

             }catch(Exception rdm){

               System.out.println("error in pinda bean Riwayat  section "+ rdm.toString());
              flag=false;}
      }
      rs.close();
      st.close();
    try{
      factory7 = ServiceEntity.getInstance();
      home6 = (DataKeluarga3Home) factory7.lookup("DataKeluarga3",DataKeluarga3Home.class);
      if (home6 != null) {
        remote6=home6.findByPrimaryKey(new BigDecimal(obj.getNokk()));
        if(remote6!=null)
        {
          System.out.println("Updating record in Data Keluarga for : "+obj.getNokk());
          remote6.setAlamat(obj.getAlm());
          System.out.println(obj.getAlm().trim());
          remote6.setNoRt(new BigDecimal(obj.getRt()));
          System.out.println(obj.getRt());
          remote6.setNoRw(new BigDecimal(obj.getRw()));
          System.out.println(obj.getRw());
          remote6.setDusun(obj.getDus().trim());
          System.out.println(obj.getDus());
          remote6.setKodePos(new BigDecimal(obj.getKod()));
          remote6.setTelp(obj.getTlp());
          System.out.println(obj.getTlp());
          remote6.setNoProp(new BigDecimal(obj.getNoProp()));
          remote6.setNoKab(new BigDecimal(obj.getNoKab()));
          remote6.setNoKec(new BigDecimal(obj.getNoKec()));
          remote6.setNoKel(new BigDecimal(obj.getNoKel()));
          System.out.println(obj.getTglUpd().trim());
          remote6.setTglUpdation(obj.getTglUpd());
          System.out.println("Updation finished in dataKeluarga..");
          try{
                factory9 = ServiceEntity.getInstance();
                home9 = (PindahWniWnaHome) factory9.lookup(
                    "PindahWniWna",
                    PindahWniWnaHome.class);

                 if (home9 != null)
                 {
                    System.out.println("Deleteting record in pindah wni wna for : "+obj.getNokk());
                    remote9=home9.findByPrimaryKey(new BigDecimal(obj.getNokk()));
                       if(remote9!=null)
                        {
                           remote9.remove();
                        }

                     }
              }catch(Exception pin){
                siakWriter.writeFile(pin);
              System.out.println("error in pinda bean PindahWniWna section "+ pin.toString());
              flag=false;}

          flag=true;
        }
      }
      }catch(Exception kpin){
        siakWriter.writeFile(kpin);
        System.out.println("error in pinda bean dataKeluarga section "+ kpin.toString());
        flag=false;}
      }catch(Exception rwt){
        siakWriter.writeFile(rwt);
        System.out.println("error in pinda bean  section "+ rwt.toString());
        flag=false;}

      finally
            {
              try{
                  if(con!=null) { con.close();}
              }catch(Exception e1){siakWriter.writeFile(e1); }

              try{
                if(st!=null) {st.close();}
              }catch(Exception e2){siakWriter.writeFile(e2); }

              try{
                if(rs!=null) {rs.close();}
                    }catch(Exception e3){siakWriter.writeFile(e3); }
            }
    return flag;
  }
  public String setSudah_Pindah(pinda_num_suda new_record,String t,String s,String n)
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
           factory11 = ServiceEntity.getInstance();
                home11 = (DataKeluarga3Home) factory11.lookup(
                    "DataKeluarga3",
                    DataKeluarga3Home.class);

                 if (home11 != null)
                 {
                   remote11=home11.create(new_record,name,np,nk,nc,nl);
                 }
                 str=new_record.getNokkNum()+name;

           }catch(Exception dt)
             {
               siakWriter.writeFile(dt);
               System.out.println("error in DataKeluarga bean  section "+dt.toString());
               str=null; }
      try{
           factory12 = ServiceEntity.getInstance();
           home12 = (RiwayatTmptMasterWniWnaHome) factory12.lookup("RiwayatTmptMasterWniWna",
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
                           factory13 = ServiceEntity.getInstance();
                           home13 = (PindahWniWnaHome) factory13.lookup(
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
                           factory14 = ServiceEntity.getInstance();
                           home14 = (KelrgaPindahWniWnaHome) factory14.lookup(
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
    }catch(Exception exp1){ siakWriter.writeFile(exp1);}
  }
  return noend;
}
}