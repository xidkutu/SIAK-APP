<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan"%>
<%@ include file="Global.jsp"%>

<%!
 UserInfo1 record = null;
 String select,flag=null;
 PenanKelValue pkv = null;
 ServiceController controller;
 int nokel,nokec,nokab,noprop;
%>

<%
try
{
record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
   flag = request.getParameter("n");

    controller = ServiceController.getInstance();
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
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Update_Setup_KK_KTP.jsp">
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

<select onChange="form1.no_kel.value=form1.nama_kel.options[this.selectedIndex].value;data()"
name=nama_kel boxdefault2 class="boxdefault">
<option>-- Pilih Desa/Kelurahan --</option>
<%
Vector vDataKelurahan = getDataKelurahan(no_prop, no_kab, no_kec);
if (vDataKelurahan==null) vDataKelurahan = new Vector();
for(int i=0;i<vDataKelurahan.size();i++)
{
%>
        <option value="<%=((kartukeluarga.DataKelurahan)vDataKelurahan.elementAt(i)).getNo_kel()%>">
        <%=((kartukeluarga.DataKelurahan)vDataKelurahan.elementAt(i)).getNama_kel()%></option>
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
                            <td class="C-Field">Jabatan di Kecamatan</td>
                            <td class="C-Field">: </td>
                            <td class="C-Field" colspan="2">

                             <input
                                class=boxdefault size=27 name=jab_kec value="<%= record.getKecJabata().trim()%>" maxlength="40" onKeyUp="return char(form1.jab_kec)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Nama Pejabat di Kecamatan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=nama_pejbt_kec2 value="<%= record.getKecNamaPej().trim()%>" maxlength="60" onKeyUp="return char(form1.nama_pejbt_kec2)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">NIP Pejabat di Kecamatan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=9 name=nip_pejbt_cmt value="<%= record.getKecNipPej().trim()%>" maxlength="9" onKeyUp="return num(form1.nip_pejbt_cmt)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">

                         <td class="C-Field">Jabatan di Kelurahan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=jab_kel value="<%=pkv.getJabatan().trim()%>" maxlength="40" onKeyUp="return char(form1.jab_kel)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">Nama Pejabat di Kelurahan</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=27 name=nama_pejbt_kel value="<%=pkv.getNamaLur().trim()%>" maxlength="60" onKeyUp="return char(form1.nama_pejbt_kel)" disabled>
                            </td>
                          </tr>
                          <tr valign="top">
                            <td class="C-Field">NIP Lurah</td>
                            <td class="C-Field">:</td>
                            <td class="C-Field" colspan="2">
                              <input
                                class=boxdefault size=9 name=nip_lrh maxlength="9" value="<%=pkv.getNipLur().trim()%>" onKeyUp="return num(form1.nip_lrh)" disabled>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
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
                          <input class=boxstandard type="submit" value=SIMPAN name="sim" onClick="return validateKK1()">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b> </b></div>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=UBAH name="ubah">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="kel">
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
<script language="javascript">
//alert("Data sudah disimpan !")
</script>
<%}}%>
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