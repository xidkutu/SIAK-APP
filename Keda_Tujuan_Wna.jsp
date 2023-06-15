<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@ page import="java.util.*,pendaftaran.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
    UserInfo1 record=null;
    Vector v_kel;
    String source="";
%>

<%
 try
 {
   record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
        {
  if (request.getParameter("source")!=null)  source=request.getParameter("source");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/keymapper.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/lurah.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/sudawna.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/wil.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)" >
<form  method="post" name="kedatangan">
<input type="hidden" name="source" value="<%=source%>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
<div align="center"><span class="subtitle">Keterangan Kedatangan <%=source%>
</span><br>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
<input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
<SCRIPT language="javascript">
function resetPage(obj) {
document.all['no_kel'].value=obj.value;
document.all['nama_kel'].options[document.all['nama_kel'].selectedIndex].value=obj.options[obj.selectedIndex].text;
return true;
}
</SCRIPT>
<td>
<% String jsp = "";
   if (source.equals("WNI")) {
     jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
   } else if (source.equals("WNA")) {
     jsp = "data_wilayah.jsp?level=4&sublevel=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
%>
                                                   <script language="javascript">
                                                   function resetKec(obj) {
                                                      document.all['no_kec'].value=obj.value;
                                                      pilih_kel_with_textbox(document.all['no_prop'].value,document.all['no_kab'].value, document.all['no_kec'].value, document.all['no_kel'], document.all['nama_kel']);
                                                      return true;
                                                   }
                                                </script>
<%
}
%>
                          <jsp:include page="<%=jsp%>"/>
                                             </td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
              </tr>
            </table>
            <table width="752" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
              <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                    <tr>
                      <td valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" valign="middle">
                              <div align="center"><span class="subtitle">Data
                                Daerah Tujuan</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
 <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
<tr>
<td colspan="15"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"></font></td>
</tr>
<tr>
<td valign="top" width="200">&nbsp;</td>
<td valign="top" nowrap> Nomor Kartu Keluarga Asal<span class="asterish">*</span>:</td>
<td valign="top" colspan="13" width="513">
<input   class=boxdefault size=17 name="no_kk_asal" maxlength="16" onKeyUp="KKValidate(this)">
<b>
<input  class=boxstandard type=button  value=PERIKSA  name="btnperiksa" onclick="return startTujuan(this.form,no_kk_asal,nama_kel)">
<input class=boxstandard type=button value=KELUAR  name="btnkel" onClick="document.location='<%=record.getModRefFile()%>'">
</b></td>
</tr>
</table>

        <%if (request.getParameter("error")!=null)
         {
	 %>
        <%=printError(errMsg(request.getParameter("error"),request.getParameter("no_kk")))%>
        <%
	 }
	%>
</td>
</tr>
</table>
                </td>
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
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<p class="linkyellow">&nbsp;</p>
</BODY>
</HTML>
<%
}
else
{
  response.sendRedirect("index.jsp");
}
     }
     catch(Exception ee)
     {
        System.out.println("Error in Perpindah Wna"+ee.toString());
        ee.printStackTrace();
     }
%>
