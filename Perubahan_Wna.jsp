<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*" %>
<%@ include file="Global.jsp"%>
<%!
    UserInfo1 record=null;
    ServiceController factory=null;
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/keymapper.js">
</SCRIPT>

<SCRIPT language=JavaScript>
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function edi()
{
var nikwna=trim(perubhan.nik.value)

if (isNaN(nikwna.substr(1,nikwna.length)))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		perubhan.nik.value="";
		perubhan.nik.focus();
		return false;
}


if ((nikwna.substr(0,1)!="A"))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		perubhan.nik.value="";
		perubhan.nik.focus();
		return false;
}

for(var i=0; i < perubhan.nik.value.length; i++)
{
         if(perubhan.nik.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 perubhan.nik.value="";
                 perubhan.nik.focus();
	         return false;
               }
}
if(trim(perubhan.nik.value)=="")
{
                alert("Nomor Induk Kependudukan Belum Diisi!!" )
		perubhan.nik.focus();
		return false;
}

document.all['nik'].value=trim(nikwna.substr(1,nikwna.length))
document.forms[0].action="DisPer.jsp"
document.all['button2232'].disabled=true;
document.all['klbtn'].disabled=true;
document.forms[0].submit();

}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onhelp="doKeyDown(event);"; onKeyDown="callKeyDown()" onload="window.history.forward(1)">
<SCRIPT language="JavaScript">
var firedBefore=false;
</SCRIPT>
<FORM name="perubhan" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif">
<jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3" height="387">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">Pendaftaran
                                Perubahan Biodata WNA</span><br>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <table width="753" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah<br>
                                <font class="linkyellow">(Regional data)</font>
                                </span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>

                          <tr>
                            <td>Kode-Nama Propinsi</td>
                            <td>:</td>
                            <td width="5">
<input class=boxdefault size=4 name=no_prop  maxlength="2" value="<%=record.getNoProp()%>" onFocus="this.blur()">
                            </td>
                            <td width="33">
<input class=boxdefault size=22 name=nama_prop maxlength="60" value="<%=record.getNamaProp().toString().toUpperCase()%>" onFocus="this.blur()">
                            </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td>:</td>
                            <td width="8">
<input class=boxdefault size=4 name=no_kab  maxlength="2" value="<%=record.getNoKab()%>" onFocus="this.blur()">
                            </td>
                            <td width="22">
<input  class=boxdefault size=22 name=nama_kab  maxlength="60" value="<%=record.getNamaKab().toString().toUpperCase()%>" onFocus="this.blur()">
                            </td>
                          </tr>
                         <tr>
                            <td height="10" width="133"><img src="images/dot.gif" width="1" height="10"></td>
                            <td width="5">&nbsp;</td>
                            <td width="38">&nbsp;</td>
                            <td width="164">&nbsp;</td>
                            <td width="1">&nbsp;</td>
                            <td width="167">&nbsp;</td>
                            <td width="6">&nbsp;</td>
                            <td width="38">&nbsp;</td>
                            <td width="135">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">

                        <table width="550" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">
Data Individu</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                                </font><font class="linkyellow">(Personal data)</font></div>
                            </td>
                          </tr>
<!--
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="150"> Nomor Kartu Keluarga<br>
                              <span class="linkyellow">(Family Card Number)</span>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top"><i> <b>&nbsp;&lt;relasional dgn biodata&gt;</b></i><b><i><b><i><b>
                              </b></i></b></i> </b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="165"> Nama Kepala Keluarga<br>
                              <span class="linkyellow">(Head of Family Name)</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top"><i><b>&nbsp;&lt;relasional dgn data keluarga&gt;</b></i></td>
                          </tr>
                          <tr>
                            <td valign="top" width="125"> Alamat Keluarga<span class="linkyellow"><br>
                              (Family Address)</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top"><i><b>&nbsp;&lt;relasional dgn data keluarga&gt;</b></i></td>
                            </tr>
-->
                            <tr>
                              <td valign="top">Nomor Induk Kependudukan<br>
                                <span class="linkyellow">(Population Identity
                                Number)</span></td>
                                  <td valign="top"> :

 <input class=boxdefault size=17 name="nik" maxlength="17"></td>
<td valign="top">
      <input class=boxstandard  onClick="return edi()" type=button value=PERIKSA name="button2232" >
                            </td>
<td valign="top">
   <input class=boxstandard onClick="onclick=document.location='WNA_Menu.jsp'"  type=button  name="klbtn" value=KELUAR >
 </td>

                          </tr>
<tr>

         <td colspan="4">
    <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FF0000"><b>
<%
 String msgflag="";
 if ((request.getParameter("flag")!=null) && !(request.getParameter("flag").trim().equals("")) && !(request.getParameter("flag").trim().equals("0")))
      {
           switch(Integer.parseInt(request.getParameter("flag")))
                  {
                       case 1:
                       msgflag="NIK belum terdaftar !";
                       break;
                       case 2:
                       msgflag="Biodata penduduk tidak bisa diubah lagi !";
                       break;
                       case 3:
                       msgflag="Data belum tersimpan !";
                       break;
                       case 4:
                       msgflag="Silakan coba lagi !";
                       break;
                  }
      }
%>
<%
if (!msgflag.equals(""))
 {
%>
<font color="#FFFFFF"><%=printError(msgflag)%></font>
<%
 }
%>
</b></font> </div>
      </td>

</tr>
  </table>
                 </td>
                    </tr>
                  </table>

</table>
</table>
</table>
</form>
</BODY>

</HTML>
<%
}
else
{
  response.sendRedirect("index.jsp");
}
%>
