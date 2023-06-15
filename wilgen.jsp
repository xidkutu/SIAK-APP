<%@ page import="com.db.connection.*,siaktools.logwriter.*,java.io.*"%>
<%@ page import="manage.CetakPDFP4D"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
/* CetakPDFP4D cetakp4b=null;
cetakp4b = new CetakPDFP4D();
//cetakp4b.cetak();
cetakp4b.banyakpdf("ACEH","LANGSA","KOTA LANSSA","RETIKA","11","74","03","1001");
*/
%>
<HTML><!-- #BeginTemplate "/Templates/SIAK_IIIA.dwt" --><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form method="post" action="wilgen.jsp">
<br>
<br>
<br>
<br>
<%
String prm=request.getParameter("gen");
%>

<div align="center"><b>
     Wilayah Generator
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
   remote.writeWilayah();
  }catch(Exception err)
  {

  }
  }
%>
   <input class=boxstandard type=submit value="Generate" name="gen"> &nbsp;&nbsp;&nbsp;&nbsp;
<input class=boxstandard type=button value="Keluar" name="kel" onclick="document.location='siak_admin.jsp'">
<%
if ((prm!=null) && prm.trim().equals("Generate"))
{
%>
<div align="center">File Generated SuccessFully</div>
<%
}
%>
</b></div>
</form>
</body>
</html>
