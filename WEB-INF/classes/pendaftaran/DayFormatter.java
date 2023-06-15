package pendaftaran;

import java.text.*;
import java.util.*;

public class DayFormatter {
  static String fmt_date = "";

  public DayFormatter() {
  }

  public static String formatDate(String tanggal) {
    if (tanggal != null && !tanggal.trim().equals("")) {
      SimpleDateFormat sd1 = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat sd2 = new SimpleDateFormat("dd-MM-yyyy");
      try {
        Date dt = sd1.parse(tanggal.trim());
        fmt_date = sd2.format(dt).trim();
      }
      catch (Exception e) {
        e.printStackTrace();
        fmt_date = "";
      }
    }
    return fmt_date;
  }
}