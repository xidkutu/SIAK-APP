<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%!
UserInfo1 record=null;
%>
<%
try
   {
record=(UserInfo1)session.getAttribute("remoteRef");
 if (record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="/deskservlet">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
</tr><tr>
<td>
        <table width="625" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
          <tr>
            <td valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="35">
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="4"><b>Register
                            Case </b></font><br>
                          </div>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td valign="top">
                    <table width="400" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                      <tr>
                        <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                        <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                        <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>
                          <table width="100%" border="0" cellspacing="1" cellpadding="5" align="center" class="C-BG">
                            <tr>
                              <td class="C-Field" nowrap>Category</td>
                              <td class="C-Field">:</td>
                              <td class="C-Field">
                                <select name="catgry" class=boxdefault>
                                  <option value="1">Communication</option>
                                  <option value="2">Hardware</option>
                                  <option value="3">OS</option>
                                  <option value="4">IE Installation </option>
                                  <option value="5">Patch</option>
                                  <option value="6">Telephone</option>
                                  <option value="7">SIAK</option>
                                  <option value="8">Others</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td class="C-Field" nowrap>Prioritas</td>
                              <td class="C-Field">:</td>
                              <td class="C-Field">
                                <select name="prio" class=boxdefault>
                                  <option value="1" selected>Low</option>
                                  <option value="2">Medium</option>
                                  <option value="3">High</option>
                                </select>
                                <b> </b> </td>
                            </tr>
                            <tr>
                              <td class="C-Field" nowrap> Deskripsi Masalah</td>
                              <td class="C-Field">
                                <div align="center">:</div>
                              </td>
                              <td class="C-Field">
                                <textarea  class=boxdefault name="pr_desc" cols="75" rows="5"></textarea>
                              </td>
                            </tr>
                            <tr>
                              <td class="C-Field" nowrap> Contoh Data</td>
                              <td class="C-Field">
                                <div align="center">:</div>
                              </td>
                              <td class="C-Field">
                                <textarea  class=boxdefault name="sample" cols="75" rows="5"></textarea>
                              </td>
                            </tr>
                            <tr>
                              <td class="C-Field" nowrap>Additional Comments</td>
                              <td class="C-Field">:</td>
                              <td class="C-Field">
                                <textarea  class=boxdefault name="note" cols="75" rows="5"></textarea>
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
             <td valign="top" align="center">
			 <%
 if (request.getParameter("action")!=null)
       {
 if (request.getParameter("action").equals("Y"))
 {
%>

                        <font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
                        <font color="#D70960" size="4"> <b>Sudah daftar!</b></font>
                        </font>

                      <%
 }
else if (request.getParameter("action").equals("N"))
 {
%>

                        <font face="Verdana, Arial, Helvetica, sans-serif" color="#000000">
                        <font color="#D70960" size="4"><b>Silakan coba lagi!</b></font></font>

                      <%
  }
       }
%>
             <table width="316" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                      <tr>
                        <td width="34">
                          <div align="center"><b> </b></div>
                        </td>

                        <td width="118">
                          <div align="center"><b> </b></div>
                          <div align="center"><b>
                            <input class=boxstandard type="submit" value="Daftar" name="sim">
                            </b></div>
                        </td>

                        <td width="164">
                          <div align="center">
                            <input class=boxstandard type="button" value="KELUAR" name="kel" onClick="document.location='<%=record.getModRefFile()%>'">
                            </div>
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
</form>
</BODY></HTML>
<%
}
else
{
response.sendRedirect(record.getModRefFile());
}
}
 catch(Exception e)
   {
   }
%>
