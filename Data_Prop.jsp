<%
try
{
  if (session.getAttribute("remoteRef")!=null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/prop_vali.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/namaprop.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/noprop.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<FORM action=wilayah.jsp method=get name="setpuprof" >
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle">Setup Wilayah
                          Provinsi</span></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr>
                      <td>
                        <table width="400" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td width="125">Kode-Nama Provinsi</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_prop  maxlength="2" onKeyUp="return nop()">
                            </td>
                            <td width="80">
                              <input
                                class=boxdefault size=22 name=nama_prop  maxlength="60" onKeyUp="return namap()">
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr valign="bottom">
                      <td height="45" valign="top">
                        <div align="center"></div>
                        <div align="center"><b> </b>
                          <table width="100" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                              <td><b>
                                <input class=boxstandard type="submit" value=SIMPAN name="SIM" onclick="return blank()">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" name="TAMP" value=TAMPILKAN onclick="op()">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="button" value=KELUAR name="KEL" onclick="document.location='menu_wilayah.jsp'">
                                <!--input class=boxstandard type="button" value=KELUAR name="KEL" onclick="ex()"-->
                                </b></td>
                            </tr>
                          </table>

                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td height="10">&nbsp;</td>
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
</FORM>
</table>
<p class="linkyellow">&nbsp;</p>
</BODY>
<SCRIPT language=JavaScript >
setpuprof.no_prop.focus();
function op()
{
setpuprof.no_prop.value=0;
setpuprof.nama_prop.value="  ";
}
function ex()
{
var v=window.history.length;
history.go(-v);
}
</SCRIPT>
</HTML>
<%
}
else
{response.sendRedirect("index.jsp");
}
}catch(Exception err)
{

}
%>