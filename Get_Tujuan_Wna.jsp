<%@ page language="java" import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>

<%!
Pindah_Wni pindah=null;
PindahAsalHome home=null;
PindahAsal remote=null;
ServiceController factory;
UserInfo1 record=null;
%>

<%
String no_kk="";
String namakep="",niplrh="",namacmat="",nipcmat="",namabup="",namapetentri="",nippetentri="",tglentri="";
String nprop="",nkab="",nkec="",nkel="",nama_kel="";
String totagt="";
String source="";
Vector vt=null;
int  i=0;

try
  {

   record=(UserInfo1)session.getAttribute("remoteRef");

 if (record != null)
  {

 if (request.getParameter("source")!=null && !request.getParameter("source").trim().equalsIgnoreCase("")) source=request.getParameter("source");

  no_kk=request.getParameter("no_kk_asal");

 nprop=record.getNoProp();
 nkab=record.getNoKab();

 nkec=request.getParameter("no_kec");
 nkel=request.getParameter("no_kel");
 nama_kel=request.getParameter("nama_kel");

   factory=ServiceController.getInstance();
   home = (PindahAsalHome) factory.lookup("PindahAsal",PindahAsalHome.class);
   remote = home.create();

   if(home!=null)
      {
   pindah=(Pindah_Wni)remote.getPinda_wna(getTrimData(no_kk),nprop,nkab,nkec,nkel);

   if(pindah==null)
      {
      response.sendRedirect("Keda_Tujuan_Wna.jsp?error=1&no_kk=" + no_kk);
      }
  else
    {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/pindah.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/tuj.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/disable_shortcut.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>

<style type="text/css">
<!--
.trans {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; background-color: #CBE0FA; border-style: none}
.backshade {  background-color: #DFEEFF; border-style: none; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; font-weight: bold}
-->
</style>

</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="kedatangan" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
<div align="center"><span class="subtitle">Keterangan Kedatangan <%=source%>
</span><br>
</div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
<td>
<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + (request.getParameter("no_kec")==null?"":request.getParameter("no_kec")) + "&nama_kec=" + (request.getParameter("nama_kec")==null?"":request.getParameter("nama_kec")) +
      "&no_kel=" + nkel+ "&nama_kel="+ nama_kel.toString().toUpperCase();
%>
<jsp:include page="<%=jsp%>"/>
                                             </td>
</tr>
<tr>
<td valign="top">&nbsp;</td>
</tr>
            </table>
            <table width="752" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                                Daerah Tujuan</span></div>
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
                        <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                          <tr>
                            <td colspan="15"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="../../images/dot.gif" width="1" height="10"></b></font></td>
                          </tr>

                          <tr>
                            <td width="174" valign="top"> Nomor Kartu Keluarga
                              Asal<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>

                            <td valign="top" colspan="13">
                            <b><%=no_kk%></b>
                              <b>
                              </b></td>

                          </tr>
                          <tr>
                            <td valign="top" width="174"> Nama Kepala Keluarga</td>
                            <td valign="top" width="5">:</td>
<td valign="top" colspan="13">
<b><%=pindah.getNamakk().toString().toUpperCase()%></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">NIK Kepala Keluarga</td>
                            <td valign="top" width="5">:</td>
<td valign="top" colspan="13">
<b><%=pindah.getNikk()%></b></td>
                          </tr>
                            <tr>
                            <td valign="top" width="174">Status Nomor KK Bagi
                              Yang Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13"><b>
<input  type="hidden" name=no_kk_asal value=<%=no_kk%>>
<input  type="hidden" name="source" value=<%=source%>>
<%
String arr[]={"1 - Numpang KK","2 - Membuat KK Baru","2 - Nama Kepala Keluarga dan Nomor KK Tetap"};
%>

<select name="stat_no_kk_pdh" class="boxdefault" onchange="chooseMod(this.options[this.selectedIndex].text,document.all['no_kk_asal'].value)">
<option selected value="0">
<font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">
-- Pilih Status Nomor KK Bagi Yang Pindah --</font>
</option>
<%
int jenis=Integer.parseInt(getTrimData(pindah.getJeskpndhn()));

   if ((jenis==1) || (jenis==2) || (jenis==3))
       {
%>
   <option value=1> <%=arr[0]%></option>
   <option value=3> <%=arr[2]%></option>
<%
       }
     else if (jenis==4)
      {
%>
   <option value=1> <%=arr[0]%></option>
   <option value=2> <%=arr[1]%></option>
<%
     }
%>
</select>
</b></td>
  </tr>
                <tr>
                            <td valign="top" width="174">Tanggal Kedatangan<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13">
                              <table width="119" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
<input class=boxdefault size=2 onKeyUp="return tglhr1()" name=tgl_datngn maxlength="2">
                                  </td>
                                  <td>/ </td>
                                  <td>
<input class=boxdefault size=2 onKeyUp="return tglhr2()" name=bln_datngn maxlength="2">
                                  </td>
                                  <td>/</td>
                                  <td>
<input class=boxdefault onKeyUp="return tglhr3()" size=4 name=thn_datngn maxlength="4">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="174" valign="top"> Nomor Kartu Keluarga
                              Tujuan<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                              <td valign="top" colspan="13">
                   <input  class="backshade" size=23 name=no_kk_tujuan maxlength="16"  value="<%=pindah.getNokk()%>" onFocus="this.blur()">
                              </td>
                          </tr>
                          <tr>
   <td valign="top" width="174">Alamat Tujuan Pindah<span class="asterish">*</span></td>
  <td valign="top" width="5">:</td>
                              <td valign="top" colspan="8">
<input type="text" value="<%=pindah.getAlatjpndh().toString().toUpperCase()%>" name="alamat_tjpndh" size="40" class="boxdefault" maxlength="120">

                                RT<font color="#000099" class="asterish"> </font>
                                <input  type="text"  value="<%=pindah.getNorttjpndh()%>" name="no_rt_tjpndh" size="3" class="boxdefault" maxlength="3">
                              RW
<input  type="text" value="<%=pindah.getNorwtjpndh()%>" name="no_rw_tjpndh" size="3" class="boxdefault" maxlength="3">

                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="8">
<input  type="text"  value="<%=pindah.getDusunTujuan().toString().toUpperCase()%>" name="dusun_tjpndh" size="22" class="boxdefault" maxlength="60">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Provinsi<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" width="172"><font color="#003366"><b><font color="#003366">
                              <%--<select size="1" name="nama_prop" class="boxdefault">
                                <option selected>-- Pilih Provinsi --</option>
                                <option>1 - Sumatera Selatan</option>
                                <option>2 - Sumatera Utara</option>
                              </select>--%>
<input  type="text"  value="<%=pindah.getNamaProp().toString().toUpperCase()%>" name="namaprop_tjpndh" size="20" class="boxdefault" maxlength="60">
<input  type="hidden"  value="<%=pindah.getNamaProp().toString().toUpperCase()%>" name="nama_prop_tuj">

                              </font></b></font></td>
                            <td valign="top" width="100"><font color="#000000">Kabupaten/Kota<span class="asterish">*</span></font></td>
                            <td valign="top" width="5">:</td>
                            <td colspan="10" valign="top" width="218"><b><font color="#003366">
                             <%-- <select size="1" name="nama_kab" class="boxdefault">
                                <option selected>-- Pilih Kab/Kota</option>
                                <option>1. Sukabumi</option>
                              </select>--%>
<input  type="text"  value="<%=pindah.getNamaKab().toString().toUpperCase()%>" name="namakab_tjpndh" size="20" class="boxdefault" maxlength="60">
<input  type="hidden"  value="<%=pindah.getNamaKab().toString().toUpperCase()%>" name="nama_kab_tuj">
                              </font></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Kecamatan<font color="#000000"><span class="asterish">*</span></font></div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" width="172"><font color="#003366"><b>

<input  type="text"  value="<%=pindah.getNamaKec().toString().toUpperCase()%>" name="namakec_tjpndh" size="20" class="boxdefault" maxlength="60">
<input  type="hidden"  value="<%=pindah.getNamaKec().toString().toUpperCase()%>" name="nama_kec_tuj">
                              </b></font></td>
                            <td valign="top" width="100">Desa/Kelurahan<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td colspan="10" valign="top" width="218">
<b>
<font color="#003366">
<input  type="text"  value="<%=pindah.getNamaKel().toString().toUpperCase()%>" name="namakel_tjpndh" size="20" class="boxdefault" maxlength="60">
<input  type="hidden"  value="<%=pindah.getNamaKel().toString().toUpperCase()%>" name="nama_kel_tuj">
</font>
</b>
</td></tr><tr><td valign="top" width="174">
<div align="right">Kode Pos</div></td>
<td valign="top" width="5">:</td><td valign="top" width="172"><b>
<input   value="<%=pindah.getKodepostjpndh()%>" class=boxdefault size=7 name=kodepos maxlength="5">


</b></td><td valign="top" width="100">Telepon</td>
<td valign="top" width="5">:</td><td colspan="10" valign="top" width="218">
<b>
<input   value="<%=pindah.getTelptjpndh()%>"  class=boxdefault size=12 name=telp maxlength="16">

</b>

<input type="hidden" name=alamat_lma value="<%=pindah.getAlamatAsal().toString().toUpperCase()%>">
<input type="hidden" name=no_rt_lma value="<%=pindah.getNoRtAsal()%>">
<input type="hidden" name=dusun_lma value="<%=pindah.getDusunAsal()%>">
<input type="hidden" name=no_rw_lma value="<%=pindah.getNoRwAsal()%>">
<input type="hidden" name=kodepos_lma value="<%=pindah.getKodePosAsal()%>">
<input type="hidden" name=telp_lma value="<%=pindah.getTelpAsal()%>">
<input type="hidden" name=no_prop_asl value="<%=pindah.getNoPropAsal()%>">
<input type="hidden" name=no_kab_asl value="<%=pindah.getNoKabAsal()%>">
<input type="hidden" name=no_kec_asl value="<%=pindah.getNoKecAsal()%>">
<input type="hidden" name=no_kel_asl value="<%=pindah.getNoKelAsal()%>">

</td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="left">Keluarga Yang Datang</div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13"><b> </b><b> </b></td>
                          </tr>
                          <tr>
                            <td valign="top" colspan="15">
                              <table width="680" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
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
                                        <td class="C-Fonts" rowspan="2" width="4%">
                                          <div align="center"> No.</div>
                                        </td>
                                        <td class="C-Fonts" rowspan="2" width="19%">
                                          <div align="center">NIK</div>
                                        </td>
                                        <td class="C-Fonts" rowspan="2" width="27%">
                                          <div align="center">Nnama Lengkap</div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="C-Fonts" width="21%">
                                          <div align="center">SHDK Sekarang</div>
                                        </td>
                                      </tr>
<%
 vt=pindah.getAllAnggota();
 int cntr=1;

 for(i=0;i<vt.size();i++)
 {
  Pindah_Anggota record=(Pindah_Anggota)vt.elementAt(i);
  System.out.println("record.getNik() " + record.getNik() + "," + record.getKwrngrn() + " + record.getKwrngrn()");

 if ((Integer.parseInt(getTrimData(pindah.getJeskpndhn()))==4) && (getTrimData(record.getStathbkel()).equalsIgnoreCase("Kepala Keluarga")))      continue;
%>
                                      <tr>
                                        <td class="C-Field" width="4%">
                                          <div align="center"> <%=cntr++%></div>
                                        </td>
                                        <td class="C-Field" width="19%">
<div align="center">
<%=record.getNik()%>  </div>
   </td>
                                        <td class="C-Field" width="27%">
  <div align="center">
<%=getTrimData(record.getNamalkg()).toString().toUpperCase()%>
</div>
            </td>
<td class="C-Field" width="21%">
 <div align="center">
   <input type="text" name="shdk<%=i%>" size=30 class="trans" value="<%=getTrimData(record.getStathbkel()).toString().toUpperCase()%>" onclick="this.blur()">
 </div>
<input type="hidden" name="agtnik<%=i%>" value="<%=record.getNik()%>">
<input type="hidden" name="no_kk_pindah<%=i%>" value="<%=pindah.getNokk()%>">
<input type="hidden" name="namalgkp<%=i%>" value="<%=record.getNamalkg()%>">
<input type="hidden" name="jenis<%=i%>" value="<%=record.getJenisklm()%>">
<input type="hidden" name="kwrn<%=i%>" value="<%=record.getKwrngrn()%>">
</td>
</tr>
<%}%>
<input type=hidden  name="alist">
<input type=hidden value="<%=i%>" name="totagt">
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

<%
if (source.equals("WNI"))
{
%>               <tr valign="top">
                            <td>Nama Kepala Desa/ Kelurahan<span class="asterish">*</span>
                            </td>
                            <td>:</td>
                            <td colspan="2">
                              <input
                                class=boxdefault size=22 name=nama_kep_des maxlength="60">
                            </td>
                            <td><img src="images/dot.gif" width="10" height="1"></td>
                            <td>NIP Lurah</td>
                            <td>:</td>
                            <td colspan="2">
                                <input  class=boxdefault size=9 name=nip_lrh maxlength="9">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td>Nama Camat<span class="asterish">*</span> </td>
                            <td>:</td>
                            <td colspan="2">
    <input   class=boxdefault size=22 name=nama_cmat maxlength="60" >
                            </td>
                            <td>&nbsp;</td>
                            <td>NIP Camat<span class="asterish">*</span> </td>
                            <td>:</td>
                            <td colspan="2">
<input  class=boxdefault size=9 name=nip_cmat maxlength="9">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td>Nama Petugas Entri</td>
                            <td>:</td>
                            <td colspan="2"><b><%=record.getNamaPetugas()%> </b></td>
                            <td>&nbsp;</td>
                            <td>NIP Petugas Entri</td>
                            <td>:</td>
                            <td colspan="2"> <b><%=record.getNipPetugas()%></b></td>
                          </tr>
                          <tr valign="top">
                            <td height="20"><img src="images/dot.gif" width="1" height="1">Tanggal
                              Entri</td>
                            <td>:</td>
                            <td colspan="2"> <b><%=record.getToday()%></b></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                          </tr>
<%
}
else if (source.equals("WNA"))
{
%>
  <tr>
    <td valign="top" width="30%" nowrap>Nama Bupati/Walikota/Pejabat<br>yang Ditunjuk
      <span class="asterish">*</span> </td>
    <td valign="top" width="1%">:</td>
    <td colspan="2" valign="top">
      <input type=hidden name="nama_bup" value="<%=record.getKabNamaPej()%>">
      <%=record.getKabNamaPej()%> </td>
    <td valign="top" nowrap>Nama Petugas Entri</td>
    <td valign="top" width="1%">:</td>
    <td colspan="2" valign="top"><%=getTrimData(record.getNamaPetugas()).toString().toUpperCase()%></td>
  </tr>
  <tr>
    <td valign="top" width="15%"> NIP Petugas Entri </td>
    <td valign="top" width="2%">:</td>
    <td colspan="2" valign="top" width="28%"><%=record.getNipPetugas()%> </td>
    <td valign="top" width="30%"> <img src="images/dot.gif" width="1" height="1">Tanggal
      Entri</td>
    <td valign="top" width="1%">:</td>
    <td colspan="2" valign="top"><%=record.getToday()%> </td>
  </tr>
<%
}
%>
</table>
<p>&nbsp;</p>
</td>
</tr>
</table>
</td>
<td>&nbsp;</td>
</tr>
<input type="hidden" name=nama_kk_asal value="<%=getTrimData(pindah.getNamakk()).toString().toUpperCase()%>">
<input type="hidden" name=stphd value="">
<input type="hidden" name=rentgl value="<%=pindah.getRenctglpindah()%>">
<input type="hidden" name=namapet_lma value="<%=getTrimData(pindah.getNamapetentri()).toString().toUpperCase()%>">
<input type="hidden" name=nipet_lma value="<%=pindah.getNippetentri()%>">
<input type="hidden" name=tglentlma value="<%=getTrimData(pindah.getTglentri()).toString().toUpperCase()%>">
<input type="hidden" name=namapetentri value="<%=getTrimData(record.getNamaPetugas()).toString().toUpperCase()%>">
<input type="hidden" name=nippetentri value="<%=getTrimData(record.getNipPetugas()).toString().toUpperCase()%>">
<input type="hidden" name=tglentri value="<%=getTrimData(record.getToday()).toString().toUpperCase()%>">
<input type="hidden" name=no_prop_tuj value="<%=pindah.getNoprop()%>">
<input type="hidden" name=no_kab_tuj value="<%=pindah.getNokab()%>">
<input type="hidden" name=no_kec_tuj value="<%=pindah.getNokec()%>">
<input type="hidden" name=no_kel_tuj value="<%=pindah.getNokel()%>">
<input type="hidden" name=naprop value="<%=record.getNamaProp()%>">
<input type="hidden" name=nb value=<%=record.getNoKab()%>>
<input type="hidden" name=nakab value="<%=record.getNamaKab() %>">
<input type="hidden" name=nc value=<%=record.getNoKec() %>>
<input type="hidden" name=nakec value="<%=record.getNamaKec()%>">
<input type="hidden" name=nl value=<%=nkel%>>
<input type="hidden" name=nakel value="<%=nama_kel%>">
<%
if (source.equals("WNA"))
{
%>
<input type="hidden" name=nama_bup_lma value="<%=pindah.getNamaBup()%>">
<%
}
%>
<%if (source.equals("WNI"))
{
%>
<input type="hidden" name=nama_kep_des_lma value="<%=pindah.getNamakep()%>">
<input type="hidden" name=nama_cmat_lma value="<%=pindah.getNamacmat()%>">
<%
}
%>

<tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
            <table width="449" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b>
<input class=boxstandard  type=button value=SIMPAN name="sim" onclick="starttuj(totagt.value)">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
                  <div align="center"><b>
   <input class=boxstandard type=button value=KELUAR name="submit232" onClick="document.location='<%=record.getModRefFile()%>'">
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
            </td>
        </tr>
      </table>
    </td>
  </tr>
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
  response.sendRedirect(record.getModRefFile());
}
  }
else
{
response.sendRedirect("index.jsp");
}
}catch(Exception e)
{
  e.printStackTrace();
  response.sendRedirect(record.getModRefFile());
}
%>
