<%@page import="com.db.connection.ServiceController,kepemilikan.aktalahirdanktp.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript>
function openListForm()
{
      window.open("daftar_akta_lahir_ktp.jsp?sysdate="+document.all["sysdate"].value,'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form method="post" name="openingform" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
<td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <p>&nbsp;</p>
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle">Kepemilikan
                          Akta Kelahiran dan KTP<br>
                          Penduduk Indonesia</span></div>
                      </td></tr><tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr>
                      <td>
                        <table width="442" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
<%
AktaLahirDanKTP aktaLahirDanKTPObj = null;
String sysdate = "";
try {
      UserInfo1 record = (UserInfo1)session.getAttribute("remoteRef");
      if(record != null) {
         sysdate = record.getToday();
      }
} catch (Exception ex) {
  ex.printStackTrace();
}
%>
                            <td width="216">
                              <div align="right"> Tanggal</div>
                            </td>
                            <td width="2%">:</td>
                            <td colspan="2" width="200"><%=sysdate%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr valign="bottom">
                      <td height="45" valign="top">
                        <div align="center"></div>
                        <div align="center"><b> </b>
                          <table width="100" border="0" cellspacing="2" cellpadding="3">
                            <tr>
                              <td>
                                <div align="center"><b>
                                  <input class=boxstandard type=button value=TAMPILKAN name="tampilkan" onclick="openListForm()">
                                  </b></div>
                              </td>
                              <td>
                                <div align="center"><b>
                                  <input class=boxstandard type=button value=KELUAR name="exit" onclick="javascript:history.back()">
                                  </b></div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><input type="hidden" name="sysdate" value="<%=sysdate%>">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">&nbsp; </td>
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

