<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%!
    int kk;
    UserInfo1 record;
    Vector  v_kel;
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");

 try
  {
if  (record != null)
        {
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK Online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="Templates/wil.js">
</script>
<SCRIPT language=JavaScript src="Templates/sudawna.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="perpindahan" action="Dis_Per_Wna.jsp" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
String source="";
         if (request.getParameter("source")!=null) source=request.getParameter("source");
%>
  <input type="hidden" name=source value="<%=source%>">
  <input type="hidden" name=start value="Y">
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
         <div align="center"><span class="subtitle">
           Keterangan Perpindahan <%=source%><%if (source.equals("WNA")){%>&nbsp;KITAP<%}%>
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
document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
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
<table width="80%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" >
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
                                Daerah AsaI</span></div>
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
                        <td align="center" height="29">
                          <table border="0" cellspacing="3" cellpadding="2" width="100%">
                            <tr>
                              <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                            </tr>
                            <tr>
                              <td valign="middle" align="center">
                                <div align="center">Nomor Kartu Keluarga<span class="asterish">*</span>:
                                  <input class=boxdefault size=16 name=no_kk maxlength="16">
                                  <b>
                                  <input class=boxstandard type=button value=PERIKSA name="submit242" onclick="return startPost(this.form)">
                                  <input class=boxstandard type=button name="klbtn" onClick="document.location='<%=record.getModRefFile()%>'" value=KELUAR>
                                  </b></div>
                              </td>
                            </tr>
                          </table>
                        </td>
                    </tr>
                    <tr>
                      <td align="center">
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

</table>
</form>
<p class="linkyellow">&nbsp;</p>
</BODY>
</HTML>
<%
source="";
}
else
{
  response.sendRedirect("index.jsp");
}

}catch(Exception err)
{
  System.out.println(err.toString());
  response.sendRedirect("Logout.jsp");
}
%>