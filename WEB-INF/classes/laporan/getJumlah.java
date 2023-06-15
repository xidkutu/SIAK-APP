package laporan;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class getJumlah implements Serializable
{
  String TAda,Ada,Laki,Perum;
  public getJumlah() {
  }
  public getJumlah(String TAda,String Ada,String Laki,String Perum)
  {
    this.TAda=(TAda==null) ?"":TAda;
    this.Ada=(Ada==null) ?"":Ada;
    this.Laki=(Laki==null) ?"":Laki;
    this.Perum=(Perum==null) ?"":Perum;
  }
public String getTAda()
{
return TAda;
}
public String getAda()
{
 return Ada;
}
public String getLaki()
{
return Laki;
}
public String getPerum()
{
return Perum;
}
public void setTAda(String TAda)
{
this.TAda=(TAda==null) ?"":TAda;
}
public void setAda(String Ada)
{
this.Ada=(Ada==null) ?"":Ada;
}
public void setLaki(String Laki)
{
this.Laki=(Laki==null) ?"":Laki;
}
public void setPerum(String Perum)
{
this.Perum=(Perum==null) ?"":Perum;
}
}
