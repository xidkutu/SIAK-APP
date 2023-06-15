<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
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
                              <div align="center"><font class="submenu">Setup
                                Penandatangan Akta dan Kutipan Akta</font></div>
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
                  <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                            <td class="C-Field" width="210">Kode-Nama Provinsi</td>
                            <td class="C-Field" width="2">: </td>
                            <td class="C-Field" width="2">
                              <input
                                class=boxdefault size=2 name=no_prop maxlength="2">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_prop maxlength="40">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Kode-Nama Kabupaten/Kota</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=2 name=no_kab maxlength="2">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_kab maxlength="40">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Jabatan pada Kantor/Dinas</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=jabatan maxlength="40">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Nama Pejabat</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=nama_pejabat maxlength="60">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">NIP Pejabat</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=9 name=nip_pejabat maxlength="9">
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td width="5" height="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="45" valign="bottom">
                  <table width="375" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=SIMPAN name="submit2">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b> </b></div>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=UBAH name="submit23">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="submit232">
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
<p class="linkyellow">&nbsp;</p>
</BODY></HTML>
