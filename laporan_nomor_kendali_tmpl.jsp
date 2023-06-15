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
<script language="javascript">
// document.oncontextmenu=new Function("return false")
function printkktampil(obj)
{
  var tp_val="";
if (window.print)
     {
   if (confirm("Apakah benar KK ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.all['close'].style.visibility='hidden';

   /*       for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
               document.all['divZoom'+i].style.left="405px";
            }
*/
            window.print();
            //alert("PRINT KTP");
            window.opener.location="cetak_KTP_wni_mnl.jsp?update=ok&radiobutton=" + document.all['radiobutton'].value + "&param_kk="+document.all["param_kk"].value + "&no_kel=" + document.all['no_kel'].value + "&selidx=" + document.all['selidx'].value;
             window.close();
       }
  }
 }
function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="120%";
    }
    else
    {
       document.all[id].style.zoom="50%";
    }
}
</script>
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
<body leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor="" text="#000000">
<form name="laporkendalitmpl" method="post" action="">
<table width="100%" border="0" >
<tr><td>
<table width="100%" border="0" cellspacing="5" cellpadding="5">
<tr>
 <td>
      <div align="center">
           <input class=boxstandard type="button" name="Print" value="Print" onclick="printkktampil(this);">
           <input class=boxstandard type="button" name="close" value="Close" onclick="window.close();">
      </div>
   </td>
</tr>
</table>
</td></tr>
<tr><td>&nbsp;

</td></tr>

<tr><td>
<table width="100%" border="0">
  <tr>
    <td>
              <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">LAPORAN
                KENDALI KK</font></div>
            </td>
            <td>Propinsi &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;Sulawesi Selatan</td>
  </tr>
  <tr>
            <td>&nbsp;

            </td>
            <td>Kab/ Kota &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;Makassar</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
            <td>Tanggal Laporan : 27/12/2006</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
            <td>&nbsp;</td>
  </tr>
</table>
</td></tr>
<tr><td>
        <table width="100%" border="1">
          <tr>
            <td rowspan="2">
              <div align="center">Nomor Index</div>
            </td>
            <td rowspan="2">
              <div align="center">Nomor Kendali</div>
            </td>
            <td colspan="2">
              <div align="center">Yang Keluar</div>
            </td>
            <td colspan="2">
              <div align="center">Yang Tidak Terbit</div>
            </td>
            <td colspan="2">
              <div align="center">Sisa</div>
            </td>
          </tr>
          <tr>
            <td>
              <div align="center">NK</div>
            </td>
            <td>
              <div align="center">KK</div>
            </td>
            <td>
              <div align="center">NK</div>
            </td>
            <td>
              <div align="center">KK</div>
            </td>
            <td>
              <div align="center">NK</div>
            </td>
            <td>
              <div align="center">KK</div>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
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