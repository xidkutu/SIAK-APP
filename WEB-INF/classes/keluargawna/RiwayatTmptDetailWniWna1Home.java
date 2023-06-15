package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface RiwayatTmptDetailWniWna1Home extends javax.ejb.EJBLocalHome {
  public RiwayatTmptDetailWniWna1 create(BigDecimal nik) throws CreateException;
  public RiwayatTmptDetailWniWna1 create(Kedatan_keluarga obj, GetKelrgaPindah new_record) throws CreateException;
  public RiwayatTmptDetailWniWna1 create(pinda_num_suda new_record, Pindah_Nup_Anggo new_record1, String np, String nk, String nc, String nl) throws CreateException;
  public RiwayatTmptDetailWniWna1 findByPrimaryKey(BigDecimal nik) throws FinderException;
}