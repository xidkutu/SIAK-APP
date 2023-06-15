<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*,java.text.SimpleDateFormat"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
    String edit1=null,edit=null,day =null,select,id1=null,
    nik_bayi=null,nik_saksi1=null,nik_saksi2=null,kel=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;

    DataWilayahaListHome home1;
    DataWilayahaList remote1;

    WNIBiodataHome home = null;
    WNIBiodata remote2;

    Vector v1,v_prop,v_kab,v_kec,v_kel;

    KabNikData lahirData=null;
    DataWilayahaListInfo obj;

    SaksiObject saksiData=null;

int i,j,k,ii,jj,kk;
String day1="";
String tgl_lahir="",tgl_mlpor="";
String dd="",mon="",yy="";
String ctt_tgl="";
String tgl_ctt_kwn="";
%>

<% Vector errMsg;
   String infoMsg;
   errMsg = new Vector();
   infoMsg = null;
     factory=ServiceController.getInstance();
     nik_saksi1 = (String)session.getAttribute("nik_saksi1");
     nik_saksi2 = (String)session.getAttribute("nik_saksi2");
     nik_bayi = (String)session.getAttribute("nik_bayi");
     kel = new String("KELUAR");

   try
   {
     v = new Vector();

record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
      home1=(DataWilayahaListHome)factory.lookup("DataWilayahaList",DataWilayahaListHome.class);
      remote1 = home1.create();

      obj=(DataWilayahaListInfo)remote1.getWilayahList();

     v_prop=obj.getPropinsi();
     v_kab=obj.getKabupaten();
     v_kec=obj.getKecamtan();
     v_kel=obj.getKelurahan();

      home = (WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);

      if(home != null)
      {
          remote2 = home.create();
      }

     saksiData = (SaksiObject)remote2.getSaksiData(nik_saksi1,nik_saksi2);

      if(remote2.getLahirData(nik_bayi,nik_saksi1,nik_saksi2) != null)
      {
         lahirData=(KabNikData)remote2.getLahirData(nik_bayi,nik_saksi1,nik_saksi2);
         day1 = getLocaleDay(lahirData.getRecordBayi().getTglLhr());
      }
      else if(request.getParameter("kel") != null)
      {
       if(request.getParameter("kel").equals(kel))
       {%>
         <jsp:forward page="Menu_Capil_KabKota.jsp"/>
<%     }
     }
      else
      {%>
          <jsp:forward page="Pencatatan_Kabupatein.jsp">
          <jsp:param name="n" value="0"/>
          </jsp:forward>
      <%}

%>
<html>
<script language="javascript">

function pilih_kab(frm)    //untuk pilih kabupaten
{


var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;

frm.no_kab_ibu.value="";
frm.nama_kab_ibu.length=1;

for(i=1;i<=frm.kabtot.value;i++)
{
strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];


  if  (objpropid.value==frm.nama_prop_ibu.options[frm.nama_prop_ibu.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_ibu.add(itm);
         }
}}

function pilih_kec(frm)	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();

var strpid,strkid,strkecid,strkecnama;

frm.no_kec_ibu.value="";
frm.nama_kec_ibu.length=1;

for(i=1;i<=frm.kectot.value;i++)
{
strpid="kec_propid" + i;
strkid="kec_kid" + i;
strkecid="kec_id" + i;
strkecnama="kec_nama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop_ibu.options[frm.nama_prop_ibu.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ibu.options[frm.nama_kab_ibu.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_ibu.add(itm);

         }
}}

function pilih_kel(frm)	//untuk pilih kecamatan
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkelid=new Object();
var objkelnama=new Object();

var strpid,strkid,strkecid,strkelid,strkelnama;

frm.no_kel_ibu.value="";
frm.nkelibu.length=1;

for(i=1;i<=frm.keltot.value;i++)
{
strpid="kel_propid" + i;
strkid="kel_kabid" + i;
strkecid="kel_kecid" + i;
strkelid="kel_id" + i;
strkelnama="kel_nama" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==frm.nama_prop_ibu.options[frm.nama_prop_ibu.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ibu.options[frm.nama_kab_ibu.selectedIndex].value) &&
(objkecid.value==frm.nama_kec_ibu.options[frm.nama_kec_ibu.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nkelibu.add(itm);

}
}}
//   Data listing for Data Ayah

function pilih_kab_ayh(frm)    //untuk pilih kabupaten
{
var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;

frm.no_kab_ayh.value="";
frm.nama_kab_ayh.length=1;

for(i=1;i<=frm.kabtot1.value;i++)
{
strpid="propid_ayh" + i;
strkid="kid_ayh" + i;
strknama="knama_ayh"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

  if  (objpropid.value==frm.nama_prop_ayh.options[frm.nama_prop_ayh.selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          frm.nama_kab_ayh.add(itm);
         }
}}

function pilih_kec_ayh(frm)	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();

var strpid,strkid,strkecid,strkecnama;

frm.no_kec_ayh.value="";
frm.nama_kec_ayh.length=1;

for(i=1;i<=frm.kectot1.value;i++)
{
strpid="kec_propid_ayh" + i;
strkid="kec_kid_ayh" + i;
strkecid="kec_id_ayh" + i;
strkecnama="kec_nama_ayh"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];

if ((objpropid.value==frm.nama_prop_ayh.options[frm.nama_prop_ayh.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ayh.options[frm.nama_kab_ayh.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          frm.nama_kec_ayh.add(itm);

         }
}}

function pilih_kel_ayh(frm)	//untuk pilih kecamatan
{
var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkelid=new Object();
var objkelnama=new Object();

var strpid,strkid,strkecid,strkelid,strkelnama;

frm.no_kel_ayh.value="";
frm.nkelayh.length=1;

for(i=1;i<=frm.keltot1.value;i++)
{
strpid="kel_propid_ayh" + i;
strkid="kel_kabid_ayh" + i;
strkecid="kel_kecid_ayh" + i;
strkelid="kel_id_ayh" + i;
strkelnama="kel_nama_ayh" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkelid=document.all[strkelid];
objkelnama=document.all[strkelnama];

if ((objpropid.value==frm.nama_prop_ayh.options[frm.nama_prop_ayh.selectedIndex].value) &&
(objkabid.value==frm.nama_kab_ayh.options[frm.nama_kab_ayh.selectedIndex].value) &&
(objkecid.value==frm.nama_kec_ayh.options[frm.nama_kec_ayh.selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          frm.nkelayh.add(itm);

}
}}



</script>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="SaksiInput.jsp">


<script language="text/javaScript">
var tp1;
</script>

<script language="javaScript" src="Templates/tabpane.js"></script>
<script type="javascript" src="Templates/webfxlayout.js"></script>
<SCRIPT language=JavaScript src="scripts/Kabupaten.js">
</SCRIPT>
<input type="hidden" name="proplength" value="<%=v_prop.size()%>">

<%
for(int i = 0; i < v_prop.size();i++)
{%>
<input type="hidden" name="nprop" value="<%=((GetPropList)v_prop.elementAt(i)).getNoprop()%>">
<input type="hidden" name="namaprop" value="<%=((GetPropList)v_prop.elementAt(i)).getNamaprop()%>">
<%}%>

<input type="hidden" name="kablength" value="<%=v_kab.size()%>">

<%
for(int i = 0; i < v_kab.size();i++)
{%>
<input type="hidden" name="nkabs" value="<%=((GetKabList)v_kab.elementAt(i)).getNokab()%>">
<input type="hidden" name="namakabs" value="<%=((GetKabList)v_kab.elementAt(i)).getNamakab()%>">
<input type="hidden" name="nkabprop" value="<%=((GetKabList)v_kab.elementAt(i)).getNoProp()%>">
<%}%>

<input type="hidden" name="keclength" value="<%=v_kec.size()%>">

<%
for(int i = 0; i < v_kec.size();i++)
{%>
<input type="hidden" name="nkecs" value="<%=((GetKecList)v_kec.elementAt(i)).getNokec()%>">
<input type="hidden" name="namakecs" value="<%=((GetKecList)v_kec.elementAt(i)).getNamakec()%>">
<input type="hidden" name="nkabkec" value="<%=((GetKecList)v_kec.elementAt(i)).getNokab()%>">
<input type="hidden" name="nkecprop" value="<%=((GetKecList)v_kec.elementAt(i)).getNoProp()%>">

<%}%>

<input type="hidden" name="kellength" value="<%=v_kel.size()%>">

<%
for(int i = 0; i < v_kel.size();i++)
{%>
<input type="hidden" name="nkels" value="<%=((GetKelList)v_kel.elementAt(i)).getNokel()%>">
<input type="hidden" name="namakels" value="<%=((GetKelList)v_kel.elementAt(i)).getNamakel()%>">
<input type="hidden" name="nkabkel" value="<%=((GetKelList)v_kel.elementAt(i)).getNokab()%>">
<input type="hidden" name="nkeckel" value="<%=((GetKelList)v_kel.elementAt(i)).getNokec()%>">
<input type="hidden" name="nkelprop" value="<%=((GetKelList)v_kel.elementAt(i)).getNoProp()%>">

<%}%>


<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK type="text/css" href="Templates/s.css" rel=stylesheet>

<link id="webfx-tab-style-sheet" type="text/css" rel="stylesheet" href="Templates/tab.webfx.css"/>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
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
<% String jsp = "data_wilayah.jsp?level=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
%>
                          <jsp:include page="<%=jsp%>"/>
                  </td>
        </tr>
		<tr>
		   <%
                           if(saksiData.getSaksi1Record() == null && saksiData.getSaksi1Record3() == null) {
                              errMsg.add("NIK Saksi1 salah,periksa kembali !");
                           }
                           if(saksiData.getSaksi2Record() == null && saksiData.getSaksi2Record4() == null) {
                              errMsg.add("NIK Saksi2 salah,periksa kembali !");
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
                          <div align="center">
<div class="tab-pane" id="tab-pane-1" style="postion:absolute">

<script type="text/javascript">

tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);


// ******* Finding the day in which bayi has born from Biodata_Wna *******************

/*function day()
{
  var day
  switch(<%=day1%>)
  {
      case 0:
         day="Minggu";
          break;
      case 1:
         day="Senin";
          break;
      case 2:
         day="Selasa";
          break;
      case 3:
         day="Rabu";
          break;
      case 4:
         day="Kamis";
          break;
      case 5:
         day="Jumat";
          break;
      case 6:
         day="Sabtu";
          break;
  }
  return (day.toUpperCase())
}*/
</script>

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
                                  <input type="text" name="nik_bayi" size="18" class="boxdefault" maxlength="17" onFocus="this.blur()"  onKeyUp="return num1(form1.nik_bayi)">
                                  <b><b> </b></b></p>
                              </td>
<%
if(request.getParameter("nik_bayi").startsWith("A"))
{%>
<script language="JavaScript">
form1.nik_bayi.value="A<%=lahirData.getRecordBayi().getNikBayi()%>"
</script>
<%}
else
{%>
<script language="JavaScript">
form1.nik_bayi.value="<%=lahirData.getRecordBayi().getNikBayi()%>"
</script>
<%}%>

                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=lahirData.getRecordBayi().getNamaLgkp().toUpperCase()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Jenis Kelamin</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=(lahirData.getRecordBayi().getJenisKlmin().equals(new java.math.BigDecimal("1")))?"Laki-laki":"Perempuan"%></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Dilahirkan<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="tmpt_dilhr" class="boxdefault" disabled>
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
                                <p style="line-height: 100%"> <%=lahirData.getRecordBayi().getTmptLhr().toUpperCase()%></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=lahirData.getRecordBayi().getTglLhr()%></p>
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
                                    <input type="text" name="pukul_lhr1" value="<%=lahirData.getRecordBayi().getPukulLhr().substring(0,2)%>" size="2" class="boxdefault" maxlength="2" disabled>
                                    <b>:</b>
                                    <input type="text" name="pukul_lhr2" size="2" value="<%=lahirData.getRecordBayi().getPukulLhr().substring(3,5)%>" class="boxdefault" maxlength="2" disabled>
                                    <select size="1" name="wkt_pkl_lhr" class="boxdefault" disabled>
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
                                  <select size="1" name="jenis_klahir" class="boxdefault" disabled>
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
                                  <input type="text" name="anak_ke_lhr" size="2" value="<%=lahirData.getRecordBayi().getAnakKeLahir()%>" class="boxdefault" maxlength="2" disabled>
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
                                  <select size="1" name="pnlng_klahir" class="boxdefault" disabled>
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
                                    <input type="text" name="brt_bayi" size="5" value="<%=lahirData.getRecordBayi().getBrtBayi()%>" class="boxdefault" maxlength="5"  disabled>
                                  Kg</p>
                              </td>
                            </tr>
                          </table>
                        </td>
  </tr>
</table>

   </div>

                    <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
                      <h2 class="tab">Data Ibu </h2>

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
                              <td width="21%">NIK Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton" value="Ada" disabled>
                                Ada<br>
                                <input type="radio" name="radiobutton" value="Tidak Ada" disabled>
                                Tidak Ada</td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton1" value="1" disabled>
                                WNI<br>
                                <input type="radio" name="radiobutton1" value="2" disabled>
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu" value="<%=lahirData.getRecordBayi().getNikIbu()%>" size="18" class="boxdefault" maxlength="17" disabled  onKeyUp="return num1(form1.nik_ibu)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu" value="<%=lahirData.getRecordBayi().getNamaIbu()%>" size="27" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
<p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
</td>
<td width="1%">:</td>
<td width="26%">

<%
tgl_lahir=lahirData.getRecordBayi().getTglLhrIbu();
dd = tgl_lahir.substring(8,10);
mon = tgl_lahir.substring(5,7);
yy = tgl_lahir.substring(0,4);
%>

<table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
<input class=boxdefault size=2 name=no_akta_lhr_dd value="<%=dd%>" maxlength="2" onKeyUp="return tab3()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2" value="<%=mon%>" onKeyUp="return tab4()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4" value="<%=yy%>" onKeyUp="return tab5()" disabled>
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
                  name=jenis_pkrjn_ibu1 boxdefault2 class="boxdefault" disabled >
                                      <option value="0" selected>-- Pilih Jenis Pekerjaan
                                      --</option>
                                      <option value="1">1 - Pelajar/Mahasiswa</option>
                                      <option value="2" >2 - Mengurus Rumah Tangga</option>
                                      <option  value="3">3 - Pensiunan</option>
                                      <option  value="4">4 - Belum/Tidak Bekerja</option>
                                      <option  value="5">5 - Petani/Pekebun</option>
                                      <option  value="6">6 - Peternak</option>
                                      <option  value="7">7 - Nelayan/Perikanan</option>
                                      <option  value="8">8 - Industri</option>
                                      <option  value="9">9 - Konstruksi</option>
                                      <option  value="10">10 - Perdagangan</option>
                                      <option  value="11">11 - Transportasi</option>
                                      <option  value="12">12 - Pegawai Negeri Sipil</option>
                                      <option  value="13">13 - Tentara Nasional Indonesia</option>
                                      <option  value="14">14 - Kepolisian R.I.</option>
                                      <option  value="15">15 - Jasa Lainnya</option>
                                      <option  value="16">16 - Lainnya</option>
                                    </select>
                                    <select

                  class="boxdefault" name="jenis_pkrjn_ibu2" disabled>
                                      <option  value="0" selected><b>-- Pilih Jenis Pekerjaan
                                      --</b></option>
                                      <option  value="1"><b>1 - Trading and Industry</b></option>
                                      <option  value="2"><b>2 - Forestry</b></option>
                                      <option  value="3"><b>3 - Mining and Energy</b></option>
                                      <option  value="4"><b>4 - Public Work</b></option>
                                      <option  value="5"><b>5 - Farming</b></option>
                                      <option  value="6"><b>6 - Religion</b></option>
                                      <option  value="7"><b>7 - Bank and Financial</b></option>
                                      <option  value="8"><b>8 - Health and Society</b></option>
                                      <option  value="9"><b>9 - Tourism</b></option>
                                      <option  value="10"><b>10 - Transportation and Communication</b></option>
                                      <option  value="11"><b>11 - Culture and Education</b></option>
                                      <option  value="12"><b>12 - Others</b></option>
                                    </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <input type="text" name="alamat_ibu" size="30" value="<%=lahirData.getRecordBayi().getAlamatIbu()%>" class="boxdefault" maxlength="120" disabled>
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="no_rt_ibu" size="3" value="<%=lahirData.getRecordBayi().getNoRtIbu()%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ibu)" disabled>
                                RW
                                <input type="text" name="no_rw_ibu" size="3" value="<%=lahirData.getRecordBayi().getNoRwIbu()%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ibu)" disabled>
                                Ds/Kpng/Dukuh </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ibu" value="<%=lahirData.getRecordBayi().getDusunIbu()%>" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Kode Pos</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ibu" value="<%=lahirData.getRecordBayi().getKodeposIbu()%>" size="7" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Telepon</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ibu" value="<%=lahirData.getRecordBayi().getTelpIbu()%>" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Provinsi<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

<input type="hidden" name="no_prop_ibu" value="">

                                  <select name="nama_prop_ibu"
 onChange="no_prop_ibu.value=this.value;pilih_kab(this.form)" class="boxdefault" disabled>
                                    <option>-- Pilih Provinsi --</option>

<%
for(int k=0;k<v_prop.size();k++)
{
%>
<option value="<%=((GetPropList)v_prop.elementAt(k)).getNoprop()%>">
 <%=((GetPropList)v_prop.elementAt(k)).getNamaprop()%></option>
<%
}
%>

 </select>

                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">


<input type="hidden" name="no_kab_ibu" value="">

<select class="boxdefault"
name="nama_kab_ibu" onChange="no_kab_ibu.value=this.value;pilih_kec(this.form)" disabled>
                                    <option>-- Pilih Kabupaten/Kota --</option>
 </select>

<%
i=0;

for(int l=0;l<v_kab.size();l++)

{
i++;
%>
<%="<input type=hidden name=kid" + i + " value=" + ((GetKabList)v_kab.elementAt(l)).getNokab() +">"%>
<%="<input type=hidden name=knama" + i + " value='" + ((GetKabList)v_kab.elementAt(l)).getNamakab() +"'>"%>
<%="<input type=hidden name=propid" + i + " value=" + ((GetKabList)v_kab.elementAt(l)).getNoProp() +">"%>
<%
}
%>

                                </td>
                            </tr>
                            <tr>
                                <td width="21%" height="40">
                                  <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%" height="40">:</td>
                                <td width="26%" height="40">

<input type="hidden" name="no_kec_ibu" value="">

<select class="boxdefault"
 name="nama_kec_ibu"  onChange="no_kec_ibu.value=this.value;pilih_kel(this.form)"  disabled>
                                    <option>-- Pilih Kecamatan --</option>

 </select>
 <%
j=0;
for(int m=0;m<v_kec.size();m++)
{
j++;
%>
<%="<input type=hidden name=kec_id" + j + " value=" + ((GetKecList)v_kec.elementAt(m)).getNokec() +">"%>
<%="<input type=hidden name=kec_nama" + j + " value='" + ((GetKecList)v_kec.elementAt(m)).getNamakec() +"'>"%>
<%="<input type=hidden name=kec_kid" + j + " value=" + ((GetKecList)v_kec.elementAt(m)).getNokab() +">"%>
<%="<input type=hidden name=kec_propid" + j + " value=" + ((GetKecList)v_kec.elementAt(m)).getNoProp() +">"%>
<%
}
%>

                                </td>
                              <td width="1%" height="40">&nbsp;</td>
                                <td width="24%" height="40">
                                  <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%" height="40">:</td>
                                <td width="26%" height="40">

<input type="hidden" name="no_kel_ibu" value="">

 <select class="boxdefault"  name="nkelibu" disabled>
       <option>-- Pilih Desa/Kelurahan --</option>

<%
k=0;
for(int n=0;n<v_kel.size();n++)
{
k++;
%>
<%="<input type=hidden name=kel_id" + k + " value=" + ((GetKelList)v_kel.elementAt(n)).getNokel() +">"%>
<%="<input type=hidden name=kel_nama" + k + " value='" + ((GetKelList)v_kel.elementAt(n)).getNamakel() +"'>"%>
<%="<input type=hidden name=kel_kecid" + k + " value=" + ((GetKelList)v_kel.elementAt(n)).getNokec() +">"%>
<%="<input type=hidden name=kel_kabid" + k + " value=" + ((GetKelList)v_kel.elementAt(n)).getNokab() +">"%>
<%="<input type=hidden name=kel_propid" + k + " value=" + ((GetKelList)v_kel.elementAt(n)).getNoProp() +">"%>
<%
}
%>

</select>

                                </td>
                            </tr>
                            <tr>
                                <td width="21%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ketrunan_ibu" class="boxdefault" disabled>
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
                                <p style="line-height: 100%">Kebangsaan (Bagi
                                  WNA)</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="bangsa_ibu" value="<%=lahirData.getRecordBayi().getBangsaIbu()%>" size="22" class="boxdefault" maxlength="40" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Pencatatan
                                  Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
<%
ctt_tgl=lahirData.getRecordBayi().getTglCttKwnIbu();
dd = ctt_tgl.substring(8,10);
mon = ctt_tgl.substring(5,7);
yy = ctt_tgl.substring(0,4);
%>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ibu_dd value="<%=dd%>" maxlength="2"  onKeyUp="return tab6()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ibu_mm maxlength="2" value="<%=mon%>" onKeyUp="return tab7()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_ctt_kwn_ibu_yy maxlength="4" value="<%=yy%>" onKeyUp="return tab8()" disabled>
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
                                  <input type="radio" name="radiobutton3" value="Ada"  disabled>
                                Ada<br>
                                <input type="radio" name="radiobutton3" value=" Tidak Ada"  disabled>
                                Tidak Ada</td>
                                <td width="1%" height="43">&nbsp;</td>
                                <td width="24%" height="43">Warga Negara Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton4" value="1"   disabled>
                                WNI<br>
                                <input type="radio" name="radiobutton4" value="2"   disabled>
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh" value="<%=lahirData.getRecordBayi().getNikAyh()%>" size="18" class="boxdefault" maxlength="17" disabled  onKeyUp="return num1(form1.nik_ayh)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh" value="<%=lahirData.getRecordBayi().getNamaAyh()%>" size="27" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>

<%
tgl_lahir=lahirData.getRecordBayi().getTglLhirAyh();


dd=tgl_lahir.substring(8,10);
mon = tgl_lahir.substring(5,7);
yy = tgl_lahir.substring(0,4);
%>
                                <td width="26%">
                                  <table width="100" border="0" cellspacing="3" cellpadding="0">
                                    <tr>
                                      <td>
                                        <input
                                class=boxdefault size=2 name=no_akta_lhr_dd1 value="<%=dd%>" maxlength="2" onKeyUp="return tab9()" disabled>
                                      </td>
                                      <td>/ </td>
                                      <td>
                                        <input
                                class=boxdefault size=2 name=no_akta_lhr_mm1 value="<%=mon%>" maxlength="2" onKeyUp="return tab10()" disabled>
                                      </td>
                                      <td>/</td>
                                      <td>
                                        <input
                                class=boxdefault size=4 name=no_akta_lhr_yy1 value="<%=yy%>" maxlength="4" onKeyUp="return tab11()" disabled>
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

                  name=jenis_pkrjn_ayh1 boxdefault2 class="boxdefault" disabled >
                                     <option value="0" selected>-- Pilih Jenis Pekerjaan
                                      --</option>
                                      <option value="1">1 - Pelajar/Mahasiswa</option>
                                      <option value="2" >2 - Mengurus Rumah Tangga</option>
                                      <option  value="3">3 - Pensiunan</option>
                                      <option  value="4">4 - Belum/Tidak Bekerja</option>
                                      <option  value="5">5 - Petani/Pekebun</option>
                                      <option  value="6">6 - Peternak</option>
                                      <option  value="7">7 - Nelayan/Perikanan</option>
                                      <option  value="8">8 - Industri</option>
                                      <option  value="9">9 - Konstruksi</option>
                                      <option  value="10">10 - Perdagangan</option>
                                      <option  value="11">11 - Transportasi</option>
                                      <option  value="12">12 - Pegawai Negeri Sipil</option>
                                      <option  value="13">13 - Tentara Nasional Indonesia</option>
                                      <option  value="14">14 - Kepolisian R.I.</option>
                                      <option  value="15">15 - Jasa Lainnya</option>
                                      <option  value="16">16 - Lainnya</option>
                                  </select>
                                  <select
                    class="boxdefault" name="jenis_pkrjn_ayh2" disabled>
                                    <option  value="0" selected><b>-- Pilih Jenis Pekerjaan
                                      --</b></option>
                                      <option  value="1"><b>1 - Trading and Industry</b></option>
                                      <option  value="2"><b>2 - Forestry</b></option>
                                      <option  value="3"><b>3 - Mining and Energy</b></option>
                                      <option  value="4"><b>4 - Public Work</b></option>
                                      <option  value="5"><b>5 - Farming</b></option>
                                      <option  value="6"><b>6 - Religion</b></option>
                                      <option  value="7"><b>7 - Bank and Financial</b></option>
                                      <option  value="8"><b>8 - Health and Society</b></option>
                                      <option  value="9"><b>9 - Tourism</b></option>
                                      <option  value="10"><b>10 - Transportation and Communication</b></option>
                                      <option  value="11"><b>11 - Culture and Education</b></option>
                                      <option  value="12"><b>12 - Others</b></option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <div align="left">
                                  <input type="text" name="alamat_ayh" size="30" value="<%=lahirData.getRecordBayi().getAlamatAyh()%>" class="boxdefault" maxlength="120" disabled>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="no_rt_ayh" size="3" value="<%=lahirData.getRecordBayi().getNoRtAyh()%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ayh)" disabled>
                                  RW
                                  <input type="text" name="no_rw_ayh" size="3" value="<%=lahirData.getRecordBayi().getNoRwAyh()%>" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ayh)" disabled>
                                  Ds/Kpng/Dukuh</div>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ayh" size="22" value="<%=lahirData.getRecordBayi().getDusunAyh()%>" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Kode Pos</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ayh" value="<%=lahirData.getRecordBayi().getKodeposAyh()%>" size="7" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Telepon</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ayh" value="<%=lahirData.getRecordBayi().getTelpAyh()%>" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Provinsi<font color="#000099" class="asterish"></font><font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

<input type="hidden" name="no_prop_ayh" value="">

<select name="nama_prop_ayh"
 onChange="no_prop_ayh.value=this.value;pilih_kab_ayh(this.form)" class="boxdefault" disabled>
                                    <option>-- Pilih Provinsi --</option>

<%
for(int k=0;k<v_prop.size();k++)
{
%>
<option value="<%=((GetPropList)v_prop.elementAt(k)).getNoprop()%>">
 <%=((GetPropList)v_prop.elementAt(k)).getNamaprop()%></option>
<%
}
%>
 </select>

                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

<input type="hidden" name="no_kab_ayh" value="">


<select class="boxdefault"
name="nama_kab_ayh" onChange="no_kab_ayh.value=this.value;pilih_kec_ayh(this.form)" disabled>
                                    <option>-- Pilih Kabupaten/Kota --</option>
</select>

<%
ii=0;

for(int l=0;l<v_kab.size();l++)

{
ii++;
%>
<%="<input type=hidden name=kid_ayh" + ii + " value=" + ((GetKabList)v_kab.elementAt(l)).getNokab() +">"%>
<%="<input type=hidden name=knama_ayh" + ii + " value='" + ((GetKabList)v_kab.elementAt(l)).getNamakab() +"'>"%>
<%="<input type=hidden name=propid_ayh" + ii + " value=" + ((GetKabList)v_kab.elementAt(l)).getNoProp() +">"%>
<%
}
%>

                                </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">
<input type="hidden" name="no_kec_ayh" value="">

<select class="boxdefault"
 name="nama_kec_ayh"  onChange="no_kec_ayh.value=this.value;pilih_kel_ayh(this.form)" disabled >
                                    <option>-- Pilih Kecamatan --</option>

</select>
 <%
jj=0;
for(int m=0;m<v_kec.size();m++)
{
jj++;
%>
<%="<input type=hidden name=kec_id_ayh" + jj + " value=" + ((GetKecList)v_kec.elementAt(m)).getNokec() +">"%>
<%="<input type=hidden name=kec_nama_ayh" + jj + " value='" + ((GetKecList)v_kec.elementAt(m)).getNamakec() +"'>"%>
<%="<input type=hidden name=kec_kid_ayh" + jj + " value=" + ((GetKecList)v_kec.elementAt(m)).getNokab() +">"%>
<%="<input type=hidden name=kec_propid_ayh" + jj + " value=" + ((GetKecList)v_kec.elementAt(m)).getNoProp() +">"%>
<%
}
%>
                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">
<input type="hidden" name="no_kel_ayh" value="" disabled>

 <select class="boxdefault"  name="nkelayh" disabled>
    <option>-- Pilih Desa/Kelurahan --</option>
<%
kk=0;
for(int n=0;n<v_kel.size();n++)
{
kk++;
%>
<%="<input type=hidden name=kel_id_ayh" + kk + " value=" + ((GetKelList)v_kel.elementAt(n)).getNokel() +">"%>
<%="<input type=hidden name=kel_nama_ayh" + kk + " value='" + ((GetKelList)v_kel.elementAt(n)).getNamakel() +"'>"%>
<%="<input type=hidden name=kel_kecid_ayh" + kk + " value=" + ((GetKelList)v_kel.elementAt(n)).getNokec() +">"%>
<%="<input type=hidden name=kel_kabid_ayh" + kk + " value=" + ((GetKelList)v_kel.elementAt(n)).getNokab() +">"%>
<%="<input type=hidden name=kel_propid_ayh" + kk + " value=" + ((GetKelList)v_kel.elementAt(n)).getNoProp() +">"%>
<%
}
%>

</select>
                                </td>
                            </tr>
                            <tr>
                              <td width="21%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ketrunan_ayh" class="boxdefault" disabled>
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
                                <input type="text" name="bangsa_ayh" value="<%=lahirData.getRecordBayi().getBangsaAyh()%>" size="22" class="boxdefault" maxlength="40" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Pencatatan
                                  Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<%
tgl_ctt_kwn=lahirData.getRecordBayi().getTglCttKwnAyh();
dd = tgl_ctt_kwn.substring(8,10);
mon = tgl_ctt_kwn.substring(5,7);
yy = tgl_ctt_kwn.substring(0,4);
%>
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ayh_dd value="<%=dd%>" maxlength="2" onKeyUp="return tab12()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ayh_mm value="<%=mon%>" maxlength="2" onKeyUp="return tab13()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_ctt_kwn_ayh_yy value="<%=yy%>" maxlength="4" onKeyUp="return tab14()" disabled>
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
                                  <input type="text" name="nik_plpor" value="<%=lahirData.getRecordBayi().getNikPlpor()%>" size="18" class="boxdefault" maxlength="17"   onKeyUp="return num1(form1.nik_plpor)" disabled>
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=lahirData.getRecordPelapor().getNamaLgkp()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
<%=lahirData.getRecordPelapor().getTglLhr()%></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">
                                    <select
                     name=jenis_pkrjn1_plpor boxdefault2 class="boxdefault" disabled>
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
                                      <option value="13">13 - Tentara Nasional
                                      Indonesia</option>
                                      <option value="14">14 - Kepolisian R.I.</option>
                                      <option value="15">15 - Jasa Lainnya</option>
                                      <option value="16">16 - Lainnya</option>
                                    </select>
                                    <select
                    class="boxdefault" name="jenis_pkrjn2_plpor" disabled>
                                      <option  value="0" selected><b>-- Pilih
                                      Jenis Pekerjaan --</b></option>
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
                                      <option  value="11"><b>11 - Culture and
                                      Education</b></option>
                                      <option  value="12"><b>12 - Others</b></option>
                                    </select>
                                  </p>
                                  </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5"><%=lahirData.getRecordPelapor().getAlamat()%>, <br> <%=lahirData.getRecordPelapor().getNoRt()%>, <%=lahirData.getRecordPelapor().getNoRw()%>,<%=lahirData.getRecordPelapor().getDusun()%>,<%=lahirData.getRecordPelapor().getKodePos()%>,<%=lahirData.getRecordPelapor().getTelp()%></td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Melapor<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">


<%
tgl_mlpor = lahirData.getRecordBayi().getTglMlpor();
dd = tgl_mlpor.substring(8,10);
mon = tgl_mlpor.substring(5,7);
yy = tgl_mlpor.substring(0,4);
%>
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd2 value="<%=dd%>" maxlength="2"  onKeyUp="return tab15()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm2 maxlength="2" value="<%=mon%>" onKeyUp="return tab16()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy2 maxlength="4" value="<%=yy%>" onKeyUp="return tab17()" disabled>
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

<% // ************** Data for Saksi1 from Biodata_Wni for given NIK *************** %>

<%
if(saksiData.getSaksi1Record() != null)
{
  edit="disabled";
  edit1=null;
%>
<div class="tab-page"  id="tabPage5" >
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
                                  <input type="text" name="nik_sksi1" value="<%=request.getParameter("nik_sksi1")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)" >
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=saksiData.getSaksi1Record().getNamaLgkp().toUpperCase()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi1Record().getTmptLhr().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=saksiData.getSaksi1Record().getTglLhr()%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%"><%=saksiData.getSaksi1Record().getAlamat()%>, <br> <%=saksiData.getSaksi1Record().getNoRt()%>, <%=saksiData.getSaksi1Record().getNoRw()%>,<%=saksiData.getSaksi1Record().getDusun()%>,<%=saksiData.getSaksi1Record().getKodePos()%>,<%=saksiData.getSaksi1Record().getTelp()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi1Record().getAgama().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pkrjn1_s1 boxdefault2 class="boxdefault">
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
                                  <select
                    class="boxdefault" name="jenis_pkrjn2_s1" disabled>
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
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
<script language="JavaScript">
form1.jenis_pkrjn1_s1.options[<%=saksiData.getSaksi1Record().getJenisPkrjn()%>].selected=true
</script>

  </div>

<% // ************** Data for Saksi1 from Biodata_Wna for given NIK *************** %>

<%}
else if(saksiData.getSaksi1Record3() != null)
{
edit="disabled";
  edit1=null;
%>

<div class="tab-page"  id="tabPage5" >
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
                                  <input type="text" name="nik_sksi1" value="<%=request.getParameter("nik_sksi1")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=saksiData.getSaksi1Record3().getNamaLgkp().toUpperCase()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi1Record3().getTmptLhr().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%"><%=saksiData.getSaksi1Record3().getTglLhr()%></td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%"><%=saksiData.getSaksi1Record3().getAlamat()%>, <br> <%=saksiData.getSaksi1Record3().getNoRt()%>, <%=saksiData.getSaksi1Record3().getNoRw()%>,<%=saksiData.getSaksi1Record3().getDusun()%>,<%=saksiData.getSaksi1Record3().getKodePos()%>,<%=saksiData.getSaksi1Record3().getTelp()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi1Record3().getAgama().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pkrjn1_s1 boxdefault2 class="boxdefault" disabled>
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
                                  <select
                    class="boxdefault" name="jenis_pkrjn2_s1">
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
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
<script language="JavaScript">
form1.jenis_pkrjn2_s1.options[<%=saksiData.getSaksi1Record3().getJenisPkrjn()%>].selected=true
</script>

  </div>
<% // ************** Check for wrong NIK / tida ada *************** %>

<%}
else
{%>
<script language="JavaScript">
<%edit=null;
edit1="disabled";%>
</script>

<div class="tab-page"  id="tabPage5" >
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
                                  <input type="text" name="nik_sksi1" value="" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&lt;relasional dgn
                                  biodata&gt;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%">&lt;relasional dgn biodata&gt;</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">&lt;relasional dgn biodata&gt;</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">&lt;relasional dgn
                                  Data Keluarga Jalan, RT, RW, Dusun/Kampung/Dukuh,
                                  Kode Pos, Telepon&gt;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%">&lt;relasional dgn biodata&gt; </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pkrjn1_s1 boxdefault2 class="boxdefault" disabled>
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
                                  <select
                    class="boxdefault" name="jenis_pkrjn2_s1" disabled>
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
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
<%}%>

<% // ************** Data for Saksi2 from Biodata_Wni for given NIK *************** %>

<%
if(saksiData.getSaksi2Record() != null)
{
edit="disabled";
  edit1=null;
%>
<div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
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
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" value="<%=request.getParameter("nik_sksi2")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=saksiData.getSaksi2Record().getNamaLgkp().toUpperCase()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi2Record().getTmptLhr().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
  <%=saksiData.getSaksi2Record().getTglLhr()%>
</td>
                            </tr>
                            <tr>
                              <td width="22%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5"><%=saksiData.getSaksi2Record().getAlamat()%>, <br> <%=saksiData.getSaksi2Record().getNoRt()%>, <%=saksiData.getSaksi2Record().getNoRw()%>,<%=saksiData.getSaksi2Record().getDusun()%>,<%=saksiData.getSaksi2Record().getKodePos()%>,<%=saksiData.getSaksi2Record().getTelp()%></td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi2Record().getAgama().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pkrjn1_s2 boxdefault2 class="boxdefault">
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
                                  <select
                    class="boxdefault" name="jenis_pkrjn2_s2" disabled>
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
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
<script language="JavaScript">
form1.jenis_pkrjn1_s2.options[<%=saksiData.getSaksi2Record().getJenisPkrjn()%>].selected=true
</script>
  </div>
<% // ************** Data for Saksi2 from Biodata_Wna for given NIK *************** %>

<%}

else if(saksiData.getSaksi2Record4() != null)
{
  edit="disabled";
  edit1=null;
%>

<div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
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
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" value="<%=request.getParameter("nik_sksi2")%>" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%"><%=saksiData.getSaksi2Record4().getNamaLgkp().toUpperCase()%></p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi2Record4().getTmptLhr().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
          <%=saksiData.getSaksi2Record4().getTglLhr()%></td>
                            </tr>
                            <tr>
                              <td width="22%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5"><%=saksiData.getSaksi2Record4().getAlamat()%>, <br> <%=saksiData.getSaksi2Record4().getNoRt()%>, <%=saksiData.getSaksi2Record4().getNoRw()%>,<%=saksiData.getSaksi2Record4().getDusun()%>,<%=saksiData.getSaksi2Record4().getKodePos()%>,<%=saksiData.getSaksi2Record4().getTelp()%></td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%"><%=saksiData.getSaksi2Record4().getAgama().toUpperCase()%></td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pkrjn1_s2 boxdefault2 class="boxdefault" disabled>
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
                                  <select
                    class="boxdefault" name="jenis_pkrjn2_s2">
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
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
<script language="JavaScript">
form1.jenis_pkrjn2_s2.options[<%=saksiData.getSaksi2Record4().getJenisPkrjn()%>].selected=true
</script>
  </div>
<% // ************** Check for wrong Saksi2 NIK Ibu / tida ada *************** %>

<%}
else
{%>
<script>
<%edit=null;
 edit1="disabled";%>
</script>

<div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
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
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&lt;relasional dgn
                                  biodata&gt;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%">&lt;relasional dgn biodata&gt;</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">&lt;relasional dgn biodata&gt;</td>
                            </tr>
                            <tr>

                              <td width="22%">Alamat</td>
                              <td width="1%">:</td>
                              <td colspan="5">&lt;relasional dgn Data Keluarga
                                Jalan, RT, RW, Dusun/Kampung/Dukuh, Kode Pos,
                                Telepon&gt;</td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%">&lt;relasional dgn biodata&gt;</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <select
                     name=jenis_pkrjn1_s2 boxdefault2 class="boxdefault" disabled>
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
                                  <select
                    class="boxdefault" name="jenis_pkrjn2_s2" disabled>
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
                                </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

<%}%>

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
                                <td width="21%">
                                  <p style="line-height: 100%">Jenis Daftar Kelahiran<font color="#000099" class="asterish">*</font>
                                  </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
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
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">Dasar Hukum Pencatatan
                                    Kelahiran<font color="#000099" class="asterish">*</font></p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <select size="1" name="dsrhk_cttlhr" class="boxdefault">
                                      <option  value="0" selected>-- Pilih Dasar
                                      Hukum --</option>
                                      <option value="1">1 - Stbld 1849 No. 25</option>
                                      <option value="2">2 - Stbld 1917 No.130
                                      jo 1919 No.81</option>
                                      <option value="3">3 - Stbld 1920 No.751
                                      jo 1927 No.584</option>
                                      <option value="4">4 - Stbld 1933 No.75 jo
                                      1936 No.607</option>
                                      <option value="5">5 - Non Stbld</option>
                                    </select>
                                  </p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%" valign="middle" height="110">
                                  <p>Dokumen Persyaratan<font color="#000099" class="asterish">*
                                    </font></p>

                                </td>
                                <td width="1%" valign="middle" height="110">:</td>
                                <td colspan="5" valign="middle" height="110">
                                  <font color="#000099" class="asterish">
                                  <select name="doc_per" size="6" multiple>
                                    <option value="1">Surat Kenal Lahir dari RS/Dokter/Bidan</option>
                                    <option value="2">Keterangan Kelahiran dari
                                    Desa/Kelurahan</option>
                                    <option value="3">Copy KTP dan KK Orang Tua</option>
                                    <option value="4">Akta Kawin Orang Tua</option>
                                    <option value="5">Surat Kewarganegaraan Orang
                                    Tua</option>
                                    <option value="6">Paspor Orang Tua</option>
                                  </select>
                                  ( <font color="#000000"> use ctrl+mouse click
                                  for multiple selection</font></font> )</td>
                              </tr>
                              <tr>
                                <td width="21%">
                                  <p style="line-height: 100%">Nomor Akta Kelahiran</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"> &lt;Create by
                                    system&gt;</p>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">Tanggal Akta Kelahiran</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">&lt;sysdate&gt; </td>
                              </tr>
                              <tr>
                                <td width="21%">Tanggal Cetak Kutipan Akta</td>
                                <td width="1%">:</td>
                                <td width="26%"> &lt;print date&gt;</td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">Jabatan pada Kantor/Dinas</td>
                                <td width="1%">:</td>
                                <td width="26%"> &lt;Relational from setup penandatangan
                                  dokumen&gt; </td>
                              </tr>
                              <tr>
                                <td width="21%">Nama Pejabat</td>
                                <td width="1%">:</td>
                                <td width="26%"> &lt;Relational from setup penandatangan
                                  dokumen&gt; </td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">NIP Pejabat</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"> &lt;Relational
                                    from setup penandatangan dokumen&gt; </p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%">
                                  <p style="line-height: 100%">Nama Kepala Desa/Lurah
                                    <font color="#000099" class="asterish"></font>
                                  </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nama_kep_des" size="27" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_kep_des)">
                                  </p>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">NIP Lurah </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nip_lrh" size="9" class="boxdefault" maxlength="9" onKeyUp="return num(form1.nip_lrh)">
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
                                    <input type="text" name="nama_pet_reg" size="27" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_pet_reg)">
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
                                    <input type="text" name="nip_pet_reg" size="9" class="boxdefault" maxlength="9"  onKeyUp="return num(form1.nip_pet_reg)">
                                </td>
                              </tr>
                              <tr>
                                <td align="center" width="21%">
                                  <p align="left" style="line-height: 100%">Nama
                                    Petugas Entri Data
                                </td>
                                <td width="1%">:</td>
                                <td align="center" width="26%">
                                  <p align="left" style="line-height: 100%"> &lt;get
                                    by login&gt;
                                </td>
                                <td align="center" width="1%">&nbsp;</td>
                                <td width="24%">
                                  <p style="line-height: 100%">NIP Petugas Entri
                                    Data</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%"> &lt;get by login&gt;</p>
                                </td>
                              </tr>
                              <tr>
                                <td width="21%">
                                  <p style="line-height: 100%">Tanggal Entri Data</p>
                                </td>
                                <td width="1%">:</td>
                                <td width="26%"> &lt;sysdate&gt;</td>
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
        <input class=boxstandard type="submit" value="KONFIRMASI"  name="kon">
        </b></div>
    </td>
      <td width="110">
        <div align="center"><b> </b></div>
      <div align="center"><b>        <input class=boxstandard type="submit" value="SIMPAN" name="sim" onClick="return kab()" >
        </b></div>
    </td>
      <td width="98">
        <div align="center"><b>
          <input class=boxstandard type="submit" value="KELUAR" name="kel">
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
<input type=hidden name="kabtot" value="<%=i%>">
<input type=hidden name="kectot" value="<%=j%>">
<input type=hidden name="keltot" value="<%=k%>">

<input type=hidden name="kabtot1" value="<%=ii%>">
<input type=hidden name="kectot1" value="<%=jj%>">
<input type=hidden name="keltot1" value="<%=kk%>">

<script language="JavaScript">

form1.tmpt_dilhr.options[<%=lahirData.getRecordBayi().getTmptDilhr()%>].selected=true
form1.wkt_pkl_lhr.options[<%=lahirData.getRecordBayi().getWktPklLhr()%>].selected=true
form1.jenis_klahir.options[<%=lahirData.getRecordBayi().getJenisKlahir()%>].selected=true
form1.pnlng_klahir.options[<%=lahirData.getRecordBayi().getPnlngBayi()%>].selected=true

if(<%=lahirData.getRecordBayi().getKwrngrnIbu().equals(new java.math.BigDecimal("1"))%>)
{
  form1.radiobutton1[0].checked=true
  form1.jenis_pkrjn_ibu1.options[<%=lahirData.getRecordBayi().getJenisPkrjnIbu()%>].selected=true
}
if(<%=lahirData.getRecordBayi().getKwrngrnIbu().equals(new java.math.BigDecimal("2"))%>)
{
  form1.radiobutton1[1].checked=true
  form1.jenis_pkrjn_ibu2.options[<%=lahirData.getRecordBayi().getJenisPkrjnIbu()%>].selected=true
}
form1.ketrunan_ibu.options[<%=lahirData.getRecordBayi().getKetrunanIbu()%>].selected=true

if(<%=lahirData.getRecordBayi().getKwrngrnAyh().equals(new java.math.BigDecimal("1"))%>)
{
  form1.radiobutton4[0].checked=true
  form1.jenis_pkrjn_ayh1.options[<%=lahirData.getRecordBayi().getJenisPkrjnAyh()%>].selected=true
}
if(<%=lahirData.getRecordBayi().getKwrngrnIbu().equals(new java.math.BigDecimal("2"))%>)
{
  form1.radiobutton4[1].checked=true
  form1.jenis_pkrjn_ayh2.options[<%=lahirData.getRecordBayi().getJenisPkrjnAyh()%>].selected=true
}
form1.ketrunan_ayh.options[<%=lahirData.getRecordBayi().getKetrunanAyh()%>].selected=true

<%if(lahirData.getRecordBayi() != null)
{%>
for(i = 0; i < form1.proplength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoPropIbu()%> == form1.nprop[i].value)
  {
    form1.nama_prop_ibu.options[0].text=form1.namaprop[i].value
    break
  }
  else
  {
    form1.nama_prop_ibu.options[0].text=null
  }
}

for(i = 0; i < form1.kablength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoKabIbu()%> == form1.nkabs[i].value
   && <%=lahirData.getRecordBayi().getNoPropIbu()%> == form1.nkabprop[i].value)
  {
    form1.nama_kab_ibu.options[0].text=form1.namakabs[i].value
    break
  }
  else
  {
    form1.nama_kab_ibu.options[0].text=null
  }
}

for(i = 0; i < form1.keclength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoKecIbu()%> == form1.nkecs[i].value
   && <%=lahirData.getRecordBayi().getNoPropIbu()%> == form1.nkecprop[i].value
   && <%=lahirData.getRecordBayi().getNoKabIbu()%> == form1.nkabkec[i].value)
  {
    form1.nama_kec_ibu.options[0].text=form1.namakecs[i].value
    break
  }
  else
  {
    form1.nama_kec_ibu.options[0].text=null
  }
}

for(i = 0; i < form1.kellength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoKelIbu()%> == form1.nkels[i].value
   && <%=lahirData.getRecordBayi().getNoKecIbu()%> == form1.nkeckel[i].value
   && <%=lahirData.getRecordBayi().getNoPropIbu()%> == form1.nkelprop[i].value
   && <%=lahirData.getRecordBayi().getNoKabIbu()%> == form1.nkabkel[i].value)
  {
    form1.nkelibu.options[0].text=form1.namakels[i].value
    break
  }
  else
  {
    form1.nkelibu.options[0].text=null
  }
}

for(i = 0; i < form1.proplength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoPropAyh()%> == form1.nprop[i].value)
  {
    form1.nama_prop_ayh.options[0].text=form1.namaprop[i].value
    break
  }
  else
  {
    form1.nama_prop_ayh.options[0].text=null
  }
}

for(i = 0; i < form1.kablength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoKabAyh()%> == form1.nkabs[i].value
   && <%=lahirData.getRecordBayi().getNoPropAyh()%> == form1.nkabprop[i].value)
  {
    form1.nama_kab_ayh.options[0].text=form1.namakabs[i].value
    break
  }
  else
  {
    form1.nama_kab_ayh.options[0].text=null
  }
}

for(i = 0; i < form1.keclength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoKecAyh()%> == form1.nkecs[i].value
   && <%=lahirData.getRecordBayi().getNoPropAyh()%> == form1.nkecprop[i].value
   && <%=lahirData.getRecordBayi().getNoKabAyh()%> == form1.nkabkec[i].value)
  {
    form1.nama_kec_ayh.options[0].text=form1.namakecs[i].value
    break
  }
  else
  {
    form1.nama_kec_ayh.options[0].text=null
  }
}

for(i = 0; i < form1.kellength.value;i++)
{
  if(<%=lahirData.getRecordBayi().getNoKelAyh()%> == form1.nkels[i].value
   && <%=lahirData.getRecordBayi().getNoKecAyh()%> == form1.nkeckel[i].value
   && <%=lahirData.getRecordBayi().getNoPropAyh()%> == form1.nkelprop[i].value
   && <%=lahirData.getRecordBayi().getNoKabAyh()%> == form1.nkabkel[i].value)
  {
    form1.nkelayh.options[0].text=form1.namakels[i].value
    break
  }
  else
  {
    form1.nkelayh.options[0].text=null
  }
}


<%}%>


</script>

</form>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
  {
//    System.out.println("Nik Bayi in Jsp = " + lahirData.getNikBayi());
    System.out.println("In Jsp Exception = " + e);
    e.printStackTrace();
  }
%>