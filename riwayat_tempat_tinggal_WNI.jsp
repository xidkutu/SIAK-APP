<%@ page import="pendaftaran.*"%>
<%@ include file="Global.jsp"%>
<%!
    UserInfo1 record = null;
%>
<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript>
/*
function showListing()
{
//document.location="riwayat_tempat_tinggal_WNI_listing.jsp?nik="+argNik;
if(document.all['nik'].value=="")
{
alert("Nik belum diisi!");
return false;
}
window.open("riwayat_tempat_tinggal_WNI_listing.jsp?nik="+document.all['nik'].value,'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
*/
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="riwayatwni" method="post" action="riwayat_tempat_tinggal_WNI_listing.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td background="images/v_bg_header.gif">
  <input type="hidden" name="sc" value='<%=request.getParameter("sc")%>'>
  <jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td valign="top" width="65"><img src="images/dot.gif" width="65" height="1"></td>
                <td valign="top" height="155">
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle">Riwayat Tempat
                          Tinggal Penduduk</span></div>
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
                      <td height="10"><img src="images/dot.gif" width="1" height="10">
                        <table width="290" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="C-BG">
                              <table border="0" cellspacing="1" cellpadding="3" align="center" width="100%">
                                <tr>
                                  <td class="C-Field" colspan="3">
                                    <div align="center"><b>Diisi Berdasarkan</b>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field" width="35%">
                                    <div align="right">NIK<span class="asterish"></span></div>
                                  </td>
                                  <td class="C-Field" width="4%">
                                    <div align="center">:</div>
                                  </td>
                                  <td class="C-Field" width="61%">
                                    <input type="text" name="nik" size="17" class="boxdefault" maxlength="17">
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
                    <tr valign="bottom">
                      <td height="45" valign="top">
                        <div align="center"></div>
                        <div align="center"><b> </b>
                          <table width="100" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                              <td>
                                <div align="center"><b>
                                  <input class=boxstandard type=submit value=TAMPILKAN name="tampilkan">

                                  <!--onclick="showListing()"-->
                                  </b></div>
                              </td>
                              <td>
                                <div align="center"><b>
                                  </b></div>
                              </td>
                              <td>
                                <div align="center"><b>
                                  <input class=boxstandard type=button value=KELUAR name="keluar" onClick="document.location='<%=record.getModRefFile()%>'">
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
                         <%
                                if (request.getParameter("error")!=null)
                                  {
                                    if (request.getParameter("error").trim().equals("1"))
                                       {
                                %>
                                     <%="<div align='center'>" +  printError("Individu belum pernah pindah !") + "</div>"%>
                               <%
                                       }
                                  }
                                %>
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
<%}
else
{
     response.sendRedirect(record.getModRefFile());
}
   }
   catch(Exception e){
     e.printStackTrace();
     response.sendRedirect(record.getModRefFile());
     }
%>
