<%@ page language="java" import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,pendaftaran.*"%>
<%@include file="Global.jsp"%>
<%!
   String noaktacri,nama_suami,nama_istri;
   int i,j,k,l,z;
%>

<%
   try
   {
if (session.getAttribute("remoteRef")!=null)
{
  noaktacri=request.getParameter("noaktacri");
    nama_suami = request.getParameter("nama_suami");
   nama_istri = request.getParameter("nama_istri");

     j=3;
     k=j/4;
l=0;
i=0;
z=1;

%>
<html>
<head>
<title>Siak</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>

<body bgcolor="#93BEE2" text="#93BEE" onload="window.history.forward(1)">

<%
      if(noaktacri != null)
      {
%>
<form name="form1" method="post" action="PerceraianInput.jsp">
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr> </tr>
    <tr>
      <td>
        <table border="0" cellspacing="3" cellpadding="2" align="center">
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
           <td colspan="3" height="25">

              <div align="center"><span class="subtitle">Pencatatan Perceraian</span></div>
                            </td>
          </tr>
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td colspan="3" height="10">
              <table border="0" cellspacing="3" cellpadding="0" align="center" width="100%">
                <tr>
                  <td width="193" valign="top">
                    <div align="right"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"></font></b></font></div>
                  </td>
                  <td width="14" valign="top">
                    <div align="center"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"></font></b></font></div>
                  </td>
                  <td colspan="2" valign="top" width="242">
                    <div align="left"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"></font></b></font></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td height="35" valign="bottom">
        <div align="center">
          <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
            <tr>
              <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
              <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
              <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td class="C-BG">
                <table border="0" cellspacing="1" cellpadding="3" align="center">
                  <tr>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">
                        No.</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">No Akta Cerai</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Nama
                        Suami</font></div>
                    </td>
<td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Nama
                        Istri</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Tanggal Entri</font></div>
                    </td>
                   </tr>
                  <tr>
<script language="JavaScript">
tgl_entri = new Date()

</script>
<%
if(i<j)
{
%>
                    <td class="C-Field">
                      <div align="center">
                        <p><%=z%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center">
                        <p><%=noaktacri%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center"><%=nama_suami.toUpperCase()%> </div>
                    </td>
<td class="C-Field">
                      <div align="center"><%=nama_istri.toUpperCase()%> </div>
                    </td>
                    <td align="center" class="C-Field"><script language="JavaScript">document.write(""+tgl_entri.getDate()+"-"+(tgl_entri.getMonth()+1)+"-"+tgl_entri.getYear())</script> </td>

                  </tr>
<%
}
%>
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
<%
    }

%>
          <b> </b></div>
      </td>
    </tr>
    <tr>
      <td height="35" valign="bottom">
        <div align="center"><b>
<h4><%=printInfo("Data Sudah disimpan !")%></h4>
          <input class=boxstandard type="button" value="KELUAR" name="kel1" onclick="document.location='Menu_Capil_KabKota.jsp'">
          </b></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

</form>
</body>
</html>
<% }
   else
   {
      response.sendRedirect("index.jsp");
  }
}
catch (Exception ne)
{
ne.printStackTrace();
}
%>
