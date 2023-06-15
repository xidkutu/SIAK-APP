<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*" session="true"%>

<%!
    String no_kel,nama_kel,select,id1=null;
    UserInfo1 record = null;
    Vector v = null;
    Login remote;
%>

<%
   try
   {
     v = new Vector();
     record = (UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/ajlib.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/ajmenu.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/js_gsr_Capil_kec.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" link="#DEECFC" vlink="#DEECFC" alink="#DEECFC" onload="window.history.forward(1)">
<form name="form1" method="post" action="Logout.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="topcapil.html"/></td>
  </tr>
  <tr>
    <td valign="top">
      <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td height="-1">&nbsp; </td>
              </tr>
              <tr>
<td>
<div align="center">
<table width="450" border="0" cellspacing="3" cellpadding="2" align="center">
                                        <tr>
                                          <td width="209">Kode-Nama Propinsi</td>
                                          <td width="10">:</td>
                                          <td width="24">
                                            <input
                                class=boxdefault size=2 name=no_prop value="<%=record.getNoProp().trim()%>" onFocus="this.blur()"  maxlength="2">
                                          </td>
                                          <td width="182">
                                            <input
                                class=boxdefault size=22 name=nama_prop value="<%=record.getNamaProp().trim()%>" maxlength="60" onFocus="this.blur()">
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="209">Kode-Nama Kabupaten/Kota</td>
                                          <td width="10">:</td>
                                          <td width="24">
                                            <input
                                class=boxdefault size=2 name=no_kab value="<%=record.getNoKab().trim()%>" onFocus="this.blur()" maxlength="2">
                                          </td>
                                          <td width="182">
                                            <input
                                class=boxdefault size=22 name=nama_kab value="<%=record.getNamaKab().trim()%>" onFocus="this.blur()" maxlength="60">
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="209">Kode-Nama Kecamatan</td>
                                          <td width="10">:</td>
                                          <td width="24">
                                            <input
                                class=boxdefault size=2 name=no_kec value="<%=record.getNoKec().trim()%>" onFocus="this.blur()" maxlength="2">
                                          </td>
                                          <td width="182">
                                            <input
                                class=boxdefault size=22 name=nama_kec value="<%=record.getNamaKec().trim()%>" onFocus="this.blur()" maxlength="60">
                                          </td>
                                        </tr>
                                      </table>
                                    </div>
           </td>
              </tr>
              <tr>
                <td valign="top">
                  <table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="9" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="25">
                          <div align="center"><span class="subtitle">Menu Pencatatan
                            Sipil Kecamatan</span></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="1"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="238">
            <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" height="25">
              <tr>
                <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100%">
                    <tr>
                      <td>
                        <table width="100" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC" height="50">
                          <tr>
                            <td width="5" height="5"><img src="images/v_sdt_kr_up2.gif" width="5" height="5"></td>
                            <td height="1" width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_up2.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td colspan="3">
                              <table width="90" border="0" cellspacing="0" cellpadding="0">
                                <tr valign="middle">
                                  <td width="15">
                                    <div align="center"><img src="images/dot.gif" width="15" height="8"></div>
                                    </td>
                                  <td height="25">
                                    <div align="center"><b></b></div>
                                    <div align="center">
                                      <script language="javascript">
	createMenu();
	</script>
                                      <script language="javaScript">
	displayMenu();
	</script>
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td height="5" width="5"><img src="images/v_sdt_kr_btm2.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="100%" height="1" hspace="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_btm2.gif" width="5" height="5"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="35" valign="bottom">
            <div align="center"><b>
                         <input class=boxstandard type="submit" value="LOGOUT" name="button">
              </b> </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp; </td>
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
   catch(Exception e){}
%>