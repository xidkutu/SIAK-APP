<%@ include file="Global.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><HEAD>
<TITLE>adminduk project</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/sbr.css" rel=stylesheet>
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
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" onload="window.history.forward(1)">
<table width="100%" height="95%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25%" bgcolor="#FF9933">&nbsp;</td>
  </tr>
  <tr>
    <td background="img/bg-01.gif">
<table width="250" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="img/login-01.jpg" width="495" height="73"></td>
        </tr>
        <tr>
          <td><img src="img/login-02.jpg" width="495" height="38"></td>
        </tr>
        <tr>
          <td><img src="img/login-03.jpg" width="495" height="191"></td>
        </tr>
        <tr>
          <td width="0" height="0">
		  <form name="form1" method="post">
            <table width="100" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="img/login-041.jpg" width="240" height="81"></td>
                <td bgcolor="#FFFFFF">
                    <TABLE cellSpacing=1 cellPadding=0 width="100%"
                              align=center border=0>
                      <TBODY>
                      <TR>
                        <TD class=C-Field> <font size="1" face="Arial, Helvetica, sans-serif">Username <SPAN
                                class=asterish>*</SPAN></font> </TD>
                        <TD class=C-Field><font size="1">:</font></TD>
                        <TD class=C-Field>
                          <TABLE cellSpacing=2 cellPadding=2 width=125
                                border=0>
                            <TBODY>
                            <TR>
                              <TD class=boxdefault> <font size="1">
                                <INPUT class=boxdefault
                                size=20 name=login maxlength="30" onKeyUp="return space(form1.login)">
                                </font></TD>
                            </TR>
                            </TBODY>
                          </TABLE>
                        </TD>
                      </TR>
                      <TR>
                        <TD class=C-Field><font size="1" face="Arial, Helvetica, sans-serif">Password<SPAN
                                class=asterish>**</SPAN></font></TD>
                        <TD class=C-Field><font size="1">:</font></TD>
                        <TD class=C-Field><font size="1">
                          <INPUT class=boxdefault
                                type=password size=20 name=pwd maxlength="30">
                          </font></TD>
                      </TR>
                      <TR>
                        <TD class=C-Field colspan="3">
                          <div align="center">
                            <input type="button" value="Login" name="btnlogin" class=boxstandard onclick="return startlogin()">
                          </div>
                        </TD>
                      </TR>
                      </TBODY>
                    </TABLE>
                  </td>
                <td><img src="img/login-045.jpg" width="13" height="81"></td>
              </tr>
              <tr>
                <td><img src="img/login-042.jpg" width="240" height="12"></td>
                <td><img src="img/login-043.jpg" width="242" height="12"></td>
                <td><img src="img/login-044.jpg" width="13" height="12"></td>
              </tr>
            </table>
			 </form>
          </td>
        </tr>
      </table>

    </td>
  </tr>
  <tr>
    <td height="25%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<script language="javascript">
document.all["login"].focus()
</script>