<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@ page import="javax.ejb.*,javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,java.math.BigDecimal,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan"%>
<%@include file="Global.jsp"%>

<%!
 UserInfo1 record = null;
 String select,flag=null;
 String jabatan,nama_lur,nip_lur;
 int nokec,nokab,noprop;
 Vector v;
ServiceController factory=null;
  LoginHome home;
  Login remote;
%>

<%
v = new Vector();

try
{

record=(UserInfo1)session.getAttribute("remoteRef");

  if(record != null)
     {
    flag = request.getParameter("n");

    no_kec = record.getNoKec().trim();
   no_kab = record.getNoKab().trim();
   no_prop = record.getNoProp().trim();
   nokec = Integer.parseInt(no_kec);
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
<SCRIPT language=JavaScript src="scripts/newwilayah2.js">
</SCRIPT>
<style type="text/css" media="all">
@import "Templates/global.css";
.style2 {color: #000000}
</style>

<script src="scripts/jquery.js" type="text/javascript"></script>
<script src="scripts/jtip.js" type="text/javascript"></script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form action="Update_Setup_KK_KTP.jsp" method="post" enctype="multipart/form-data" name="form1">
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
                                Penandatangan KK/KTP/Biodata WNI</font></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="1"><span class="style2"></span>
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>                            </td>
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
                                class=boxdefault size=4 name=no_prop maxlength="2" value="<%=record.getNoProp().trim()%>" onFocus="this.blur()">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_prop value="<%=record.getNamaProp().trim()%>" maxlength="40" onFocus="this.blur()">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Kode-Nama Kabupaten/Kota</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=4 name=no_kab value="<%=record.getNoKab().trim()%>" maxlength="2" onFocus="this.blur()">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_kab value="<%=record.getNamaKab().trim()%>" maxlength="40" onFocus="this.blur()">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Kode-Nama Kecamatan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=4 name=no_kec value="<%=record.getNoKec().trim()%>" maxlength="2" onFocus="this.blur()">
                            </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=22 name=nama_kec value="<%=record.getNamaKec().trim()%>" maxlength="40" onFocus="this.blur()">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Kode-Nama Desa/Kelurahan</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field">
                              <input
                                class=boxdefault size=4 name=no_kel maxlength="2" onFocus="this.blur()">
                            </td>
                            <td class="C-Field" valign="middle">
                  <select
 onChange="form1.no_kel.value=form1.nama_kel.options[this.selectedIndex].value;data(no_kel.value)"
                  name=nama_kel class="boxdefault">
<option>-- Pilih Desa/Kelurahan --</option>
<%
Vector vDataKelurahan = getDataKelurahan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim());

for(int i=0;i<vDataKelurahan.size();i++)
{
%>
<option value="<%=((DataKelurahan)vDataKelurahan.elementAt(i)).getNo_kel()%>"> <%=((DataKelurahan)vDataKelurahan.elementAt(i)).getNama_kel()%></option>
<%
}
%>
</select>
                            </td>
                          </tr>

                        <tr valign="top">
                            <td class="C-Field">Jenis Dokumen </td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <select name="jenis"
                  onChange="return validateKK()"
                  class="boxdefault">
                                <option selected>-- Pilih Jenis Dokumen --</option>
                                <option>1 - KK/Biodata</option>
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
                                      <input type="radio" name="radiobutton" value="Bupati" onClick="return radioValid1()" disabled>
                                    </div>
                                  </td>
                                  <td>Bupati</td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="center">
                                      <input type="radio" name="radiobutton" value="Walikota" onClick="return radioValid2()" disabled>
                                    </div>
                                  </td>
                                  <td>Walikota</td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="center">
                                      <input type="radio" name="radiobutton" value="Camat" onClick="return radioValid3()" disabled>
                                    </div>
                                  </td>
                                  <td>Camat</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Jabatan di Kab/Kota,Kec</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=jab_kec value="<%=record.getKecJabata()%>" maxlength="100" onKeyUp="return char(form1.jab_kec)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Nama Pejabat di Kab/Kota,Kec</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=nama_pejbt_kec2 value="<%=record.getKecNamaPej()%>" maxlength="60" onKeyUp="return char(form1.nama_pejbt_kec2)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">NIP Pejabat di Kab/Kota,Kec</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
<input class=boxdefault size=9 name=nip_pejbt_cmt value="<%=record.getKecNipPej()%>" maxlength="9" onKeyUp="return num(form1.nip_pejbt_cmt)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Jabatan di Desa/Kelurahan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=jab_kel maxlength="40" onKeyUp="return char(form1.jab_kel)" disabled>
                            </td>
                          </tr>
<script language="JavaScript">
  function data(kelcode)
  {
document.all['jab_kel'].value= getKelurahanItem(document.all['no_prop'].value, document.all['no_kab'].value, document.all['no_kec'].value, kelcode, 5);
document.all['nama_pejbt_kel'].value= getKelurahanItem(document.all['no_prop'].value, document.all['no_kab'].value, document.all['no_kec'].value, kelcode, 6);
document.all['nip_lrh'].value= getKelurahanItem(document.all['no_prop'].value, document.all['no_kab'].value, document.all['no_kec'].value, kelcode, 7);
  }
</script>
                          <tr valign="top">
                            <td class="C-Field">Nama Pejabat di Desa/Kelurahan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=nama_pejbt_kel maxlength="60" onKeyUp="return char(form1.nama_pejbt_kel)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">NIP Lurah</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=9 name=nip_lrh maxlength="9" onKeyUp="return num(form1.nip_lrh)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">
                                Tandatangan Pejabat
                                 <%
                                 String img="";
                                 if (request.getParameter("pj")!=null)
                                 {
                                   img=request.getParameter("pj");
                                   %>
                                   <img src="http://siakoffline.depdagri.go.id/<%=img%>" alt="" width='52' height='65' border='0'/>
                                   <%
                                 }
                                 %>
                            </td>
                            <td class="C-Field">&nbsp;</td>
                            <td class="C-Field" colspan="2">
                              <div align="left">
                                <input name="file" type="file" class=boxdefault  size="20">
					          </div></td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
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
                  <table width="300" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type="submit" value=SIMPAN name="sim" onClick="return validateKK1()" disabled>
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b> </b></div>
                        <div align="center"><b>
                          <input class=boxstandard type=button value="UBAH" name="ubah" onClick="edit()">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type="button" value=KELUAR name="kel" onClick="document.location='WNI_Menu.jsp'">
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
{%>
<script language="javascript" type="">
//////////alert("Data sudah disimpan !")
form1.sim.disabled=true
</script>
<%=printInfo("Data sudah disimpan !")%>

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
