<%@ page import="pendaftaran.*"%>
<%!
UserInfo1 record = null;
%>
<%

record=(UserInfo1)session.getAttribute("remoteRef");
  if (record!=null)
  {
%>
<html>
<head>
<title>adminduk SIAK online</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="Templates/s.css" rel=stylesheet>
</head>
<script language="javascript">
function setDates()
{
var dt="";
if (!isNaN(document.all['dd'].value)
   &&
   !isNaN(document.all['mm'].value)
   &&
   !isNaN(document.all['yy'].value)
)
{
dt=(document.all['dd'].value+"-"+document.all['mm'].value+"-"+document.all['yy'].value);
}
parent.bottom.document.location="estimasi_nik_ganda_WNI_namalgkp.jsp&date=''"
}
</script>
<body bgcolor="#FFFFFF" text="#000000">
<table align="center">
  <tr align="center">
    <td align="center" >
      <div align="center"><b>
        <input class=boxstandard type=button  name="Cet" value="CETAK" onClick="printNikGanda(this)">
        </b></div>
    </td>
    <td>
      <div align="center"><b>
        <input class=boxstandard type=button value=KELUAR onClick="document.location='estimasi_nik_ganda_WNI.jsp'" name="KEL">
        </b></div>
    </td>
  </tr>
</table>
<table width="500" border="0" cellspacing="3" cellpadding="2" align="center" height="135">
  <tr>
    <td colspan="4" height="1">
      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    </td>
  </tr>
  <tr>
    <td colspan="4" height="25">
      <div align="center" class="judul_utama">DAFTAR ESTIMASI NIK GANDA (WNI)</div>
    </td>
  </tr>
  <tr>
    <td colspan="4" height="1">
      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    </td>
  </tr>
  <tr>
    <td  colspan="4">
      <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
        <tr>
          <td width="52%">
            <div align="right">Edisi Tanggal</div>
          </td>
          <td width="2%">:</td>
          <td width="46%">
            <input class=boxdefault size=2 name=dd maxlength="2"  value="<%=record.getToday().substring(0,2)%>">
            /
            <input class=boxdefault size=2 name=mm maxlength="2"  value="<%=record.getToday().substring(3,5)%>">
            /
            <input class=boxdefault size=4 name=yy maxlength="4"  value="<%=record.getToday().substring(6)%>">
          </td>
        </tr>
        <tr>
          <td colspan="3">
            <div align="center"><br>
          <input type="hidden" name="date" value="">
              <input class=boxstandard  type=button value=TAMPILKAN  onclick="setDates()">
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
<%
  }
else
{
 response.sendRedirect("index.jsp");
}
%>