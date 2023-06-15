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

public class PindahAsalBean implements SessionBean
{
  private SiakWriter siakWriter;
  SessionContext sessionContext;
  Collection det_rec = null;

//  RiwayatTmptDetailWniWna1Home Rdhome;

//RiwayatTmptDetailWniWna1 Rdremote;

  //BiodataWni2Home Wnihome;
//  BiodataWni2 Wniremote;

  String ALAMAT="",NO_RT="",NO_RW="",DUSUN="",KODE_POS="",TELP="";

  boolean flag=false;

  Vector agt_vector;

  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "PindahAsalBean.class");
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

public boolean setPinda_wna(Pindah_Wni obj)
  {
   ServiceEntity factory=null;
   PindahWniWna1Home home=null;
   PindahWniWna1 remote=null;

try{
           System.out.println("Inside WnaPindaBean");
           factory=ServiceEntity.getInstance();
           home = (PindahWniWna1Home) factory.lookup("PindahWniWna1", PindahWniWna1Home.class);

        if (home != null) {
           remote = home.create(obj);
           flag=true;
        }

       }catch(Exception e){
         siakWriter.writeFile(e);
         System.out.println("Error in WnaPindaBean=" + e.toString());
         flag=false;
 }
   return flag;
 }

public Pindah_Wni getPinda_wna(String no_kk,String no_prop,String no_kab,String no_kec,String no_kel)
  {
      try{
        System.out.println("Called Function getPindahWNa");
        return getPindahDetail(no_kk.trim(),no_prop,no_kab,no_kec,no_kel);
      }catch(Exception err)
      {
           System.out.println(err);
        return(null);
      }
 }

private Pindah_Wni getPindahDetail(String no_kk,String no_prop,String no_kab,String no_kec,String no_kel)
   {

        Pindah_Wni pin_data = null;
        Pindah_Anggota pin_ago = null;

        Vector vt_ago;
        String renc_tgl="";
        ConnectorDB connectorDb = new ConnectorDB();
        Connection conn=null;
        ResultSet rs = null;
        String sql="";
        Statement st=null;
        boolean flag=true;
        boolean check_rec=false;

     try{
           conn = ConnectorDB.getConnection();

           st = conn.createStatement();

           sql="select trim(to_char(NIK,'0000000000000000')) nik,NAMA_LGKP,STAT_HBKEL,JENIS_KLMIN,KWRNGRN,RENC_TGL from kelrga_pindah_wni_wna where no_kk="+no_kk+" and PINDAH_FLAG='N' and no_prop=" + no_prop + " and no_kab=" + no_kab;

           if (no_kec!=null && no_kec.trim().length()!=0)
           {
             sql=sql + " and no_kec=" + no_kec;
           }

           if (no_kel!=null && no_kel.trim().length()!=0)
           {
             sql=sql + " and no_kel=" + no_kel;
           }

           rs=st.executeQuery(sql);
           vt_ago=new Vector();

System.out.println(sql);
 // System.out.println("Error Found in Step 1 !!!!!!!!!!!!!!!!!!!!");

      if(rs!=null)
      {
         while (rs.next()) {
           check_rec=true;
          pin_ago=new Pindah_Anggota(rs.getString("NIK"),
                                     rs.getString("NAMA_LGKP"),
                                     rs.getString("STAT_HBKEL"),
                                     rs.getString("JENIS_KLMIN"),
                                     rs.getString("KWRNGRN"));
                  if (flag)    renc_tgl=rs.getString("RENC_TGL");
             flag=false;
          vt_ago.add(pin_ago);
        }
      //    System.out.println("Error Found in after Step 2 !!!!!!!!!!!!!!!!!!!!");
      }
   st.close();
   rs.close();

 if  (check_rec)
   {
   st = conn.createStatement();
   renc_tgl=DayFormatter.formatDate(renc_tgl.trim());

   System.out.println("renc_tgl -> " + renc_tgl);

//   sql="select trim(to_char(pindah_wni_wna.NO_KK,'0000000000000000')) NO_KK, ALS_PNDH,ALAMAT_TJPNDH,NO_RT_TJPNDH,NO_RW_TJPNDH,KODEPOS_TJPNDH,TELP_TJPNDH,pindah_wni_wna.NO_PROP,NO_KAB,NO_KEC,NO_KEL,JENIS_KPNDHN,RENC_TGL,KLASF_PNDH,NAMA_KEP,NAMA_CMAT,NAMA_BUP,NAMA_PET_ENTRI,NIP_PET_ENTRI,TGL_ENTRI,DUSUN,trim(to_char(NIK,'0000000000000000')) nik,NAMA_KK,NAMA_PROP,NAMA_KAB,NAMA_KEC,NAMA_KEL,NO_PROP_ASL,NO_KAB_ASL,NO_KEC_ASL,NO_KEL_ASL from pindah_wni_wna,data_keluarga where data_keluarga.no_kk=pindah_wni_wna.no_kk and pindah_wni_wna.no_kk=" + no_kk.trim()  + " and RENC_TGL='" + renc_tgl.trim() + "'";

sql="SELECT   trim(TO_CHAR(y.NIK,'0000000000000000')) nik_kep," +
    "trim(TO_CHAR(x.no_kk,'0000000000000000')) no_kk ,x.NAMA_KEP , " +
    "x. alamat, x. no_rt,x. no_rw,x. dusun,x. kode_pos, x. telp, " +
    " y. NO_PROP_ASL ,  y.NO_KAB_ASL ,y.NO_KEC_ASL , y.NO_KEL_ASL , " +
    " trim( TO_CHAR(y.RENC_TGL,'dd-mm-yyyy'))  RENC_TGL , y.JENIS_KPNDHN, " +
    "y.NAMA_CMAT, y.NAMA_KEP nama_kep_des, y.NAMA_PET_ENTRI , y.NIP_PET_ENTRI  , " +
    " trim( TO_CHAR(y.TGL_ENTRI ,'dd-mm-yyyy')) TGL_ENTRI, " +
    " y.ALAMAT_TJPNDH, y.NO_RT_TJPNDH, y.NO_RW_TJPNDH, y.DUSUN dusun_tj, " +
    "y.KODEPOS_TJPNDH,y.TELP_TJPNDH,y.no_prop no_prop_tj,y.no_kab no_kab_tj, " +
    " y.no_kec no_kec_tj,y.no_kel no_kel_tj,y.NAMA_PROP NAMA_PROP_TJ, " +
    " y. NAMA_KAB   NAMA_KAB_TJ,     y. NAMA_KEC  NAMA_KEC_TJ, " +
    " y. NAMA_KEL  NAMA_KEL_TJ FROM data_keluarga x, pindah_wni_wna y " +
    " WHERE   x.no_kk=y.no_kk " +
    " AND y.no_kk=" + no_kk.trim()  + " AND y.RENC_TGL='" + renc_tgl.trim() + "'";

   System.out.println(sql);
   rs=st.executeQuery(sql);

 // System.out.println("Error Found in Step 2 !!!!!!!!!!!!!!!!!!!!");

   if(rs!=null)
      {
  //   System.out.println("Error Found in Step 3 !!!!!!!!!!!!!!!!!!!!");
       while (rs.next()) {
      //    System.out.println("Records are there");
    //     System.out.println("rs.getString('NO_KK')->" + rs.getString("NO_KK"));
    pin_data=new Pindah_Wni
    (rs.getString("nik_kep"),
    rs.getString("no_kk"),
    rs.getString("nama_kep"),
    rs.getString("alamat"),
    rs.getString("no_rt"),
    rs.getString("no_rw"),
    rs.getString("dusun"),
    rs.getString("kode_pos"),
    rs.getString("telp"),
    rs.getString("no_prop_asl"),
    rs.getString("no_kab_asl"),
    rs.getString("no_kec_asl"),
    rs.getString("no_kel_asl"),
    rs.getString("renc_tgl"),
    rs.getString("jenis_kpndhn"),
    rs.getString("nama_cmat"),
    rs.getString("nama_kep_des"),
    rs.getString("nama_pet_entri"),
    rs.getString("nip_pet_entri"),
    rs.getString("tgl_entri"),
    rs.getString("alamat_tjpndh"),
    rs.getString("no_rt_tjpndh"),
    rs.getString("no_rw_tjpndh"),
    rs.getString("dusun_tj"),
    rs.getString("kodepos_tjpndh"),
    rs.getString("telp_tjpndh"),
    rs.getString("no_prop_tj"),
    rs.getString("no_kab_tj"),
    rs.getString("no_kec_tj"),
    rs.getString("no_kel_tj"),
    rs.getString("nama_prop_tj"),
    rs.getString("nama_kab_tj"),
    rs.getString("nama_kec_tj"),
    rs.getString("nama_kel_tj"));
  }
   //      System.out.println("Error Found in Step 4 !!!!!!!!!!!!!!!!!!!!");
 pin_data.setAllAnggota(vt_ago);
      }
//System.out.println("Error Found in Step 5 after Step 4!!!!!!!!!!!!!!!!!!!!");
   }
  rs.close();
  st.close();
  conn.close();
  conn=null;

        }catch(Exception kl){
          siakWriter.writeFile(kl);
         System.out.println("Error in Pindah asal KelrgaPindah wniwna :"+kl.toString()) ;
        }
        finally
           {
             try{
                 if(conn!=null) { conn.close();}
             }catch(Exception e1){ siakWriter.writeFile(e1);}

             try{
               if(st!=null) {st.close();}
             }catch(Exception e2){ siakWriter.writeFile(e2);}

             try{
               if(rs!=null) {rs.close();}
                   }catch(Exception e3){ siakWriter.writeFile(e3);}
           }
    return pin_data;
  }

public boolean setKeluarga_Pindah(Kedatan_keluarga obj)
  {
     RiwayatTmptMasterWniWna1Home Rhome=null;
     RiwayatTmptMasterWniWna1 Rremote=null;
     ServiceEntity factory=null;
     boolean flag=false;
try
      {
           factory=ServiceEntity.getInstance();
            Rhome = (RiwayatTmptMasterWniWna1Home) factory.lookup("RiwayatTmptMasterWniWna1",
            RiwayatTmptMasterWniWna1Home.class);

         if (Rhome != null)
            {
               Rremote=Rhome.create(obj,ALAMAT,NO_RT,NO_RW,DUSUN,KODE_POS,TELP);
               flag=true;
            }

      } catch(Exception rwt){
        siakWriter.writeFile(rwt);
        System.out.println("error in pinda bean  section "+ rwt.toString());
        flag=false;
      }
   return flag;
  }

 public String setSudah_Pindah(pinda_num_suda new_record,String t,String s,String n)
    {
      DataKeluarga4 Dremote=null;

      int i,j,k;
         String np,nc,nk,nl,nokk,nik=null,name=null,str=null;
         Pindah_Nup_Anggo detail_record;
         agt_vector=new_record.getAllAnggota();
         k=agt_vector.size();
         int x=s.length();
         np=s.substring(0,2);
         nk=s.substring(2,4);
         nc=s.substring(4,6);
         nl=s.substring(6,x);
         String m=np+nk+nc;
         nokk=genNewKK(m);
         new_record.setNokkNum(nokk);
         int len=n.length();
         nik=n.substring(0,16);
         name=n.substring(17,len);

            ServiceEntity factory=null;
            KelrgaPindahWniWna1Home khome1=null;
            KelrgaPindahWniWna1 kremote=null;
    RiwayatTmptMasterWniWna1Home Rhome=null;
    DataKeluarga4Home Dhome = null;
    BiodataWna3 Wnaremote=null;

          try{
            factory=ServiceEntity.getInstance();
                Dhome = (DataKeluarga4Home) factory.lookup("DataKeluarga4",DataKeluarga4Home.class);
                 System.out.println("look up");
                 if (Dhome != null)
                 {
                   Dremote=Dhome.create(new_record,name,np,nk,nc,nl);
                 }
                 str=new_record.getNokkNum()+name;

           }catch(Exception dt)
             {
               siakWriter.writeFile(dt);
               System.out.println("error in DataKeluarga bean  section "+dt.toString());
               str=null;
             }
             RiwayatTmptMasterWniWna1 Rremote=null;
             BiodataWna3Home Wnahome=null;

      try{
           Rhome = (RiwayatTmptMasterWniWna1Home) factory.lookup("RiwayatTmptMasterWniWna1",RiwayatTmptMasterWniWna1Home.class);
           if (Rhome != null)
           {
              System.out.println("Inserting Riwayat Master..");
              Rremote=Rhome.create(new_record,np,nk,nc,nl);
           }
           try{
             Wnahome=(BiodataWna3Home) factory.lookup("BiodataWna3",BiodataWna3Home.class);
             if (Wnahome != null)
                   {
                     for (int cntr = 0; cntr < agt_vector.size(); cntr++) {
                       detail_record = (Pindah_Nup_Anggo) agt_vector.elementAt(cntr);
                       Wnaremote = Wnahome.findByPrimaryKey(new BigDecimal(detail_record.
                           getNik()));
                       Wnaremote.setNoKk(new BigDecimal(new_record.getNokkNum())); //updation of nokk  happens
                       if (! (detail_record.getStatHubun().equals("0"))) {
                         Wnaremote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
                       }

                     }
                     System.out.println("Updated BiodataWna...!!");
                   }
           }
           catch(Exception wn)
           {
             siakWriter.writeFile(wn);
           System.out.println("error in riwayat under wna section " + wn.toString());
         }
           try{
                        khome1=(KelrgaPindahWniWna1Home) factory.lookup("KelrgaPindahWniWna1",KelrgaPindahWniWna1Home.class);
                        if (khome1 != null)
                              {
                                for (int cntr = 0; cntr < agt_vector.size(); cntr++) {
                                  detail_record = (Pindah_Nup_Anggo) agt_vector.elementAt(cntr);

                                  kremote = khome1.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
                                  kremote.setPindahFlag("Y");
                                }
                                System.out.println("Updated pindah flag...!!");
                              }
                      }
                      catch(Exception pn)
                      {
                        siakWriter.writeFile(pn);
                      System.out.println("error in riwayat under pindah flag section " + pn.toString());
                    }

            }catch(Exception rdm)
              {
                siakWriter.writeFile(rdm);
                 System.out.println("error in pinda bean Riwayat  section "+rdm.toString());
                 str=null;
               }
    return str;
  }
  private String genNewKK(String st)
  {
   Connection db_con=null;
   CallableStatement cs=null;
   String noend=null;
   String tot;
   ConnectorDB con=new ConnectorDB();
   try
   {
              db_con=con.getConnection();
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

public boolean setNumpang_Wna(pinda_num_suda new_record,String np,String nk,String nc,String nl)
{
  Pindah_Nup_Anggo detail_record;
  agt_vector=new_record.getAllAnggota();
  System.out.println(agt_vector.size());
  ServiceEntity factory=null;
  KelrgaPindahWniWna1Home khome=null;
  KelrgaPindahWniWna1 kremote=null;
  RiwayatTmptMasterWniWna1Home Rhome=null;
  RiwayatTmptMasterWniWna1 Rremote=null;
  BiodataWna3Home Wnahome=null;
  BiodataWna3 Wnaremote=null;
  try
  {
      factory=ServiceEntity.getInstance();
      Wnahome = (BiodataWna3Home) factory.lookup("BiodataWna3",BiodataWna3Home.class);

      if (Wnahome != null)
      {
        System.out.println("Updating Biodata Wna...");
        for(int cntr=0;cntr<agt_vector.size();cntr++)
        {
     detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);
     Wnaremote=Wnahome.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
     Wnaremote.setNoKk(new BigDecimal(new_record.getNokkNum()));  //updation of nokk  happens

               if (!(detail_record.getStatHubun().equals("0")))
                {
                 Wnaremote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
                }
        }
        try{
          Rhome = (RiwayatTmptMasterWniWna1Home) factory.lookup("RiwayatTmptMasterWniWna1",
          RiwayatTmptMasterWniWna1Home.class);

          if (Rhome != null)
          {
             Rremote=Rhome.create(new_record,np,nk,nc,nl);
          }
           }catch(Exception rdm){
             siakWriter.writeFile(rdm);
             System.out.println("error in pinda bean Riwayat  section "+ rdm.toString());
            flag=false;
          }
             try{
              khome = (KelrgaPindahWniWna1Home) factory.lookup(
                  "KelrgaPindahWniWna1",
                  KelrgaPindahWniWna1Home.class);

               if (khome != null)
               {
                  for(int cntr=0;cntr<agt_vector.size();cntr++)
                  {
                     detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);

                     kremote=khome.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
                     kremote.setPindahFlag("Y");
                   }
                   flag = true;
              }
            }
            catch(Exception kel){
              siakWriter.writeFile(kel);
            System.out.println("error in pinda bean KelrgaPindahWniWna section "+ kel.toString());
            flag=false;}
       }
   }catch(Exception kd){
     siakWriter.writeFile(kd);
     System.out.println("error in bean "+ kd.toString());
     flag=false; }
  return flag;
}
}