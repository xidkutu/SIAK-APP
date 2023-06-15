<%@ include file="Global.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk project</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/ajlib.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/ajmenu.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/js_menutama_geser.js">
</SCRIPT>
<SCRIPT language=javascript src="scripts/Login.js">
</SCRIPT>
<SCRIPT language="javascript">
function cookiesDisabled() {
  var result=true;
  // some browser versions support this - use it if possible
  if (navigator.cookiesEnabled)
    return false;

  // else try to set and read a cookie
  document.cookie = "testcookie=yes;";
  var cookieSet = document.cookie;
  if (cookieSet.indexOf("testcookie=yes") > -1) {
    result=false;
  }
  document.cookie = "testcookie=;expires=;";
  return result;
}

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
       else if (cookiesDisabled())
        {
             alert("Setting cookie di browser belum diaktifkan !");
             return false;
        }
      else if (navigator.appVersion.indexOf('MSIE 6.0')<=0)
        {
          alert("Tolong periksa versi browser !");
          return false;
        }

document.form1.action="loginparse"
document.form1.submit();
document.all['btnlogin'].disabled=true;
//"mywin011=popUP('I.Login/SIAK super user/menu_super_user.htm'/*tpa=welcome.htm*/,430,347,null,null,'mywin011',5,true,true,true);return false"
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor="#93BEE2" onload="window.history.forward(1)">
<form name="form1" method="post">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
    <tr>
    <td valign="middle" align="center">
      <table width="100" border="0" cellspacing="1" cellpadding="1" align="center" height="100">
        <tr>
          <td bgcolor="#FFFFFF" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" background="images/q_bg1.gif">
             <tr>
                <td background="images/login_bg.jpg">&nbsp; </td>
              </tr>
              <tr>
                <td background="images/login_bg.jpg">
                  <table width="100" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/login1.gif" width="343" height="1"></td>
                    </tr>
                    <tr>
                      <td> <div align="center"><img src="images/login2.gif" width="49" height="54"></div></td>
                    </tr>
                    <tr>
                      <td> <div align="center"><img src="images/login3.gif" width="169" height="24"></div></td>
                    </tr>
                    <tr>
<td valign="bottom" height="55"> <div align="center"><img src="images/logo_ddn.gif" width="241" height="39"></div></td>
</tr>
<tr>
<td> <div align="center"></div>
<div align="center">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="images/swflash.cab#version=5,0,0,0" width="343" height="120">
<param name=movie value="images/siakoffline.swf">
<param name=quality value=high>
<embed src="images/siakoffline.swf" quality=high pluginspage="" type="application/x-shockwave-flash" width="343" height="120">
</embed>
</object>
</div>
</td>
</tr>
</table>
</td>
              </tr>
              <tr>
                <td bgcolor="#93BEE2">
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
                              <div align="right">Nama Pengguna :</div>
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
<input type="button" value="Login" name="btnlogin" class=boxstandard onclick="return startlogin()">
</font>
</font>
</div>
</td>
</tr>

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
                </td>
              </tr>
              <tr>
                <td bgcolor="#93BEE2"><br>
                  </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
        <!--
<a href="../install.exe">
Click disini untuk self configurasi
</a>
-->
        <%if (request.getParameter("error")!=null)
         {
	 %>
        <%=printError(errMsg(request.getParameter("error"),""))%>
        <%
	 }
	%>
      </td>
  </tr>
</table>
</form>
</BODY>
</HTML>

<script language="javascript">
document.all["login"].focus()
</script>