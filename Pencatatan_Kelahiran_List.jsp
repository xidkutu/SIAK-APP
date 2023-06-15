<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,java.math.*,com.db.connection.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
    String id1=null,flag=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factoryKlr,factory1Klr;
    Login remote;
    WNIBiodataHome homeKlr = null;
    WNIBiodata remoteKlr = null;
    WniWnaObj wnidataKlr = null;
    Vector v1;

    String day=null;
    String edit = "";
    String day1="";
    boolean dataBayiOK = false;
    boolean dataIbuOK = false;
    boolean dataAyahOK = false;
    boolean dataPelaporOK = false;
%>


<% Vector errMsg;
   String infoMsg;
   errMsg = new Vector();
   infoMsg = null;
   edit = "";
   boolean sudahAda = false;
   try
   {

    String nik_bayi=((request.getParameter("nik_bayi")==null)?"":request.getParameter("nik_bayi"));
	String nik_ibu=((request.getParameter("nik_ibu")==null)?"":request.getParameter("nik_ibu"));
	String nik_ayah=((request.getParameter("nik_ayh")==null)?"":request.getParameter("nik_ayh"));
	String nik_pelapor=((request.getParameter("nik_plpor")==null)?"":request.getParameter("nik_plpor"));
//     nik_bayi=(String)session.getAttribute("nik_bayi");
     session.removeAttribute("nik_bayi");
  //   nik_ibu=(String)session.getAttribute("nik_ibu");
     session.removeAttribute("nik_ibu");
    // nik_ayah=(String)session.getAttribute("nik_ayah");
     session.removeAttribute("nik_ayah");
//     nik_pelapor=(String)session.getAttribute("nik_pelapor");
     session.removeAttribute("nik_pelapor");

     v = new Vector();
        record = (UserInfo1)session.getAttribute("remoteRef");

     factoryKlr=ServiceController.getInstance();

     homeKlr = (WNIBiodataHome)factoryKlr.lookup("WNIBiodata",WNIBiodataHome.class);

     if(homeKlr != null)
     {
       remoteKlr = homeKlr.create();
     }


//     wnidataKlr = ((WniWnaObj)remoteKlr.getDataKlr(nik_bayi,nik_ibu,nik_ayah,nik_pelapor) == null)
//                   ?null:(WniWnaObj)remoteKlr.getDataKlr(nik_bayi,nik_ibu,nik_ayah,nik_pelapor);

  wnidataKlr=(WniWnaObj)remoteKlr.getDataKlr(nik_bayi,nik_ibu,nik_ayah,nik_pelapor, Integer.parseInt(record.getLevelId()));
//////////////

System.out.println("wnidataKlr="+wnidataKlr);
if (wnidataKlr!=null) {
  KelahiranObj kelahiranObj = wnidataKlr.getWniObj();
  System.out.println("kelahiranObj="+kelahiranObj);
  KelahiranWnaObj kelahiranWnaObj = wnidataKlr.getWnaObj();
  System.out.println("kelahiranWnaObj="+kelahiranWnaObj);
  if (kelahiranObj!=null) {
    BayiData bayiData = kelahiranObj.getRecord1();
    System.out.println("bayiData="+bayiData);
    IbuData ibuData = kelahiranObj.getRecord2();
    System.out.println("ibuData="+ibuData);
    AyahData ayahData = kelahiranObj.getRecord3();
    System.out.println("ayahData="+ayahData);
    PelaporData pelaporData = kelahiranObj.getRecord4();
    System.out.println("pelaporData="+pelaporData);
  }
  if (kelahiranWnaObj!=null) {
    BayiDataWna bayiDataWna = kelahiranWnaObj.getRecord1();
    System.out.println("bayiDataWna="+bayiDataWna);
    IbuDataWna ibuDataWna = kelahiranWnaObj.getRecord2();
    System.out.println("ibuDataWna="+ibuDataWna);
    AyahDataWna ayahDataWna = kelahiranWnaObj.getRecord3();
    System.out.println("ayahDataWna="+ayahDataWna);
    PelaporDataWna pelaporDataWna = kelahiranWnaObj.getRecord4();
    System.out.println("pelaporDataWna="+pelaporDataWna);
  }
} else {
  sudahAda = true;
  wnidataKlr = new WniWnaObj(new KelahiranObj(), new KelahiranWnaObj());
}

System.out.println("wnidataKlr="+wnidataKlr);
/////////////
System.out.println(121);

   if(wnidataKlr.getWniObj().getRecord1() != null)
        {
       dataBayiOK = true;
       day1 = getLocaleDay(wnidataKlr.getWniObj().getRecord1().getTglLhr());  //Getting Locale Day
     }
    else if(wnidataKlr.getWnaObj().getRecord1() != null)
     {
       dataBayiOK = true;
       day1 = getLocaleDay(wnidataKlr.getWnaObj().getRecord1().getTglLhr()); //Getting Locale Day
     }
     System.out.println("Fine here in JSP");
System.out.println(134);
%>

<html>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="KelahiranInput.jsp">

<script language="text/javaScript">
var tp1;
</script>

<script language="javaScript" src="Templates/tabpane.js"></script>
<script type="javascript" src="Templates/webfxlayout.js"></script>
<SCRIPT language=JavaScript src="scripts/Kelahiran.js"></SCRIPT>
<SCRIPT language=JavaScript src="scripts/util.js"></SCRIPT>
<!--
<input type="hidden" name="getPropNoIbu" value="">
<input type="hidden" name="getKabNoIbu" value="">
<input type="hidden" name="getKecNoIbu" value="">
<input type="hidden" name="getKelNoIbu" value="">

<input type="hidden" name="getPropNoAyh" value="">
<input type="hidden" name="getKabNoAyh" value="">
<input type="hidden" name="getKecNoAyh" value="">
<input type="hidden" name="getKelNoAyh" value="">
-->

<input type="hidden" name="today" value="<%=record.getToday()%>">

<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK type="text/css" href="Templates/s.css" rel=stylesheet>

<link id="webfx-tab-style-sheet" type="text/css" rel="stylesheet" href="Templates/tab.webfx.css"/>
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
                  <div align="center"><span class="submenu">Pencatatan Kelahiran</span><br>
                    <br>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
<% String jsp = "data_wilayah_3.jsp?no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() ;
%>
                          <jsp:include page="<%=jsp%>"/>
            </td>
        </tr>

		   <%   if (sudahAda) {
                          errMsg.add("Data Kelahiran Sudah Ada/Tersimpan!");
                        } else {
                           if(flag!=null) {
                              if (flag.equals("1")) {
                                infoMsg = "Data sudah disimpan !";
                              } else if (flag.equals("2")){
                                errMsg.add("Data NIK belum ada !");
                              }
                           }
System.out.println(295);
System.out.println(request.getMethod());
                           if(request.getMethod().equalsIgnoreCase("POST") && wnidataKlr.getWniObj().getRecord1() == null && wnidataKlr.getWnaObj().getRecord1() == null) {
                              errMsg.add("NIK Bayi salah,periksa kembali !");
                           }
                           if(wnidataKlr.getWniObj().getRecord2() == null && wnidataKlr.getWnaObj().getRecord2() == null &&
                               request.getParameter("radiobutton")!=null && request.getParameter("radiobutton").trim().equalsIgnoreCase("Ada")) {
                              errMsg.add("NIK Ibu tidak ada/salah,periksa kembali !");
                           }
                           if(wnidataKlr.getWniObj().getRecord3() == null && wnidataKlr.getWnaObj().getRecord3() == null &&
                               request.getParameter("radiobutton3")!=null && request.getParameter("radiobutton3").trim().equalsIgnoreCase("Ada")) {
                              errMsg.add("NIK Ayah tidak ada/salah, periksa kembali !");
                           }
                           if(request.getMethod().equalsIgnoreCase("POST") && wnidataKlr.getWniObj().getRecord4() == null && wnidataKlr.getWnaObj().getRecord4() == null) {
                              errMsg.add("NIK Pelapor tidak ada/salah, periksa kembali !");
                           }
                        }

                       %>
                       <% if (infoMsg!=null) { %>
                          <tr><td><%=printInfo(infoMsg)%></td></tr>
                       <%
                          }
                          else {
                              for(int i=0; i<errMsg.size(); i++) {
                                String message = (String) errMsg.elementAt(i);
                       %>
                                <tr><td><%=printError(message, "left")%></td></tr>
                       <%   }
                         }
						 int statusReqIbu = ADANOTEXIST; // Ada but not exist
						 if (errMsg==null || errMsg.size()==0) {
						    if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton"))) { //ada and exist
							//bean
							statusReqIbu = ADAEXIST;
							} else { //Tidak ada
							//request
							statusReqIbu = TIDAKADA;
							}
						 }
						 int statusReqAyah = ADANOTEXIST; // Ada but not exist
						 if (errMsg==null || errMsg.size()==0) {
						    if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton3"))) { //ada and exist
							//bean
							statusReqAyah = ADAEXIST;
							} else { //Tidak ada
							//request
							statusReqAyah = TIDAKADA;
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

<% // ************** Data for Data Bayi from Biodata_Wni for given NIK *************** %>

<%
System.out.println(270);
int wn_bayi = (request.getParameter("nik_bayi")==null?0:(request.getParameter("nik_bayi").substring(0,1).equals("A")?2:1));
if(wnidataKlr.getWniObj().getRecord1() == null && wnidataKlr.getWnaObj().getRecord1() == null)
{
edit="disabled";
System.out.println("edit="+edit);
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
System.out.println(299);
if (wn_bayi==1 && wnidataKlr.getWniObj().getRecord1()!=null) {
   nama_bayi = (wnidataKlr.getWniObj().getRecord1().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord1().getNamaLgkp().toUpperCase());
   jenis_kelamin_bayi = (wnidataKlr.getWniObj().getRecord1().getJenisKlmin()==null?"-":(wnidataKlr.getWniObj().getRecord1().getJenisKlmin().trim().equals("1")?"LAKI-LAKI":"PEREMPUAN"));
   tempat_lahir_bayi = (wnidataKlr.getWniObj().getRecord1().getTmptLhr()==null?"":wnidataKlr.getWniObj().getRecord1().getTmptLhr().toUpperCase());
   tanggal_lahir_bayi = (wnidataKlr.getWniObj().getRecord1().getTglLhr()==null?"":wnidataKlr.getWniObj().getRecord1().getTglLhr());
} else if (wn_bayi==2 && wnidataKlr.getWnaObj().getRecord1()!=null) {
   nama_bayi = (wnidataKlr.getWnaObj().getRecord1().getNamaPertma()==null?"":wnidataKlr.getWnaObj().getRecord1().getNamaPertma().toUpperCase());
   jenis_kelamin_bayi = (wnidataKlr.getWnaObj().getRecord1().getJnsKlm()==null?"-":(wnidataKlr.getWnaObj().getRecord1().getJnsKlm().equals(new java.math.BigDecimal("1"))?"LAKI-LAKI":"PEREMPUAN"));
   tempat_lahir_bayi = (wnidataKlr.getWnaObj().getRecord1().getTmpLhr()==null?"":wnidataKlr.getWnaObj().getRecord1().getTmpLhr().toUpperCase());
   tanggal_lahir_bayi = (wnidataKlr.getWnaObj().getRecord1().getTglLhr()==null?"":wnidataKlr.getWnaObj().getRecord1().getTglLhr());

   }
   session.setAttribute("nama_bayi",nama_bayi);
System.out.println(313);
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
                                <p style="line-height: 100%">NIK Bayi<font color="#000099" class="asterish">*</font>
                                </p>
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
                                <p style="line-height: 100%">Tempat Dilahirkan<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="tmpt_dilhr" class="boxdefault">
                                    <option value="0" selected>-- Pilih Tempat Dilahirkan
                                    --</option>
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
                                     <option  value="0" selected>-- Pilih Jenis Kelahiran
                                    --</option>
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
System.out.println(495);
int wn_ibu = (request.getParameter("radiobutton1")==null?0:Integer.parseInt(request.getParameter("radiobutton1")));if(wnidataKlr.getWniObj().getRecord2() != null || wnidataKlr.getWnaObj().getRecord2() != null) {
  dataIbuOK = true;
}
if(statusReqIbu==ADANOTEXIST)
{
  System.out.println(366);
  System.out.println("radiobutton="+request.getParameter("radiobutton"));
  if (statusReqIbu==0) {
    edit="disabled";
    System.out.println("radiobutton edit="+edit);
  }
}

System.out.println(514);
int radiobutton = -1;
if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton")))
  radiobutton = 0;
else if ("Tidak Ada".equalsIgnoreCase(request.getParameter("radiobutton")))
  radiobutton = 1;

int radiobutton1 = -1;
if ("1".equals(request.getParameter("radiobutton1")))
  radiobutton1 = 0;
else if ("2".equals(request.getParameter("radiobutton1")))
  radiobutton1 = 1;
System.out.println("request.getParameter(radiobutton)"+request.getParameter("radiobutton"));
System.out.println("request.getParameter(radiobutton1)"+request.getParameter("radiobutton1"));
System.out.println("radiobutton"+radiobutton);
System.out.println("radiobutton1"+radiobutton1);
//String nik_ibu = (request.getParameter("nik_ibu")==null?"":request.getParameter("nik_ibu"));
String nama_ibu = (request.getParameter("nama_ibu")==null?"":request.getParameter("nama_ibu"));
String getDDTglLahirIbu = (request.getParameter("no_akta_lhr_dd")==null?"":request.getParameter("no_akta_lhr_dd"));
String getMMTglLahirIbu = (request.getParameter("no_akta_lhr_mm")==null?"":request.getParameter("no_akta_lhr_mm"));
String getYYTglLahirIbu = (request.getParameter("no_akta_lhr_yy")==null?"":request.getParameter("no_akta_lhr_yy"));
int jenis_pkrjn_ibu = 0;
System.out.println("jenis_pkrjn_ibu"+jenis_pkrjn_ibu);
String alamat_ibu = (request.getParameter("alamat_ibu")==null?"":request.getParameter("alamat_ibu"));
String no_rt_ibu = (request.getParameter("no_rt_ibu")==null?"":request.getParameter("no_rt_ibu"));
String no_rw_ibu = (request.getParameter("no_rw_ibu")==null?"":request.getParameter("no_rw_ibu"));
String dusun_ibu = (request.getParameter("dusun_ibu")==null?"":request.getParameter("dusun_ibu"));
String kodepos_ibu = (request.getParameter("kodepos_ibu")==null?"":request.getParameter("kodepos_ibu"));
String telp_ibu = (request.getParameter("telp_ibu")==null?"":request.getParameter("telp_ibu"));
String nama_prop_ibu = (request.getParameter("nama_prop_ibu")==null?"":request.getParameter("nama_prop_ibu"));
String nama_kab_ibu = (request.getParameter("nama_kab_ibu")==null?"":request.getParameter("nama_kab_ibu"));
String nama_kec_ibu = (request.getParameter("nama_kec_ibu")==null?"":request.getParameter("nama_kec_ibu"));
String nkelibu = (request.getParameter("nkelibu")==null?"":request.getParameter("nkelibu"));
int ketrunan_ibu = (request.getParameter("ketrunan_ibu")==null?0:Integer.parseInt(request.getParameter("ketrunan_ibu")));
String bangsa_ibu = (request.getParameter("bangsa_ibu")==null?"":request.getParameter("bangsa_ibu"));
String getDDTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_dd")==null?"":request.getParameter("tgl_ctt_kwn_ibu_dd"));
String getMMTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_mm")==null?"":request.getParameter("tgl_ctt_kwn_ibu_mm"));
String getYYTglKawinIbu = (request.getParameter("tgl_ctt_kwn_ibu_yy")==null?"":request.getParameter("tgl_ctt_kwn_ibu_yy"));
System.out.println(552);
if (statusReqIbu==ADAEXIST) {
   if (wn_ibu==1) {
      nama_ibu = (wnidataKlr.getWniObj().getRecord2().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord2().getNamaLgkp().toUpperCase());
      getDDTglLahirIbu = getDD(wnidataKlr.getWniObj().getRecord2().getTglLhr());
      getMMTglLahirIbu = getMM(wnidataKlr.getWniObj().getRecord2().getTglLhr());
      getYYTglLahirIbu = getYY(wnidataKlr.getWniObj().getRecord2().getTglLhr());
      alamat_ibu = (wnidataKlr.getWniObj().getRecord2().getAlamat()==null?"":wnidataKlr.getWniObj().getRecord2().getAlamat());
      no_rt_ibu = (wnidataKlr.getWniObj().getRecord2().getNoRt()==null?"":wnidataKlr.getWniObj().getRecord2().getNoRt());
      no_rw_ibu = (wnidataKlr.getWniObj().getRecord2().getNoRw()==null?"":wnidataKlr.getWniObj().getRecord2().getNoRw());
      dusun_ibu = (wnidataKlr.getWniObj().getRecord2().getDusun()==null?"":wnidataKlr.getWniObj().getRecord2().getDusun());
      kodepos_ibu = (wnidataKlr.getWniObj().getRecord2().getKodePos()==null?"":wnidataKlr.getWniObj().getRecord2().getKodePos());
      telp_ibu = (wnidataKlr.getWniObj().getRecord2().getTelp()==null?"":wnidataKlr.getWniObj().getRecord2().getTelp());
      nama_prop_ibu = (wnidataKlr.getWniObj().getRecord2().getNoProp()==null?"":wnidataKlr.getWniObj().getRecord2().getNoProp());
      nama_kab_ibu = (wnidataKlr.getWniObj().getRecord2().getNoKab()==null?"":wnidataKlr.getWniObj().getRecord2().getNoKab());
      nama_kec_ibu = (wnidataKlr.getWniObj().getRecord2().getNoKec()==null?"":wnidataKlr.getWniObj().getRecord2().getNoKec());
      nkelibu = (wnidataKlr.getWniObj().getRecord2().getNoKel()==null?"":wnidataKlr.getWniObj().getRecord2().getNoKel());

   getDDTglKawinIbu = getDD(wnidataKlr.getWniObj().getRecord2().getTglKwn());
   getMMTglKawinIbu = getMM(wnidataKlr.getWniObj().getRecord2().getTglKwn());
   getYYTglKawinIbu = getYY(wnidataKlr.getWniObj().getRecord2().getTglKwn());

      jenis_pkrjn_ibu = (wnidataKlr.getWniObj().getRecord2().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord2().getJenisPkrjn()));

   } else if (wn_ibu==2) {
      nama_ibu = (wnidataKlr.getWnaObj().getRecord2().getNamaPertma()==null?"":wnidataKlr.getWnaObj().getRecord2().getNamaPertma().toUpperCase());
      getDDTglLahirIbu = getDD(wnidataKlr.getWnaObj().getRecord2().getTglLhr());
      getMMTglLahirIbu = getMM(wnidataKlr.getWnaObj().getRecord2().getTglLhr());
      getYYTglLahirIbu = getYY(wnidataKlr.getWnaObj().getRecord2().getTglLhr());
      alamat_ibu = (wnidataKlr.getWnaObj().getRecord2().getAlamat()==null?"":wnidataKlr.getWnaObj().getRecord2().getAlamat());
      no_rt_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoRt()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoRt());
      no_rw_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoRw()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoRw());
   dusun_ibu = (wnidataKlr.getWnaObj().getRecord2().getDusun()==null?"":wnidataKlr.getWnaObj().getRecord2().getDusun());
   kodepos_ibu = (wnidataKlr.getWnaObj().getRecord2().getKodePos()==null?"":wnidataKlr.getWnaObj().getRecord2().getKodePos());
   telp_ibu = (wnidataKlr.getWnaObj().getRecord2().getTelp()==null?"":wnidataKlr.getWnaObj().getRecord2().getTelp());
   nama_prop_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoProp()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoProp());
   nama_kab_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoKab()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoKab());
   nama_kec_ibu = (wnidataKlr.getWnaObj().getRecord2().getNoKec()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoKec());
   nkelibu = (wnidataKlr.getWnaObj().getRecord2().getNoKel()==null?"":wnidataKlr.getWnaObj().getRecord2().getNoKel());
   jenis_pkrjn_ibu = (wnidataKlr.getWnaObj().getRecord2().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWnaObj().getRecord2().getJenisPkrjn()));

   }
}
jenis_pkrjn_ibu = (request.getParameter("jenis_pkrjn_ibu")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_ibu"))==0?jenis_pkrjn_ibu:Integer.parseInt(request.getParameter("jenis_pkrjn_ibu")));
System.out.println(592);
%>
                  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
                      <h2 class="tab">Data Ibu </h2>
                <script type="javascript">
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
                                Tidak Ada</td>
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
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu" size="18" class="boxdefault" maxlength="17"  value="<%=nik_ibu%>" onKeyUp=" num1(form1.nik_ibu);radioValid3();resetFieldIbu()" onBlur="validateWNIbu(form1.nik_ibu,form1.radiobutton1);setSaveEnabled(false)" onchange="radiobutton[0].checked=true">
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
                                      <input
 class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2" value="<%=getMMTglLahirIbu%>" onKeyUp="return checkBulan(form1.no_akta_lhr_mm, form1.no_akta_lhr_yy)" /*onFocus="this.blur()"*/>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4" value="<%=getYYTglLahirIbu%>" onKeyUp="return checkTahun(form1.no_akta_lhr_dd, form1.no_akta_lhr_mm, form1.no_akta_lhr_yy)" /*onFocus="this.blur()"*/>
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
                                  <select
                  name=jenis_pkrjn_ibu boxdefault2 class="boxdefault">
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
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
                                <select size="1" name="ketrunan_ibu" class="boxdefault" <%if (wn_ibu==2) {%>onchange="if (this.selectedIndex!=0){bangsa_ibu.disabled=false;}else {bangsa_ayh.disabled=true;}" <%}%> >
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Kebangsaan (Bagi
                                  WNA)</p>
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
                                <p style="line-height: 100%">Tanggal Pencatatan
                                  Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ibu_dd value="<%=getDDTglKawinIbu%>" maxlength="2"  onKeyUp="return checkTanggal(form1.tgl_ctt_kwn_ibu_dd, form1.tgl_ctt_kwn_ibu_mm)" /*onFocus="this.blur()"*/ onblur="setDD(document.all['tgl_ctt_kwn_ibu_dd'].value)">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ibu_mm value="<%=getMMTglKawinIbu%>" maxlength="2"  onKeyUp="return checkBulan(form1.tgl_ctt_kwn_ibu_mm, form1.tgl_ctt_kwn_ibu_yy)" /*onFocus="this.blur()"*/ onblur="setMM(document.all['tgl_ctt_kwn_ibu_mm'].value)">
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
System.out.println(831);
int wn_ayah = (request.getParameter("radiobutton4")==null?0:Integer.parseInt(request.getParameter("radiobutton4")));

if(statusReqAyah==ADANOTEXIST)
{
  System.out.println(837);
  System.out.println("radiobutton3="+request.getParameter("radiobutton3"));
  if (statusReqAyah==0) {
    edit="disabled";
    System.out.println("radiobutton edit="+edit);
  }
}

System.out.println(839);
int radiobutton3 = -1;
if ("Ada".equalsIgnoreCase(request.getParameter("radiobutton3")))
  radiobutton3 = 0;
else if ("Tidak Ada".equalsIgnoreCase(request.getParameter("radiobutton3")))
  radiobutton3 = 1;

int radiobutton4 = -1;
if ("1".equals(request.getParameter("radiobutton4")))
  radiobutton4 = 0;
else if ("2".equals(request.getParameter("radiobutton4")))
  radiobutton4 = 1;
System.out.println("request.getParameter(radiobutton3)"+request.getParameter("radiobutton3"));
System.out.println("request.getParameter(radiobutton4)"+request.getParameter("radiobutton4"));
System.out.println("radiobutton3"+radiobutton3);
System.out.println("radiobutton4"+radiobutton4);
//String nik_ayh = (request.getParameter("nik_ayh")==null?"":request.getParameter("nik_ayh"));
String nama_ayh = (request.getParameter("nama_ayh")==null?"":request.getParameter("nama_ayh"));
String getDDTglLahirAyah = (request.getParameter("no_akta_lhr_dd1")==null?"":request.getParameter("no_akta_lhr_dd1"));
String getMMTglLahirAyah = (request.getParameter("no_akta_lhr_mm1")==null?"":request.getParameter("no_akta_lhr_mm1"));
String getYYTglLahirAyah = (request.getParameter("no_akta_lhr_yy1")==null?"":request.getParameter("no_akta_lhr_yy1"));
int jenis_pkrjn_ayh = 0;
System.out.println("jenis_pkrjn_ayh"+jenis_pkrjn_ayh);
String alamat_ayh = (request.getParameter("alamat_ayh")==null?"":request.getParameter("alamat_ayh"));
String no_rt_ayh = (request.getParameter("no_rt_ayh")==null?"":request.getParameter("no_rt_ayh"));
String no_rw_ayh = (request.getParameter("no_rw_ayh")==null?"":request.getParameter("no_rw_ayh"));
String dusun_ayh = (request.getParameter("dusun_ayh")==null?"":request.getParameter("dusun_ayh"));
String kodepos_ayh = (request.getParameter("kodepos_ayh")==null?"":request.getParameter("kodepos_ayh"));
String telp_ayh = (request.getParameter("telp_ayh")==null?"":request.getParameter("telp_ayh"));
String nama_prop_ayh = (request.getParameter("nama_prop_ayh")==null?"":request.getParameter("nama_prop_ayh"));
String nama_kab_ayh = (request.getParameter("nama_kab_ayh")==null?"":request.getParameter("nama_kab_ayh"));
String nama_kec_ayh = (request.getParameter("nama_kec_ayh")==null?"":request.getParameter("nama_kec_ayh"));
String nkelayh = (request.getParameter("nkelayh")==null?"":request.getParameter("nkelayh"));
int ketrunan_ayh = (request.getParameter("ketrunan_ayh")==null?0:Integer.parseInt(request.getParameter("ketrunan_ayh")));
String bangsa_ayh = (request.getParameter("bangsa_ayh")==null?"":request.getParameter("bangsa_ayh"));
String getDDTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_dd")==null?"":request.getParameter("tgl_ctt_kwn_ayh_dd"));
String getMMTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_mm")==null?"":request.getParameter("tgl_ctt_kwn_ayh_mm"));
String getYYTglKawinAyah = (request.getParameter("tgl_ctt_kwn_ayh_yy")==null?"":request.getParameter("tgl_ctt_kwn_ayh_yy"));
System.out.println(868);
System.out.println("statusReqAyah="+statusReqAyah);
if (statusReqAyah==ADAEXIST) {
   if (wn_ayah==1) {
      System.out.println(871);
      nama_ayh = (wnidataKlr.getWniObj().getRecord3().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord3().getNamaLgkp().toUpperCase());
      getDDTglLahirAyah = getDD(wnidataKlr.getWniObj().getRecord3().getTglLhr());
      getMMTglLahirAyah = getMM(wnidataKlr.getWniObj().getRecord3().getTglLhr());
      getYYTglLahirAyah = getYY(wnidataKlr.getWniObj().getRecord3().getTglLhr());
      alamat_ayh = (wnidataKlr.getWniObj().getRecord3().getAlamat()==null?"":wnidataKlr.getWniObj().getRecord3().getAlamat());
      no_rt_ayh = (wnidataKlr.getWniObj().getRecord3().getNoRt()==null?"":wnidataKlr.getWniObj().getRecord3().getNoRt());
      no_rw_ayh = (wnidataKlr.getWniObj().getRecord3().getNoRw()==null?"":wnidataKlr.getWniObj().getRecord3().getNoRw());

      dusun_ayh = (wnidataKlr.getWniObj().getRecord3().getDusun()==null?"":wnidataKlr.getWniObj().getRecord3().getDusun());
      kodepos_ayh = (wnidataKlr.getWniObj().getRecord3().getKodePos()==null?"":wnidataKlr.getWniObj().getRecord3().getKodePos());
      telp_ayh = (wnidataKlr.getWniObj().getRecord3().getTelp()==null?"":wnidataKlr.getWniObj().getRecord3().getTelp());
      nama_prop_ayh = (wnidataKlr.getWniObj().getRecord3().getNoProp()==null?"":wnidataKlr.getWniObj().getRecord3().getNoProp());
      nama_kab_ayh = (wnidataKlr.getWniObj().getRecord3().getNoKab()==null?"":wnidataKlr.getWniObj().getRecord3().getNoKab());
      nama_kec_ayh = (wnidataKlr.getWniObj().getRecord3().getNoKec()==null?"":wnidataKlr.getWniObj().getRecord3().getNoKec());
      nkelayh = (wnidataKlr.getWniObj().getRecord3().getNoKel()==null?"":wnidataKlr.getWniObj().getRecord3().getNoKel());

   getDDTglKawinAyah = getDD(wnidataKlr.getWniObj().getRecord3().getTglKwn());
   getMMTglKawinAyah = getMM(wnidataKlr.getWniObj().getRecord3().getTglKwn());
   getYYTglKawinAyah = getYY(wnidataKlr.getWniObj().getRecord3().getTglKwn());
     jenis_pkrjn_ayh = (wnidataKlr.getWniObj().getRecord3().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord3().getJenisPkrjn()));
   } else if (wn_ayah==2) {
      System.out.println(893);
      nama_ayh = (wnidataKlr.getWnaObj().getRecord3().getNamaPertma()==null?"":wnidataKlr.getWnaObj().getRecord3().getNamaPertma().toUpperCase());
      getDDTglLahirAyah = getDD(wnidataKlr.getWnaObj().getRecord3().getTglLhr());
      getMMTglLahirAyah = getMM(wnidataKlr.getWnaObj().getRecord3().getTglLhr());
      getYYTglLahirAyah = getYY(wnidataKlr.getWnaObj().getRecord3().getTglLhr());
      alamat_ayh = (wnidataKlr.getWnaObj().getRecord3().getAlamat()==null?"":wnidataKlr.getWnaObj().getRecord3().getAlamat());
      no_rt_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoRt()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoRt().toString());
      no_rw_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoRw()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoRw().toString());
   dusun_ayh = (wnidataKlr.getWnaObj().getRecord3().getDusun()==null?"":wnidataKlr.getWnaObj().getRecord3().getDusun());
   kodepos_ayh = (wnidataKlr.getWnaObj().getRecord3().getKodePos()==null?"":wnidataKlr.getWnaObj().getRecord3().getKodePos().toString());
   telp_ayh = (wnidataKlr.getWnaObj().getRecord3().getTelp()==null?"":wnidataKlr.getWnaObj().getRecord3().getTelp());
   nama_prop_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoProp()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoProp().toString());
   nama_kab_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoKab()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoKab().toString());
   nama_kec_ayh = (wnidataKlr.getWnaObj().getRecord3().getNoKec()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoKec().toString());
   nkelayh = (wnidataKlr.getWnaObj().getRecord3().getNoKel()==null?"":wnidataKlr.getWnaObj().getRecord3().getNoKel().toString());
jenis_pkrjn_ayh = (wnidataKlr.getWnaObj().getRecord3().getJenisPkrjn()==null?0:wnidataKlr.getWnaObj().getRecord3().getJenisPkrjn().intValue());

   }
}
jenis_pkrjn_ayh = (request.getParameter("jenis_pkrjn_ayh")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_ayh"))==0?jenis_pkrjn_ayh:Integer.parseInt(request.getParameter("jenis_pkrjn_ayh")));
System.out.println(918);

%>
                  <div class="tab-page"  id="tabPage3">
                    <h2 class="tab">Data Ayah</h2>
                <script type="javascript">
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
                <input type="text" name="nik_ayh" size="18" value="<%=nik_ayah%>" class="boxdefault" maxlength="17" onKeyUp="num1(form1.nik_ayh);radioValid5();resetFieldAyah()"  onBlur="validateWNAyah(form1.nik_ayh, form1.radiobutton4); setSaveEnabled(false)">
                                  </p>
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
                                class=boxdefault size=2 name=no_akta_lhr_dd1 maxlength="2" value="<%=getDDTglLahirAyah%>" onKeyUp="return checkTanggal(form1.no_akta_lhr_dd1, form1.no_akta_lhr_mm1)" /*onFocus="this.blur()"*/>
                                      </td>
                                      <td>/ </td>

                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm1 maxlength="2" value="<%=getMMTglLahirAyah%>" onKeyUp="return checkBulan(form1.no_akta_lhr_mm1, form1.no_akta_lhr_yy1)" /*onFocus="this.blur()"*/>
                                      </td>
                                      <td>/</td>

                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy1 maxlength="4" value="<%=getYYTglLahirAyah%>" onKeyUp="return checkTahun(form1.no_akta_lhr_dd1, form1.no_akta_lhr_mm1, form1.no_akta_lhr_yy1)" /*onFocus="this.blur()"*/>
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
                                <select size="1" name="ketrunan_ayh" class="boxdefault" >
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
System.out.println(1330);
int wn_pelapor = (request.getParameter("nik_plpor")==null?0:(request.getParameter("nik_plpor").substring(0,1).equals("A")?2:1));

if(wnidataKlr.getWniObj().getRecord4() == null && wnidataKlr.getWnaObj().getRecord4() == null)
{
edit="disabled";
System.out.println("pelapor edit="+edit);
}
System.out.println(1178);
String nama_pelapor = "-";
String tgl_lahir_pelapor = "-";
int jenis_pkrjn_plpor = 0;
String alamat_pelapor = "-";
String rt_pelapor = "-";
String rw_pelapor = "-";
String dusun_pelapor = "-";
String kodepos_pelapor = "-";
String telp_pelapor = "-";
String no_akta_lhr_dd2 = (request.getParameter("no_akta_lhr_dd2")==null?"":request.getParameter("no_akta_lhr_dd2"));
String no_akta_lhr_mm2 = (request.getParameter("no_akta_lhr_mm2")==null?"":request.getParameter("no_akta_lhr_mm2"));
String no_akta_lhr_yy2 = (request.getParameter("no_akta_lhr_yy2")==null?"":request.getParameter("no_akta_lhr_yy2"));
System.out.println(1191);
if (wn_pelapor==1 && wnidataKlr.getWniObj().getRecord4()!=null) {
   nama_pelapor = (wnidataKlr.getWniObj().getRecord4().getNamaLgkp()==null?"":wnidataKlr.getWniObj().getRecord4().getNamaLgkp().toUpperCase());
   tgl_lahir_pelapor = (wnidataKlr.getWniObj().getRecord4().getTglLhr()==null?"":wnidataKlr.getWniObj().getRecord4().getTglLhr());
 alamat_pelapor = ((wnidataKlr.getWniObj().getRecord4().getAlamat()==null)?"-":wnidataKlr.getWniObj().getRecord4().getAlamat());
 rt_pelapor = ((wnidataKlr.getWniObj().getRecord4().getNoRt()==null)?"-":wnidataKlr.getWniObj().getRecord4().getNoRt().toString());
 rw_pelapor = ((wnidataKlr.getWniObj().getRecord4().getNoRw()==null)?"-":wnidataKlr.getWniObj().getRecord4().getNoRw().toString());
 dusun_pelapor = ((wnidataKlr.getWniObj().getRecord4().getDusun()==null)?"-":wnidataKlr.getWniObj().getRecord4().getDusun());
 kodepos_pelapor = ((wnidataKlr.getWniObj().getRecord4().getKodePos()==null)?"-":wnidataKlr.getWniObj().getRecord4().getKodePos().toString());
 telp_pelapor = ((wnidataKlr.getWniObj().getRecord4().getTelp()==null)?"-":wnidataKlr.getWniObj().getRecord4().getTelp());
 jenis_pkrjn_plpor = (wnidataKlr.getWniObj().getRecord4().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWniObj().getRecord4().getJenisPkrjn()));
   } else if (wn_pelapor==2 && wnidataKlr.getWnaObj().getRecord4()!=null) {
   nama_pelapor = (wnidataKlr.getWnaObj().getRecord4().getNamaPertma()==null?"":wnidataKlr.getWnaObj().getRecord4().getNamaPertma().toUpperCase());
   tgl_lahir_pelapor = (wnidataKlr.getWnaObj().getRecord4().getTglLhr()==null?"":wnidataKlr.getWnaObj().getRecord4().getTglLhr());
 alamat_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getAlamat()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getAlamat());
 rt_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getNoRt()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getNoRt().toString());
 rw_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getNoRw()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getNoRw().toString());
 dusun_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getDusun()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getDusun());
 kodepos_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getKodePos()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getKodePos().toString());
 telp_pelapor = ((wnidataKlr.getWnaObj().getRecord4().getTelp()==null)?"-":wnidataKlr.getWnaObj().getRecord4().getTelp());
jenis_pkrjn_plpor = (wnidataKlr.getWnaObj().getRecord4().getJenisPkrjn()==null?0:Integer.parseInt(wnidataKlr.getWnaObj().getRecord4().getJenisPkrjn()));
   }
jenis_pkrjn_plpor = (request.getParameter("jenis_pkrjn_plpor")==null || Integer.parseInt(request.getParameter("jenis_pkrjn_plpor"))==0?jenis_pkrjn_plpor:Integer.parseInt(request.getParameter("jenis_pkrjn_plpor")));
System.out.println(1211);
%>

<div class="tab-page" id="tabPage4">
                    <h2 class="tab">Data Pelapor</h2>
                <script type="javascript">
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


  <script language="javascript">
setupAllTabs();
</script>
</div>
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
        <input class=boxstandard type="submit" value="KONFIRMASI" name="kon" onClick="return konfirmasi()">
        </b></div>
    </td>
      <td width="110">
        <div align="center"></div>
      <div align="center"><b>
        <input class=boxstandard type=submit value=SIMPAN name="sim" onClick="return kelahiran()">
        </b></div>
    </td>
      <td width="98">
        <div align="center"><b>
                <input class=boxstandard type=button value=KELUAR name="kel" onclick="document.location='<%=record.getModRefFile()%>'">
                </b></div>
    </td>
      <td width="7">
        <div align="center"></div>
    </td>
  </tr>
  <tr>
    <td colspan="4">
      <div align="center"><font color="#003399">Keterangan : </font><font color="#000099" class="asterish">*</font><font color="#003399">Data
        harus diisi sesuai kondisi sebenarnya</font></div>
    </td>
  </tr>
</table>
<%
if(flag != null)
{
if(flag.equals("1"))
{%>
<script language="javascript">
</script>
<%}
else if(flag.equals("2"))
{%>
<script language="JavaScript">
  form1.nik.focus()
</script>
<%}}%>
 </form>
<script language="JavaScript">
  form1.tmpt_dilhr.selectedIndex = <%=tmpt_dilhr%>
  form1.wkt_pkl_lhr.selectedIndex = <%=wkt_pkl_lhr%>
  form1.jenis_klahir.selectedIndex = <%=jenis_klahir%>
  form1.pnlng_klahir.selectedIndex = <%=pnlng_klahir%>

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


  setupPekerjaan(form1.jenis_pkrjn_ibu, <%=wn_ibu%>);
  form1.jenis_pkrjn_ibu.selectedIndex = <%=jenis_pkrjn_ibu%>
  form1.ketrunan_ibu.selectedIndex = <%=ketrunan_ibu%>

  setupPekerjaan(form1.jenis_pkrjn_ayh, <%=wn_ayah%>);
  form1.jenis_pkrjn_ayh.selectedIndex = <%=jenis_pkrjn_ayh%>
  form1.ketrunan_ayh.selectedIndex = <%=ketrunan_ayh%>

  setupPekerjaan(form1.jenis_pkrjn_plpor, <%=wn_pelapor%>);
  form1.jenis_pkrjn_plpor.selectedIndex = <%=jenis_pkrjn_plpor%>
  setSaveEnabled(<%=("".equals(edit))%>)
</script>

</BODY></HTML>
<%
   }
   catch(Exception e)
  {
    System.out.println("Exception in List = " + e);
    System.out.println("Record in List jsp = " + wnidataKlr.getWniObj().getRecord1().getNamaLgkp());
    e.printStackTrace();
  }
%>
