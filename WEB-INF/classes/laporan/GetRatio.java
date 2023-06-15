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

public class GetRatio implements Serializable
{
  String L1,P1,L2,P2,L3,P3,L4,P4,L5,P5,L6,P6;
  String L7,P7,L8,P8,L9,P9,L10,P10,L11,P11,L12,P12;
  String L13,P13,L14,P14;
  public GetRatio(String L1,String P1,String L2,String P2,String L3,String P3,String L4,String P4,String L5,String P5,String L6,String P6,String L7,String P7,String L8,String P8,String L9,String P9,String L10,String P10,String L11,String P11,String L12,String P12,String L13,String P13,String L14,String P14)
  {
    this.L1=(L1==null) ?"":L1;
    this.P1=(P1==null) ?"":P1;
    this.L2=(L2==null) ?"":L2;
    this.P2=(P2==null) ?"":P2;
    this.L3=(L3==null) ?"":L3;
    this.P3=(P3==null) ?"":P3;
    this.L4=(L4==null) ?"":L4;
    this.P4=(P4==null) ?"":P4;
    this.L5=(L5==null) ?"":L5;
    this.P5=(P5==null) ?"":P5;
    this.L6=(L6==null) ?"":L6;
    this.P6=(P6==null) ?"":P6;
    this.L7=(L7==null) ?"":L7;
    this.P7=(P7==null) ?"":P7;
    this.L8=(L8==null) ?"":L8;
    this.P8=(P8==null) ?"":P8;
    this.L9=(L9==null) ?"":L9;
    this.P9=(P9==null) ?"":P9;
    this.L10=(L10==null) ?"":L10;
    this.P10=(P10==null) ?"":P10;
    this.L11=(L11==null) ?"":L11;
    this.P11=(P11==null) ?"":P11;
    this.L12=(L12==null) ?"":L12;
    this.P12=(P12==null) ?"":P12;
    this.L13=(L13==null) ?"":L13;
    this.P13=(P13==null) ?"":P13;
    this.L14=(L14==null) ?"":L14;
    this.P14=(P14==null) ?"":P14;
  }
public String getL1()
  {
  return L1;
  }
public String getP1()
  {
  return P1;
  }
public String getL2()
    {
    return L2;
    }
public String getP2()
    {
    return P2;
    }
public String getL3()
      {
      return L3;
      }
public String getP3()
      {
      return P3;
      }
public String getL4()
    {
    return L4;
    }
public String getP4()
    {
    return P4;
    }
public String getL5()
      {
      return L5;
      }
 public String getP5()
      {
      return P5;
      }
public String getL6()
    {
    return L6;
    }
public String getP6()
    {
    return P6;
    }
 public String getL7()
      {
      return L7;
      }
public String getP7()
      {
      return P7;
      }
public String getL8()
        {
        return L8;
        }
public String getP8()
        {
        return P8;
        }
public String getL9()
          {
          return L9;
          }
public String getP9()
          {
          return P9;
          }
public String getL10()
            {
            return L10;
            }
public String getP10()
            {
            return P10;
            }
public String getL11()
              {
              return L11;
              }
public String getP11()
              {
              return P11;
              }
public String getL12()
                {
                return L12;
                }
public String getP12()
                {
                return P12;
                }
public String getL13()
                  {
                  return L13;
                  }
public String getP13()
                  {
                  return P13;
                  }
public String getL14()
                    {
                    return L14;
                    }
public String getP14()
                    {
                    return P14;
                    }

public void setL1(String L1)
{
 this.L1=(L1==null) ?"":L1;
}
public void setP1(String P1)
{
this.P1=(P1==null) ?"":P1;
}
   public void setL2(String L2)
  {
   this.L2=(L2==null) ?"":L2;
  }
  public void setP2(String P2)
  {
  this.P2=(P2==null) ?"":P2;
  }
  public void setL3(String L3)
  {
   this.L3=(L3==null) ?"":L3;
  }
  public void setP3(String P3)
  {
  this.P3=(P3==null) ?"":P3;
  }
  public void setL4(String L4)
  {
   this.L4=(L4==null) ?"":L4;
  }
  public void setP4(String P4)
  {
  this.P4=(P4==null) ?"":P4;
  }
  public void setL5(String L5)
  {
   this.L5=(L5==null) ?"":L5;
  }
  public void setP5(String P5)
  {
  this.P5=(P5==null) ?"":P5;
  }
  public void setL6(String L6)
  {
   this.L6=(L6==null) ?"":L6;
  }
  public void setP6(String P6)
  {
  this.P6=(P6==null) ?"":P6;
  }
  public void setL7(String L7)
  {
   this.L7=(L7==null) ?"":L7;
  }
  public void setP7(String P7)
  {
  this.P7=(P7==null) ?"":P7;
  }
  public void setL8(String L8)
  {
   this.L8=(L8==null) ?"":L8;
  }
  public void setP8(String P8)
  {
  this.P8=(P8==null) ?"":P8;
  }
  public void setL9(String L9)
  {
   this.L9=(L9==null) ?"":L9;
  }
  public void setP9(String P9)
  {
  this.P9=(P9==null) ?"":P9;
  }
  public void setL10(String L10)
  {
   this.L10=(L10==null) ?"":L10;
  }
  public void setP10(String P10)
  {
  this.P10=(P10==null) ?"":P10;
  }
  public void setL11(String L11)
  {
   this.L11=(L11==null) ?"":L11;
  }
  public void setP11(String P11)
  {
  this.P11=(P11==null) ?"":P11;
  }
  public void setL12(String L12)
  {
this.L12=(L12==null) ?"":L12;
  }
  public void setP12(String P12)
  {
this.P12=(P12==null) ?"":P12;
  }
  public void setL13(String L13)
  {
this.L13=(L13==null) ?"":L13;
  }
  public void setP13(String P13)
  {
this.P13=(P13==null) ?"":P13;
  }
  public void setL14(String L14)
  {
    this.L14=(L14==null) ?"":L14;
  }
  public void setP14(String P14)
  {
  this.P14=(P14==null) ?"":P14;
  }
}
