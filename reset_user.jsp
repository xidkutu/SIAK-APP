<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%!
    UserInfo1 record = null;
%>

<%
try
   {
record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
System.out.println("record.getNamaProp() menu_supv_otor: "+record.getNamaProp());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form method="post" action="Logout.jsp">
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
                  <table width="505" border="0" cellspacing="3" cellpadding="2" align="center" height="100">
                    <tr>
                      <td colspan="4">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1">
                        </div>
                        <table width="498" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="3">
                              <div align="center"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="25">
                              <div align="center" class="submenu">Data Wilayah</div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
 <td colspan="3" height="10">
 <table width="439" border="0" cellspacing="3" cellpadding="0" align="center">
<%
if(record.getNoProp()!=null && !record.getNoProp().trim().equals(""))
{
%>
                                <tr>
                                  <td width="240">Kode-Nama Provinsi</td>
                                  <td width="10">:</td>
                                  <td width="24">
                                  <%=record.getNoProp()%> -
                                  </td>
                                  <td width="150">
                                  <%=record.getNamaProp()%>
                                  </td>
                                </tr>
<%
}
%>

<%
if(record.getNoKab()!=null && !record.getNoKab().trim().equals(""))
{%>
                                <tr>
                                  <td width="240">Kode-Nama Kabupaten/Kota</td>
                                  <td width="10"> :</td>
                                  <td width="24">
                                  <%=record.getNoKab()%> -
                                  </td>
                                  <td width="150">
                                  <%=record.getNamaKab()%>
                                  </td>
                                </tr>
<%}%>
<%
if(record.getNoKec()!=null && !record.getNoKec().trim().equals(""))
{%>
                                <tr>
                                  <td width="240">Kode-Nama Kecamatan</td>
                                  <td width="10"> :</td>
                                  <td width="24">
                                  <%=record.getNoKec()%> -
                                  </td>
                                  <td width="150">
                                  <%=record.getNamaKec()%>
                                  </td>
                                </tr>
<%}%>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="4">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="20">
                              <div align="center" class="submenu">
                                  <p>Menu Administrasi Pengguna</p>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="10">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
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
                            <td>
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
                                          <td width="324" height="12"> <a href="pilihwilayah?route=true&level=3&screen_code=9&security_option=yes"><font color="#000099">
                                            Administrasi Pengguna </font> </a>
                                          </td>
                                      </tr>
                                      <tr>
                                        <td colspan="2" height="2">
                                          <div align="center"><img src="images/batas_dot2.gif" width="333" height="1"></div>
                                        </td>
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
                      <td colspan="4" height="40" valign="bottom">
                        <div align="center"><b>
                          <input class=boxstandard type=submit value=LOGOUT name="button">
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
