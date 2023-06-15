<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
    String no_kel,nama_kel,select,id1=null;
    UserInfo1 record = null;
    Vector v = null;
int level=0;
%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
  level = Integer.parseInt( record.getLevelId() );
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/Pengguna_User.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="PenggunaInput.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="625" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">Pendaftaran
                                Pengguna/User</span><br>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td>
<%if(level>1)
{%>
                        <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="10">
                              <table width="440" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td>Kode-Nama Provinsi</td>
                                  <td width="10"> :</td>
                                    <td width="4">
                                      <input
                                class=boxdefault size=4 name=no_prop  value="" onFocus="this.blur()" maxlength="2">
                                    </td>
                                    <td width="80">
                                      <input
                                class=boxdefault size=22 name=nama_prop value="" maxlength="60" onFocus="this.blur()">
                                    </td>
                                </tr>
<%
if(record.getNoProp() != null && record.getNamaProp() != null)
{%>
    <script language="JavaScript">

      form1.no_prop.value="<%=record.getNoProp()%>"
      form1.nama_prop.value="<%=record.getNamaProp()%>"

    </script>

<%}
%>

<%if(level>=3)
{%>
                                <tr>
                                  <td>Kode-Nama Kabupaten/Kota</td>
                                  <td width="10"> :</td>
                                    <td width="4">
                                      <input
                                class=boxdefault size=4 name=no_kab value="" onFocus="this.blur()" maxlength="2">
                                    </td>
                                    <td width="80">
                                      <input
                                class=boxdefault size=22 name=nama_kab value="" onFocus="this.blur()" maxlength="60">
                                    </td>
                                </tr>
<%
if(record.getNoKab() != null && record.getNamaKab() != null)
{%>
    <script language="JavaScript">

      form1.no_kab.value="<%=record.getNoKab()%>"
      form1.nama_kab.value="<%=record.getNamaKab()%>"

    </script>

<%}%>
<%}
if(level==4)
{%>
                                <tr>
                                  <td>Kode-Nama Kecamatan</td>
                                  <td width="10"> :</td>
                                    <td width="4">
                                      <input
                                class=boxdefault size=4 name=no_kec value="" onFocus="this.blur()" maxlength="2">
                                    </td>
                                    <td width="80">
                                      <input
                                class=boxdefault size=22 name=nama_kec  value="" onFocus="this.blur()" maxlength="60">
                                    </td>
<%

if(record.getNoKec() != null && record.getNamaKec() != null)
{%>
    <script language="JavaScript">

      form1.no_kec.value="<%=record.getNoKec()%>"
      form1.nama_kec.value="<%=record.getNamaKec()%>"

    </script>

<%}
%>

                                </tr>
<%}%>
                              </table>
                              <img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                        </table>
<%}%>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <table width="400" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td>
                                <table width="100%" border="0" cellspacing="1" cellpadding="5" align="center" class="C-BG">
                                  <tr>
                                    <td class="C-Field" width="40%"> Nama Lengkap<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">
                                      <div align="center">:</div>
                                    </td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=30 name=nama_lgkp maxlength="60" onKeyUp="return char(form1.nama_lgkp)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field"> Tempat Lahir<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">
                                      <div align="center">:</div>
                                    </td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=22 name=tmpt_lhr maxlength="40"  onKeyUp="return char(form1.tmpt_lhr)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field"> Tanggal Lahir<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">
                                      <div align="center">:</div>
                                    </td>
                                    <td class="C-Field">
                                      <table width="100" border="0" cellspacing="3" cellpadding="0">
                                        <tr>
                                          <td>
                                            <input
                                class=boxdefault size=2 name=no_akta_lh_dd maxlength="2" onKeyUp="return tab1()">
                                          </td>
                                          <td>/ </td>
                                          <td>
                                            <input
                                class=boxdefault size=2 name=no_akta_lh_mm maxlength="2" onKeyUp="return tab2()">
                                          </td>
                                          <td>/</td>
                                          <td>
                                            <input
                                class=boxdefault size=4 name=no_akta_lh_yy maxlength="4" onKeyUp="return tab3()">
                                          </td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">Jenis Kelamin<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">:</td>
                                    <td class="C-Field">
                                      <select
                  name=jenis_klmin boxdefault2 class="boxdefault">
                                        <option value="0" selected>-- Pilih Jenis
                                        Kelamin --</option>
                                        <option value="1">1. Laki-laki</option>
                                        <option value="2">2. Perempuan</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">Pangkat/Golongan<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">:</td>
                                    <td class="C-Field">
                                      <select name="gol"
onChange="form1.gol_pguna.value=this.value;data();jabatan.focus()">
                                        <option value="0" selected>-Pilih-</option>
                                        <option value="Juru Muda">Ia</option>
                                        <option value="Juru Muda Tk. I">Ib</option>
                                        <option value="Juru">Ic</option>
                                        <option value="Juru Tk. I">Id</option>
                                        <option value="Pengatur Muda">IIa</option>
                                        <option value="Pengatur Muda Tk. I">IIb</option>
                                        <option value="Pengatur">IIc</option>
                                        <option value="Pengatur Tk.I">IId</option>
                                        <option value="Penata Muda">IIIa</option>
                                        <option value="Penata Muda Tk. I">IIIb</option>
                                        <option value="Penata">IIIc</option>
                                        <option value="Penata Tk. I">IIId</option>
                                        <option value="Pembina">IVa</option>
                                        <option value="Pembina Tk. I">IVb</option>
                                        <option value="Pembina Utama Muda">IVc</option>
                                        <option value="Pembina Utama Madya">IVd</option>
                                        <option value="Pembina Utama">IVe</option>
                                      </select>
                                      <input
                                class=boxdefault size=22 name=gol_pguna maxlength="40" onFocus="this.blur()">
                                    </td>
                                    <input type="hidden" name="pgt" value="">
                                    <script language="javascript">

function data()
{
 form1.pgt.value=form1.gol.options[form1.gol.selectedIndex].text
}
</script>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">Jabatan<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">:</td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=22 name=jabatan maxlength="40" onKeyUp="return char(form1.jabatan)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">NIP<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">&nbsp;</td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=9 name=nip_pguna maxlength="20">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">Nama Kantor<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">:</td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=30 name=nama_ktr maxlength="40" onKeyUp="return char(form1.nama_ktr)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">Alamat Kantor<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">:</td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=30 name=alamat_ktr maxlength="120">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Field">Telepon/Fax<font color="#000099" class="asterish">*</font></td>
                                    <td class="C-Field">:</td>
                                    <td class="C-Field">
                                      <input
                                class=boxdefault size=20 name=tlp_ktr maxlength="40">
                                    </td>
                                  </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                            <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                          </tr>
                        </table>

                      </td>
                    </tr>
                    <tr>
                      <td height="35" valign="bottom">
                        <div align="center">
                          <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                            <tr>
                              <td width="33">
                                <div align="center"><b> </b></div>
                              </td>
                              <td width="151">
                                <div align="center"><b> </b></div>
                                <div align="center"><b>
                                  <input class=boxstandard type="submit" value="DAFTAR" name="sim"  onClick="return penuser()">
                                  </b></div>
                              </td>
                              <td width="166">
                                <div align="center"><b>
                                  <input class=boxstandard type="button" value=KELUAR name="kel" onclick="document.location='Logout.jsp'">
                                  </b></div>
                              </td>
                            </tr>
                          </table>

                        </div>
                        </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>&nbsp; </td>
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
     System.out.print("Exception in Pengguna_User = " + e);
response.sendRedirect("index.jsp");
   }

%>
