package pendaftaran;

import java.util.*;
import javax.ejb.*;
import java.math.*;

public interface CatatKawinHome
    extends javax.ejb.EJBLocalHome {
  public CatatKawin create(String noAktaKwn) throws CreateException;
  public CatatKawin create(Vector vt, String noAktaKwn, String daftarAnak, String prystrtn) throws CreateException;
  public CatatKawin findByPrimaryKey(String noAktaKwn) throws FinderException;
  public Collection getAllPerkawinan(BigDecimal nikSuami);



}
