<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@page import="com.db.connection.ServiceController,kartukeluarga.*,java.util.*,view.ktp.wni.*,ktp.wni.*"%>
<%@page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
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
    Vector vt_ktp=null;

     record=(UserInfo1)session.getAttribute("remoteRef");

if (record != null)
{
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<% String statusCetak = request.getParameter("radiobutton");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equalsIgnoreCase("Penggantian"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=cetak_KTP_Lampiran_WNA.jsp";
              } else {
                self.close();
              }

         </script>
   <%
   } else {

   %>
--%>
<%
{
%>
<html>
<head>
<title>KTP WNA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>
<script language="javascript">
// document.oncontextmenu=new Function("return false")
function printKTP(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar KTP ini akan dicetak ?"))
          {
                panel.removeNode(true);

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
             window.print();
          window.opener.location="cetak_KTP_WNA_PVC.jsp?update=ok&radiobutton=" + document.all['radiobutton'].value + "&param_kk="+document.all["param_kk"].value
             window.close();
 }   } }

function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="100%";
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
       System.out.println("nama_pej= "+nama_pej);
       System.out.println("nip_pej= "+nip_pej);
       System.out.println("a_n= "+a_n);

       String kewarganegaraan = "WNA";
       System.out.println("kewarganegaraan= "+kewarganegaraan);

       String radiobutton = request.getParameter("radiobutton");
       String cb = request.getParameter("cb");
      System.out.println("cb di cetak ktp lampiran= "+cb.trim());
      String param_kk = "";

      StringTokenizer st1 = new StringTokenizer(cb, "^");
      String token = "";
      Vector vNik = new Vector();

      String nik = "";
      String img_foto = "";
      String img_person = "";
      KTPWniObject ktpObj = null;

   while (st1.hasMoreTokens())
      {
         token = st1.nextToken();
         StringTokenizer st2 = null;
         st2 = new StringTokenizer(token, "|");
         nik = st2.nextToken();
         img_foto = st2.nextToken();
         img_person = st2.nextToken();
	     ktpObj = new KTPWniObject(nik,img_foto,img_person);
         vNik.addElement(ktpObj);
         param_kk = param_kk +"|" +nik;
      }
      String img_dokumen = (request.getParameter("imgdokumen")==null?"":request.getParameter("imgdokumen"));

      String nama_prop = request.getParameter("nama_prop");
      String nama_kab = request.getParameter("nama_kab");
%>
<body bgcolor="#FFFFFF" text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="">
<%
int totalPage = vNik.size();
%>
<input type="hidden" name="radiobutton" value="<%=radiobutton%>">
<input type="hidden" name="param_kk" value="<%=param_kk%>">
<input type="hidden" name="totalpage" value=<%=totalPage%>>

<div id="panel" align="center">
<table width="100%" border="0" cellspacing="5" cellpadding="5">
<tr>
 <td>
      <div align="center">
           <input class=boxstandard type="button" name="Print" value="Print" onclick="printKTP(this);">
           <input class=boxstandard type="button" name="close" value="Close" onclick="window.close();">
      </div>

   </td>
</tr>
</table>
</div>
<%
ViewCetakKTP view = null;
try
{

          ServiceController statefulController = ServiceController.getInstance();
          ViewCetakKTPHome home = (ViewCetakKTPHome)statefulController.lookup("ViewCetakKTP", ViewCetakKTPHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vNik, nama_prop,nama_kab, null, null, kewarganegaraan);
vt_ktp=new Vector();

for(int i =0;i<vData.size();i++)
{
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative;media:printer" onClick="zoom(this.id)">
 <table  width="305" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tr>
    <td><img src="images/dot.gif" width="5" height="8"></td>
    <td>
        <table width="100%" border=0 cellpadding=0 cellspacing=0>
          <tr>
            <td colspan=7 class="fonts_KTP">
              <div align="center" class="fonts_KTP_judul">PROVINSI <%=record.getNamaProp().toUpperCase()%></div>
            </td>
          </tr>
          <tr>
            <td colspan=7>
              <div align="center"><font size="1" class="fonts_KTP_judul"><%=getKabupaten(record.getNamaKab().toUpperCase()).toUpperCase()%></font></div>
            </td>
          </tr>
          <tr>
            <td class="fonts_KTP" colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">NIK</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNik()%></td>
            <td class="fonts_KTP" width="23%" colspan="-3"><b></b></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">Name</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNama_lgkp().toUpperCase()%></td>
            <td class="fonts_KTP" width="23%" colspan="-3"><b></b></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">Place/Date of Birth</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getTmpt_lhr().toUpperCase()+"/"+((KTPWniObject)vData.elementAt(i)).getTgl_lhr()%></td>
            <td class="fonts_KTP" rowspan="10" width="55" colspan="4">
              <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
                <tr>
                  <td>
                    <div align="right"><b><img src="<%=((KTPWniObject)vData.elementAt(i)).getImg_foto()%>" width="53" height="75"></b></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">Nationality/Sex</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getKewarganegaraan()%>/<%=((KTPWniObject)vData.elementAt(i)).getJenis_klmin()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">Passport Number</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNoPaspor()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">KITAP Number</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNoDok()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">KITAP Validity</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getTglAkhDok()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2" valign="top">Address</td>
            <td class="fonts_KTP" colspan="4">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="fonts_KTP">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getAlamat().toUpperCase()%></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td class="fonts_KTP" width="6%"><b></b></td>
            <td class="fonts_KTP_sub">RT/RW</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNo_rt()%>/<%=((KTPWniObject)vData.elementAt(i)).getNo_rw()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP" width="0%"><b></b></td>
            <td class="fonts_KTP_sub">Desa/Kel</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNama_kel()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP" width="0%"><b></b></td>
            <td class="fonts_KTP_sub">Kecamatan</td>
            <td class="fonts_KTP" colspan="4">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNama_kec()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP" width="0%" height="2"><b></b></td>
            <td class="fonts_KTP_sub" height="2">Kab/Kota</td>
            <td class="fonts_KTP" colspan="4" height="2">:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getNama_kab()%></td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="2">KTP Validity</td>
            <td class="fonts_KTP" colspan="2" nowrap>:&nbsp;<%=((KTPWniObject)vData.elementAt(i)).getTgl_berlaku()%></td>
            <td class="fonts_KTP" colspan="3">
                <div align="center"><%=getKabupaten(record.getNamaKab().toUpperCase()).toUpperCase()%>,
                  <%=((KTPWniObject)vData.elementAt(i)).getSystgl()%></div>
            </td>
          </tr>
          <tr>
            <td class="fonts_KTP_sub" colspan="4" valign="top">
              <div align="center" >Signature Bearer</div>
            </td>
		            <td class="fonts_KTP" colspan="3">
                <div align="center">
                <%=record.getKabJabatan().toUpperCase()%></div>
            </td>
          </tr>
          <tr>
            <td class="fonts_KTP" colspan="4">
              <table width="130" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td align="center" valign="top"><img src="<%=((KTPWniObject)vData.elementAt(i)).getSignature()%>" width="50" height="20" align="bottom"></td>
                </tr>
                <tr>
                  <td class="fonts_KTP" height="1" bgcolor="#000000">
                    <div align="center"><img src="images/dot.gif" width="1" height="1"></div>
                  </td>
                </tr>
                <tr>
                  <td class="fonts_KTP">
                    <div align="center">Signature/Fingerprint of the owner</div>
                  </td>
                </tr>
              </table>
            </td>
            <td class="fonts_KTP" colspan="3">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="fonts_KTP_sub" height="15" valign="top">&nbsp;</td>
                    <td class="fonts_KTP_sub" height="15" valign="top">&nbsp;</td>
                    <td class="fonts_KTP_sub" height="15" valign="top">
             <table width="145" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr>
                            <td align="center" valign="top">
							  <img src="<%=img_dokumen%>" width="50" height="15" align="top">
                                  </td>
                          </tr>
                        </table>

                    </td>
                  </tr>
                  <tr>
                    <td class="fonts_KTP">&nbsp;</td>
                    <td class="fonts_KTP">&nbsp;</td>
                    <td class="fonts_KTP">
                      <div align="center"><u><%=nama_pej.toUpperCase()%></u><BR>NIP.<%=nip_pej.toUpperCase()%></div>
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
</div>
 <%
 vt_ktp.addElement(new InfoKTP(((KTPWniObject)vData.elementAt(i)).getNik(),((KTPWniObject)vData.elementAt(i)).getTgl_berlaku()));
 }
  session.setAttribute("ktpInfo",vt_ktp);
}
catch(Exception e)
{
    e.printStackTrace();
}
finally
{
   view.remove();
}
%>
</form>
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
