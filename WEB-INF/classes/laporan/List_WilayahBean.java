package laporan;

import javax.ejb.*;
import java.util.Vector;
import java.util.Hashtable;
import java.sql.*;
import com.db.connection.ConnectorDB;
import oracle.jdbc.driver.*;

public class List_WilayahBean implements SessionBean
{
  private SessionContext sessionContext;
  private String sql;
  private String s,s1,s2,s3,da,flag;
  private Vector vt_tot=null,vt_t=null,vt_rt=null,vt_pw=null,vt_pen=null,vt_ktp=null,vt_wajib=null;

  public void ejbCreate() throws CreateException
  {
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


public Vector getTotJumlah(String no_prop,String no_kab,String no_kec,String no_kel,String thu)
  {
    CallableStatement stmt = null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    Connection con=null;
  try
        {
          con_db = new ConnectorDB();
          con = con_db.getConnection();
if (con != null)
        {
          String query = "begin ? := get_menurut_umur(?,?,?,?); end;";
          stmt = con.prepareCall(query);
          stmt.registerOutParameter(1, OracleTypes.CURSOR);
          stmt.setString(2, no_prop.trim());
          stmt.setString(3, no_kab.trim());
          stmt.setString(4, no_kec.trim());
          stmt.setString(5, no_kel.trim());
          stmt.execute();
          rs = (ResultSet)stmt.getObject(1);
   vt_tot=new Vector();

  while(rs.next())
     {
vt_tot.addElement(new getJumlah(rs.getString("AKTA_TDAK"),rs.getString("AKTA_ADA"),rs.getString("LAKI"),rs.getString("PERUM")));
     }

}
          rs.close();
          stmt.close();
          con.close();
          }catch(Exception e1)
          {
            e1.printStackTrace();
          }
finally
    {
      try{
          if(con!=null)
          {
            con.close();
          }
      }catch(Exception ee1){ }

      try{
        if(stmt!=null)
          {
            stmt.close();
          }
      }catch(Exception ee2){ }
     try{
        if(rs!=null)
        {
          rs.close();
         }
        }catch(Exception ee2){  }
    }
    return(vt_tot);
}

  public Vector getTotJumlahp4b(String no_prop,String no_kab,String no_kec,String no_kel,String thu)
    {
      CallableStatement stmt = null;
      ResultSet rs=null;
      ConnectorDB con_db=null;
      Connection con=null;
    try
          {
            con_db = new ConnectorDB();
            con = con_db.getConnection();
  if (con != null)
          {
            String query = "begin ? :=  get_menurut_umur_p4b(?,?,?,?); end;";
            stmt = con.prepareCall(query);
            stmt.registerOutParameter(1, OracleTypes.CURSOR);
            stmt.setString(2, no_prop.trim());
            stmt.setString(3, no_kab.trim());
            stmt.setString(4, no_kec.trim());
            stmt.setString(5, no_kel.trim());
            stmt.execute();
            rs = (ResultSet)stmt.getObject(1);
     vt_tot=new Vector();

    while(rs.next())
       {
  vt_tot.addElement(new getJumlah(rs.getString("AKTA_TDAK"),rs.getString("AKTA_ADA"),rs.getString("LAKI"),rs.getString("PERUM")));
       }

  }
            rs.close();
            stmt.close();
            con.close();
            }catch(Exception e1)
            {
              e1.printStackTrace();
            }
  finally
      {
        try{
            if(con!=null)
            {
              con.close();
            }
        }catch(Exception ee1){ }

        try{
          if(stmt!=null)
            {
              stmt.close();
            }
        }catch(Exception ee2){ }
       try{
          if(rs!=null)
          {
            rs.close();
           }
          }catch(Exception ee2){  }
      }
      return(vt_tot);
  }

  public Vector getTotCacat(String no_prop,String no_kab,String no_kec)
     {
       Connection con=null;
                 CallableStatement stmt=null;
                 ResultSet rs=null;
                 ConnectorDB con_db=null;
                 Vector vt_cct=null;

               try
                      {
                       con_db = new ConnectorDB();
                       con = con_db.getConnection();

                       if (con != null) {

                         String query = "begin ? := get_pnyd_cacat(?,?,?); end;";
                         stmt = con.prepareCall(query);

                         stmt.registerOutParameter(1, OracleTypes.CURSOR);

                         stmt.setString(2, no_prop.trim());
                         stmt.setString(3, no_kab.trim());
                         stmt.setString(4, no_kec.trim());
                         stmt.execute();

                         rs = (ResultSet)stmt.getObject(1);

                         vt_cct=new Vector();

                         while(rs.next())
                              {
                                GetCacat record=new GetCacat (rs.getString("NAMA_WIL"),
                                                              rs.getString("FISIK"),
                                                              rs.getString("NETRA"),
                                                              rs.getString("RUNGU"),
                                                              rs.getString("MTL_JW"),
                                                              rs.getString("FSK_MTL"),
                                                              rs.getString("LAINNYA"));

                             vt_cct.add(record);
                              }
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                        }catch(Exception e3)
                        {
                          System.out.println("Error in Session Facade=" + e3.toString());
                        }
              finally
                  {
                    try{
               if(rs!=null)
               {
                 rs.close();
                }
               }catch(Exception ee5){  }
               try{
                 if(stmt!=null)
                   {
                     stmt.close();
                   }
               }catch(Exception ee5){ }

                    try{
                        if(con!=null)
                        {
                          con.close();
                        }
                    }catch(Exception ee2){ }

                  }
//      System.out.println("size is"+vt_ak.size());
                  return(vt_cct);

   }



public Vector getTotDarah(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi)
   {

          Connection con=null;
          CallableStatement stmt=null;
          ResultSet rs=null;
          ConnectorDB con_db=null;
          Vector vt_da=null;

        try
               {
                con_db = new ConnectorDB();
                con = con_db.getConnection();

                if (con != null) {

                  String query = "begin ? := get_gol_darh(?,?,?); end;";
                  stmt = con.prepareCall(query);

                  stmt.registerOutParameter(1, OracleTypes.CURSOR);

                  stmt.setString(2, no_prop.trim());
                  stmt.setString(3, no_kab.trim());
                  stmt.setString(4, no_kec.trim());
                  stmt.execute();

                  rs = (ResultSet)stmt.getObject(1);

                  vt_da=new Vector();


                  while(rs.next())
                       {

         GetDarah record=new GetDarah(rs.getString("NAMA_WIL"),
                                      rs.getString("A"),
                                        rs.getString("B"),
                                        rs.getString("AB"),
                                        rs.getString("O"),
                                        rs.getString("APLUS"),
                                        rs.getString("AMINUS"),
                                        rs.getString("BPLUS"),
                                        rs.getString("BMINUS"),
                                        rs.getString("ABPLUS"),
                                        rs.getString("ABMINUS"),
                                        rs.getString("OPLUS"),
                                        rs.getString("OMINUS"),
                                        rs.getString("TIDAK_TAHU"));
                                     vt_da.add(record);
                       }
                 }
                 rs.close();
                 stmt.close();
                 con.close();
                 }catch(Exception e3)
                 {
                   System.out.println("Error in Session Facade=" + e3.toString());
                 }
       finally
           {
             try{
        if(rs!=null)
        {
          rs.close();
         }
        }catch(Exception ee5){  }
        try{
          if(stmt!=null)
            {
              stmt.close();
            }
        }catch(Exception ee5){ }

             try{
                 if(con!=null)
                 {
                   con.close();
                 }
             }catch(Exception ee2){ }

           }
//      System.out.println("size is"+vt_ak.size());
           return(vt_da);

 }

public Vector getTotAkhir(String npr,String nka,String nkc,String tgldari,String tglsampi)
   {
     Connection con=null;
     CallableStatement stmt=null;
     ResultSet rs=null;
     ConnectorDB con_db=null;
     Vector vt_ak=null;
     try
          {
           con_db = new ConnectorDB();
           con = con_db.getConnection();
           if (con != null) {
             String query = "begin ? := get_pddk_akhr(?,?,?); end;";
             stmt = con.prepareCall(query);
             stmt.registerOutParameter(1, OracleTypes.CURSOR);
             stmt.setString(2, npr.trim());
             stmt.setString(3, nka.trim());
             stmt.setString(4, nkc.trim());
             stmt.execute();

             rs = (ResultSet)stmt.getObject(1);

             vt_ak=new Vector();


             while(rs.next())
                  {
           GetAkhir record= new GetAkhir(rs.getString("NAMA_WIL"),
                                  rs.getString("TDKSKL"),
                                  rs.getString("TDKTMPTSD"),
                                  rs.getString("TMTSD"),
                                  rs.getString("SLTP"),
                                  rs.getString("SLTA"),
                                  rs.getString("DIPLM"),
                                  rs.getString("SMUD"),
                                  rs.getString("S1"),
                                  rs.getString("S2"),
                                  rs.getString("S3"));
                    vt_ak.add(record);
                  }
            }

            rs.close();
            stmt.close();
            con.close();
            }catch(Exception e3)
            {
              System.out.println("Error in Session Facade=" + e3.toString());
            }
  finally
      {
        try{
   if(rs!=null)
   {
     rs.close();
    }
   }catch(Exception ee5){  }
   try{
     if(stmt!=null)
       {
         stmt.close();
       }
   }catch(Exception ee5){ }

        try{
            if(con!=null)
            {
              con.close();
            }
        }catch(Exception ee2){ }

      }
//      System.out.println("size is"+vt_ak.size());
      return(vt_ak);
 }
 public Vector getTotAkhirp4b(String npr,String nka,String nkc,String tgldari,String tglsampi)
    {
      Connection con=null;
      CallableStatement stmt=null;
      ResultSet rs=null;
      ConnectorDB con_db=null;
      Vector vt_ak=null;
      try
           {
            con_db = new ConnectorDB();
            con = con_db.getConnection();
            if (con != null) {
              String query = "begin ? := get_pddk_akhr_p4b(?,?,?); end;";
              stmt = con.prepareCall(query);
              stmt.registerOutParameter(1, OracleTypes.CURSOR);
              stmt.setString(2, npr.trim());
              stmt.setString(3, nka.trim());
              stmt.setString(4, nkc.trim());
              stmt.execute();

              rs = (ResultSet)stmt.getObject(1);

              vt_ak=new Vector();


              while(rs.next())
                   {
            GetAkhir record= new GetAkhir(rs.getString("NAMA_WIL"),
                                   rs.getString("TDKSKL"),
                                   rs.getString("TDKTMPTSD"),
                                   rs.getString("TMTSD"),
                                   rs.getString("SLTP"),
                                   rs.getString("SLTA"),
                                   rs.getString("DIPLM"),
                                   rs.getString("SMUD"),
                                   rs.getString("S1"),
                                   rs.getString("S2"),
                                   rs.getString("S3"));
                     vt_ak.add(record);
                   }
             }

             rs.close();
             stmt.close();
             con.close();
             }catch(Exception e3)
             {
               System.out.println("Error in Session Facade=" + e3.toString());
             }
   finally
       {
         try{
    if(rs!=null)
    {
      rs.close();
     }
    }catch(Exception ee5){  }
    try{
      if(stmt!=null)
        {
          stmt.close();
        }
    }catch(Exception ee5){ }

         try{
             if(con!=null)
             {
               con.close();
             }
         }catch(Exception ee2){ }

       }
//      System.out.println("size is"+vt_ak.size());
       return(vt_ak);
  }

public Hashtable getTotPekerj(String npro,String nkab,String nkec,String tgldari,String tglsampi)
    {
          Connection con=null;
          CallableStatement stmt=null;
          ResultSet rs=null;
          ConnectorDB con_db=null;
          Hashtable hash_wil=null;
try
    {
                con_db = new ConnectorDB();
                con = con_db.getConnection();
                if (con != null) {

                  String query = "begin ? := get_pkerjn(?,?,?); end;";
                  stmt = con.prepareCall(query);

                  stmt.registerOutParameter(1, OracleTypes.CURSOR);

                  stmt.setString(2, npro.trim());
                  stmt.setString(3, nkab.trim());
                  stmt.setString(4, nkec.trim());
                  stmt.execute();
                  rs = (ResultSet)stmt.getObject(1);
                  hash_wil=new Hashtable();
                  while(rs.next())
                       {
                        String cnt=(rs.getString("kode_wil").trim()+rs.getString("kode_pkrjn").trim()).trim();
                        hash_wil.put(cnt,rs.getString("ANGKA"));
                       }
                 }

                 rs.close();
                 stmt.close();
                 con.close();
        }catch(Exception e3)
                 {
                   System.out.println("Error in Session Facade=" + e3.toString());
                 }
       finally
           {
             try{
        if(rs!=null)
        {
          rs.close();
         }
        }catch(Exception ee5){  }
        try{
          if(stmt!=null)
            {
              stmt.close();
            }
        }catch(Exception ee5){ }

             try{
                 if(con!=null)
                 {
                   con.close();
                 }
             }catch(Exception ee2){ }
           }
           return(hash_wil);
  }


  public Vector getRatio()
    {
      Connection con=null;
      PreparedStatement ps=null;
      ResultSet rs=null;
      ConnectorDB con_db=null;
      try {
               con_db = new ConnectorDB();
               con = con_db.getConnection();
               if (con != null)
               {
sql = "select a.L1,a.P1,b.L2,b.P2,c.L3,c.P3,d.L4,d.P4,e.L5,e.P5,f.L6,f.P6,"
+" g.L7,g.P7,h.L8,h.P8,i.L9,i.P9,j.L10,j.P10,k.L11,k.P11,l.L12,l.P12,"
+" m.L13,m.P13,n.L14,n.P14"
+" from"
+" (select count(decode(JENIS_klmin,1,1)) L1,count(decode(JENIS_klmin,2,1)) P1"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 0 and 4) a,"
+" (select count(decode(JENIS_klmin,1,1)) L2,count(decode(JENIS_klmin,2,1)) P2"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 5 and 9) b,"
+" (select count(decode(JENIS_klmin,1,1)) L3,count(decode(JENIS_klmin,2,1)) P3"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 10 and 14) c,"
+" (select count(decode(JENIS_klmin,1,1)) L4,count(decode(JENIS_klmin,2,1)) P4"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 15 and 19) d,"
+" (select count(decode(JENIS_klmin,1,1)) L5,count(decode(JENIS_klmin,2,1)) P5"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 20 and 24) e,"
+" (select count(decode(JENIS_klmin,1,1)) L6,count(decode(JENIS_klmin,2,1)) P6"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 25 and 29) f,"
+" (select count(decode(JENIS_klmin,1,1)) L7,count(decode(JENIS_klmin,2,1)) P7"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 30 and 34) g,"
+" (select count(decode(JENIS_klmin,1,1)) L8,count(decode(JENIS_klmin,2,1)) P8"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 35 and 39) h,"
+" (select count(decode(JENIS_klmin,1,1)) L9,count(decode(JENIS_klmin,2,1)) P9"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 40 and 44) i,"
+" (select count(decode(JENIS_klmin,1,1)) L10,count(decode(JENIS_klmin,2,1)) P10"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 45 and 49) j,"
+" (select count(decode(JENIS_klmin,1,1)) L11,count(decode(JENIS_klmin,2,1)) P11"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 50 and 54) k,"
+" (select count(decode(JENIS_klmin,1,1)) L12,count(decode(JENIS_klmin,2,1)) P12"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 55 and 59) l,"
+" (select count(decode(JENIS_klmin,1,1)) L13,count(decode(JENIS_klmin,2,1)) P13"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) between 60 and 64) m,"
+" (select count(decode(JENIS_klmin,1,1)) L14,count(decode(JENIS_klmin,2,1)) P14"
+" from biodata_wni"
+" where FLOOR(MONTHS_BETWEEN(SYSDATE,tgl_lhr)/12) > 65) n";

                     //System.out.println(sql);
                     ps = con.prepareStatement(sql);
                     rs = ps.executeQuery();
                     vt_rt=new Vector( );
                     while(rs.next())
                     {
       GetRatio record= new GetRatio(rs.getString("L1"),
                                     rs.getString("P1"),
                                     rs.getString("L2"),
                                     rs.getString("P2"),
                                     rs.getString("L3"),
                                     rs.getString("P3"),
                                     rs.getString("L4"),
                                     rs.getString("P4"),
                                     rs.getString("L5"),
                                     rs.getString("P5"),
                                     rs.getString("L6"),
                                     rs.getString("P6"),
                                     rs.getString("L7"),
                                     rs.getString("P7"),
                                     rs.getString("L8"),
                                     rs.getString("P8"),
                                     rs.getString("L9"),
                                     rs.getString("P9"),
                                     rs.getString("L10"),
                                     rs.getString("P10"),
                                     rs.getString("L11"),
                                     rs.getString("P11"),
                                     rs.getString("L12"),
                                     rs.getString("P12"),
                                     rs.getString("L13"),
                                     rs.getString("P13"),
                                     rs.getString("L14"),
                                     rs.getString("P14"));
                       vt_rt.add(record);
//                       System.out.println("check this"+rs.getString("P11"));
                     }
               }

               rs.close();
               ps.close();
               con.close();
               }catch(Exception e3)
               {
                 System.out.println("Error in Session Facade=" + e3.toString());
               }
     finally
         {
           try{
               if(con!=null)
               {
                 con.close();
               }
           }catch(Exception ee2){ }
           try{
             if(ps!=null)
               {
                 ps.close();
               }
           }catch(Exception ee5){ }
          try{
             if(rs!=null)
             {
               rs.close();
              }
             }catch(Exception ee5){  }
         }
         int size = 0;
         if (vt_rt!=null)
           size = vt_rt.size();
//         System.out.println("Ratio vector size is "+size);
         return(vt_rt);
  }



  public Vector getPerKawinan()
    {
      Connection con=null;
      PreparedStatement ps=null;
      ResultSet rs=null;
      ConnectorDB con_db=null;
      try {
                 con_db = new ConnectorDB();
                 con = con_db.getConnection();
                 if (con != null)
                 {
                   sql = "select"
                 +" getNamaProp(no_prop) namaprop,"
                 +" count(decode(jenis_klmin,1,1)) Laki_Laki,"
                 +" count(decode(jenis_klmin,2,1)) Perempuan,"
                 +" count(decode(stat_kwn,1,1)) BelumKawin,"
                 +" count(decode(stat_kwn,2,1)) Kawin,"
                 +" count(decode(stat_kwn,3,1)) CeraiHidup,"
                 +" count(decode(stat_kwn,4,1)) CeraiMati,"
                 +" count(decode(akta_kwn,1,1)) Perkawinan,"
                 +" count(decode(akta_crai,1,1)) Perceraian"
                 +" from biodata_wni"
                 +" group by getNamaProp(no_prop)";

                       //System.out.println(sql);
                       ps = con.prepareStatement(sql);
                       rs = ps.executeQuery();
                       vt_pw=new Vector( );
                       while(rs.next())
                       {
         GetPerkawinan record= new GetPerkawinan(rs.getString("namaprop"),
                                       rs.getString("Laki_Laki"),
                                       rs.getString("Perempuan"),
                                       rs.getString("BelumKawin"),
                                       rs.getString("Kawin"),
                                       rs.getString("CeraiHidup"),
                                       rs.getString("CeraiMati"),
                                       rs.getString("Perkawinan"),
                                       rs.getString("Perceraian"));
                         vt_pw.add(record);
                       }
                 }
                 rs.close();
                 ps.close();
                 con.close();
                 }catch(Exception e3)
                 {
                   System.out.println("Error in Session Facade=" + e3.toString());
                 }
       finally
           {
             try{
                 if(con!=null)
                 {
                   con.close();
                 }
             }catch(Exception ee2){ }
             try{
               if(ps!=null)
                 {
                   ps.close();
                 }
             }catch(Exception ee5){ }
            try{
               if(rs!=null)
               {
                 rs.close();
                }
               }catch(Exception ee5){  }
           }
           int size = 0;
           if (vt_pw!=null)
             size = vt_pw.size();

           System.out.println("Ratio perkawinan size is "+size);
           return(vt_pw);
  }


public Vector getBukuPenWni(String no_prop,String no_kab,String no_kec,String no_kel)
    {
      Connection con=null;
      PreparedStatement ps=null;
      ResultSet rs=null;
      ConnectorDB con_db=null;
      try {
                   con_db = new ConnectorDB();
                   con = con_db.getConnection();

if (con != null)
{
    sql = "select "
+" to_char(nik) Nik,"
+" a.nama_lgkp NamaLgkp,"
+" to_char(a.No_kk) NoKk,"
+" getAlamat(a.No_kk) alamat,"
+" a.Tmpt_lhr TmptLhr,"
+" to_char(a.Tgl_lhr,'dd/mon/yyyy') TglLhr,"
+" decode(a.jenis_klmin,1,'Laki-Laki',2,'Perempuan') Jenis_Klmin,"
+" decode(a.stat_kwn,1,'Belum Kawin',2,'Kawin',3,'Cerai Hidup',4,'Cerai Mati') Stat_Kwn,"
+" agama,"
+" decode(a.PDDK_AKH,1,'Tidak/Belum Sekolah',2,'Tidak Tamat SD/Sederajat',3,'Tamat SD/Sederajat',4,"
+" 'SLTP/Sederajat',5,'SLTA/Sederajat',6,'Diploma I/II',7,'Akademi/Diploma III/s.muda',8,"
+" 'Diploma IV/Strata I',9,'Strata II',10,'Strata III') PDDK_AKH,"
+" upper(getPkrjn(a.JENIS_PKRJN)) JENIS_PKRJN,"
+" decode(a.Gol_Drh,1,'A',2,'B',3,'AB',4,'O',5,'A+',6,'A-',7,'B+',8,'B-',9,'AB+',10,'AB-',11,'O+',12,'O-',13,'Tidak Tahu') Gol_Drh,"
+" decode(a.STAT_HBKEL,1,'Kepala Keluarga',2,'Suami',3,'Istri',4,'Anak',5,'Menantu',6,'CuCu',7,'Orang Tua',8,"
+" 'Mertua',9,'Famili Lain',10,'Pembantu',11,'Lainnya') STAT_HBKEL"
+" from biodata_wni a "
+" where a.no_prop="+no_prop;

if ((no_kab!=null) &&  (no_kab.trim().length()!=0))
{
sql=sql + " and a.no_kab="+no_kab;
 }

 if ((no_kec!=null) &&  (no_kec.trim().length()!=0))
 {
 sql=sql + " and a.no_kec="+no_kec;
  }

 if ((no_kel!=null) &&  (no_kel.trim().length()!=0))
  {
  sql=sql + " and a.no_kel="+no_kel;
   }
   sql=sql+ " order by a.no_kk,a.STAT_HBKEL";

                        //System.out.println(sql);
                         ps = con.prepareStatement(sql);
                         rs = ps.executeQuery();
                         vt_pen=new Vector();
String alamat="";
   while(rs.next())
                         {
                           alamat=rs.getString("Alamat");
                           if (alamat!=null && !alamat.trim().equals(""))
                           {
                             GetPenduduk record = new GetPenduduk(rs.getString("Nik"),
                                                                  rs.getString("NamaLgkp"),
                                                                  rs.getString("NoKk"),
                                                                  alamat,
                                                                  rs.getString("TmptLhr"),
                                                                  rs.getString("TglLhr"),
                                                                  rs.getString("Jenis_Klmin"),
                                                                  rs.getString("Stat_Kwn"),
                                                                  rs.getString("agama"),
                                                                  rs.getString("PDDK_AKH"),
                                                                  rs.getString("JENIS_PKRJN"),
                                                                  rs.getString("Gol_Drh"),
                                                                  rs.getString("STAT_HBKEL"));
                             vt_pen.add(record);
                           }
                           //System.out.println("check this "+rs.getString("Alamat"));
                         }
                   }
                   rs.close();
                   ps.close();
                   con.close();
                   }catch(Exception e3)
                   {
                     System.out.println("Error in Session Facade=" + e3.toString());
                   }
         finally
             {
               try{
                   if(con!=null)
                   {
                     con.close();
                   }
               }catch(Exception ee2){ }
               try{
                 if(ps!=null)
                   {
                     ps.close();
                   }
               }catch(Exception ee5){ }
              try{
                 if(rs!=null)
                 {
                   rs.close();
                  }
                 }catch(Exception ee5){  }
               }
               int size = 0;
               if (vt_pen!=null)
                 size = vt_pen.size();

             System.out.println("Ratio penduduk size is "+size);
             return(vt_pen);
  }


  public Vector getStatPerkawin(String no_prop,String no_kab,String no_kec,String tgldari,String tglsampi)
  {
    Connection con=null;
    CallableStatement stmt=null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    Vector vt_kaw=null;
    try
         {
          con_db = new ConnectorDB();
          con = con_db.getConnection();

          if (con != null) {


            String query = "begin ? := get_stat_kwn(?,?,?); end;";
            stmt = con.prepareCall(query);

            stmt.registerOutParameter(1, OracleTypes.CURSOR);

            stmt.setString(2, no_prop.trim());
            stmt.setString(3, no_kab.trim());
            stmt.setString(4, no_kec.trim());
            stmt.execute();

            rs = (ResultSet)stmt.getObject(1);

            vt_kaw=new Vector();


            while(rs.next())
                 {
                   //implementation
 GetKawinan record= new GetKawinan(rs.getString("NAMA_WIL"),
                                            rs.getString("LAKI_BLM_KWN"),
                                            rs.getString("PEREM_BLM_KWN"),
                                            rs.getString("LAKI_KWN"),
                                            rs.getString("PEREM_KWN"),
                                            rs.getString("LAKI_CRAIHDP"),
                                            rs.getString("PEREM_CRAIHDP"),
                                            rs.getString("LAKI_CRAIMATI"),
                                            rs.getString("PEREM_CRAIMATI"),
                                            rs.getString("AKTA_KWN_ADA"),
                                            rs.getString("AKTA_KWN_TADA"),
                                            rs.getString("AKTA_CRAI_ADA"),
                                            rs.getString("AKTA_CRAI_TADA"));
                   vt_kaw.add(record);
                 }
           }

           rs.close();
           stmt.close();
           con.close();
           }catch(Exception e3)
           {
             System.out.println("Error in Session Facade=" + e3.toString());
           }
 finally
     {
       try{
  if(rs!=null)
  {
    rs.close();
   }
  }catch(Exception ee5){  }
  try{
    if(stmt!=null)
      {
        stmt.close();
      }
  }catch(Exception ee5){ }

       try{
           if(con!=null)
           {
             con.close();
           }
       }catch(Exception ee2){ }

     }
//      System.out.println("size is"+vt_ak.size());
     return(vt_kaw);

  }


public Vector getAgama(String no_prop,String no_kab,String no_kec)
  {
    Connection con=null;
    CallableStatement stmt=null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    Vector vt_aga=null;
    try
         {
          con_db = new ConnectorDB();
          con = con_db.getConnection();

          if (con != null) {


            String query = "begin ? := get_agama(?,?,?); end;";
            stmt = con.prepareCall(query);

            stmt.registerOutParameter(1, OracleTypes.CURSOR);

            stmt.setString(2, no_prop.trim());
            stmt.setString(3, no_kab.trim());
            stmt.setString(4, no_kec.trim());
            stmt.execute();
            rs = (ResultSet)stmt.getObject(1);
            vt_aga=new Vector();
    while(rs.next())
       {
      AgamaInfo record=new AgamaInfo(rs.getString("NAMA_WIL"),
                                                  rs.getString("ISLAM"),
                                                  rs.getString("KRISTEN"),
                                                  rs.getString("KATHOLIK"),
                                                  rs.getString("HINDU"),
                                                  rs.getString("BUDHA"),
                                                  rs.getString("LAINNYA"));
               vt_aga.add(record);
                 }
           }

           rs.close();
           stmt.close();
           con.close();
           }catch(Exception e3)
           {
             System.out.println("Error in Session Facade=" + e3.toString());
           }
 finally
     {

       try{
  if(rs!=null)
  {
    rs.close();
   }
  }catch(Exception ee5){  }
  try{
    if(stmt!=null)
      {
        stmt.close();
      }
  }catch(Exception ee5){ }

       try{
           if(con!=null)
           {
             con.close();
           }
       }catch(Exception ee2){ }

     }
    return(vt_aga);
 }

 public Vector getAgamap4b(String no_prop,String no_kab,String no_kec)
   {
     Connection con=null;
     CallableStatement stmt=null;
     ResultSet rs=null;
     ConnectorDB con_db=null;
     Vector vt_aga=null;
     try
          {
           con_db = new ConnectorDB();
           con = con_db.getConnection();

           if (con != null) {


             String query = "begin ? := get_agama_p4b(?,?,?); end;";
             stmt = con.prepareCall(query);

             stmt.registerOutParameter(1, OracleTypes.CURSOR);

             stmt.setString(2, no_prop.trim());
             stmt.setString(3, no_kab.trim());
             stmt.setString(4, no_kec.trim());
             stmt.execute();
             rs = (ResultSet)stmt.getObject(1);
             vt_aga=new Vector();
     while(rs.next())
        {
       AgamaInfo record=new AgamaInfo(rs.getString("NAMA_WIL"),
                                                   rs.getString("ISLAM"),
                                                   rs.getString("KRISTEN"),
                                                   rs.getString("KATHOLIK"),
                                                   rs.getString("HINDU"),
                                                   rs.getString("BUDHA"),
                                                   rs.getString("LAINNYA"));
                vt_aga.add(record);
                  }
            }

            rs.close();
            stmt.close();
            con.close();
            }catch(Exception e3)
            {
              System.out.println("Error in Session Facade=" + e3.toString());
            }
  finally
      {

        try{
   if(rs!=null)
   {
     rs.close();
    }
   }catch(Exception ee5){  }
   try{
     if(stmt!=null)
       {
         stmt.close();
       }
   }catch(Exception ee5){ }

        try{
            if(con!=null)
            {
              con.close();
            }
        }catch(Exception ee2){ }

      }
     return(vt_aga);
  }

  public Vector getBukuPenduduk(String no_prop,String no_kab,String no_kec,String no_kel)
  {
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    String propCondition = "";
    String kabCondition = "";
    String kecCondition = "";
    String kelCondition = "";
    String statKawinDanUsiaCondition = " AND ((FLOOR(MONTHS_BETWEEN(SYSDATE, TGL_LHR)/12)>17) OR (STAT_KWN>1))";
    try {
                   con_db = new ConnectorDB();
                   con = con_db.getConnection();
                   if (con != null)
                   {
                     if( (no_kab==null && no_kec==null && no_kel==null)
                         || ( no_kab.trim().equals("")&&no_kec.trim().equals("")&&no_kel.trim().equals("") ) )
                     {
                       propCondition = " and A.no_prop="+no_prop;
                     } else if( (no_kab!=null && no_kec==null && no_kel==null)||
                                (!no_kab.trim().equals("")&& no_kec.trim().equals("")) && no_kel.trim().equals("") )
                     {
                       propCondition = " and A.no_prop="+no_prop;
                       kabCondition = " and A.no_kab="+no_kab;
                     } else if(no_kab!=null && no_kec!=null && no_kel==null ||
                               (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && no_kel.trim().equals(""))
                     {
                       propCondition = " and A.no_prop="+no_prop;
                       kabCondition = " and A.no_kab="+no_kab;
                       kecCondition = " and A.no_kec="+no_kec;
                     } else if(no_kab!=null && no_kec!=null && no_kel!=null ||
                               (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && !no_kel.trim().equals(""))
                     {
                       propCondition = " and A.no_prop="+no_prop;
                       kabCondition = " and A.no_kab="+no_kab;
                       kecCondition = " and A.no_kec="+no_kec;
                       kelCondition = " and A.no_kel="+no_kel;
                     }
        sql = "select"
                     +" to_char(a.nik) Nik,"
                     +" a.nama_lgkp NamaLgkp,"
                     +" decode(a.jenis_klmin,1,'Laki-Laki',2,'Perempuan') Jenis_Klmin,"
                     +" a.tmpt_lhr||',' ||a.tgl_lhr TmptTglLhr,"
                     +" a.agama Agama,"
                     +" 'WNI' Kwargan,"
                     +" decode(a.PDDK_AKH,1,'Tidak/Belum Sekolah',2,'Tidak Tamat SD/Sederajat',3,'Tamat SD /Sederajat',4,"
                     +" 'SLTP/Sederajat',5,'SLTA/Sederajat',6,'Diploma I/II',7,'Akademi/Diploma III/s.muda',8,"
                     +" 'Diploma IV/Strata I',9,'Strata II',10,'Strata III') PDDK_AKH,"
                     +" upper(getPkrjn(a.JENIS_PKRJN)) JENIS_PKRJN,"
                     +" b.alamat Alamat,"
                     +" to_char(a.TGL_PJG_KTP,'dd-mon-yyyy') TGL_PJG_KTP"
                     +" from biodata_wni a, data_keluarga b"
                     +" where a.no_kk=b.no_kk "+propCondition+kabCondition+kecCondition+kelCondition+statKawinDanUsiaCondition
                     +" union"
                     +" select"
                     +" to_char(a.nik) Nik,"
                     +" a.nama_pertma Nama_Lgkp,"
                     +" decode(a.jenis_klmin,1,'Laki-Laki',2,'Perempuan') Jenis_Klmin,"
                     +" a.tmpt_lhr||','||a.tgl_lhr TmptTglLhr,"
                     +" a.agama Agama,"
                     +" 'WNA' Kwargan,"
                     +" decode(a.PDDK_AKH,1,'Tidak/Belum Sekolah',2,'Tidak Tamat SD/Sederajat',3,'Tamat SD /Sederajat',4,"
                     +" 'SLTP/Sederajat',5,'SLTA/Sederajat',6,'Diploma I/II',7,'Akademi/Diploma III/s.muda',8,"
                     +" 'Diploma IV/Strata I',9,'Strata II',10,'Strata III') PDDK_AKH,"
                     +" upper(getPkrjn(a.JENIS_PKRJN)) JENIS_PKRJN,"
                     +" b.alamat Alamat,"
                     +" to_char(a.TGL_PJG_KTP,'dd-mon-yyyy') TGL_PJG_KTP"
                     +" from biodata_wna a, data_keluarga b"
                     +" where a.no_kk=b.no_kk "+propCondition+kabCondition+kecCondition+kelCondition+statKawinDanUsiaCondition + "  order by Kwargan desc,TGL_PJG_KTP";
                    System.out.println(sql);
                         ps = con.prepareStatement(sql);
                         rs = ps.executeQuery();
                         vt_ktp=new Vector( );

                    while(rs.next())
                         {
           BukuPenduduk record= new BukuPenduduk(rs.getString("Nik"),
                                         rs.getString("NamaLgkp"),
                                         rs.getString("Jenis_Klmin"),
                                         rs.getString("TmptTglLhr"),
                                         rs.getString("Agama"),
                                         rs.getString("Kwargan"),
                                         rs.getString("PDDK_AKH"),
                                         rs.getString("JENIS_PKRJN"),
                                         rs.getString("Alamat"),
                                         rs.getString("TGL_PJG_KTP"));
                           vt_ktp.add(record);
                           //System.out.println("check this "+rs.getString("Alamat"));
                         }
                   }
                   rs.close();
                   ps.close();
                   con.close();
                   }catch(Exception e3)
                   {
                     System.out.println("Error in Session Facade=" + e3.toString());
                   }
         finally
             {
               try{
                   if(con!=null)
                   {
                     con.close();
                   }
               }catch(Exception ee2){ }
               try{
                 if(ps!=null)
                   {
                     ps.close();
                   }
               }catch(Exception ee5){ }
              try{
                 if(rs!=null)
                 {
                   rs.close();
                  }
                 }catch(Exception ee5){  }
             }
             return(vt_ktp);
  }

public Vector getBukuWajib(String no_prop,String no_kab,String no_kec,String no_kel)
  {
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    ConnectorDB con_db=null;
    String propCondition = "";
    String kabCondition = "";
    String kecCondition = "";
    String kelCondition = "";
    String statKawinDanUsiaCondition = " AND ((FLOOR(MONTHS_BETWEEN(SYSDATE, TGL_LHR)/12)>17) OR (STAT_KWN>1))";
       vt_wajib=new Vector( );
    try {
                   con_db = new ConnectorDB();
                   con = con_db.getConnection();

                   if (con != null)
                   {
                     if( (no_kab==null && no_kec==null && no_kel==null)
                         || ( no_kab.trim().equals("")&&no_kec.trim().equals("")&&no_kel.trim().equals("") ) )
                     {
                       propCondition = " and A.no_prop="+no_prop;
                     } else if( (no_kab!=null && no_kec==null && no_kel==null)||
                                (!no_kab.trim().equals("")&& no_kec.trim().equals("")) && no_kel.trim().equals("") )
                     {
                       propCondition = " and A.no_prop="+no_prop;
                       kabCondition = " and A.no_kab="+no_kab;
                     } else if(no_kab!=null && no_kec!=null && no_kel==null ||
                               (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && no_kel.trim().equals(""))
                     {
                       propCondition = " and A.no_prop="+no_prop;
                       kabCondition = " and A.no_kab="+no_kab;
                       kecCondition = " and A.no_kec="+no_kec;
                     } else if(no_kab!=null && no_kec!=null && no_kel!=null ||
                               (!no_kab.trim().equals("")&& !no_kec.trim().equals("")) && !no_kel.trim().equals(""))
                     {
                       propCondition = " and A.no_prop="+no_prop;
                       kabCondition = " and A.no_kab="+no_kab;
                       kecCondition = " and A.no_kec="+no_kec;
                       kelCondition = " and A.no_kel="+no_kel;
                     }

sql = "select to_char(A.nik) Nik,"
+" A.nama_lgkp NamaLgkp,"
+" B.ALAMAT Alamat,"
+" decode(A.JENIS_KLMIN,1,'Laki-Laki',2,'Perempuan') JenisKlmin,"
+" decode(A.STAT_KTP,1,'Sudah',null,'Belum') StatKtp"
+" FROM BIODATA_WNI A , DATA_KELUARGA B WHERE A.NO_KK=B.NO_KK "+propCondition+kabCondition+kecCondition+kelCondition+statKawinDanUsiaCondition;

     ps = con.prepareStatement(sql);
      rs = ps.executeQuery();

       while(rs.next())
                         {
           GetWajib record= new GetWajib(rs.getString("Nik"),
                                         rs.getString("NamaLgkp"),
                                         rs.getString("Alamat"),
                                         rs.getString("JenisKlmin"),
                                         rs.getString("StatKtp"));
                           vt_wajib.add(record);
                         }
                   }

                   rs.close();
                   ps.close();
                   con.close();
                   }catch(Exception e3)
                   {
                     e3.printStackTrace();
                   }
         finally
             {
               try{
                   if(con!=null)
                   {
                     con.close();
                   }
               }catch(Exception ee2){ }
               try{
                 if(ps!=null)
                   {
                     ps.close();
                   }
               }catch(Exception ee5){ }
              try{
                 if(rs!=null)
                 {
                   rs.close();
                  }
                 }catch(Exception ee5){  }
             }
       return(vt_wajib);
  }
}
