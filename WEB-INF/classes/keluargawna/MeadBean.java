package keluargawna;

import javax.ejb.*;
import java.sql.*;
import javax.ejb.EJBHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.math.BigDecimal;
import javax.rmi.PortableRemoteObject;
import java.util.Properties;
import java.util.Vector;
import java.text.SimpleDateFormat;

import siaktools.logwriter.*;
import java.util.ResourceBundle;
import java.util.Locale;
import com.db.connection.*;


public class MeadBean implements SessionBean {
  SessionContext sessionContext;
  ServiceEntity factory,factory1;
  DataKeluargaHome home;
  DataKeluarga remote;
  BiodataWnaHome home1;
  BiodataWna remote1;

  private SiakWriter siakWriter;
  //private Logger cat;
  public void ejbCreate() throws CreateException
  {
    try
    {
      ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
      String path = res.getString("BEAN_PATH");
      siakWriter = new SiakWriter(path, "MeadBean.class");
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }

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


 private String getNK(String w_concat,String tgl_lhr,String jns_klmn)
    {
      ConnectorDB connectorDb = new ConnectorDB();
      CallableStatement cs1 = null,cs2=null;
      Connection conn=null;
      String returnval1="",returnval2="";
      String nik_info="";
      String age_add="";
      String dd="";
      String mm="";
      String yy="";

         try
                {
                 //Driver myDriver = (Driver) Class.forName("weblogic.jdbc.pool.Driver").newInstance();
                 conn = connectorDb.getConnection();
                 cs1 = conn.prepareCall("{? = call getkk(?)}");
                 cs1.registerOutParameter(1,java.sql.Types.VARCHAR);
                 cs1.setString(2,w_concat);
                 cs1.execute();
                 returnval1 = cs1.getString(1);
                 cs1.close();

                   dd= tgl_lhr.substring(0, 2);
                   mm=tgl_lhr.substring(3, 5);
                   yy = tgl_lhr.substring(8);

                  if(Integer.parseInt(jns_klmn)==2)
                  {
                    dd=""+(Integer.parseInt(dd)+40);
                  }

                  nik_info=w_concat+dd+mm+yy;

                  cs2 = conn.prepareCall("{? = call getNik(?)}");
                  cs2.registerOutParameter(1,java.sql.Types.VARCHAR);

                  cs2.setString(2,nik_info);

                  cs2.execute();
                 returnval2 = cs2.getString(1);

                 cs2.close();
                 cs1 = null;
                 cs2 = null;
                 conn.close();
                 conn=null;
                }
                catch(Exception e)
                {
                  siakWriter.writeFile(e);
                }
                finally{
                  try
                  {
                    if(cs1!=null) cs1.close();
                  }
                  catch(Exception e)
                  {
                    e.printStackTrace();
                    siakWriter.writeFile(e);
                  }
                  try
                  {
                    if(cs2!=null) cs2.close();
                  }
                  catch(Exception e)
                  {
                    e.printStackTrace();
                    siakWriter.writeFile(e);
                  }

                      try{
                        if(conn!=null) conn.close();
                      }
                      catch(Exception c)
                      {
                        siakWriter.writeFile(c);
                     }
                    }
   return (returnval1.trim()+returnval2.trim());
    }

    private String getNI(String s,String jns,String t)
      {
        int i;
        ConnectorDB connectorDb = new ConnectorDB();
        CallableStatement cs=null;
        Connection conn=null;
        String s1="",s2="",s3="",sss="";
        String returnval1="";

                    try{
                      conn = connectorDb.getConnection();
                      s1 = s.substring(0, 2);
                      s2 = s.substring(3, 5);
                      s3 = s.substring(8, 10);

                       if(Integer.parseInt(jns)==2)
                           {
                              i=Integer.parseInt(s1)+40;
                              s1=""+i;
                           }
                           sss=t+s1+s2+s3;

                           cs = conn.prepareCall("{? = call getNik(?)}");

                           cs.registerOutParameter(1,java.sql.Types.VARCHAR);

                           cs.setString(2,sss);

                           cs.execute();

                           returnval1 = cs.getString(1);
                           cs.close();
                           conn.close();
                           cs = null;
                           conn = null;
                    }
                    catch(Exception nk)
                    {
                      siakWriter.writeFile(nk);
                    }
                    finally{
                      try{
                        if(conn!=null) conn.close();
                        }
                        catch(Exception c1)
                        {
                          siakWriter.writeFile(c1);
                        }
                    }

        return returnval1;
 }

 public String setDataKelWna(GdataWna obj,GdataKelu kelu,
                             String wilayah_concat,String tgl_lhr,String jenis_klmin)
  {
    String num_kk="",nik_indivu="";
    String str_all="";
  try
  {

    str_all=getNK(wilayah_concat, tgl_lhr, jenis_klmin);
    num_kk=str_all.substring(0,16).trim();
    nik_indivu=str_all.substring(16).trim();
    System.out.println("MeadBean num_kk" + num_kk);
    kelu.setDknokk(num_kk);
    obj.setNoKk(num_kk);

    System.out.println("MeadBean obj.getNoKk()" + obj.getNoKk());

    obj.setNik(nik_indivu);

    System.out.println("obj.setNik(nik_indivu)" + obj.getNik());
    factory=ServiceEntity.getInstance();

    home = (DataKeluargaHome) factory.lookup("DataKeluarga_machine2",DataKeluargaHome.class);

   if (home!=null)
    {
      remote = home.create(obj,kelu);
     }

  }
  catch(Exception err)
  {
    siakWriter.writeFile(err);

    System.out.println("Error in setDataKelWna=" + err.toString());
  }
return str_all;
 }


 public String setBiodata(GdataWna obj,String t,String m,String j)
 {
   String new_nik="";

   try
  {
       obj.setNik(getNI(m,j,t));
       factory1=ServiceEntity.getInstance();
       home1=(BiodataWnaHome)factory1.lookup("BiodataWna_machine2",BiodataWnaHome.class);

   if (home1!=null)
    {
      remote1 = home1.create(obj);
      new_nik=obj.getNik();
    }

  }
  catch(Exception ma)
  {
    siakWriter.writeFile(ma);
    System.out.println("Error in Session Facade" +ma.toString());
  }
   System.out.println("the NIk in bean is "+new_nik);
   return new_nik;
 }

 public boolean setPeruwna(GdataWna obj)
 {
   boolean b=false;
try
  {
   factory1=ServiceEntity.getInstance();
   home1=(BiodataWnaHome)factory1.lookup("BiodataWna_machine2",BiodataWnaHome.class);

   if (home1!=null)
   {
   remote1 = home1.findByPrimaryKey(new BigDecimal(obj.getNik().trim()));

   remote1.setNamaKlrga(obj.getNamaKlrga());
   System.out.println("obj.getNamaKlrga()" + obj.getNamaKlrga());

   remote1.setNamaPertma(obj.getNamaPertma());
   System.out.println("obj.getNamaPertma()" + obj.getNamaPertma());

   remote1.setTmptLhr(obj.getTmpLhr());
   System.out.println("obj.getTmpLhr()" + obj.getTmpLhr());

   remote1.setKwrngrn(obj.getKwrmgr());

   System.out.println("obj.getKwrmgr()" + obj.getKwrmgr());

   remote1.setAgama(obj.getAga());

   System.out.println("obj.getAga()" + obj.getAga());

   remote1.setGolDrh(new BigDecimal(obj.getGolDrh().trim() ));

  System.out.println("obj.getGolDrh()" + obj.getGolDrh());

   remote1.setStatKwn(new BigDecimal(obj.getStatKwn().trim()));
   System.out.println("obj.getStatKwn()" + obj.getStatKwn());

   remote1.setPddkAkh(new BigDecimal(obj.getPddlAkh().trim() ));
   System.out.println("obj.getPddlAkh().trim()" + obj.getPddlAkh().trim());

   remote1.setJenisPkrjn(new BigDecimal(obj.getJenisPkrjn().trim() ));
   System.out.println("obj.getJenisPkrjn()" + obj.getJenisPkrjn());

   remote1.setAlamatSpsor(obj.getAlmtSpr());
   System.out.println("obj.getAlmtSpr()" + obj.getAlmtSpr());

   if (checkNull(obj.getNoRt()))
   remote1.setNoRt(new BigDecimal(obj.getNoRt().trim()));

   if (checkNull(obj.getNoRw()))
  remote1.setNoRw(new BigDecimal(obj.getNoRw().trim() ));

   if (checkNull(obj.getKodPos()))
   remote1.setKodepos(new BigDecimal(obj.getKodPos().trim() ));

   remote1.setTelepon(obj.getTelPon());

   remote1.setDatngDari(obj.getDatngDari());

   remote1.setTujuanDtng(obj.getTujuanDtng());
   remote1.setTglPaspor(obj.getTglPas());
   remote1.setTglAkhPaspor(obj.getTglAkhPas());
   remote1.setNamaSpsor(obj.getNamaspr());

   System.out.println("obj.getTipespr()" + obj.getTipespr());
   remote1.setTipeSpsor(new BigDecimal(obj.getTipespr().trim() ));
   System.out.println("obj.getDokImgr()" + obj.getDokImgr());
   remote1.setDokImgr(new BigDecimal(obj.getDokImgr().trim() ));

   remote1.setNoDok(obj.getNodok());
   remote1.setTmptDtbit(obj.getTmptDtbt());
   remote1.setTglDtbit(obj.getTglDtbt());
   remote1.setTglAkhDok(obj.getTglAkhDok());
   remote1.setTmptDtngPert(obj.getTmptDtngPert());
   remote1.setTglDtngPert(obj.getTglDtngPert());
   remote1.setNoStld(obj.getNoStld());
   remote1.setTglDft(obj.getTglDft());
   remote1.setNamaDin(obj.getNamaDin());
   remote1.setNamaKepDin(obj.getNamaKepDin());
System.out.println("check in 1");
   remote1.setNipKepDin(new BigDecimal(obj.getNipKepDin().trim() ));

   remote1.setNamaPetEntri(obj.getNamaPetEnt());
   System.out.println("check in 2");
   remote1.setNipPetEntri(new BigDecimal(obj.getNipPetEnt().trim()));
   System.out.println("check in 3");
   remote1.setNoProp(new BigDecimal(obj.getNoProp().trim() ));
   System.out.println("check in 4");
   remote1.setNoKab(new BigDecimal(obj.getNoKab().trim() ));

   remote1.setTglUbah(obj.getTglEnt());
   System.out.println("check in 5");

   if ((obj.getStatHbkel()!=null) && (!obj.getStatHbkel().trim().equals(""))
       && (!obj.getStatHbkel().equals("1")))
   remote1.setStatHbkel(new BigDecimal(obj.getStatHbkel().trim()));

   remote1.setCflag("Y");
   System.out.println("Updated  BiodataWna....");
      b=true;
    }

  }
  catch(Exception err)
  {
    siakWriter.writeFile(err);
    System.out.println("Error in MeadBean"+err.toString());
    b=false;
  }
   return b;
 }

private static boolean checkNull(Object trimdata) {
  if ((trimdata != null) && (!trimdata.toString().trim().equals(""))
     && (!trimdata.toString().trim().equals("0")) && (!trimdata.toString().trim().equals("-")))
      {
    return true;
  }
  return false;
}


}