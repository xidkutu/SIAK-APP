<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%
 if  (session.getAttribute("remoteRef")!=null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form name="form1" method="post" action="Logout.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td valign="top">
                  <table width="500" border="0" cellspacing="3" cellpadding="2" align="center" height="100">
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="25">
                        <div align="center" class="judul_utama">
                          <p class="submenu">Menu Setup Wilayah</p>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4"><img src="images/dot.gif" width="1" height="10">
                        <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                          <tr>
                            <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td height="241" rowspan="3" width="1"></td>
                            <td>&nbsp; </td>
                            <td height="241" rowspan="3"></td>
                          </tr>
                          <tr>
                            <td height="121">
                              <table width="90" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC">
                                <tr>
                                  <td><img src="images/v_sdt_kr_up2.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td><img src="images/v_sdt_kn_up2.gif" width="5" height="5"></td>
                                </tr>
                                <tr>
                                  <td height="241"></td>
                                  <td height="241">
                                    <table width="350" border="0" cellspacing="8" cellpadding="8" align="center">
                                      <tr>
                                        <td width="35">
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="Data_Prop.jsp"><font color="#000066">Setup
                                          Wilayah PROVINSI</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2"><img src="images/batas_dot2.gif" width="333" height="1"></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="data_input_kabupaten_kota.jsp"><font color="#000066">Setup
                                          Wilayah KABUPATEN / KOTA</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2"><img src="images/batas_dot2.gif" width="333" height="1"></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="Data_Keca.jsp"><font color="#000066">Setup
                                          Wilayah KECAMATAN</font></a></td>
                                      </tr>
                                      <tr>
                                        <td height="1" colspan="2"> <img src="images/batas_dot2.gif" width="333" height="1"></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div align="center"><a href="4.data_input_desa-kelurahan.htm"></a><img src="images/tab2.gif" width="9" height="9"></div>
                                        </td>
                                        <td><a href="data_input_desa_kelurahan.jsp"><font color="#000066">Setup
                                          Wilayah DESA / KELURAHAN</font></a></td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td height="241"> </td>
                                </tr>
                                <tr>
                                  <td height="1"><img src="images/v_sdt_kr_btm2.gif" width="5" height="5"></td>
                                  <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                  <td width="5" height="5"><img src="images/v_sdt_kn_btm2.gif" width="5" height="5"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
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
                      <td colspan="4" height="40" valign="bottom">
                        <div align="center"><b>
              <input class=boxstandard type="button" value="KELUAR" name="index" onclick="document.location='siak_admin.jsp'">
                          </b></div>
                      </td>
                    </tr>
                  </table>

                </td>
              </tr>
              <tr>
                <td height="55"></td>
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
<p class="linkyellow">&nbsp;</p>
</form>
</BODY></HTML>
<%
}
else
 {
%>
<jsp:forward page="index.jsp">
</jsp:forward>
<%
 }
%>

