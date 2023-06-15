<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan"%>
<%@ include file="Global.jsp"%>
<%!
    String select,flag="";
    UserInfo1 record = null;
String no_kk="";

%>

<%
 if (request.getParameter("no_kk")!=null)  no_kk=request.getParameter("no_kk");

  try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");
%>

<%
if(record != null)
{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Pendaftaran_Biodata_WNI1_Entity.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif">
        <input type="hidden" name="namakel" value="">
		<jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
	<tr>
	  <td valign="top">
	    <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
	      <tr>
		<td>
		  <table width="100%" border="0" cellspacing="3" cellpadding="3">
		    <tr>
		      <td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="35">
			      <div align="center"><span class="submenu">Pendaftaran
				Biodata WNI</span><br>
				<br>
			      </div>
			    </td>
			  </tr>
			</table>
		      </td>
		    </tr>
		    <tr>
                                                <input type=hidden name='prop' value="<%=record.getNoProp().trim()%>">
                                                <input type=hidden name='kab' value="<%=record.getNoKab().trim()%>">
						<input type=hidden name='kec' value="<%=record.getNoKec().trim()%>">

                                                <SCRIPT language="javascript">
                                                   function resetPage(obj) {
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
                                                      return true;
                                                   }
                                                </SCRIPT>
                                             <td>
<% String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
%>
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
			      <div align="center"><span class="subtitle">Data
				Keluarga</span></div>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="4" height="1">
			      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
			    </td>
			  </tr>
			  <tr>
			    <td valign="top"><span class="asterish"> *</span> Nomor Kartu Keluarga</td>
			    <td valign="top">:</td>
			    <td valign="top"><i>
			    <input class=boxdefault size=16 name="no_kk" maxlength="16" onKeyUp="return num(form1.no_kk)">&nbsp;&nbsp;&nbsp;&nbsp;
			      <b>
  <input class=boxstandard type=submit name="button_perk" value=PERIKSA name="kk" onClick="return KKValidate(document.all['no_kk'])">
&nbsp;&nbsp;<input class=boxstandard type="button" value=KELUAR name="bat" onclick="document.location='WNI_Menu.jsp'">
			      </b></i></td>
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
   //String errors[]={"Nomor Kartu Keluarga belum ada !"};

 if (request.getParameter("flag")!=null)  flag=request.getParameter("flag");
      if (flag.trim().equals("0"))
                                  {
                                   %>
                               <%=printError("Nomor Kartu Keluarga " + no_kk + " belum ada")%>
                            <%
                                  }
                             %>
                          </div>
                </td>
                  </tr>
		<table width="350" border="0" cellspacing="0" cellpadding="0">
		    <tr>
		      <td class="catatan" colspan="2"><font color="#000066">Keterangan
			:</font><span class="asterish"> *</span><span class="catatan"><font color="#000066">Data
			harus diisi</font></span></td>
		    </tr>
		  </table>
		</td>
	      </tr>
	    </table>
	</tr>
      </table>
    </td>
  </tr>
</table>
</form>
</BODY></HTML>
<%
flag="";
}
else
{
   response.sendRedirect("index.jsp");
}
 }
catch(Exception e){
e.printStackTrace();
}
%>

