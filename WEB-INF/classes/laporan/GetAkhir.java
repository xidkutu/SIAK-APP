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

public class GetAkhir implements Serializable
{
  String namakel,Sekoloh,sederjat,Tamat,SLTP,SLTA,DIPLOMA1,AkademDIPLOMA1,DIPLOMA1V,STRATA1,STARAT2;

  public GetAkhir(String namakel,String TDKSKL,String TDKTMPTSD,String TMTSD,String SLTP,
                  String SLTA,String DIPLM,String SMUD,String S1,String S2,String S3)
  {
    this.namakel=(namakel==null) ?"":namakel;
    this.Sekoloh=(TDKSKL==null) ?"":TDKSKL;
    this.sederjat=(TDKTMPTSD==null) ?"":TDKTMPTSD;
    this.Tamat=(TMTSD==null) ?"":TMTSD;
    this.SLTP=(SLTP==null) ?"":SLTP;
    this.SLTA=(SLTA==null) ?"":SLTA;
    this.DIPLOMA1=(DIPLM==null) ?"":DIPLM;
    this.AkademDIPLOMA1=(SMUD==null) ?"":SMUD;
    this.DIPLOMA1V=(S1==null) ?"":S1;
    this.STRATA1=(S2==null) ?"":S2;
    this.STARAT2=(S3==null) ?"":S3;
  }

public String getNamaKel()
{
return namakel;
}
public String getSekoloh()
{
 return Sekoloh;
}
public String getSederjat()
{
return sederjat;
}
public String getTamat()
{
return Tamat;
}
public String getSltp()
{
return SLTP;
}
public String getSlta()
{
 return SLTA;
}
public String getDip1()
{
return DIPLOMA1;
}
public String getAkademDip1()
{
 return AkademDIPLOMA1;
}
public String getDip1V()
{
 return DIPLOMA1V;
}
public String getStrata1()
 {
 return STRATA1;
}
public String getStrata2()
{
return STARAT2;
}

public void setNamaKel(String namakel)
  {
 this.namakel=(namakel==null) ?"":namakel;
  }
public void setSekoloh(String Sekoloh)
  {
      this.Sekoloh=(Sekoloh==null) ?"":Sekoloh;
  }
public void setSederjat(String sederjat)
  {
       this.sederjat=(sederjat==null) ?"":sederjat;
  }
public void setTamat(String Tamat)
  {
      this.Tamat=(Tamat==null) ?"":Tamat;
  }
public void setSltp(String SLTP)
  {
      this.SLTP=(SLTP==null) ?"":SLTP;
  }
public void setSlta(String SLTA)
  {
      this.SLTA=(SLTA==null) ?"":SLTA;
  }
public void setDip1(String DIPLOMA1)
  {
      this.DIPLOMA1=(DIPLOMA1==null) ?"":DIPLOMA1;
  }
public void setAkademDip1(String AkademDIPLOMA1)
  {
      this.AkademDIPLOMA1=(AkademDIPLOMA1==null) ?"":AkademDIPLOMA1;
  }
public void setDip1V(String DIPLOMA1V)
  {
      this.DIPLOMA1V=(DIPLOMA1V==null) ?"":DIPLOMA1V;
  }
public void setStrata1(String STRATA1)
   {
 this.STRATA1=(STRATA1==null) ?"":STRATA1;
  }
public void setStrata2(String STARAT2)
  {
   this.STARAT2=(STARAT2==null) ?"":STARAT2;
  }
}
