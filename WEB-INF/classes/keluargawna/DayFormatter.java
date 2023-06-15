package keluargawna;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DayFormatter
{
  public DayFormatter()
  {
  }
  public static String formatDate(String tanggal)
  {
    if(tanggal!=null && !tanggal.trim().equals(""))
    {
      SimpleDateFormat sd1 = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat sd2 = new SimpleDateFormat("dd-MM-yyyy");
      try
      {
        Date dt = sd1.parse(tanggal);
        return sd2.format(dt);
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    }
    return null;
  }
}
