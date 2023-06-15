<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.ServiceController,javax.ejb.*" %>
<%
if (session.getAttribute("remoteRef")!=null)
{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
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
                <td valign="top">
                  <table width="600" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="4">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4">
                        <div align="center" class="judul_utama">
                          <p class="submenu">Menu Statistik Vital (Nasional)</p>
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
                        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                            <td>
                              <table width="460" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC">
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
                                        <td width="40">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td width="524"><a href="Sex_Statkwn_Pddk.jsp"><font color="#000099">Jenis
                                          Kelamin dan Status Perkawinan Indonesia</font></a></td>
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
                                        <td width="524"><a href="akta_lahir_ktp_pembuka.jsp"><font color="#000099">Kepemilikan
                                          Akta Kelahiran dan KTP Indonesia</font></a></td>
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
                                        <td width="524"><a href="Dependenci_Ratio.jsp"><font color="#000099">Struktur
                                          Umur dan Angka Beban Ketergantungan
                                          Penduduk </font></a></td>
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
<!--Mark1-->
                          <input class=boxstandard type=button value=LOGOUT KK name="button33" onclick="document.location='index.jsp'">
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
</BODY></HTML>
<%}
else
{
//Mark1
response.sendRedirect("index.jsp");
}
%>
