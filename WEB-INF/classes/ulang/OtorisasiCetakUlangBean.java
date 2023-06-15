package ulang;

import javax.ejb.*;
import pendaftaran.UserInfo1;

public class OtorisasiCetakUlangBean implements SessionBean {
  SessionContext sessionContext;
  public void ejbCreate() throws CreateException {
    /**@todo Complete this method*/
  }
  public void ejbRemove() {
    /**@todo Complete this method*/
  }
  public void ejbActivate() {
    /**@todo Complete this method*/
  }
  public void ejbPassivate() {
    /**@todo Complete this method*/
  }
  public void setSessionContext(SessionContext sessionContext) {
    this.sessionContext = sessionContext;
  }
  public String createOtorisasiKey(UserInfo1 operator, UserInfo1 supervisor) throws OtorisasiException {
    return getOtorisasiKey(operator, supervisor);
  }
  public boolean cekOtorisasi(UserInfo1 operator, UserInfo1 supervisor, String otorisasiKey) throws OtorisasiException {
    boolean authorize = false;
    if (getOtorisasiKey(operator, supervisor).equals(otorisasiKey))
      authorize = true;
    return authorize;
  }
  private String getOtorisasiKey(UserInfo1 operator, UserInfo1 supervisor) throws OtorisasiException {
    boolean aktif = (supervisor.getUserStatus().equals("Y"));
    if (!aktif)
      throw new OtorisasiException("Supervisor sedang Non-Aktif!");

    String statusOtorisasi = supervisor.getAuthKey().trim();
    if ((statusOtorisasi==null)  || (statusOtorisasi.equals("")))
      throw new OtorisasiException("Supervisor Belum Diautorisasi!");

    int opLevel = Integer.parseInt(operator.getLevelId());
    int supvLevel = Integer.parseInt(supervisor.getLevelId());

    if (opLevel!=supvLevel) {
      throw new OtorisasiException("Tidak di Level yang Sama!");
    }

    int opDivision = Integer.parseInt(operator.getDivision());
    int supvDivision = Integer.parseInt(supervisor.getDivision());
    if ((opDivision+3)!=supvDivision) {
      throw new OtorisasiException("Divisi Supervisor tidak Sesuai dengan Divisi Operator!");
    }

    int opHakAkses = Integer.parseInt(operator.getModuleCode());
    int supvHakAkses = Integer.parseInt(supervisor.getModuleCode());
    if ((opHakAkses+2)!=supvHakAkses) {
       throw new OtorisasiException("Supervisor tidak Berhak!");
    }

    /*
                                    2 - Dafduk WNI
                                    3 - Capil Lahir-Mati
                                    4 - Dafduk Ubah Biodata/Cetak Ulang WNI
                                    5 - Capil Lahir-Mati-Kawin-Cerai
                                    6 - Dafduk WNA
                                    7 - Capil Cetak Ulang Akta
                                    8 - Dafduk Ubah Biodata/Cetak Ulang WNA
*/
    String key = operator.getAuthKey().substring(0, (operator.getAuthKey().length()/2-1)) + supervisor.getAuthKey().substring((supervisor.getAuthKey().length()/2));
    return key;
  }

}