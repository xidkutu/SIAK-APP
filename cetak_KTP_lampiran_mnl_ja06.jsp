<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,view.ktp.wni.*,ktp.wni.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>

<%!
private String getStatus(String stat_print)
{
String rtn="";
if (stat_print!=null)
 {
     if (stat_print.trim().equals("1"))
      {
          rtn="Baru";
      }
   else if (stat_print.trim().equals("2"))
    {
           rtn="Penggantian";
    }
   else if (stat_print.trim().equals("3"))
    {
           rtn="Perpanjangan";
    }
 }
return rtn;
}
%>

<%
 UserInfo1 record = null;
 Vector vt_ktp;

     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
 {
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<% String statusCetak = request.getParameter("radiobutton");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equals("2"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=cetak_KTP_Lampiran.jsp";
              } else {
                self.close();
              }
         </script>
   <%
   } else {
   %>
--%>
<% {
  %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>
<script language="javascript">
// document.oncontextmenu=new Function("return false")
function printKTP(obj)
{
  var tp_val="";
if (window.print)
     {
   if (confirm("Apakah benar KTP ini akan dicetak ?"))
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
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       String a_n = request.getParameter("a_n");
       String stat_pndtng=request.getParameter("stat_pndtng");
       String  no_kel=request.getParameter("no_kel");
       String selidx=request.getParameter("selidx");
       System.out.println("nama_pej= "+nama_pej);
       System.out.println("nip_pej= "+nip_pej);
       System.out.println("a_n= "+a_n);

       String kewarganegaraan = request.getParameter("kewarganegaraan");
       System.out.println("kewarganegaraan= "+kewarganegaraan);

       String radiobutton = request.getParameter("radiobutton");
       radiobutton=getStatus(radiobutton);

      String cb = request.getParameter("cb");
      System.out.println("cb di cetak ktp lampiran= "+cb.trim());
      String param_kk = "";

      StringTokenizer st1 = new StringTokenizer(cb, "^");
      String token = "";
      Vector vNik = new Vector();

      String nik = "";
      KTPWniObject ktpObj = null;

      while (st1.hasMoreTokens())
      {
         nik = st1.nextToken();
	 ktpObj = new KTPWniObject(nik,"");
         vNik.addElement(ktpObj);
         param_kk = param_kk +"|" +nik;
      }

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
      String nama_kec = request.getParameter("nama_kec");
      String nama_kel = request.getParameter("nama_kel");
%>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="window.history.forward(1)">
<input type="hidden" name="param_kk" value="<%=param_kk%>">
<input type="hidden" name="radiobutton" value="<%=radiobutton%>">
<input type="hidden" name="no_kel" value="<%=no_kel%>">
<input type="hidden" name="selidx" value="<%=selidx%>">
<%
int totalPage = vNik.size();
System.out.println("totalPage" + totalPage);
%>
<table width="100%" border="0" cellspacing="5" cellpadding="5">
<tr>
 <td>
      <div align="center">
           <input class=boxstandard type="button" name="Print" value="Print" onclick="printKTP(this);">
           <input class=boxstandard type="button" name="close" value="Close" onclick="window.close();">
           <input type="hidden" name="totalpage" value=<%=totalPage%>>
      </div>
   </td>
</tr>
</table>
<%
 ViewCetakKTP view = null;
try
{
          ServiceController statefulController = ServiceController.getInstance();
          ViewCetakKTPHome home = (ViewCetakKTPHome)statefulController.lookup("ViewCetakKTP", ViewCetakKTPHome.class);
          view = home.create();
          Vector vData=view.retrieveData(vNik, nama_prop,nama_kab, nama_kec, nama_kel, kewarganegaraan);
vt_ktp=new Vector();
for (int i =0;i<vData.size();i++)
{
%>
<!--<div id="divZoom<%=i%>" style="position:absolute;width:200px; height:115px; z-index:1;<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%>" onClick="zoom(this.id)">-->
<table  width="305" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
      <td><img src="images/dot.gif" width="5" height="8"></td>
      <td>
        <table border=0 cellpadding=0 cellspacing=0 align="center" width=100%>
          <tr>
            <td colspan=6 class="fonts_KTP_judul" align="center"> PROVINSI <%=nama_prop.toUpperCase()%></td>
          </tr>
          <tr>
            <td colspan=6 class="fonts_KTP_judul" align="center"> <font size="1" class="fonts_KTP_judul"><%=getKabupaten(nama_kab.toUpperCase()).toUpperCase()%></font></td>
          </tr>
          <tr>
            <td class="fonts_KTP" colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td class="fonts_KTP" colspan="6">
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td class="fonts_KTP_sub" colspan="2" valign="top" >NIK</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNik().trim()%></td>
                  <td class="fonts_KTP" rowspan="9" valign="top" width="55">
                    <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
                      <tr>
                        <td align="right" width="53" height="75" class="fonts_KTP">PHOTO</td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2" valign="top"   >Nama</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNama_lgkp()%></td>
                </tr>
                <tr>

                  <td class="fonts_KTP_sub" colspan="2" valign="top"   >Tempat/Tgl
                    Lahir</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getTmpt_lhr()+", "+((KTPWniObject)vData.elementAt(i)).getTgl_lhr()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2" valign="top" height="6"   >Jenis
                    Kelamin</td>
                  <td class="fonts_KTP" colspan="2" height="6">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getJenis_klmin()%></td>
                  <td class="fonts_KTP" height="6" width="98">Golongan Darah :&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getGol_drh()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2" valign="top"   >Alamat</td>
                  <td class="fonts_KTP" colspan="3">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="fonts_KTP">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getAlamat()%></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="fonts_KTP" width="17"><b></b></td>
                  <td class="fonts_KTP_sub" width="45">RT/RW</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNo_rt().trim()%>&nbsp;/&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNo_rw()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP" width="17"><b></b></td>
                  <td class="fonts_KTP_sub" width="45">Desa/Kel</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=nama_kel.toUpperCase()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP" width="17"><b></b></td>
                  <td class="fonts_KTP_sub" width="45">Kecamatan</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=nama_kec.toUpperCase()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP" width="17"><b></b></td>
                  <td class="fonts_KTP_sub" width="45">Kab/Kota</td>
                  <td class="fonts_KTP" colspan="3">:&nbsp;<%=nama_kab.toUpperCase()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2"   >Agama</td>
                  <td class="fonts_KTP" colspan="2">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getAgama()%></td>
                  <td class="fonts_KTP" colspan="2">Status Perkawinan: &nbsp;<%=((KTPWniObject)vData.elementAt(i)).getStat_kwn()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2">Pekerjaan</td>
                  <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getJenis_pkrjn()%></td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2">Berlaku Hingga</td>
                  <td class="fonts_KTP" width="86">:&nbsp;

<%=((KTPWniObject)vData.elementAt(i)).getTgl_berlaku()%>

</td>
                  <td class="fonts_KTP" colspan="3">
                    <div align="center"><%=nama_kab+" ,"+((KTPWniObject)vData.elementAt(i)).getSystgl()%></div>
                  </td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="2">&nbsp;</td>
                  <td class="fonts_KTP" width="86">&nbsp;</td>
                  <td class="fonts_KTP" colspan="3">
                    <div align="center"><%="a.n "+stat_pndtng%></div>
                  </td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="3" height="30">
                    <div align="center">
                      <p>&nbsp;</p>
                    </div>
                  </td>
                  <td class="fonts_KTP" colspan="3" rowspan="2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="fonts_KTP_sub" height="30" valign="top">
                          <div align="center">
                            <p><%=a_n%></p>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div align="center"><u><span class="fonts_KTP"><%=nama_pej%></span></u></div>
                          <div align="center" class="font_TAB"><span class="fonts_KTP">NIP.
                            &nbsp<%=nip_pej%></span></div>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="fonts_KTP_sub" colspan="3">
                    <div align="left"><u><span class="fonts_KTP">_________________________________</span></u></div>
                    <div align="left" class="font_TAB"><span class="fonts_KTP">Tanda
                      Tangan/Sidik Jari Pemegang KTP</span></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td><img src="images/dot.gif" width="5" height="8"></td>
    </tr>
  </table>
<!--</div>-->
<br>
<%
  vt_ktp.addElement(new InfoKTP(((KTPWniObject)vData.elementAt(i)).getNik(),((KTPWniObject)vData.elementAt(i)).getTgl_berlaku()));
}
    session.setAttribute("ktpInfo",vt_ktp);
%>
<%
}
catch(Exception e)
{
    e.printStackTrace();
    System.out.println("JSP ERROR CETAK_KTP_LAMPIRAN: "+e.getMessage());
}
finally
{
   view.remove();
}
%>
<p class="fonts_KTP_sub">&nbsp;</p>
</body>
</html>
<%
   }
}
else
{
response.sendRedirect("index.jsp");
}
%>