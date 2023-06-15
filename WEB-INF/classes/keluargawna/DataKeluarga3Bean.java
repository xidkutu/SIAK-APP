package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;

abstract public class DataKeluarga3Bean implements EntityBean {
  EntityContext entityContext;
  BiodataWni1Home home;
  BiodataWni1 remote;
  ServiceEntity factory,factory1;
  Vector agt_vector;
  BiodataWna2Home home1;
  BiodataWna2 remote1;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }
  public java.math.BigDecimal ejbCreate(pinda_num_suda new_record,String n,String np,String nk,String nc,String nl) throws CreateException
    {
         System.out.println("Inserting DataKeluarga ...");
         setNoKk(new BigDecimal(new_record.getNokkNum()));
         setNamaKep(n);
         setAlamat(new_record.getAlmtLam());
         setNoRt(new BigDecimal(new_record.getRtLam()));
         setNoRw(new BigDecimal(new_record.getRwLam()));
         setDusun(new_record.getDusunLam());
         setKodePos(new BigDecimal(new_record.getKodLam()));
         setTelp(new_record.getTelLam());
         setAlsNumpang(new BigDecimal("0"));
         setNoProp(new BigDecimal(np));
         setNoKab(new BigDecimal(nk));
         setNoKec(new BigDecimal(nc));
         setNoKel(new BigDecimal(nl));
         setUserid(new BigDecimal("0"));
         setTglInsertion(new_record.getTglDtng());
         setTglUpdation("");
         setPflag("N");
         setCflag("N");
         System.out.println("Inserted DataKeluarga ...");
       return null;
  }
  public java.math.BigDecimal ejbCreate(String n,String np,String nk,String nc,String nl,pinda_num_suda new_record) throws CreateException
    {
         System.out.println("Inserting DataKeluarga ...");
         setNoKk(new BigDecimal(new_record.getNokkNum()));
         setNamaKep(n);
         setAlamat(new_record.getAlmtLam());
         setNoRt(new BigDecimal(new_record.getRtLam()));
         setNoRw(new BigDecimal(new_record.getRwLam()));
         setDusun(new_record.getDusunLam());
         setKodePos(new BigDecimal(new_record.getKodLam()));
         setTelp(new_record.getTelLam());
         setAlsNumpang(new BigDecimal("0"));
         setNoProp(new BigDecimal(np));
         setNoKab(new BigDecimal(nk));
         setNoKec(new BigDecimal(nc));
         setNoKel(new BigDecimal(nl));
         setUserid(new BigDecimal("0"));
         setTglInsertion(new_record.getTglDtng());
         setTglUpdation("");
         setPflag("N");
         setCflag("N");
         System.out.println("Inserted DataKeluarga ...");
       return null;
  }


  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(pinda_num_suda new_record,String n,String np,String nk,String nc,String nl) throws CreateException
  {
     Pindah_Nup_Anggo detail_record;
     agt_vector=new_record.getAllAnggota();

      try{
        factory = ServiceEntity.getInstance();
        home = (BiodataWni1Home) factory.lookup("BiodataWni1",
            BiodataWni1Home.class);

          System.out.println("vector size of ango"+agt_vector.size());
          System.out.println("Updating Biodata Wni...");
          for(int cntr=0;cntr<agt_vector.size();cntr++)
          {
       detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);

       System.out.println("Nik=" + detail_record.getNik());
       System.out.println("nama lkgp "+detail_record.getNamaLgkp());
       System.out.println("Stat hbkel"+detail_record.getStatHubun());
       System.out.println("updated No Kk=" + new_record.getNokkNum());

       remote=home.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
       remote.setNoKk(new BigDecimal(new_record.getNokkNum()));  //updation of nokk  happens
                 if (!(detail_record.getStatHubun().equals("0")))
                  {
                   remote.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
                  }
              }

      }catch(Exception err)
   {
     System.out.println(err.toString());
   }
    System.out.println("Updated Records in Biodata Wni...");
  }



  public void ejbPostCreate(String n,String np,String nk,String nc,String nl,pinda_num_suda new_record) throws CreateException
    {
       Pindah_Nup_Anggo detail_record;
       agt_vector=new_record.getAllAnggota();

        try{
          factory1 = ServiceEntity.getInstance();
          home1 = (BiodataWna2Home) factory1.lookup("BiodataWna2",
              BiodataWna2Home.class);

            System.out.println("vector size of ango"+agt_vector.size());
            System.out.println("Updating Biodata Wna...");
            for(int cntr=0;cntr<agt_vector.size();cntr++)
            {
         detail_record=(Pindah_Nup_Anggo)agt_vector.elementAt(cntr);

         System.out.println("Nik=" + detail_record.getNik());
         System.out.println("nama lkgp "+detail_record.getNamaLgkp());
         System.out.println("Stat hbkel"+detail_record.getStatHubun());
         System.out.println("updated No Kk=" + new_record.getNokkNum());

         remote1=home1.findByPrimaryKey(new BigDecimal(detail_record.getNik()));
         remote1.setNoKk(new BigDecimal(new_record.getNokkNum()));  //updation of nokk  happens
                   if (!(detail_record.getStatHubun().equals("0")))
                    {
                     remote1.setStatHbkel(new BigDecimal(detail_record.getStatHubun()));
                    }
                }

        }catch(Exception err)
     {
       System.out.println(err.toString());
     }
      System.out.println("Updated Records in Biodata Wna...");
    }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNamaKep(java.lang.String namaKep);
  public abstract void setAlamat(java.lang.String alamat);
  public abstract void setNoRt(java.math.BigDecimal noRt);
  public abstract void setNoRw(java.math.BigDecimal noRw);
  public abstract void setDusun(java.lang.String dusun);
  public abstract void setKodePos(java.math.BigDecimal kodePos);
  public abstract void setTelp(java.lang.String telp);
  public abstract void setAlsPrmohon(java.math.BigDecimal alsPrmohon);
  public abstract void setAlsNumpang(java.math.BigDecimal alsNumpang);
  public abstract void setNoProp(java.math.BigDecimal noProp);
  public abstract void setNoKab(java.math.BigDecimal noKab);
  public abstract void setNoKec(java.math.BigDecimal noKec);
  public abstract void setNoKel(java.math.BigDecimal noKel);
  public abstract void setUserid(java.math.BigDecimal userid);
  public abstract void setTglInsertion(java.lang.String tglInsertion);
  public abstract void setTglUpdation(java.lang.String tglUpdation);
  public abstract void setPflag(java.lang.String pflag);
  public abstract void setCflag(java.lang.String cflag);
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.lang.String getNamaKep();
  public abstract java.lang.String getAlamat();
  public abstract java.math.BigDecimal getNoRt();
  public abstract java.math.BigDecimal getNoRw();
  public abstract java.lang.String getDusun();
  public abstract java.math.BigDecimal getKodePos();
  public abstract java.lang.String getTelp();
  public abstract java.math.BigDecimal getAlsPrmohon();
  public abstract java.math.BigDecimal getAlsNumpang();
  public abstract java.math.BigDecimal getNoProp();
  public abstract java.math.BigDecimal getNoKab();
  public abstract java.math.BigDecimal getNoKec();
  public abstract java.math.BigDecimal getNoKel();
  public abstract java.math.BigDecimal getUserid();
  public abstract java.lang.String getTglInsertion();
  public abstract java.lang.String getTglUpdation();
  public abstract java.lang.String getPflag();
  public abstract java.lang.String getCflag();
  public void ejbLoad() {
    /**@todo Complete this method*/
  }
  public void ejbStore() {
    /**@todo Complete this method*/
  }
  public void ejbActivate() {
    /**@todo Complete this method*/
  }
  public void ejbPassivate() {
    /**@todo Complete this method*/
  }
  public void unsetEntityContext() {
    this.entityContext = null;
  }
  public void setEntityContext(EntityContext entityContext) {
    this.entityContext = entityContext;
  }
}