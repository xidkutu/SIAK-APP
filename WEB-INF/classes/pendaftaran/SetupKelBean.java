package pendaftaran;

import javax.ejb.*;

abstract public class SetupKelBean
    implements EntityBean {
  EntityContext entityContext;
  public SetupKelPK ejbCreate(java.math.BigDecimal noKel,
                              java.math.BigDecimal noKec,
                              java.math.BigDecimal noKab,
                              java.math.BigDecimal noProp) throws
      CreateException {
    setNoKel(noKel);
    setNoKec(noKec);
    setNoKab(noKab);
    setNoProp(noProp);
    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal noKel,
                            java.math.BigDecimal noKec,
                            java.math.BigDecimal noKab,
                            java.math.BigDecimal noProp) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNoKel(java.math.BigDecimal noKel);

  public abstract void setNamaKel(java.lang.String namaKel);

  public abstract void setNoKec(java.math.BigDecimal noKec);

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setJabatan(java.lang.String jabatan);

  public abstract void setNamaLur(java.lang.String namaLur);

  public abstract void setNipLur(java.lang.String nipLur);

  public abstract java.math.BigDecimal getNoKel();

  public abstract java.lang.String getNamaKel();

  public abstract java.math.BigDecimal getNoKec();

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.lang.String getJabatan();

  public abstract java.lang.String getNamaLur();

  public abstract java.lang.String getNipLur();

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