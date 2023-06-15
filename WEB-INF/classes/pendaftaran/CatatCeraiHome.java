package pendaftaran;

import java.util.*;
import javax.ejb.*;

public interface CatatCeraiHome
    extends javax.ejb.EJBLocalHome {
  public CatatCerai create(String noAktaCrai) throws CreateException;

  public CatatCerai create(Vector vt, String noAktaCrai) throws CreateException;

  public CatatCerai findByPrimaryKey(String noAktaCrai) throws FinderException;
}