
<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD>
<TITLE>adminduk project</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=javascript src="scripts/Login.js">
</SCRIPT>
<SCRIPT language="javascript">
function startlogin()
{
	if(document.form1.login.value == "")
	{
		alert("Nama Pengguna belum diisi !.")
		document.form1.login.focus()
		return(false)
	}
	else if(document.form1.pwd.value == "")
	{
		alert("Kata Kunci belum diisi !.")
		document.form1.pwd.focus()
		return(false);
	}

document.form1.action= "otorisasiCetakUlang?<%=request.getQueryString()%>";
document.form1.submit();
document.all['btnlogin'].disabled=true;
//"mywin011=popUP('I.Login/SIAK super user/menu_super_user.htm'/*tpa=welcome.htm*/,430,347,null,null,'mywin011',5,true,true,true);return false"
}

function keluar()
{
document.form1.action= "otorisasiCetakUlang?cancel=true";
document.form1.submit();
document.all['btnlogin'].disabled=true;
document.all['btnKeluar'].disabled=true;
self.close();
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY bgColor="#93BEE2" onload="window.history.forward(1)">
<H1 class="judul_utama" align="center">Otorisasi untuk cetak ulang</H1>
<form name="form1" method="post">
       <table width="300" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" height="100">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                          <tr>
                            <td width="20">&nbsp; </td>
                            <td height="15">
                              <div align="right"></div>
                            </td>
                            <td> <i> </i></td>
                          </tr>
                          <tr>
                            <td width="20" rowspan="2">&nbsp; </td>
                            <td width="150">

              <div align="right">Nama Supervisor :</div>
</td>
<td> <i>
<input type="text" class=boxdefault size=22 name="login" maxlength="30" onKeyUp="return space(form1.login)">
                              </i></td>
                          </tr>
                          <tr>
                            <td width="150">
                              <div align="right">Kata Kunci :</div>
                            </td>
                            <td><i>
                              <input type="password"
                                class=boxdefault size=22 name="pwd" maxlength="30">
                              </i></td>
                          </tr>
                          <tr>
                            <td width="20">&nbsp;</td>
                            <td colspan="2" height="35">
                              <div align="center">
                                <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                                  <tr>
                                    <td height="35">
<div align="center">
<font face="Arial Black" size="2">
<font color="#FFFF00">
<!--INPUT alt="Login Here" height="18" cache name=image1 onclick="return startlogin()" src="images/t-daftar.gif" type=image width="50"-->
<input type="button" value="Login" name="btnlogin" class=boxstandard onclick="return startlogin()">
<input type="button" value="Keluar" name="btnKeluar" class=boxstandard onclick="keluar()">
<!--<div id="loader" style="position:absolute; visibility: hidden">
-->
<!--
</div>
-->
<input type="hidden" name="step" value="1">
<input type="hidden" name="file" value="<%=request.getParameter("file")%>">
</font>
</font>
</div>
</td>
</tr>
<% String error = request.getParameter("error");
   if (error!=null) {
%>
   <tr>
      <td><font color=red><center><%=error%></center></font></td>
   </tr>
<%
   }
%>

                                </table>
                              </div>
                            </td>
                          </tr>
                        </table>
                 </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>

</form>
</BODY>
</HTML>

<script language="javascript">
document.all["login"].focus()
</script>