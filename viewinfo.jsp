<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%@page import="com.monitor.*"%>
<%!
    UserInfo1 record = null;
%>

<%
   try
   {
     record = (UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<style type="text/css">
<!--
.bdr {  border: 6px #003399 ridge; text-decoration: underline}
-->
</style>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor="#93BEE2"   text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
<tr>
<td align="center">
<input class=boxstandard type=button value=KELUAR onClick="self.close()" name="btnchat2">
</td>
</tr>
<tr>
<td align="center">
<table border="0" cellspacing="0" cellpadding="0" bgColor="#93BEE2" align="center" width="100%">
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="152">
            <table width="100%" border="0" cellspacing="3" cellpadding="0" align="center">
              <tr>
                <td height="1">
                  <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                </td>
              </tr>
              <tr>
                <td height="25">
                        <div align="center" class="subtitle">PENGGUNA AKTIF </div>
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
                <td height="10"><img src="images/dot.gif" width="1" height="10">Tanggal
                  - <%=record.getToday()%><br>
                  Waktu -<%=record.getNow()%></td>
              </tr>
              <tr valign="bottom">
                <td height="45" valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" >
                    <tr>
                      <td height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" >
                          <tr>
                            <td class="C-Fonts" >
                              <div align="center">No.&nbsp;</div>
                            </td>
                            <td class="C-Fonts" >
                              <div align="center">Nama Pengguna</div>
                            </td>
                            <td class="C-Fonts" >
                              <div align="center"><span lang="EN-GB">Nama Lengkap</span></div>
                            </td>
                            <td class="C-Fonts" >
                              <div align="center">NIP</div>
                            </td>
                            <td class="C-Fonts" >
                                    <div align="center">Nama Kec</div>
                            </td>
                                  <td class="C-Fonts" >Nama Kab</td>
                                  <td class="C-Fonts"  align="center">NamaProp</td>
                                  </tr>
                          <tr>
                            <td class="C-Field" >
                              <div align="right">1.</div>
                            </td>
                            <td class="C-Field" ><%=record.getUserId()%></td>
                            <td class="C-Field" ><%=record.getNamaPetugas()%></td>
                            <td class="C-Field" ><%=record.getNipPetugas()%></td>
                            <td class="C-Field" ><%=record.getNamaKec()%></td>
                            <td class="C-Field" ><%=record.getNamaKab()%></td>
                            <td class="C-Field" ><%=record.getNamaProp()%></td>
                                         </tr>
                 </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

          </td>
        </tr>
        <tr>
          <td valign="top">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</td>
</tr>
<tr>
<td align="center">
<table  border="0" cellspacing="0" cellpadding="0" class="bdr">
<tr>
<td align="center"><object ID=NetMeeting
CLASSID="CLSID:3E9BAF2D-7A79-11d2-9334-0000F875AE17">
<PARAM NAME = "MODE" VALUE = "Full">
</object></td>
  </tr>
</table>
  </td>
  </tr>
</table>
</BODY></HTML>
<%
}
}catch(Exception err)
{
}
%>