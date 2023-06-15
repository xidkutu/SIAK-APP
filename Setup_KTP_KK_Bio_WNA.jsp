<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.ejb.*,javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*,java.math.BigDecimal"%>
<%@include file="Global.jsp"%>

<%!
 UserInfo1 record = null;
 String flag=null;
 int nokab,noprop;
LoginHome home;
Login remote;
ServiceController factory=null;
%>

<%

try
{
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
   flag = request.getParameter("n");


   no_kab = record.getNoKab().trim();
   no_prop = record.getNoProp().trim();

   nokab = Integer.parseInt(no_kab);
   noprop = Integer.parseInt(no_prop);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Update_KK_KTP_WNA.jsp">
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
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="45" valign="middle">
             <div align="center"><font class="submenu">Setup
                           Penandatangan AKTA/KK/KTP/Biodata WNA (KITAP)</font></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">&nbsp; </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="465" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center" class="C-BG">
                          <tr valign="top">
                            <td class="C-Field" width="210">Kode-Nama Provinsi</td>
                            <td class="C-Field" width="2">: </td>
                            <td class="C-Field" width="2">
                              <input
                                class=boxdefault size=2 name=no_prop maxlength="2" value="<%=record.getNoProp().trim()%>" onFocus="this.blur()">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_prop maxlength="40" value="<%=record.getNamaProp().trim()%>" maxlength="40" onFocus="this.blur()">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Kode-Nama Kabupaten/Kota</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=2 name=no_kab maxlength="2" value="<%=record.getNoKab().trim()%>" maxlength="2" onFocus="this.blur()">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_kab maxlength="40" value="<%=record.getNamaKab().trim()%>" maxlength="40" onFocus="this.blur()">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Jenis Dokumen </td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <select name="jenis"
                  onChange="return wnavalidate()"
                  class="boxdefault">
                                <option selected>-- Pilih Jenis Dokumen --</option>
                                <option>1 - AKTA/KK/Biodata</option>
                                <option>2 - KTP</option>

                              </select>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Atas Nama Pejabat </td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <table width="125" border="0" cellspacing="1" cellpadding="1">
                                <tr>
                                  <td>
                                    <div align="center">
                                      <input type="radio" name="radiobutton" value="Bupati" onClick="return radioValid11()" disabled>
                                    </div>
                                  </td>
                                  <td>Bupati</td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="center">
                                      <input type="radio" name="radiobutton" value="Walikota" onClick="return radioValid22()" disabled>
                                    </div>
                                  </td>
                                  <td>Walikota</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
<%
  factory=ServiceController.getInstance();
  home = (LoginHome)factory.lookup("Login",LoginHome.class);
  remote = home.create();
  record=(UserInfo1)remote.validate(record.getUserId(),record.getPassword());

  if (record!=null)
    {
       session.setAttribute("remoteRef", record);
       remote.remove();
       remote=null;
       factory=null;
    }
%>
                          <tr valign="top">
                            <td class="C-Field">Jabatan di Kabupaten/Kota</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=jab_kec value="<%= record.getKabJabatan()%>" maxlength="120" onKeyUp="return char(form1.jab_kec)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Nama Pejabat di Kabupaten/Kota</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=nama_pejbt_kec2 value="<%= record.getKabNamaPej()%>" maxlength="60" onKeyUp="return char(form1.nama_pejbt_kec2)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">NIP Pejabat di Kabupaten/Kota</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=9 name=nip_pejbt_cmt value="<%= record.getKabNipPej()%>" maxlength="9" onKeyUp="return num(form1.nip_pejbt_cmt)" disabled>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td width="5" height="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="45" valign="bottom">
                  <table width="350" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=submit value=SIMPAN name="sim" onClick="return wnavalidate1()" disabled>
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b> </b></div>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=UBAH name="ubah" onClick="edit1()">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="kel" onClick="document.location='<%=record.getModRefFile()%>'">
                          </b></div>
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
<%
if(flag != null)
{
if(flag.equals("1"))
{
%>
<script language="javascript">
form1.sim.disabled=true
</script>
<%=printInfo("Data sudah disimpan !")%>
<%
}
}%>
<p class="linkyellow">&nbsp;</p>

</form>
</BODY></HTML>
<%
}
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