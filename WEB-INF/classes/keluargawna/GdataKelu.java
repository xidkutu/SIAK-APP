package keluargawna;

public class GdataKelu implements java.io.Serializable
{
  String NO_KK,nama_kep,dalamat,dno_rt,dno_rw,ddusun,dkode_pos,dtelp,no_kec,no_kel,NO_PROP,NO_KAB;
  public GdataKelu(String NO_KK,String nama_kep,String dalamat,String dno_rt,String dno_rw,String ddusun,String dkode_pos,String dtelp,String NO_PROP,String NO_KAB,String no_kec,String no_kel)
    {
      this.NO_KK=(NO_KK==null)?"":NO_KK;
      this.nama_kep=(nama_kep==null)?"":nama_kep;
      this.dalamat= (dalamat==null)?"":dalamat;
      this.dno_rt=(dno_rt==null)?"":dno_rt;
      this.dno_rw=(dno_rw==null)?"0":dno_rw;
      this.ddusun=(ddusun==null)?"":ddusun;
      this.dkode_pos=(dkode_pos==null)?"0":dkode_pos;
      this.dtelp=(dtelp==null)?"0":dtelp;
      this.NO_PROP=(NO_PROP==null)?"":NO_PROP;
      this.NO_KAB=(NO_KAB==null)?"":NO_KAB;
      this.no_kec=(no_kec==null)?"":no_kec;
      this.no_kel=(no_kel==null)?"":no_kel;
    }

    public String getDknokk()
     {
      return(NO_KK);
     }
     public String getDknamakep()
      {
       return(nama_kep);
      }
    public String getDkalamat()
       {
        return(dalamat);
       }
    public String getDknort()
        {
         return(dno_rt);
        }
    public String getDknorw()
         {
          return(dno_rw);
         }
    public String getDkdusun()
          {
           return(ddusun);
          }
    public String getDkkodepos()
           {
            return(dkode_pos);
           }
    public String getDktelp()
            {
             return(dtelp);
            }
    public String getDknoprop()
             {
              return(NO_PROP);
             }
    public String getDknokab()
              {
               return(NO_KAB);
              }
    public String getDknokec()
               {
                return(no_kec);
               }
    public String getDknokel()
                {
                 return(no_kel);
                }

public void setDknokk(String NO_KK)
        {
       this.NO_KK=(NO_KK==null)?"":NO_KK;
        }

public void setDknamakep(String nama_kep)
          {
    this.nama_kep=(nama_kep==null)?"":nama_kep;
          }

public void setDkalamat(String dalamat)
           {
    this.dalamat= (dalamat==null)?"":dalamat;
           }
public void setDknort(String dno_rt)
            {
    this.dno_rt=(dno_rt==null)?"0":dno_rt;
            }
public void setDknorw(String dno_rw)
             {
   this.dno_rw=(dno_rw==null)?"0":dno_rw;
             }
public void setDkdusun(String ddusun)
              {
    this.ddusun=(ddusun==null)?"":ddusun;
              }
public void setDkkodepos(String dkode_pos)
               {
     this.dkode_pos=(dkode_pos==null)?"0":dkode_pos;
               }
public void setDktelp(String dtelp)
                {
    this.dtelp=(dtelp==null)?"0":dtelp;
                }
public void setDknoprop(String NO_PROP)
  {
 this.NO_PROP=(NO_PROP==null)?"":NO_PROP;
   }
public void setDknokab(String NO_KAB)
                {
     this.NO_KAB=(NO_KAB==null)?"":NO_KAB;
                }

public void setDknokec(String no_kec)
       {
 this.no_kec=(no_kec==null)?"":no_kec;
       }

 public void setDknokel(String no_kel)
           {
           this.no_kel=(no_kel==null)?"":no_kel;
       }
}
