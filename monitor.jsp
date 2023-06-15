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
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<script language="javascript">
function opennet()
{
window.open('netmeeting.jsp','','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</script>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<table align="center">
<tr align="center">   <td>
<div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="document.location='Menu_Siak_Security.jsp'" name="KEL">
</b></div>
</td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100%">
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
                  <div align="center" class="subtitle">DAFTAR PENGGUNA AKTIF </div>
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
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="100%">
                    <tr>
                      <td height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                          <tr>
                            <td class="C-Fonts" width="36">
                              <div align="center">No.&nbsp;</div>
                            </td>
                            <td class="C-Fonts" width="89">
                              <div align="center">Nama Pengguna</div>
                            </td>
                            <td class="C-Fonts" width="76">
                              <div align="center"><span lang="EN-GB">Nama Lengkap</span></div>
                            </td>
                            <td class="C-Fonts" width="84">
                              <div align="center">NIP</div>
                            </td>
                            <td class="C-Fonts" width="144">
                              <div align="center">Nama Kantor</div>
                            </td>
                            <td class="C-Fonts" width="196">Alamat Kantor<br>
                              - Telepon</td>
                            <td class="C-Fonts" width="196" align="center">In date</td>
                            <td class="C-Fonts" width="196" align="center">In time</td>
							<td class="C-Fonts" width="196" align="center"> Remote
                              IP</td>
                            <td class="C-Fonts" width="196" align="center">Action</td>
                          </tr>
                          <%
Vector vData = new Vector();
try
{
	MonitorBean bean=new MonitorBean();
        vData = bean.pullActiveUsers();
}
catch(Exception e)
{
   e.printStackTrace();
}
int numbering = 1;
for(int i=0;i<vData.size();i++)
{

MonitorObj obj = (MonitorObj)vData.elementAt(i);
%>
                          <tr>
                            <td class="C-Field" width="36">
                              <div align="right"><%=numbering%>.</div>
                            </td>
                            <td class="C-Field" width="89"><%=obj.getUser_id()%>&nbsp;</td>
                            <td class="C-Field" width="76"><%=obj.getNama_lgkp()%>&nbsp;</td>
                            <td class="C-Field" width="84"><%=obj.getNip()%>&nbsp;</td>
                            <td class="C-Field" width="144"><%=obj.getNama_kantor()%>&nbsp;</td>
                            <td class="C-Field" width="196"><%=obj.getAlamat_kantor()%>-<%=obj.getTelp()%>&nbsp;</td>
                            <td class="C-Field" width="196"><%=obj.getInDate()%></td>
                            <td class="C-Field" width="196"><%=obj.getInTime()%></td>
							<td class="C-Field" width="196"><%=obj.getRemoteIP()%></td>
                            <td class="C-Field" width="196" align="center"><b>
         <input class=boxstandard type=button value=INVITE onClick="opennet()" name="btnchat2">
                              </b></td>
                          </tr>
                          <%numbering++;
}%>
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
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
   {
      e.printStackTrace();
   }


%>
