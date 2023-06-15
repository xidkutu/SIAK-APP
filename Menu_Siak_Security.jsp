<%
 if  (session.getAttribute("remoteRef")!=null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="form1" method="post" action="Logout.jsp">
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
                <td valign="top">
                  <table width="598" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="4">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4">
                        <div align="center" class="judul_utama">
                          <p class="submenu">Menu SIAK Security</p>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4"><img src="images/dot.gif" width="1" height="10">
                        <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td rowspan="3" width="1"></td>
                            <td>&nbsp; </td>
                            <td rowspan="3"></td>
                          </tr>
                          <tr>
                            <td height="163">
                              <table width="375" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC">
                                <tr>
                                  <td><img src="images/v_sdt_kr_up2.gif" width="5" height="5"></td>
                                  <td><img src="images/dot.gif" width="1" height="1"></td>
                                  <td><img src="images/v_sdt_kn_up2.gif" width="5" height="5"></td>
                                </tr>
                                <tr>
                                  <td></td>
                                  <td>
                                    <table width="100%" border="0" cellspacing="8" cellpadding="0" align="center">
                                      <tr>
                                        <td width="16" height="12">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="324" height="12"><a href="PanelAkses.jsp"><font color="#000099">Panel
                                          Pengaturan Hak Akses Pengguna</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                          <td width="324"><a href="pilihwilayah?route=true&level=3&screen_code=7&security_option=yes"><font color="#000099">Daftar
                                            Pengguna</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16" height="12">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                          <td width="324" height="12"><a href="UbahPassword.jsp"><font color="#000099">
                                            </font></a><a href="Persetujuan.jsp"><font color="#000099">Persetujuan
                                            Permohonan Pengguna</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                          <td width="324"><a href="pilihwilayah?route=true&level=3&screen_code=8&security_option=yes"><font color="#000099">Daftar
                                            Kunci Otoritas Pengguna</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="324"><a href="pilihwilayah?route=true&level=3&screen_code=9&security_option=yes"><font color="#000099">Daftar
                                          Administrasi Pengguna</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16" height="15">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                          <td width="324" height="15"><a href="UbahPassword.jsp"><font color="#000099">Ubah
                                            Password Pengguna</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16" height="12">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="324" height="12"><a href="monitor.jsp"><font color="#000099">
                                          Monitoring Operasional Pengguna SIAK</font></a></td>
                                      </tr>
									  <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="16" height="12">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="324" height="12"><a href="Pendaftaran_Biodata_WNI_Edit1.jsp?destination=Pendaftaran_Biodata_WNI_Edit.jsp&alter=Y"><font color="#000099">
                                          Perubahan Biodata</font></a></td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td> </td>
                                </tr>
                                <tr>
                                  <td><img src="images/v_sdt_kr_btm2.gif" width="5" height="5"></td>
                                  <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                  <td width="5"><img src="images/v_sdt_kn_btm2.gif" width="5" height="5"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                            <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" valign="bottom">
                        <div align="center"><b>
                          <input class=boxstandard type="button" value="KELUAR" name="logs" onclick="document.location='siak_admin.jsp'">
                          </b></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td></td>
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
</BODY></HTML>
<%
}
else
 {
%>
<jsp:forward page="index.jsp">
</jsp:forward>
<%
 }
%>

