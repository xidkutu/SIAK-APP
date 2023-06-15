<%@ page import="javax.naming.*,javax.rmi.*,com.P4B.*,pendaftaran.UserInfo1,pendaftaran.Login,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan,com.pkrjn.Pkrjn"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>

<%
    String nik=null,no_prop=null,no_kab=null,no_kec=null,no_kel=null;
     ServiceController wniedit;
     P4bBioDataHome home = null;
     P4bBioData remote = null;
     P4BBioObject wnidata = null;
     UserInfo1 record = null;
%>

<%
    nik = request.getParameter("nik");
    no_prop=request.getParameter("no_prop");
    no_kab=request.getParameter("no_kab");
    no_kec=request.getParameter("no_kec");
    no_kel=request.getParameter("no_kel");

try
 {

 record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
   {

      wniedit = ServiceController.getInstance();
      home = (P4bBioDataHome) wniedit.lookup("P4bBioData",P4bBioDataHome.class);

if (home!=null)
   {
          remote = home.create();
           wnidata = (P4BBioObject)remote.getDataP4B(nik,no_prop,no_kab,no_kec,no_kel);
//N-Still Not dimutakhirkan
//Y-Already dimutakhirkan
//F-Not Found
//E-Error Raised
if (wnidata.getAcknowldge().equals("N"))
   {
 session.setAttribute("wnidata", wnidata);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<!---<SCRIPT language=JavaScript src="scripts/Update_Wni.js">
</SCRIPT>-->
<script language="javascript">
function postp4bdata()
{
document.all['txtnamakep'].value=document.all['t2'].value;
document.all['txtalamat'].value=document.all['t3'].value;
document.all['txtnort'].value=document.all['t4'].value;
document.all['txtnorw'].value=document.all['t5'].value;
document.all['txtdusun'].value=document.all['t6'].value;
document.all['txtkodepos'].value=document.all['t7'].value;
document.all['txttelpon'].value=document.all['t8'].value;
return true;
}
function setall(on)
{
if (on==1) on=false;
 document.all['t2'].disabled=on;
 document.all['t3'].disabled=on;
 document.all['t4'].disabled=on;
 document.all['t5'].disabled=on;
 document.all['t6'].disabled=on;
 document.all['t7'].disabled=on;
 document.all['t8'].disabled=on;
}

function changeAll(stathbkel)
{
if (stathbkel==1)
{
setall(false);
alert("Periksa Data Keluarga ");
document.all['t2'].focus();
}
else setall(true);
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin= topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Update_Biodata_WNI_P4B.jsp">
<table align="center" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td>
<jsp:include page="top.html"/>
</td>
</tr>
<tr>
<td>
<table  border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td>
<table width="100%" border="0" cellspacing="3" cellpadding="3">
<tr>
 <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="45">
<div align="center"><span class="submenu">Pendaftaran
Perubahan Biodata WNI</span><br>
 </div>
</td>
</tr></table></td></tr>
<tr><td>
<input type=hidden name='no_prop' value="<%=record.getNoProp().trim()%>">
<input type=hidden name='no_kab' value="<%=record.getNoKab().trim()%>">
<input type=hidden name='no_kec' value="<%=record.getNoKec().trim()%>">
<input type=hidden name='no_kel' value="<%=request.getParameter("no_kel")%>">
<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&nama_kel="+ (request.getParameter("namakel")==null?"":request.getParameter("namakel"));
%><jsp:include page="<%=jsp%>"/></td></tr><tr><td valign="top">
<table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                            <tr><td colspan="3" height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                            <tr>
                              <td colspan="3" height="25">
                                <div align="center"><span class="subtitle">Data
                                  Keluarga</span></div>
                              </td>
                            </tr>
                            <tr>
                              <td colspan="3" height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                           <tr>
                              <td valign="top" nowrap>
                                <div align="right">Nomor Kartu Keluarga</div>
                              </td>
                              <td valign="top">:</td>
                              <td valign="top"><b>
                              <%= wnidata.getNoKk().toString()%>
                              </b>
                              <input type="hidden" name="txtnokk" value="<%=wnidata.getNoKk().toString()%>">
                              </td>
                           </tr>
                            <tr>
                            <td valign="top" nowrap>
                               <div align="right">Nama Kepala Keluarga</div>
                            </td>
                            <td valign="top">:</td>
                            <td valign="top">
                            <b>
                            <input type="text" name="t2" size=35 maxlength=60 class=boxdefault  value="<%=wnidata.getNama_kep().toString().toUpperCase()%>">
                            <input type="hidden" name="txtnamakep" value="<%=wnidata.getNama_kep().toString().toUpperCase()%>">
                                </b></td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <div align="right">Alamat</div>
                              </td>
                              <td valign="top">:</td>
                              <td valign="top"><b>
                               <input type="text" name="t3" size=40 maxlength=120 class=boxdefault  value="<%=wnidata.getAlamat().toString().toUpperCase()%>">
                               <input type="hidden" name="txtalamat" value="<%=wnidata.getAlamat().toString().toUpperCase()%>">
                               </b></td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <div align="right">No.RT</div>
                              </td>
                              <td valign="top">:</td>
                              <td valign="top"><b>
                <input type="text" name="t4" class=boxdefault size=5  maxlength=3 value="<%=wnidata.getNoRt()%>">
                <input type="hidden" name="txtnort" value="<%=wnidata.getNoRt()%>">
                                </b></td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <div align="right">No.RW</div>
                              </td>
                              <td valign="top">:</td>
                              <td valign="top"><b>
          <input type="text" name="t5" class=boxdefault size=5 maxlength=3 value="<%=wnidata.getNoRw()%>">
          <input type="hidden" name="txtnorw" value="<%=wnidata.getNoRw()%>">
                                </b></td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <div align="right">Dusun</div>
</td><td valign="top">:</td><td valign="top"><b>
<input type="text" name="t6" class=boxdefault  size=25 maxlength=60 value="<%=wnidata.getDusun()%>" >
<input type="hidden" name="txtdusun" value="<%=wnidata.getDusun()%>" >
</b>
</td>
  </tr>
 <tr>
 <td valign="top">
<div align="right">Kode Pos</div>
</td>
<td valign="top">:</td>
<td valign="top"><b>
<input type="text" name="t7" class=boxdefault  size=10 maxlength=5 value="<%=wnidata.getKodePos()%>">
<input type="hidden" name="txtkodepos" value="<%=wnidata.getKodePos()%>">
</b></td></tr><tr>
<td valign="top"><div align="right">Telepon</div></td>
<td valign="top">:</td><td valign="top"><b>
<input type="text" name="t8" class=boxdefault  size=10 maxlength=30 value="<%=wnidata.getTelp()%>">
<input type="hidden" name="txttelpon" value="<%=wnidata.getTelp()%>">
</b></td></tr></table>
<!-- insert code here for include-->
<%
/*if (wnidata.getStatHbkel().equals("1"))
{
*/
%>
         <!--<jsp:include page="datakel_rw.jsp"/>-->
<%
/*
}
else
 {
*/
%>
          <!--<jsp:include page="datakel_ro.jsp"/>-->
<%
/*
 }
*/
%>
</td>
</tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="top">
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="top">
                                    <div align="center"><span class="subtitle">Data
                                      Individu</span></div>
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
                            <td valign="top">

                          <table width="100%" border="0" cellspacing="5" cellpadding="2">
                            <tr>
                              <td valign="top">Nomor Induk Kependudukan<br>
                              </td>
                              <td valign="top"> :</td>
                              <td valign="top"> <b> </b><b><i><b> <%=wnidata.getNik()%>
                                <input type="hidden" name="nik" value="<%=wnidata.getNik().toString().trim()%>">
                                </b><b><i><b><i><b> </b></i></b></i></b></i></b></td>
                              <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
                              <td valign="top">Nama Lengkap <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <input
                                class=boxdefault size=22 name=nama_lgkp maxlength="55"  value="<%=wnidata.getNamaLgkp()%>" onKeyUp="return char(form1.nama_lgkp)" >
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <p>Nomor KTP/Nopen</p>
                              </td>
                              <td valign="top"> :</td>
                              <td valign="top"> <b>
                                <input
                                class=boxdefault size=22 name=no_ktp maxlength="25"  value="<%=wnidata.getNoKtp()%>" >
                                </b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tempat Tinggal Sebelumnya</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top"><b>
                                <input  class=boxdefault size=22 name=tmpt_sbl maxlength="120"  value="<%=wnidata.getTmptSbl()%>">
                                </b></td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <div align="left">Nomor Paspor</div>
                              </td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input  class=boxdefault size=22 name=no_paspor maxlength="25" value="<%=wnidata.getNoPaspor()%>">
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tanggal Berakhir Paspor</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input  class=boxdefault size=2 name=dd_paspor maxlength="2" value="<%=wnidata.getDdpaspor()%>">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input  class=boxdefault size=2 name=mm_paspor  maxlength="2"  value="<%=wnidata.getMmpaspor()%>" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input class=boxdefault size=4 name=yy_paspor maxlength="4"  value="<%=wnidata.getYypaspor()%>">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Jenis Kelamin<font color="#000099" class="asterish">
                                *</font> </td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <select   class="boxdefault" name="jenis_klmin" >
                                  <option value="0">-- Pilih Jenis Kelamin --</option>
                                  <option value="1">1 - Laki-laki</option>
                                  <option value="2">2 - Perempuan</option>
                                </select>
                                <script language="JavaScript">
										  form1.jenis_klmin.selectedIndex="<%=wnidata.getJenisKlmin()%>"
										</script>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tempat Lahir<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input  class=boxdefault size=22 name=tmpt_lhr maxlength="55" onKeyUp="return char(form1.tmpt_lhr)" value="<%=wnidata.getTmptLhr()%>">
                              </td>
                            </tr><tr>
                     <td valign="top">Tanggal Lahir<font color="#000099" class="asterish">
                           *</font></td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                    <%
                                    session.setAttribute("tgl_lhr",wnidata.getTglLhr());
                                    session.setAttribute("jenis_kl",wnidata.getJenisKlmin());
                                    %>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd maxlength="2"  value="<%=wnidata.getDdlahir()%>"  >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2" value="<%=wnidata.getMmlahir()%>" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4" value="<%=wnidata.getYylahir()%>" >
                                    </td>

                                  </tr>
                                </table>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Akta Kelahiran/Surat Kenal Lahir<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">
                                <select
                   onChange="return validate1()"
                  class="boxdefault" name="akta_lhr" >
                                  <option value="0">-- Pilih Akta Kelahiran --</option>
                                  <option value=1>1 - Tidak Ada</option>
                                  <option  value=2>2 - Ada</option>
                                </select>
                                <script language="javascript">
									  form1.akta_lhr.selectedIndex="<%=wnidata.getAktaLhr()%>"
									  </script>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nomor Akta Kelahiran/<br>
                                Surat Kenal Lahir</td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input    class=boxdefault size=22 name=no_akta_lhr maxlength="40" value="<%=wnidata.getNoAktaLhr() %>" >
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Golongan Darah <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select        name=gol_drh boxdefault2 class="boxdefault" >
                                  <option value="0">-- Pilih Golongan Darah --</option>
                                  <option value="1">1 - A</option>
                                  <option value="2">2 - B</option>
                                  <option value="3">3 - AB</option>
                                  <option value="4">4 - O</option>
                                  <option value="5">5 - A+</option>
                                  <option value="6">6 - A-</option>
                                  <option value="7">7 - B+</option>
                                  <option value="8">8 - B-</option>
                                  <option value="9">9 - AB+</option>
                                  <option value="10">10 - AB-</option>
                                  <option value="11">11 - O+</option>
                                  <option value="12">12 - O-</option>
                                  <option value="13">13 - Tidak Tahu-</option>
                                </select>
<script language="javascript">
form1.gol_drh.selectedIndex="<%=wnidata.getGolDrh()%>"
</script>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Agama <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <table width="175" border="0" cellspacing="0" cellpadding="0" align="left">
                                  <tr>
                                    <td>
                                      <select
                   onChange="return validate2()"
                  name=aga_ma  class="boxdefault" >
                                        <option value="">-- Pilih Agama --</option>
                                        <option value="Islam">1 - Islam</option>
                                        <option value="Kristen">2 - Kristen</option>
                                        <option value="Katholik">3 - Katholik</option>
                                        <option value="Hindu">4 - Hindu</option>
                                        <option value="Budha">5 - Budha</option>
                                        <option value="Lainnya">6 - Lainnya</option>
                                      </select>
                                    </td>
<td>
<input class=boxdefault size=7 name=agama maxlength="15" value="">

<%
if (wnidata.getAgamaIdx().trim().equals(""))
{
 %>
<script language="javascript">
document.all['aga_ma'].selectedIndex="<%=wnidata.getAgama()%>";
</script>
<%
}
%>
  </td>
 </tr>
</table>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Status Perkawinan<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select
                   onChange="return validate3()"
                  name=stat_kwn boxdefault2 class="boxdefault" >
                                  <option value="0">-- Pilih Status Perkawinan --</option>
                                  <option value="1">1 - Belum Kawin</option>
                                  <option value="2">2 - Kawin</option>
                                  <option value="3">3 - Cerai Hidup</option>
                                  <option value="4">4 - Cerai Mati</option>
                                </select>
                                <script language="javascript">
form1.stat_kwn.selectedIndex="<%=wnidata.getStatKwn()%>"
</script>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Akta Perkawinan/Buku Nikah <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <select
                   onChange="return validate4()"
                  class="boxdefault" name="akta_kwn" >
                                  <option value="0">-- Pilih Akta Perkawinan --</option>
                                  <option value=1>1 - Tidak Ada</option>
                                  <option  value=2>2 - Ada</option>
                                </select>
                                <script language="javascript">
form1.akta_kwn.selectedIndex="<%=wnidata.getAktaKwn()%>"
</script>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Nomor Akta Perkawinan/Buku Nikah</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <input class=boxdefault size=22 name=no_akta_kwn maxlength="40" value="<%=wnidata.getNoAktaKwn() %>" >
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Tanggal Perkawinan</td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_kwn_dd maxlength="2" value="<%=wnidata.getDdkawin()%>"   onKeyUp="return tab6()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_kwn_mm maxlength="2" value="<%=wnidata.getMmkawin()%>"   onKeyUp="return tab7()">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_kwn_yy maxlength="4" value="<%=wnidata.getYykawin()%>"   onKeyUp="return tab8()">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Akta Perceraian/Surat Cerai<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select
                   onChange="return validate6()"
                  class="boxdefault" name="akta_crai" >
                                  <option value="0">-- Pilih Akta Perceraian --</option>
                                  <option value=1>1 - Tidak Ada</option>
                                  <option  value=2>2 - Ada</option>
                                </select>
                                <script language="javascript">
form1.akta_crai.selectedIndex="<%=wnidata.getAktaCrai()%>"
</script>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nomor Akta Perceraian/Surat Cerai
                              </td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input
                                class=boxdefault size=22 name=no_akta_crai maxlength="40" value="<%=wnidata.getNoAktaCrai()%>" >
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tanggal Perceraian</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_crai_dd maxlength="2" value="<%=wnidata.getDdcerai()%>"    onKeyUp="return tab9()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_crai_mm maxlength="2" value="<%=wnidata.getMmcerai()%>"  onKeyUp="return tab10()">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_crai_yy maxlength="4" value="<%=wnidata.getYycerai()%>"   onKeyUp="return tab11()">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
<td valign="top">Status Hubungan dalam Keluarga
<font color="#000099" class="asterish">*</font></td>
<td valign="top">:</td>
<td width="210" valign="top">
<select  name=stat_hbkel boxdefault2 class="boxdefault" onchange="changeAll(this.options[this.selectedIndex].value)">
<option value=0>-- Pilih Status Hub. dalam Keluarga --</option>
<option value=1>1 - Kepala Keluarga</option>
<option value=2>2 - Suami</option>
<option value=3>3 - Istri</option>
<option value=4>4 - Anak</option>
<option value=5>5 - Menantu</option>
 <option value=6>6 - Cucu</option>
<option value=7>7 - OrangTua</option>
<option value=8>8 - Mertua</option>
<option value="9">9 - Famili Lain</option>
<option value="10">10 - Pembantu</option>
<option value="11">11 - Lainnya</option>
</select>
<script language="javascript">
form1.stat_hbkel.selectedIndex="<%=wnidata.getStatHbkel()%>"
setall(<%=wnidata.getStatHbkel()%>)
</script>
</td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Kelainan Fisik dan Mental <font color="#000099" class="asterish">*</font>
                              </td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select
                   onChange="return validate8()"
                  class="boxdefault" name="klain_fsk" >
                                  <option value="0">-- Pilih Kelainan --</option>
                                  <option value=1>1 - Tidak Ada</option>
                                  <option  value=2>2 - Ada</option>
                                </select>
                                <script language="javascript">
form1.klain_fsk.selectedIndex="<%=wnidata.getKlainFsk()%>"
</script>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Penyandang Cacat</td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <select
                                   name=pnydng_cct boxdefault2 class="boxdefault" >
                                  <option value="0">-- Pilih Penyandang Cacat --</option>
                                  <option value=1>1 - Cacat Fisik</option>
                                  <option value=2>2 - Cacat Netra/Buta</option>
                                  <option value=3>3 - Cacat Rungu/Wicara</option>
                                  <option value=4>4 - Cacat Mental/Jiwa</option>
                                  <option value=5>5 - Cacat Fisik dan Mental</option>
                                  <option value=6>6 - Cacat Lainnya</option>
                                </select>
                                <script language="javascript">
form1.pnydng_cct.selectedIndex="<%=wnidata.getPnydngCct()%>"
</script>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Pendidikan Terakhir<font color="#000099" class="asterish">
                                *</font> </td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select
                                  name=pddk_akh boxdefault2 class="boxdefault" >
                                  <option value="0">-- Pilih Pendidikan Terakhir --</option>
                                  <option value=1>1 - Tidak/Belum Sekolah</option>
                                  <option value=2>2 - Tidak Tamat SD/Sederajat</option>
                                  <option value=3>3 - Tamat SD/Sederajat</option>
                                  <option value=4>4 - SLTP/Sederajat</option>
                                  <option value=5>5 - SLTA/Sederajat</option>
                                  <option value=6>6 - Diploma I/II</option>
                                  <option value=7>7 - Akademi/Diploma III/S. Muda</option>
                                  <option value=8>8 - Diploma IV/Strata I</option>
                                  <option value=9>9 - Strata II</option>
                                  <option value="10">10 - Strata III</option>
                                </select>
                                <script language="javascript">
form1.pddk_akh.selectedIndex="<%=wnidata.getPddkAkh()%>"
</script>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Jenis Pekerjaan <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td valign="top">
<select   name=jenis_pkrjn class="boxdefault">
<option value="0">-- Pilih Jenis Pekerjaan --</option>
                                             <%
                                      Vector vt_pkrjn=getPkrjn();
                                      Pkrjn pk_obj=null;
                                     for(int i=0;i<vt_pkrjn.size();i++)
                                          {
                                            pk_obj=(Pkrjn)vt_pkrjn.elementAt(i);
                                  %>
                                           <option value="<%=pk_obj.getNo()%>"><%=pk_obj.getNo()%>-<%=pk_obj.getDescrip()%></option>
                                   <%
                                          }
                                    %>

                                </select>
<script language="javascript">
form1.jenis_pkrjn.selectedIndex="<%=wnidata.getJenisPkrjn()%>"
</script>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">&nbsp; </td>
                            </tr>
                            <tr>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">:</td>
                              <td valign="top">&nbsp; </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210">&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="5" colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan="7" align="center"><img src="images/batas_dot.gif" width="461" height="1"></td>
                            </tr>
                            <tr>
                              <td colspan="7" align="center"><span class="subtitle">Data
                                Orangtua</span></td>
                            </tr>
                            <tr>
                              <td colspan="7" align="center"><img src="images/batas_dot.gif" width="461" height="1"></td>
                            </tr>
                            <tr>
                              <td valign="top">NIK Ibu</td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input   class=boxdefault size=16 name=nik_ibu maxlength="16" value="<%=wnidata.getNikIbu()%>"   onKeyUp="return num(form1.nik_ibu)">
                                <b><i><b> </b></i></b> </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Nama Lengkap Ibu <font color="#000099" class="asterish">*</font>
                              </td>
                              <td valign="top">:</td>
                              <td width="210">
                                <input
                                class=boxdefault size=22 name=nama_lgkp_ibu maxlength="60" value="<%=wnidata.getNamaLgkpIbu()%>"   onKeyUp="return char(form1.nama_lgkp_ibu)" >
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">NIK Ayah</td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input
                                class=boxdefault size=16 name=nik_ayh maxlength="16" value="<%=wnidata.getNikAyah() %>"   onKeyUp="return num(form1.nik_ayh)">
                                <b><i><b> </b></i></b> </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Nama Lengkap Ayah</td>
                              <td valign="top">:</td>
                              <td width="210">
                                <input

                                class=boxdefault size=22 name=nama_lgkp_ayh maxlength="55" value="<%=wnidata.getNamaLgkpAyah()%>"   onKeyUp="return char(form1.nama_lgkp_ayh)">
                              </td>
                            </tr>
                            <tr>
                              <td colspan="7" height="5" align="center">&nbsp;</td>
                            </tr>
                            <tr>
                              <td align="center" colspan="7">
                                <p><img src="images/batas_dot.gif" width="461" height="1"></p>
                              </td>
                            </tr>
                            <tr align="center">
                              <td colspan="7"><span class="subtitle">Data Administrasi</span></td>
                            </tr>
                            <tr align="center">
                              <td colspan="7">
                                <p><img src="images/batas_dot.gif" width="461" height="1"></p>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nama Ketua RT <font color="#000099" class="asterish">
                                </font></td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input   class=boxdefault size=22 name=nama_ket_rt maxlength="55"  value="<%=wnidata.getNamaKetRt()%>"   onKeyUp="return char(form1.nama_ket_rt)">
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Nama Ketua RW</td>
                              <td valign="top">:</td>
                              <td width="210">
                                <input
                                class=boxdefault size=22 name=nama_ket_rw maxlength="55"  value="<%=wnidata.getNamaKetRw()%>"   onKeyUp="return char(form1.nama_ket_rw)">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nama Petugas Registrar <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td valign="top">
                                <input
                                class=boxdefault size=22 name=nama_pet_reg maxlength="55" value="<%=wnidata.getNamaPetReg()%>"   onKeyUp="return char(form1.nama_pet_reg)">
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">NIP Petugas Registrar</td>
                              <td valign="top">:</td>
                              <td width="210">
                                <input
                                class=boxdefault size=9 name=nip_pet_reg maxlength="9" value="<%=wnidata.getNipPetReg()%>"   onKeyUp="return num(form1.nip_pet_reg)">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nama Petugas Entri Data</td>
                              <td valign="top">:</td>
                              <td valign="top"><b><font color="#000066"><%=record.getNamaPetugas()%></font></b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">NIP Petugas Entri Data</td>
                              <td valign="top">:</td>
                              <td width="210"><b><font color="#000066"><%=record.getNipPetugas()%></font></b>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Tanggal Entri Data<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">:</td>
                              <td valign="top"> <%=record.getToday()%> </td>
                              <td width="12">
                                <input type="hidden"   maxlength="55" name="nama_pet_entri" value="<%=record.getNamaPetugas().trim()%>">
                                &nbsp;</td>
                              <td valign="top">
                                <input type="hidden"  maxlength="99" name="nip_pet_entri" value="<%=record.getNipPetugas().trim()%>">
                                &nbsp;</td>
                              <td valign="top">
                                <input type="hidden" name="today" value="<%=record.getToday().trim()%>">
                                &nbsp;</td>
                              <td width="210">&nbsp;</td>
                            </tr>
                          </table>
                            </td>
                          </tr>
                          <tr> </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td valign="top"><img src="images/dot.gif" width="1" height="25"></td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                     <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                    <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                     <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                      </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                      <td>
                        <div align="center"><b>

   <!--                       <input class=boxstandard type="submit" value=SIMPAN name="sim" >
   -->
   <input class=boxstandard type="submit" value=SIMPAN name="sim" onClick="return postp4bdata()">
                          </b></div>
                      </td>
   <!--
                      <td>
                        <div align="center"><b> </b></div>
                        <div align="center"><b>
                          <input class=boxstandard  type=button value=UBAH name="ubah" onClick="edit11()">
                          </b></div>
                      </td>
-->
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type="button" value=KELUAR onclick="document.location='WNI_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><font color="#000066">Keterangan :</font><span class="asterish">
                          *</span><span class="catatan"><font color="#000066">Data
                          harus diisi</font></span></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
<td>
</tr>
</table>
<p class="linkyellow">&nbsp;</p>
</form>
</BODY></HTML>
<%
}
if (wnidata.getAcknowldge().equals("Y"))
{
%>
           <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="4"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit_P4B.jsp"/>
           </jsp:forward>
<%
}
if (wnidata.getAcknowldge().equals("F"))
{
%>
           <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="2"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit_P4B.jsp"/>
           </jsp:forward>
<%
}
 if (wnidata.getAcknowldge().equals("E"))
{
%>
           <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="6"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit_P4B.jsp"/>
           </jsp:forward>
<%
}
 }
else
{
   response.sendRedirect("index.jsp");
}
 }
else
   {
   response.sendRedirect("index.jsp");
   }
}catch (Exception ne)
    {
      ne.printStackTrace();
      System.out.println("In WNI Edit Exception"+ne);
      response.sendRedirect(record.getModRefFile());
}
%>