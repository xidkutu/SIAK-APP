package keluargawna;

import javax.ejb.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.Collection;
import java.util.Vector;

abstract public class RiwayatTmptDetailWniWnaBean implements EntityBean {
  EntityContext entityContext;
  public java.math.BigDecimal ejbCreate(java.math.BigDecimal nik) throws CreateException {
    setNik(nik);
    return null;
  }
  public java.math.BigDecimal ejbCreate(String nik,String nlkg,String nolama,String nobru) throws CreateException
  {
    System.out.println("Updating Riwayat Details...");
    setNik(new BigDecimal(nik));
    setNamaLengkp(nlkg.toString().toUpperCase());
    setNoKkLma(new BigDecimal(nolama));
    setNoKkBru(new BigDecimal(nobru));
    System.out.println("Insert finished in riwayat detail entity bean");
    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal nik) throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbPostCreate(String nik,String nlkg,String nolama,String nobru) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }
  public abstract void setNik(java.math.BigDecimal nik);
  public abstract void setNamaLengkp(java.lang.String namaLengkp);
  public abstract void setNoKkLma(java.math.BigDecimal noKkLma);
  public abstract void setNoKkBru(java.math.BigDecimal noKkBru);
  public abstract java.math.BigDecimal getNik();
  public abstract java.lang.String getNamaLengkp();
  public abstract java.math.BigDecimal getNoKkLma();
  public abstract java.math.BigDecimal getNoKkBru();
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