<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,keluargawna.*,com.db.connection.*,pendaftaran.*"%>

<%!
//namacmat,nipcmat,namabup,namapetentri,nippetentri,niplrh,

String no_kk,lis_pin,tglentri;
ServiceController factory;
List_WniHome home;
List_Wni remote;
Get_AllWilayahaHome home1;
Get_AllWilayaha remote1;
Vector v,v_prop,v_kab,v_kec,v_kel;
int i,j,w,x,y,z;
int ii,jj,kk;
List_Perpindahan record,record1;
  UserInfo1 record2=null;
    String nprop="",nkab="",nkec="",nkel="";
   String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
   String  nama_cmat="",nip_cmat="",nip_lrh="",nama_kep_des="",nama_pet="",nip_pet="";
%>
<%
try
  {

 record2=(UserInfo1)session.getAttribute("remoteRef");

if(record2 != null)
{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/pindah.js">
</SCRIPT>
<SCRIPT language="JavaScript">

var totsel_p,totsel_kb,totsel_kc,totsel_kl;

function pilih_kab()    //untuk pilih kabupaten
{

var objpropid=new Object();
var objkabid=new Object();
var objkabnama=new Object();
var strpid,strkid,strknama;
var selkabctr=0;
document.all['no_kab_ibu'].value="";
document.all['nama_kab_ibu'].length=1;

for(i=1;i<=document.all['kabtot'].value;i++)
{

strpid="propid" + i;
strkid="kid" + i;
strknama="knama"+i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkabnama=document.all[strknama];

  if  (objpropid.value==document.all['nama_prop_ibu'].options[document.all['nama_prop_ibu'].selectedIndex].value)
         {
          var itm = document.createElement("OPTION");
          itm.text=objkabnama.value;
          itm.value=objkabid.value;
          document.all['nama_kab_ibu'].add(itm);
selkabctr++;
         }
}
totsel_kb=selkabctr;
}

function pilih_kec()	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkecnama=new Object();
var selkecctr=0;
var strpid,strkid,strkecid,strkecnama;

document.all['no_kec_ibu'].value="";
document.all['nama_kec_ibu'].length=1;

for(i=1;i<=document.all['kectot'].value;i++)
{
strkecid="kec_id" + i;
strkecnama="kec_nama"+i;
strkid="kec_kid" + i;
strpid="kec_propid" + i;

objpropid=document.all[strpid];
objkabid=document.all[strkid];
objkecid=document.all[strkecid];
objkecnama=document.all[strkecnama];
if ((objpropid.value==document.all['nama_prop_ibu'].options[document.all['nama_prop_ibu'].selectedIndex].value) && (objkabid.value==document.all['nama_kab_ibu'].options[document.all['nama_kab_ibu'].selectedIndex].value))
         {

          var itm = document.createElement("OPTION");
          itm.text=objkecnama.value;
          itm.value=objkecid.value;
          document.all['nama_kec_ibu'].add(itm);
             selkecctr++;
         }
}
totsel_kc=selkecctr;
}

function pilih_kel()	//untuk pilih kecamatan
{

var objpropid=new Object();
var objkabid=new Object();
var objkecid=new Object();
var objkelid=new Object();
var objkelnama=new Object();
var selkelctr=0
var strpid,strkid,strkecid,strkelid,strkelnama;

document.all['no_kel_ibu'].value="";
document.all['nama_kel_ibu'].length=1;

for(i=1;i<=document.all['keltot'].value;i++)
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

if ((objpropid.value==document.all['nama_prop_ibu'].options[document.all['nama_prop_ibu'].selectedIndex].value) &&
(objkabid.value==document.all['nama_kab_ibu'].options[document.all['nama_kab_ibu'].selectedIndex].value) &&
(objkecid.value==document.all['nama_kec_ibu'].options[document.all['nama_kec_ibu'].selectedIndex].value))
         {
          var itm = document.createElement("OPTION");
          itm.text=objkelnama.value;
          itm.value=objkelid.value;
          document.all['nama_kel_ibu'].add(itm);
          selkelctr++;
}
}
totsel_kl=selkelctr;
}

function pilh_prop(choice)
{
switch(parseInt(choice))
{
case 1:{
for(cntr=0;cntr<=document.all['prop_tot'].value;cntr++)
{
 if (parseInt(document.all['nama_prop_ibu'].options[cntr].value)==parseInt(document.all['no_prop_tmp'].value))
   {

           document.all['nama_prop_ibu'].options[cntr].selected=true;
           document.all['no_prop_ibu'].value=document.all['nama_prop_ibu'].options[cntr].value;
           document.all['np'].value=document.all['nama_prop_ibu'].options[cntr].text;
   }
}
pilih_kab();

for(cntr=1;cntr<=totsel_kb;cntr++)
{
 if (parseInt(document.all['nama_kab_ibu'].options[cntr].value)==parseInt(document.all['no_kab_tmp'].value))
   {

           document.all['nama_kab_ibu'].options[cntr].selected=true;

           document.all['no_kab_ibu'].value=document.all['nama_kab_ibu'].options[cntr].value;

           document.all['nb'].value=document.all['nama_kab_ibu'].options[cntr].text;
   }
}
pilih_kec();

for(cntr=1;cntr<=totsel_kc;cntr++)
{
 if (parseInt(document.all['nama_kec_ibu'].options[cntr].value)==parseInt(document.all['no_kec_tmp'].value))
   {

           document.all['nama_kec_ibu'].options[cntr].selected=true;
           document.all['no_kec_ibu'].value=document.all['nama_kec_ibu'].options[cntr].value;
           document.all['nc'].value=document.all['nama_kec_ibu'].options[cntr].text;
   }

}
pilih_kel();
for(cntr=1;cntr<=totsel_kl;cntr++)
{
 if (parseInt(document.all['nama_kel_ibu'].options[cntr].value)==parseInt(document.all['no_kel_tmp'].value))
   {

           document.all['nama_kel_ibu'].options[cntr].selected=true;
           document.all['no_kel_ibu'].value=document.all['nama_kel_ibu'].options[cntr].value;
           document.all['nl'].value=document.all['nama_kel_ibu'].options[cntr].text;
   }
}
document.all['nama_prop_ibu'].disabled=true;
document.all['nama_kab_ibu'].disabled=true;
document.all['nama_kec_ibu'].disabled=true;
document.all['nama_kel_ibu'].disabled=true;
break;
}

case 2:{
document.all['nama_prop_ibu'].disabled=false;
document.all['nama_kab_ibu'].disabled=false;
document.all['nama_kec_ibu'].disabled=false;
document.all['nama_kel_ibu'].disabled=false;
document.all['nama_prop_ibu'].options[0].selected=true;
document.all['nama_kab_ibu'].options[0].selected=true;
document.all['nama_kec_ibu'].options[0].selected=true;
document.all['nama_kel_ibu'].options[0].selected=true;

for(cntr=0;cntr<=document.all['prop_tot'].value;cntr++)
{
 if (parseInt(document.all['nama_prop_ibu'].options[cntr].value)==parseInt(document.all['no_prop_tmp'].value))
   {

           document.all['nama_prop_ibu'].options[cntr].selected=true;
           document.all['no_prop_ibu'].value=document.all['nama_prop_ibu'].options[cntr].value;
           document.all['np'].value=document.all['nama_prop_ibu'].options[cntr].text;

   }
}
pilih_kab();

for(cntr=1;cntr<=totsel_kb;cntr++)
{
 if (parseInt(document.all['nama_kab_ibu'].options[cntr].value)==parseInt(document.all['no_kab_tmp'].value))
   {

           document.all['nama_kab_ibu'].options[cntr].selected=true;
           document.all['no_kab_ibu'].value=document.all['nama_kab_ibu'].options[cntr].value;
           document.all['nb'].value=document.all['nama_kab_ibu'].options[cntr].text;
   }
}
pilih_kec();

for(cntr=1;cntr<=totsel_kc;cntr++)
{
 if (parseInt(document.all['nama_kec_ibu'].options[cntr].value)==parseInt(document.all['no_kec_tmp'].value))
   {

           document.all['nama_kec_ibu'].options[cntr].selected=true;
           document.all['no_kec_ibu'].value=document.all['nama_kec_ibu'].options[cntr].value;
           document.all['nc'].value=document.all['nama_kec_ibu'].options[cntr].text;
   }
}
pilih_kel();
document.all['nama_prop_ibu'].disabled=true;
document.all['nama_kab_ibu'].disabled=true;
document.all['nama_kec_ibu'].disabled=true;

break;
}
case 3:{
document.all['nama_prop_ibu'].disabled=false;
document.all['nama_kab_ibu'].disabled=false;
document.all['nama_kec_ibu'].disabled=false;
document.all['nama_kel_ibu'].disabled=false;
document.all['nama_prop_ibu'].options[0].selected=true;
document.all['nama_kab_ibu'].options[0].selected=true;
document.all['nama_kec_ibu'].options[0].selected=true;
document.all['nama_kel_ibu'].options[0].selected=true;
for(cntr=0;cntr<=document.all['prop_tot'].value;cntr++)
{
 if (parseInt(document.all['nama_prop_ibu'].options[cntr].value)==parseInt(document.all['no_prop_tmp'].value))
   {

           document.all['nama_prop_ibu'].options[cntr].selected=true;
           document.all['no_prop_ibu'].value=document.all['nama_prop_ibu'].options[cntr].value;
           document.all['np'].value=document.all['nama_prop_ibu'].options[cntr].text;
   }
}
pilih_kab();

for(cntr=1;cntr<=totsel_kb;cntr++)
{
 if (parseInt(document.all['nama_kab_ibu'].options[cntr].value)==parseInt(document.all['no_kab_tmp'].value))
   {

           document.all['nama_kab_ibu'].options[cntr].selected=true;
           document.all['no_kab_ibu'].value=document.all['nama_kab_ibu'].options[cntr].value;
           document.all['nb'].value=document.all['nama_kab_ibu'].options[cntr].text;

   }
}
pilih_kec();
document.all['nama_prop_ibu'].disabled=true;
document.all['nama_kab_ibu'].disabled=true;

break;
}
case 4:{
document.all['nama_prop_ibu'].disabled=false;
document.all['nama_kab_ibu'].disabled=false;
document.all['nama_kec_ibu'].disabled=false;
document.all['nama_kel_ibu'].disabled=false;
document.all['nama_prop_ibu'].options[0].selected=true;
document.all['nama_kab_ibu'].options[0].selected=true;
document.all['nama_kec_ibu'].options[0].selected=true;
document.all['nama_kel_ibu'].options[0].selected=true;
for(cntr=0;cntr<=document.all['prop_tot'].value;cntr++)
{
 if (parseInt(document.all['nama_prop_ibu'].options[cntr].value)==parseInt(document.all['no_prop_tmp'].value))
   {

           document.all['nama_prop_ibu'].options[cntr].selected=true;
           document.all['no_prop_ibu'].value=document.all['nama_prop_ibu'].options[cntr].value;
           document.all['np'].value=document.all['nama_prop_ibu'].options[cntr].text;

   }
}
pilih_kab();
//document.all['nama_prop_ibu'].disabled=true;
break;
}
}
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="pindah" action="jungle_jump.jsp" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
<div align="center"><span class="subtitle">Keterangan Perpindahan WNI</span><br>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

<%
if(request.getParameter("fg")!=null)
{
no_kk=request.getParameter("fg");
System.out.println("Inside fg");
}
else
{
no_kk=request.getParameter("nokk");
System.out.println("outside Inside fg");
//out.println(no_kk);
}

nama_prop=request.getParameter("nama_prop_tmp");
nama_kab= request.getParameter("nama_kab_tmp");
nama_kec=request.getParameter("nama_kec_tmp");
nama_kel=request.getParameter("nama_kel_tmp");
nprop=request.getParameter("no_prop_tmp");
nkab=request.getParameter("no_kab_tmp");
nkec=request.getParameter("no_kec_tmp");
nkel=request.getParameter("no_kel_tmp");

nama_cmat=request.getParameter("nama_cmat_tmp");
nip_cmat=request.getParameter("nip_cmat_tmp");

System.out.println("nip_cmat" + nip_cmat);

nip_lrh=request.getParameter("nip_lrh_tmp");
nama_kep_des=request.getParameter("nama_kep_des_tmp");
nama_pet=record2.getNamaPetugas();
nip_pet=record2.getNipPetugas();


//namakep=record2.getNamaKab();
//niplrh=record2.getKabNipPej();
//namacmat=record2.getKecNamaPej();
//nipcmat=record2.getKecNipPej();
//namabup=record2.getKabNamaPej();

//namapetentri=record2.getNamaPetugas();
//nippetentri=record2.getNipPetugas();
tglentri=record2.getToday();

factory=ServiceController.getInstance();

    home = (List_WniHome) factory.lookup("List_Wni",List_WniHome.class);
    remote = home.create();
    v = remote.daftarKeluarga(no_kk);
    j=v.size();
    // out.println(j);
     if(v.isEmpty())
{
%>
<td><div align="center"><h3><font color="red"><center>Data Belum Ada !</center></font></h3></div></td>
</tr>
<tr>
<td>
<div align="center">
<input class=boxstandard type=button value=keluar onClick="document.location='Perpindahan_Wni.jsp'">
</div>
</td>
</tr>
</table>
<%
}
 else
     {
record1=(List_Perpindahan)v.elementAt(0);

home1=(Get_AllWilayahaHome)factory.lookup("Get_AllWilayaha",Get_AllWilayahaHome.class);
remote1 = home1.create();

     WIlayahInfo obj=(WIlayahInfo)remote1.getWilayahList();
     v_prop=obj.getPropinsi();
     v_kab=obj.getKabupaten();
     v_kec=obj.getKecamtan();
     v_kel=obj.getKelurahan();
%>
         <tr>
        <input type="hidden" name="flag" value="<%=no_kk%>">
                <td valign="top">
                  <table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="9" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="26">
                        <div align="center"><span class="subtitle">Data Wilayah</span></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr>
                      <td>Kode-Nama Provinsi</td>
                      <td>:</td>
                      <td width="5">
<input class=boxdefault size=2 name=no_prop_tmp onFocus="this.blur()" maxlength="2" value="<%=nprop%>">
                      </td>
                      <td width="33">
<input class=boxdefault size=22 name=nama_prop_tmp  onFocus="this.blur()" maxlength="60" value="<%=nama_prop%>">
                      </td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td>Kode-Nama Kabupaten/Kota</td>
                      <td>:</td>
                      <td width="8">
<input  class=boxdefault size=2 name=no_kab_tmp onFocus="this.blur()" maxlength="2" value="<%=nkab%>">
                      </td>
                      <td width="22">
<input class=boxdefault size=22 name=nama_kab_tmp  onFocus="this.blur()" maxlength="60" value="<%=nama_kab%>">
                      </td>
                    </tr>
                    <tr>
                      <td>Kode-Nama Kecamatan</td>
                      <td>:</td>
                      <td width="5">
<input class=boxdefault size=2 name=no_kec_tmp onFocus="this.blur()" maxlength="2" value="<%=nkec%>">
                      </td>
                      <td>
<input class=boxdefault size=22 name=nama_kec_tmp onFocus="this.blur()" maxlength="60" value="<%=nama_kec%>">
                      </td>
                      <td>&nbsp;</td>
                      <td>Kode-Nama Desa/Kelurahan</td>
                      <td>:</td>
                      <td width="8">
 <input class=boxdefault size=4 name=no_kel_tmp  onFocus="this.blur()" maxlength="4" value="<%=nkel%>">
                      </td>
                      <td width="22">
<input class=boxdefault name=nama_kel_tmp  onFocus="this.blur()" maxlength="4" value="<%=nama_kel%>">
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                      <td>&nbsp;</td>
                      <td width="5">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td width="8">&nbsp;</td>
                      <td width="22">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
              </tr>
            </table>
<table width="80%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" >
              <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                    <tr>
                      <td valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" valign="middle">
                              <div align="center"><span class="subtitle">Data
                                Daerah AsaI</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="8" height="10">
                              <div align="center">
                                <table border="0" cellspacing="3" cellpadding="2" width="100%">
                                  <tr>
                                    <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                  </tr>


                                  <tr>
                                    <td valign="top" width="24%">Nomor Kartu Keluarga<span class="asterish">*</span></td>
                                    <td valign="top" width="1%">:</td>
                                    <td colspan="6" valign="top">
<input class=boxdefault size=18 onFocus="this.blur()" value=<%=record1.getNokk()%> name=nokk maxlength="16">
                                      <b>
<%--<input class=boxstandard type=submit value=PERIKSA name="submit242" onclick="return edi()">--%>
                                      </b><img src="images/dot.gif" width="10" height="1"></td>
                                  </tr>

                                  <tr>
                                    <td valign="top" width="24%">Nama Kepala Keluarga</td>
                                    <td valign="top" width="1%">:</td>
<td colspan="5" valign="top"><font color="#003366"><b><font color="#003366">
<b><%=record1.getNamakep().toString().toUpperCase()%></b></font></b></font></td>
<input type=hidden value=<%=record1.getNamakep().toString().toUpperCase()%> name=nkap>
                                  </tr>
                                  <tr>
<td valign="top" width="24%">Alamat Asal<span class="asterish"></span></td>
<td valign="top" width="1%">:</td>
<td colspan="5" valign="top"><%=record1.getAlamat().toString().toUpperCase()%>;
  RT <%=record1.getNort()%>;
  RW <%=record1.getNorw()%>;
 <%=record1.getNik()%> </td>
</tr>
                                  <tr>
                                    <td valign="top" width="24%">
<div align="right">Dusun/Kampung/Dukuh</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" colspan="5">
<%=record1.getDusun().toString().toUpperCase()%></td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Provinsi</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="16%">
<%=record1.getNamaPro().toString().toUpperCase()%> </td>
                                    <td valign="top" width="6%">&nbsp;</td>
                                    <td valign="top" width="13%">
                                      <div align="right">Kabupaten/Kota</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="38%">
<%=record1.getNamaKab().toString().toUpperCase() %></td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Kecamatan</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="16%">
<%=record1.getNamaKec().toString().toUpperCase()%></td>
                                    <td valign="top" width="6%">&nbsp;</td>
                                    <td valign="top" width="13%">
                                      <div align="right">Desa/Kelurahan</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
<td valign="top" width="38%">
<%=record1.getNamaKel().toString().toUpperCase()%></td>
                                  </tr>
                                </table>
                                <img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="25">
                              <div align="center"><span class="subtitle">Data
                                Kepindahan</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Alasan Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="6" valign="top">
                              <select name="als_pndh" class="boxdefault">
                                <option selected value="0">-- Pilih Alasan Pindah --</option>
                                <option value="1">1 - Pekerjaan</option>
                                <option value="2">2 - Pendidikan</option>
                                <option value="3">3 - Keamanan</option>
                                <option value="4">4 - Kesehatan</option>
                                <option value="5">5 - Perumahan</option>
                                <option value="6">6 - Keluarga</option>
                                <option>7 - Lainnya</option>
                              </select>
                              <img src="images/dot.gif" width="10" height="1"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Alamat Tujuan Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top">
<input class=boxdefault size=35 name=alamat_tjpndh onKeyUp="return alam()" maxlength="120">
                              RT<span class="asterish">*</span>
<input class=boxdefault size=3 name=no_rt_tjpndh  onKeyUp="return rt()" maxlength="3">
                              RW
<input class=boxdefault size=3 name=no_rw_tjpndh onChange="return rw()" maxlength="3">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" colspan="5">
<input class=boxdefault size=20 name=dusun_tjpndh onKeyUp="return dus()" maxlength="60">
                            </td>
                          </tr>
<tr>
                            <td valign="top" width="21%">Klasifikasi Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" colspan="5"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">

<select name="klasf_pndh" onChange="pilh_prop(this.selectedIndex)" class="boxdefault">
<option selected value="0">
-- Pilih Klasifikasi Pindah --</option>
<option value="1">1 - Dalam Satu Desa/Kelurahan</option>
<option value="2">2 - Antar Desa/Kelurahan</option>
<option value="3">3 - Antar Kecamatan</option>
<option value="4">4 - Antar Kabupaten/Kota</option>
<option value="5">5 - Antar Provinsi</option>
</select>
</font>
</td>
                          </tr>
                          <tr>
<td valign="top" width="21%">
                              <div align="right">Provinsi<span class="asterish">*</span></div>
                            </td>

                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="20%">
<input type="hidden" name="no_prop_ibu" value="">
<select  name="nama_prop_ibu" onChange="no_prop_ibu.value=this.value;np.value=this.options[this.selectedIndex].text;pilih_kab()" class="boxdefault">
<option selected>-- Pilih Provinsi --</option>
<%
for(int k=0;k<v_prop.size();k++)
{
%>
<option value=<%=((GetProp)v_prop.elementAt(k)).getNoprop()%>>
 <%=((GetProp)v_prop.elementAt(k)).getNamaprop()%></option>
<%
}
%>                            </select>
<input type="hidden" name="prop_tot" value=<%=v_prop.size()-1%>>

                            </td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="12%">
                              <div align="right">Kabupaten/Kota<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="25%">

<input type="hidden" name="no_kab_ibu" value="">

<select name="nama_kab_ibu" onChange="no_kab_ibu.value=this.value;nb.value=this.options[this.selectedIndex].text;pilih_kec()" class="boxdefault">
<option selected>-- Pilih Kabupaten/Kota --</option>

<%
ii=0;
for(int l=0;l<v_kab.size();l++)
{
ii++;
%>
<%="<input type=hidden name=kid" + ii + " value="+((GetKab)v_kab.elementAt(l)).getNokab() +">"%>
<%="<input type=hidden name=knama" + ii + " value='" +((GetKab)v_kab.elementAt(l)).getNamakab() +"'>"%>
<%="<input type=hidden name=propid" + ii + " value=" + ((GetKab)v_kab.elementAt(l)).getNoProp() +">"%>
<%
}
%>
                              </select>
                            </td>
                          </tr>


                          <tr>
                            <td valign="top" width="21%">
                              <div align="right">Kecamatan<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="1%">:</td>

                           <td valign="top" width="20%">
<input type="hidden" name="no_kec_ibu" value="">

<select   name="nama_kec_ibu" onChange="no_kec_ibu.value=this.value;nc.value=this.options[this.selectedIndex].text;pilih_kel()"  class="boxdefault">
<option selected>-- Pilih Kecamatan --</option>
 <%
jj=0;
for(int m=0;m<v_kec.size();m++)
{
jj++;
%>
<%="<input type=hidden name=kec_id" + jj + " value=" + ((GetKec)v_kec.elementAt(m)).getNokec() +">"%>
<%="<input type=hidden name=kec_nama" + jj + " value='" + ((GetKec)v_kec.elementAt(m)).getNamakec() +"'>"%>
<%="<input type=hidden name=kec_kid" + jj + " value=" + ((GetKec)v_kec.elementAt(m)).getNoKab()  +">"%>
<%="<input type=hidden name=kec_propid" + jj + " value=" + ((GetKec)v_kec.elementAt(m)).getNoProp() +">"%>
<%
}
%>
                              </select>
                            </td>


                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="12%">
                              <div align="right">Desa/Kelurahan<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="25%">

<input type="hidden" name="no_kel_ibu" value="">

<select  name="nama_kel_ibu"  class="boxdefault" onChange="no_kel_ibu.value=this.value;nl.value=this.options[this.selectedIndex].text">
<option selected>-- Pilih Desa/Kelurahan --</option>
<%
kk=0;
for(int n=0;n<v_kel.size();n++)
{
kk++;
%>
<%="<input type=hidden name=kel_id" + kk + " value=" + ((GetKel)v_kel.elementAt(n)).getNokel() +">"%>
<%="<input type=hidden name=kel_nama" + kk + " value='" + ((GetKel)v_kel.elementAt(n)).getNamakel() +"'>"%>
<%="<input type=hidden name=kel_kecid" + kk + " value=" + ((GetKel)v_kel.elementAt(n)).getNoKec() +">"%>
<%="<input type=hidden name=kel_kabid" + kk + " value=" + ((GetKel)v_kel.elementAt(n)).getNoKab() +">"%>
<%="<input type=hidden name=kel_propid" + kk + " value=" + ((GetKel)v_kel.elementAt(n)).getNoProp() +">"%>
<%
}
%>
                              </select>
                            </td>
                          </tr>

<tr>
                            <td valign="top" width="21%">
                              <div align="right">Kode Pos</div>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" width="17%">
<input class=boxdefault size=5 name=kodepos_tjpndh onChange="return kod()" maxlength="5">
                            </td>
                            <td valign="top" width="3%">&nbsp;</td>
                            <td valign="top" width="13%">
                              <div align="right">Telepon</div>
                            </td>
                            <td valign="top" width="2%">:</td>
                            <td valign="top" width="43%">
<input class=boxdefault size=20 name=telp_tjpndh onChange="return tel()" maxlength="20">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Jenis Kepindahan<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<select name="jenis_kpndhn" class="boxdefault" onChange="return jens()">
                                <option selected value="0">-- Pilih Jenis Kepindahan --</option>
                                <option value="1">1 - Kepala Keluarga</option>
                                <option value="2">2 - Kepala Keluarga dan Seluruh
                                Anggota Keluarga</option>
                                <option value="3">3 - Kepala Keluarga dan Sebagian
                                Anggota Keluarga</option>
                                <option value="4">4 - Anggota Keluarga</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Status Nomor KK Bagi
                              Yang Tidak Pindah</td>
                            <td valign="top" width="1%">:</td>
                            <td width="35%" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">
 <select name="stat_no_kk_tdkpdh" size="1" class="boxdefault" disabled onChange="return tdkpdh()">
 <option selected value="0">-- Pilih Status Nomor KK Bagi
                                Yang Tidak Pindah --</option>
                                <option value="1">1 - Numpang KK</option>
                                <option value="2">2 - Membuat KK Baru </option>
                                <option value="3">3 - Tidak Ada Anggota Keluarga
                                Yang Tinggal</option>
                                <option value="4">4 - Nomor KK Tetap</option>
                              </select></font></td>

<td width="21%" valign="top">

<input type=hidden name="Kepindahankk" value=<%=no_kk%>>
<input type="submit" name="Kepindahan" value="KK Baru" disabled class="boxstandard">

</td>
<td width="25%" valign="top">

<input type=hidden name="Numpangkk" value=<%=no_kk%>>
<input type="submit"  name="Numpang" value="KK Numpang" disabled class="boxstandard">

 </td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Status Nomor KK Bagi
                              Yang Pindah</td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">
<select name="stat_no_kk_pdh" class="boxdefault" disabled>
<option selected value="0">-- Pilih Status Nomor KK Bagi
                                Yang Pindah --</option>
                                <option value="1">1 - Numpang KK</option>
                                <option value="2">2 - Membuat KK Baru</option>
                                <option value="3">3 - Nama Kepala Keluarga dan Nomor KK
                                Tetap</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="21%">Rencana Tanggal Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="5" valign="top">
                              <table width="100" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
<input class=boxdefault size=2 name=renc_tgl_pindah maxlength="2" onKeyUP="return tglhr1()">
                                  </td>
                                  <td>/ </td>
                                  <td>
<input class=boxdefault size=2 name=renc_bln_pindah maxlength="2" onKeyUP="return tglhr2()" >
                                  </td>
                                  <td>/</td>
                                  <td>
<input class=boxdefault size=4 name=renc_thn_pindah maxlength="4" onKeyUP="return tglhr3()">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>

                          <tr>
                            <td valign="top" width="25%">Keluarga Yang Pindah</td>
                            <td valign="top" width="1%">:</td>
                            <td valign="top" colspan="5">&nbsp;</td>
                          </tr>

                          <tr>
                            <td valign="top" colspan="7">

                              <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
                                <tr>
                                  <td width="5" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td width="1" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td valign="middle" align="center">
                                    <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                      <tr>
                                        <td class="C-Fonts" width="4%">
                                          <div align="center"> No.</div>
                                        </td>
                                        <td class="C-Fonts" width="20%">
                                          <div align="center">NIK</div>
                                        </td>
                                        <td class="C-Fonts" width="31%">
                                          <div align="center">Nama Lengkap</div>
                                        </td>
                                        <td class="C-Fonts">
                                          <div align="center">SHDK dengan KK Asal</div>
                                        </td>

                                      </tr>
<%
lis_pin="";

for(i=0;i<v.size();i++)
      {
        record=(List_Perpindahan)v.elementAt(i);

%>
                                      <tr>
                                        <td class="C-Field" width="4%">
                                          <div align="center"><%=i+1%></div>
                                        </td>
                                        <td class="C-Field" width="20%">
<div align="center"><%=record.getNik()%>
<%--<input type=hidden name=pinlist value=<%=record.getNokk()%>","<%=record.getNik()%>>--%>
                                          </div>
                                        </td>
                                        <td class="C-Field" width="31%">
<div align="center"><%=record.getNamalgkp().toString().toUpperCase()%>
                                          </div>
                                        </td>
                                        <td class="C-Field" width="19%">
<div align="center"> <%=record.getStathbkel().toString().toUpperCase()%></div>
                                        </td>
                                                                              </tr>
<%
String jenis_klmin="";
int tgl=0;
if (record.getNik()!=null) tgl=Integer.parseInt(record.getNik().trim().substring(6,8));
 if ((tgl>=1) && (tgl<=31))
jenis_klmin="1";
else if ((tgl>=41) && (tgl<=71))
jenis_klmin="2";

lis_pin=lis_pin+ ","+ record.getNik().trim()+ "," + record.getNokk().trim() + "," + record.getNamalgkp().trim()+","+ record.getStathbkel().trim() + "," + jenis_klmin.trim();

if(record.getStathbkel().toString().toUpperCase().trim().equals("KEPALA KELUARGA"))
{
%>
<input type=hidden name=nik value="<%=record.getNik().trim() %>">
<%
}
      }


%>
<input type=hidden name=pinlist value="<%=lis_pin%>">
                               </table>
                                  </td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                  <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="9" height="10">
                              <div align="center"><img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Administrasi</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="30%">Nama Kepala Desa/ Kelurahan<span class="asterish">*</span>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top">
<input class=boxdefault size=22 value="<%=nama_kep_des%>" onFocus="this.blur()" name=nama_kep_des_tmp maxlength="60" >
                            </td>
                            <td width="1%"><img src="images/dot.gif" width="10" height="1"></td>
                            <td valign="top" width="15%">NIP Lurah</td>
                            <td valign="top" width="2%">:</td>
                            <td colspan="2" valign="top" width="28%">
<input  class=boxdefault size=9 name=nip_lrh_tmp value="<%=nip_lrh%>" onFocus="this.blur()" maxlength="9">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="30%">Nama Camat<span class="asterish">*</span>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top">
<input class=boxdefault size=22 name=nama_cmat_tmp value="<%=nama_cmat%>" onFocus="this.blur()" maxlength="60">
                            </td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="15%">NIP Camat<span class="asterish">*</span>
                            </td>
                            <td valign="top" width="2%">:</td>
                            <td colspan="2" valign="top" width="28%">
<input  class=boxdefault size=9 name=nip_cmat_tmp value="<%=nip_cmat%>" onFocus="this.blur()" maxlength="9">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="14%">Nama Petugas Entri</td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top"><b><%=nama_pet%></b></td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="15%">NIP Petugas Entri</td>
                            <td valign="top" width="2%">:</td>
                            <td colspan="2" valign="top" width="28%"> <b><%=nip_pet%></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="30%"><img src="images/dot.gif" width="1" height="1">Tanggal
                              Entri</td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top"> <b><%=record2.getToday()%></b></td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="23%">&nbsp;</td>
                            <td valign="top" width="2%">&nbsp;</td>
                            <td colspan="2" valign="top" width="28%">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">&nbsp;</td>
                    </tr>
                  </table>
                </td>
                <td>&nbsp;</td>
              </tr>
<input type=hidden name="kabtot" value="<%=ii%>">
<input type=hidden name="kectot" value="<%=jj%>">
<input type=hidden name="keltot" value="<%=kk%>">
<input type=hidden name=no_kk value="<%=no_kk%>">
<input type=hidden name=namakk value="<%=record1.getNamakep().trim()%>">
<input type=hidden name=namakep value="<%=nama_kep_des%>">
<input type=hidden name=niplrh value="<%=nip_lrh%>">
<input type=hidden name=namacmat value="<%=nama_cmat%>">
<input type=hidden name=nipcmat value="<%=nip_cmat%>">
<input type=hidden name=namapetentri value="<%=nama_pet%>">
<input type=hidden name=nippetentri value="<%=nip_pet%>">
<input type=hidden name=tglentri value="<%=tglentri%>">

<input type=hidden name=nb value="">
<input type=hidden name=np value="">
<input type=hidden name=nl value="">
<input type=hidden name=nc value="">

           <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
            <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b>
<input class=boxstandard disabled type=submit value=SIMPAN name="sim" onClick="return pin()">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
                  <div align="center"><b>
<input class=boxstandard type=button value=KELUAR name="submit2322" onClick="document.location='WNI_Menu.jsp'" >
                    </b></div>
                </td>
              </tr>
              <tr>
                <td colspan="3">
                  <div align="center"><font color="#003399"><i>Keterangan : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                    harus Diisi</font></i></div>
                </td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>

        </tr>
      </table>

  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</form>
</BODY>
</HTML>
<%
}
}
else
{
response.sendRedirect("index.jsp");
}
  }
  catch(Exception e)
  {
    System.out.print("Error in jsp=" + e.toString());
    e.printStackTrace();
  }
  finally
  {
     remote.remove();
  }
%>
