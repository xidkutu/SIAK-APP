package pendaftaran;

import java.io.*;

public class UserInfo2
    implements Serializable {
  public String no_kk;

  public UserInfo2(String no_kk) {
    this.no_kk = no_kk;
  }

  public String getNoKk() {
    return no_kk;
  }

  // set Methods

  public void setNoKk(String no_kk) {
    this.no_kk = no_kk;
  }
}
