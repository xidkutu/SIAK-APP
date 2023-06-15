<%@ page language="java" import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,pendaftaran.*"%>
<%
   try
   {
if (session.getAttribute("remoteRef")!=null)
{

%>
<html>
<head>
<title>Siak</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>

<body bgcolor="#93BEE2" text="#93BEE" onload="window.history.forward(1)">

<form name="form1" method="post" action="Logout.jsp">
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
              <div align="center"><span class="subtitle">Pendaftaran Pengguna/User</span></div>
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
          <h4><b><font color=red>In-correct Data Error..Contact SiakAdmin !.</font></b></h4>
          <h4><b>
            <input class=boxstandard type="submit" value="KELUAR" name="kel1">
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
<% }
   else
   {
//Mark1
      response.sendRedirect("index.jsp");
  }
   }
   catch(Exception e){}
%>
