<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.ServiceController"%>
<%!
    UserInfo1 record = null;
%>

<%
 try
   {
   record=(UserInfo1)session.getAttribute("remoteRef");
%>

<%
if(record != null)
{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onLoad="MM_preloadImages('images/N-back2.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr> </tr>
                    <tr>
                      <td>
                        <table width="500" border="0" cellspacing="3" cellpadding="1" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center" class="judul_utama">DAFTAR ESTIMASI
                                NIK GANDA (WNI)</div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">
                              <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
                                <tr>
                                  <td width="49%">
                                    <div align="right"> Edisi Tanggal</div>
                                  </td>
                                  <td width="4%">:</td>
                                  <td width="47%"><%=record.getToday()%></td>
                                </tr>
                                <tr>
                                  <td colspan="3">&nbsp;</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                        <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="C-BG">
                              <table border="0" cellspacing="1" cellpadding="3" align="center" width="100%">
                                <tr>
                                  <td class="C-Field" colspan="3">
                                    <div align="center"><b>Tampilkan Berdasarkan
                                      Kesamaan Data : </b></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field">
                                    <div align="center"> <b><a href="estimasi_nik_ganda_WNI_namalgkp.jsp"><font color="#2A00AA">Nama
                                      Lengkap, Tempat Lahir dan Tanggal Lahir</font></a></b></div>
                                  </td>
                                  <td class="C-Field">
                                    <div align="center"><b><a href="estimasi_nik_ganda_WNI_namaibu.jsp"><font color="#2A00AA">Nama
                                      Ibu, Tempat Lahir dan Tanggal Lahir</font></a></b></div>
                                  </td>
                                  <td class="C-Field">
                                    <div align="center"><b><a href="estimasi_nik_ganda_WNI_namaibu_ayah.jsp"><font color="#2A00AA">Nama
                                      Ayah, Nama Ibu, Tempat Lahir dan Tanggal
                                      Lahir</font></a></b></div>
                                  </td>
                                </tr>
                              </table>
                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                            <td width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                          </tr>
                        </table>

                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <div align="center"><input class=boxstandard type=button value=KELUAR onClick="document.location='<%=record.getModRefFile()%>'" name="KEL"></div></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
 }
   catch(Exception e){}

%>
