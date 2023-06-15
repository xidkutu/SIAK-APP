<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%
 if  (session.getAttribute("remoteRef")!=null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="uploadForm" action="upload1.jsp" enctype="multipart/form-data" method="post">
  <input type="textbox" name="textbox"/>
  <input type="file" name="file"/>
  <input TYPE=submit name='Upload' Value='Upload'>
</form>
</BODY></HTML>
<%
}
else
 {
%>
<jsp:forward page="index.jsp">
</jsp:forward>
<%
 }
%>
