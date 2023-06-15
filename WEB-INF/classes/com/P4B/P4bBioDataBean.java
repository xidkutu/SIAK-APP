package com.P4B;
import java.math.*;
import java.sql.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;
import com.db.connection.*;
import oracle.jdbc.driver.*;
import siaktools.logwriter.SiakWriter;

public class P4bBioDataBean implements SessionBean {
  SessionContext sessionContext;
SiakWriter  siakWriter=null;
  public void ejbCreate() throws CreateException {
    try{
      ResourceBundle res = ResourceBundle.getBundle(
          "siaktools.logwriter.siaklog",
          Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "P4bBioDataBean.class");
    }catch(Exception ioerr)
    {
      ioerr.printStackTrace();
    }
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

/*Begin New Function for P4B*/
public P4BBioObject getDataP4B(String nik,String no_prop,String no_kab,String no_kec,String no_kel)
  {
      P4BBioObject record = null;
      Connection conn = null;
      PreparedStatement st = null;
      ResultSet rs = null;
      ResultSet rscnt=null;
      String flag=null;
      String sql = "SELECT  TO_CHAR(a.nik,'0000000000000000') NIK,a.NO_KTP,nvl(a.TMPT_SBL,'-') TMPT_SBL, nvl(a.NO_PASPOR,'-') NO_PASPOR,nvl(to_char(a.TGL_AKH_PASPOR,'dd-mm-yyyy'),'-') TGL_AKH_PASPOR,a.NAMA_LGKP,a.JENIS_KLMIN," +
          " nvl(a.TMPT_LHR,'-') TMPT_LHR, nvl(to_char(a.TGL_LHR,'dd-mm-yyyy'),'-') TGL_LHR ,a.AKTA_LHR,nvl(a.NO_AKTA_LHR,'-') NO_AKTA_LHR, a.GOL_DRH,a.AGAMA,a.STAT_KWN," +
          " a.AKTA_KWN,nvl(a.NO_AKTA_KWN,'-') NO_AKTA_KWN,nvl(to_char(a.TGL_KWN,'dd-mm-yyyy'),'-') TGL_KWN, a.AKTA_CRAI,nvl(a.NO_AKTA_CRAI,'-') NO_AKTA_CRAI, nvl(to_char(a.TGL_CRAI,'dd-mm-yyyy'),'-') TGL_CRAI," +
          " a.STAT_HBKEL,a.KLAIN_FSK,a.PNYDNG_CCT,a.PDDK_AKH,a.JENIS_PKRJN,NVL(TO_CHAR(a.NIK_IBU),' ') NIK_IBU, " +
          " a.NAMA_LGKP_IBU,nvl(to_char(a.NIK_AYAH),' ') NIK_AYAH, a.NAMA_LGKP_AYAH,a.NAMA_KET_RT,a.NAMA_KET_RW," +
          " a.NAMA_PET_REG,nvl(to_char(a.NIP_PET_REG),' ') NIP_PET_REG, a.NAMA_PET_ENTRI,a.NIP_PET_ENTRI,to_char(a.TGL_ENTRI,'dd-mm-yyyy') TGL_ENTRI," +
          " to_char(a.NO_KK,'0000000000000000') NO_KK,a.NO_PROP,a.NO_KAB,a.NO_KEC,a.NO_KEL," +
          " b.NAMA_KEP,b.ALMT_T alamat,b.RT_T no_rt,b.RW_T no_rw,NVL(b.DUSUN_T,'-') dusun," +
          " DECODE(b.KODE_POS_T,NULL,' ',0,' ',b.kode_pos_T) KODE_POS, a.cflag, " +
          " NVL(b.TELP_T,'-')  TELP FROM  BIODATA_WNI_P4B a, TABLE(GetalmtpivotP4B(a.NO_KK)) b " +
          " where a.nik="+ nik + " and a.no_prop=" + no_prop + " and a.no_kab=" + no_kab + " and a.no_kec=" + no_kec + " and a.no_kel=" + no_kel;
//E-Error Raised
//Y-Already dimutakhirkan
//N-Still Not dimutakhirkan
//F-Not Found
//H-Status Hbkel=1 exists in the given No KK
//D-Status Hbkel=1 Do not exists in the given No KK

try {
        ConnectorDB connectorDb = new ConnectorDB();
        conn = connectorDb.getConnection();
        st = conn.prepareStatement(sql);
        rs=st.executeQuery();
if  (rs.next())
          {
         if (rs.getString("cflag").equals("Y"))
            {
              record=new P4BBioObject();
              record.setAcknowldge("Y");
            }
        else if(rs.getString("cflag").equals("N"))
           {
              flag="H";
              if (!rs.getString("STAT_HBKEL").trim().equals("1"))
              {
                rscnt=conn.prepareStatement("select count(nik) cnt from biodata_wni_p4b where stat_hbkel=1 and no_kk=" +rs.getString("NO_KK")).executeQuery();
                flag="D";
                 while(rscnt.next())
                 {
                   if (rscnt.getString("cnt").equals("1"))
                   {
                     flag="H";
                   }
                 }
              }
             record = new P4BBioObject(rs.getString("NO_KK"),
                                       rs.getString("NAMA_KEP"),
                                       rs.getString("alamat"),
                                       rs.getString("no_rt"),
                                       rs.getString("no_rw"),
                                       rs.getString("dusun"),
                                       rs.getString("KODE_POS"),
                                       rs.getString("TELP"),
                                       rs.getString("NIK"),
                                       rs.getString("NO_KTP"),
                                       rs.getString("TMPT_SBL"),
                                       rs.getString("NO_PASPOR"),
                                       rs.getString("TGL_AKH_PASPOR"),
                                       rs.getString("NAMA_LGKP"),
                                       rs.getString("JENIS_KLMIN"),
                                       rs.getString("TMPT_LHR"),
                                       rs.getString("TGL_LHR"),
                                       rs.getString("AKTA_LHR"),
                                       rs.getString("NO_AKTA_LHR"),
                                       rs.getString("GOL_DRH"),
                                       rs.getString("AGAMA"),
                                       rs.getString("STAT_KWN"),
                                       rs.getString("AKTA_KWN"),
                                       rs.getString("NO_AKTA_KWN"),
                                       rs.getString("TGL_KWN"),
                                       rs.getString("AKTA_CRAI"),
                                       rs.getString("NO_AKTA_CRAI"),
                                       rs.getString("TGL_CRAI"),
                                       rs.getString("STAT_HBKEL"),
                                       rs.getString("KLAIN_FSK"),
                                       rs.getString("PNYDNG_CCT"),
                                       rs.getString("PDDK_AKH"),
                                       rs.getString("JENIS_PKRJN"),
                                       rs.getString("NIK_IBU"),
                                       rs.getString("NAMA_LGKP_IBU"),
                                       rs.getString("NIK_AYAH"),
                                       rs.getString("NAMA_LGKP_AYAH"),
                                       rs.getString("NAMA_KET_RT"),
                                       rs.getString("NAMA_KET_RW"),
                                       rs.getString("NAMA_PET_REG"),
                                       rs.getString("NIP_PET_REG"),
                                       rs.getString("NAMA_PET_ENTRI"),
                                       rs.getString("NIP_PET_ENTRI"),
                                       rs.getString("TGL_ENTRI"));
                                       record.setAcknowldge("N");
                                       record.setHbkelExists(flag);
           }
          }
          else {
            record = new P4BBioObject();
            record.setAcknowldge("F");
          }
          rs.close();
          st.close();
          conn.close();
      }catch(Exception ex)
      {
        siakWriter.writeFile(ex);
         record=new P4BBioObject();
         record.setAcknowldge("E");
      }

     finally {
        try {
          if (rs != null) {
            rs.close();
          }
        }
        catch (Exception e1) {}
        try {
          if (rscnt != null) {
            rscnt.close();
          }
        }
        catch (Exception e11) {}

        try {
          if (st != null) {
            st.close();
          }
        }
        catch (Exception e3) {}

        try {
          if (conn != null) {
            conn.close();
          }
        }
        catch (Exception e4) {}
      }

     return record;
 }
/*End New Function for P4B*/

/*Begin New Function for P4B*/
public P4BBioObject insertP4b(P4BBioObject form)
  {
  String nik_conct = null;
  String new_nik=null;
  String old_nik=null;
  boolean flag=false;
  P4BBioObject new_obj=null;
  Connection conn = null;
  ConnectorDB connectorDb=null;
  PreparedStatement prs=null,prs1=null,prs2=null,prs3=null;
  CallableStatement st = null;
  ResultSet rs=null;

  new_nik=form.getNik();
  old_nik=form.getNik();

try{
  connectorDb = new ConnectorDB();
  conn = connectorDb.getConnection();
if (form.isNewNik(form.getTglLhrLma().trim(),form.getTglLahirform().trim(),form.getJenis_klmn_lma().trim(),form.getJenisKlmin().trim()))
        {
          nik_conct = (form.getNo_prop().trim() + form.getNo_kab().trim() +
                       form.getNo_kec().trim()+
                       String.valueOf(Integer.parseInt(form.getDdlahir().trim())+((Integer.parseInt(form.getJenisKlmin().trim())==1)?0:40)) +
          form.getMmlahir().trim() + form.getYylahir().substring(2, 4).trim());
          st = conn.prepareCall("{? = call getNik(?)}");
          st.registerOutParameter(1, java.sql.Types.VARCHAR);
          st.setString(2, nik_conct);
          st.execute();
          new_nik = st.getString(1); //Returned NIK
        }
form.setNik(new_nik);

if (form.isKK())
    {
try{
     prs=conn.prepareStatement("update data_keluarga_p4b set nama_kep=?,alamat=?,no_rt=?,no_rw=?,dusun=?,kode_pos=?,telp=?,tgl_insertion=? where no_kk=?");
     prs.setString(1,form.getNama_kep());
     prs.setString(2,form.getAlamat());
     prs.setString(3,form.getNoRt());
     prs.setString(4,form.getNoRw());
     prs.setString(5,form.getDusun());
     prs.setString(6,form.getKodePos());
     prs.setString(7,form.getTelp());
     prs.setString(8,form.getTglEntri());
     prs.setString(9,form.getNoKk());
     prs.executeUpdate();
   }
   catch(Exception e1)
      {
        siakWriter.writeFile(e1);
      }
      finally{
        try{
          if (prs!=null) prs.close();
        }catch(Exception inerr)
        {
        }
      }

     prs1=conn.prepareStatement("select * from data_keluarga where no_kk=?");
     prs1.setString(1,form.getNoKk());

if (prs1.executeQuery().next())
     {
       try{
         prs2 = conn.prepareStatement("update data_keluarga set nama_kep=?,alamat=?,no_rt=?,no_rw=?,dusun=?,kode_pos=?,telp=?,tgl_updation=? where no_kk=?");
         prs2.setString(1, form.getNama_kep());
         prs2.setString(2, form.getAlamat());
         prs2.setString(3, form.getNoRt());
         prs2.setString(4, form.getNoRw());
         prs2.setString(5, form.getDusun());
         prs2.setString(6, form.getKodePos());
         prs2.setString(7, form.getTelp());
         prs2.setString(8, form.getTglEntri());
         prs2.setString(9, form.getNoKk());
         prs2.executeUpdate();
       }catch(Exception e2)
       {
         siakWriter.writeFile(e2);
       }
       finally{
         try{
           if (prs1!=null) prs1.close();
         }catch(Exception inerr1)
         {

         }
         try{
           if (prs2!=null) prs2.close();
         }catch(Exception inerr2)
         {

         }
       }
     }
     else
     {
       try{
         prs2 = conn.prepareStatement("insert into data_keluarga(no_kk,nama_kep,alamat,no_rt,no_rw,dusun,kode_pos,telp,no_prop,no_kab,no_kec,no_kel,tgl_insertion,pflag,cflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
         prs2.setString(1, form.getNoKk());
         prs2.setString(2, form.getNama_kep());
         prs2.setString(3, form.getAlamat());
         prs2.setString(4, form.getNoRt());
         prs2.setString(5, form.getNoRw());
         prs2.setString(6, form.getDusun());
         prs2.setString(7, form.getKodePos());
         prs2.setString(8, form.getTelp());
         prs2.setString(9, form.getNo_prop());
         prs2.setString(10, form.getNo_kab());
         prs2.setString(11, form.getNo_kec());
         prs2.setString(12, form.getNo_kel());
         prs2.setString(13, form.getTglEntri());
         prs2.setString(14, "N");
         prs2.setString(15, "N");
         prs2.executeUpdate();
       }catch(Exception e3)
       {
         siakWriter.writeFile(e3);
       }
       finally{
         try{
          if (prs2!=null) prs2.close();
            }catch(Exception inerr2)
            {

            }
       }
     }
       createBiodata(form,conn);
   }
else
{
     prs1=conn.prepareStatement("select * from data_keluarga where no_kk=?");
     prs1.setString(1,form.getNoKk());
     if (!prs1.executeQuery().next())
     {
       try{
           prs2 = conn.prepareStatement("insert into data_keluarga(no_kk,nama_kep,alamat,no_rt,no_rw,dusun,kode_pos,telp,no_prop,no_kab,no_kec,no_kel,tgl_insertion,pflag,cflag) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
           prs2.setString(1, form.getNoKk());
           prs2.setString(2, form.getNama_kep());
           prs2.setString(3, form.getAlamat());
           prs2.setString(4, form.getNoRt());
           prs2.setString(5, form.getNoRw());
           prs2.setString(6, form.getDusun());
           prs2.setString(7, form.getKodePos());
           prs2.setString(8, form.getTelp());
           prs2.setString(9, form.getNo_prop());
           prs2.setString(10, form.getNo_kab());
           prs2.setString(11, form.getNo_kec());
           prs2.setString(12, form.getNo_kel());
           prs2.setString(13, form.getTglEntri());
           prs2.setString(14, "N");
           prs2.setString(15, "N");
           prs2.executeUpdate();
       }catch(Exception e3)
       {
         siakWriter.writeFile(e3);
       }
       finally{
         try {
           if (prs1 != null) prs1.close();
         }catch(Exception inerr1)
         {
          }
         try {
           if (prs2 != null)
             prs2.close();
         }
         catch (Exception inerr2) {


         }
       }

     }
createBiodata(form,conn);
}
new_obj=form;
prs=conn.prepareStatement("update biodata_wni_p4b set cflag='Y' ," + "stat_hbkel=" + form.getStatHbkel() + " where nik=" + old_nik.trim());
prs.execute();
}catch(Exception err)
              {
                new_obj=null;
                siakWriter.writeFile(err);

              }
finally{
  try{
       if (prs!=null) prs.close();
}catch(Exception err)
{
}
  try{
       if (conn!=null) conn.close();
    }catch(Exception err)
    {
    }
    try{
        if (st!=null) st.close();
     }catch(Exception err)
    {    }
}
    return new_obj;
}
 /*End New Function for P4B*/

private boolean createBiodata(P4BBioObject form,Connection con)
 {
PreparedStatement prbio = null;
try{
     String insql =
         "insert into biodata_wni(NIK, NO_KTP, TMPT_SBL, NO_PASPOR, TGL_AKH_PASPOR,";
     insql = insql +
         " NAMA_LGKP, JENIS_KLMIN, TMPT_LHR, TGL_LHR, AKTA_LHR, NO_AKTA_LHR, GOL_DRH,";
     insql = insql +
         " AGAMA, STAT_KWN, AKTA_KWN, NO_AKTA_KWN, TGL_KWN, AKTA_CRAI, NO_AKTA_CRAI,";
     insql = insql +
         " TGL_CRAI, STAT_HBKEL, KLAIN_FSK, PNYDNG_CCT, PDDK_AKH, JENIS_PKRJN, NIK_IBU,";
     insql = insql + " NAMA_LGKP_IBU, NIK_AYAH, NAMA_LGKP_AYAH, NAMA_KET_RT, NAMA_KET_RW, NAMA_PET_REG,";
     insql = insql +
         " NIP_PET_REG, NAMA_PET_ENTRI, NIP_PET_ENTRI, TGL_ENTRI, NO_KK, NO_PROP,";
     insql = insql + " NO_KAB, NO_KEC, NO_KEL,PFLAG, CFLAG) values(";
     insql = insql + " ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
     prbio = con.prepareStatement(insql);
     prbio.setString(1, form.getNik());
     prbio.setString(2, form.getNoKtp());
     prbio.setString(3, form.getTmptSbl());
     prbio.setString(4, form.getNoPaspor());
     prbio.setString(5, form.getTglPasporform());
     prbio.setString(6, form.getNamaLgkp());
     prbio.setString(7, form.getJenisKlmin());
     prbio.setString(8, form.getTmptLhr());
     prbio.setString(9, form.getTglLahirform());
     prbio.setString(10, form.getAktaLhr());
     prbio.setString(11, form.getNoAktaLhr());
     prbio.setString(12, form.getGolDrh());
     if ( (form.getAgama_txt() != null) &&
         ! (form.getAgama_txt().trim().equals(""))) {
       prbio.setString(13, form.getAgama_txt());
     }
     else {
       prbio.setString(13, form.getAgama());
     }
     prbio.setString(14, form.getStatKwn());
     if (form.getAktaKwn() != null)
       prbio.setString(15, form.getAktaKwn());
     else
       prbio.setString(15, "1");
     prbio.setString(16, form.getNoAktaKwn());
     prbio.setString(17, form.getTglKawinform());
     if (form.getAktaCrai() != null)
       prbio.setString(18, form.getAktaCrai());
     else
       prbio.setString(18, "1");
     prbio.setString(19, form.getNoAktaCrai());
     prbio.setString(20, form.getTglCeraiform());
     prbio.setString(21, form.getStatHbkel());
     prbio.setString(22, form.getKlainFsk());
     prbio.setString(23, form.getPnydngCct());
     prbio.setString(24, form.getPddkAkh());
     prbio.setString(25, form.getJenisPkrjn());
     prbio.setString(26, form.getNikIbu());
     prbio.setString(27, form.getNamaLgkpIbu());
     prbio.setString(28, form.getNikAyah());
     prbio.setString(29, form.getNamaLgkpAyah());
     prbio.setString(30, form.getNamaKetRt());
     prbio.setString(31, form.getNamaKetRw());
     prbio.setString(32, form.getNamaPetReg());
     prbio.setString(33, form.getNipPetReg());
     prbio.setString(34, form.getNamaPetEntri());
     prbio.setString(35, form.getNipPetEntri());
     prbio.setString(36, form.getTglEntri());
     prbio.setString(37, form.getNoKk());
     prbio.setString(38, form.getNo_prop());
     prbio.setString(39, form.getNo_kab());
     prbio.setString(40, form.getNo_kec());
     prbio.setString(41, form.getNo_kel());
     prbio.setString(42, "N");
     prbio.setString(43, "N");
     prbio.executeUpdate();
   }catch(Exception bioexcept)
   {
     return false;
   }
   finally{
     try{
       if (prbio!=null) prbio.close();
     }catch(Exception pr1)    {      }
   }
   return true;
 }
}