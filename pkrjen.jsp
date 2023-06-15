<%@ page import="com.db.connection.*,siaktools.logwriter.*,java.io.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><!-- #BeginTemplate "/Templates/SIAK_IIIA.dwt" --><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form method="post" action="pkrjen.jsp">
<br>
<br>
<br>
<br>
<%
String prm=request.getParameter("gen");
%>

<div align="center"><b>
     Pekerjan Generator
<br>

<br>
<br>
<%
if ((prm!=null) && prm.trim().equals("Generate"))
  {
try{
   ServiceController factory=null;
   XmlReader remote;
   XmlReaderHome home;
   factory=ServiceController.getInstance();
   home=(XmlReaderHome)factory.lookup("XmlReader",XmlReaderHome.class);
   remote=home.create();
   remote.writePkrjn();
  }catch(Exception err)
  {
         prm="Failed";
        err.printStackTrace();
  }
  }
%>
   <input class=boxstandard type=submit value="Generate" name="gen">
&nbsp;&nbsp;&nbsp;&nbsp;
<input class=boxstandard type=button value="Keluar" name="kel" onclick="document.location='siak_admin.jsp'">
<%
if ((prm!=null) && prm.trim().equals("Generate"))
{
%>
<div align="center">File Generated SuccessFully</div>
<%
}
else if ((prm!=null) && prm.trim().equals("Failed"))
{
%>
<div align="center">Failed</div>
<%
}
%>
</b></div>
</form>
</body>
</html>
