<%@ page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,ktp.wni.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,ulang.*"%>
<%@ page import="com.wilayah.*"%>
<%@ include file="Global.jsp"%>
<%
    UserInfo1 record = null;
    String valueStr="";
    String radiobutton="";
    KTPWniObject wniObject=null;
    String stat_print=null;
    Vector vKtp = new Vector();
    Vector vDataKelurahan = new Vector();
    CetakKTP cetakKTP = null;

String spesifik_nik=null,spesifik_nama=null;
String selidx="";

boolean nik_one=false,nama_one=false;
boolean access=true;
boolean finish=false;

ServiceController controller;
long start=0,end=0,tot_rec=0;
long tot_page=0,page_no=0;
String update=null;
String stat_change="";
%>
<%
try
{
   record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
  {
%>
<html>
<head>
<TITLE>adminduk SIAK online</TITLE>
<LINK href="Templates/s.css" rel=stylesheet>
<script language="javascript" src="scripts/chromeless_35.js">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<SCRIPT language="javascript">
function viewKKKendali()
{
 window.open("laporan_nomor_kendali_tmpl.jsp", '','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no' );
}
</SCRIPT>
<%
//System.out.println(444);
if (request.getParameter("radiobutton")!=null)
radiobutton = request.getParameter("radiobutton");

selidx=(request.getParameter("selidx")==null?"0":request.getParameter("selidx"));
no_prop= request.getParameter("no_prop");
no_kab= request.getParameter("no_kab");
no_kec= request.getParameter("no_kec");
no_kel= request.getParameter("no_kel");
update = request.getParameter("update");

try{
if (request.getParameter("page_no")!=null) page_no=Long.parseLong(request.getParameter("page_no"));
}catch(Exception e1){}
%>
<body leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="laporkendali" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<jsp:include page="top.html"/>
</td></tr>
<tr><td>&nbsp;

</td></tr>
<tr><td>
<% String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
%>
                          <jsp:include page="<%=jsp%>"/>
</td></tr>
<tr><td>
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3"><b><font size="4">Laporan
          Nomor Kendali</font></b></font></div>
</td></tr>
<tr><td>&nbsp;

</td></tr>
<tr><td>
<div align="center"><input type="submit" name="submit" value="Tampilkan" onClick="viewKKKendali()">
</div>
</td></tr>
</table>
</form>
</body>
</html>
<%
}
else
{
response.sendRedirect("index.jsp");
}
   }
catch(Exception e){
e.printStackTrace();
}
finally{
//System.out.println(1016);
start=0;
end=0;
}
%>