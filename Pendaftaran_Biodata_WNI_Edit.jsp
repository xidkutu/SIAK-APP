<%@ page import="javax.naming.*,javax.rmi.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan,com.pkrjn.Pkrjn"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
     String nik;
     ServiceController wniedit=null;
     WNIBiodataHome home = null;
     WNIBiodata remote = null;
     BioSiak wnidata = null;
     UserInfo1 record = null;
     String changeflag="";
%>

<%
   nik = request.getParameter("nik");
if  (request.getParameter("alter")!=null)
   changeflag=request.getParameter("alter");

try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

 if(record != null)
   {
      wniedit = ServiceController.getInstance();
      home = (WNIBiodataHome)wniedit.lookup("WNIBiodata",WNIBiodataHome.class);
      remote = home.create();

//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found

 wnidata = (BioSiak)remote.getBioSiak(record.getNoProp(),record.getNoKab(),record.getNoKec(),request.getParameter("no_kel"),nik);

if (changeflag.equals("Y") &&
    wnidata.getAcknowldge().toString().trim().equals("Y"))
{
      wnidata.setAcknowldge("N");
}

if (wnidata.getAcknowldge().equals("F"))  //Not Found
    {
            %>
          <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="2"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit.jsp"/>
           </jsp:forward>
           <%
    }
else if (wnidata.getAcknowldge().toString().trim().equals("Y")) //already changed
      {
%>
           <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="3"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit.jsp"/>
           </jsp:forward>

<%
   }
else if (wnidata.getAcknowldge().toString().trim().equals("E"))  //Error
 {
%>
            <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="6"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit.jsp"/>
           </jsp:forward>

<%
 }
else if (wnidata.getAcknowldge().toString().trim().equals("N")) //Not changed but found
 {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/Update_Wni.js">
</SCRIPT>
<script language="javascript">
/*
function isNewNikSubmit()
{
if (document.all['jenis_klmin'].value!=document.all['jenis_kl_tmp'].value)
{
document.all['nik_flag'].value="2";
}

if (document.all['no_akta_lhr_dd'].value!=document.all['lhr_dd_tmp'].value)
{
document.all['nik_flag'].value="2";
}

if (document.all['no_akta_lhr_mm'].value!=document.all['lhr_mm_tmp'].value)
{
document.all['nik_flag'].value="2";
}
if (document.all['no_akta_lhr_yy'].value!=document.all['lhr_yy_tmp'].value)
{
document.all['nik_flag'].value="2";
}
}*/
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Update_Biodata_WNI.jsp">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td background="images/v_bg_header.gif">
        <jsp:include page="top.html"/>
      </td>
    </tr>
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="35">
              <div align="center"><span class="submenu">Pendaftaran Biodata WNI</span><br>
                <br>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
        <input type=hidden name='prop' value="<%=record.getNoProp().trim()%>">
        <input type=hidden name='kab' value="<%=record.getNoKab().trim()%>">
        <input type=hidden name='kec' value="<%=record.getNoKec().trim()%>">
        <% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&nama_kel="+ (request.getParameter("namakel")==null?"":request.getParameter("namakel"));
%>
        <jsp:include page="<%=jsp%>"/>
      </td>
    </tr>
    <tr>
      <td valign="top">
        <table width="600" border="0" cellspacing="3" cellpadding="2" align="center">
          <tr>
            <td colspan="4" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td colspan="4" height="25">
              <div align="center"><span class="subtitle">Data Keluarga</span></div>
            </td>
          </tr>
          <tr>
            <td colspan="4" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td valign="top" align="right"> Nomor Kartu Keluarga</td>
            <td></td>
            <td valign="top">: <b><%= wnidata.getNoKk().toString()%></b></td>
          </tr>
          <tr>
            <td valign="top" align="right"> Nama Kepala Keluarga</td>
            <td></td>
            <td valign="top">: <b><%=wnidata.getNama_kep().toString().toUpperCase()%></b></td>
          </tr>
          <tr>
            <td valign="top" align="right"> Alamat</td>
            <td></td>
            <td valign="top">: <b><%=wnidata.getAlamat().toString().toUpperCase()%></b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="5" cellpadding="5">
    <tr>
      <td valign="top">
        <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                <tr>
                  <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                  <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td valign="top">
                    <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
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
                              <td colspan="2" valign="top"> <b><font color="#000066">
                                <%=wnidata.getNik()%>
                                <input type="hidden" name="nik" value="<%=wnidata.getNik().toString().trim()%>">
                                </font></b></td>
                              <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
                              <td valign="top">Nama Lengkap <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <input
  		class=boxdefault size=22 name=nama_lgkp maxlength="60"  value="<%=wnidata.getNamaLgkp()%>" onKeyUp="return char(form1.nama_lgkp)" >
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <p>Nomor KTP/Nopen</p>
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"> <b>
                                <input
				class=boxdefault size=22 name=no_ktp maxlength="40"  value="<%=wnidata.getNoKtp()%>">
                                </b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tempat Tinggal Sebelumnya</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top"><b>
                                <input
				class=boxdefault size=22 name=tmpt_sbl maxlength="120"         value="<%=wnidata.getTmptSbl()%>">
                                </b> </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <div align="left">Nomor Paspor</div>
                              </td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <input
				class=boxdefault size=22 name=no_paspor maxlength="25"  value="<%=wnidata.getNoPaspor()%>" >
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tanggal Berakhir Paspor</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
				class=boxdefault size=2 name=no_akta_lh_dd maxlength="2"   value="<%=wnidata.getDdpaspor()%>"  onKeyUp="return tab()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=no_akta_lh_mon maxlength="2"   value="<%=wnidata.getMmpaspor()%>" onKeyUp="return tab1()">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
				class=boxdefault size=4 name=no_akta_lh_yy maxlength="4"  value="<%=wnidata.getYypaspor()%>"  onKeyUp="return tab2()">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top" height="35">Jenis Kelamin<font color="#000099" class="asterish">
                                *</font> </td>
                              <td valign="top" height="35">:</td>
                              <td colspan="2" valign="top" height="35">
<select  class="boxdefault" name="jenis_klmin" disabled>
<option value="0">-- Pilih Jenis Kelamin --</option>
<option value="1">1 - Laki-laki</option>
<option value="2">2 - Perempuan</option>
</select>
</td>
<td width="12" height="35">&nbsp;</td>
<td valign="top" height="35">Tempat Lahir <font color="#000099" class="asterish">*</font></td>
<td valign="top" height="35">:</td>
<td width="210" valign="top" height="35">
<input class=boxdefault size=22 name=tmpt_lhr maxlength="60"  value="<%=wnidata.getTmptLhr()%>"  onKeyUp="return char(form1.tmpt_lhr)">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Tanggal Lahir<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
				class=boxdefault size=2 name=no_akta_lhr_dd maxlength="2"  value="<%=wnidata.getDdlahir()%>" onKeyUp="return tab3()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2"      value="<%=wnidata.getMmlahir()%>" onKeyUp="return tab4()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
				class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4"     value="<%=wnidata.getYylahir()%>"   onKeyUp="return tab5()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Akta Kelahiran/Surat Kenal Lahir<font color="#000099" class="asterish">
                                *</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select class="boxdefault" name="akta_lhr" onblur="return validate1()">
                                  <option value="0">-- Pilih Akta Kelahiran --</option>
                                  <option value="1">1 - Tidak Ada</option>
                                  <option value="2">2 - Ada</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nomor Akta Kelahiran/<br>
                                Surat Kenal Lahir</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <input
				class=boxdefault size=22 name=no_akta_lhr maxlength="40"    value="<%=wnidata.getNoAktaLhr()%>">
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Golongan Darah <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select name=gol_drh class="boxdefault">
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
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Agama <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <table width="175" border="0" cellspacing="0" cellpadding="0" align="left">
                                  <tr>
                                    <td>
                                      <select class="boxdefault" name="aga_ma" onchange="return validate2()">
                                        <option value="0">-- Pilih Agama --</option>
                                        <option value="Islam">1 - Islam</option>
                                        <option value="Kristen">2 - Kristen</option>
                                        <option value="Katholik">3 - Katholik</option>
                                        <option value="Hindu">4 - Hindu</option>
                                        <option value="Budha">5 - Budha</option>
					<option value="Kong Hu Chu">6 - Kong Hu Chu</option>
                                        <option value="Lainnya">7 - Lainnya</option>
                                        
                                      </select>
</td>
<td>
<input class=boxdefault size=7 name=agama maxlength="20" disabled>
<%
if (!wnidata.getAgamaIdx().trim().equals(""))
{
%>
<script language="javascript">
document.all['aga_ma'].selectedIndex="<%=wnidata.getAgamaIdx()%>";
</script>
<%
 }
else
 {
%>
      <script language="javascript">
      document.all['aga_ma'].selectedIndex=6;
      document.all['agama'].value="<%=wnidata.getAgama().trim()%>";
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
                                <select name=stat_kwn boxdefault2 class="boxdefault" onblur="return validate3()">
                                  <option value="0">-- Pilih Status Perkawinan
                                  --</option>
                                  <option value="1">1 - Belum Kawin</option>
                                  <option value="2">2 - Kawin</option>
                                  <option value="3">3 - Cerai Hidup</option>
                                  <option value="4">4 - Cerai Mati</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Akta Perkawinan/Buku Nikah <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <select class="boxdefault" name="akta_kwn" onblur="akwn.value=this.value;return validate4()">
                                  <option value="0">-- Pilih Akta Perkawinan --</option>
                                  <option value="1">1 - Tidak Ada</option>
                                  <option value="2">2 - Ada</option>
                                </select>
                                <input type=hidden name='akwn' value="1">
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Nomor Akta Perkawinan/Buku Nikah</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <input
				class=boxdefault size=22 name=no_akta_kwn maxlength="40" value="<%=wnidata.getNoAktaKwn()%>">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Tanggal Perkawinan</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tgl_kwn_dd maxlength="2" onKeyUp="return tab6()" value="<%=wnidata.getDdkawin()%>">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tgl_kwn_mm maxlength="2"  onKeyUp="return tab7()" value="<%=wnidata.getMmkawin()%>" >
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
				class=boxdefault size=4 name=tgl_kwn_yy maxlength="4"  onKeyUp="return tab8()" value="<%=wnidata.getYykawin()%>">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Akta Perceraian/Surat Cerai<font color="#000099" class="asterish">
                                *</font> </td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <input type=hidden name='acri' value="1">
                                <select
		  		  class="boxdefault" name="akta_crai" onblur="acri.value=this.value;return validate6()">
                                  <option value="0">-- Pilih Akta Perceraian --</option>
                                  <option value="1">1 - Tidak Ada</option>
                                  <option value="2">2 - Ada</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nomor Akta Perceraian/Surat Cerai</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
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
				class=boxdefault size=2 name=tgl_crai_dd maxlength="2"  value="<%=wnidata.getDdcerai()%>" onKeyUp="return tab9()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=tgl_crai_mm maxlength="2"  value="<%=wnidata.getMmcerai()%>" onKeyUp="return tab10()">
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
				class=boxdefault size=4 name=tgl_crai_yy maxlength="4"   value="<%=wnidata.getYycerai()%>"  onKeyUp="return tab11()">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Status Hubungan dlm Keluarga <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
<select name="stat_hbkel"  class="boxdefault" onblur="checkStatHb(stat_kwn.value)" onchange="checkHbKel(this)">
                                  <option value="0">-- Pilih Status Hub. dalam
                                  Keluarga--</option>
 			          <option value="1">1 - Kepala Keluarga</option>
                                  <option value="2">2 - Suami</option>
                                  <option value="3">3 - Istri</option>
                                  <option value="4">4 - Anak</option>
                                  <option value="5">5 - Menantu</option>
                                  <option value="6">6 - Cucu</option>
                                  <option value="7">7 - OrangTua</option>
                                  <option value="8">8 - Mertua</option>
                                  <option value="9">9 - Famili Lain</option>
                                  <option value="10">10 - Pembantu</option>
                                  <option value="11">11 - Lainnya</option>
                                </select>
<input type="hidden" name="stat_hbkel_temp">
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Kelainan Fisik dan Mental <font color="#000099" class="asterish">*</font>
                              </td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select
		  		  class="boxdefault" name="klain_fisik" onChange="return validate8()">
                                  <option value="0">-- Pilih Kelainan --</option>
                                  <option value="1">1 - Tidak Ada</option>
                                  <option value="2">2 - Ada</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Penyandang Cacat</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <select
		  name=pnydng_cct  class="boxdefault">
                                  <option value="0">-- Pilih Penyandang Cacat
                                  --</option>
                                  <option value="1">1 - Cacat Fisik</option>
                                  <option value="2">2 - Cacat Netra/Buta</option>
                                  <option value="3">3 - Cacat Rungu/Wicara</option>
                                  <option value="4">4 - Cacat Mental/Jiwa</option>
                                  <option value="5">5 - Cacat Fisik dan Mental</option>
                                  <option value="6">6 - Cacat Lainnya</option>
                                </select>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Pendidikan Terakhir<font color="#000099" class="asterish">
                                *</font> </td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                <select
		  name=pddk_akh boxdefault2 class="boxdefault">
                                  <option value="0">-- Pilih Pendidikan Terakhir
                                  --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Belum Tamat SD/Sederajat</option>
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
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Jenis Pekerjaan <font color="#000099" class="asterish">*</font></td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
                                <select   name=jenis_pkrjn  class="boxdefault">
                                  <option>-- Pilih Jenis Pekerjaan --</option>
                                  <%
                                      Vector vt_pkrjn=getPkrjn();
                                      Pkrjn pk_obj=null;
                                     for(int i=0;i<vt_pkrjn.size();i++)
                                          {
                                            pk_obj=(Pkrjn)vt_pkrjn.elementAt(i);
                                  %>
                                  <option value="<%=pk_obj.getNo()%>"><%=pk_obj.getNo()+"-"+pk_obj.getDescrip()%></option>
                                  <%
                                          }
                                    %>
                                </select>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tr>
                              <td height="10">
                                <div align="center"><img src="images/dot.gif" width="1" height="10" hspace="5"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="25">
                                <div align="center"><span class="subtitle">Data
                                  Orangtua</span></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                            </tr>
                            <tr valign="top">
                              <td>
                                <table width="650" border="0" cellspacing="3" cellpadding="2">
                                  <tr>
                                    <td>NIK Ibu</td>
                                    <td>:</td>
                                    <td>
                                      <input
				class=boxdefault size=16 name=nik_ibu maxlength="16"  value="<%=wnidata.getNikIbu()%>" onKeyUp="return num(form1.nik_ibu)">
                                    </td>
                                    <td width="8"><b> <i><b> </b></i></b></td>
                                    <td width="10"><img src="images/dot.gif" width="5" height="1"></td>
                                    <td>Nama Lengkap Ibu <font color="#000099" class="asterish">*</font>
                                    </td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=22 name=nama_lgkp_ibu maxlength="60"  value="<%=wnidata.getNamaLgkpIbu()%>"  onKeyUp="return char(form1.nama_lgkp_ibu)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>NIK Ayah</td>
                                    <td>:</td>
                                    <td>
                                      <input
				class=boxdefault size=16 name=nik_ayh maxlength="16"  value="<%=wnidata.getNikAyah() %>"   onKeyUp="return num(form1.nik_ayh)">
                                    </td>
                                    <td><b> <i><b> </b></i></b></td>
                                    <td width="10">&nbsp;</td>
                                    <td>Nama Lengkap Ayah</td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=22 name=nama_lgkp_ayh maxlength="60"  value="<%=wnidata.getNamaLgkpAyah()%>"  onKeyUp="return char(form1.nama_lgkp_ayh)">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tr>
                              <td height="10">
                                <div align="center"><img src="images/dot.gif" width="1" height="10" hspace="5"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="25">
                                <div align="center"><span class="subtitle">Data
                                  Administrasi</span></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="1">
                                <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                              </td>
                            </tr>
                            <tr>
                              <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                            </tr>
                            <tr valign="top">
                              <td>
                                <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                  <tr>
                                    <td height="33">Nama Ketua RT <font color="#000099" class="asterish">
                                      </font></td>
                                    <td height="33">:</td>
                                    <td colspan="2" height="33">
                                      <input
				class=boxdefault size=22 name=nama_ket_rt maxlength="60"  value="<%=wnidata.getNamaKetRt()%>" onKeyUp="return char(form1.nama_ket_rt)">
                                    </td>
                                    <td height="33"><img src="images/dot.gif" width="10" height="1"></td>
                                    <td height="33">Nama Ketua RW</td>
                                    <td height="33">:</td>
                                    <td colspan="2" height="33">
                                      <input
				class=boxdefault size=22 name=nama_ket_rw maxlength="60"     value="<%=wnidata.getNamaKetRw()%>"  onKeyUp="return char(form1.nama_ket_rw)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>Nama Petugas Registrar <font color="#000099" class="asterish">*</font></td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=22 name=nama_pet_reg maxlength="60"   value="<%=wnidata.getNamaPetReg()%>" onKeyUp="return char(form1.nama_pet_reg)">
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>NIP Petugas Registrar </td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=9 name=nip_pet_reg maxlength="9"  value="<%=wnidata.getNipPetReg()%>" onKeyUp="return num(form1.nip_pet_reg)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>Nama Petugas Entri Data</td>
                                    <td>:</td>
                                    <td colspan="2"><b><font color="#000066">
                                      <%=record.getNamaPetugas()%> </font></b></td>
                                    <td>&nbsp;</td>
                                    <td>NIP Petugas Entri Data</td>
                                    <td>:</td>
                                    <td colspan="2"><b><font color="#000066">
                                      <%=record.getNipPetugas()%></font></b> </td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                      <input type="hidden"   maxlength="55" name="nama_pet_entri" value="<%=record.getNamaPetugas().trim()%>">
                                      &nbsp; </td>
                                    <td colspan="2">
                                      <input type="hidden"  maxlength="99" name="nip_pet_entri" value="<%=record.getNipPetugas().trim()%>">
                                      &nbsp; </td>
                                  </tr>
                                  <tr>
                                    <td>Tanggal Entri Data<font color="#000099" class="asterish">
                                      *</font></td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <table width="100" border="0" cellspacing="3" cellpadding="0">
                                        <tr>
                                          <td> <%=record.getToday()%> </td>
                                        </tr>
                                      </table>
                                      <b></b></td>
                                    <td>
                                      <input type="hidden" name="today" value="<%=record.getToday().trim()%>">
                                      &nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
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
              <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                <tr>
                  <td>
                    <div align="center"><b>
                      <input class=boxstandard type="submit" value=UBAH name="sim" onClick="return valid()">
                      </b></div>
                  </td>
                  <td>
                    <div align="center"><b>
                      <input class=boxstandard type="button" value="KELUAR" name="bat" onclick="document.location='WNI_Menu.jsp'">
                      </b></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="catatan" colspan="2"><font color="#000066">Keterangan
                    :</font><span class="asterish"> *</span><span class="catatan"><font color="#000066">Data
                    harus diisi</font></span></td>
    </tr>
     </table>
<input type="hidden" name="jenis_kl_tmp" value="<%=wnidata.getJenisKlmin()%>">
<input type="hidden" name="lhr_dd_tmp" value="<%=wnidata.getDdlahir()%>">
<input type="hidden" name="lhr_mm_tmp" value="<%=wnidata.getMmlahir()%>">
<input type="hidden" name="lhr_yy_tmp" value="<%=wnidata.getYylahir()%>">
<input type="hidden" name="nik_flag" value="1">
 </td>
   </tr>
   </table>
    </tr>
  </table>
<script language="JavaScript">
form1.jenis_klmin.options[<%=wnidata.getJenisKlmin()%>].selected=true
form1.akta_lhr.options[<%=wnidata.getAktaLhr()%>].selected=true
form1.gol_drh.options[<%=wnidata.getGolDrh()%>].selected=true
form1.stat_kwn.options[<%=wnidata.getStatKwn()%>].selected=true
form1.akta_kwn.options[<%=wnidata.getAktaKwn()%>].selected=true
form1.akta_crai.options[<%=wnidata.getAktaCrai()%>].selected=true
form1.stat_hbkel.options[<%=wnidata.getStatHbkel()%>].selected=true
form1.stat_hbkel_temp.value="<%=wnidata.getStatHbkel()%>";
form1.klain_fisik.options[<%=wnidata.getKlainFsk()%>].selected=true
form1.pddk_akh.options[<%=wnidata.getPddkAkh()%>].selected=true
form1.jenis_pkrjn.options[<%=wnidata.getJenisPkrjn()%>].selected=true
</script>
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

}catch (Exception ne)
    {
     ne.printStackTrace();
     System.out.println("In WNI Edit Exception"+ne);
     response.sendRedirect("index.jsp");
    }
%>
