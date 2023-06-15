package keluargawna;

import javax.ejb.*;
import java.util.*;
import java.math.*;

public interface KelrgaPindahWniWnaHome extends javax.ejb.EJBLocalHome {
    public KelrgaPindahWniWna create(BigDecimal nik) throws CreateException;
    public KelrgaPindahWniWna create(String nik, String nokk, String nkep, String sthbkel) throws CreateException;
    public KelrgaPindahWniWna findByPrimaryKey(BigDecimal nik) throws FinderException;
    public Collection getAnggota(BigDecimal nokk) throws FinderException;
}