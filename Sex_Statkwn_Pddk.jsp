<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
    UserInfo1 record = null;
%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");


if(record != null)
{
    String sysdate = record.getToday();
System.out.println("sysdate di sex_statkwn_pddk.jsp: "+sysdate);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
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
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle">Jenis Kelamin
                          dan Status Perkawinan<br>
                          Penduduk Indonesia</span></div>
                      </td>
                    </tr>
                    <tr>
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
                            <td width="216">
                              <div align="right"> Tanggal</div>
                            </td>
                            <td width="2%">:</td>
                            <td colspan="2" width="200"><b><%=sysdate.trim().toUpperCase()%></b></td>
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
                                  <input class=boxstandard type=button value=TAMPILKAN onClick="dat()" name="button33">
                                  </b></div>
                              </td>
                              <td>
                                <div align="center"><b>
                                  <input class=boxstandard type=button value=KELUAR onClick="javascript:history.back()" name="submit222">
                                  </b></div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10">&nbsp;</td>
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
</BODY>
<SCRIPT language="JavaScript">
function dat()
{
window.open("Sex_Statkwn_Pddk_Tamp.jsp?sysdate=<%=sysdate.trim().toUpperCase()%>",'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</SCRIPT>
</HTML>
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
