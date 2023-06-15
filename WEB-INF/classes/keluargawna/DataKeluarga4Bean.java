package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;
import com.db.connection.*;
import java.sql.*;

abstract public class DataKeluarga4Bean implements EntityBean {
  EntityContext entityContext;
  BiodataWni2Home home;
  BiodataWni2 remote;
  ServiceEntity factory;
  BiodataWna3Home home1;
  BiodataWna3 remote1;

  public java.math.BigDecimal ejbCreate(java.math.BigDecimal noKk) throws CreateException {
    setNoKk(noKk);
    return null;
  }

  public java.math.BigDecimal ejbCreate(pinda_num_suda new_record, String name, String np, String nk, String nc, String nl) throws CreateException {
     System.out.println("inserting  DataKeluarga...");
     setNoKk(new BigDecimal(new_record.getNokkNum()));
     setNamaKep(name);
     setAlamat(new_record.getAlmtLam() );
     setNoRt(new_record.getRtLam());
     setNoRw(new_record.getRwLam());
     setDusun(new_record.getDusunLam());
     setKodePos(new_record.getKodLam());
     setTelp(new_record.getTelLam());
     setAlsPrmohon(new BigDecimal("0"));
     setAlsNumpang(new BigDecimal("0"));
     setNoProp(new BigDecimal(np));
     setNoKab(new BigDecimal(nk));
     setNoKec(new BigDecimal(nc));
     setNoKel(new BigDecimal(nl));
     setUserid(new BigDecimal("0"));
     setTglInsertion(new_record.getTglEntBru());
     setTglUpdation("");
     setPflag("N");
     setCflag("N");
     System.out.println("Inserted DataKeluarga ...");
    return null;
  }
  public java.math.BigDecimal ejbCreate(Kedatan_keluarga obj, String ALAMAT, String NO_RT, String NO_RW, String DUSUN, String KODE_POS, String TELP) throws CreateException {
    //New Create Function 27 Mar 2004 Sat
    setNoKk(new BigDecimal(obj.getNO_KK_BRU()));
    setNamaKep(obj.getNAMA_KEPALA_LMA());
    setAlamat(obj.getAlamatTuj());
    setNoRt(obj.getRtTuj());
    setNoRw(obj.getRwTuj());
    setDusun(obj.getDusunTuj());
    setKodePos(obj.getKodeposTuj());
    setTelp(obj.getTelpTuj());
    setNoProp(new BigDecimal(obj.getNoProp()));
    setNoKab(new BigDecimal(obj.getNoKab()));
    setNoKec(new BigDecimal(obj.getNoKec()));
    setNoKel(new BigDecimal(obj.getNoKel()));
    setTglInsertion(obj.getTGL_ENTRI_BRU());
    setCflag("N");
    setPflag("N");
    System.out.println("New KK Created!!!!!");
  return null;
  }

public void ejbPostCreate(Kedatan_keluarga obj, String ALAMAT, String NO_RT, String NO_RW, String DUSUN, String KODE_POS, String TELP) throws CreateException {
        //New Post Create Function 27 Mar 2004 Sat
Connection conn = null;
Statement st = null;
String sql = "";
BiodataWna3 wna_remote;
BiodataWni2 wni_remote;
BiodataWna3Home wna_home;
BiodataWni2Home wni_home;
Vector ang;
GetKelrgaPindah  new_record;

try
    {
      ConnectorDB connectorDb = new ConnectorDB();
      conn = ConnectorDB.getConnection();
      st = conn.createStatement();
      sql = "update kelrga_pindah_wni_wna set PINDAH_FLAG='Y' where no_kk=" +
          obj.getNO_KK_LMA().trim() + " and RENC_TGL='" +
          obj.getRENC_TGL().trim() + "'";
      System.out.println("SQL 1 in RIWAYAT MASTER POST CREATE->" + sql);
      int res = st.executeUpdate(sql.trim());
      System.out.println("Success Upadtion");
     st.close();
      conn.close();
      conn = null;
      ang=obj.getAngo();

      factory=ServiceEntity.getInstance();

      if (obj.getSource().trim().equals("WNI")) {

        wni_home = (BiodataWni2Home) factory.lookup("BiodataWni2",
            BiodataWni2Home.class);

     for (int x = 0; x < ang.size(); x++) {
          new_record = (GetKelrgaPindah) ang.elementAt(x);
          wni_remote = wni_home.findByPrimaryKey(new BigDecimal(new_record.
              getNik().trim()));
          wni_remote.setNoKk(new BigDecimal(obj.getNO_KK_BRU()));
          wni_remote.setStatHbkel(new BigDecimal(CommonUtility.getHbKel(new_record.getStatHbkel())));
          wni_remote.setNoProp(new BigDecimal(obj.getNoProp()));
          wni_remote.setNoKab(new BigDecimal(obj.getNoKab()));
          wni_remote.setNoKec(new BigDecimal(obj.getNoKec()));
          wni_remote.setNoKel(new BigDecimal(obj.getNoKel()));
          wni_remote.setCflag("Y");
            System.out.println("Update Angota WNI ==" + x);
        }
 }
      else if (obj.getSource().trim().equals("WNA")) {
        wna_home = (BiodataWna3Home) factory.lookup("BiodataWna3",
            BiodataWna3Home.class);

        for (int x = 0; x < ang.size(); x++) {
          new_record = (GetKelrgaPindah) ang.elementAt(x);
          wna_remote = wna_home.findByPrimaryKey(new BigDecimal(new_record.
              getNik().trim()));
          wna_remote.setStatHbkel(new BigDecimal(CommonUtility.getHbKel(new_record.getStatHbkel())));
          wna_remote.setNoKk(new BigDecimal(obj.getNO_KK_BRU()));
          wna_remote.setNoProp(new BigDecimal(obj.getNoProp()));
          wna_remote.setNoKab(new BigDecimal(obj.getNoKab()));
          wna_remote.setNoKec(new BigDecimal(obj.getNoKec()));
          wna_remote.setNoKel(new BigDecimal(obj.getNoKel()));
          wna_remote.setCflag("Y");
           System.out.println("Update Angota WNA ==" + x);
        }
      }
    }catch(Exception errbio)
    {
         throw new CreateException();
    }
     finally
        {
          try{
            if (st != null) {
              st.close();
            }
          }
          catch (Exception e2) {}

          try {
            if (conn != null) {
              conn.close();
            }
          }catch(Exception e1){ }
     }
}


  public void ejbPostCreate(java.math.BigDecimal noKk) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(pinda_num_suda new_record, String name, String np, String nk, String nc, String nl) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNamaKep(java.lang.String namaKep);
  public abstract void setAlamat(java.lang.String alamat);
  public abstract void setNoRt(java.lang.String noRt);
  public abstract void setNoRw(java.lang.String noRw);
  public abstract void setDusun(java.lang.String dusun);
  public abstract void setKodePos(java.lang.String kodePos);
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
  public abstract java.lang.String getNoRt();
  public abstract java.lang.String getNoRw();
  public abstract java.lang.String getDusun();
  public abstract java.lang.String getKodePos();
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
