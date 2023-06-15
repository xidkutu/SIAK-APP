<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
    response.setHeader("Pragma", "No-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "private");
    String day =null,no_kel,nama_kel,select,id1=null,nik_bayi=null,kel=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;
    Login remote;
    WNIBiodataHome home = null;
    WNIBiodata remote2 = null;
    Vector v1;
    KabNikData lahirData=null;
    lahirData=null;
    String new_day="";
    new_day="";
    String dd=null,mon=null,yy=null;
    String tgl_lahir="";
    tgl_lahir="";
    String tgl_mlpor="";
    tgl_mlpor="";
    String tgl_ctt_kwn="";
    tgl_ctt_kwn="";
    String ctt_tgl="";
    ctt_tgl="";
    String day1="-", edit = "";
    day1="-";
    edit = "";
    int wn_ibu = 0;

String nik_ibu = null;
String nama_ibu = null;
String getDDTglLahirIbu = null;
String getMMTglLahirIbu = null;
String getYYTglLahirIbu = null;
int jenis_pkrjn_ibu = 0;
String alamat_ibu = null;
String no_rt_ibu = null;
String no_rw_ibu = null;
String dusun_ibu = null;
String kodepos_ibu = null;
String telp_ibu = null;
String nama_prop_ibu = null;
String nama_kab_ibu = null;
String nama_kec_ibu = null;
String nkelibu = null;
int ketrunan_ibu = 0;
String bangsa_ibu = null;
String getDDTglKawinIbu = null;
String getMMTglKawinIbu = null;
String getYYTglKawinIbu = null;

int wn_ayah = 0;
String nik_ayah = null;
String nama_ayh = null;
String getDDTglLahirAyah = null;
String getMMTglLahirAyah = null;
String getYYTglLahirAyah = null;
int jenis_pkrjn_ayh = 0;
String alamat_ayh = null;
String no_rt_ayh = null;
String no_rw_ayh = null;
String dusun_ayh = null;
String kodepos_ayh = null;
String telp_ayh = null;
String nama_prop_ayh = null;
String nama_kab_ayh = null;
String nama_kec_ayh = null;
String nkelayh = null;
int ketrunan_ayh = 0;
String bangsa_ayh = null;
String getDDTglKawinAyah = null;
String getMMTglKawinAyah = null;
String getYYTglKawinAyah = null;

int wn_pelapor = 0;
String nik_pelapor = null;
String nama_pelapor = null;
String tgl_lahir_pelapor = null;
int jenis_pkrjn_plpor = 0;
String alamat_pelapor = null;
String rt_pelapor = null;
String rw_pelapor = null;
String dusun_pelapor = null;
String kodepos_pelapor = null;
String telp_pelapor = null;
String no_akta_lhr_dd2 = null;
String no_akta_lhr_mm2 = null;
String no_akta_lhr_yy2 = null;
	 boolean kecInput = false;
int wn_saksi_1 = 0;
int wn_saksi_2 = 0;
WniWnaObj wniWnaObj = null;

int statusReqIbu = TIDAKADA;
int statusReqAyah = TIDAKADA;

int radiobutton = -1;
radiobutton = -1;
int radiobutton1 = -1;
radiobutton1 = -1;
int radiobutton3 = -1;
radiobutton3 = -1;
int radiobutton4 = -1;
radiobutton4 = -1;
%>

<%
     factory=ServiceController.getInstance();
     nik_bayi = (request.getParameter("nik_bayi")==null || request.getParameter("nik_bayi").equals("")?"":request.getParameter("nik_bayi"));
     nik_ibu = (request.getParameter("nik_ibu")==null?"":request.getParameter("nik_ibu"));
     nik_ayah = (request.getParameter("nik_ayh")==null?"":request.getParameter("nik_ayh"));
     nik_pelapor = (request.getParameter("nik_plpor")==null?"":request.getParameter("nik_plpor"));
     String nik_sksi1 = (request.getParameter("nik_sksi1")==null?"":request.getParameter("nik_sksi1"));
     String nik_sksi2 = (request.getParameter("nik_sksi2")==null?"":request.getParameter("nik_sksi2"));
     kel = new String("KELUAR");
try
{
        v = new Vector();
        record = (UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
      home = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);
      if(home != null)
      {
          remote2 = home.create();
      }
       Vector errors = null;
       errors = new Vector();

       boolean allowed = true;
   try {
     if (!nik_bayi.equals("") && !nik_sksi1.equals("") && !nik_sksi2.equals("")) {
        if (!nik_bayi.equals("") || !nik_ibu.equals("") || !nik_ayah.equals("") || !nik_pelapor.equals("")) {
           wniWnaObj = remote2.getDataKlr(nik_bayi, nik_ibu, nik_ayah, nik_pelapor, Integer.parseInt(record.getLevelId()));
        }
        try {
           lahirData=(KabNikData)remote2.getLahirData(nik_bayi, nik_sksi1, nik_sksi2);
           //System.out.println(129);
        } catch (CapilException ex) {
           allowed = false;
           errors.add(ex.getMessage());
           ex.printStackTrace();
        }
 if(lahirData != null) {
               System.out.println("Enter lahir data");
           if (allowed) {
              if (lahirData.getRecordBayi()==null) {
                 errors.add("NIK Bayi tidak ada ");
              }
              if (lahirData.getRecordBayi()!=null && lahirData.getRecordPelapor()==null) {
                 System.out.println(170);
                 kecInput = true;
              }
              if (lahirData.getRecordSaksi()!=null) {
                 if (lahirData.getRecordSaksi().getSaksi1Record()==null) {
                    errors.add("NIK Saksi I tidak ada ");
                 }
                 if (lahirData.getRecordSaksi().getSaksi2Record()==null) {
                    errors.add("NIK Saksi II tidak ada ");
                 }
              } else {
                 errors.add("NIK Saksi I tidak ada ");
                 errors.add("NIK Saksi II tidak ada ");
              }
           } else {
                 errors.add("Data Kelahiran sudah tercatat");
           }
           if (!"".equals(nik_bayi)) {
             if (lahirData.getRecordBayi()!=null) {
             day1 = getLocaleDay(lahirData.getRecordBayi().getTglLhr());
             } else if (wniWnaObj!=null && (wniWnaObj.getWniObj()!=null || wniWnaObj.getWnaObj()!=null)) {
                if (wniWnaObj.getWniObj().getRecord1()!=null)
                   day1 = getLocaleDay(wniWnaObj.getWniObj().getRecord1().getTglLhr());
                if (wniWnaObj.getWnaObj().getRecord1()!=null)
                   day1 = getLocaleDay(wniWnaObj.getWnaObj().getRecord1().getTglLhr());
             }
           }
         } else {
System.out.println(171);
                 kecInput = true;
         }
      }
   } catch (Exception ex) {

ex.printStackTrace();

//System.out.println("ex");
		    kecInput = true;
   }

if (kecInput) {
   statusReqIbu = TIDAKADA;
   statusReqAyah = TIDAKADA;
   if (wniWnaObj!=null &&
       wniWnaObj.getWniObj()!=null &&
       wniWnaObj.getWnaObj()!=null) {
       if (!"".equals(nik_ibu) && wniWnaObj.getWniObj().getRecord2()==null &&
           wniWnaObj.getWnaObj().getRecord2()==null) { // ADANOTEXIST
           statusReqIbu = ADANOTEXIST;
       } else if (!"".equals(nik_ibu) && wniWnaObj.getWniObj().getRecord2()!=null ||
           wniWnaObj.getWnaObj().getRecord2()!=null) { // ADAEXIST
//System.out.println(224);
           statusReqIbu = ADAEXIST;
       }
       if (!"".equals(nik_ayah) && wniWnaObj.getWniObj().getRecord3()==null &&
           wniWnaObj.getWnaObj().getRecord3()==null) { // ADANOTEXIST
//System.out.println(229);
           statusReqAyah = ADANOTEXIST;
       } else if (!"".equals(nik_ayah) && wniWnaObj.getWniObj().getRecord3()!=null ||
           wniWnaObj.getWnaObj().getRecord3()!=null) { // ADAEXIST
//System.out.println(233);
           statusReqAyah = ADAEXIST;
       }
   }

} else {
   statusReqIbu = ADANOTEXIST;
   statusReqAyah = ADANOTEXIST;
   if (lahirData!=null &&
       lahirData.getRecordBayi()!=null) {
       if (lahirData.getRecordBayi().getNikIbu()!=null) {
System.out.println(255);
          statusReqIbu = ADAEXIST;
       } else if (lahirData.getRecordBayi().getNamaIbu()!=null) {
System.out.println(258);
          statusReqIbu = TIDAKADA;
       } else {// ADANOTEXIST
System.out.println(261);
          statusReqIbu = ADANOTEXIST;
       }
       if (lahirData.getRecordBayi().getNikAyh()!=null) {
System.out.println(265);
          statusReqAyah = ADAEXIST;
       } else if (lahirData.getRecordBayi().getNamaAyh()!=null) {
System.out.println(268);
          statusReqAyah = TIDAKADA;
       } else {// ADANOTEXIST
System.out.println(271);
          statusReqAyah = ADANOTEXIST;
       }
   }
}

if (kecInput) {
//System.out.println(283);
    wn_ibu = ("".equals(nik_ibu)?(request.getParameter("radiobutton1")==null?0:Integer.parseInt(request.getParameter("radiobutton1"))):(nik_ibu.startsWith("A")?2:1));
//(request.getParameter("radiobutton1")==null?0:Integer.parseInt(request.getParameter("radiobutton1")));
  radiobutton1 = wn_ibu-1;

  wn_ayah = ("".equals(nik_ayah)?(request.getParameter("radiobutton4")==null?0:Integer.parseInt(request.getParameter("radiobutton4"))):(nik_ayah.startsWith("A")?2:1));
  radiobutton4 = wn_ayah-1;

  //System.out.println(307);
  wn_pelapor = ("".equals(nik_pelapor)?0:(nik_pelapor.startsWith("A")?2:1));

} else if (lahirData!=null && lahirData.getRecordBayi()!=null /*&& lahirData.getRecordBayi().getNikIbu()!=null*/) {
System.out.println(288);
if (statusReqIbu!=ADANOTEXIST) {
System.out.println(289);
//System.out.println("lahirData.getRecordBayi().getKwrngrnIbu()="+lahirData.getRecordBayi().getKwrngrnIbu());
wn_ibu = Integer.parseInt(lahirData.getRecordBayi().getKwrngrnIbu().toString().substring(1,2));
//(lahirData.getRecordBayi().getNikIbu().startsWith("A")?2:1);
radiobutton1 = wn_ibu-1;
}
if (statusReqAyah!=ADANOTEXIST) {
System.out.println(290);
//System.out.println("lahirData.getRecordBayi().getKwrngrnAyh()="+lahirData.getRecordBayi().getKwrngrnAyh());
wn_ayah = Integer.parseInt(lahirData.getRecordBayi().getKwrngrnAyh().toString());
//wn_ayah = (lahirData.getRecordBayi().getNikAyh().startsWith("A")?2:1);
radiobutton4 = wn_ayah-1;
}
if (lahirData.getRecordPelapor()!=null) {
  System.out.println(310);
  wn_pelapor = (lahirData.getRecordBayi().getKwrngrnIbu()==null?0:Integer.parseInt(lahirData.getRecordBayi().getKwrngrnIbu().toString().substring(3,4)));
}
}


 int step = 0;
 step = 0;
   if (errors.isEmpty() &&
       lahirData!=null &&
       lahirData.getRecordSaksi()!=null &&
       lahirData.getRecordSaksi().getSaksi1Record()!=null &&
       lahirData.getRecordSaksi().getSaksi2Record()!=null) {
System.out.println(313);
       if (kecInput ||
           (lahirData.getRecordBayi()!=null &&
            lahirData.getRecordBayi().getNikBayi()!=null &&
            statusReqIbu!=ADANOTEXIST //&&
            /*statusReqAyah!=ADANOTEXIST*/)) {
System.out.println(319);
          step = 1;
       }
       if (step>=1) {
          if (kecInput) {
            if (wniWnaObj!=null) {
               if (wniWnaObj.getWniObj()!=null && wniWnaObj.getWnaObj()!=null) {
                 if (!("".equals(nik_bayi)) && wniWnaObj.getWniObj().getRecord1()==null && wniWnaObj.getWnaObj().getRecord1()==null) {
                    errors.add("NIK Bayi tidak ada ");
                 }
                 if (statusReqIbu==ADANOTEXIST) {
                    errors.add("NIK Ibu tidak ada ");
                 }
                 if (statusReqAyah==ADANOTEXIST) {
                    errors.add("NIK Ayah tidak ada ");
                 }
                 if (!("".equals(nik_pelapor)) && wniWnaObj.getWniObj().getRecord4()==null && wniWnaObj.getWnaObj().getRecord4()==null) {
                    errors.add("NIK Pelapor tidak ada ");
                 }
                 if (errors.isEmpty()) {
                    step = 2;
                 }
               }
            } else {
System.out.println(262);
            }
          } else if (lahirData.getRecordBayi()!=null &&
            lahirData.getRecordBayi().getNikBayi()!=null &&
            statusReqIbu!=ADANOTEXIST //&&
            /*statusReqAyah!=ADANOTEXIST*/) {
               step = 3;
          }
       }
   }
 if(errors.isEmpty()) { errors= null;}

if (step>0) {
  if (wn_ibu>0) {
  if (statusReqIbu>TIDAKADA) {
System.out.println(267);
      radiobutton = 0;
  } else if (statusReqIbu==TIDAKADA) {
System.out.println(269);
     radiobutton = 1;
  }
  }
  if (wn_ayah>0) {
  if (statusReqAyah>TIDAKADA) {
System.out.println(275);
      radiobutton3 = 0;
  } else if (statusReqAyah==TIDAKADA) {
     radiobutton3 = 1;
System.out.println(279);
  }
  }
}
%>
<html>
   <META http-equiv=Content-Type content="text/html; charset=windows-1252">
   <LINK type="text/css" href="Templates/s.css" rel=stylesheet>
   <link id="webfx-tab-style-sheet" type="text/css" rel="stylesheet" href="Templates/tab.webfx.css"/>
   <BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
      <form name="form1" method="post">
         <script language="text/javaScript">
            var tp1;
         </script>
         <script language="javaScript" src="Templates/tabpane.js"></script>
         <script type="javascript" src="Templates/webfxlayout.js"></script>
         <SCRIPT language=JavaScript src="scripts/util.js"></SCRIPT>
         <SCRIPT language=JavaScript src="scripts/Kelahiran.js"></SCRIPT>
         <SCRIPT language=JavaScript src="scripts/SaksiNik.js"></SCRIPT>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td background="images/v_bg_header.gif"><jsp:include page="topcapil.html"/></td>
            </tr>
            <tr>
               <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                     <tr>
                        <td>
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                 <td height="20">
                                    <div align="center"><span class="submenu">Pencatatan Kelahiran</span><br><br></div>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td>
<% String jsp = "data_wilayah.jsp?level=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
%>
                          <jsp:include page="<%=jsp%>"/>
                        </td>
                     </tr>

		   <%
                         if (errors!=null) {
                           for (int i=0; i<errors.size(); i++)  {
                   %>
                           <tr><td><%=printError(errors.elementAt(i).toString(), "left")%></td></tr>
                   <%
                           }
    		         }
                    %>
                  </table>
               </td>
            </tr>
         </table width="100%" border="0" cellspacing="5" cellpadding="5">
         <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
         <tr>
            <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
            <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
         </tr>
         <tr>
            <td>&nbsp;</td>
            <td valign="top">
               <div align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                     <tr>
                        <td align="center">
<div class="tab-pane" id="tab-pane-1">
                              <script type="text/javascript">
                                 tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
                              </script>
<%
//System.out.println(270);
int wn_bayi = ("".equals(nik_bayi)?0:(nik_bayi.substring(0,1).equals("A")?2:1));
//if(lahirData!=null && lahirData.getRecordBayi() == null)
if ("".equals(nik_bayi) &&
    ((kecInput &&
      (wniWnaObj!=null ||
       wniWnaObj.getWniObj()!=null ||
       wniWnaObj.getWnaObj()!=null ||
       (wniWnaObj.getWniObj().getRecord1()==null &&
        wniWnaObj.getWnaObj().getRecord1()==null))) ||
     (!kecInput && lahirData!=null && lahirData.getRecordBayi()==null))) {
edit="disabled";
System.out.println("999");
}
String nama_bayi = "-";
String jenis_kelamin_bayi = "-";
int tmpt_dilhr = (request.getParameter("tmpt_dilhr")==null?0:Integer.parseInt(request.getParameter("tmpt_dilhr")));
String tempat_lahir_bayi = "-";
String tanggal_lahir_bayi = "-";
String pukul_lhr1 = ((request.getParameter("pukul_lhr1")==null)?"":request.getParameter("pukul_lhr1"));
String pukul_lhr2 = ((request.getParameter("pukul_lhr2")==null)?"":request.getParameter("pukul_lhr2"));
int wkt_pkl_lhr = ((request.getParameter("wkt_pkl_lhr")==null)?0:Integer.parseInt(request.getParameter("wkt_pkl_lhr")));
int jenis_klahir = ((request.getParameter("jenis_klahir")==null)?0:Integer.parseInt(request.getParameter("jenis_klahir")));
String anak_ke_lhr = (request.getParameter("anak_ke_lhr")==null?"":request.getParameter("anak_ke_lhr"));
int pnlng_klahir = ((request.getParameter("pnlng_klahir")==null)?0:Integer.parseInt(request.getParameter("pnlng_klahir")));
String brt_bayi = (request.getParameter("brt_bayi")==null?"":request.getParameter("brt_bayi"));
String tanggal_entri = "-";
int no_kec = -1;
//System.out.println(299);
//if (lahirData!=null && lahirData.getRecordBayi()!=null) {
if (!kecInput && step>0 && lahirData!=null && lahirData.getRecordBayi()!=null) {
   //System.out.println(311);
   nama_bayi = lahirData.getRecordBayi().getNamaLgkp().toUpperCase();
   jenis_kelamin_bayi = (lahirData.getRecordBayi().getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN");
   tempat_lahir_bayi = lahirData.getRecordBayi().getTmptLhr().toUpperCase();
   tanggal_lahir_bayi = lahirData.getRecordBayi().getTglLhr();

   tmpt_dilhr = (lahirData.getRecordBayi().getTmptDilhr()==null?0:lahirData.getRecordBayi().getTmptDilhr().intValue());
   pukul_lhr1 = (lahirData.getRecordBayi().getPukulLhr()!=null?lahirData.getRecordBayi().getPukulLhr().substring(0,2):"");
   pukul_lhr2 = (lahirData.getRecordBayi().getPukulLhr()!=null?lahirData.getRecordBayi().getPukulLhr().substring(3,5):"");
   wkt_pkl_lhr = (lahirData.getRecordBayi().getWktPklLhr()==null?0:lahirData.getRecordBayi().getWktPklLhr().intValue());
   jenis_klahir = (lahirData.getRecordBayi().getJenisKlahir()==null?0:lahirData.getRecordBayi().getJenisKlahir().intValue());
   anak_ke_lhr = (lahirData.getRecordBayi().getAnakKeLahir()==null?"":lahirData.getRecordBayi().getAnakKeLahir().toString());
   pnlng_klahir = (lahirData.getRecordBayi().getPnlngBayi()==null?0:lahirData.getRecordBayi().getPnlngBayi().intValue());
   brt_bayi = (lahirData.getRecordBayi().getBrtBayi()==null?"":lahirData.getRecordBayi().getBrtBayi());
   tanggal_entri = ((lahirData.getRecordBayi().getTglEntri()==null)?"-":lahirData.getRecordBayi().getTglEntri());
    no_kec = ((lahirData.getRecordBayi().getNoKec()==null)?-1:lahirData.getRecordBayi().getNoKec().intValue());
} else if (kecInput && wniWnaObj!=null && (wniWnaObj.getWniObj()!=null || wniWnaObj.getWnaObj()!=null) && (wniWnaObj.getWniObj().getRecord1()!=null || wniWnaObj.getWnaObj().getRecord1()!=null)) {
  //System.out.println(517);
   BayiData bayiObj = wniWnaObj.getWniObj().getRecord1();
   if (bayiObj!=null) {
  //System.out.println(520);
      nama_bayi = bayiObj.getNamaLgkp().toUpperCase();
      jenis_kelamin_bayi = (bayiObj.getJenisKlmin()==null?"-":(Integer.parseInt(bayiObj.getJenisKlmin())==1?"LAKI-LAKI":"PEREMPUAN")); //(bayiObj.getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN");
      tempat_lahir_bayi = bayiObj.getTmptLhr().toUpperCase();
      tanggal_lahir_bayi = bayiObj.getTglLhr();
   }
   BayiDataWna bayiWnaObj = wniWnaObj.getWnaObj().getRecord1();
   if (bayiWnaObj!=null) {
  System.out.println(528);
      nama_bayi = bayiWnaObj.getNamaPertma().toUpperCase();
      jenis_kelamin_bayi = (bayiWnaObj.getJnsKlm()==null?"-":(Integer.parseInt(bayiWnaObj.getJnsKlm())==1?"LAKI-LAKI":"PEREMPUAN")); //(bayiObj.getJenisKlmin().intValue()==1?"LAKI-LAKI":"PEREMPUAN");
      tempat_lahir_bayi = bayiWnaObj.getTmpLhr().toUpperCase();
      tanggal_lahir_bayi = bayiWnaObj.getTglLhr();
   }
}
/*
if (wn_bayi==1 && lahirData!=null && lahirData.getRecordBayi()!=null) {
   nik_bayi =  lahirData.getRecordBayi().getNikBayi();
} else if (wn_bayi==2 && lahirData!=null && lahirData.getRecordBayi()!=null) {
   nik_bayi =  "A" + lahirData.getRecordBayi().getNikBayi();

   }
*/
//System.out.println(313);
%>
<div class="tab-page" style="postion:absolute"  id="tabPage1">
                                 <h2 class="tab">Data Bayi</h2>
                                 <script type="text/javascript">
                                    tp1.addTabPage(document.getElementById("tabPage1"));
                                 </script>
                                 <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                                    <tr>
                                       <td>
                                          <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                                             <tr>
                                                <td colspan="7"> </td>
                                             </tr>
                                             <tr>
                                                <td width="21%">
                                                   <p style="line-height: 100%">NIK Bayi<font color="#000099" class="asterish">*</font></p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <input type="text" name="nik_bayi" size="18" value='<%=nik_bayi%>' class="boxdefault" maxlength="17"  onKeyUp="return num1(form1.nik_bayi)" onChange="setSaveEnabled(false)">
                                                   </p>
                                                </td>
                                                <td width="1%">&nbsp;</td>
                                                <td width="24%">
                                                   <p style="line-height: 100%">Nama Lengkap</p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <%=nama_bayi%>
						   </p>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td width="21%">
                                                   <p style="line-height: 100%">Jenis Kelamin</p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <%=jenis_kelamin_bayi%>
                                                   </p>
                                                </td>
                                                <td width="1%">&nbsp;</td>
                                                <td width="24%">
                                                   <p style="line-height: 100%">Tempat Dilahirkan<font color="#000099" class="asterish">*</font></p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <select size="1" name="tmpt_dilhr" class="boxdefault">
                                                         <option value="0" selected>-- Pilih Tempat Dilahirkan --</option>
                                                         <option value="1">1 - RS/RB</option>
                                                         <option value="2">2 - Puskesmas</option>
                                                         <option value="3">3 - Polindes</option>
                                                         <option value="4">4 - Rumah</option>
                                                         <option value="5">5 - Lainnya</option>
                                                      </select>
                                                   </p>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td width="21%">
                                                   <p style="line-height: 100%">Tempat Lahir</p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <%=tempat_lahir_bayi%>
					           </p>
                                                </td>
                                                <td width="1%">&nbsp;</td>
                                                <td width="24%">
                                                   <p style="line-height: 100%">Tanggal Lahir</p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <%=tanggal_lahir_bayi%>
                                                   </p>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td width="21%">
                                                   <p style="line-height: 100%">Hari Lahir&nbsp;</p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <%=day1%>
                                                   </p>
                                                </td>
                                                <td width="1%">&nbsp;</td>
                                                <td width="24%">
                                                   <p style="line-height: 100%">Pukul<font color="#000099" class="asterish">*</font></p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <input type="text" name="pukul_lhr1" value='<%=pukul_lhr1%>' size="2" class="boxdefault" maxlength="2" onKeyUp="return tab()">
                                                      <b>:</b>
                                                      <input type="text" name="pukul_lhr2" value='<%=pukul_lhr2%>' size="2" class="boxdefault" maxlength="2" onKeyUp="return tab1()">
                                                      <select size="1" name="wkt_pkl_lhr" class="boxdefault">
                                                         <option value="0" selected>-- Pilih Waktu --</option>
                                                         <option value="1">1 - WIB</option>
                                                         <option value="2">2 - WITA</option>
                                                         <option value="3">3 - WIT</option>
                                                      </select>
                                                   </p>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td width="21%">
                                                   <p style="line-height: 100%">Jenis Kelahiran<font color="#000099" class="asterish">*</font></p>
                                                </td>
                                                <td width="1%">:</td>
                                                <td width="26%">
                                                   <p style="line-height: 100%">
                                                      <select size="1" name="jenis_klahir" class="boxdefault">
                                                         <option  value="0" selected>-- Pilih Jenis Kelahiran --</option>
                                                         <option value="1">1 - Tunggal</option>
                                                         <option value="2">2 - Kembar 2</option>
                                                         <option value="3">3 - Kembar 3</option>
                                                         <option value="4">4 - Kembar 4</option>
                                                         <option value="5">5 - Lainnya</option>
                                                      </select>
                                </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Anak ke<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="anak_ke_lhr" size="2" value='<%=anak_ke_lhr%>' class="boxdefault" maxlength="2" onKeyUp="return num(form1.anak_ke_lhr)">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Penolong Kelahiran<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="pnlng_klahir" class="boxdefault">
                                     <option value="0" selected>-- Pilih Penolong Kelahiran
                                    --</option>
                                    <option value="1">1 - Dokter</option>
                                    <option value="2">2 - Bidan/Perawat</option>
                                    <option value="3">3 - Dukun</option>
                                    <option value="4">4 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Berat Bayi</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                    <input type="text" name="brt_bayi" size="5" value='<%=brt_bayi%>' class="boxdefault" maxlength="5"  onKeyUp="return tab2()">
                                  Kg</p>
                              </td>
                            </tr>
                          </table>
                        </td>
                     </tr>
                  </table>
               </div>

<%
/*
if (lahirData==null) {
  lahirData = new KabNikData();
  lahirData.setRecordBayi(new LahiObject());
  lahirData.setRecordPelapor(new PelaporNikData());
}
*/
//if (kecInput || (lahirData!=null )) {
/*if (step>0) */
//System.out.println(495);

//radiobutton1 = wn_ibu-1;

if(statusReqIbu==ADANOTEXIST)
{
  System.out.println(366);
  //System.out.println("radiobutton="+request.getParameter("radiobutton"));
  if (statusReqIbu==0) {
    edit="disabled";
    System.out.println("1000");
  }
}

 nama_ibu = (request.getParameter("nama_ibu")==null?"":request.getParameter("nama_ibu"));
 getDDTglLahirIbu = (request.getParameter("no_akta_lhr_dd")==null?"":request.getParameter("no_akta_lhr_dd"));
 getMMTglLahirIbu = (request.getParameter("no_akta_lhr_mm")==null?"":request.getParameter("no_akta_lhr_mm"));
 getYYTglLahirIbu = (request.getParameter("no_akta_lhr_yy")==null?"":request.getParameter("no_akta_lhr_yy"));
 alamat_ibu = (request.getParameter("alamat_ibu")==null?"":request.getParameter("alamat_ibu"));
 no_rt_ibu = (request.getParameter("no_rt_ibu")==null?"":request.getParameter("no_rt_ibu"));
 no_rw_ibu = (request.getParameter("no_rw_ibu")==null?"":request.getParameter("no_rw_ibu"));
 dusun_ibu = (request.getParameter("dusun_ibu")==null?"":request.getParameter("dusun_ibu"));
 kodepos_ibu = (request.getParameter("kodepos_ibu")==null?"":request.getParameter("kodepos_ibu"));
 telp_ibu = (request.getParameter("telp_ibu")==null?"":request.getParameter("telp_ibu"));
 nama_prop_ibu = (request.getParameter("nama_prop_ibu")==null?"":request.getParameter("nama_prop_ibu"));
 nama_kab_ibu = (request.getParameter("nama_kab_ibu")==null?"":request.getParameter("nama_kab_ibu"));
 nama_kec_ibu = (request.getParameter("nama_kec_ibu")==null?"":request.getParameter("nama_kec_ibu"));
 nkelibu = (request.getParameter("nkelibu")==null?"":request.getParameter("nkelibu"));
 ketrunan_ibu = (request.getParameter("ketrunan_ibu")==null?0:Integer.parseInt(request.getParameter("ketrunan_ibu")));
 bangsa_ibu = (request.getParameter("bangsa_ibu")==null?"":request.getParameter("bangsa_ibu"));
getDDTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_dd")==null?"":request.getParameter("tgl_ctt_kwn_ibu_dd"));
getMMTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_mm")==null?"":request.getParameter("tgl_ctt_kwn_ibu_mm"));
getYYTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_yy")==null?"":request.getParameter("tgl_ctt_kwn_ibu_yy"));
//System.out.println(552);
if (kecInput && statusReqIbu==ADAEXIST && step >=1) {
System.out.println("1002");
//wniwna
//System.out.println(611);
      if (wniWnaObj!=null) {
//System.out.println(616);
         if (wniWnaObj.getWniObj()!=null) {
//System.out.println(617);
            IbuData ibuObj = wniWnaObj.getWniObj().getRecord2();
         if (ibuObj!=null) {
//System.out.println(620);
               nama_ibu = (ibuObj.getNamaLgkp()==null?"":ibuObj.getNamaLgkp());
               getDDTglLahirIbu = getDD(ibuObj.getTglLhr());
               getMMTglLahirIbu = getMM(ibuObj.getTglLhr());
               getYYTglLahirIbu = getYY(ibuObj.getTglLhr());
               alamat_ibu = (ibuObj.getAlamat()==null?"":ibuObj.getAlamat());
               no_rt_ibu = (ibuObj.getNoRt()==null?"":ibuObj.getNoRt().toString());
               no_rw_ibu = (ibuObj.getNoRw()==null?"":ibuObj.getNoRw().toString());
               dusun_ibu = (ibuObj.getDusun()==null?"":ibuObj.getDusun());
               kodepos_ibu = (ibuObj.getKodePos()==null?"":ibuObj.getKodePos().toString());
               telp_ibu = (ibuObj.getTelp()==null?"":ibuObj.getTelp());
               nama_prop_ibu = (ibuObj.getNoProp()==null?"":ibuObj.getNoProp());
               nama_kab_ibu = (ibuObj.getNoKab()==null?"":ibuObj.getNoKab());
               nama_kec_ibu = (ibuObj.getNoKec()==null?"":ibuObj.getNoKec());
               nkelibu = ibuObj.getNoKel();
               //ketrunan_ibu = (ibuObj.getBaDusun()==null?"":ibuObj.getDusun());
               //bangsa_ibu = (request.getParameter("bangsa_ibu")==null?"":request.getParameter("bangsa_ibu"));
               getDDTglKawinIbu = getDD(ibuObj.getTglKwn());
               getMMTglKawinIbu = getMM(ibuObj.getTglKwn());
               getYYTglKawinIbu = getYY(ibuObj.getTglKwn());
               jenis_pkrjn_ibu = ((ibuObj.getJenisPkrjn()==null)?0:Integer.parseInt(ibuObj.getJenisPkrjn()));
            }
         } if (wniWnaObj.getWnaObj()!=null) {
//System.out.println(638);
            IbuDataWna ibuObj = wniWnaObj.getWnaObj().getRecord2();
            if (ibuObj!=null) {
               //System.out.println(644);
               nama_ibu = ibuObj.getNamaPertma();
               getDDTglLahirIbu = getDD(ibuObj.getTglLhr());
               getMMTglLahirIbu = getMM(ibuObj.getTglLhr());
               getYYTglLahirIbu = getYY(ibuObj.getTglLhr());
               alamat_ibu = (ibuObj.getAlamat()==null?"":ibuObj.getAlamat());
               no_rt_ibu = (ibuObj.getNoRt()==null?"":ibuObj.getNoRt().toString());
               no_rw_ibu = (ibuObj.getNoRw()==null?"":ibuObj.getNoRw().toString());


               dusun_ibu = (ibuObj.getDusun()==null?"":ibuObj.getDusun());
               kodepos_ibu = (ibuObj.getKodePos()==null?"":ibuObj.getKodePos().toString());
               telp_ibu = (ibuObj.getTelp()==null?"":ibuObj.getTelp());
               nama_prop_ibu = ibuObj.getNoProp();
               nama_kab_ibu = ibuObj.getNoKab();
               nama_kec_ibu = ibuObj.getNoKec();
               nkelibu = ibuObj.getNoKel();
               //ketrunan_ibu = (ibuObj.getBaDusun()==null?"":ibuObj.getDusun());
               //bangsa_ibu = (request.getParameter("bangsa_ibu")==null?"":request.getParameter("bangsa_ibu"));
               jenis_pkrjn_ibu = ((ibuObj.getJenisPkrjn()==null)?0:Integer.parseInt(ibuObj.getJenisPkrjn()));
            }
         }
      }

   } else if (!kecInput && step >=1 && statusReqIbu!=ADANOTEXIST && lahirData!=null && lahirData.getRecordBayi()!=null) {
        System.out.println("IBU ADANOTEXISTS");
      nama_ibu = (lahirData.getRecordBayi().getNamaIbu()==null?"":lahirData.getRecordBayi().getNamaIbu());
      getDDTglLahirIbu = getDD(lahirData.getRecordBayi().getTglLhrIbu());
      getMMTglLahirIbu = getMM(lahirData.getRecordBayi().getTglLhrIbu());
      getYYTglLahirIbu = getYY(lahirData.getRecordBayi().getTglLhrIbu());
      alamat_ibu = (lahirData.getRecordBayi().getAlamatIbu()==null?"":lahirData.getRecordBayi().getAlamatIbu());
      no_rt_ibu = (lahirData.getRecordBayi().getNoRtIbu()==null?"":lahirData.getRecordBayi().getNoRtIbu().toString());
      no_rw_ibu = (lahirData.getRecordBayi().getNoRwIbu()==null?"":lahirData.getRecordBayi().getNoRwIbu().toString());
      dusun_ibu = (lahirData.getRecordBayi().getDusunIbu()==null?"":lahirData.getRecordBayi().getDusunIbu());
      kodepos_ibu = (lahirData.getRecordBayi().getKodeposIbu()==null?"":lahirData.getRecordBayi().getKodeposIbu().toString());
      telp_ibu = (lahirData.getRecordBayi().getTelpIbu()==null?"":lahirData.getRecordBayi().getTelpIbu());
      nama_prop_ibu = (lahirData.getRecordBayi().getNoPropIbu()==null?"":lahirData.getRecordBayi().getNoPropIbu());
      nama_kab_ibu = (lahirData.getRecordBayi().getNoKabIbu()==null?"":lahirData.getRecordBayi().getNoKabIbu());
      nama_kec_ibu = (lahirData.getRecordBayi().getNoKecIbu()==null?"":lahirData.getRecordBayi().getNoKecIbu());
      nkelibu = (lahirData.getRecordBayi().getNoKelIbu()==null?"":lahirData.getRecordBayi().getNoKelIbu());
      ketrunan_ibu = (lahirData.getRecordBayi().getKetrunanIbu()==null?0:lahirData.getRecordBayi().getKetrunanIbu().intValue());
      bangsa_ibu = (lahirData.getRecordBayi().getBangsaIbu()==null?"":lahirData.getRecordBayi().getBangsaIbu());
   getDDTglKawinIbu = getDD(lahirData.getRecordBayi().getTglCttKwnIbu());
   getMMTglKawinIbu = getMM(lahirData.getRecordBayi().getTglCttKwnIbu());
   getYYTglKawinIbu = getYY(lahirData.getRecordBayi().getTglCttKwnIbu());
if (radiobutton==0) {
   if (wn_ibu==1) {
      nik_ibu = lahirData.getRecordBayi().getNikIbu();

   } else if (wn_ibu==2) {
      nik_ibu = "A" + lahirData.getRecordBayi().getNikIbu();
   }
}
   jenis_pkrjn_ibu = ((lahirData.getRecordBayi().getJenisPkrjnIbu()==null)?0:lahirData.getRecordBayi().getJenisPkrjnIbu().intValue());

}
//System.out.println("jenis_pkrjn_ibu="+jenis_pkrjn_ibu);
 jenis_pkrjn_ibu = (request.getParameter("jenis_pkrjn_ibu")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_ibu"))==0?jenis_pkrjn_ibu:Integer.parseInt(request.getParameter("jenis_pkrjn_ibu")));
//System.out.println(592);
%>
               <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
                  <h2 class="tab">Data Ibu</h2>

                  <script type="text/javascript">
                     tp1.addTabPage(document.getElementById("tabPage2"));
                  </script>
                  <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                     <tr>
                        <td>
                           <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0">
                              <tr>
                                 <td colspan="7"> </td>
                              </tr>
                              <tr>
                                 <td colspan="7">&nbsp; </td>
                              </tr>
                              <tr>
                                 <td width="21%">NIK Ibu<font color="#000099" class="asterish">*</font></td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <input type="radio" name="radiobutton" value="Ada" onClick="return radioValid3()" <%if (radiobutton==0) {%> checked <%}%> onChange="resetFieldIbu()">
                                       Ada<br>
                                    <input type="radio" name="radiobutton" value="Tidak Ada" onClick="return radioValid4()" <%if (radiobutton==1) {%> checked <%}%> onChange="resetFieldIbu()">
                                       Tidak Ada
                                 </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="24%">Warga Negara Ibu<font color="#000099" class="asterish">*</font></td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <input type="radio" name="radiobutton1" value="1" onClick="return radioValid1()" onChange="resetFieldIbu()"
								   <%if (wn_ibu==1) {%> checked <%}
		 						   %>>
                                       WNI<br>
                                    <input type="radio" name="radiobutton1" value="2" onClick="return radioValid2()" onChange="resetFieldIbu()"
								   <%if (wn_ibu==2) {%> checked <%}
								   %>>
                                       WNA
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">
                                    <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <p style="line-height: 100%">
                                    <input type="text" name="nik_ibu" size="18" class="boxdefault" maxlength="17"  value="<%=nik_ibu%>" onKeyUp="return num1(form1.nik_ibu);" onBlur="validateWNIbu(form1.nik_ibu,form1.radiobutton1);setSaveEnabled(false)">
                                    </p>
                                 </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="24%">
                                    <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <p style="line-height: 100%">
                                       <input type="text" name="nama_ibu" size="27" value="<%=nama_ibu%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                                    </p>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">
                                    <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <table width="100" border="0" cellspacing="3" cellpadding="0">
                                       <tr>
                                          <td>
                                             <input class=boxdefault size=2 name=no_akta_lhr_dd maxlength="2" value="<%=getDDTglLahirIbu%>" onKeyUp="return checkTanggal(form1.no_akta_lhr_dd, form1.no_akta_lhr_mm)" /*onFocus="this.blur()"*/>
                                          </td>
                                          <td>/ </td>
                                          <td>
                                             <input class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2" value="<%=getMMTglLahirIbu%>" onKeyUp="return checkBulan(form1.no_akta_lhr_mm, form1.no_akta_lhr_yy)" /*onFocus="this.blur()"*/>
                                          </td>
                                          <td>/</td>
                                          <td>
                                             <input class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4" value="<%=getYYTglLahirIbu%>" onKeyUp="return checkTahun(form1.no_akta_lhr_dd, form1.no_akta_lhr_mm, form1.no_akta_lhr_yy)" /*onFocus="this.blur()"*/>
                                          </td>
                                       </tr>
                                    </table>
                                 </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="24%">
                                    <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <p style="line-height: 100%">
                                       <select name=jenis_pkrjn_ibu boxdefault2 class="boxdefault">
                                          <option value="0" selected>-- Pilih Jenis Pekerjaan --</option>
                                       </select>
                                    </p>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                                 <td width="1%">:</td>
                                 <td colspan="3">
                                    <input type="text" name="alamat_ibu" size="30" class="boxdefault" value="<%=alamat_ibu%>" maxlength="120" /*onFocus="this.blur()"*/>
                                       RT<font color="#000099" class="asterish"> </font>
                                    <input type="text" name="no_rt_ibu" value="<%=no_rt_ibu%>" size="3" class="boxdefault" maxlength="3"  onKeyUp="return num(form1.no_rt_ibu)" /*onFocus="this.blur()"*/>
                                       RW
                                    <input type="text" name="no_rw_ibu" size="3" class="boxdefault" value="<%=no_rw_ibu%>" maxlength="3" onKeyUp="return num(form1.no_rw_ibu)" /*onFocus="this.blur()"*/>
                                       Ds/Kpng/Dukuh </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="26%">
                                    <input type="text" name="dusun_ibu" size="22" class="boxdefault" value="<%=dusun_ibu%>" maxlength="60" /*onFocus="this.blur()"*/>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">
                                    <div align="left">Kode Pos</div>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <input type="text" name="kodepos_ibu" size="7" value="<%=kodepos_ibu%>" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kodepos_ibu)" /*onFocus="this.blur()"*/>
                                 </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="24%">
                                    <div align="left">Telepon</div>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <input type="text" name="telp_ibu" value="<%=telp_ibu%>" size="20" class="boxdefault" maxlength="20" /*onFocus="this.blur()"*/>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">
                                    <div align="left">Nama Provinsi<font color="#000099" class="asterish">*</font></div>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <input class="boxdefault" size=30 name="nama_prop_ibu" maxlength="60" onKeyUp="" value="<%=nama_prop_ibu%>">
                                    <input type="hidden" name="no_prop_ibu" value="<%=no_prop_ibu%>">
                                 </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="24%">
                                    <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <input class="boxdefault" size=30 name="nama_kab_ibu" maxlength="60" onKeyUp="" value="<%=nama_kab_ibu%>">
                                    <input type="hidden" name="no_kab_ibu" value="<%=no_kab_ibu%>">
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%" height="40">
                                    <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                 </td>
                                 <td width="1%" height="40">:</td>
                                 <td width="26%" height="40">
                                    <input class="boxdefault" size=30 name="nama_kec_ibu" maxlength="60" onKeyUp="" value="<%=nama_kec_ibu%>">
                                    <input type="hidden" name="no_kec_ibu" value="<%=no_kec_ibu%>">
                                 </td>
                                 <td width="1%" height="40">&nbsp;</td>
                                 <td width="24%" height="40">
                                    <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                 </td>
                                 <td width="1%" height="40">:</td>
                                 <td width="26%" height="40">
                                    <input class="boxdefault" size=30 name="nkelibu" maxlength="60" onKeyUp="" value="<%=nkelibu%>">
                                    <input type="hidden" name="no_kel_ibu" value="<%=no_kel_ibu%>">
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">Keturunan</td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <select size="1" name="ketrunan_ibu" class="boxdefault" <%if (wn_ibu==2) {%>onchange="if (this.selectedIndex!=0){bangsa_ibu.disabled=false;}else {bangsa_ibu.disabled=true;}" <%}%> >
                                       <option value="0" selected>-- Pilih Keturunan --</option>
                                       <option value="1">1 - Eropa</option>
                                       <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                       <option value="3">3 - Pribumi Nasrani</option>
                                       <option value="4">4 - Pribumi Non Nasrani</option>
                                       <option value="5">5 - Lainnya</option>
                                    </select>
                                 </td>
                                 <td width="1%">&nbsp;</td>
                                 <td width="24%">
                                    <p style="line-height: 100%">Kebangsaan (Bagi WNA)</p>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <p style="line-height: 100%">
                                       <input type="text" name="bangsa_ibu" size="22" class="boxdefault" maxlength="40" <%if (wn_ibu==1) { %> disabled <%} else { %> value="<%=bangsa_ibu%>" <%}%> >
                                    </p>
                                 </td>
                              </tr>
                              <tr>
                                 <td width="21%">
                                    <p style="line-height: 100%">Tanggal Pencatatan Perkawinan</p>
                                 </td>
                                 <td width="1%">:</td>
                                 <td width="26%">
                                    <table width="100" border="0" cellspacing="3" cellpadding="0">
                                       <tr>
                                          <td>
                                             <input class=boxdefault size=2 name=tgl_ctt_kwn_ibu_dd value="<%=getDDTglKawinIbu%>" maxlength="2"  onKeyUp="return checkTanggal(form1.tgl_ctt_kwn_ibu_dd, form1.tgl_ctt_kwn_ibu_mm)" /*onFocus="this.blur()"*/ onblur="setDD(document.all['tgl_ctt_kwn_ibu_dd'].value)">
                                          </td>
                                          <td>/ </td>
                                          <td>
                                             <input class=boxdefault size=2 name=tgl_ctt_kwn_ibu_mm value="<%=getMMTglKawinIbu%>" maxlength="2"  onKeyUp="return checkBulan(form1.tgl_ctt_kwn_ibu_mm, form1.tgl_ctt_kwn_ibu_yy)" /*onFocus="this.blur()"*/ onblur="setMM(document.all['tgl_ctt_kwn_ibu_mm'].value)">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_ctt_kwn_ibu_yy value="<%=getYYTglKawinIbu%>" maxlength="4"  onKeyUp="return checkTahun(form1.tgl_ctt_kwn_ibu_dd, form1.tgl_ctt_kwn_ibu_mm, form1.tgl_ctt_kwn_ibu_yy)" /*onFocus="this.blur()"*/ onblur="setYY(document.all['tgl_ctt_kwn_ibu_yy'].value)">

                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">&nbsp;
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <%
//System.out.println(858);

//radiobutton4 = wn_ayah-1;

if(statusReqAyah==ADANOTEXIST)
{
  //System.out.println(837);
  if (statusReqAyah==0) {
    edit="disabled";
    //System.out.println("radiobutton edit="+edit);
  }
}

//System.out.println(839);
//System.out.println("radiobutton3"+radiobutton3);
//System.out.println("radiobutton4"+radiobutton4);
 nama_ayh = (request.getParameter("nama_ayh")==null?"":request.getParameter("nama_ayh"));
 getDDTglLahirAyah = (request.getParameter("no_akta_lhr_dd1")==null?"":request.getParameter("no_akta_lhr_dd1"));
 getMMTglLahirAyah = (request.getParameter("no_akta_lhr_mm1")==null?"":request.getParameter("no_akta_lhr_mm1"));
 getYYTglLahirAyah = (request.getParameter("no_akta_lhr_yy1")==null?"":request.getParameter("no_akta_lhr_yy1"));
 jenis_pkrjn_ayh = (request.getParameter("jenis_pkrjn_ayh")==null?0:Integer.parseInt(request.getParameter("jenis_pkrjn_ayh")));
//System.out.println("jenis_pkrjn_ayh"+jenis_pkrjn_ayh);
 alamat_ayh = (request.getParameter("alamat_ayh")==null?"":request.getParameter("alamat_ayh"));
 no_rt_ayh = (request.getParameter("no_rt_ayh")==null?"":request.getParameter("no_rt_ayh"));
 no_rw_ayh = (request.getParameter("no_rw_ayh")==null?"":request.getParameter("no_rw_ayh"));
 dusun_ayh = (request.getParameter("dusun_ayh")==null?"":request.getParameter("dusun_ayh"));
 kodepos_ayh = (request.getParameter("kodepos_ayh")==null?"":request.getParameter("kodepos_ayh"));
 telp_ayh = (request.getParameter("telp_ayh")==null?"":request.getParameter("telp_ayh"));
 nama_prop_ayh = (request.getParameter("nama_prop_ayh")==null?"":request.getParameter("nama_prop_ayh"));
 nama_kab_ayh = (request.getParameter("nama_kab_ayh")==null?"":request.getParameter("nama_kab_ayh"));
 nama_kec_ayh = (request.getParameter("nama_kec_ayh")==null?"":request.getParameter("nama_kec_ayh"));
 nkelayh = (request.getParameter("nkelayh")==null?"":request.getParameter("nkelayh"));
 ketrunan_ayh = (request.getParameter("ketrunan_ayh")==null?0:Integer.parseInt(request.getParameter("ketrunan_ayh")));
 bangsa_ayh = (request.getParameter("bangsa_ayh")==null?"":request.getParameter("bangsa_ayh"));
 getDDTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_dd")==null?"":request.getParameter("tgl_ctt_kwn_ayh_dd"));
 getMMTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_mm")==null?"":request.getParameter("tgl_ctt_kwn_ayh_mm"));
 getYYTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_yy")==null?"":request.getParameter("tgl_ctt_kwn_ayh_yy"));
//System.out.println(877);
//System.out.println("statusReqAyah="+statusReqAyah);
   if (kecInput && statusReqAyah==ADAEXIST && step >=1) {
//System.out.println(997);

//System.out.println(1000);
      if (wniWnaObj!=null) {
//System.out.println(1002);
         if (wniWnaObj.getWniObj()!=null) {
//System.out.println(1004);
            AyahData ayahObj = wniWnaObj.getWniObj().getRecord3();
            if (ayahObj!=null) {
               //System.out.println(1012);
               nama_ayh = ayahObj.getNamaLgkp();
               getDDTglLahirAyah = getDD(ayahObj.getTglLhr());
               getMMTglLahirAyah = getMM(ayahObj.getTglLhr());
               getYYTglLahirAyah = getYY(ayahObj.getTglLhr());
               alamat_ayh = ayahObj.getAlamat();
               no_rt_ayh = (ayahObj.getNoRt()==null?"":ayahObj.getNoRt());
               no_rw_ayh = (ayahObj.getNoRw()==null?"":ayahObj.getNoRw());
               dusun_ayh = (ayahObj.getDusun()==null?"":ayahObj.getDusun());
               kodepos_ayh = (ayahObj.getKodePos()==null?"":ayahObj.getKodePos().toString());
               telp_ayh = (ayahObj.getTelp()==null?"":ayahObj.getTelp());
               nama_prop_ayh = ayahObj.getNoProp();
               nama_kab_ayh = ayahObj.getNoKab();
               nama_kec_ayh = ayahObj.getNoKec();
               nkelayh = ayahObj.getNoKel();
     // ketrunan_ayh = (lahirData.getRecordBayi().getKetrunanAyh()==null?"":lahirData.getRecordBayi().getKetrunanAyh());
     // bangsa_ayh = (lahirData.getRecordBayi().getBangsaAyh()==null?"":lahirData.getRecordBayi().getBangsaAyh());
               getDDTglKawinAyah = getDD(ayahObj.getTglKwn());
               getMMTglKawinAyah = getMM(ayahObj.getTglKwn());
               getYYTglKawinAyah = getYY(ayahObj.getTglKwn());
               jenis_pkrjn_ayh = ((ayahObj.getJenisPkrjn()==null)?0:Integer.parseInt(ayahObj.getJenisPkrjn()));
            }
         }  if (wniWnaObj.getWnaObj()!=null) {
            //System.out.println(1025);
            AyahDataWna ayahObj = wniWnaObj.getWnaObj().getRecord3();
            if (ayahObj!=null) {
               //System.out.println(1035);
               nama_ayh = ayahObj.getNamaPertma();
               //System.out.println("ayahObj.getTglLhr()="+ayahObj.getTglLhr());
               getDDTglLahirAyah = getDD(ayahObj.getTglLhr());
               getMMTglLahirAyah = getMM(ayahObj.getTglLhr());
               getYYTglLahirAyah = getYY(ayahObj.getTglLhr());
               alamat_ayh = ayahObj.getAlamat();
               no_rt_ayh = (ayahObj.getNoRt()==null?"":ayahObj.getNoRt().toString());
               no_rw_ayh = (ayahObj.getNoRw()==null?"":ayahObj.getNoRw().toString());
               dusun_ayh = (ayahObj.getDusun()==null?"":ayahObj.getDusun());
               kodepos_ayh = (ayahObj.getKodePos()==null?"":ayahObj.getKodePos().toString());
               telp_ayh = (ayahObj.getTelp()==null?"":ayahObj.getTelp());
               nama_prop_ayh = (ayahObj.getNoProp()==null?"":ayahObj.getNoProp().toString());
               nama_kab_ayh = (ayahObj.getNoKab()==null?"":ayahObj.getNoKab().toString());
               nama_kec_ayh = (ayahObj.getNoKec()==null?"":ayahObj.getNoKec().toString());
               nkelayh = (ayahObj.getNoKel()==null?"":ayahObj.getNoKel().toString());
     // ketrunan_ayh = (lahirData.getRecordBayi().getKetrunanAyh()==null?"":lahirData.getRecordBayi().getKetrunanAyh());
     // bangsa_ayh = (lahirData.getRecordBayi().getBangsaAyh()==null?"":lahirData.getRecordBayi().getBangsaAyh());
               jenis_pkrjn_ayh = ((ayahObj.getJenisPkrjn()==null)?0:ayahObj.getJenisPkrjn().intValue());
            }
         }
      }
   } else if (!kecInput && step >=1 && statusReqAyah!=ADANOTEXIST && lahirData!=null && lahirData.getRecordBayi()!=null) {
//System.out.println(1046);
      nama_ayh = (lahirData.getRecordBayi().getNamaAyh()==null?"":lahirData.getRecordBayi().getNamaAyh());
      getDDTglLahirAyah = getDD(lahirData.getRecordBayi().getTglLhirAyh());
      getMMTglLahirAyah = getMM(lahirData.getRecordBayi().getTglLhirAyh());
      getYYTglLahirAyah = getYY(lahirData.getRecordBayi().getTglLhirAyh());
      alamat_ayh = (lahirData.getRecordBayi().getAlamatAyh()==null?"":lahirData.getRecordBayi().getAlamatAyh());
      no_rt_ayh = (lahirData.getRecordBayi().getNoRtAyh()==null?"":lahirData.getRecordBayi().getNoRtAyh().toString());
      no_rw_ayh = (lahirData.getRecordBayi().getNoRwAyh()==null?"":lahirData.getRecordBayi().getNoRwAyh().toString());
      dusun_ayh = (lahirData.getRecordBayi().getDusunAyh()==null?"":lahirData.getRecordBayi().getDusunAyh());
      kodepos_ayh = (lahirData.getRecordBayi().getKodeposAyh()==null?"":lahirData.getRecordBayi().getKodeposAyh().toString());
      telp_ayh = (lahirData.getRecordBayi().getTelpAyh()==null?"":lahirData.getRecordBayi().getTelpAyh());
      nama_prop_ayh = (lahirData.getRecordBayi().getNoPropAyh()==null?"":lahirData.getRecordBayi().getNoPropAyh());
      nama_kab_ayh = (lahirData.getRecordBayi().getNoKabAyh()==null?"":lahirData.getRecordBayi().getNoKabAyh());
      nama_kec_ayh = (lahirData.getRecordBayi().getNoKecAyh()==null?"":lahirData.getRecordBayi().getNoKecAyh());
      nkelayh = (lahirData.getRecordBayi().getNoKelAyh()==null?"":lahirData.getRecordBayi().getNoKelAyh());
      ketrunan_ayh = (lahirData.getRecordBayi().getKetrunanAyh()==null?0:lahirData.getRecordBayi().getKetrunanAyh().intValue());
      bangsa_ayh = (lahirData.getRecordBayi().getBangsaAyh()==null?"":lahirData.getRecordBayi().getBangsaAyh());
   getDDTglKawinAyah = getDD(lahirData.getRecordBayi().getTglCttKwnAyh());
   getMMTglKawinAyah = getMM(lahirData.getRecordBayi().getTglCttKwnAyh());
   getYYTglKawinAyah = getYY(lahirData.getRecordBayi().getTglCttKwnAyh());

      if (radiobutton3==0) {
   if (wn_ayah==1) {
      nik_ayah = lahirData.getRecordBayi().getNikAyh();

   } else if (wn_ayah==2) {
      nik_ayah = "A" + lahirData.getRecordBayi().getNikAyh();

   }
      }
  jenis_pkrjn_ayh = ((lahirData.getRecordBayi().getJenisPkrjnAyh()==null)?0:lahirData.getRecordBayi().getJenisPkrjnAyh().intValue());

}
//System.out.println("jenis_pkrjn_ayh="+jenis_pkrjn_ayh);
jenis_pkrjn_ayh = (request.getParameter("jenis_pkrjn_ayh")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_ayh"))==0?jenis_pkrjn_ayh:Integer.parseInt(request.getParameter("jenis_pkrjn_ayh")));
//System.out.println(918);
%>
  <div class="tab-page"  id="tabPage3">
                    <h2 class="tab">Data Ayah</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage3"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="21%" height="43">NIK Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton3" value="Ada"  onClick="return radioValid5()" <%if (radiobutton3==0) {%> checked <%}%> onChange="resetFieldAyah()">
                                Ada<br>
                                <input type="radio" name="radiobutton3" value="Tidak Ada"  onClick="return radioValid6()" <%if (radiobutton3==1) {%> checked <%}%> onChange="resetFieldAyah()">
                                Tidak Ada</td>
                                <td width="1%" height="43">&nbsp;</td>
                                <td width="24%" height="43">Warga Negara Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton4" value="1" onClick="return radioValid7()" onChange="resetFieldAyah()"
								   <%if (wn_ayah==1) {%> checked <%}
								   %>>
                                WNI<br>
                                <input type="radio" name="radiobutton4" value="2" onClick="return radioValid8()" onChange="resetFieldAyah()"
								   <%if (wn_ayah==2) {%> checked <%}
								   %>>

                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">

                <input type="text" name="nik_ayh" size="18" value="<%=nik_ayah%>" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh)" onBlur="validateWNAyah(form1.nik_ayh, form1.radiobutton4); setSaveEnabled(false)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>

                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh" size="27" value="<%=nama_ayh%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">

                                  <table width="100" border="0" cellspacing="3" cellpadding="0">
                                    <tr>

                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd1 maxlength="2" value="<%=getDDTglLahirAyah%>" onKeyUp="return checkTanggal(form1.no_akta_lhr_dd1, form1.no_akta_lhr_mm1)">
                                      </td>
                                      <td>/ </td>

                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm1 maxlength="2" value="<%=getMMTglLahirAyah%>" onKeyUp="return checkBulan(form1.no_akta_lhr_mm1, form1.no_akta_lhr_yy1)">
                                      </td>
                                      <td>/</td>

                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy1 maxlength="4" value="<%=getYYTglLahirAyah%>" onKeyUp="return checkTahun(form1.no_akta_lhr_dd1, form1.no_akta_lhr_mm1, form1.no_akta_lhr_yy1)">
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                        name=jenis_pkrjn_ayh boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis Pekerjaan
                                      --</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <div align="left">
                                  <input type="text" name="alamat_ayh" size="30" value="<%=alamat_ayh%>" class="boxdefault"  maxlength="120" /*onFocus="this.blur()"*/>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="no_rt_ayh" size="3" value="<%=no_rt_ayh%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ayh)" /*onFocus="this.blur()"*/>
                                  RW
                                  <input type="text" name="no_rw_ayh" size="3" value="<%=no_rw_ayh%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ayh)" /*onFocus="this.blur()"*/>
                                  Ds/Kpng/Dukuh</div>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ayh" size="22"  value="<%=dusun_ayh%>" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Kode Pos</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ayh"  value="<%=kodepos_ayh%>" size="7" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kodepos_ayh)" /*onFocus="this.blur()"*/>
                              </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Telepon</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ayh"  value="<%=telp_ayh%>" size="20" class="boxdefault" maxlength="20" /*onFocus="this.blur()"*/>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Provinsi<font color="#000099" class="asterish"></font><font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_prop_ayh" maxlength="60" onKeyUp="" value="<%=nama_prop_ayh%>">

<input type="hidden" name="no_prop_ayh" value="<%=no_prop_ayh%>">

                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_kab_ayh" maxlength="60" onKeyUp="" value="<%=nama_kab_ayh%>">

<input type="hidden" name="no_kab_ayh" value="<%=no_kab_ayh%>">
                                </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nama_kec_ayh" maxlength="60" onKeyUp="" value="<%=nama_kec_ayh%>">
                                <input type="hidden" name="no_kec_ayh" value="<%=no_kec_ayh%>">
                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <input class="boxdefault" size=30 name="nkelayh" maxlength="60" onKeyUp="" value="<%=nkelayh%>">
                                <input type="hidden" name="no_kel_ayh" value="<%=no_kel_ayh%>">
                                </td>
                            </tr>
                            <tr>
                              <td width="21%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ketrunan_ayh" class="boxdefault" <%if (wn_ayah==2) {%>onchange="if (this.selectedIndex!=0){bangsa_ayh.disabled=false;}else {bangsa_ayh.disabled=true;}" <%}%> >
                                   <option value="0" selected>-- Pilih Keturunan --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="bangsa_ayh" size="22" class="boxdefault" maxlength="40" <%if (wn_ayah==1) { %> disabled <%} else { %> value="<%=bangsa_ayh%>" <%}%> >
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Pencatatan
                                  Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ayh_dd value="<%=getDDTglKawinAyah%>" maxlength="2" onKeyUp="return checkTanggal(form1.tgl_ctt_kwn_ayh_dd, form1.tgl_ctt_kwn_ayh_mm)" /*onFocus="this.blur()"*/ onblur="setDDIbu(document.all['tgl_ctt_kwn_ayh_dd'].value)">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ayh_mm value="<%=getMMTglKawinAyah%>" maxlength="2" onKeyUp="return checkBulan(form1.tgl_ctt_kwn_ayh_mm, form1.tgl_ctt_kwn_ayh_yy)" /*onFocus="this.blur()"*/ onblur="setMMIbu(document.all['tgl_ctt_kwn_ayh_mm'].value)">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_ctt_kwn_ayh_yy value="<%=getYYTglKawinAyah%>" maxlength="4" onKeyUp="return checkTahun(form1.tgl_ctt_kwn_ayh_dd, form1.tgl_ctt_kwn_ayh_mm, form1.tgl_ctt_kwn_ayh_yy)" /*onFocus="this.blur()"*/ onblur="setYYIbu(document.all['tgl_ctt_kwn_ayh_yy'].value)">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
<%
//System.out.println(1529);

//System.out.println(1538);

//if(!kecInput && (lahirData == null || lahirData.getRecordPelapor() == null))
if ("".equals(nik_pelapor) &&
    ((kecInput &&
      (wniWnaObj!=null ||
       wniWnaObj.getWniObj()!=null ||
       wniWnaObj.getWnaObj()!=null ||
       (wniWnaObj.getWniObj().getRecord4()==null &&
        wniWnaObj.getWnaObj().getRecord4()==null))) ||
     (!kecInput && lahirData!=null && lahirData.getRecordPelapor()==null))) {
edit="disabled";
//System.out.println("pelapor edit="+edit);
}
/*
 else if (kecInput && wniWnaObj!=null && wniWnaObj.getWniObj().getRecord4() == null && wniWnaObj.getWnaObj().getRecord4() == null)
{
edit="disabled";
//System.out.println("pelapor edit="+edit);
}
*/
//System.out.println(1178);

//System.out.println("nik_pelapor="+nik_pelapor);
 nama_pelapor = "-";
 tgl_lahir_pelapor = "-";
 jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null?0:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));
 alamat_pelapor = "-";
 rt_pelapor = "-";
 rw_pelapor = "-";
 dusun_pelapor = "-";
 kodepos_pelapor = "-";
 telp_pelapor = "-";
 no_akta_lhr_dd2 = (request.getParameter("no_akta_lhr_dd2")==null?"":request.getParameter("no_akta_lhr_dd2"));
 no_akta_lhr_mm2 = (request.getParameter("no_akta_lhr_mm2")==null?"":request.getParameter("no_akta_lhr_mm2"));
 no_akta_lhr_yy2 = (request.getParameter("no_akta_lhr_yy2")==null?"":request.getParameter("no_akta_lhr_yy2"));
//System.out.println(1191);
  //System.out.println(1240);
   if (kecInput && step >=1) {
//System.out.println(1355);

//System.out.println(1358);
      if (wniWnaObj!=null) {
//System.out.println(1360);
         if (wniWnaObj.getWniObj()!=null) {
//System.out.println(1362);
            PelaporData pelaporObj = wniWnaObj.getWniObj().getRecord4();
            if (pelaporObj!=null) {
               //System.out.println(1376);
               nama_pelapor = (pelaporObj.getNamaLgkp()==null?"-":pelaporObj.getNamaLgkp());
               tgl_lahir_pelapor = (pelaporObj.getTglLhr()==null?"-":pelaporObj.getTglLhr());
               alamat_pelapor = ((pelaporObj.getAlamat()==null)?"-":pelaporObj.getAlamat());
               rt_pelapor = ((pelaporObj.getNoRt()==null)?"-":pelaporObj.getNoRt().toString());
               rw_pelapor = ((pelaporObj.getNoRw()==null)?"-":pelaporObj.getNoRw().toString());
               dusun_pelapor = ((pelaporObj.getDusun()==null)?"-":pelaporObj.getDusun());
               kodepos_pelapor = ((pelaporObj.getKodePos()==null)?"-":pelaporObj.getKodePos().toString());
               telp_pelapor = ((pelaporObj.getTelp()==null)?"-":pelaporObj.getTelp());
               jenis_pkrjn_plpor = ((pelaporObj.getJenisPkrjn()==null)?0:Integer.parseInt(pelaporObj.getJenisPkrjn()));
            }
         }  if (wniWnaObj.getWnaObj()!=null) {
//System.out.println(1374);
            PelaporDataWna pelaporObj = wniWnaObj.getWnaObj().getRecord4();
            if (pelaporObj!=null) {
               //System.out.println(1376);
               nama_pelapor = pelaporObj.getNamaPertma();
               tgl_lahir_pelapor = pelaporObj.getTglLhr();
               alamat_pelapor = ((pelaporObj.getAlamat()==null)?"-":pelaporObj.getAlamat());
               rt_pelapor = ((pelaporObj.getNoRt()==null)?"-":pelaporObj.getNoRt().toString());
               rw_pelapor = ((pelaporObj.getNoRw()==null)?"-":pelaporObj.getNoRw().toString());
               dusun_pelapor = ((pelaporObj.getDusun()==null)?"-":pelaporObj.getDusun());
               kodepos_pelapor = ((pelaporObj.getKodePos()==null)?"-":pelaporObj.getKodePos().toString());
               telp_pelapor = ((pelaporObj.getTelp()==null)?"-":pelaporObj.getTelp());
               jenis_pkrjn_plpor = ((pelaporObj.getJenisPkrjn()==null)?0:Integer.parseInt(pelaporObj.getJenisPkrjn()));
            }
         }
      }

   } else if (!kecInput && step >=1 && lahirData!=null && lahirData.getRecordBayi()!=null && lahirData.getRecordPelapor()!=null) {
//System.out.println(1612);
 nik_pelapor = (lahirData.getRecordBayi().getNikPlpor()==null?"":lahirData.getRecordBayi().getNikPlpor());
   nama_pelapor = (lahirData.getRecordPelapor().getNamaLgkp()==null?"-":lahirData.getRecordPelapor().getNamaLgkp());
   tgl_lahir_pelapor = (lahirData.getRecordPelapor().getTglLhr()==null?"-":lahirData.getRecordPelapor().getTglLhr());
 alamat_pelapor = ((lahirData.getRecordPelapor().getAlamat()==null)?"-":lahirData.getRecordPelapor().getAlamat());
 rt_pelapor = ((lahirData.getRecordPelapor().getNoRt()==null)?"-":lahirData.getRecordPelapor().getNoRt().toString());
 rw_pelapor = ((lahirData.getRecordPelapor().getNoRw()==null)?"-":lahirData.getRecordPelapor().getNoRw().toString());
 dusun_pelapor = ((lahirData.getRecordPelapor().getDusun()==null)?"-":lahirData.getRecordPelapor().getDusun());
 kodepos_pelapor = ((lahirData.getRecordPelapor().getKodePos()==null)?"-":lahirData.getRecordPelapor().getKodePos().toString());
 telp_pelapor = ((lahirData.getRecordPelapor().getTelp()==null)?"-":lahirData.getRecordPelapor().getTelp());

jenis_pkrjn_plpor = ((lahirData.getRecordPelapor().getJenisPkrjn()==null)?0:lahirData.getRecordPelapor().getJenisPkrjn().intValue());
 no_akta_lhr_dd2 = getDD(lahirData.getRecordBayi().getTglMlpor());
 no_akta_lhr_mm2 = getMM(lahirData.getRecordBayi().getTglMlpor());
 no_akta_lhr_yy2 = getYY(lahirData.getRecordBayi().getTglMlpor());

   }

/*
if (wn_pelapor==1 && lahirData.getRecordPelapor()!=null) {
} else if (wn_pelapor==2 && lahirData.getRecordPelapor()!=null) {
   }
*/
jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_plpor"))==0?jenis_pkrjn_plpor:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));
//System.out.println(1211);
%>

<div class="tab-page"   id="tabPage4">
                    <h2 class="tab">Data Pelapor</h2>


                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">NIK Pelapor<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_plpor" size="18" value='<%=nik_pelapor%>' class="boxdefault" maxlength="17"   onKeyUp="return num1(form1.nik_plpor)" onBlur="setupPekerjaan(form1.jenis_pkrjn_plpor, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
   <%=nama_pelapor%>
								</p>
                              </td>
                            </tr>
                            <tr>

            <td width="21%" height="40">
              <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>

            <td width="1%" height="40">:</td>

            <td width="26%" height="40">
              <p style="line-height: 100%">
                 <%=tgl_lahir_pelapor%>
			  </p>
                              </td>

            <td width="1%" height="40">&nbsp;</td>

            <td width="24%" height="40">
              <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                                </td>

            <td width="1%" height="40">:</td>

            <td width="26%" height="40">
              <p style="line-height: 100%">
                <select
                    name="jenis_pkrjn_plpor" class="boxdefault">
                  <option value="0" selected>-- Pilih Jenis Pekerjaan --</option>
                </select>
              </p>
              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5">
   <%=alamat_pelapor%><br>
   RT <%=rt_pelapor%>
   RW <%=rw_pelapor%>
   Dusun <%=dusun_pelapor%>
   Kodepos <%=kodepos_pelapor%>
   Telp <%=telp_pelapor%>
							  </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Melapor<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd2 maxlength="2" value='<%=no_akta_lhr_dd2%>'  onKeyUp="return checkTanggal(form1.no_akta_lhr_dd2, form1.no_akta_lhr_mm2)">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm2 maxlength="2" value='<%=no_akta_lhr_mm2%>' onKeyUp="return checkBulan(form1.no_akta_lhr_mm2, form1.no_akta_lhr_yy2)">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy2 maxlength="4" value='<%=no_akta_lhr_yy2%>' onKeyUp="return checkTahun(form1.no_akta_lhr_dd2, form1.no_akta_lhr_mm2, form1.no_akta_lhr_yy2)">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%

//System.out.println(1762);
wn_saksi_1 = ("".equals(nik_sksi1)?0:(nik_sksi1.substring(0,1).equals("A")?2:1));
//System.out.println(1763);
if(lahirData==null || lahirData.getRecordSaksi()==null || lahirData.getRecordSaksi().getSaksi1Record() == null)
{
edit="disabled";
//System.out.println("saksi 1 edit="+edit);
}
//System.out.println(1396);
String nama_saksi_1 = "-";
String tempat_lahir_saksi_1 = "-";
String tgl_lahir_saksi_1 = "-";
String alamat_saksi_1 = "-";
String rt_saksi_1 = "-";
String rw_saksi_1 = "-";
String dusun_saksi_1 = "-";
String kodepos_saksi_1 = "-";
String telp_saksi_1 = "-";
String agama_saksi_1 = "-";
int jenis_pekerjaan_saksi1 = (request.getParameter("jenis_pekerjaan_saksi1")==null?0:Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi1")));
//System.out.println(1409);
if (step>0 && lahirData!=null && lahirData.getRecordSaksi()!=null && lahirData.getRecordSaksi().getSaksi1Record()!=null) {

  //System.out.println(1412);
   nama_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getNamaLgkp();
   tempat_lahir_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getTmptLhr();
   tgl_lahir_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getTglLhr();
 alamat_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getAlamat()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getAlamat());
 rt_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getNoRt()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getNoRt().toString());
 rw_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getNoRw()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getNoRw().toString());
 dusun_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getDusun()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getDusun());
 kodepos_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getKodePos()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getKodePos().toString());
 telp_saksi_1 = ((lahirData.getRecordSaksi().getSaksi1Record().getTelp()==null)?"-":lahirData.getRecordSaksi().getSaksi1Record().getTelp());
agama_saksi_1 = lahirData.getRecordSaksi().getSaksi1Record().getAgama();


   nik_sksi1 = lahirData.getRecordSaksi().getSaksi1Record().getNikSaksi();
jenis_pekerjaan_saksi1 = ((lahirData.getRecordSaksi().getSaksi1Record().getJenisPkrjn()==null)?0:lahirData.getRecordSaksi().getSaksi1Record().getJenisPkrjn().intValue());
//System.out.println("lahirData.getRecordSaksi().getSaksi1Record().getJenisPkrjn()="+lahirData.getRecordSaksi().getSaksi1Record().getJenisPkrjn());
}
jenis_pekerjaan_saksi1 = (request.getParameter("jenis_pekerjaan_saksi1")!=null && Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi1"))!=0 ?Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi1")):jenis_pekerjaan_saksi1);
//System.out.println(1211);
%>
   <div class="tab-page"  id="tabPage5">
                    <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">

                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" size="17" class="boxdefault" maxlength="17" value="<%=nik_sksi1%>"   onKeyUp="return num1(form1.nik_sksi1)" onBlur="setupPekerjaan(form1.jenis_pekerjaan_saksi1, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=nama_saksi_1%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=tempat_lahir_saksi_1%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=tgl_lahir_saksi_1%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                                <td colspan="5">
   <%=alamat_saksi_1%><br>
   RT <%=rt_saksi_1%>
   RW <%=rw_saksi_1%>
   Dusun <%=dusun_saksi_1%>
   Kodepos <%=kodepos_saksi_1%>
   Telp <%=telp_saksi_1%>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=agama_saksi_1%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pekerjaan_saksi1 boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <%
//System.out.println(1517);
wn_saksi_2 = ("".equals(nik_sksi2)?0:(nik_sksi2.substring(0,1).equals("A")?2:1));

if(lahirData==null || lahirData.getRecordSaksi()==null || lahirData.getRecordSaksi().getSaksi2Record() == null)
{
edit="disabled";
//System.out.println("saksi 1 edit="+edit);
}
//System.out.println(1525);
String nama_saksi_2 = "-";
String tempat_lahir_saksi_2 = "-";
String tgl_lahir_saksi_2 = "-";
String alamat_saksi_2 = "-";
String rt_saksi_2 = "-";
String rw_saksi_2 = "-";
String dusun_saksi_2 = "-";
String kodepos_saksi_2 = "-";
String telp_saksi_2 = "-";
String agama_saksi_2 = "-";
int jenis_pekerjaan_saksi2 = (request.getParameter("jenis_pekerjaan_saksi2")==null?0:Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi2")));
//System.out.println(1537);


if (lahirData!=null && lahirData.getRecordSaksi()!=null && lahirData.getRecordSaksi().getSaksi2Record()!=null) {

   nama_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getNamaLgkp();
   tempat_lahir_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getTmptLhr();
   tgl_lahir_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getTglLhr();
 alamat_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getAlamat()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getAlamat());
 rt_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getNoRt()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getNoRt().toString());
 rw_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getNoRw()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getNoRw().toString());
 dusun_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getDusun()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getDusun());
 kodepos_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getKodePos()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getKodePos().toString());
 telp_saksi_2 = ((lahirData.getRecordSaksi().getSaksi2Record().getTelp()==null)?"-":lahirData.getRecordSaksi().getSaksi2Record().getTelp());
agama_saksi_2 = lahirData.getRecordSaksi().getSaksi2Record().getAgama();
   nik_sksi2 = lahirData.getRecordSaksi().getSaksi2Record().getNikSaksi();
jenis_pekerjaan_saksi2 = ((lahirData.getRecordSaksi().getSaksi2Record().getJenisPkrjn()==null)?0:lahirData.getRecordSaksi().getSaksi2Record().getJenisPkrjn().intValue());
//System.out.println("lahirData.getRecordSaksi().getSaksi Record().getJenisPkrjn()="+lahirData.getRecordSaksi().getSaksi2Record().getJenisPkrjn());
}
//System.out.println(1558);
jenis_pekerjaan_saksi2 = (request.getParameter("jenis_pekerjaan_saksi2")!=null && Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi2"))!=0 ?Integer.parseInt(request.getParameter("jenis_pekerjaan_saksi2")):jenis_pekerjaan_saksi2);
%>
   <div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
                </script>



                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">

                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17"  value="<%=nik_sksi2%>"   onKeyUp="return num1(form1.nik_sksi2)" onBlur="setupPekerjaan(form1.jenis_pekerjaan_saksi2, ((this.value!='' && this.value.substring(0,1).toUpperCase()=='A')?2:1))" onChange="setSaveEnabled(false)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=nama_saksi_2%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=tempat_lahir_saksi_2%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=tgl_lahir_saksi_2%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                                <td colspan="5">
   <%=alamat_saksi_2%><br>
   RT <%=rt_saksi_2%>
   RW <%=rw_saksi_2%>
   Dusun <%=dusun_saksi_2%>
   Kodepos <%=kodepos_saksi_2%>
   Telp <%=telp_saksi_2%>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=agama_saksi_2%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pekerjaan_saksi2 boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                  </select>
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
<%
/*
if (kecInput) {
//System.out.println(1862);
  if (step>=2 && radiobutton<0 && radiobutton3<0) {
//System.out.println(1864);
     step = 1;
     edit = "disabled";
  }
}
*/
   if (step>=2 && errors==null) {%>
  <div class="tab-page"  id="tabPage7">
                    <h2 class="tab">Data Administrasi</h2>
                <script type="javascript">
                	tp1.addTabPage(document.getElementById("tabPage7"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                            <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                              <tr>
                                <td colspan="7"> </td>
                              </tr>
                              <tr>
                                <td colspan="7">
                                  <p style="line-height: 100%">
                                </td>
                              </tr>
                              <tr>
                                <td width="21%" height="41">
                                  <p style="line-height: 100%">Jenis Daftar Kelahiran<font color="#000099" class="asterish">*</font>
                                  </p>
                                </td>
                                <td width="1%" height="41">:</td>
                                <td width="26%" height="41">
                                  <p style="line-height: 100%">
                                    <select size="1" name="jenis_dft_lhr" class="boxdefault">
                                      <option value="0" selected>-- Pilih Daftar
                                      Kelahiran --</option>
                                      <option value="1">1 - Umum</option>
                                      <option value="2">2 - Istimewa</option>
                                      <option value="3">3 - Dispensasi</option>
                                    </select>
                                  </p>
                                </td>
                                <td width="1%" height="41">&nbsp;</td>
                                <td width="24%" height="41">
                                  <p style="line-height: 100%">Dasar Hukum Pencatatan
                                    Kelahiran<font color="#000099" class="asterish">*</font></p>
                                </td>
                                <td width="1%" height="41">:</td>
                                <td width="26%" height="41">
                                  <p style="line-height: 100%">
                                    <select size="1" name="dsrhk_cttlhr" class="boxdefault">
                                      <option value="0" selected>-- Pilih Dasar
                                      Hukum --</option>
                                      <option value="1">1 - Stbld 1849 No. 25</option>
                                      <option value="2">2 - Stbld 1917 No.130
                                      jo 1919 No.81</option>
                                      <option value="3">3 - Stbld 1920 No.751
                                      jo 1927 No.564</option>
                                      <option value="4">4 - Stbld 1933 No.75 jo
                                      1936 No.607</option>
                                      <option value="5">5 - Non Stbld</option>
									  <option value="6">6 - UU No.23 Tahun 2006</option>
									  <option value="7">7 - ----------</option>
                                    </select>
                                  </p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%" valign="top">Dokumen Persyaratan<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" valign="top">:</td>
                                <td colspan="5" valign="top">
                                  <select name="doc_per" size="6" multiple class="boxdefault">
                                    <option value="1">Copy KTP dan KK Orang Tua</option>
                                    <option value="2">Akta Kawin Orang Tua</option>
                                    <option value="3">Paspor Orang Tua</option>

                                    <option value="4">Surat Kenal Lahir dari RS/Dokter/Bidan</option>
                                    <option value="5">Keterangan Kelahiran dari
                                    Desa/Kelurahan</option>
                                    <option value="6">Surat Kewarganegaraan Orang
                                    Tua</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%">Nama Pejabat</td>
                                <td width="1%">:</td>
                                <td width="26%"><%=record.getKabNamaPej()%></td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">NIP Pejabat </td>
                                <td width="1%">:</td>
                                <td width="26%"><%=record.getKabNipPej()%></td>
                              </tr>
                              <tr>
                                <td width="21%">Jabatan pada Kantor/Dinas</td>
                                <td width="1%">:</td>
                                <td width="26%"><%=record.getKabJabatan()%> </td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">Tanggal Akta kelahiran</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"><%=record.getToday()%>
                                  </p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%">
                                  <p style="line-height: 100%">Nama Kepala Desa/Lurah<font color="#000099" class="asterish"></font>
                                  </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nama_kep_des" size="27" class="boxdefault" maxlength="60" value="<%=(request.getParameter("nama_kep_des")==null?"":request.getParameter("nama_kep_des"))%>">
                                  </p>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">NIP Lurah<font color="#000099" class="asterish"></font></p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nip_lrh" size="9" class="boxdefault" maxlength="9" value="<%=(request.getParameter("nip_lrh")==null?"":request.getParameter("nip_lrh"))%>">
                                  </p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%">
                                  <p style="line-height: 100%">Nama Petugas Pencatat/
                                    Registrar<font color="#000099" class="asterish">*</font></p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nama_pet_reg" size="27" class="boxdefault" maxlength="60" value="<%=(request.getParameter("nama_pet_reg")==null?"":request.getParameter("nama_pet_reg"))%>">
                                  </p>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td align="center" width="24%">
                                  <p align="left" style="line-height: 100%">NIP
                                    Petugas Pencatat/Registrar<font color="#000099" class="asterish">*</font>
                                </td>
                                <td width="1%">:</td>
                                <td align="center" width="26%">
                                  <p align="left" style="line-height: 100%">
                                    <input type="text" name="nip_pet_reg" size="9" class="boxdefault" maxlength="9" value="<%=(request.getParameter("nip_pet_reg")==null?"":request.getParameter("nip_pet_reg"))%>">
                                </td>
                              </tr>
                              <tr>
                                <td align="center" width="21%">
                                  <p align="left" style="line-height: 100%">Nama
                                    Petugas Entri Data
                                </td>
                                <td width="1%">:</td>
                                <td align="center" width="26%">
                                  <p align="left" style="line-height: 100%"><%=record.getNamaPetugas()%>
                                </td>
                                <td align="center" width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">NIP Petugas Entri
                                    Data</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"> <%=record.getNipPetugas()%></p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%">
                                  <p style="line-height: 100%">Tanggal Entri Data</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <%=tanggal_entri%>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">&nbsp;</p>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="26%">&nbsp; </td>
                              </tr>
                            </table>
                        </td>
      </tr>
    </table>
                  </div>
				  <%}%>
  </div>

<script language="javascript">
setupAllTabs();
</script>
                        </td>
                     </tr>
                  </table>
                </div>
              </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>

<br>
<table width="400" border="0" cellspacing="5" cellpadding="5" align="center">
  <tr>
      <td width="120">
        <div align="center"><b>
        <input class=boxstandard type="button" value="KONFIRMASI"  name="kon"  onClick="return saksi(<%=step%>, <%=kecInput%>)">
        </b></div>
    </td>
      <td width="110">
        <div align="center"><b> </b></div>
      <div align="center"><b>
        <input class=boxstandard type="submit" value="SIMPAN" name="sim" onclick="return simpan()">
        </b></div>
    </td>
      <td width="98">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KELUAR" name="kel" onclick="document.location='<%=record.getModRefFile()%>'">
          </b></div>
    </td>
      <td width="7">
        <div align="center"><b> </b></div>
    </td>
  </tr>
  <tr>
    <td colspan="4">
      <div align="center"><font color="#003399">Keterangan : </font><font color="#000099" class="asterish">*</font><font color="#003399">Data
        harus diisi sesuai kondisi sebenarnya</font></div>
    </td>
  </tr>

</table>
<input type=hidden name="today" value="<%=record.getToday()%>">
<input type="hidden" name="kecInput" value="<%=kecInput%>">
<input type="hidden" name="nama_bayi" value="<%=nama_bayi%>">
<input type="hidden" name="no_kec" value="<%=no_kec%>">
</form>
<script language="JavaScript">
<% if (kecInput) {%>
               setFieldIbuEnabled(true);
               setFieldAyahEnabled(true);
               setFieldPelaporEnabled(true);
<%}%>
  form1.tmpt_dilhr.selectedIndex = <%=tmpt_dilhr%>
  form1.wkt_pkl_lhr.selectedIndex = <%=wkt_pkl_lhr%>
  form1.jenis_klahir.selectedIndex = <%=jenis_klahir%>
  form1.pnlng_klahir.selectedIndex = <%=pnlng_klahir%>

<%
//System.out.println("errors="+errors);
if (lahirData!=null && lahirData.getRecordBayi()!=null && errors==null) {
%>
  if(document.all['tgl_ctt_kwn_ibu_dd'].value!=null && document.all['tgl_ctt_kwn_ibu_dd'].value!="")
  {
     setDD(document.all['tgl_ctt_kwn_ibu_dd'].value);
     document.all['tgl_ctt_kwn_ayh_dd'].disabled=true;
     document.all['tgl_ctt_kwn_ibu_dd'].disabled=true;
  }
  if(document.all['tgl_ctt_kwn_ibu_mm'].value!=null && document.all['tgl_ctt_kwn_ibu_mm'].value!="")
  {
     setMM(document.all['tgl_ctt_kwn_ibu_mm'].value);
     document.all['tgl_ctt_kwn_ayh_mm'].disabled=true;
     document.all['tgl_ctt_kwn_ibu_mm'].disabled=true;
  }
  if(document.all['tgl_ctt_kwn_ibu_yy'].value!=null && document.all['tgl_ctt_kwn_ibu_yy'].value!="")
  {
     setYY(document.all['tgl_ctt_kwn_ibu_yy'].value);
     document.all['tgl_ctt_kwn_ayh_yy'].disabled=true;
     document.all['tgl_ctt_kwn_ibu_yy'].disabled=true;
  }

  if(document.all['tgl_ctt_kwn_ayh_dd'].value!=null && document.all['tgl_ctt_kwn_ayh_dd'].value!="")
  {
    setDDIbu(document.all['tgl_ctt_kwn_ayh_dd'].value);
    document.all['tgl_ctt_kwn_ayh_dd'].disabled=true;
    document.all['tgl_ctt_kwn_ibu_dd'].disabled=true;
  }
  if(document.all['tgl_ctt_kwn_ayh_mm'].value!=null && document.all['tgl_ctt_kwn_ayh_mm'].value!="")
  {
    setMMIbu(document.all['tgl_ctt_kwn_ayh_mm'].value);
    document.all['tgl_ctt_kwn_ayh_mm'].disabled=true;
    document.all['tgl_ctt_kwn_ibu_mm'].disabled=true;
  }
  if(document.all['tgl_ctt_kwn_ayh_yy'].value!=null && document.all['tgl_ctt_kwn_ayh_yy'].value!="")
  {
    setYYIbu(document.all['tgl_ctt_kwn_ayh_yy'].value)
    document.all['tgl_ctt_kwn_ayh_yy'].disabled=true;
    document.all['tgl_ctt_kwn_ibu_yy'].disabled=true;
  }
<%
  if (wn_ibu>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_ibu, <%=wn_ibu%>);
     form1.jenis_pkrjn_ibu.selectedIndex = <%=jenis_pkrjn_ibu%>
     form1.ketrunan_ibu.selectedIndex = <%=ketrunan_ibu%>
<%
  }
%>
  form1.ketrunan_ibu.selectedIndex = <%=ketrunan_ibu%>
<%
  if (wn_ayah>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_ayh, <%=wn_ayah%>);
     form1.jenis_pkrjn_ayh.selectedIndex = <%=jenis_pkrjn_ayh%>
     form1.ketrunan_ayh.selectedIndex = <%=ketrunan_ayh%>
<%
  }
}

  if (wn_pelapor>0) {
%>
     setupPekerjaan(form1.jenis_pkrjn_plpor, <%=wn_pelapor%>);
     form1.jenis_pkrjn_plpor.selectedIndex = <%=jenis_pkrjn_plpor%>
<%
  }
%>
  setupPekerjaan(form1.jenis_pekerjaan_saksi1, <%=wn_saksi_1%>);
  form1.jenis_pekerjaan_saksi1.selectedIndex = <%=jenis_pekerjaan_saksi1%>

  setupPekerjaan(form1.jenis_pekerjaan_saksi2, <%=wn_saksi_2%>);
  form1.jenis_pekerjaan_saksi2.selectedIndex = <%=jenis_pekerjaan_saksi2%>

<% if (step>=2 && errors==null) {
%>
  form1.jenis_dft_lhr.selectedIndex = <%=(request.getParameter("jenis_dft_lhr")==null?0:Integer.parseInt(request.getParameter("jenis_dft_lhr")))%>
  form1.dsrhk_cttlhr.selectedIndex = <%=(request.getParameter("dsrhk_cttlhr")==null?0:Integer.parseInt(request.getParameter("dsrhk_cttlhr")))%>
<%
  String[] selected=request.getParameterValues("doc_per");
  if (selected!=null) {
     for(int j=0; j < selected.length;j++)
        {
%>
           form1.doc_per.options[<%=Integer.parseInt(selected[j])-1%>].selected = true;
<%
        }
  }
  }
%>
<% if (kecInput && !("".equals(edit))) { %>
  alert("Lengkapi Data Bayi, Data Ibu, Data Ayah, dan Data Pelapor");
<% }
%>
  setSaveEnabled(<%=(step>=2 && "".equals(edit))%>)
  setupKecamatanInput(<%=kecInput%>)
</script>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
  {
    //System.out.println("In Jsp Exception = " + e);
    e.printStackTrace();
  }
%>