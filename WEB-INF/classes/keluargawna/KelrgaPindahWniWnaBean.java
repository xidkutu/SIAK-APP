package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;

abstract public class KelrgaPindahWniWnaBean implements EntityBean {
  EntityContext entityContext;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws CreateException {
    setNik(nik);
    return null;
  }
  public java.math.BigDecimal ejbCreate(String nik, String nokk, String nkep, String sthbkel) throws CreateException {
     setNik(new BigDecimal(nik));
     setNoKk(new BigDecimal(nokk));
     setNamaLgkp(nkep);
     setStatHbkel(sthbkel);
   return null;
    }

  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(String nik, String nokk, String nkep, String sthbkel) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNik(java.math.BigDecimal nik);
  public abstract void setNoKk(java.math.BigDecimal noKk);
  public abstract void setNamaLgkp(java.lang.String namaLgkp);
  public abstract void setStatHbkel(java.lang.String statHbkel);
  public abstract java.math.BigDecimal getNik();
  public abstract java.math.BigDecimal getNoKk();
  public abstract java.lang.String getNamaLgkp();
  public abstract java.lang.String getStatHbkel();
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
  public abstract java.util.Collection ejbSelectAnggota(java.math.BigDecimal nokk) throws FinderException;

  public java.util.Collection ejbHomeGetAnggota(java.math.BigDecimal nokk) throws FinderException {
    Collection  det_rec=null;
    try{
    det_rec=ejbSelectAnggota(nokk);
    }catch(Exception colErr)
    {
      System.out.println("Error in select=" + colErr.toString());
    }
   return(det_rec);
  }
}