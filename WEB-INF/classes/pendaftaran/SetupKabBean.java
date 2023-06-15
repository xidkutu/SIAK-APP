package pendaftaran;

import javax.ejb.*;

abstract public class SetupKabBean
    implements EntityBean {
  EntityContext entityContext;
  public SetupKabPK ejbCreate(java.math.BigDecimal noKab,
                              java.math.BigDecimal noProp) throws
      CreateException {
    setNoKab(noKab);
    setNoProp(noProp);
    return null;
  }

  public void ejbPostCreate(java.math.BigDecimal noKab,
                            java.math.BigDecimal noProp) throws CreateException {
    /**@todo Complete this method*/
  }

  public void ejbRemove() throws RemoveException {
    /**@todo Complete this method*/
  }

  public abstract void setNoKab(java.math.BigDecimal noKab);

  public abstract void setNamaKab(java.lang.String namaKab);

  public abstract void setNoProp(java.math.BigDecimal noProp);

  public abstract void setJabatan(java.lang.String jabatan);

  public abstract void setNamaPej(java.lang.String namaPej);

  public abstract void setNipPej(java.lang.String nipPej);

  public abstract void setStatPndtng(java.lang.String statPndtng);

  public abstract java.math.BigDecimal getNoKab();

  public abstract java.lang.String getNamaKab();

  public abstract java.math.BigDecimal getNoProp();

  public abstract java.lang.String getJabatan();

  public abstract java.lang.String getNamaPej();

  public abstract java.lang.String getNipPej();

  public abstract java.lang.String getStatPndtng();

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