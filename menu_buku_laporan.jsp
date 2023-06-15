<%@ page language="java" import="pendaftaran.*,com.siak.validate.*;"%>
<%
 UserInfo1 record=null;
try{
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
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="topumum.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td valign="top">
                  <table width="500" border="0" cellspacing="3" cellpadding="2" align="center" height="100">
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="25">
                        <div align="center" class="judul_utama">
                          <p class="submenu">Menu Buku Laporan</p>
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
                        <table width="550" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                              <table width="410" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC">
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
                                        <td width="35">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=12"><font color="#000099">BUKU
                                          INDUK PENDUDUK</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=13"><font color="#000099">BUKU
                                          INDUK PENDUDUK TINGGAL TETAP (WNA)</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=3&screen_code=18"><font color="#000099">BUKU
                                          REKAPITULASI PENDUDUK</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><a href="II.Setup%20Wilayah/4.data_input_desa-kelurahan.htm"></a><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=3&screen_code=19"><font color="#000099">BUKU
                                          PERUBAHAN KARTU KELUARGA PENDUDUK</font></a></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=14"><font color="#000099">BUKU
                                          PERKEMBANGAN PENDUDUK</font></a><span class="linkyellow"></span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=15"><font color="#000099">BUKU
                                          KARTU TANDA PENDUDUK</font></a><span class="linkyellow"></span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=16"><font color="#000099">DAFTAR
                                          CALON PEMILIH</font></a></td>
                                      </tr>
                                      <% if (ValidateLicense.validateLicense("C:\\bea\\logs\\siaklogre\\" +
                                                "siak.lic")) { %>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=26"><font color="#000099">DAFTAR
                                          CALON PEMILIH ADV</font></a></td>
                                      </tr>
                                      <% } %>
                                      <tr>
                                        <td colspan="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="pilihwilayah?route=true&level=4&screen_code=17"><font color="#000099">PENDUDUK
                                          WAJIB KTP TINGKAT DESA/KELURAHAN</font></a></td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td height="241"> </td>
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
System.out.println("request.getRequestURI().substring(1,request.getRequestURI().length())"+ request.getRequestURI().substring(1,request.getRequestURI().length()));
%>

<%
String mod_file="";
if (request.getRequestURI().substring(1,request.getRequestURI().length()).trim().equals(record.getModRefFile().trim()))
 mod_file="Logout.jsp";
else
 mod_file=record.getModRefFile().trim();
%>
  <input class=boxstandard type=button value=KELUAR name="logout" onclick="document.location='<%=mod_file.trim()%>'">
                         </b></div>
                      </td>
                    </tr>
                  </table>

                </td>
              </tr>
              <tr>
                <td height="55">&nbsp;</td>
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
}catch(Exception err)
{
%>
<jsp:forward page="index.jsp">
</jsp:forward>
<%}
%>
