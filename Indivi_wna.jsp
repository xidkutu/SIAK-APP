<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*" %>
<%@ include file="Global.jsp"%>

<%!
    UserInfo1 record=null;
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
<SCRIPT language=JavaScript src="Templates/keymapper.js">
</SCRIPT>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onhelp="doKeyDown(event);"; onKeyDown="callKeyDown()" onload="window.history.forward(1)">
<SCRIPT language="JavaScript">
var firedBefore=false;
</SCRIPT>
<form name="bioind" method=post action="IndVali_wna.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  </table>
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">Pendaftaran
                                Biodata WNA</span><br>
                                <br>
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
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
                                                      return true;
                                                   }
                                                   function resetKec(obj) {
                                                      document.all['no_kec'].value=obj.value;pilih_kel_with_textbox(document.all['no_prop'].value,document.all['no_kab'].value, document.all['no_kec'].value, document.all['no_kel'], document.all['nama_kel']);
                                                      return true;
                                                   }
                                                </SCRIPT>
<% String jsp = "data_wilayah.jsp?level=4&sublevel=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
%>

                                              <td>
                          <jsp:include page="<%=jsp%>"/>
                                             </td>
                    </tr>
                    <tr>
                      <td valign="top">

        <table width="600" border="0" cellspacing="3" cellpadding="2" align="center">
          <tr>
            <td colspan="4" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td colspan="4" height="25">
              <div align="center"><span class="subtitle">Data Keluarga</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                </font><font class="linkyellow">(Family data)</font></div>
            </td>
          </tr>
          <tr>
            <td colspan="4" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td valign="top"> Nomor Kartu Keluarga<br>
              <span class="linkyellow">(Family Card Number)</span> </td>
            <td valign="top">:</td>
            <td valign="top">
              <div align="center">
                <input  class=boxdefault size=17 name=no_kk maxlength="17">
              </div>
            </td>
            <td valign="top"><b>
              <input class=boxstandard type=submit value=PERIKSA name="button22"  onClick= "return edi()">
              &nbsp;&nbsp;&nbsp
              <input class=boxstandard type=button value=KELUAR   onClick= "document.location='WNA_Menu.jsp'">
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
<script language="javascript">
pilih_kec_with_textbox(bioind.no_prop.value, bioind.no_kab.value, bioind.no_kec, bioind.nama_kec, bioind.no_kel, bioind.nama_kel);
</script>
</form>
</body>
<SCRIPT language=JavaScript>
function edi()
{
if(isNaN(bioind.no_kk.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		bioind.no_kk.value="";
		bioind.no_kk.focus();
		return false;
}
for(var i=0; i < bioind.no_kk.value.length; i++)
{
         if(bioind.no_kk.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 bioind.no_kk.value="";
                 bioind.no_kk.focus();
	         return false;
               }
}
if(bioind.no_kk.value=="")
{
                alert("Nomor Kartu Keluarga Belum Diisi!!" )
		bioind.no_kk.value="";
		bioind.no_kk.focus();
		return false;
}
if(bioind.nama_kec.selectedIndex==0)
{
alert("Kode Kecamatan Belum Diisi !!");
bioind.nama_kec.focus();
return false;
}
if(bioind.nama_kel.selectedIndex==0)
{
alert("Kode Kelurahan Belum Diisi !!");
bioind.nama_kel.focus();
return false;
}
}
</SCRIPT>
</html>
<%}
else
{
  response.sendRedirect("index.jsp");
}
     }
     catch(Exception ee)
     {
        System.out.println("Error "+ee);
ee.printStackTrace();
     }
%>