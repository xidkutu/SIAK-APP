<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
    String no_kel,nama_kel,select,id1=null,error=null,flag=null;
    Vector v = null;
%>

<%
     error = request.getParameter("error");
     flag = request.getParameter("flag");
if (session.getAttribute("remoteRef")!=null)
{

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/keymapper.js">
</SCRIPT>

<SCRIPT language="JavaScript">
 // document.oncontextmenu=new Function("return false");
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}
function pin()
{
  if(form1.ulang_pin.value == "")
  {
    alert("Ketik Ulang PIN Anda belum diisi !")
    form1.ulang_pin.focus()
    return false
  }
  if(form1.no_autoriz.value == "")
  {
    alert("Nomor Otorisasi belum diisi !")
    form1.no_autoriz.focus()
    return false
  }
   if ((trim(form1.ulang_pin.value)!= "") && (trim(form1.no_autoriz.value)!= ""))
      {
           document.form1.action= "otorisasiCetakUlang?<%=request.getQueryString()%>";
           document.form1.submit();
           document.all['btnperiksa'].disabled=true;
            document.all['btnkel'].disabled=true;
      }
}

function keluar()
{
document.form1.action= "otorisasiCetakUlang?cancel=true";
document.form1.submit();
document.all['btnperiksa'].disabled=true;
document.all['btnkel'].disabled=true;
self.close();
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<SCRIPT language="JavaScript">
var firedBefore=false;
</SCRIPT>
<form name="form1" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif">
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="625" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3" height="100%">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                                <div align="center"><span class="submenu">Nomor
                                  Otorisasi dan PIN Supervisor</span><br>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table width="375" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td class="C-BG">
                              <table border="0" cellspacing="1" cellpadding="3" align="center" width="100%">
                                <tr>
                                  <td class="C-Field">PIN Anda </td>
                                  <td class="C-Field"> :</td>
                                  <td class="C-Field">
                                    <table width="125" border="0" cellspacing="2" cellpadding="2">
                                      <tr>
                                        <td class="boxdefault">
                                          <div align="left" class="boxdefault2"><%=(String)session.getAttribute("pinAuthSupv")%></div>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field">Ketik Ulang PIN Anda <span class="asterish">*</span></td>
                                  <td class="C-Field">:</td>
                                  <td class="C-Field">
                                    <input
                                class=boxdefault size=25 name=ulang_pin type="text">
                                  </td>
                                </tr>
                                <tr>
                                  <td class="C-Field">Nomor Otorisasi <span class="asterish">**</span></td>
                                  <td class="C-Field"> :</td>
                                  <td class="C-Field">
                                    <input
                                class=boxdefault size=25 name=no_autoriz type="password">
                                  </td>
                                </tr>
                              </table>
                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                            <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="35" valign="top">
                        <div align="center">
                          <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                            <tr>
                              <td width="14">
                                <div align="center"><b> </b></div>
                              </td>
                              <td width="170">
                                <div align="center"><b> </b></div>
                                <div align="center"><b>

<input class=boxstandard type="button" value="PERIKSA" name="btnperiksa"  onClick="pin()">

                                  </b></div>
                              </td>
                              <td width="166">
<div align="center"><b>
<input class=boxstandard type="button"  value="KELUAR" name="btnkel" onclick="keluar()">
<input type="hidden" name="step" value="2">
<input type="hidden" name="file" value="<%=request.getParameter("file")%>">

    </b></div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="35" valign="bottom">
                        <table width="500" border="0" cellspacing="3" cellpadding="3">
                          <tr>
                            <td class="linkyellow" colspan="2">Keterangan :</td>
                          </tr>
                          <tr>
                            <td width="90" valign="top">
                              <div align="right" class="asterish">(*)</div>
                            </td>
                            <td> <font size="2" class="linkyellow">Masukkan Nomor
                              PIN Anda seperti yang tertera diatas</font></td>
                          </tr>
                          <tr>
                            <td width="90" valign="top">
                              <div align="right" class="asterish">(**)</div>
                            </td>
                            <td> <font size="2" class="linkyellow">Masukkan Nomor
                              Otorisasi sesuai yang Anda terima</font></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>

</table>
<%
if (flag!=null) {
if ((flag.equals("1")) &&(error != null))
{
    out.println("<br><b><font color='#FF0000' face='Verdana' size=3><center>"+error+"</center></font></b>");

}
}
%>
</form>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
%>
