<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
    String select,id1=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory;
    Login remote;
    KawinObject kawinData=null;
    WNIBiodataHome homeKlr = null;
    WNIBiodata remoteKlr = null;
    Vector v1;
    int i,j,k,l1,m1,n1,o,p,q,r,s,t,u,a,w;
    String nik_suami=null,nik_suami_ayh=null,nik_suami_ibu=null,
    nik_istri=null,nik_istri_ayh=null,nik_istri_ibu=null,
    nik_sksi1=null,nik_sksi2=null;
    String tgl_lahir="";
    String dd="";
    String mon="";
    String yy="";

String nama_prop_ayh_suami="", nama_kab_ayh_suami="", nama_kec_ayh_suami="", nama_kel_ayh_suami="";
String nama_prop_ibu_suami="", nama_kab_ibu_suami="", nama_kec_ibu_suami="", nama_kel_ibu_suami="";
String nama_prop_ayh_istri="", nama_kab_ayh_istri="", nama_kec_ayh_istri="", nama_kel_ayh_istri="";
String nama_prop_ibu_istri="", nama_kab_ibu_istri="", nama_kec_ibu_istri="",nama_kel_ibu_istri="";
String nama_prop_pmka_agama="",nama_kab_pmka_agama="",nama_kec_pmka_agama="",nama_kel_pmka_agama="";
/*
private capil.AnakDanOrangTuaObject convert(KawinObject kawinData) {
  capil.AnakDanOrangTuaObject obj = null;
  if (kawinData!=null) {
  }
  return obj;
}
*/
%>

<%
  try
    {
java.util.Date date = new java.util.Date();
//System.out.println("BEGIN  GET PARAM :"+date);
 nama_prop_ayh_suami = ((request.getParameter("nama_prop_ayh_suami")==null)?"":request.getParameter("nama_prop_ayh_suami"));
 nama_kab_ayh_suami = ((request.getParameter("nama_kab_ayh_suami")==null)?"":request.getParameter("nama_kab_ayh_suami"));
 nama_kec_ayh_suami = ((request.getParameter("nama_kec_ayh_suami")==null)?"":request.getParameter("nama_kec_ayh_suami"));
 nama_kel_ayh_suami = ((request.getParameter("nama_kel_ayh_suami")==null)?"":request.getParameter("nama_kel_ayh_suami"));
nama_prop_ibu_suami = ((request.getParameter("nama_prop_ibu_suami")==null)?"":request.getParameter("nama_prop_ibu_suami"));
nama_kab_ibu_suami = ((request.getParameter("nama_kab_ibu_suami")==null)?"":request.getParameter("nama_kab_ibu_suami"));
nama_kec_ibu_suami = ((request.getParameter("nama_kec_ibu_suami")==null)?"":request.getParameter("nama_kec_ibu_suami"));
nama_kel_ibu_suami = ((request.getParameter("nama_kel_ibu_suami")==null)?"":request.getParameter("nama_kel_ibu_suami"));


nama_prop_ayh_istri =((request.getParameter("nama_prop_ayh_istri")==null)?"":request.getParameter("nama_prop_ayh_istri"));
nama_kab_ayh_istri= ((request.getParameter("nama_kab_ayh_istri")==null)?"":request.getParameter("nama_kab_ayh_istri"));
nama_kec_ayh_istri= ((request.getParameter("nama_kec_ayh_istri")==null)?"":request.getParameter("nama_kec_ayh_istri"));
nama_kel_ayh_istri= ((request.getParameter("nama_kel_ayh_istri")==null)?"":request.getParameter("nama_kel_ayh_istri"));

nama_prop_ibu_istri= ((request.getParameter("nama_prop_ibu_istri")==null)?"":request.getParameter("nama_prop_ibu_istri"));
nama_kab_ibu_istri= ((request.getParameter("nama_kab_ibu_istri")==null)?"":request.getParameter("nama_kab_ibu_istri"));
nama_kec_ibu_istri= ((request.getParameter("nama_kec_ibu_istri")==null)?"":request.getParameter("nama_kec_ibu_istri"));
nama_kel_ibu_istri= ((request.getParameter("nama_kel_ibu_istri")==null)?"":request.getParameter("nama_kel_ibu_istri"));


nama_prop_pmka_agama=((request.getParameter("nama_prop_pmka_agama")==null)?"":request.getParameter("nama_prop_pmka_agama"));
nama_kab_pmka_agama=((request.getParameter("nama_kab_pmka_agama")==null)?"":request.getParameter("nama_kab_pmka_agama"));
nama_kec_pmka_agama=((request.getParameter("nama_kec_pmka_agama")==null)?"":request.getParameter("nama_kec_pmka_agama"));
nama_kel_pmka_agama=((request.getParameter("nama_kel_pmka_agama")==null)?"":request.getParameter("nama_kel_pmka_agama"));


     nik_suami=((request.getParameter("nik_suami")==null)?"":request.getParameter("nik_suami"));

    nik_suami_ayh=(request.getParameter("nik_ayh_dr_suami")==null)?"":request.getParameter("nik_ayh_dr_suami");

     nik_suami_ibu=(request.getParameter("nik_ibu_dr_suami")==null)?"":request.getParameter("nik_ibu_dr_suami");
     //session.setAttribute("nik_ibu_dr_suami",nik_suami_ibu);

     nik_istri=((request.getParameter("nik_istri")==null)?"":request.getParameter("nik_istri"));
     //session.setAttribute("nik_istri",nik_istri);

     nik_istri_ayh=(request.getParameter("nik_ayh_dr_istri")==null)?"":request.getParameter("nik_ayh_dr_istri");
     //session.setAttribute("nik_ayh_dr_istri",nik_istri_ayh);

     nik_istri_ibu=(request.getParameter("nik_ibu_dr_istri")==null)?"":request.getParameter("nik_ibu_dr_istri");
     //session.setAttribute("nik_ibu_dr_istri",nik_istri_ibu);

     nik_sksi1=((request.getParameter("nik_sksi1")==null)?"":request.getParameter("nik_sksi1"));
     //session.setAttribute("nik_sksi1",nik_sksi1);

     nik_sksi2=((request.getParameter("nik_sksi2")==null)?"":request.getParameter("nik_sksi2"));

date = new java.util.Date();
//System.out.println("END  :"+date);
     v = new Vector();
     record = (UserInfo1)session.getAttribute("remoteRef");
if(record != null)
       {
      factory=ServiceController.getInstance();

     homeKlr = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);

     if(homeKlr != null)
     {
       remoteKlr = homeKlr.create();
     }
date = new java.util.Date();
//System.out.println("BEGIN LOOKUP :"+date);
Vector errors = new Vector();
boolean allowed = true;

int statusAyahDariSuami = ("Ada".equals(request.getParameter("radiobutton"))?ADAEXIST:(("Tidak Ada".equals(request.getParameter("radiobutton"))?TIDAKADA:-1)));
int statusIbuDariSuami = ("Ada".equals(request.getParameter("radiobutton2"))?ADAEXIST:(("Tidak Ada".equals(request.getParameter("radiobutton2"))?TIDAKADA:-1)));
int statusAyahDariIstri = ("Ada".equals(request.getParameter("radiobutton4"))?ADAEXIST:(("Tidak Ada".equals(request.getParameter("radiobutton4"))?TIDAKADA:-1)));
int statusIbuDariIstri = ("Ada".equals(request.getParameter("radiobutton6"))?ADAEXIST:(("Tidak Ada".equals(request.getParameter("radiobutton6"))?TIDAKADA:-1)));

//System.out.println("statusAyahDariSuami="+statusAyahDariSuami);
//System.out.println("statusIbuDariSuami="+statusIbuDariSuami);
//System.out.println("statusAyahDariIstri="+statusAyahDariIstri);
//System.out.println("statusIbuDariIstri="+statusIbuDariIstri);

//System.out.println(125);

try {
//System.out.println("nik_suami="+nik_suami);
//System.out.println("nik_suami_ayh="+nik_suami_ayh);
//System.out.println("nik_suami_ibu="+nik_suami_ibu);
//System.out.println("nik_istri="+nik_istri);
//System.out.println("nik_istri_ayh="+nik_istri_ayh);
//System.out.println("nik_istri_ibu="+nik_istri_ibu);
//System.out.println("nik_sksi1="+nik_sksi1);
//System.out.println("nik_sksi2="+nik_sksi2);
//System.out.println("cond1="+(!"".equals(nik_suami) && !"".equals(nik_istri) && !"".equals(nik_sksi1) && !"".equals(nik_sksi2)));
//System.out.println("cond2="+((statusAyahDariSuami<=TIDAKADA || statusAyahDariSuami>TIDAKADA && !"".equals(nik_suami_ayh))));
//System.out.println("cond3="+((statusIbuDariSuami<=TIDAKADA || statusIbuDariSuami>TIDAKADA && !"".equals(nik_suami_ibu))));
//System.out.println("cond4="+((statusAyahDariIstri<=TIDAKADA || statusAyahDariIstri>TIDAKADA && !"".equals(nik_istri_ayh))));
//System.out.println("cond5="+((statusIbuDariIstri<=TIDAKADA || statusIbuDariIstri>TIDAKADA && !"".equals(nik_istri_ibu))));
   if (!"".equals(nik_suami) && !"".equals(nik_istri) && !"".equals(nik_sksi1) && !"".equals(nik_sksi2) &&
       (statusAyahDariSuami<=TIDAKADA || statusAyahDariSuami>TIDAKADA && !"".equals(nik_suami_ayh)) &&
       (statusIbuDariSuami<=TIDAKADA || statusIbuDariSuami>TIDAKADA && !"".equals(nik_suami_ibu)) &&
       (statusAyahDariIstri<=TIDAKADA || statusAyahDariIstri>TIDAKADA && !"".equals(nik_istri_ayh)) &&
       (statusIbuDariIstri<=TIDAKADA || statusIbuDariIstri>TIDAKADA && !"".equals(nik_istri_ibu))
      ) {
//System.out.println(132);
    kawinData = (KawinObject)remoteKlr.getKawinData(nik_suami, nik_suami_ibu, nik_suami_ayh,
                         nik_sksi1, nik_istri, nik_istri_ibu, nik_istri_ayh,nik_sksi2);
//System.out.println(135);

    if (statusAyahDariSuami>TIDAKADA) {
       statusAyahDariSuami = ADANOTEXIST;
    }
    if (statusIbuDariSuami>TIDAKADA) {
      statusIbuDariSuami = ADANOTEXIST;
    }
    if (statusAyahDariIstri>TIDAKADA) {
      statusAyahDariIstri = ADANOTEXIST;
    }
    if (statusIbuDariIstri>TIDAKADA) {
       statusIbuDariIstri = ADANOTEXIST;
    }

    if (kawinData!=null) {
      if (kawinData.getRecord1()!=null) {
         pendaftaran.KelahiranObj wniObj = kawinData.getRecord1().getWniObj();
         pendaftaran.KelahiranWnaObj wnaObj = kawinData.getRecord1().getWnaObj();
         if (wniObj!=null || wnaObj!=null) {
            if ( (wniObj != null && wniObj.getRecord3() != null) ||
               (wnaObj != null && wnaObj.getRecord3() != null)
               ) {
               statusAyahDariSuami = ADAEXIST;
            }
            if ( (wniObj != null && wniObj.getRecord2() != null) ||
               (wnaObj != null && wnaObj.getRecord2() != null)
               ) {
               statusIbuDariSuami = ADAEXIST;
            }
          }
          wniObj = kawinData.getRecord2().getWniObj();
          wnaObj = kawinData.getRecord2().getWnaObj();
          if (wniObj!=null || wnaObj!=null) {
             if ( (wniObj != null && wniObj.getRecord3() != null) ||
                (wnaObj != null && wnaObj.getRecord3() != null)
                ) {
                statusAyahDariIstri = ADAEXIST;
             }
             if ( (wniObj != null && wniObj.getRecord2() != null) ||
                (wnaObj != null && wnaObj.getRecord2() != null)
                ) {
                statusIbuDariIstri = ADAEXIST;
             }
          }
      }
    }
    //capil.AnakDanOrangTuaObject keluargaObject = convert(kawinData);
   } else {
//System.out.println(186);
   kawinData = new KawinObject();
   kawinData.setRecord1(new WniWnaObj(new KelahiranObj(), new KelahiranWnaObj()));
   kawinData.setRecord2(new WniWnaObj(new KelahiranObj(), new KelahiranWnaObj()));
   }
} catch (CapilException ex) {
//System.out.println(192);
   allowed = false;
   kawinData = new KawinObject();
   kawinData.setRecord1(new WniWnaObj(new KelahiranObj(), new KelahiranWnaObj()));
   kawinData.setRecord2(new WniWnaObj(new KelahiranObj(), new KelahiranWnaObj()));
   errors.add(ex.getMessage());
}

//System.out.println("statusAyahDariSuami="+statusAyahDariSuami);
//System.out.println("statusIbuDariSuami="+statusIbuDariSuami);
//System.out.println("statusAyahDariIstri="+statusAyahDariIstri);
//System.out.println("statusIbuDariIstri="+statusIbuDariIstri);


KelahiranObj wni1Obj = kawinData.getRecord1().getWniObj();
BayiData wni1Bayi = wni1Obj.getRecord1();
IbuData wni1Ibu = wni1Obj.getRecord2();
AyahData wni1Ayah = wni1Obj.getRecord3();
PelaporData wni1Pelapor = wni1Obj.getRecord4();
KelahiranWnaObj wna1Obj = kawinData.getRecord1().getWnaObj();
BayiDataWna wna1Bayi = wna1Obj.getRecord1();
IbuDataWna wna1Ibu = wna1Obj.getRecord2();
AyahDataWna wna1Ayah = wna1Obj.getRecord3();
PelaporDataWna wna1Pelapor = wna1Obj.getRecord4();
//System.out.println("wni1Obj="+wni1Obj);
//System.out.println("wni1Bayi="+wni1Bayi);
//System.out.println("wni1Ibu="+wni1Ibu);
//System.out.println("wni1Ayah="+wni1Ayah);
//System.out.println("wni1Pelapor="+wni1Pelapor);
//System.out.println("wna1Obj="+wna1Obj);
//System.out.println("wna1Ibu="+wna1Ibu);
//System.out.println("wna1Ayah="+wna1Ayah);
//System.out.println("wna1Pelapor="+wna1Pelapor);

KelahiranObj wni2Obj = kawinData.getRecord2().getWniObj();
BayiData wni2Bayi = wni2Obj.getRecord1();
IbuData wni2Ibu = wni2Obj.getRecord2();
AyahData wni2Ayah = wni2Obj.getRecord3();
PelaporData wni2Pelapor = wni2Obj.getRecord4();
KelahiranWnaObj wna2Obj = kawinData.getRecord2().getWnaObj();
BayiDataWna wna2Bayi = wna2Obj.getRecord1();
IbuDataWna wna2Ibu = wna2Obj.getRecord2();
AyahDataWna wna2Ayah = wna2Obj.getRecord3();
PelaporDataWna wna2Pelapor = wna2Obj.getRecord4();
//System.out.println("wni2Obj="+wni2Obj);
//System.out.println("wni2Bayi="+wni2Bayi);
//System.out.println("wni2Ibu="+wni2Ibu);
//System.out.println("wni2Ayah="+wni2Ayah);
//System.out.println("wni2Pelapor="+wni2Pelapor);
//System.out.println("wna2Obj="+wna2Obj);
//System.out.println("wna2Ibu="+wna2Ibu);
//System.out.println("wna2Ayah="+wna2Ayah);
//System.out.println("wna2Pelapor="+wna2Pelapor);

if (wni1Bayi==null && wna1Bayi==null) { //bayi
   if (allowed)
   errors.add("NIK Suami Tidak Ada!");
}
if (wni1Ayah==null && wna1Ayah==null) { //Ayah
   if (allowed && statusAyahDariSuami>TIDAKADA)
   errors.add("NIK Ayah Dari Suami Salah/Tidak Ada!");
}
if (wni1Ibu==null && wna1Ibu==null) { //Ibu
   if (allowed && statusIbuDariSuami>TIDAKADA)
   errors.add("NIK Ibu Dari Suami Salah/Tidak Ada!");
}

if (wni2Bayi==null && wna2Bayi==null) { //bayi
   if (allowed)
   errors.add("NIK Istri Salah/Tidak Ada!");
}
if (wni2Ayah==null && wna2Ayah==null) { //Ayah
   if (allowed && statusAyahDariIstri>TIDAKADA)
   errors.add("NIK Ayah Dari Istri Salah/Tidak Ada!");
}
if (wni2Ibu==null && wna2Ibu==null) { //Ibu
   if (allowed && statusIbuDariIstri>TIDAKADA)
   errors.add("NIK Ibu Dari Istri Salah/Tidak Ada!");
}

if (wni1Pelapor==null && wna1Pelapor==null) { //Pelapor
   if (allowed)
   errors.add("NIK Saksi I Salah/Tidak Ada!");
}
if (wni2Pelapor==null && wna2Pelapor==null) { //Pelapor
   if (allowed)
   errors.add("NIK Saksi II Salah/Tidak Ada!");
}
if (errors.isEmpty())
   errors = null;
//System.out.println("errors="+errors);
date = new java.util.Date();
//System.out.println("END  :"+date);
%>
<script type="text/javascript" src="Templates/tabpane.js"></script>
<SCRIPT language=JavaScript src="scripts/Kawin.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/KawinList.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/KawinDataWilayah.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/util.js">
</SCRIPT>

<script language="text/javaScript">
var tp1;
</script>
<%
if(kawinData!=null)
{
//System.out.println("KAWIN DATA TIDAK NULL");
date = new java.util.Date();
//System.out.println("BEGIN RENDER PAGE :"+date);
%>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post">
<input type="hidden" name="buttondisabled" value="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif">
<jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20">
                  <div align="center"><span class="submenu">Pencatatan Perkawinan</span><br>
                    <br>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
                       <td>
                          <jsp:include page="data_wilayah.jsp"> <jsp:param name="level" value="2"/>
                            <jsp:param name="no_prop" value="<%=record.getNoProp()%>"/>
                            <jsp:param name="nama_prop" value="<%=record.getNamaProp()%>"/>
                            <jsp:param name="no_kab" value="<%=record.getNoKab()%>"/>
                            <jsp:param name="nama_kab" value="<%=record.getNamaKab()%>"/>
                          </jsp:include>
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
<div class="tab-pane" id="tab-pane-1" style="postion:absolute">

<script type="text/javascript">

    tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
</script>

<% // ************** Data for Data Suami from Biodata_Wni for given NIK *************** %>

<%
if(kawinData.getRecord1().getWniObj().getRecord1() != null)
{
//System.out.println("kawinData.getRecord1().getWniObj().getRecord1(): "+kawinData.getRecord1().getWniObj().getRecord1());
%>

 <div class="tab-page" style="postion:absolute"  id="tabPage1">
   <h2 class="tab">Data Suami</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage1"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
<input type="hidden" name="kw_suami" value="1">
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                            <tr>
     <td colspan="7">
<input type="hidden" name="nama_suami" value="<%=kawinData.getRecord1().getWniObj().getRecord1().getNamaLgkp().toUpperCase()%>">
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Suami<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                               <p style="line-height: 100%">
    <input type="text" name="nik_suami" value="<%=request.getParameter("nik_suami")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_suami)" onblur="validateWNSuami(form1.nik_suami)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord1().getWniObj().getRecord1().getNoKk()==null)?"-":kawinData.getRecord1().getWniObj().getRecord1().getNoKk())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord1().getWniObj().getRecord1().getNamaLgkp()==null)?"-":kawinData.getRecord1().getWniObj().getRecord1().getNamaLgkp().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=pddk_akh_suami  class="boxdefault" onchange="pddk_suami.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Tidak Tamat SD/Sederajat</option>
                                  <option value="3">3 - Tamat SD/Sederajat</option>
                                  <option value="4">4 - SLTP/Sederajat</option>
                                  <option value="5">5 - SLTA/Sederajat</option>
                                  <option value="6">6 - Diploma I/II</option>
                                  <option value="7">7 - Akademi/Diploma III/S.
                                  Muda</option>
                                  <option value="8">8 - Diploma IV/Strata I</option>
                                  <option value="9">9 - Strata II</option>
                                  <option value="10">10 - Strata III</option>
                                </select>



                                <input type="hidden" name="pddk_suami">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5"><%=((kawinData.getRecord1().getWniObj().getRecord1().getAlamat()==null)?"-":kawinData.getRecord1().getWniObj().getRecord1().getAlamat()+", ")%><br> <%=((kawinData.getRecord1().getWniObj().getRecord1().getNoRt()==null)?"":kawinData.getRecord1().getWniObj().getRecord1().getNoRt().toString()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord1().getNoRw()==null)?"":kawinData.getRecord1().getWniObj().getRecord1().getNoRw().toString()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord1().getDusun()==null)?"":kawinData.getRecord1().getWniObj().getRecord1().getDusun()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord1().getKodePos()==null)?"":kawinData.getRecord1().getWniObj().getRecord1().getKodePos().toString()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord1().getTelp()==null)?"":kawinData.getRecord1().getWniObj().getRecord1().getTelp())%></td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
<%=((kawinData.getRecord1().getWniObj().getRecord1().getAgama()==null)?"-":kawinData.getRecord1().getWniObj().getRecord1().getAgama())%>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_suami boxdefault2 class="boxdefault" onchange="jenis_wrk_suami.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Pelajar/Mahasiswa</option>
                                  <option value="2">2 - Mengurus Rumah Tangga</option>
                                  <option value="3">3 - Pensiunan</option>
                                  <option value="4">4 - Belum/Tidak Bekerja</option>
                                  <option value="5">5 - Petani/Pekebun</option>
                                  <option value="6">6 - Peternak</option>
                                  <option value="7">7 - Nelayan/Perikanan</option>
                                  <option value="8">8 - Industri</option>
                                  <option value="9">9 - Konstruksi</option>
                                  <option value="10">10 - Perdagangan</option>
                                  <option value="11">11 - Transportasi</option>
                                  <option value="12">12 - Pegawai Negeri Sipil</option>
                                  <option value="13">13 - Tentara Nasional Indonesia</option>
                                  <option value="14">14 - Kepolisian R.I.</option>
                                  <option value="15">15 - Jasa Lainnya</option>
                                  <option value="16">16 - Lainnya</option>
                                </select>
                                <input type="hidden" name="jenis_wrk_suami">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=ktrunan_suami boxdefault2 class="boxdefault">
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                </select>
                              </td>

                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%">
<%=((kawinData.getRecord1().getWniObj().getRecord1().getStatKwn()==null)?"-":getClAktaStatusKawin(kawinData.getRecord1().getWniObj().getRecord1().getStatKwn()))%>
<input type="hidden" name="stat_sebel_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord1().getStatKwn()==null)?"":getClAktaStatusKawin(kawinData.getRecord1().getWniObj().getRecord1().getStatKwn()))%>">
</td>
                            </tr>

                           <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
       <input type="text" name="kwn_ke_suami" <%if(request.getParameter("kwn_ke_suami")!=null){%>value="<%=request.getParameter("kwn_ke_suami")%>"<%}%> size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_suami)">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Istri Yang Ke (bagi poligami)</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="istri_ke" <%if(request.getParameter("istri_ke")!=null){%>value="<%=request.getParameter("istri_ke")%>"<%}%> size="2" maxlength="2" class="boxdefault"  onKeyUp="return num(form1.istri_ke)">
                              </td>
                            </tr>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_suami, "1");
form1.pddk_akh_suami.options[<%=kawinData.getRecord1().getWniObj().getRecord1().getPddkAkh()%>].selected=true
form1.jenis_pkrjn_suami.options[<%=kawinData.getRecord1().getWniObj().getRecord1().getJenisPkrjn()%>].selected=true
<%if(request.getParameter("ktrunan_suami")!=null)
{%>
form1.ktrunan_suami.options[<%=request.getParameter("ktrunan_suami")%>].selected=true
<%}%>
</script>
                            <tr>

                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%">WNI</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                          </table>
                        </td>

  </tr>
</table>
 </div>



<% // ************** Data for Data Suami from Biodata_Wna for given NIK *************** %>

<%}
else if(kawinData.getRecord1().getWnaObj().getRecord1() != null)
{
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord1(): "+kawinData.getRecord1().getWnaObj().getRecord1());

%>

  <div class="tab-page" style="postion:absolute"  id="tabPage1">
    <h2 class="tab">Data Suami</h2>

		<script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage1"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
<input type="hidden" name="kw_suami" value="2">
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                            <tr>
                              <td colspan="7">
<input type="hidden" name="nama_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord1().getNamaPertma()==null)?"":kawinData.getRecord1().getWnaObj().getRecord1().getNamaPertma().toUpperCase())%>">
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Suami<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
         <input type="text" name="nik_suami" value="<%=request.getParameter("nik_suami")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_suami)" onblur="validateWNSuami(form1.nik_suami)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord1().getWnaObj().getRecord1().getNoKk()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord1().getNoKk())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord1().getWnaObj().getRecord1().getNamaPertma()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord1().getNamaPertma().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select class="boxdefault" name="pddk_akh_suami" onchange="pddk_suami.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Pendidikan Terakhir
                                  --</option>
                                  <option value="1">1 - ELementary</option>
                                  <option value="2">2 - Junior Height School</option>
                                  <option value="3">3 - Senior Hight School</option>
                                  <option value="4">4 - Diploma</option>
                                  <option value="5">5 - Bachelor</option>
                                  <option value="6">6 - Master</option>
                                  <option value="7">7 - Philosophy of Doctor</option>
                                  <option value="8">8 - Others</option>
                                </select>
                        <input type="hidden" name="pddk_suami">
             </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5"><%=((kawinData.getRecord1().getWnaObj().getRecord1().getAlamat()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord1().getAlamat()+", ")%><br>
                                <%=((kawinData.getRecord1().getWnaObj().getRecord1().getNoRt()==null)?"":kawinData.getRecord1().getWnaObj().getRecord1().getNoRt().toString()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord1().getNoRw()==null)?"":kawinData.getRecord1().getWnaObj().getRecord1().getNoRw().toString()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord1().getDusun()==null)?"":kawinData.getRecord1().getWnaObj().getRecord1().getDusun()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord1().getKodePos()==null)?"":kawinData.getRecord1().getWnaObj().getRecord1().getKodePos().toString()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord1().getTelp()==null)?"":kawinData.getRecord1().getWnaObj().getRecord1().getTelp())%></td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%"> <%=((kawinData.getRecord1().getWnaObj().getRecord1().getAgama()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord1().getAgama())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  class="boxdefault" name="jenis_pkrjn_suami" onchange="jenis_wrk_suami.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Trading and Industry</option>
                                  <option value="2">2 - Forestry</option>
                                  <option value="3">3 - Mining and Energy</option>
                                  <option value="4">4 - Public Work</option>
                                  <option value="5">5 - Farming</option>
                                  <option value="6">6 - Religion</option>
                                  <option value="7">7 - Bank and Financial</option>
                                  <option value="8">8 - Health and Society</option>
                                  <option value="9">9 - Tourism</option>
                                  <option value="10">10 - Transportation and Communication</option>
                                  <option value="11">11 - Culture and Education</option>
                                  <option value="12">12 - Others</option>
                                </select>
<input type="hidden" name="jenis_wrk_suami">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=ktrunan_suami boxdefault2 class="boxdefault">
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%"> <%=((kawinData.getRecord1().getWnaObj().getRecord1().getStatKwn()==null)?"-":getClAktaStatusKawin(kawinData.getRecord1().getWnaObj().getRecord1().getStatKwn()))%>
                                <input type="hidden" name="stat_sebel_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord1().getStatKwn()==null)?"":getClAktaStatusKawin(kawinData.getRecord1().getWnaObj().getRecord1().getStatKwn()))%>">
                              </td>

                           </tr>
                            <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kwn_ke_suami" <%if(request.getParameter("kwn_ke_suami")!=null){%>value="<%=request.getParameter("kwn_ke_suami")%>"<%}%> size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_suami)">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Istri Yang Ke (bagi poligami)</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="istri_ke" <%if(request.getParameter("istri_ke")!=null){%>value="<%=request.getParameter("istri_ke")%>"<%}%> size="2" maxlength="2" class="boxdefault"  onKeyUp="return num(form1.istri_ke)">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%">WNA</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=((kawinData.getRecord1().getWnaObj().getRecord1().getKwrngrn()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord1().getKwrngrn().toUpperCase())%></td>
                            </tr>
                          </table>
<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_suami, "2");
  form1.pddk_akh_suami.options[<%=((kawinData.getRecord1().getWnaObj().getRecord1().getPddkAkh()==null)?"0":kawinData.getRecord1().getWnaObj().getRecord1().getPddkAkh())%>].selected=true
  form1.jenis_pkrjn_suami.options[<%=((kawinData.getRecord1().getWnaObj().getRecord1().getJenisPkrjn()==null)?"0":kawinData.getRecord1().getWnaObj().getRecord1().getJenisPkrjn())%>].selected=true
<%if(request.getParameter("ktrunan_suami")!=null)
{%>
  form1.ktrunan_suami.options[<%=((request.getParameter("ktrunan_suami")==null)?"0":request.getParameter("ktrunan_suami"))%>].selected=true
<%}%>
</script>
                        </td>
  </tr>
</table>
  </div>

<%} else { %>

<% // ************** Data for Data Suami from Biodata_Wni for given NIK *************** %>

 <div class="tab-page" style="postion:absolute"  id="tabPage1">
   <h2 class="tab">Data Suami</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage1"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
<input type="hidden" name="kw_suami" value="1">
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                            <tr>
     <td colspan="7">
<input type="hidden" name="nama_suami" value="">
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Suami<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                               <p style="line-height: 100%">
                                  <input type="text" name="nik_suami" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_suami)" value="<%=request.getParameter("nik_suami")%>" onblur="validateWNSuami(form1.nik_suami)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=pddk_akh_suami  class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                </select>
                                <input type="hidden" name="pddk_suami">

                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">-</td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">- </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_suami  class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan--</option>
                                </select>
                                <input type="hidden" name="jenis_wrk_suami">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=ktrunan_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan--</option>
                                </select>
                              </td>

                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%"> -
<input type="hidden" name="stat_sebel_suami" value="">
</td>
                            </tr>

                           <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
       <input type="text" name="kwn_ke_suami"  size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Istri Yang Ke (bagi poligami)</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="istri_ke" size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                            </tr>
                            <tr>

                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                          </table>
                        </td>

  </tr>
</table>
 </div>
<%}%>

<% // ************** Data for Data Ayah dari Suami from Biodata_Wni for given NIK *************** %>

<%
//System.out.println("Data Ayah dari Suami request.getParameter radiobutton1= "+request.getParameter("radiobutton1"));
if(request.getParameter("radiobutton1").equals("1"))
{
  //System.out.println("kawinData.getRecord1().getWniObj().getRecord3(): "+kawinData.getRecord1().getWniObj().getRecord3());

  if(kawinData.getRecord1().getWniObj().getRecord3()!=null) {
    if(nama_prop_ayh_suami==null || nama_prop_ayh_suami.trim().equals("")) nama_prop_ayh_suami = kawinData.getRecord1().getWniObj().getRecord3().getNoProp();
    if(nama_kab_ayh_suami==null || nama_kab_ayh_suami.trim().equals("")) nama_kab_ayh_suami = kawinData.getRecord1().getWniObj().getRecord3().getNoKab();
    if(nama_kec_ayh_suami==null || nama_kec_ayh_suami.trim().equals("")) nama_kec_ayh_suami = kawinData.getRecord1().getWniObj().getRecord3().getNoKec();
    if(nama_kel_ayh_suami==null || nama_kel_ayh_suami.trim().equals("")) nama_kel_ayh_suami = kawinData.getRecord1().getWniObj().getRecord3().getNoKel();
  }
%>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
    <h2 class="tab">Data Ayah dari Suami</h2>

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
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton" value="Ada" onClick="return radioValid()">
                                Ada<br>
                                <input type="radio" name="radiobutton" value="Tidak Ada" onClick="return radioValid1()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ayah dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
    <input type="radio" name="radiobutton1" value="1" onClick="return radioValid2();kw_suami_ayh.value='1'">
                                WNI<br>
    <input type="radio" name="radiobutton1" value="2" onClick="return radioValid3();kw_suami_ayh.value='2'">
                                WNA</td>
    <input type="hidden" name="kw_suami_ayh" value="1">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh_dr_suami" value="<%=((request.getParameter("nik_ayh_dr_suami")==null)?"":request.getParameter("nik_ayh_dr_suami"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh_dr_suami)" onblur="validateWNAyah(form1.nik_ayh_dr_suami,form1.radiobutton1)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
   <input type="text" name="nama_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getNamaLgkp().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ayh_suami)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=agama_ayh_suami  class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="tmpt_lhr_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getTmptLhr().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ayh_suami)" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Tanggal Lahir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
<td width="23%">
<table width="100" border="0" cellspacing="3" cellpadding="0">
<tr>
                                    <td>
                                      <input
  class=boxdefault size=2 name=tgl_lhr_ayh_suami_dd value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":getDD(kawinData.getRecord1().getWniObj().getRecord3().getTglLhr()))%>" maxlength="2" onKeyUp="return tab3()" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
 class=boxdefault size=2 name=tgl_lhr_ayh_suami_mm value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":getMM(kawinData.getRecord1().getWniObj().getRecord3().getTglLhr()))%>" maxlength="2" onKeyUp="return tab4()" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
class=boxdefault size=4 name=tgl_lhr_ayh_suami_yy value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":getYY(kawinData.getRecord1().getWniObj().getRecord3().getTglLhr()))%>" maxlength="4" onKeyUp="return tab5()" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_ayh_suami  class="boxdefault" onchange="jenis_wrk_suami_ayh.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Pelajar/Mahasiswa</option>
                                  <option value="2">2 - Mengurus Rumah Tangga</option>
                                  <option value="3">3 - Pensiunan</option>
                                  <option value="4">4 - Belum/Tidak Bekerja</option>
                                  <option value="5">5 - Petani/Pekebun</option>
                                  <option value="6">6 - Peternak</option>
                                  <option value="7">7 - Nelayan/Perikanan</option>
                                  <option value="8">8 - Industri</option>
                                  <option value="9">9 - Konstruksi</option>
                                  <option value="10">10 - Perdagangan</option>
                                  <option value="11">11 - Transportasi</option>
                                  <option value="12">12 - Pegawai Negeri Sipil</option>
                                  <option value="13">13 - Tentara Nasional Indonesia</option>
                                  <option value="14">14 - Kepolisian R.I.</option>
                                  <option value="15">15 - Jasa Lainnya</option>
                                  <option value="16">16 - Lainnya</option>
                                </select>
                                <input type="hidden" name="jenis_wrk_suami_ayh">

                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="5">
<input type="text" name="alamat_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                RT<font color="#000099" class="asterish"> </font>
 <input type="text" name="rt_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getNoRt())%>"  size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ayh_suami)" >
                                RW
<input type="text" name="rw_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getNoRw())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ayh_suami)" >
                                Dusun/Kampung/Dukuh
<input type="text" name="dusun_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getDusun())%>" size="22" class="boxdefault" maxlength="40" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getKodePos())%>" size="5" class="boxdefault" maxlength="5" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ayh_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"":kawinData.getRecord1().getWniObj().getRecord3().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
       <td width="23%">
<input type="text" name="nama_prop_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ayh_suami%>">

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ayh_suami%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ayh_suami%>">
       </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ayh_suami%>">
                             </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
</div>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ayh_suami, "1")
form1.jenis_pkrjn_ayh_suami.options[<%=((kawinData.getRecord1().getWniObj().getRecord3()==null)?"0":kawinData.getRecord1().getWniObj().getRecord3().getJenisPkrjn())%>].selected=true

if("<%=request.getParameter("radiobutton")%>" == "Ada")
{
form1.radiobutton[0].checked=true
form1.radiobutton[1].disabled=true
form1.radiobutton1[0].checked=true
form1.radiobutton1[1].disabled=true
}
</script>

<%
int aga_idx=getAgamaIndex(((kawinData.getRecord1().getWniObj().getRecord3()==null)?"0":kawinData.getRecord1().getWniObj().getRecord3().getAgama()));
//System.out.println("AYAH SUAMI 1 aga_idx: "+aga_idx);

if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ayh_suami'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>

      <script language="javascript">
      document.all['agama_ayh_suami'].selectedIndex=6;
      </script>
    <%
    }
    %>

<%
//System.out.println("AFTER IncludeAyhSuami.html");
}
else if(request.getParameter("radiobutton1").equals("2"))
{
  if(kawinData.getRecord1().getWnaObj().getRecord3() != null) {
    if(nama_prop_ayh_suami==null || nama_prop_ayh_suami.trim().equals("")) nama_prop_ayh_suami = kawinData.getRecord1().getWnaObj().getRecord3().getNomor_prop();
    if(nama_kab_ayh_suami==null || nama_kab_ayh_suami.trim().equals("")) nama_kab_ayh_suami = kawinData.getRecord1().getWnaObj().getRecord3().getNomor_kab();
    if(nama_kec_ayh_suami==null || nama_kec_ayh_suami.trim().equals("")) nama_kec_ayh_suami = kawinData.getRecord1().getWnaObj().getRecord3().getNomor_kec();
    if(nama_kel_ayh_suami==null || nama_kel_ayh_suami.trim().equals("")) nama_kel_ayh_suami = kawinData.getRecord1().getWnaObj().getRecord3().getNomor_kel();
    //System.out.println("kawinData.getRecord1().getWnaObj().getRecord3(): "+kawinData.getRecord1().getWnaObj().getRecord3());
  }
%>

<% // ************** Data for Data Ayah dari Suami from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
    <h2 class="tab">Data Ayah dari Suami</h2>

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
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton" value="Ada" onClick="return radioValid()">
                                Ada<br>
                                <input type="radio" name="radiobutton" value="Tidak Ada" onClick="return radioValid1()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ayah dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">

                                <input type="radio" name="radiobutton1" value="1" onClick="return radioValid2();kw_suami_ayh.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton1" value="2" onClick="return radioValid3();kw_suami_ayh.value='2'">
                                WNA</td>
                   <input type="hidden" name="kw_suami_ayh" value="2">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh_dr_suami" value="<%=((request.getParameter("nik_ayh_dr_suami")==null)?"":request.getParameter("nik_ayh_dr_suami"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh_dr_suami)" onblur="validateWNAyah(form1.nik_ayh_dr_suami,form1.radiobutton1)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getNamaPertma().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ayh_suami)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=agama_ayh_suami boxdefault2 class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                   <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getTmpLhr().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ayh_suami)" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Tanggal Lahir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">

                             <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_suami_dd value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":getDD(kawinData.getRecord1().getWnaObj().getRecord3().getTglLhr()))%>" maxlength="2" onKeyUp="return tab3()" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_suami_mm value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":getMM(kawinData.getRecord1().getWnaObj().getRecord3().getTglLhr()))%>" maxlength="2" onKeyUp="return tab4()" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ayh_suami_yy value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":getYY(kawinData.getRecord1().getWnaObj().getRecord3().getTglLhr()))%>" maxlength="4" onKeyUp="return tab5()" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <select
                  class="boxdefault" name="jenis_pkrjn_ayh_suami" onchange="jenis_wrk_suami_ayh.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Trading and Industry</option>
                                  <option value="2">2 - Forestry</option>
                                  <option value="3">3 - Mining and Energy</option>
                                  <option value="4">4 - Public Work</option>
                                  <option value="5">5 - Farming</option>
                                  <option value="6">6 - Religion</option>
                                  <option value="7">7 - Bank and Financial</option>
                                  <option value="8">8 - Health and Society</option>
                                  <option value="9">9 - Tourism</option>
                                  <option value="10">10 - Transportation and Communication</option>
                                  <option value="11">11 - Culture and Education</option>
                                  <option value="12">12 - Others</option>
                                </select>
<input type="hidden" name="jenis_wrk_suami_ayh">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <input type="text" name="alamat_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="rt_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getNoRt().toString())%>"  size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ayh_suami)" >
                                RW
                                <input type="text" name="rw_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getNoRw().toString())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ayh_suami)" >
                                Dusun/Kampung/Dukuh
                                <input type="text" name="dusun_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getDusun())%>" size="22" class="boxdefault" maxlength="40" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getKodePos().toString())%>" size="5" class="boxdefault" maxlength="5" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ayh_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"":kawinData.getRecord1().getWnaObj().getRecord3().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ayh_suami%>">
                        </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
 <input type="text" name="nama_kab_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ayh_suami%>">
                             </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
 <input type="text" name="nama_kec_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ayh_suami%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ayh_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ayh_suami%>">
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
</div>
<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ayh_suami, "2")
form1.jenis_pkrjn_ayh_suami.options[<%=((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"0":kawinData.getRecord1().getWnaObj().getRecord3().getJenisPkrjn().toString())%>].selected=true
</script>

<%
int aga_idx=getAgamaIndex(((kawinData.getRecord1().getWnaObj().getRecord3()==null)?"0":kawinData.getRecord1().getWnaObj().getRecord3().getAgama()));
//System.out.println("AYAH SUAMI 2 aga_idx: "+aga_idx);
if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ayh_suami'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>
      <script language="javascript">
      document.all['agama_ayh_suami'].selectedIndex=6;
      </script>
<%
}
%>


<%} %>

<%
if(request.getParameter("radiobutton3").equals("1"))
{
  if(kawinData.getRecord1().getWniObj().getRecord2()!=null) {
    if(nama_prop_ibu_suami==null || nama_prop_ibu_suami.trim().equals("")) nama_prop_ibu_suami = kawinData.getRecord1().getWniObj().getRecord2().getNoProp().toString();
    if(nama_kab_ibu_suami==null || nama_kab_ibu_suami.trim().equals("")) nama_kab_ibu_suami = kawinData.getRecord1().getWniObj().getRecord2().getNoKab().toString();
    if(nama_kec_ibu_suami==null || nama_kec_ibu_suami.trim().equals("")) nama_kec_ibu_suami = kawinData.getRecord1().getWniObj().getRecord2().getNoKec().toString();
    if(nama_kel_ibu_suami==null || nama_kel_ibu_suami.trim().equals("")) nama_kel_ibu_suami = kawinData.getRecord1().getWniObj().getRecord2().getNoKel().toString();
  }

//System.out.println("BEFORE IncludeIbuSuami.html");
%>

<% // ************** Data for Data Ibu dari Suami from Biodata_Wni for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage3">
    <h2 class="tab">Data Ibu dari Suami</h2>

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
                              <td width="22%">NIK Ibu dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton2" value="Ada" onClick="return radioValid4()">
                                Ada<br>
                                <input type="radio" name="radiobutton2" value="Tidak Ada" onClick="return radioValid5()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton3" value="1" onClick="return radioValid6();kw_suami_ibu.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton3" value="2" onClick="return radioValid7();kw_suami_ibu.value='2'">
                                WNA</td>
              <input type="hidden" name="kw_suami_ibu" value="1">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu_dr_suami" size="17" value="<%=((request.getParameter("nik_ibu_dr_suami")==null)?"":request.getParameter("nik_ibu_dr_suami"))%>" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ibu_dr_suami)" onblur="validateWNIbu(form1.nik_ibu_dr_suami, form1.radiobutton3)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getNamaLgkp().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ibu_suami)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ibu_suami" class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getTmptLhr().toUpperCase())%>" size="22" class="boxdefault" maxlength="60">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_suami_dd value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":getDD(kawinData.getRecord1().getWniObj().getRecord2().getTglLhr()))%>" maxlength="2" onKeyUp="return tab6()" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_suami_mm value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":getMM(kawinData.getRecord1().getWniObj().getRecord2().getTglLhr()))%>" maxlength="2" onKeyUp="return tab7()" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ibu_suami_yy value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":getYY(kawinData.getRecord1().getWniObj().getRecord2().getTglLhr()))%>" maxlength="4" onKeyUp="return tab8()" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                 <select
                  name=jenis_pkrjn_ibu_suami boxdefault2 class="boxdefault" onchange="jenis_wrk_suami_ibu.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Pelajar/Mahasiswa</option>
                                    <option value="2">2 - Mengurus Rumah Tangga</option>
                                    <option value="3">3 - Pensiunan</option>
                                    <option value="4">4 - Belum/Tidak Bekerja</option>
                                    <option value="5">5 - Petani/Pekebun</option>
                                    <option value="6">6 - Peternak</option>
                                    <option value="7">7 - Nelayan/Perikanan</option>
                                    <option value="8">8 - Industri</option>
                                    <option value="9">9 - Konstruksi</option>
                                    <option value="10">10 - Perdagangan</option>
                                    <option value="11">11 - Transportasi</option>
                                    <option value="12">12 - Pegawai Negeri Sipil</option>
                                    <option value="13">13 - Tentara Nasional Indonesia</option>
                                    <option value="14">14 - Kepolisian R.I.</option>
                                    <option value="15">15 - Jasa Lainnya</option>
                                    <option value="16">16 - Lainnya</option>
                                  </select>
                                  <input type="hidden" name="jenis_wrk_suami_ibu">

                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <input type="text" name="alamat_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="rt_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getNoRt())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ibu_suami)" >
                                RW
                                <input type="text" name="rw_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getNoRw())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ibu_suami)" >
                                Dusun/Kampung/Dukuh
                                <input type="text" name="dusun_ibu_suami" size="22" class="boxdefault" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getDusun())%>" maxlength="40" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getKodePos())%>" size="5" class="boxdefault" maxlength="5" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ibu_suami" value="<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ibu_suami%>">
                              </td>
                              <td width="3%">&nbsp;</td>

                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ibu_suami%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ibu_suami%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                             <td width="26%">
<input type="text" name="nama_kel_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ibu_suami%>">
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
</div>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ibu_suami, "1")
form1.jenis_pkrjn_ibu_suami.options[<%=((kawinData.getRecord1().getWniObj().getRecord2()==null)?"0":kawinData.getRecord1().getWniObj().getRecord2().getJenisPkrjn())%>].selected=true

if("<%=request.getParameter("radiobutton2")%>" == "Ada")
{
form1.radiobutton2[0].checked=true
form1.radiobutton2[1].disabled=true
form1.radiobutton3[0].checked=true
form1.radiobutton3[1].disabled=true
}

</script>

<%
int aga_idx=getAgamaIndex(((kawinData.getRecord1().getWniObj().getRecord2()==null)?"":kawinData.getRecord1().getWniObj().getRecord2().getAgama()));

if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ibu_suami'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>
      <script language="javascript">
      document.all['agama_ibu_suami'].selectedIndex=6;
      </script>
<%
}
%>


<%//System.out.println("AFTER IncludeIbuSuami.html");
}

else if(request.getParameter("radiobutton3").equals("2"))
{
  if(kawinData.getRecord1().getWnaObj().getRecord2()!=null) {
    if(nama_prop_ibu_suami==null || nama_prop_ibu_suami.trim().equals("")) nama_prop_ibu_suami = kawinData.getRecord1().getWnaObj().getRecord2().getNoProp().toString();
    if(nama_kab_ibu_suami==null || nama_kab_ibu_suami.trim().equals("")) nama_kab_ibu_suami = kawinData.getRecord1().getWnaObj().getRecord2().getNoKab().toString();
    if(nama_kec_ibu_suami==null || nama_kec_ibu_suami.trim().equals("")) nama_kec_ibu_suami = kawinData.getRecord1().getWnaObj().getRecord2().getNoKec().toString();
    if(nama_kel_ibu_suami==null || nama_kel_ibu_suami.trim().equals("")) nama_kel_ibu_suami = kawinData.getRecord1().getWnaObj().getRecord2().getNoKel().toString();
    //System.out.println("kawinData.getRecord1().getWnaObj().getRecord2(): "+kawinData.getRecord1().getWnaObj().getRecord2());
  }


%>

<% // ************** Data for Data Ibu dari Suami from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage3">
    <h2 class="tab">Data Ibu dari Suami</h2>

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
                              <td width="22%">NIK Ibu dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton2" value="Ada" onClick="return radioValid4()">
                                Ada<br>
                                <input type="radio" name="radiobutton2" value="Tidak Ada" onClick="return radioValid5()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton3" value="1" onClick="return radioValid6();kw_suami_ibu.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton3" value="2" onClick="return radioValid7();kw_suami_ibu.value='2'">
                                WNA</td>
        <input type="hidden" name="kw_suami_ibu" value="2">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">

                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu_dr_suami" size="17" value="<%=((request.getParameter("nik_ibu_dr_suami")==null)?"":request.getParameter("nik_ibu_dr_suami"))%>" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ibu_dr_suami)" onblur="validateWNIbu(form1.nik_ibu_dr_suami, form1.radiobutton3)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getNamaPertma().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ibu_suami)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ibu_suami" class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getTmpLhr().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                   <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_suami_dd value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":getDD(kawinData.getRecord1().getWnaObj().getRecord2().getTglLhr()))%>" maxlength="2" onKeyUp="return tab6()" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_suami_mm value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":getMM(kawinData.getRecord1().getWnaObj().getRecord2().getTglLhr()))%>" maxlength="2" onKeyUp="return tab7()" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ibu_suami_yy value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":getYY(kawinData.getRecord1().getWnaObj().getRecord2().getTglLhr()))%>" maxlength="4" onKeyUp="return tab8()" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  class="boxdefault" name="jenis_pkrjn_ibu_suami"  onchange="jenis_wrk_suami_ibu.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Trading and Industry</option>
                                    <option value="2">2 - Forestry</option>
                                    <option value="3">3 - Mining and Energy</option>
                                    <option value="4">4 - Public Work</option>
                                    <option value="5">5 - Farming</option>
                                    <option value="6">6 - Religion</option>
                                    <option value="7">7 - Bank and Financial</option>
                                    <option value="8">8 - Health and Society</option>
                                    <option value="9">9 - Tourism</option>
                                    <option value="10">10 - Transportation and
                                    Communication</option>
                                    <option value="11">11 - Culture and Education</option>
                                    <option value="12">12 - Others</option>
                                  </select>
<input type="hidden" name="jenis_wrk_suami_ibu">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <input type="text" name="alamat_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="rt_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getNoRt())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ibu_suami)" >
                                RW
                                <input type="text" name="rw_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getNoRw())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ibu_suami)" >
                                Dusun/Kampung/Dukuh
                                <input type="text" name="dusun_ibu_suami" size="22" class="boxdefault" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getDusun())%>" maxlength="40" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getKodePos())%>" size="5" class="boxdefault" maxlength="5" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ibu_suami" value="<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ibu_suami%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ibu_suami%>">
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ibu_suami%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
 <input type="text" name="nama_kel_ibu_suami" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ibu_suami%>">

                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ibu_suami, "2")
form1.jenis_pkrjn_ibu_suami.options[<%=((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"0":kawinData.getRecord1().getWnaObj().getRecord2().getJenisPkrjn())%>].selected=true
if("<%=request.getParameter("radiobutton2")%>" == "Ada")
{
form1.radiobutton2[0].checked=true
form1.radiobutton2[1].disabled=true
form1.radiobutton3[1].checked=true
form1.radiobutton3[0].disabled=true
}
</script>

<%
int aga_idx=getAgamaIndex(((kawinData.getRecord1().getWnaObj().getRecord2()==null)?"":kawinData.getRecord1().getWnaObj().getRecord2().getAgama()));

if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ibu_suami'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>
      <script language="javascript">
      document.all['agama_ibu_suami'].selectedIndex=6;
      </script>
<%
}
%>


<%} %>

<% // ************** Data for Data Istri from Biodata_Wni for given NIK *************** %>

<%
//System.out.println("BEFORE kawinData.getRecord2().getWniObj().getRecord1():  "+kawinData.getRecord2().getWniObj().getRecord1());
if(kawinData.getRecord2().getWniObj().getRecord1() != null)
{
//System.out.println("kawinData.getRecord2().getWniObj().getRecord1(): "+kawinData.getRecord2().getWniObj().getRecord1());
session.setAttribute("nama_istri",kawinData.getRecord2().getWniObj().getRecord1().getNamaLgkp());
%>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage4">
    <h2 class="tab">Data Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"><input type="hidden" name="nama_istri" value="<%=kawinData.getRecord2().getWniObj().getRecord1().getNamaLgkp().toUpperCase()%>"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
<input type="hidden" name="kw_istri" value="1">
                                <p style="line-height: 100%">NIK Istri<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
 <input type="text" name="nik_istri" value="<%=((request.getParameter("nik_istri")==null)?"":request.getParameter("nik_istri"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_istri)" onblur="validateWNIstri(form1.nik_istri)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord2().getWniObj().getRecord1().getNoKk()==null)?"-":kawinData.getRecord2().getWniObj().getRecord1().getNoKk())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord2().getWniObj().getRecord1().getNamaLgkp()==null)?"-":kawinData.getRecord2().getWniObj().getRecord1().getNamaLgkp().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=pddk_akh_istri boxdefault2 class="boxdefault" onchange="pddk_istri.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Tidak Tamat SD/Sederajat</option>
                                  <option value="3">3 - Tamat SD/Sederajat</option>
                                  <option value="4">4 - SLTP/Sederajat</option>
                                  <option value="5">5 - SLTA/Sederajat</option>
                                  <option value="6">6 - Diploma I/II</option>
                                  <option value="7">7 - Akademi/Diploma III/S.
                                  Muda</option>
                                  <option value="8">8 - Diploma IV/Strata I</option>
                                  <option value="9">9 - Strata II</option>
                                  <option value="10">10 - Strata III</option>
                                </select>
                                <input type="hidden" name="pddk_istri">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5"><%=((kawinData.getRecord2().getWniObj().getRecord1().getAlamat()==null)?"":kawinData.getRecord2().getWniObj().getRecord1().getAlamat()+", ")%><br> <%=((kawinData.getRecord2().getWniObj().getRecord1().getNoRt()==null)?"":kawinData.getRecord2().getWniObj().getRecord1().getNoRt().toString()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord1().getNoRw()==null)?"":kawinData.getRecord2().getWniObj().getRecord1().getNoRw().toString()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord1().getDusun()==null)?"":kawinData.getRecord2().getWniObj().getRecord1().getDusun()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord1().getKodePos()==null)?"":kawinData.getRecord2().getWniObj().getRecord1().getKodePos()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord1().getTelp()==null)?"":kawinData.getRecord2().getWniObj().getRecord1().getTelp())%></td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
<%=((kawinData.getRecord2().getWniObj().getRecord1().getAgama()==null)?"-":kawinData.getRecord2().getWniObj().getRecord1().getAgama())%>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_istri boxdefault2 class="boxdefault" onchange="jenis_wrk_istri.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Pelajar/Mahasiswa</option>
                                  <option value="2">2 - Mengurus Rumah Tangga</option>
                                  <option value="3">3 - Pensiunan</option>
                                  <option value="4">4 - Belum/Tidak Bekerja</option>
                                  <option value="5">5 - Petani/Pekebun</option>
                                  <option value="6">6 - Peternak</option>
                                  <option value="7">7 - Nelayan/Perikanan</option>
                                  <option value="8">8 - Industri</option>
                                  <option value="9">9 - Konstruksi</option>
                                  <option value="10">10 - Perdagangan</option>
                                  <option value="11">11 - Transportasi</option>
                                  <option value="12">12 - Pegawai Negeri Sipil</option>
                                  <option value="13">13 - Tentara Nasional Indonesia</option>
                                  <option value="14">14 - Kepolisian R.I.</option>
                                  <option value="15">15 - Jasa Lainnya</option>
                                  <option value="16">16 - Lainnya</option>
                                </select>
                                <input type="hidden" name="jenis_wrk_istri">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="ktrunan_istri" class="boxdefault">
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%">
<%=((kawinData.getRecord2().getWniObj().getRecord1().getStatKwn()==null)?"-":getClAktaStatusKawin(kawinData.getRecord2().getWniObj().getRecord1().getStatKwn()))%>
<input type="hidden" name="stat_sebel_istri"
value="<%=((kawinData.getRecord2().getWniObj().getRecord1().getStatKwn()==null)?"":getClAktaStatusKawin(kawinData.getRecord2().getWniObj().getRecord1().getStatKwn()))%>">
</td>
                            </tr>
                            <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kwn_ke_istri" <%if(request.getParameter("kwn_ke_istri")!=null){%>value="<%=request.getParameter("kwn_ke_istri")%>"<%}%> size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_istri)">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="26%">WNI</td>
                            </tr>
                            <tr>
                              <td width="22%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">&nbsp;</td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_istri, "1")
form1.pddk_akh_istri.options[<%=kawinData.getRecord2().getWniObj().getRecord1().getPddkAkh()%>].selected=true
form1.jenis_pkrjn_istri.options[<%=kawinData.getRecord2().getWniObj().getRecord1().getJenisPkrjn()%>].selected=true
<%if(request.getParameter("ktrunan_istri")!=null)
{%>
form1.ktrunan_istri.options[<%=request.getParameter("ktrunan_istri")%>].selected=true
<%}%>
</script>
  </div>


<%}

else if(kawinData.getRecord2().getWnaObj().getRecord1() != null)
{
//System.out.println("kawinData.getRecord2().getWnaObj().getRecord1(): "+kawinData.getRecord2().getWnaObj().getRecord1());
session.setAttribute("nama_istri",kawinData.getRecord2().getWnaObj().getRecord1().getNamaPertma());
%>

<% // ************** Data for Data Istri from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage4">
    <h2 class="tab">Data Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"><input type="hidden" name="nama_istri" value="<%=kawinData.getRecord2().getWnaObj().getRecord1().getNamaPertma().toUpperCase()%>"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
<input type="hidden" name="kw_istri" value="2">
                              <td width="22%">
                                <p style="line-height: 100%">NIK Istri<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_istri" value="<%=((request.getParameter("nik_istri")==null)?"":request.getParameter("nik_istri"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_istri)" onblur="validateWNIstri(form1.nik_istri)">
                                  <b><b> </b></b></p>
                              </td>



                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord2().getWnaObj().getRecord1().getNoKk()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord1().getNoKk())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord2().getWnaObj().getRecord1().getNamaPertma()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord1().getNamaPertma().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  class="boxdefault" name="pddk_akh_istri"  onchange="pddk_istri.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Pendidikan Terakhir
                                  --</option>
                                  <option value="1">1 - ELementary</option>
                                  <option value="2">2 - Junior Height School</option>
                                  <option value="3">3 - Senior Hight School</option>
                                  <option value="4">4 - Diploma</option>
                                  <option value="5">5 - Bachelor</option>
                                  <option value="6">6 - Master</option>
                                  <option value="7">7 - Philosophy of Doctor</option>
                                  <option value="8">8 - Others</option>
                                </select>
<input type="hidden" name="pddk_istri">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5"><%=((kawinData.getRecord2().getWnaObj().getRecord1().getAlamat()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord1().getAlamat()+", ")%><br>
                                <%=((kawinData.getRecord2().getWnaObj().getRecord1().getNoRt()==null)?"":kawinData.getRecord2().getWnaObj().getRecord1().getNoRt().toString()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord1().getNoRw()==null)?"":kawinData.getRecord2().getWnaObj().getRecord1().getNoRw().toString()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord1().getDusun()==null)?"":kawinData.getRecord2().getWnaObj().getRecord1().getDusun()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord1().getKodePos()==null)?"":kawinData.getRecord2().getWnaObj().getRecord1().getKodePos()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord1().getTelp()==null)?"":kawinData.getRecord2().getWnaObj().getRecord1().getTelp())%></td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%"> <%=((kawinData.getRecord2().getWnaObj().getRecord1().getAgama()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord1().getAgama())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  class="boxdefault" name="jenis_pkrjn_istri"  onchange="jenis_wrk_istri.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Trading and Industry</option>
                                  <option value="2">2 - Forestry</option>
                                  <option value="3">3 - Mining and Energy</option>
                                  <option value="4">4 - Public Work</option>
                                  <option value="5">5 - Farming</option>
                                  <option value="6">6 - Religion</option>
                                  <option value="7">7 - Bank and Financial</option>
                                  <option value="8">8 - Health and Society</option>
                                  <option value="9">9 - Tourism</option>
                                  <option value="10">10 - Transportation and Communication</option>
                                  <option value="11">11 - Culture and Education</option>
                                  <option value="12">12 - Others</option>
          </select>
<input type="hidden" name="jenis_wrk_istri">
                              </td>
                            </tr>
                            <tr>

                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="ktrunan_istri" class="boxdefault">
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%"> <%=((kawinData.getRecord2().getWnaObj().getRecord1().getStatKwn()==null)?"-":getClAktaStatusKawin(kawinData.getRecord2().getWnaObj().getRecord1().getStatKwn()))%>
                                <input type="hidden" name="stat_sebel_istri"
value="<%=((kawinData.getRecord2().getWnaObj().getRecord1().getStatKwn()==null)?"":getClAktaStatusKawin(kawinData.getRecord2().getWnaObj().getRecord1().getStatKwn()))%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kwn_ke_istri" <%if(request.getParameter("kwn_ke_istri")!=null){%>value="<%=request.getParameter("kwn_ke_istri")%>"<%}%> size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_istri)">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="26%">WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord2().getWnaObj().getRecord1().getKwrngrn()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord1().getKwrngrn().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">&nbsp;</td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_istri, "2")
form1.pddk_akh_istri.options[<%=kawinData.getRecord2().getWnaObj().getRecord1().getPddkAkh()%>].selected=true
form1.jenis_pkrjn_istri.options[<%=kawinData.getRecord2().getWnaObj().getRecord1().getJenisPkrjn()%>].selected=true
<%if(request.getParameter("ktrunan_istri")!=null)
{%>
form1.ktrunan_istri.options[<%=request.getParameter("ktrunan_istri")%>].selected=true
<%}%>
</script>
  </div>

<%}  else {%>
 <div class="tab-page" name="t1" style="postion:absolute" id="tabPage4">
    <h2 class="tab">Data Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"><input type="hidden" name="nama_istri" value=""> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
<input type="hidden" name="kw_istri" value="2">
                              <td width="22%">
                                <p style="line-height: 100%">NIK Istri<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_istri" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_istri)" value="<%=((request.getParameter("nik_istri")==null)?"":request.getParameter("nik_istri"))%>" onblur="validateWNIstri(form1.nik_istri)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  class="boxdefault" name="pddk_akh_istri"  disabled>
                                  <option value="0" selected>-- Pilih Pendidikan Terakhir
                                  --</option>
                                </select>
<input type="hidden" name="pddk_istri">

                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">-<br>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%"> -</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  class="boxdefault" name="jenis_pkrjn_istri"  disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
          </select>
<input type="hidden" name="jenis_wrk_istri">
                              </td>
                            </tr>
                            <tr>

                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="ktrunan_istri" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%"> -
<input type="hidden" name="stat_sebel_istri" value="">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kwn_ke_istri"  size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                            <tr>
                              <td width="22%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">&nbsp;</td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
<%}%>

<%  if(request.getParameter("radiobutton5").equals("1"))
{
  //System.out.println("kawinData.getRecord2().getWniObj().getRecord3(): "+kawinData.getRecord2().getWniObj().getRecord3());
  if(kawinData.getRecord2().getWniObj().getRecord3() != null) {
    if(nama_prop_ayh_istri==null || nama_prop_ayh_istri.trim().equals("")) nama_prop_ayh_istri = kawinData.getRecord2().getWniObj().getRecord3().getNoProp().toString();
    if(nama_kab_ayh_istri==null || nama_kab_ayh_istri.trim().equals("")) nama_kab_ayh_istri = kawinData.getRecord2().getWniObj().getRecord3().getNoKab().toString();
    if(nama_kec_ayh_istri==null || nama_kec_ayh_istri.trim().equals("")) nama_kec_ayh_istri = kawinData.getRecord2().getWniObj().getRecord3().getNoKec().toString();
    if(nama_kel_ayh_istri==null || nama_kel_ayh_istri.trim().equals("")) nama_kel_ayh_istri = kawinData.getRecord2().getWniObj().getRecord3().getNoKel().toString();
  }
%>

<% // ************** Data for Data Ayah dari Istri from Biodata_Wni for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage5">
    <h2 class="tab">Data Ayah dari Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>
                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah dari Istri<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton4" value="Ada"  onClick="return radioValid8()">
                                Ada<br>
                                <input type="radio" name="radiobutton4" value="Tidak Ada"  onClick="return radioValid9()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p>Warga Negara Ayah dari Istri<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">

                                <input type="radio" name="radiobutton5" value="1"  onClick="return radioValid10();kw_istri_ayh.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton5" value="2"  onClick="return radioValid11();kw_istri_ayh.value='2'">
                                WNA</td>
                  <input type="hidden" name="kw_istri_ayh" value="1">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh_dr_istri" value="<%=((request.getParameter("nik_ayh_dr_istri")==null)?"":request.getParameter("nik_ayh_dr_istri"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh_dr_istri)" onblur="validateWNAyah(form1.nik_ayh_dr_istri,form1.radiobutton5)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getNamaLgkp().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ayh_istri)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ayh_istri" class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getTmptLhr().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ayh_istri)" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                            <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_istri_dd value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":getDD(kawinData.getRecord2().getWniObj().getRecord3().getTglLhr()))%>" onKeyUp="return tab33()" maxlength="2" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_istri_mm value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":getMM(kawinData.getRecord2().getWniObj().getRecord3().getTglLhr()))%>" onKeyUp="return tab44()" maxlength="2" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ayh_istri_yy value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":getYY(kawinData.getRecord2().getWniObj().getRecord3().getTglLhr()))%>" onKeyUp="return tab55()"  maxlength="4" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  name=jenis_pkrjn_ayh_istri boxdefault2 class="boxdefault" onchange="jenis_wrk_istri_ayh.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Pelajar/Mahasiswa</option>
                                    <option value="2">2 - Mengurus Rumah Tangga</option>
                                    <option value="3">3 - Pensiunan</option>
                                    <option value="4">4 - Belum/Tidak Bekerja</option>
                                    <option value="5">5 - Petani/Pekebun</option>
                                    <option value="6">6 - Peternak</option>
                                    <option value="7">7 - Nelayan/Perikanan</option>
                                    <option value="8">8 - Industri</option>
                                    <option value="9">9 - Konstruksi</option>
                                    <option value="10">10 - Perdagangan</option>
                                    <option value="11">11 - Transportasi</option>
                                    <option value="12">12 - Pegawai Negeri Sipil</option>
                                    <option value="13">13 - Tentara Nasional Indonesia</option>
                                    <option value="14">14 - Kepolisian R.I.</option>
                                    <option value="15">15 - Jasa Lainnya</option>
                                    <option value="16">16 - Lainnya</option>
                                  </select>
                                  <input type="hidden" name="jenis_wrk_istri_ayh">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="rt_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getNoRt())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ayh_istri)" >
                                  RW
                                  <input type="text" name="rw_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getNoRw())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ayh_istri)" >
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getDusun())%>" size="22" class="boxdefault" maxlength="40" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">

                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getKodePos())%>" size="5" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kpos_ayh_istri)" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ayh_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"":kawinData.getRecord2().getWniObj().getRecord3().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ayh_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ayh_istri%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ayh_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ayh_istri%>">
                              </td>
                            </tr>
</table>
                        </td>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ayh_istri, "1")
form1.jenis_pkrjn_ayh_istri.options[<%=((kawinData.getRecord2().getWniObj().getRecord3()==null)?"0":kawinData.getRecord2().getWniObj().getRecord3().getJenisPkrjn())%>].selected=true

if("<%=request.getParameter("radiobutton4")%>" == "Ada")
{
form1.radiobutton4[0].checked=true
form1.radiobutton4[1].disabled=true
form1.radiobutton5[0].checked=true
form1.radiobutton5[1].disabled=true
}
</script>
<%
int aga_idx=getAgamaIndex(((kawinData.getRecord2().getWniObj().getRecord3()==null)?"0":kawinData.getRecord2().getWniObj().getRecord3().getAgama()));

if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ayh_istri'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>
      <script language="javascript">
      document.all['agama_ayh_istri'].selectedIndex=6;
      </script>
<%
}
%>


      </tr>
              <%//System.out.println("REQUEST radiobutton4= "+request.getParameter("radiobutton4"));%>
    </table>
</div>




<%}

else if(kawinData.getRecord2().getWnaObj().getRecord3() != null || request.getParameter("radiobutton5").equals("2"))
{
  if(kawinData.getRecord2().getWnaObj().getRecord3() != null) {
    if(nama_prop_ayh_istri==null || nama_prop_ayh_istri.trim().equals("")) nama_prop_ayh_istri = kawinData.getRecord2().getWnaObj().getRecord3().getNomor_prop();
    if(nama_kab_ayh_istri==null || nama_kab_ayh_istri.trim().equals("")) nama_kab_ayh_istri = kawinData.getRecord2().getWnaObj().getRecord3().getNomor_kab();
    if(nama_kec_ayh_istri==null || nama_kec_ayh_istri.trim().equals("")) nama_kec_ayh_istri = kawinData.getRecord2().getWnaObj().getRecord3().getNomor_kec();
    if(nama_kel_ayh_istri==null || nama_kel_ayh_istri.trim().equals("")) nama_kel_ayh_istri = kawinData.getRecord2().getWnaObj().getRecord3().getNomor_kel();

    //System.out.println("kawinData.getRecord2().getWnaObj().getRecord3(): "+kawinData.getRecord2().getWnaObj().getRecord3());
  }
%>

<% // ************** Data for Data Ayah dari Istri from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage5">
    <h2 class="tab">Data Ayah dari Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah dari Istri<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton4" value="Ada"  onClick="return radioValid8()">
                                Ada<br>
                                <input type="radio" name="radiobutton4" value="Tidak Ada"  onClick="return radioValid9()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p>Warga Negara Ayah dari Istri<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
          <input type="radio" name="radiobutton5" value="1"  onClick="return radioValid10();kw_istri_ayh.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton5" value="2"  onClick="return radioValid11();kw_istri_ayh.value='2'">
                                WNA</td>
                  <input type="hidden" name="kw_istri_ayh" value="2">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh_dr_istri" value="<%=((request.getParameter("nik_ayh_dr_istri")==null)?"":request.getParameter("nik_ayh_dr_istri"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh_dr_istri)" onblur="validateWNAyah(form1.nik_ayh_dr_istri,form1.radiobutton5)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getNamaPertma().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ayh_istri)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ayh_istri" class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getTmpLhr().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ayh_istri)" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                              <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_istri_dd value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":getDD(kawinData.getRecord2().getWnaObj().getRecord3().getTglLhr()))%>" maxlength="2" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_istri_mm value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":getMM(kawinData.getRecord2().getWnaObj().getRecord3().getTglLhr()))%>" maxlength="2" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ayh_istri_yy value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":getYY(kawinData.getRecord2().getWnaObj().getRecord3().getTglLhr()))%>"  maxlength="4" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  class="boxdefault" name="jenis_pkrjn_ayh_istri"  onchange="jenis_wrk_istri_ayh.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Trading and Industry</option>
                                    <option value="2">2 - Forestry</option>
                                    <option value="3">3 - Mining and Energy</option>
                                    <option value="4">4 - Public Work</option>
                                    <option value="5">5 - Farming</option>
                                    <option value="6">6 - Religion</option>
                                    <option value="7">7 - Bank and Financial</option>
                                    <option value="8">8 - Health and Society</option>
                                    <option value="9">9 - Tourism</option>
                                    <option value="10">10 - Transportation and
                                    Communication</option>
                                    <option value="11">11 - Culture and Education</option>
                                    <option value="12">12 - Others</option>
                                  </select>
<input type="hidden" name="jenis_wrk_istri_ayh">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="rt_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getNoRt().toString())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ayh_istri)" >
                                  RW
                                  <input type="text" name="rw_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getNoRw().toString())%>" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ayh_istri)" >
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getDusun())%>" size="22" class="boxdefault" maxlength="40" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getKodePos().toString())%>" size="5" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kpos_ayh_istri)" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ayh_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"":kawinData.getRecord2().getWnaObj().getRecord3().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ayh_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>

                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ayh_istri%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ayh_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ayh_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ayh_istri%>">
                              </td>
                            </tr>
                          </table>
                        </td>
       </tr>
 </table>
 </div>

<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ayh_istri, "2")
form1.jenis_pkrjn_ayh_istri.options[<%=((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"0":kawinData.getRecord2().getWnaObj().getRecord3().getJenisPkrjn().toString())%>].selected=true

 if("<%=request.getParameter("radiobutton4")%>" == "Ada")
   {
form1.radiobutton4[0].checked=true
form1.radiobutton4[1].disabled=true
form1.radiobutton5[1].checked=true
form1.radiobutton5[0].disabled=true
  }
</script>

<%
int aga_idx=getAgamaIndex(((kawinData.getRecord2().getWnaObj().getRecord3()==null)?"0":kawinData.getRecord2().getWnaObj().getRecord3().getAgama()));

if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ayh_istri'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>

      <script language="javascript">
      document.all['agama_ayh_istri'].selectedIndex=6;
      </script>
<%
}
%>



<%} %>

<%
if(request.getParameter("radiobutton7").equals("1"))
{
  if(kawinData.getRecord2().getWniObj().getRecord2() != null) {
    //System.out.println("kawinData.getRecord2().getWniObj().getRecord2(): "+kawinData.getRecord2().getWniObj().getRecord2());
    if(nama_prop_ibu_istri==null || nama_prop_ibu_istri.trim().equals("")) nama_prop_ibu_istri = kawinData.getRecord2().getWniObj().getRecord2().getNoProp().toString();
    if(nama_kab_ibu_istri==null || nama_kab_ibu_istri.trim().equals("")) nama_kab_ibu_istri = kawinData.getRecord2().getWniObj().getRecord2().getNoKab().toString();
    if(nama_kec_ibu_istri==null || nama_kec_ibu_istri.trim().equals("")) nama_kec_ibu_istri = kawinData.getRecord2().getWniObj().getRecord2().getNoKec().toString();
    if(nama_kel_ibu_istri==null || nama_kel_ibu_istri.trim().equals("")) nama_kel_ibu_istri = kawinData.getRecord2().getWniObj().getRecord2().getNoKel().toString();
  }
%>

<% // ************** Data for Data Ibu dari Istri from Biodata_Wni for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage6">
    <h2 class="tab">Data Ibu dari Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ibu dari Istri<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton6" value="Ada" onClick="return radioValid12()">
                                Ada<br>
                                <input type="radio" name="radiobutton6" value="Tidak Ada" onClick="return radioValid13()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p>Warga Negara Ibu dari Istri<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton7" value="1" onClick="return radioValid14();kw_istri_ibu.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton7" value="2" onClick="return radioValid15();kw_istri_ibu.value='2'">
                                WNA</td>
                  <input type="hidden" name="kw_istri_ibu" value="1">


                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu_dr_istri" value="<%=((request.getParameter("nik_ibu_dr_istri")==null)?"":request.getParameter("nik_ibu_dr_istri"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ibu_dr_istri)" onblur="validateWNIbu(form1.nik_ibu_dr_istri,form1.radiobutton7)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getNamaLgkp())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ibu_istri)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ibu_istri" class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>

              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ibu_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getTmptLhr())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ibu_istri)" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">

                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_istri_dd value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":getDD(kawinData.getRecord2().getWniObj().getRecord2().getTglLhr()))%>" maxlength="2" onKeyUp="return tab9()" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_istri_mm maxlength="2" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":getMM(kawinData.getRecord2().getWniObj().getRecord2().getTglLhr()))%>" onKeyUp="return tab10()" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ibu_istri_yy maxlength="4" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":getYY(kawinData.getRecord2().getWniObj().getRecord2().getTglLhr()))%>" onKeyUp="return tab11()" >
                                    </td>
                                  </tr>
                                </table>

                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  name=jenis_pkrjn_ibu_istri boxdefault2 class="boxdefault" onchange="jenis_wrk_istri_ibu.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Pelajar/Mahasiswa</option>
                                    <option value="2">2 - Mengurus Rumah Tangga</option>
                                    <option value="3">3 - Pensiunan</option>
                                    <option value="4">4 - Belum/Tidak Bekerja</option>
                                    <option value="5">5 - Petani/Pekebun</option>
                                    <option value="6">6 - Peternak</option>
                                    <option value="7">7 - Nelayan/Perikanan</option>
                                    <option value="8">8 - Industri</option>
                                    <option value="9">9 - Konstruksi</option>
                                    <option value="10">10 - Perdagangan</option>
                                    <option value="11">11 - Transportasi</option>
                                    <option value="12">12 - Pegawai Negeri Sipil</option>
                                    <option value="13">13 - Tentara Nasional Indonesia</option>
                                    <option value="14">14 - Kepolisian R.I.</option>
                                    <option value="15">15 - Jasa Lainnya</option>
                                    <option value="16">16 - Lainnya</option>
                                  </select>
                                  <input type="hidden" name="jenis_wrk_istri_ibu">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
<%
//System.out.println("#kawinData.getRecord2().getWniObj().getRecord2().getAlamat(): "+((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getAlamat()));
//System.out.println("#kawinData.getRecord2().getWniObj().getRecord2().getNoRt(): "+((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getNoRt()));
//System.out.println("#kawinData.getRecord2().getWniObj().getRecord2().getNoRw(): "+((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getNoRw()));
%>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ibu_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="rt_ibu_istri" size="3" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getNoRt())%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ibu_istri)" >
                                  RW
                                  <input type="text" name="rw_ibu_istri" size="3" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getNoRw())%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ibu_istri)" >
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ibu_istri" size="22" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getDusun())%>" class="boxdefault" maxlength="40" >
                                </p>
    <script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ibu_istri, "1")
     form1.jenis_pkrjn_ibu_istri.options[<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"0":kawinData.getRecord2().getWniObj().getRecord2().getJenisPkrjn())%>].selected=true
 if("<%=request.getParameter("radiobutton6")%>" == "Ada")
 {
form1.radiobutton6[0].checked=true
form1.radiobutton6[1].disabled=true
form1.radiobutton7[0].checked=true
form1.radiobutton7[1].disabled=true
 }
</script>
 <%
  int aga_idx=getAgamaIndex(((kawinData.getRecord2().getWniObj().getRecord2()==null)?"0":kawinData.getRecord2().getWniObj().getRecord2().getAgama()));
  if (aga_idx<=5)
   {
%>
      <script language="javascript">
      document.all['agama_ibu_istri'].selectedIndex="<%=aga_idx%>";
      </script>
<%
  }
else
    {
%>
      <script language="javascript">
      document.all['agama_ibu_istri'].selectedIndex=6;
      </script>
<%
}
%>
                    </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ibu_istri" size="5" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getKodePos())%>" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kpos_ibu_istri)" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>

                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ibu_istri" value="<%=((kawinData.getRecord2().getWniObj().getRecord2()==null)?"":kawinData.getRecord2().getWniObj().getRecord2().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
 <input type="text" name="nama_prop_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ibu_istri%>">
                            </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ibu_istri%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ibu_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ibu_istri%>">
                              </td>
                            </tr>
                          </table>
                        </td>
</tr></table>
</div>




<%
}

else if(request.getParameter("radiobutton7").equals("2"))
{
  if(kawinData.getRecord2().getWnaObj().getRecord2() != null) {
    if(nama_prop_ibu_istri==null || nama_prop_ibu_istri.trim().equals("")) nama_prop_ibu_istri = kawinData.getRecord2().getWnaObj().getRecord2().getNoProp().toString();
    if(nama_kab_ibu_istri==null || nama_kab_ibu_istri.trim().equals("")) nama_kab_ibu_istri = kawinData.getRecord2().getWnaObj().getRecord2().getNoKab().toString();
    if(nama_kec_ibu_istri==null || nama_kec_ibu_istri.trim().equals("")) nama_kec_ibu_istri = kawinData.getRecord2().getWnaObj().getRecord2().getNoKec().toString();
    if(nama_kel_ibu_istri==null || nama_kel_ibu_istri.trim().equals("")) nama_kel_ibu_istri = kawinData.getRecord2().getWnaObj().getRecord2().getNoKel().toString();

    //System.out.println("kawinData.getRecord2().getWnaObj().getRecord2(): "+kawinData.getRecord2().getWnaObj().getRecord2());
  }
%>

<% // ************** Data for Data Ibu dari Istri from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage6">
    <h2 class="tab">Data Ibu dari Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ibu dari Istri<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton6" value="Ada" onClick="return radioValid12()">
                                Ada<br>
                                <input type="radio" name="radiobutton6" value="Tidak Ada" onClick="return radioValid13()">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p>Warga Negara Ibu dari Istri<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                              <input type="radio" name="radiobutton7" value="1" onClick="return radioValid14();kw_istri_ibu.value='1'">
                                WNI<br>
                                <input type="radio" name="radiobutton7" value="2" onClick="return radioValid15();kw_istri_ibu.value='2'">
                                WNA</td>
                  <input type="hidden" name="kw_istri_ibu" value="2">
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu_dr_istri" value="<%=((request.getParameter("nik_ibu_dr_istri")==null)?"":request.getParameter("nik_ibu_dr_istri"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ibu_dr_istri)" onblur="validateWNIbu(form1.nik_ibu_dr_istri,form1.radiobutton7)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getNamaPertma().toUpperCase())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ibu_istri)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ibu_istri" class="boxdefault">
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="Islam">Islam</option>
                                  <option value="Kristen">Kristen</option>
                                  <option value="Katholik">Katholik</option>
                                  <option value="Hindu">Hindu</option>
                                  <option value="Budha">Budha</option>
                                  <option value="Lainnya">Lainnya</option>
                                </select>


                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ibu_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getTmpLhr())%>" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ibu_istri)" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
             <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_istri_dd value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":getDD(kawinData.getRecord2().getWnaObj().getRecord2().getTglLhr()))%>" maxlength="2" onKeyUp="return tab9()" >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_istri_mm maxlength="2" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":getMM(kawinData.getRecord2().getWnaObj().getRecord2().getTglLhr()))%>" onKeyUp="return tab10()" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ibu_istri_yy maxlength="4" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":getYY(kawinData.getRecord2().getWnaObj().getRecord2().getTglLhr()))%>" onKeyUp="return tab11()" >
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  class="boxdefault" name="jenis_pkrjn_ibu_istri"  onchange="jenis_wrk_istri_ibu.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Trading and Industry</option>
                                    <option value="2">2 - Forestry</option>
                                    <option value="3">3 - Mining and Energy</option>
                                    <option value="4">4 - Public Work</option>
                                    <option value="5">5 - Farming</option>
                                    <option value="6">6 - Religion</option>
                                    <option value="7">7 - Bank and Financial</option>
                                    <option value="8">8 - Health and Society</option>
                                    <option value="9">9 - Tourism</option>
                                    <option value="10">10 - Transportation and
                                    Communication</option>
                                    <option value="11">11 - Culture and Education</option>
                                    <option value="12">12 - Others</option>
                                  </select>
<input type="hidden" name="jenis_wrk_istri_ibu">
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ibu_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getAlamat())%>" size="30" class="boxdefault" maxlength="120" >
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="rt_ibu_istri" size="3" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getNoRt())%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ibu_istri)" >
                                  RW
                                  <input type="text" name="rw_ibu_istri" size="3" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getNoRw())%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ibu_istri)" >
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ibu_istri" size="22" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getDusun())%>" class="boxdefault" maxlength="40" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ibu_istri" size="5" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getKodePos())%>" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kpos_ibu_istri)" >
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ibu_istri" value="<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"":kawinData.getRecord2().getWnaObj().getRecord2().getTelp())%>" size="20" class="boxdefault" maxlength="20" >
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_prop_ibu_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kab_ibu_istri%>">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kec_ibu_istri%>">
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ibu_istri" size="30" class="boxdefault" maxlength="120" value="<%=nama_kel_ibu_istri%>">
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
</div>
<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_ibu_istri, "2")
form1.jenis_pkrjn_ibu_istri.options[<%=((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"0":kawinData.getRecord2().getWnaObj().getRecord2().getJenisPkrjn())%>].selected=true

if("<%=request.getParameter("radiobutton6")%>" == "Ada")
{
form1.radiobutton6[0].checked=true
form1.radiobutton6[1].disabled=true
form1.radiobutton7[1].checked=true
form1.radiobutton7[0].disabled=true
}

</script>
<%
int aga_idx=getAgamaIndex(((kawinData.getRecord2().getWnaObj().getRecord2()==null)?"0":kawinData.getRecord2().getWnaObj().getRecord2().getAgama()));

if (aga_idx<=5)
         {
%>
      <script language="javascript">
      document.all['agama_ibu_istri'].selectedIndex="<%=aga_idx%>";
      </script>
 <%
    }
else
    {
%>
      <script language="javascript">
      document.all['agama_ibu_istri'].selectedIndex=6;
      </script>
<%
}
%>



<% } %>


<% // ************** Data for Saksi1 from Biodata_Wni for given NIK *************** %>

<%
if(kawinData.getRecord1().getWniObj().getRecord4() != null)
{
//System.out.println("BEFORE IncludeSaksi11.html");
%>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage7">
                    <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
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
                              <td width="22%">
<input type="hidden" name="kw_saksi1" value="1">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" value="<%=((request.getParameter("nik_sksi1")==null)?"":request.getParameter("nik_sksi1"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord1().getWniObj().getRecord4().getNamaLgkp()==null)?"-":kawinData.getRecord1().getWniObj().getRecord4().getNamaLgkp().toUpperCase())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord1().getWniObj().getRecord4().getTmptLhr()==null)?"-":kawinData.getRecord1().getWniObj().getRecord4().getTmptLhr().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=((kawinData.getRecord1().getWniObj().getRecord4().getTglLhr()==null)?"-":kawinData.getRecord1().getWniObj().getRecord4().getTglLhr())%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%"><%=((kawinData.getRecord1().getWniObj().getRecord4().getAlamat()==null)?"-":kawinData.getRecord1().getWniObj().getRecord4().getAlamat()+", ")%><br>
                                  <%=((kawinData.getRecord1().getWniObj().getRecord4().getNoRt()==null)?"":kawinData.getRecord1().getWniObj().getRecord4().getNoRt().toString()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord4().getNoRw()==null)?"":kawinData.getRecord1().getWniObj().getRecord4().getNoRw().toString()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord4().getDusun()==null)?"":kawinData.getRecord1().getWniObj().getRecord4().getDusun()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord4().getKodePos()==null)?"":kawinData.getRecord1().getWniObj().getRecord4().getKodePos()+", ")%><%=((kawinData.getRecord1().getWniObj().getRecord4().getTelp()==null)?"":kawinData.getRecord1().getWniObj().getRecord4().getTelp())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord1().getWniObj().getRecord4().getAgama()==null)?"-":kawinData.getRecord1().getWniObj().getRecord4().getAgama().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">


                                  <select
                     name=jenis_pkrjn_s1 boxdefault2 class="boxdefault"  onchange="jenis_wrk_saksi1.value=this.options[this.selectedIndex].value">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
                                    <option value="1">1 - Pelajar/Mahasiswa</option>
                                    <option value="2">2 - Mengurus Rumah Tangga</option>
                                    <option value="3">3 - Pensiunan</option>
                                    <option value="4">4 - Belum/Tidak Bekerja</option>
                                    <option value="5">5 - Petani/Pekebun</option>
                                    <option value="6">6 - Peternak</option>
                                    <option value="7">7 - Nelayan/Perikanan</option>
                                    <option value="8">8 - Industri</option>
                                    <option value="9">9 - Konstruksi</option>
                                    <option value="10">10 - Perdagangan</option>
                                    <option value="11">11 - Transportasi</option>
                                    <option value="12">12 - Pegawai Negeri Sipil</option>
                                    <option value="13">13 - Tentara Nasional Indonesia</option>
                                    <option value="14">14 - Kepolisian R.I.</option>
                                    <option value="15">15 - Jasa Lainnya</option>
                                    <option value="16">16 - Lainnya</option>
                                  </select>
                                <input type="hidden" name="jenis_wrk_saksi1">



<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_s1, "1")
  form1.jenis_pkrjn_s1.options[<%=((kawinData.getRecord1().getWniObj().getRecord4().getJenisPkrjn()==null)?"0":kawinData.getRecord1().getWniObj().getRecord4().getJenisPkrjn().toString())%>].selected=true
</script>

                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%
//System.out.println("AFTER IncludeSaksi11.html");
}
else if(kawinData.getRecord1().getWnaObj().getRecord4() != null)
{
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord4(): "+kawinData.getRecord1().getWnaObj().getRecord4());
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord4().getNamaPertma(): "+kawinData.getRecord1().getWnaObj().getRecord4().getNamaPertma());
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord4().getAgama(): "+kawinData.getRecord1().getWnaObj().getRecord4().getAgama());
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord4().getAlamat(): "+kawinData.getRecord1().getWnaObj().getRecord4().getAlamat());
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord4().getTmpLhr(): "+kawinData.getRecord1().getWnaObj().getRecord4().getTmpLhr());
//System.out.println("kawinData.getRecord1().getWnaObj().getRecord4().getJenisPkrjn(): "+kawinData.getRecord1().getWnaObj().getRecord4().getJenisPkrjn());

%>
<% // ************** Data for Saksi1 from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage7">
                      <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
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
                              <td width="22%">
<input type="hidden" name="kw_saksi1" value="2">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
<%
//System.out.println("nik_sksi1= "+nik_sksi1);
%>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" value="<%=request.getParameter("nik_sksi1")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord1().getWnaObj().getRecord4().getNamaPertma()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord4().getNamaPertma().toUpperCase())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord1().getWnaObj().getRecord4().getTmpLhr()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord4().getTmpLhr().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=((kawinData.getRecord1().getWnaObj().getRecord4().getTglLhr()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord4().getTglLhr())%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%"><%=((kawinData.getRecord1().getWnaObj().getRecord4().getAlamat()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord4().getAlamat()+", ")%><br>
                                  <%=((kawinData.getRecord1().getWnaObj().getRecord4().getNoRt()==null)?"":kawinData.getRecord1().getWnaObj().getRecord4().getNoRt().toString()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord4().getNoRw()==null)?"":kawinData.getRecord1().getWnaObj().getRecord4().getNoRw().toString()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord4().getDusun()==null)?"":kawinData.getRecord1().getWnaObj().getRecord4().getDusun()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord4().getKodePos()==null)?"":kawinData.getRecord1().getWnaObj().getRecord4().getKodePos()+", ")%><%=((kawinData.getRecord1().getWnaObj().getRecord4().getTelp()==null)?"":kawinData.getRecord1().getWnaObj().getRecord4().getTelp())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord1().getWnaObj().getRecord4().getAgama()==null)?"-":kawinData.getRecord1().getWnaObj().getRecord4().getAgama().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <select
                    class="boxdefault" name="jenis_pkrjn_s1"  onchange="jenis_wrk_saksi1.value=this.options[this.selectedIndex].value">
                                    <option  value="0" selected><b>-- Pilih Jenis
                                    Pekerjaan --</b></option>
                                    <option  value="1"><b>1 - Trading and Industry</b></option>
                                    <option  value="2"><b>2 - Forestry</b></option>
                                    <option  value="3"><b>3 - Mining and Energy</b></option>
                                    <option  value="4"><b>4 - Public Work</b></option>
                                    <option  value="5"><b>5 - Farming</b></option>
                                    <option  value="6"><b>6 - Religion</b></option>
                                    <option  value="7"><b>7 - Bank and Financial</b></option>
                                    <option  value="8"><b>8 - Health and Society</b></option>
                                    <option  value="9"><b>9 - Tourism</b></option>
                                    <option  value="10"><b>10 - Transportation
                                    and Communication</b></option>
                                    <option  value="11"><b>11 - Culture and Education</b></option>
                                    <option  value="12"><b>12 - Others</b></option>
                                  </select>
<input type="hidden" name="jenis_wrk_saksi1">
<script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_s1, "2")
  form1.jenis_pkrjn_s1.options[<%=((kawinData.getRecord1().getWnaObj().getRecord4().getJenisPkrjn()==null)?"0":kawinData.getRecord1().getWnaObj().getRecord4().getJenisPkrjn().toString())%>].selected=true
</script>

                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%} else {%>
 <div class="tab-page" name="t1" style="postion:absolute" id="tabPage7">
                      <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
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
                              <td width="22%">
<input type="hidden" name="kw_saksi1">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
<%
//System.out.println("nik_sksi1= "+nik_sksi1);
%>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)" value="<%=((request.getParameter("nik_sksi1")==null)?"":request.getParameter("nik_sksi1"))%>" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">-<br>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>

                              <td width="26%">
                                <select
                    class="boxdefault" name="jenis_pkrjn_s1"  disabled>
                                    <option  value="0" selected><b>-- Pilih Jenis
                                    Pekerjaan --</b></option>
                                  </select>
<input type="hidden" name="jenis_wrk_saksi1">
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
<%}%>


<%
if(kawinData.getRecord2().getWniObj().getRecord4() != null)
{
//System.out.println("kawinData.getRecord2().getWniObj().getRecord4(): "+kawinData.getRecord2().getWniObj().getRecord4());
%>
<% // ************** Data for Saksi2 from Biodata_Wni for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage8">
                    <h2 class="tab">Data Saksi II</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage8"));
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
                                <input type="hidden" name="kw_saksi22" value="1">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" value="<%=((request.getParameter("nik_sksi2")==null)?"":request.getParameter("nik_sksi2"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord2().getWniObj().getRecord4().getNamaLgkp()==null)?"-":kawinData.getRecord2().getWniObj().getRecord4().getNamaLgkp().toUpperCase())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord2().getWniObj().getRecord4().getTmptLhr()==null)?"-":kawinData.getRecord2().getWniObj().getRecord4().getTmptLhr().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=((kawinData.getRecord2().getWniObj().getRecord4().getTglLhr()==null)?"-":kawinData.getRecord2().getWniObj().getRecord4().getTglLhr())%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%"><%=((kawinData.getRecord2().getWniObj().getRecord4().getAlamat()==null)?"-":kawinData.getRecord2().getWniObj().getRecord4().getAlamat()+", ")%><br>
                                  <%=((kawinData.getRecord2().getWniObj().getRecord4().getNoRt()==null)?"":kawinData.getRecord2().getWniObj().getRecord4().getNoRt().toString()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord4().getNoRw()==null)?"":kawinData.getRecord2().getWniObj().getRecord4().getNoRw().toString()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord4().getDusun()==null)?"":kawinData.getRecord2().getWniObj().getRecord4().getDusun()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord4().getKodePos()==null)?"":kawinData.getRecord2().getWniObj().getRecord4().getKodePos()+", ")%><%=((kawinData.getRecord2().getWniObj().getRecord4().getTelp()==null)?"":kawinData.getRecord2().getWniObj().getRecord4().getTelp())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord2().getWniObj().getRecord4().getAgama()==null)?"-":kawinData.getRecord2().getWniObj().getRecord4().getAgama())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                     name=jenis_pkrjn_s2 boxdefault2 class="boxdefault"  onChange="jenis_wrk_saksi2.value=this.options[this.selectedIndex].value">
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                  <option value="1">1 - Pelajar/Mahasiswa</option>
                                  <option value="2">2 - Mengurus Rumah Tangga</option>
                                  <option value="3">3 - Pensiunan</option>
                                  <option value="4">4 - Belum/Tidak Bekerja</option>
                                  <option value="5">5 - Petani/Pekebun</option>
                                  <option value="6">6 - Peternak</option>
                                  <option value="7">7 - Nelayan/Perikanan</option>
                                  <option value="8">8 - Industri</option>
                                  <option value="9">9 - Konstruksi</option>
                                  <option value="10">10 - Perdagangan</option>

                                  <option value="11">11 - Transportasi</option>
                                  <option value="12">12 - Pegawai Negeri Sipil</option>
                                  <option value="13">13 - Tentara Nasional Indonesia</option>
                                  <option value="14">14 - Kepolisian R.I.</option>
                                  <option value="15">15 - Jasa Lainnya</option>
                                  <option value="16">16 - Lainnya</option>
                                </select>
                                <input type="hidden" name="jenis_wrk_saksi2">
                                <script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_s2, "1")
  form1.jenis_pkrjn_s2.options[<%=((kawinData.getRecord2().getWniObj().getRecord4().getJenisPkrjn()==null)?"0":kawinData.getRecord2().getWniObj().getRecord4().getJenisPkrjn())%>].selected=true
</script>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>

<%}

else if(kawinData.getRecord2().getWnaObj().getRecord4() != null)
{
//System.out.println("kawinData.getRecord2().getWnaObj().getRecord4(): "+kawinData.getRecord2().getWnaObj().getRecord4());
%>
<% // ************** Data for Saksi2 from Biodata_Wna for given NIK *************** %>

  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage8">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage8"));
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
                                <input type="hidden" name="kw_saksi2" value="2">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <%
//System.out.println("nik_sksi1= "+nik_sksi1);
%>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" value="<%=((request.getParameter("nik_sksi2")==null)?"":request.getParameter("nik_sksi2"))%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=((kawinData.getRecord2().getWnaObj().getRecord4().getNamaPertma()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord4().getNamaPertma().toUpperCase())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>

                              <td width="23%"><%=((kawinData.getRecord2().getWnaObj().getRecord4().getTmpLhr()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord4().getTmpLhr().toUpperCase())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=((kawinData.getRecord2().getWnaObj().getRecord4().getTglLhr()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord4().getTglLhr())%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%"><%=((kawinData.getRecord2().getWnaObj().getRecord4().getAlamat()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord4().getAlamat()+", ")%><br>
                                  <%=((kawinData.getRecord2().getWnaObj().getRecord4().getNoRt()==null)?"":kawinData.getRecord2().getWnaObj().getRecord4().getNoRt().toString()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord4().getNoRw()==null)?"":kawinData.getRecord2().getWnaObj().getRecord4().getNoRw().toString()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord4().getDusun()==null)?"":kawinData.getRecord2().getWnaObj().getRecord4().getDusun()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord4().getKodePos()==null)?"":kawinData.getRecord2().getWnaObj().getRecord4().getKodePos()+", ")%><%=((kawinData.getRecord2().getWnaObj().getRecord4().getTelp()==null)?"":kawinData.getRecord2().getWnaObj().getRecord4().getTelp())%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=((kawinData.getRecord2().getWnaObj().getRecord4().getAgama()==null)?"-":kawinData.getRecord2().getWnaObj().getRecord4().getAgama())%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                    class="boxdefault" name="jenis_pkrjn_s2"  onChange="jenis_wrk_saksi2.value=this.options[this.selectedIndex].value">
                                  <option  value="0" selected><b>-- Pilih Jenis
                                  Pekerjaan --</b></option>
                                  <option  value="1"><b>1 - Trading and Industry</b></option>
                                  <option  value="2"><b>2 - Forestry</b></option>
                                  <option  value="3"><b>3 - Mining and Energy</b></option>
                                  <option  value="4"><b>4 - Public Work</b></option>
                                  <option  value="5"><b>5 - Farming</b></option>
                                  <option  value="6"><b>6 - Religion</b></option>
                                  <option  value="7"><b>7 - Bank and Financial</b></option>
                                  <option  value="8"><b>8 - Health and Society</b></option>
                                  <option  value="9"><b>9 - Tourism</b></option>
                                  <option  value="10"><b>10 - Transportation and
                                  Communication</b></option>
                                  <option  value="11"><b>11 - Culture and Education</b></option>
                                  <option  value="12"><b>12 - Others</b></option>
                                </select>
                                <input type="hidden" name="jenis_wrk_saksi2">
                                <script language="JavaScript">
setupPekerjaan(form1.jenis_pkrjn_s2, "2")
  form1.jenis_pkrjn_s2.options[<%=((kawinData.getRecord2().getWnaObj().getRecord4().getJenisPkrjn()==null)?"0":kawinData.getRecord2().getWnaObj().getRecord4().getJenisPkrjn().toString())%>].selected=true
</script>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>

<%} else {%>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage8">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage8"));
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
                                <input type="hidden" name="kw_saksi2">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <%
//System.out.println("nik_sksi1= "+nik_sksi1);
%>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)" value="<%=((request.getParameter("nik_sksi2")==null)?"":request.getParameter("nik_sksi2"))%>" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>

                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">-<br>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                    class="boxdefault" name="jenis_pkrjn_s2"  disabled>
                                  <option  value="0" selected><b>-- Pilih Jenis
                                  Pekerjaan --</b></option>
                                </select>
                                <input type="hidden" name="jenis_wrk_saksi2">
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
<%}
if (errors==null) {
%>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage9">
    <h2 class="tab">Data Perkawinan</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage9"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td width="22%">Tanggal Pemberkatan Perkawinan<font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                              <td>
                                <input
                                class=boxdefault size=2 name=tgl_pembktan_kwn_dd maxlength="2" onKeyUp="return tab12()" >
                              </td>
                              <td>/ </td>
                              <td>
                                <input
                                class=boxdefault size=2 name=tgl_pembktan_kwn_mm maxlength="2" onKeyUp="return tab13()" >
                              </td>
                              <td>/</td>
                              <td>
                                <input
                                class=boxdefault size=4 name=tgl_pembktan_kwn_yy maxlength="4" onKeyUp="return tab14()" >
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">Tanggal, Bulan, Tahun, Melapor<font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                              <td>
                                <input
                                class=boxdefault size=2 name=tgl_mlapor_dd maxlength="2" onKeyUp="return tab15()" >
                              </td>
                              <td>/ </td>
                              <td>
                                <input
                                class=boxdefault size=2 name=tgl_mlapor_mm  maxlength="2" onKeyUp="return tab16()" >
                              </td>
                              <td>/</td>
                              <td>
                                <input
                                class=boxdefault size=4 name=tgl_mlapor_yy maxlength="4" onKeyUp="return tab17()" >
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">Jam/Waktu Melapor<font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <!--pukul_lhr1 & pukul_lhr2 sama dngn JAM LAPOR-->
                          <input type="text" name="pukul_lhr1" size="2" class="boxdefault" maxlength="2" onKeyUp="return tab()" >
                          :
                          <input type="text" name="pukul_lhr2" size="2" class="boxdefault" maxlength="2" onKeyUp="return tab1()" >
                          <select size="1" name="wkt_pkl_lhr" class="boxdefault">
                            <option value="0" selected>-- Pilih Waktu --</option>
                            <option value="WIB">WIB</option>
                            <option value="WITA">WITA</option>
                            <option value="WIT">WIT</option>
                          </select>
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">Tunduk pada Agama <font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <select size="1" name="tduk_agama" class="boxdefault" >
                            <option value="0" selected>-- Pilih Tunduk pada Agama
                            --</option>
                            <option value="Islam">Islam</option>
                            <option value="Kristen">Kristen</option>
                            <option value="Katholik">Katholik</option>
                            <option value="Hindu">Hindu</option>
                            <option value="Budha">Budha</option>
                            <option value="Lainnya">Lainnya</option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">Tempat Pengesahan Perkawinan<font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <select size="1" name="nama_tmpt_pnesah" class="boxdefault" >
                            <option value="0" selected>-- Pilih Nama Tempat Pengesahan
                            --</option>
                            <option value="Mesjid">1 - Mesjid</option>
                            <option value="Gereja">2 - Gereja</option>
                            <option value=" Vihara">3 - Vihara</option>
                            <option value="Parisada">4 - Parisada</option>
                            <option value="Dirumah">5 - Dirumah</option>
                            <option value="Lainnya">6 - Lainnya</option>
                          </select>
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">Keterangan Nama Tempat Pengesahan<font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <input type="text" name="ket_nama_tmpt_pnesah" size="20" maxlength="60" class="boxdefault" onKeyUp="return char(form1.ket_nama_tmpt_pnesah)" >
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">Nama Pemuka Agama<font color="#000099" class="asterish">*</font></td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <input type="text" name="nama_pmka_agama" size="20" maxlength="60" class="boxdefault" onKeyUp="return char(form1.nama_pmka_agama)" >
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">&nbsp;</td>
                        <td width="1%">&nbsp;</td>
                        <td width="26%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="22%">
                          <p style="line-height: 100%">Alamat Pemuka Agama<font color="#000099" class="asterish">*</font></p>
                        </td>
                        <td width="1%">:</td>
                        <td colspan="5">
                          <p style="line-height: 100%">
                            <input type="text" name="alamat_pmka_agama" size="30" class="boxdefault" maxlength="120" >
                            RT<font color="#000099" class="asterish"> </font>
                            <input type="text" name="rt_pmka_agama" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_pmka_agama)" >
                            RW
                            <input type="text" name="rw_pmka_agama" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_pmka_agama)" >
                            Dusun/Kampung/Dukuh
                            <input type="text" name="dusun_pmka_agama" size="22" class="boxdefault" maxlength="60" >
                          </p>
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">
                          <div align="right">Kode Pos</div>
                        </td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <input type="text" name="kpos_pmka_agama" size="5" class="boxdefault" maxlength="5" >
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">
                          <div align="right">Telepon</div>
                        </td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <input type="text" name="tlp_pmka_agama" size="20" class="boxdefault" maxlength="20" >
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">
                          <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                          </div>
                        </td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <input type="text" name="nama_prop_pmka_agama" size="30" class="boxdefault" maxlength="120">
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">
                          <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                          </div>
                        </td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <input type="text" name="nama_kab_pmka_agama" size="30" class="boxdefault" maxlength="120">
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">
                          <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                          </div>
                        </td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <input type="text" name="nama_kec_pmka_agama" size="30" class="boxdefault" maxlength="120">
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">
                          <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                          </div>
                        </td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <input type="text" name="nama_kel_pmka_agama" size="30" class="boxdefault" maxlength="120">
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">Tanggal Pendaftaran Perkawinan dari Luar
                          Negeri</td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                              <td>
                                <input
                                class=boxdefault size=2 name=tgl_dft_kwn_ln_dd maxlength="2" onKeyUp="return tab18()" >
                              </td>
                              <td>/ </td>
                              <td>
                                <input
                                class=boxdefault size=2 name=tgl_dft_kwn_ln_mm maxlength="2" onKeyUp="return tab19()" >
                              </td>
                              <td>/</td>
                              <td>
                                <input
                                class=boxdefault size=4 name=tgl_dft_kwn_ln_yy maxlength="4" onKeyUp="return tab20()" >
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">Ijin Kedutaan untuk Perkawinan dengan
                          WNA</td>
                        <td width="1%">:</td>
                        <td width="26%">
                          <input type="text" name="ijn_dut_kwn_wna" size="22" class="boxdefault" maxlength="60" >
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">Nama Anak</td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <input type="text" name="nama_anak" size="27" class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                        </td>
                        <td width="3%">&nbsp; </td>
                        <td width="24%" align="left">
                     <a href="javascript:addAnak(form1.listAnak, form1.nama_anak, form1.no_akta_anak, form1.tgl_akta_anak_dd, form1.tgl_akta_anak_mm, form1.tgl_akta_anak_yy)">
                          <img src="images/arrowRight.gif" width="24" height="24" border=0 alt="Daftar Anak">
                     </a>
                        </td>
                        <td width="1%">&nbsp;</td>
                        <td rowspan="3" width="28%">
			Anak Yang Telah Diakui dan Disahkan<br>
                        <select name="listAnak" size="7" class="boxdefault">
                        </select>
                    	  <input type="hidden" name="daftarAnak">
                        </td>
                      </tr>
                      <tr>
                        <td width="22%">No Akta Kelahiran</td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <input type="text" name="no_akta_anak" size="27"  class="boxdefault" maxlength="60" /*onFocus="this.blur()"*/>
                        </td>
                        <td width="3%">&nbsp; </td>
                        <td width="24%" align="left">
                          <a href="javascript:removeAnak(form1.listAnak)">
                          <img src="images/arrowLeft.gif" width="24" height="24" border=0 alt="Hapus">
						  </a>
                        </td>
                        <td width="1%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="22%">Tanggal Akta Kelahiran</td>
                        <td width="1%">:</td>
                        <td width="23%">
                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                              <td>
                                <input
                                class=boxdefault size=2 name="tgl_akta_anak_dd" maxlength="2" onKeyUp="return checkTanggal(form1.tgl_akta_anak_dd, form1.tgl_akta_anak_mm)">
                              </td>
                              <td>/ </td>
                              <td>
                                <input
                                class=boxdefault size=2 name="tgl_akta_anak_mm"  maxlength="2" onKeyUp="return checkBulan(form1.tgl_akta_anak_mm, form1.tgl_akta_anak_yy)">
                              </td>
                              <td>/</td>
                              <td>
                                <input
                                class=boxdefault size=4 name="tgl_akta_anak_yy" maxlength="4"onKeyUp="return checkTahun(form1.tgl_akta_anak_dd, form1.tgl_akta_anak_mm, form1.tgl_akta_anak_yy)">
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td width="3%">&nbsp;</td>
                        <td width="24%">&nbsp; </td>
                        <td width="1%">&nbsp;</td>
                      </tr>
                    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage10">
    <h2 class="tab">Data Administrasi</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage10"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">
Dasar Hukum Pencatatan Perkawinan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
        <select size="1" name="dsrhk_cttkwn" class="boxdefault" >
                                    <option value="0" selected>-- Pilih Dasar
                                    Hukum --</option>
                                    <option value="1">1 - UU No. 1 Tahun 1974</option>
                                    <option value="2">2 - Stbld 1849 No. 25</option>
                                    <option value="3">3 - Stbld 1917 No.130 jo
                                    1919 No.81</option>
                                    <option value="4">4 - Stbld 1933 No.74 jo
                                    1935 No.607</option>
                                    <option value="5">5 - Stbld 1920 No.751 jo
                                    1927 No.5847</option>
                                    <option value="6">6 - Stbld 1904</option>
									<option value="7">7 - UU No. 23 Tahun 2006</option>
									<option value="8">8 - ----</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Dokumen Persyaratan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">
                                <p>
           <select name="doc_per" size="6" multiple class="boxdefault" >
                                    <option value="1" selected>Surat Bukti Perkawinan
                                    Agama</option>
                                    <option value="2">Akta Kelahiran</option>
                                    <option value="3">Surat keterangan dari Desa/Kelurahan</option>
                                    <option value="4">Copy KTP/KK yang Dilegalisir
                                    Kades/Lurah</option>
                                    <option value="5">Surat Bukti Kewarganegaraan
                                    RI</option>
                                    <option value="6">Surat Ganti Nama</option>
                                    <option value="7">Pas Foto Berdampingan 4x6</option>
                                    <option value="8">Akta Kelahiran Anak yang
                                    Akan Diakui</option>
                                    <option value="9">Akta Perceraian/Kematian,
                                    jika sudah pernah kawin</option>
                                    <option value="10">Ijin dari Komandan bagi
                                    Anggota ABRI</option>
                                    <option value="11">Paspor</option>
                                    <option value="12">STMD dari Kepolisian</option>
                                    <option value="13">Surat Kedutaan/Konsul/Perwakilan
                                    Negara Asing Bersangkutan</option>
                                    <option value="14">SKK dari Imigrasi</option>
                                    <option value="15">Copy Surat Baptis</option>
                                  </select>
                                </p>
                                </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Akta Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%"> </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">Tanggal Akta Perkawinan<font color="#000099" class="asterish"></font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name="dd_akta_kwn" maxlength="2" onKeyUp="return checkTanggal(form1.dd_akta_kwn, form1.mm_akta_kwn)" value="<%=record.getToday().trim().substring(0,2)%>">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name="mm_akta_kwn"  maxlength="2" onKeyUp="return checkBulan(form1.mm_akta_kwn, form1.yy_akta_kwn)" value="<%=record.getToday().trim().substring(3,5)%>">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name="yy_akta_kwn" maxlength="4"onKeyUp="return checkTahun(form1.dd_akta_kwn, form1.mm_akta_kwn, form1.yy_akta_kwn)" value="<%=record.getToday().trim().substring(6,10)%>">
                                    </td>
                               <input type="hidden" name="tgl_akta_kawin">
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jabatan pada Kantor/Dinas</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=record.getKabJabatan()%> </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Pejabat</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=record.getKabNamaPej()%> </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">NIP Pejabat</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
<%=record.getKabNipPej()%>
</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nama Kepala Desa/Lurah</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_kep_des" size="27" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_kep_des)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">NIP Lurah</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nip_lrh" size="9" class="boxdefault" maxlength="9" onKeyUp="return num(form1.nip_lrh)" >
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nama Petugas Pencatat/
                                  Registrar<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_pet_reg" size="27" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_pet_reg)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td align="center" width="24%">
                                <p align="left" style="line-height: 100%">NIP
                                  Petugas Pencatat/Registrar<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="1%">:</td>
                              <td align="center" width="26%">
                                <p align="left" style="line-height: 100%">
                                  <input type="text" name="nip_pet_reg" size="9" class="boxdefault" maxlength="9" onKeyUp="return num(form1.nip_pet_reg)" >
                              </td>
                            </tr>
                            <tr>
                              <td align="center" width="22%">
                                <p align="left" style="line-height: 100%">Nama
                                  Pelapor
                              </td>
                              <td width="1%">:</td>
                              <td align="center" width="23%">
                                <p align="left" style="line-height: 100%">
                                  <input type="text" name="nama_plpor" size="27" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_plpor)" >
                              </td>
                              <td align="center" width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Petugas Entri

                                  Data</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=record.getNamaPetugas()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIP Petugas Entri
                                  Data</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%"><%=record.getNipPetugas()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Entri Data</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%"><%=record.getToday()%></td>
                            </tr>
                          </table>

                        </td>
</tr>
</table>
</div>
<%}%>
</div>

       <script type="text/javascript">
          setupAllTabs();
       </script>
</tr></table>
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
      <td width="130">
        <div align="center"><b>
        <input class=boxstandard type="button" value="KONFIRMASI"  name="kon"  onClick="return kawin()">
        </b></div>
    </td>
      <td width="104">
        <div align="center"><b> </b></div>
      <div align="center"><b>
        <input class=boxstandard type="button" value="SIMPAN" name="sim"  onClick="return simpan()"  <%if (errors!=null) {%> disabled <%}%>>
        </b></div>
    </td>
      <td width="97">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KELUAR" name="kel" onclick="document.location='Menu_Capil_KabKota.jsp'">
          </b></div>
    </td>
      <td width="4">
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
 <p>
<input type=hidden name="today" value="<%=record.getToday()%>">
  </p>

<script language="JavaScript">
if("<%=request.getParameter("radiobutton")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton1")%>" == "1")
{
form1.radiobutton[1].checked = true
form1.radiobutton1[0].checked = true
form1.nik_ayh_dr_suami.disabled=true
form1.nama_ayh_suami.disabled=false
form1.tmpt_lhr_ayh_suami.disabled=false
form1.tgl_lhr_ayh_suami_dd.disabled=false
form1.tgl_lhr_ayh_suami_mm.disabled=false
form1.tgl_lhr_ayh_suami_yy.disabled=false
form1.jenis_pkrjn_ayh_suami.disabled=false
form1.agama_ayh_suami.disabled=false
form1.alamat_ayh_suami.disabled=false
form1.rt_ayh_suami.disabled=false
form1.rw_ayh_suami.disabled=false
form1.dusun_ayh_suami.disabled=false
form1.kpos_ayh_suami.disabled=false
form1.tlp_ayh_suami.disabled=false
form1.radiobutton[0].disabled = true

<%
if(request.getParameter("jenis_pkrjn_ayh_suami")!=null)
{%>
form1.jenis_pkrjn_ayh_suami.options[<%=request.getParameter("jenis_pkrjn_ayh_suami")%>].selected=true
<%}%>
<%
if(request.getParameter("agama_ayh_suami")!=null)
{%>
// String /form1.agama_ayh_suami.options[<%=request.getParameter("agama_ayh_suami")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton1")%>" == "2")
{
form1.radiobutton[1].checked = true
form1.radiobutton1[1].checked = true
form1.nama_ayh_suami.disabled=false
form1.nik_ayh_dr_suami.disabled=true
form1.tmpt_lhr_ayh_suami.disabled=false
form1.tgl_lhr_ayh_suami_dd.disabled=false
form1.tgl_lhr_ayh_suami_mm.disabled=false
form1.tgl_lhr_ayh_suami_yy.disabled=false
form1.jenis_pkrjn_ayh_suami.disabled=false
form1.agama_ayh_suami.disabled=false
form1.alamat_ayh_suami.disabled=false
form1.rt_ayh_suami.disabled=false
form1.rw_ayh_suami.disabled=false
form1.dusun_ayh_suami.disabled=false
form1.kpos_ayh_suami.disabled=false
form1.tlp_ayh_suami.disabled=false
form1.radiobutton[0].disabled = true

<%
if(request.getParameter("jenis_pkrjn_ayh_suami")!=null)
{%>
form1.jenis_pkrjn_ayh_suami.options[<%=request.getParameter("jenis_pkrjn_ayh_suami")%>].selected=true
<%}%>
<%
if(request.getParameter("agama_ayh_suami")!=null)
{%>
// String //form1.agama_ayh_suami.options[<%=request.getParameter("agama_ayh_suami")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton2")%>" == "Tidak Ada"

   && "<%=request.getParameter("radiobutton3")%>" == "1")
{
form1.radiobutton2[1].checked = true
form1.radiobutton3[0].checked = true
form1.nama_ibu_suami.disabled=false
form1.nik_ibu_dr_suami.disabled=true
form1.tmpt_lhr_ibu_suami.disabled=false
form1.tgl_lhr_ibu_suami_dd.disabled=false
form1.tgl_lhr_ibu_suami_mm.disabled=false
form1.tgl_lhr_ibu_suami_yy.disabled=false
form1.jenis_pkrjn_ibu_suami.disabled=false
form1.agama_ibu_suami.disabled=false
form1.alamat_ibu_suami.disabled=false
form1.rt_ibu_suami.disabled=false
form1.rw_ibu_suami.disabled=false
form1.dusun_ibu_suami.disabled=false
form1.kpos_ibu_suami.disabled=false
form1.tlp_ibu_suami.disabled=false
form1.radiobutton2[0].disabled = true

<%if(request.getParameter("jenis_pkrjn_ibu_suami")!=null)
{%>
form1.jenis_pkrjn_ibu_suami.options[<%=request.getParameter("jenis_pkrjn_ibu_suami")%>].selected=true
<%}%>
<%if(request.getParameter("agama_ibu_suami")!=null)
{%>
// String // form1.agama_ibu_suami.options[<%=request.getParameter("agama_ibu_suami")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton2")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton3")%>" == "2")
{
form1.radiobutton2[1].checked = true
form1.radiobutton3[1].checked = true
form1.nama_ibu_suami.disabled=false
form1.nik_ibu_dr_suami.disabled=true
form1.tmpt_lhr_ibu_suami.disabled=false
form1.tgl_lhr_ibu_suami_dd.disabled=false
form1.tgl_lhr_ibu_suami_mm.disabled=false
form1.tgl_lhr_ibu_suami_yy.disabled=false
form1.jenis_pkrjn_ibu_suami.disabled=false
form1.agama_ibu_suami.disabled=false
form1.alamat_ibu_suami.disabled=false
form1.rt_ibu_suami.disabled=false
form1.rw_ibu_suami.disabled=false
form1.dusun_ibu_suami.disabled=false
form1.kpos_ibu_suami.disabled=false
form1.tlp_ibu_suami.disabled=false
form1.radiobutton2[0].disabled = true

<%if(request.getParameter("jenis_pkrjn_ibu_suami")!=null)
{%>
form1.jenis_pkrjn_ibu_suami.options[<%=request.getParameter("jenis_pkrjn_ibu_suami")%>].selected=true
<%}%>
<%if(request.getParameter("agama_ibu_suami")!=null)
{%>
// String //form1.agama_ibu_suami.options[<%=request.getParameter("agama_ibu_suami")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton4")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton5")%>" == "1")
{
form1.radiobutton4[1].checked = true
form1.radiobutton5[0].checked = true
form1.nama_ayh_istri.disabled=false
form1.nik_ayh_dr_istri.disabled=true
form1.tmpt_lhr_ayh_istri.disabled=false
form1.tgl_lhr_ayh_istri_dd.disabled=false
form1.tgl_lhr_ayh_istri_mm.disabled=false
form1.tgl_lhr_ayh_istri_yy.disabled=false
form1.jenis_pkrjn_ayh_istri.disabled=false
form1.agama_ayh_istri.disabled=false
form1.alamat_ayh_istri.disabled=false
form1.rt_ayh_istri.disabled=false
form1.rw_ayh_istri.disabled=false

form1.dusun_ayh_istri.disabled=false
form1.kpos_ayh_istri.disabled=false
form1.tlp_ayh_istri.disabled=false
form1.radiobutton4[0].disabled = true

<%if(request.getParameter("jenis_pkrjn_ayh_istri")!=null)
{%>
form1.jenis_pkrjn_ayh_istri.options[<%=request.getParameter("jenis_pkrjn_ayh_istri")%>].selected=true
<%}%>
<%if(request.getParameter("agama_ayh_istri")!=null)
{%>
// String //form1.agama_ayh_istri.options[<%=request.getParameter("agama_ayh_istri")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton4")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton5")%>" == "2")
{
form1.radiobutton4[1].checked = true
form1.radiobutton5[1].checked = true
form1.nama_ayh_istri.disabled=false
form1.nik_ayh_dr_istri.disabled=true
form1.tmpt_lhr_ayh_istri.disabled=false
form1.tgl_lhr_ayh_istri_dd.disabled=false
form1.tgl_lhr_ayh_istri_mm.disabled=false
form1.tgl_lhr_ayh_istri_yy.disabled=false
form1.jenis_pkrjn_ayh_istri.disabled=false
form1.agama_ayh_istri.disabled=false
form1.alamat_ayh_istri.disabled=false
form1.rt_ayh_istri.disabled=false
form1.rw_ayh_istri.disabled=false
form1.dusun_ayh_istri.disabled=false
form1.kpos_ayh_istri.disabled=false
form1.tlp_ayh_istri.disabled=false
form1.radiobutton4[0].disabled = true

<%if(request.getParameter("jenis_pkrjn_ayh_istri")!=null)
{%>
form1.jenis_pkrjn_ayh_istri.options[<%=request.getParameter("jenis_pkrjn_ayh_istri")%>].selected=true
<%}%>
<%if(request.getParameter("agama_ayh_istri")!=null)
{%>
// String //form1.agama_ayh_istri.options[<%=request.getParameter("agama_ayh_istri")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton6")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton7")%>" == "1")
{
form1.radiobutton6[1].checked = true
form1.radiobutton7[0].checked = true
form1.nama_ibu_istri.disabled=false
form1.nik_ibu_dr_istri.disabled=true
form1.tmpt_lhr_ibu_istri.disabled=false
form1.tgl_lhr_ibu_istri_dd.disabled=false
form1.tgl_lhr_ibu_istri_mm.disabled=false
form1.tgl_lhr_ibu_istri_yy.disabled=false
form1.jenis_pkrjn_ibu_istri.disabled=false
form1.agama_ibu_istri.disabled=false
form1.alamat_ibu_istri.disabled=false
form1.rt_ibu_istri.disabled=false
form1.rw_ibu_istri.disabled=false
form1.dusun_ibu_istri.disabled=false
form1.kpos_ibu_istri.disabled=false
form1.tlp_ibu_istri.disabled=false
form1.radiobutton4[0].disabled = true


<%if(request.getParameter("jenis_pkrjn_ibu_istri")!=null)
{%>
form1.jenis_pkrjn_ibu_istri.options[<%=request.getParameter("jenis_pkrjn_ibu_istri")%>].selected=true
<%}%>
<%if(request.getParameter("agama_ibu_istri")!=null)
{%>
// String //form1.agama_ibu_istri.options[<%=request.getParameter("agama_ibu_istri")%>].selected=true
<%}%>
}

if("<%=request.getParameter("radiobutton6")%>" == "Tidak Ada"
   && "<%=request.getParameter("radiobutton7")%>" == "2")
{
form1.radiobutton6[1].checked = true
form1.radiobutton7[1].checked = true

form1.nama_ibu_istri.disabled=false
form1.nik_ibu_dr_istri.disabled=true
form1.tmpt_lhr_ibu_istri.disabled=false
form1.tgl_lhr_ibu_istri_dd.disabled=false
form1.tgl_lhr_ibu_istri_mm.disabled=false
form1.tgl_lhr_ibu_istri_yy.disabled=false
form1.jenis_pkrjn_ibu_istri.disabled=false
form1.agama_ibu_istri.disabled=false
form1.alamat_ibu_istri.disabled=false
form1.rt_ibu_istri.disabled=false
form1.rw_ibu_istri.disabled=false
form1.dusun_ibu_istri.disabled=false
form1.kpos_ibu_istri.disabled=false
form1.tlp_ibu_istri.disabled=false
form1.radiobutton4[0].disabled = true

<%if(request.getParameter("jenis_pkrjn_ibu_istri")!=null)
{%>
form1.jenis_pkrjn_ibu_istri.options[<%=request.getParameter("jenis_pkrjn_ibu_istri")%>].selected=true
<%}%>
<%if(request.getParameter("agama_ibu_istri")!=null)
{%>
// String //form1.agama_ibu_istri.options[<%=request.getParameter("agama_ibu_istri")%>].selected=true
<%}%>
}
</script>

</form>
</BODY></HTML>
<%date = new java.util.Date();
//System.out.println("END  :"+date);
}
  else
  {
    //System.out.println("KAWIN DATA NULL");
    response.sendRedirect("Kawin.jsp");
  }
}

else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
   {
      //System.out.println("Exception in Kawin List = " + e);
      e.printStackTrace();
          response.sendRedirect("index.jsp");
   }

%>