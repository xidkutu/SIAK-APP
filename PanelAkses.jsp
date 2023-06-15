<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%
try
 {
if (session.getAttribute("remoteRef")!=null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/Panel.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<SCRIPT language="JavaScript">
function setValue(obj)
{
document.all['jenis_mod'].length=1;
if (obj.checked)
document.all['offline'].value=0
else
document.all['offline'].value=1
}
</script>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="pilwil" method="post" action="PanelAksesInput.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
</tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="45" valign="middle">
                              <div align="center"><font class="submenu">Panel
                                Pengaturan Hak Akses Pengguna/User</font></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">&nbsp; </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="510" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                          <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center" class="C-BG">
                            <tr valign="top">
                              <td class="C-Field" width="210">Kode Penggunaan/User</td>
                              <td class="C-Field" width="2">: </td>
                              <td class="C-Field" colspan="4"> &lt;Create by System&gt;</td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Deskripsi</td>
                              <td class="C-Field">: </td>
                              <td class="C-Field" colspan="4">
                                <input
                                class=boxdefault size=22 name=nama_grup maxlength="40">
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Kata Kunci<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">:</td>
                              <td class="C-Field" colspan="4">
                                <input
                                class=boxdefault size=22 name=pwd maxlength="12" type="password">
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Konfirmasi Kata Kunci<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">:</td>
                              <td class="C-Field" colspan="4">
                                <input
                                class=boxdefault size=22 name=konf_pwd maxlength="12" type="password">
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Penggunaan Tipe</td>
                              <td class="C-Field">&nbsp;</td>
<td class="C-Field" colspan="4" valign="middle">
<input type="checkbox" name="offchk" onclick="setValue(this)">
Offline/Online
<input type="hidden" name="offline" value="1">
</td>
</tr>
                            <tr valign="top">
                              <td class="C-Field">Tingkat Adm Pemerintahan<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">:</td>
                              <td class="C-Field" colspan="4">
                                <select
                  class="boxdefault" name="nama_lvl" onChange="return level(pilwil)">
                                  <option value="0" selected>-- Pilih Tingkat
                                  Adm --</option>
                                  <option value="1">1 - Pusat</option>
                                  <option value="2">2 - Provinsi</option>
                                  <option value="3">3 - Kabupaten/Kota</option>
                                  <option value="4">4 - Kecamatan</option>
                                </select>
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Kode - Nama Propinsi<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">:</td>
                              <td class="C-Field" width="7%">
                                <input
                                class=boxdefault size=2 name=nprop maxlength="2" onFocus="this.blur()">
                              </td>
                              <td class="C-Field" colspan="3">
                                <select name="naprop" onChange="wilreset2(pilwil.nprop,pilwil.nkab,pilwil.nakab,pilwil.nkec,pilwil.nakec);pilwil.nprop.value=this.value;ch_kab(pilwil.nprop.value,pilwil.nakab, 'false');" class="boxdefault" disabled>
                                  <option>-- Pilih Provinsi --</option>
                                </select>
                                <script language="javascript">
                                   getProps();
                                </script>
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Kode - Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">:</td>
                              <td class="C-Field">
                                <input
                                class=boxdefault size=2 name=nkab maxlength="2" onFocus="this.blur()">
                              </td>
                              <td class="C-Field" colspan="3">
                                <select class="boxdefault" name="nakab" onChange="pilwil.nkab.value=this.value;ch_kec(pilwil.nprop.value,pilwil.nkab.value,pilwil.nakec, 'false');"  disabled>
                                  <option>-- Pilih Kabupaten/Kota --</option>
                                </select>
                                <script language="javascript">
                                  ch_kab(pilwil.nprop.value,pilwil.nakab, 'false');
                                </script>
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Kode - Nama Kecamatan<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">:</td>
                              <td class="C-Field">
                                <input
                                class=boxdefault size=2 name=nkec maxlength="2" onFocus="this.blur()">
                              </td>
                              <td class="C-Field" colspan="3">
                                <select class="boxdefault" name="nakec"  onChange="nkec.value=this.value"  disabled>
                                  <option>-- Pilih Kecamatan --</option>
                                </select>
                                <script language="javascript">
                                  ch_kec(pilwil.nprop.value, pilwil.nkab,pilwil.nakec, 'false');
                                </script>
                              </td>
                            </tr>
                            <tr valign="top">
                              <td class="C-Field">Nama Divisi<font color="#000099" class="asterish">*</font></td>
                              <td class="C-Field">&nbsp;</td>
                              <td class="C-Field" colspan="4">
<select class="boxdefault" name="nama_div" onchange="jenis_mod.selectedIndex=0; setPermission(pilwil.jenis_mod, nama_lvl.options[nama_lvl.selectedIndex].value,nama_div.options[nama_div.selectedIndex].value);">
<option value="0" selected>-- Pilih Devisi --</option>
<!--
<option value="1">1 - Umum</option>
<option value="2">2 - Operator Pendaftaran Penduduk</option>
<option value="3">3 - Operator Catatan Sipil</option>
<option value="4">4 - Supervisor</option>
<option value="5">5 - Supervisor Pendaftaran Penduduk</option>
<option value="6">6 - Supervisor Catatan Sipil</option>
-->
</select>
</td>
</tr>
<tr valign="top">
<td class="C-Field">Hak Akses <font color="#000099" class="asterish">*</font></td>
<td class="C-Field">:</td>
<td class="C-Field" colspan="4">
<div align="center"> </div>
<!--<select class="boxdefault" name="jenis_mod"  onchange="checkAccessRight(this, nama_lvl.options[nama_lvl.selectedIndex].value,nama_div.options[nama_div.selectedIndex].value, this.selectedIndex)">-->
<select class="boxdefault" name="jenis_mod">
<option value="0" selected>-- Pilih Hak Akses--</option>
<!--
<option value="2">1 - Persetujuan Pengguna</option>
<option value="3">2 - Dafduk WNI</option>
<option value="4">3 - Capil Lahir-Mati</option>
<option value="5">4 - Dafduk Ubah Biodata/Cetak Ulang WNI</option>
<option value="6">5 - Capil Lahir-Mati-Kawin-Cerai</option>
<option value="7">6 - Dafduk WNA</option>
<option value="8">7 - Capil Cetak Ulang Akta</option>
<option value="9">8 - Dafduk Ubah Biodata/Cetak Ulang WNA</option>
<option value="10">9 - Buku Laporan</option>
<option value="11">10 - Statistik Vital dan Laporan</option>
<option value="12">11 - Statistik Nasional</option>
--></select></td></tr></table>
</td><td>&nbsp;</td></tr><tr><td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
<td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
<td width="5" height="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
</tr></table></td></tr><tr>
                <td height="45" valign="bottom">
                  <table width="300" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                        <td width="8">
                          <div align="center"><b> </b></div>
                      </td>
                        <td width="124">
                          <div align="center"><b> </b></div>
                          <div align="center"><b>
                            <input class=boxstandard type="submit" value="SIMPAN" name="sim"  onClick="return hak(pilwil)">
                            </b></div>
                      </td>
                        <td width="118">
                          <div align="center"><b>
                          <input class=boxstandard type="submit" value=KELUAR name="kel">
                          </b></div>
                      </td>
                    </tr>
                  </table>
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
      e.printStackTrace();
   }
%>