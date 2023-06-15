<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*"%>
<%@include file="Global.jsp"%>
<html>
<head>
<title>Siak</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>

<body bgcolor="#93BEE2" text="#93BEE" onload="window.history.forward(1)">
<%
String errorStr = request.getParameter("noaktakwn");
%>
<form name="form1" method="post" action="KelahiranInput.jsp">
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
              <div align="center"><span class="subtitle"><% if(errorStr!=null){out.print("Pencatatan Perkawinan");}else{%>Pencatatan Kelahiran<%}%></span></div>
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
          <h4>&nbsp;</h4>
          <h4><b><font color=red><%if(errorStr!=null){ printError("Nomor Akta Kawin "+errorStr+"!");}else{ printError("Data sudah ada!");}%></font></b></h4>
          <h4><b>
            <input class=boxstandard type="button" value="KELUAR" name="kel1" onclick="document.location='Menu_Capil_Lahir_Mati_Kecamatan.jsp'">
            </b></h4>
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

</form>
</body>
</html>
