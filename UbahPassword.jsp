
<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
String status="";
UserInfo1 record = null;
%>

<%
try
   {

record=(UserInfo1)session.getAttribute("remoteRef");
 if (record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<script language="javascript" src="scripts/UbahPassword.js">
</script>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="UbahInput.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="625" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
              <tr>
                <td valign="top">
                  <table width="100%" border="0" cellspacing="3" cellpadding="3" height="100%">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">Ubah Password
                                Pengguna/User</span><br>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
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
                                  <td class="C-Field"> Nama Pengguna/User</td>
                                  <td class="C-Field">
                                    <div align="center">:</div>
                                  </td>
                                  <td class="C-Field">
                                      <input
                                class=boxdefault size=27 name=nama_pguna value="<%=record.getUserId()%>" maxlength="12" onFocus="this.blur()">
                                  </td>
                                </tr>
                                <tr>
                                    <td class="C-Field"> Kata kunci Lama</td>
                                  <td class="C-Field">
                                    <div align="center">:</div>
                                  </td>
                                  <td class="C-Field">
                                      <input
                                class=boxdefault size=27 name=psw_lama maxlength="12" type="password">
                                  </td>
                                </tr>
                                <tr>
                                    <td class="C-Field"> Kata kunci Baru</td>
                                  <td class="C-Field">
                                    <div align="center">:</div>
                                  </td>
                                  <td class="C-Field">
                                      <input
                                class=boxdefault size=27 name=psw_baru maxlength="12" type="password">
                                  </td>
                                </tr>
                                <tr>
                                    <td class="C-Field"> Ketik Ulang Kata kunci
                                      Baru</td>
                                  <td class="C-Field">
                                    <div align="center">:</div>
                                  </td>
                                  <td class="C-Field">
                                      <input
                                class=boxdefault size=27 name=ketik_psw_baru maxlength="12" type="password">
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
                      <td valign="top">
                          <table width="316" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                            <tr>
                              <td width="34">
                                <div align="center"><b> </b></div>
                              </td>
                              <td width="118">
                                <div align="center"><b> </b></div>
                                <div align="center"><b>
                                  <input class=boxstandard type="submit" value="SIMPAN" name="sim"  onClick="return ubah()">
                                  </b></div>
                              </td>
                              <td width="164">
                                <div align="center"><b>
                                  <input class=boxstandard type="submit" value="KELUAR" name="kel">
                                  </b></div>
                              </td>
                            </tr>
                          </table>
                      </td>
                    </tr>
                  </table>

           </td>
              </tr>
              <tr>
       <td>
<div align="center">
<%
 if (request.getParameter("s")!=null)  status=request.getParameter("s");
%>
<%
if (status.trim().equals("1"))
 {
%>
<center>
<font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
<font color="#D70960" size="4">
Kata Kunci Sudah di Ubah !</font>
</font>
</center>
<%
 }
else if (status.trim().equals("0"))
  {
%>
<center>
<font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
<font color="#D70960" size="4">Kata Kunci Belum di Ubah !</font></font>
</center>
<%
  }
%>
</div>

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
<%
}
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
