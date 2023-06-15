<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="CommonFile.jsp"%>
<%
ServiceController factory=null;
Individu record=null;
Per_WnaHome home=null;
Per_Wna remote=null;
String nik="",nap="",nip="",nprop="",nkab="",nkec="",nkel="";
Vector get_wna=null;
int i=0,j=0;
    UserInfo1 record1=null;
%>
<%
try
  {
   record1=(UserInfo1)session.getAttribute("remoteRef");

if(record1!=null)
{

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">

<%
nik=request.getParameter("nik");
nprop=request.getParameter("no_prop");
nkab=request.getParameter("no_kab");

nap=record1.getNamaPetugas().toString().toUpperCase();
nip=record1.getNipPetugas();
 factory=ServiceController.getInstance();

  home = (Per_WnaHome) factory.lookup("Per_Wna",Per_WnaHome.class);

    if(home!=null)
    {
    remote = home.create();
    get_wna = remote.getBiodataWna(nik, nprop, nkab);
    j=get_wna.size();

if(get_wna.isEmpty())
{
response.sendRedirect("Perubahan_Wna.jsp?flag=1");
}
else
{
record=(Individu)get_wna.elementAt(0);

 if ((record.getcflag()!=null) && !record.getcflag().trim().equals("Y"))
    {
%>
<form name="wnabiodata" method=post>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
<td background="images/v_bg_header.gif"><jsp:include page="top.html"/> </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3" height="387">
                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="35">
                              <div align="center"><span class="submenu">Pendaftaran
                                Perubahan Biodata WNA</span><br>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <table width="753" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah<br>
                                <font class="linkyellow">(Region data)</font>
                                </span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td width="133">Kode-Nama Provinsi<br>
                              <span class="linkyellow">(Code - Province)</span>
                            </td>
                            <td width="5">:</td>
                            <td width="38">
<input class=boxdefault size=4 name=no_prop  maxlength="2" value="<%=record1.getNoProp()%>">
                            </td>
                            <td width="164">
<input class=boxdefault size=22 name=nama_prop maxlength="60" value="<%=record1.getNamaProp().toString().toUpperCase()%>">
                            </td>
                            <td width="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="167">Kode-Nama Kabupaten/Kota<br>
                              <span class="linkyellow">(Code - Regency/Municipality)</span>
                            </td>
                            <td width="6">:</td>
                            <td width="38">
<input class=boxdefault size=4 name=no_kab  maxlength="2" value="<%=record1.getNoKab()%>">
                            </td>
                            <td width="135">
<input  class=boxdefault size=22 name=nama_kab  maxlength="60" value="<%=record1.getNamaKab().toString().toUpperCase()%>">
                            </td>
                          </tr>

                          <tr>
                            <td width="133">Kode-Nama Kecamatan<br>
                              <span class="linkyellow">(Code - Sub District)</span>
                            </td>
                            <td width="5">:</td>
                            <td width="38">
<input class=boxdefault size=4 name=no_kec  maxlength="2" value="<%=record.getNo_kec()%>">
                            </td>
                            <td width="164">
<input class=boxdefault size=22 name=nama_kec maxlength="60" value="<%=record.getNama_kec().toString().toUpperCase()%>">
                            </td>
                            <td width="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="167">Kode-Nama Kelurahan/Desa<br>
                              <span class="linkyellow">(Code - Village)</span>
                            </td>
                            <td width="6">:</td>
                            <td width="38">
<input class=boxdefault size=4 name=no_kab  maxlength="2" value="<%=record.getNo_kel()%>">
                            </td>
                            <td width="135">
<input  class=boxdefault size=22 name=nama_kab  maxlength="60" value="<%=record.getNama_kel().toString().toUpperCase()%>">
                            </td>
                          </tr>

                          <tr>
                            <td height="10" width="133"><img src="images/dot.gif" width="1" height="10"></td>
                            <td width="5">&nbsp;</td>
                            <td width="38">&nbsp;</td>
                            <td width="164">&nbsp;</td>
                            <td width="1">&nbsp;</td>
                            <td width="167">&nbsp;</td>
                            <td width="6">&nbsp;</td>
                            <td width="38">&nbsp;</td>
                            <td width="135">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table width="550" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="25">
                              <div align="center"><span class="subtitle">Data
                                Keluarga</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                                </font><font class="linkyellow">(Family data)</font></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="150"> Nomor Kartu Keluarga<br>
                              <span class="linkyellow">(Family Card Number)</span>
                            </td>
<input type = hidden name=kk>
                            <td valign="top" width="5">:</td>
<td valign="top"> <b><%=record.getNoKk().toString().toUpperCase()%></b>
                             </td>
                          </tr>
                          <tr>
                            <td valign="top" width="165"> Nama Kepala Keluarga<br>
                              <span class="linkyellow">(Head of Family Name)</span></td>
                            <td valign="top" width="5">:</td>
<td valign="top"><b><%=record.getNamaKep().toString().toUpperCase()%></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="125"> Alamat Keluarga<span class="linkyellow"><br>
                              (Family Address)</span></td>
                            <td valign="top" width="5">:</td>
<td valign="top"><b><%=record.getAlamat().toString().toUpperCase()%></b></td>
                          </tr>
                        </table>
<input type=hidden value=<%=record.getNoKk()%> name=nokk>
<input type=hidden value="<%=record.getNamaKep()%>" name=nkap>
<input type=hidden value="<%=record.getAlamat()%>" name=ala>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="top">
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="top">
                                    <div align="center"><span class="subtitle">Data
                                      Individu</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                                      </font><font class="linkyellow">(Personal
                                      Data)</font></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">

                              <table width="100%" border="0" cellspacing="5" cellpadding="2">


                                <tr>
                                  <td valign="top">Nomor Induk Kependudukan<br>
                                    <span class="linkyellow">(Population Identity Number)</span></td>
                                  <td valign="top"> :</td>


                                  <td valign="top"><b> <i><b>
                                   <%=record.getNik()%>
<input type="hidden" value="<%=record.getNik()%>" name="nik">
                                    <i><b><i><b>
<%--<input class=boxstandard onClick="return edi()" type=submit value=PERIKSA name="button2232" >--%>
                                    </b></i></b></i></b></i></b></td>

                                  <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
                                  <td>Nama Keluarga<font class="asterish">*</font>
<br>
                                    <span class="linkyellow">(Family Name)</span></td>
                                  <td valign="top">:</td>
<td width="210" valign="top">
<input value="<%=record.getNamaKlrga().toString().toUpperCase()%>" class=boxdefault size=22 name=nama_klrga maxlength="60">
                                  </td>
                                </tr>

                                <tr>
                                  <td>Nama Pertama<font class="asterish">*</font><br>
                                    <span class="linkyellow">(First Name) </span></td>
                                  <td valign="top"> :</td>
                                  <td valign="top"> <b>
<input value="<%=record.getNamaPertma().toString().toUpperCase()%>" class=boxdefault size=22 name=nama_pertma maxlength="60">
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Jenis Kelamin<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Sex) </span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top"><font face="Verdana" size="2">
                                   <%=getClKelamin(record.getJnsKlm())%>
<%--<select class="boxdefault" name="jenis_klmin" >
                                      <option selected>-- Pilih Jenis Kelamin
                                      --</option>
                                      <option>1 - Laki-laki</option>
                                      <option>2 - Perempuan</option>
                                    </select>--%>

<input type="hidden" size=22 name=jenis_klmin onFocus="this.blur()" maxlength="10" value="<%=record.getJnsKlm()%>">
                                    </font> </td>
                                </tr>
                                <tr>
                                  <td>Tempat Lahir<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Place of Birth)
                                    </span></td>
                                  <td valign="top">:</td>
                                  <td valign="top"> <b>
 <input value=<%=record.getTmpLhr()%> onKeyUp="return temlhr()"  class=boxdefault size=22 name=tmpt_lhr maxlength="60">
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Tanggal Lahir<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Date of Birth) </span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
                                    <table width="100" border="0" cellspacing="3" cellpadding="0">
                                      <tr>
                                        <td>
 <%=record.getDdTglLhr()%>/<%=record.getMmTglLhr()%>/<%=record.getYyTglLhr()%>

<input name="t1" value="<%=record.getDdTglLhr()%>"  type="hidden">
                                        </td>
                                        <td></td>
                                        <td>
 <input name="t2" value="<%=record.getMmTglLhr()%>"  type="hidden">
                                        </td>
                                        <td></td>
                                        <td>
 <input name="t3" value="<%=record.getYyTglLhr()%>"  type="hidden">
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td>Kewarganegaraan<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Nationality) </span></td>
                                  <td valign="top">:</td>
                                  <td valign="top"><b>
<input value=<%=record.getKwrmgr().toString().toUpperCase()%> onKeyUp="return kwar()"  class=boxdefault size=22 name=kwrngrn maxlength="40">
                                    </b> </td>
                                  <td width="12">&nbsp;</td>
                                  <td>Agama<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Religion)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td> <font face="Verdana" size="2">
<select class="boxdefault" name="agama" onchange="return aga()">
                                           <option selected value="Pilih Agama">-- Pilih Agama --</option>
                                            <option value="Islam">Islam</option>
                                            <option value="Kristen/Christian">Kristen/Christian</option>
                                            <option value="Katholik/Catholic">Katholik/Catholic</option>
                                            <option value="Hindu">Hindu</option>
                                            <option value="Budha/Buddhism">Budha/Buddhism</option>
                                            <option value="Lainnya/Others">Lainnya/Others</option>
                                          </select>
                                          </font></td>
                                        <td>
 <input class=boxdefault disabled size=7 name=agama_lainnya value="Lainnya">
                                        </td>

<%
if (getAgamaIndexWna(record.getAga())==6)
 {
%>
<script language="javascript">
document.all['agama_lainnya'].value="<%=record.getAga()%>"
document.all['agama_lainnya'].disabled=false
document.all['agama'].selectedIndex=<%=getAgamaIndexWna(record.getAga())%>
</script>
<%
}
else
{
%>
<script language="javascript">
document.all['agama'].selectedIndex=<%=getAgamaIndexWna(record.getAga())%>
</script>
<%
}
%>                                     </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td>Golongan Darah<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Blood Type)</span></td>
                                  <td valign="top">:</td>
                                  <td valign="top"> <b>
<select class="boxdefault" name="gol_drh">
                                      <option selected value="0" >-- Pilih Golongan Darah
                                      --</option>
                                      <option value="1">1. A</option>
                                      <option value="2">2. B</option>
                                      <option value="3">3. O</option>
                                      <option value="4">4. AB</option>
                                      <option value="5">5. A+</option>
                                      <option value="6">6. A-</option>
                                      <option value="7">7. B+</option>
                                      <option value="8">8. B-</option>
                                      <option value="9">9. O+</option>
                                      <option value="10">10. O-</option>
                                      <option value="11">11. AB+</option>
                                      <option value="12">12. AB-</option>
                                      <option value="13">13 - Tidak Tahu-</option>
                                    </select>
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Status Perkawinan<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Marital Status)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
<select class="boxdefault" name="stat_kwn" onChange="return stpwn()">
                                      <option selected value="0">-- Pilih Status Perkawinan
                                      --</option>
                                      <option value="1">1 - Married</option>
                                      <option value="2">2 - Single</option>
                                      <option value="3">3 - Divorce</option>
                                      <option value="4">4 - Other</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td>Status Hubungan Dalam Keluarga<font class="asterish">*</font><br>
                                    <span class="linkyellow">(<font face="Verdana">Relationship
                                    within Family</font>)</span></td>
                                  <td valign="top">:</td>
                                  <td valign="top"> <b>
 <select class="boxdefault" name="stat_hbkel">
<%if (record.getStatHbkel().trim().equals("1"))
{
%>
<option selected value="0">-- Pilih Status Hub. dalam Keluarga --</option>
<option value="1">1 - Kepala Keluarga/Head of Family</option>
<%
}
else
 {
%>
<option></option>
<option selected value="0">-- Pilih Status Hub. dalam Keluarga --</option>
<option value="2">1 - Suami/Husband</option>
<option value="3">2 - Istri/Wife</option>
<option value="4">3 - Anak/Child</option>
<option value="5">4 - Menantu/Child in Law</option>
<option value="6">5 - Cucu/Grand Child</option>
<option value="7">6 - OrangTua/Parent</option>
<option value="8">7 - Mertua/Parent in Law</option>
<option value="9">8 - Famili Lain/Relative</option>
<option value="10">9 - Pembantu/Housemade</option>
<option value="11">10 - Lain/Others</option>
<%
 }
%>
                                </select>
                         <script language="javascript">
                            wnabiodata.stat_hbkel.options[<%=record.getStatHbkel()%>].selected=true;
                         </script>
                                        <%
                                 if (record.getStatHbkel().trim().equals("1"))
                                            {
                                        %>
                                            <script language="javascript">
                                            wnabiodata.stat_hbkel.disabled=true;
                                            </script>
                                        <%
                                            }
                                          %>

                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Pendidikan Terakhir<font class="asterish">*</font><br>
                                    <span class="linkyellow">(Last Education)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
<select class="boxdefault" name="pddk_akh">
                                      <option selected value="0"> -- Pilih Pendidikan Terakhir
                                      --</option>
                                      <option value="1">1 - Elementary</option>
                                      <option value="2">2 - Junior High School</option>
                                      <option value="3">3 - Senior High School</option>
                                      <option value="4">4 - Diploma</option>
                                      <option value="5">5 - Bachelor</option>
                                      <option value="6">6 - Master</option>
                                      <option value="7">7 - Philosophy of Doctor</option>
                                      <option value="8">8 - Others</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td>Jenis Pekerjaan<span class="linkyellow"><font class="asterish">*</font><br>
                                    (Occupation)</span></td>
                                  <td valign="top">:</td>
                                  <td valign="top"> <b>
<select class="boxdefault" name="jenis_pkrjn">
                                      <option selected value="0">-- Pilih Jenis Pekerjaan
                                      --</option>
                                      <option value="1">1 - Trading and Industry</option>
                                      <option value="2">2 - Forestry</option>
                                      <option value="3">3 - Mining and Energy</option>
                                      <option value="4">4 - Public Work</option>
                                      <option value="5">5 - Farming</option>
                                      <option value="6">6 - Religion</option>
                                      <option value="7">7 - Bank and Financial</option>
                                      <option value="8">8 - Health and Society</option>
                                      <option value="9">9 - Tourism</option>
                                      <option value="10">10 - Transportation and Communication</option>
                                      <option value="11">11 - Culture and Education</option>
                                      <option value="12">12 - Others</option>
                                    </select>
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td valign="top">&nbsp;</td>
                                  <td valign="top">&nbsp;</td>
                                  <td width="210" valign="top">&nbsp;</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                  <td height="10">
                                    <div align="center"><img src="images/dot.gif" width="1" height="10" hspace="5"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="1">
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="25">
                                    <div align="center"><span class="subtitle">Data
                                      Keimigrasian</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                                      </font><span class="linkyellow">(Immigration
                                      Data)</span></div>
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
                                <tr valign="top">
                                  <td>
                                    <table width="100%" border="0" cellspacing="5" cellpadding="5">
                                      <tr valign="top">
                                        <td width="24%">Datang dari<span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font color="#000099" class="asterish">*</font></span><br>
                                          <span class="linkyellow">(Coming from)</span></td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
<input value=<%=record.getDatngDari().toString().toUpperCase()%> onKeyUp="return dadar()" class=boxdefault size=22 name=datng_dari maxlength="60">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Tujuan
                                          Kedatangan<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Purposed Visit)
                                          </span></span></td>
                                        <td width="29%"> <b>
<input value=<%=record.getTujuanDtng().toString().toUpperCase()%> onKeyUp="return tuj()"  class=boxdefault size=22 name=tujuan_dtng maxlength="150">
                                          </b></td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%"> <span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Nomor
                                          Paspor<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Passport Number)</span>
                                          </span> </td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
                                      <%=record.getNoPas().toString().toUpperCase()%>
<input  type="hidden" name=num_paspor value="<%=record.getNoPas().toString().toUpperCase()%>">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tanggal Paspor<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Issue)</span></td>
                                        <td width="29%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
 <input value=<%=record.getDdTglPas()%> class=boxdefault size=2 name=tp1 onKeyUp="return ctp1()" maxlength="2">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input value=<%=record.getMmTglPas()%> class=boxdefault size=2 name=tp2 onKeyUp="return ctp2()" maxlength="2">
                                              </td>
                                              <td>/</td>
                                              <td>
<input value=<%=record.getYyTglPas()%> class=boxdefault size=4 name=tp3 onKeyUp="return ctp3()" maxlength="4">
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Tanggal Berakhir Paspor<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Passport
                                          Expire)</span></td>
                                        <td width="22%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input value=<%=record.getDdTglAkhPas() %> class=boxdefault size=2 name=tb1 onKeyUp="return ctb1()" maxlength="2">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input value=<%=record.getMmTglAkhPas() %> class=boxdefault size=2 name=tb2 onKeyUp="return ctb2()" maxlength="2">
                                              </td>
                                              <td>/</td>
                                              <td>
<input value=<%=record.getYyTglAkhPas() %> class=boxdefault size=4 name=tb3 onKeyUp="return ctb3()" maxlength="4">
                                              </td>
                                            </tr>
                                          </table>
                                          <b></b> </td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Dokumen Imigrasi<br>
                                          <span class="linkyellow">(Immigration
                                          Document)<font color="#000099" class="asterish">*</font></span></td>
                                        <td width="29%"><font face="Verdana" size="2">
<select class="boxdefault" name="dok_imgr" >
                                            <option selected value="0">-- Pilih Dokumen
                                            Imigrasi --</option>
                                            <option value="1">1. KITAS/Limited Stay Permit
                                            Card</option>
                                            <option value="2">2. KITAP/Permanent Stay Permit
                                            Card</option>
                                          </select>
                                          </font> </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Nomor Dokumen<br>
                                          <span class="linkyellow">(Register Number)<font class="asterish">*</font></span>
                                        </td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
<input value=<%=record.getNodok().toString().toUpperCase()%> onKeyUp="return numdoc()" class=boxdefault size=22 name=num_dok maxlength="40">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tempat Diterbitkan<span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font color="#000099" class="asterish">*</font></span><br>
                                          <span class="linkyellow">(Place of Issue)</span></td>
                                        <td width="29%"><font face="Verdana" size="2"><b>
<input value=<%=record.getTmptDtbt().toString().toUpperCase()%> class=boxdefault size=22 onKeyUp="return tmbit()" name=tmpt_dtbit maxlength="40">
                                          </b></font> </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Tanggal Penerbitan<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Issue)</span></td>
                                        <td width="22%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input value=<%=record.getDdTglDtbt()%> class=boxdefault size=2 onKeyUp="return ctt1()" name=tt1 maxlength="2">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input value=<%=record.getMmTglDtbt()%> class=boxdefault size=2 onKeyUp="return ctt2()" name=tt2 maxlength="2">
                                              </td>
                                              <td>/</td>
                                              <td>
<input value=<%=record.getYyTglDtbt()%> class=boxdefault size=4 onKeyUp="return ctt3()" name=tt3 maxlength="4">
                                              </td>
                                            </tr>
                                          </table>
                                          <b> </b> </td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tanggal Berakhir Dokumen<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Document
                                          Expire) </span></td>
                                        <td width="29%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input value=<%=record.getDdTglAkhDok()%> class=boxdefault size=2 onKeyUp="return ctl1()" name=tl1 maxlength="2">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input value=<%=record.getMmTglAkhDok()%> class=boxdefault size=2 onKeyUp="return ctl2()" name=tl2 maxlength="2">
                                              </td>
                                              <td>/</td>
                                              <td>
 <input value=<%=record.getYyTglAkhDok()%> class=boxdefault size=4 onKeyUp="return ctl3()" name=tl3 maxlength="4">
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Tempat Kedatangan Pertama<font class="asterish">*</font><br>
                                          <span class="linkyellow">(First Place
                                          of Arrival)</span></td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
<input value=<%=record.getTmptDtngPert().toString().toUpperCase()%> class=boxdefault size=22 name=tmpt_dtng_pert onKeyUp="return tdper()" maxlength="120">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tanggal Kedatangan Pertama<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(First Date
                                          Place of Arrival)</span></td>
                                        <td width="29%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input value=<%=record.getDdTglDtngPert()%> class=boxdefault size=2 name=ttt1 onKeyUp="return cttt1()" maxlength="2">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input value=<%=record.getMmTglDtngPert()%> class=boxdefault size=2 name=ttt2 onKeyUp="return cttt2()" maxlength="2">
                                              </td>
                                              <td>/</td>
                                              <td>
<input value=<%=record.getYyTglDtngPert()%> class=boxdefault size=4 name=ttt3 onKeyUp="return cttt3()" maxlength="4">
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Nomor Surat Tanda Lapor
                                          Diri<br>
                                          <span class="linkyellow">(Police Report
                                          Number) </span></td>
                                        <td width="22%"> <font face="Verdana" size="2">
                                          <b>
<input value=<%=record.getNoStld().toString().toUpperCase()%> class=boxdefault size=22 name=num_stld maxlength="40" onKeyUp="return numstl()">
                                          </b></font> </td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">&nbsp;</td>
                                        <td width="29%">&nbsp;</td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                <tr>
                                  <td height="10">
                                    <div align="center"><img src="images/dot.gif" width="1" height="10" hspace="5"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="1">
                                    <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="25">
                                    <div align="center"><span class="subtitle">Data
                                      Sponsor</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                                      </font><span class="linkyellow">(Sponsor
                                      Data)</span></div>
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
                                <tr valign="top">
                                  <td>
                                    <table border="0" cellspacing="3" cellpadding="3" width="100%">
                                      <tr>
                                        <td><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Nama
                                          Sponsor<font face="Verdana" size="2"><span class="linkyellow"><font color="#000099" class="asterish">*</font></span></font><br>
                                          <span class="linkyellow">(Sponsor Name)</span></span>
                                        </td>
                                        <td>:</td>
                                        <td><b>
<input value=<%=record.getNamaspr().toString().toUpperCase()%> class=boxdefault size=22 name=nama_spsor onKeyUp="return namspr()" maxlength="60">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td><font face="Verdana"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Type
                                          Sponsor</span></font><font face="Verdana" size="2"><span class="linkyellow"><font color="#000099" class="asterish">*</font></span><br>
                                          <span class="linkyellow">(Type of Sponsor)
                                          </span> </font></td>
                                        <td>:</td>
                                        <td><font face="Verdana" size="2">
 <select  class="boxdefault" name="tipe_spsor">
                                            <option selected value="0">-- Pilih Tipe Sponsor
                                            --</option>
                                            <option value="1">1. International Organization</option>
                                            <option value="2">2. Government</option>
                                            <option value="3">3. Company</option>
                                            <option value="4">4. Personal</option>
                                            <option value="5">5. None</option>
                                          </select>
                                          </font></td>
                                      </tr>
                                      <tr>
                                        <td>Alamat&nbsp;Sponsor<font face="Verdana" size="2"><span class="linkyellow"><font color="#000099" class="asterish">*</font></span></font><br>
                                          <span class="linkyellow">(Sponsor <span style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" lang="EN-GB">Address</span>)
                                          </span></td>
                                        <td>:</td>
                                        <td><b>
<input value=<%=record.getAlmtSpr().toString().toUpperCase()%> class=boxdefault size=22 name=alamat_spsor maxlength="120" onKeyUp="return alspr()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>No. RT<font face="Verdana" size="2">
<span class="linkyellow"><font color="#000099" class="asterish"> </font></span></font><font face="Verdana" size="2"><span class="linkyellow"></span></font><br>
                                          <span class="linkyellow">(RT Number<span style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" lang="EN-GB"></span>)
</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=4 name=nrt maxlength="3" value="<%=record.getNoRt()%>" onKeyUp="return nort()" >
                                          </b></td>
                                      </tr>
                                      <tr>
                                        <td>No. RW<br>
                                          <span class="linkyellow">(RW Number<span style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" lang="EN-GB"></span>)</span></td>
                                        <td>:</td>
                                        <td><b>
<input value=<%=record.getNoRw()%> class=boxdefault size=4 name=nrw maxlength="3" onKeyUp="return norw()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>Kode Pos<br>
                                          <span class="linkyellow">(Post Code/ZIP)</span></td>
                                        <td>:</td>
                                        <td><b>
<input value=<%=record.getKodPos()%> class=boxdefault size=5 name=kpos maxlength="5" onKeyUp="return kodpo()">
                                          </b></td>
                                      </tr>
                                      <tr>
                                        <td>Telepon<br>
                                          <span class="linkyellow">(Telephone)</span></td>
                                        <td>:</td>
                                        <td><b>
<input value=<%=record.getTelPon()%> class=boxdefault size=22 name=tlp maxlength="20" onKeyUp="return tel()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>Tanggal Pendaftaran<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Registration)</span>
                                        </td>
                                        <td>:</td>
                                        <td>
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input value=<%=record.getDdTglDft()%> class=boxdefault size=2 name=t4 maxlength="2" onKeyUp="return ct4()">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input value=<%=record.getMmTglDft()%> class=boxdefault size=2 name=t5 maxlength="2" onKeyUp="return ct5()">
                                              </td>
                                              <td>/</td>
                                              <td>
<input value=<%=record.getYyTglDft()%> class=boxdefault size=4 name=t6 maxlength="4" onKeyUp="return ct6()">
                                              </td>
                                            </tr>
                                          </table>
                                          <b> </b></td>
                                      </tr>
                                      <tr>
                                          <td>Jabatan pada Kantor/Dinas</td>
                                        <td>:</td>
<td><%=record1.getKabJabatan().toString().toUpperCase()%></td>
                                        <td>&nbsp;</td>
                                          <td>Nama Pejabat</td>
                                        <td>:</td>
<td><%=record1.getKabNamaPej().toString().toUpperCase()%></td>
                                      </tr>
                                      <tr>
                                          <td>Nip Pejabat</td>
                                        <td>:</td>
<td><%=record1.getNipPetugas()%></td>
                                        <td>&nbsp;</td>
                                        <td>Nama Petugas Entri Data<font color="#000099" class="asterish">*</font></td>
                                        <td>:</td>
<td><font color="#2A1F00"><%=nap.toString().toUpperCase()%></font> </td>
                                      </tr>
                                      <tr>
                                        <td>NIP Petugas Entri Data<font color="#000099" class="asterish">*</font></td>
                                        <td>:</td>
<td><font color="#2A0000"><%=nip.toString().toUpperCase()%></font></td>
                                        <td>&nbsp;</td>
                                        <td>Tanggal Entri Data<font color="#000099" class="asterish">*</font></td>
                                        <td>:</td>
<%
System.out.println("Checked Here");
%>
<td><b><%=record1.getToday().toString().toUpperCase()%></b></td>
<input type=hidden value="<%=record1.getKabJabatan().toString().toUpperCase()%>" name=nama_din>
<%
System.out.println("Checked Here after jabatan");
%>
<input type=hidden value="<%=record1.getKabNamaPej().toString().toUpperCase()%>" name=nama_kep_din>
<%
System.out.println("Checked Here pejabat");
%>
<input type=hidden value=<%=record1.getNipPetugas()%> name=nip_din>
<input type=hidden value="<%=nap%>" name=ned>
<input type=hidden value=<%=nip%> name=niped>
<input type=hidden value="<%=record1.getToday()%>" name=dd>
<input type=hidden value="<%=nprop%>" name=nprop>
<input type=hidden value="<%=nkab%>" name=nkab>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top"><img src="images/dot.gif" width="1" height="25"></td>
                          </tr>
                        </table>
                      </td>
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
                <td>
                  <table width="350" border="0" cellspacing="5" cellpadding="5" align="center" height="55">
                    <tr>
                      <td>
                        <div align="center"><b>
           <input class=boxstandard type=button  value=SIMPAN name="sim"  onclick="return ValiEdit()" >
                          </b></div>
                      </td>
                      <td>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR name="kel" onclick="document.location='WNA_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><font color="#003399"><i>Keterangan
                          : <font class="asterish">*</font></i></font> <i><font color="#003399">
                          Data harus diisi</font></i></div>
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
<p class="linkyellow">&nbsp;</p>
</form>
</BODY>
<SCRIPT language=JavaScript>
if(<%=record.getJnsKlm()%>=="1")
{
wnabiodata.jenis_klmin.value="Laki-laki";
}
else
{
wnabiodata.jenis_klmin.value="Perempuan";
}
wnabiodata.gol_drh.options[<%=record.getGolDrh()%>].selected=true;
wnabiodata.stat_kwn.options[<%=record.getStatKwn()%>].selected=true;
wnabiodata.pddk_akh.options[<%=record.getPddlAkh()%>].selected=true;
wnabiodata.jenis_pkrjn.options[<%=record.getJenisPkrjn()%>].selected=true;
wnabiodata.dok_imgr.options[<%=record.getDokImgr()%>].selected=true;
wnabiodata.tipe_spsor.options[<%=record.getTipespr()%>].selected=true;
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/clo.js">
</SCRIPT>
</HTML>
<%
}
else
{
  response.sendRedirect("Perubahan_Wna.jsp?flag=2");
}
}
  }

%>
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