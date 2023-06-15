<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,siak.security.*,com.db.connection.ServiceController"%>

<%!
    String no_kel,nama_kel,select,id1=null;
    Vector v = null;
%>

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
<SCRIPT language=JavaScript src="scripts/Pengguna_User.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post">

<br><br>

<div align="center"><span class="submenu">Pendaftaran Pengguna/User</span>
</div>
<br><br>
<table width="400" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                  <tr>
                    <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                    <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                    <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                  </tr>
<%
SecurityAuthorize secure = null;
SecurityObject obj = null;
String user_id = request.getParameter("user_id");
System.out.println("USER_id: "+user_id);

try
{
         ServiceController statelessController = ServiceController.getInstance();
         SecurityAuthorizeHome home = (SecurityAuthorizeHome)statelessController.lookup("SecurityAuthorize", SecurityAuthorizeHome.class);
         secure = home.create();
         obj = secure.getDataPenggunaUser(user_id);
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
secure.remove();
}
%>

                  <tr>
                    <td>&nbsp;</td>
                    <td>
                      <table width="100%" border="0" cellspacing="1" cellpadding="5" align="center" class="C-BG">
                        <tr>
                          <td class="C-Field" width="40%"> Nama Lengkap<font color="#000099" ></font></td>
                          <td class="C-Field">
                            <div align="center">:</div>
                          </td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getNama_lgkp()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field"> NIP<font color="#000099" ></font></td>
                          <td class="C-Field">
                            <div align="center">:</div>
                          </td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getNip()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field"> Tempat Lahir<font color="#000099" ></font></td>
                          <td class="C-Field">
                            <div align="center">:</div>
                          </td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getTmpt_lhr()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <%
String tgl_lhr = obj.getTgl_lhr();
System.out.println("tgl_lhr: "+tgl_lhr);
%>
                          <td class="C-Field"> Tanggal Lahir<font color="#000099" ></font></td>
                          <td class="C-Field">
                            <div align="center">:</div>
                          </td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{
String dd="",mm="",yyyy="";
dd = tgl_lhr.substring(0, tgl_lhr.indexOf("-"));
System.out.println("dd: "+dd);
mm = tgl_lhr.substring(tgl_lhr.indexOf("-")+1, tgl_lhr.length()-5);
System.out.println("mm: "+mm);
yyyy = tgl_lhr.substring(tgl_lhr.length()-4, tgl_lhr.length());
System.out.println("yyyy: "+yyyy);

out.print(tgl_lhr);
%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field">Jenis Kelamin<font color="#000099" ></font></td>
                          <td class="C-Field">:</td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getJenis_klmn()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field">Pangkat/Golongan<font color="#000099" ></font></td>
                          <td class="C-Field">:</td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getGologan()+"/"+obj.getPengkat()%>
                            <%}
%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field">Jabatan<font color="#000099" ></font></td>
                          <td class="C-Field">:</td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getJabatan()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field">Nama Kantor<font color="#000099" ></font></td>
                          <td class="C-Field">:</td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getNama_kantor()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field">Alamat Kantor<font color="#000099" ></font></td>
                          <td class="C-Field">:</td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getAlamat_kantor()%>
                            <%}%>
                          </td>
                        </tr>
                        <tr>
                          <td class="C-Field">Telepon/Fax<font color="#000099" ></font></td>
                          <td class="C-Field">:</td>
                          <td class="C-Field">
                            <%if(user_id!=null && obj!=null)
{%>
                            <%=obj.getTelp()%>
                            <%}%>
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
<br><br>
                        <div align="center"><b>
                          <input class=boxstandard type="button" value=KELUAR name="kel" onClick="self.close()">
                          </b></div>
</form>
</BODY></HTML>
<%
}
else
{
out.println("<script language='javascript'>{self.close();opener.location='index.jsp';}</script>");
}
}catch(Exception e)
   {
    System.out.print("Exception in Pengguna_User = " + e);
out.println("<script language='javascript'>{self.close();opener.location='index.jsp';}</script>");
  }
%>
