<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0043)http://siakoffline.depdagri.go.id/index.jsp -->
<HTML><HEAD><TITLE>adminduk project</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252"><LINK
href="images/juli2006/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="images/juli2006/ajlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/juli2006/ajmenu.js"></SCRIPT>
<SCRIPT language=JavaScript src=""></SCRIPT>
<SCRIPT language=javascript src="images/juli2006/Login.js"></SCRIPT>
<SCRIPT language=javascript>
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

<META content="MSHTML 6.00.2479.1" name=GENERATOR></HEAD>
<BODY bgColor=#93bee2 leftMargin=0 topMargin=0 onload=window.history.forward(1)
MARGINWIDTH="0" MARGINHEIGHT="0">
<FORM name=form1 method=post>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=center align=middle>
      <TABLE height=100 cellSpacing=1 cellPadding=1 width=100 align=center
      border=0>
        <TBODY>
        <TR>
          <TD vAlign=top bgColor=#ffffff>
              <TABLE cellSpacing=0 cellPadding=0 width="100%"
            background="images/juli2006/q_bg1.gif" border=0>
                <TBODY>
                <TR>
                  <TD
                  background="images/juli2006/login_bg.jpg">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="images/swflash.cab#version=5,0,0,0" width="343" height="266">
						<param name=movie value="images/animasi_login.swf">
						<param name=quality value=high>
						<embed src="images/animasi_login.swf" quality=high pluginspage="" type="application/x-shockwave-flash" width="343" height="266">
						</embed>
						</object>
						</td>
                      </tr>
                    </table>
                  </TD>
                </TR>
                <TR>
                  <TD bgColor=#93bee2>
                    <TABLE height=100 cellSpacing=0 cellPadding=0 width=300
                  align=center bgColor=#cbe0fa border=0>
                      <TBODY>
                      <TR>
                        <TD><IMG height=5
                        src="images/juli2006/v_sdt_kr_up.gif"
                        width=5></TD>
                        <TD height=1><IMG height=1
                        src="images/juli2006/dot.gif" width=1></TD>
                        <TD><IMG height=5
                        src="images/juli2006/v_sdt_kn_up.gif"
                        width=5></TD>
                      </TR>
                      <TR>
                        <TD>&nbsp;</TD>
                        <TD>
                          <TABLE cellSpacing=1 cellPadding=1 width="100%"
                        align=center border=0>
                            <TBODY>
                            <TR>
                              <TD width=20>&nbsp; </TD>
                              <TD height=15>
                                <DIV align=right></DIV>
                              </TD>
                              <TD><I></I></TD>
                            </TR>
                            <TR>
                              <TD width=20 rowSpan=2>&nbsp; </TD>
                              <TD width=150>
                                <DIV align=right>Nama Pengguna :</DIV>
                              </TD>
                              <TD><I>
                                <INPUT class=boxdefault
                              onkeyup="return space(form1.login)" maxLength=30
                              size=22 name=login>
                                </I></TD>
                            </TR>
                            <TR>
                              <TD width=150>
                                <DIV align=right>Kata Kunci :</DIV>
                              </TD>
                              <TD><I>
                                <INPUT class=boxdefault type=password
                              maxLength=30 size=22 name=pwd>
                                </I></TD>
                            </TR>
                            <TR>
                              <TD width=20>&nbsp;</TD>
                              <TD colSpan=2 height=35>
                                <DIV align=center>
                                  <TABLE cellSpacing=1 cellPadding=1 width="100%"
                              align=center border=0>
                                    <TBODY>
                                    <TR>
                                      <TD height=35>
                                        <DIV align=center><FONT face="Arial Black"
                                size=2><FONT color=#ffff00>
                                          <INPUT class=boxstandard onclick="return startlogin()" type=button value=Login name=btnlogin>
                                          </FONT></FONT></DIV>
                                      </TD>
                                    </TR>
                                    </TBODY>
                                  </TABLE>
                                </DIV>
                              </TD>
                            </TR>
                            </TBODY>
                          </TABLE>
                        </TD>
                        <TD>&nbsp;</TD>
                      </TR>
                      <TR>
                        <TD height=1><IMG height=5
                        src="images/juli2006/v_sdt_kr_btm.gif"
                        width=5></TD>
                        <TD><IMG height=1 hspace=1
                        src="images/juli2006/dot.gif" width=1></TD>
                        <TD><IMG height=5
                        src="images/juli2006/v_sdt_kn_btm.gif"
                        width=5></TD>
                      </TR>
                      </TBODY>
                    </TABLE>
                  </TD>
                </TR>
                <TR>
                  <TD
      bgColor=#93bee2><BR>
                  </TD>
                </TR>
                </TBODY>
              </TABLE>
            </TD></TR></TBODY></TABLE><!--
<a href="../install.exe">
Click disini untuk self configurasi
</a>
--></TD></TR></TBODY></TABLE></FORM>
<SCRIPT language=javascript>
document.all["login"].focus()
</SCRIPT>
</BODY></HTML>
