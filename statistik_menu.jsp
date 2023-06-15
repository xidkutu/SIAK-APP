<%@ page import="pendaftaran.*"%>
<%!
UserInfo1 record=null;
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");
if (record!=null)
    {
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<SCRIPT language=JavaScript src="Templates/ajlib.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/ajmenu.js">
</SCRIPT>
<SCRIPT language="JavaScript">
 ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#000099', '#CC0000','#ffffff','right');
 ajmenu1.addItems('Data P4B', '');
 ajmenu1 = new subMenu('1','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
 ajmenu1.addItems('Jumlah Penduduk Menurut Pendidikan Akhir', 'pilihwilayah?route=true&level=3&screen_code=24');
 ajmenu1.addItems('Jumlah Penduduk Menurut Agama', 'pilihwilayah?route=true&level=3&screen_code=25');
</script>

<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
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
                  <table width="600" border="0" cellspacing="3" cellpadding="2" align="center" height="100">
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="25">
                        <div align="center" class="judul_utama">
                          <p class="submenu">
    Menu Statistik Kependudukan
          </p>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4"><img src="images/dot.gif" width="1" height="10">
                        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td height="241" rowspan="3" width="1"></td>
                            <td>&nbsp; </td>
                            <td height="241" rowspan="3"></td>
                          </tr>
                          <tr>
                            <td>
                              <table width="460" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC">
                                <tr>
                                  <td><img src="images/v_sdt_kr_up2.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td><img src="images/v_sdt_kn_up2.gif" width="5" height="5"></td>
                                </tr>
                                <tr>
                                  <td height="241"></td>
                                  <td height="241">
                                    <table width="100%" border="0" cellspacing="8" cellpadding="0" align="center">
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524">
                                          <!--
<a href="parameter_demografi_opening.jsp">
 <font color="#000099">Parameter Demografi</font></a>
-->
                                          <!--<a href="javascript:alert('Masih dalam perbaikan')">-->
                                          <a href="pilihwilayah?route=true&level=2&screen_code=20&pick_year=true">
                                          <font color="#000099">Parameter Demografi</font></a>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=10&pick_year=true"><font color="#000099">Jumlah
                                          Penduduk Menurut LAMPID</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=0"><font color="#000099">Jumlah
                                          Penduduk Menurut Pendidikan Akhir</font></a><span class="linkyellow"></span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=1"><font color="#000099">Jumlah
                                          Penduduk Menurut Jenis Pekerjaan</font></a><span class="linkyellow"></span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=2"><font color="#000099">Jumlah
                                          Penduduk Menurut Status Perkawinan &amp;
                                          K.milik Akta</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=3"><font color="#000099">Jumlah
                                          Penduduk Menurut Golongan Darah</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=4"><font color="#000099">Jumlah
                                          Penduduk Menurut Kepemilikan Paspor</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=5"><font color="#000099">Jumlah
                                          Penduduk Menurut Agama</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="pilihwilayah?route=true&level=3&screen_code=6"><font color="#000099">Jumlah
                                          Penduduk Menurut Penyandang Cacat</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" valign="top">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="40" valign="top">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524" valign="bottom">
   <script language=JavaScript>
	createMenu();
	</script>
 <script language=JavaScript>
	displayMenu();
	</script>
             </td>
                                      </tr>
                                    </table>
                                  </td>
                                  <!--<td height="241"> </td>-->
                                </tr>
                                <tr>
                                  <td height="1"><img src="images/v_sdt_kr_btm2.gif" width="5" height="5"></td>
                                  <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                  <td width="5" height="5"><img src="images/v_sdt_kn_btm2.gif" width="5" height="5"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
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
<td colspan="4" height="40" valign="bottom">
<div align="center"><b>
<%
String file_mod;
  if (record.getModRefFile().trim().toUpperCase().equals("STATISTIK_MENU.JSP"))
     file_mod="Logout.jsp";
 else
     file_mod=record.getModRefFile();
%>

<input class=boxstandard type=button value="KELUAR" name="kel" onclick="document.location='<%=file_mod.trim()%>'">
                          </b></div>
                      </td>
                    </tr>
                  </table>

                </td>
              </tr>
              <tr>
                <td height="55"></td>
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