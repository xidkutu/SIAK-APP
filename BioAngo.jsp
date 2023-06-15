<%@ page import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%!

    String nama_prop,nama_kab,nama_kec,nama_kel,nama_kep,alamat;
    String telp,dusun,no_prop,no_kab,no_kec,no_kel,a,b,c,d,e,z,ned,niped,dd;
    String n,nik,nokk,stathub;
    int no_rt,no_rw,kodepos,k;

    NOKKHome home;
    NOKK remote;
    Vector v;
    ServiceController factory;
    UserInfo1 record=null;
%>

<%
   record = (UserInfo1)session.getAttribute("remoteRef");

 if(record != null)
   {
%>
<%

   nokk= (request.getParameter("no_kk")==null?"":request.getParameter("no_kk"));
   no_prop = (request.getParameter("no_prop")==null?"":request.getParameter("no_prop"));
   no_kab = (request.getParameter("no_kab")==null?"":request.getParameter("no_kab"));
   no_kec = (request.getParameter("no_kec")==null?"":request.getParameter("no_kec"));
   no_kel = (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));

   nama_kep = (request.getParameter("namkep")==null?"":request.getParameter("namkep"));
   alamat = (request.getParameter("ala")==null?"":request.getParameter("ala"));

   dd=record.getToday();
   niped=record.getNipPetugas();
   ned=record.getNamaPetugas();

   try
   {
      factory=ServiceController.getInstance();
      home = (NOKKHome) factory.lookup("NOKK",NOKKHome.class);
      remote = home.create();
      v = remote.verifyNik(nokk);

      if (v==null)
         v=new Vector();
      stathub=remote.verifyKK(nokk);
      k=v.size();

   }catch(Exception er){ }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
function winlist()
{

	window.open("Popup_Wni.jsp?no_kk=<%=nokk%>","my_new_window","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=900,height=300")
}

</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<FORM method=post name="wnabiodata">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td background="images/v_bg_header.gif">
   	   <jsp:include page="top.html"/>
    </td>
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
                            <td height="35">
                              <div align="center"><span class="submenu">Permohonan
                                Biodata WNA</span><br>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                        <td>
                           <% String jsp = "data_wilayah_2.jsp?level=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
                                           "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();%>
                           <jsp:include page="<%=jsp%>"/>
			</td>
                    </tr>
                    <tr>
                      <td valign="top">
                        <table width="600" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Data
                                Keluarga</span><font size="2" face="Arial Black" color="#FFFF00"><br>

                                </font><font class="linkyellow">(Family data)</font></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                              <td valign="top" width="181"> Nomor Kartu Keluarga<br>
                              <span class="linkyellow">(Family Card Number)</span>
                            </td>
                              <td valign="top" width="40">:</td>
                              <td valign="top" width="187"> <b><%=nokk%></b> </td>
                              <td valign="top" width="161"><b>
                                </b></td>
                          </tr>
                          <tr>
                              <td valign="top" width="181"> Nama Kepala Keluarga<br>
                              <span class="linkyellow">(Head of Family Name)</span></td>
                              <td valign="top" width="40">:</td>
                            <td valign="top" colspan="2"><b><%=nama_kep.toString().toUpperCase()%></b></td>
                          </tr>
                          <tr>
                              <td valign="top" width="181"> Alamat Keluarga <span class="linkyellow"><br>
                              (Family Address)</span></td>
                              <td valign="top" width="40">:</td>
                            <td valign="top" colspan="2"><b><%=alamat.toString().toUpperCase()%></b></td>
                          </tr>
                          <tr>
                              <td valign="top" width="181">&nbsp;</td>
                              <td valign="top" width="40">&nbsp;</td>
                            <td valign="top" colspan="2"><div align="right"><i><b><a href="javascript:winlist()"><font face="Verdana">Tampilkan
                    Data Keluarga</font></a></b></i> </div></td>
                          </tr>
                        </table>
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
                                  <td colspan="2" valign="top"> <b><font color="#000066">&lt;
                                    create NIK by sistem &gt;</font></b></td>
                                  <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
                                  <td>Nama Keluarga <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Family Name)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
<input  class=boxdefault size=22 name=nama_klrga maxlength="55" onKeyUp="return kepa()">
                                  </td>
                                </tr>
                                <tr>
                                  <td>Nama Pertama <font class="asterish">*</font><br>
                                    <span class="linkyellow">(First Name) </span></td>
                                  <td valign="top"> :</td>
                                  <td colspan="2" valign="top"> <b>
<input  class=boxdefault size=22  name=nama_pertma maxlength="55">
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Jenis Kelamin<font class="asterish"> *</font><br>
                                    <span class="linkyellow">(Sex) </span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top"><font face="Verdana" size="2">
<select class="boxdefault" name="jenis_klmin" >
                                      <option selected value="0">-- Pilih Jenis Kelamin
                                      --</option>
                                      <option value="1">1 - Laki-laki</option>
                                      <option value="2">2 - Perempuan</option>
                                    </select>
                                    </font> </td>
                                </tr>
                                <tr>
                                  <td>Tempat Lahir <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Place of Birth)
                                    </span></td>
                                  <td valign="top">:</td>
                                  <td colspan="2" valign="top"> <b>
 <input class=boxdefault size=22 name=tmpt_lhr maxlength="50" onKeyUp="return temlhr()">
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Tanggal Lahir <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Date of Birth)DD/MM/YY </span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
                                    <table width="100" border="0" cellspacing="3" cellpadding="0">
                                      <tr>
                                        <td>
<input class=boxdefault size=2 name=t1 maxlength="2" onKeyUp="return checkDD(t1,t2,t3)" >
                                        </td>
                                        <td>/ </td>
                                        <td>
<input class=boxdefault size=2 name=t2 maxlength="2" onKeyUp="return checkMM(t1,t2,t3)">
                                        </td>
                                        <td>/</td>
                                        <td>
<input class=boxdefault size=4 name=t3 maxlength="4" onKeyUp="return checkYY(t1,t2,t3,'Y')">
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td>Kewarganegaraan <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Nationality) </span></td>
                                  <td valign="top">:</td>
                                  <td colspan="2" valign="top"><b>
<input class=boxdefault size=22 name=kwrngrn maxlength="20" onKeyUp="return kwar()">
                                    </b> </td>
                                  <td width="12">&nbsp;</td>
                                  <td>Agama <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Religion)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td> <font face="Verdana" size="2">
<select class="boxdefault" name="agama" onchange="return aga()" >
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
<input class=boxdefault size=7 name=agama_lainnya value="Lainnya" disabled>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td>Golongan Darah <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Blood Type)</span></td>
                                  <td valign="top">:</td>
                                  <td colspan="2" valign="top"> <b>
<select class="boxdefault" name="gol_drh" >
                                      <option selected value="0">-- Pilih Golongan Darah
                                      --</option>
                                      <option value="1">1. A</option>
                                      <option value="2" >2. B</option>
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
                                  <td>Status Perkawinan <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Marital Status)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
<select class="boxdefault" name="stat_kwn">
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
                                  <td>Status Hubungan Dalam Keluarga <font class="asterish">*</font><br>
                                    <span class="linkyellow">(<font face="Verdana">Relationship
                                    within Family</font>)</span></td>
                                  <td valign="top">:</td>
                                  <td colspan="2" valign="top"> <b>
<select class="boxdefault" name="stat_hbkel">
<option selected value="0">-- Pilih Status Hub. dalam
                                      Keluarga --</option>
<%
if(stathub==null)
{
%>

<%
}
else
{
%>
                                      <option value="1">1 - Kepala Keluarga/Head of Family</option>
<%
}
%>
                                      <option value="2">2 - Suami/Husband</option>
                                      <option value="3">3 - Istri/Wife</option>
                                      <option value="4">4 - Anak/Child</option>
                                      <option value="5">5 - Menantu/Child in Law</option>
                                      <option value="6">6 - Cucu/Grand Child</option>
                                      <option value="7">7 - OrangTua/Parent</option>
                                      <option value="8">8 - Mertua/Parent in Law</option>
                                      <option value="9">9 - Famili Lain/Relative</option>
                                      <option value="10">10 - Pembantu/Housemade</option>
                                      <option value="11">11 - Lain/Others</option>
  </select>
                                    </b></td>
                                  <td width="12">&nbsp;</td>
                                  <td>Pendidikan Terakhir <font class="asterish">*</font><br>
                                    <span class="linkyellow">(Last Education)</span></td>
                                  <td valign="top">:</td>
                                  <td width="210" valign="top">
<select class="boxdefault" name="pddk_akh">
       <option selected value="0">-- Pilih Pendidikan Terakhir --</option>
                                      <option value="1">1 - ELementary</option>
                                      <option value="2">2 - Junior Heigh School</option>
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
                                  <td>Jenis Pekerjaan <span class="linkyellow"><font class="asterish">*</font><br>
                                    (Occupation)</span></td>
                                  <td valign="top">:</td>
                                  <td colspan="2" valign="top"> <b>
<select class="boxdefault" name="jenis_pkrjn">
  <option selected value="0">-- Pilih Jenis Pekerjaan --</option>
                                      <option value="1">1 - Trading and Industry</option>
                                      <option value="2">2 - Forestry</option>
                                      <option value="3">3 - Mining and Energy</option>
                                      <option value="4">4 - Public Work</option>
                                      <option value="5">5 - Farming</option>
                                      <option value="6">6 - Religion</option>
                                      <option value="7">7 - Bank and Financial</option>
                                      <option value="8">8 - Health and Society</option>
                                      <option value="8">9 - Tourism</option>
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
                                        <td width="24%">Datang dari <span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font color="#000099" class="asterish">*</font></span><br>
                                          <span class="linkyellow">(Coming from)</span></td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
<input class=boxdefault size=22 name=datng_dari maxlength="20" onKeyUp="return dadar()">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Tujuan
                                          Kedatangan <font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Purposed Visit)
                                          </span></span></td>
                                        <td width="29%"> <b>
<input class=boxdefault size=22 name=tujuan_dtng maxlength="20" onKeyUp="return tuj()">
                                          </b></td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%"> <span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Nomor
                                          Paspor <font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Passport Number)</span>
                                          </span> </td>
<input type = hidden name=kk value=<%=k%>>
<%

for(int m=0;m<=k-1;m++)
{
%>
<input type=hidden name="a<%=m%>" value=<%=v.elementAt(m).toString().toLowerCase()%> >
<%
}
%>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
<input class=boxdefault size=22 name=num_paspor maxlength="20" onKeyUp="return nopa()">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tanggal Paspor <font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Issue)</span></td>
                                        <td width="29%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input class=boxdefault size=2 name=tp1 maxlength="2" onKeyUp="return checkDD(tp1,tp2,tp3)">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input class=boxdefault size=2 name=tp2 maxlength="2"  onKeyUp="return checkMM(tp1,tp2,tp3)">
                                              </td>
                                              <td>/</td>
                                              <td>
<input class=boxdefault size=4 name=tp3 maxlength="4"  onKeyUp="return checkYY(tp1,tp2,tp3,'Y')">
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Tanggal Berakhir Paspor<font color="#000099" class="asterish">
                                          *</font><br>
                                          <span class="linkyellow">(Date of Passport
                                          Expire)</span></td>
                                        <td width="22%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input class=boxdefault size=2 name=tb1 maxlength="2"  onKeyUp="return checkDD(tb1,tb2,tb3)">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input class=boxdefault size=2 name=tb2 maxlength="2"  onKeyUp="return checkMM(tb1,tb2,tb3)">
                                              </td>
                                              <td>/</td>
                                              <td>
<input class=boxdefault size=4 name=tb3 maxlength="4"  onKeyUp="return checkYY(tb1,tb2,tb3,'N')">
                                              </td>
                                            </tr>
                                          </table>
                                          <b></b> </td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Dokumen Imigrasi<br>
                                          <span class="linkyellow">(Immigration
                                          Document) <font color="#000099" class="asterish">*</font></span></td>
                                        <td width="29%"><font face="Verdana" size="2">
<select class="boxdefault" name="dok_imgr">
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
                                          <span class="linkyellow">(Register Number)
                                          <font class="asterish">*</font></span>
                                        </td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
<input class=boxdefault size=22 name=num_dok maxlength="20" onKeyUp="return numdoc()">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tempat Diterbitkan <span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font color="#000099" class="asterish">*</font></span><br>
                                          <span class="linkyellow">(Place of Issue)</span></td>
                                        <td width="29%"><font face="Verdana" size="2"><b>
<input class=boxdefault size=22 name=tmpt_dtbit maxlength="20" onKeyUp="return tmbit()">
                                          </b></font> </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Tanggal Penerbitan<font color="#000099" class="asterish">
                                          *</font><br>
                                          <span class="linkyellow">(Date of Issue)</span></td>
                                        <td width="22%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input class=boxdefault size=2 name=tt1 maxlength="2"  onKeyUp="return checkDD(tt1,tt2,tt3)">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input class=boxdefault size=2 name=tt2 maxlength="2"  onKeyUp="return checkMM(tt1,tt2,tt3)">
                                              </td>
                                              <td>/</td>
                                              <td>
<input class=boxdefault size=4 name=tt3 maxlength="4"  onKeyUp="return checkYY(tt1,tt2,tt3,'Y')">
                                              </td>
                                            </tr>
                                          </table>
                                          <b> </b> </td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tanggal Berakhir Dokumen<font color="#000099" class="asterish">
                                          *</font><br>
                                          <span class="linkyellow">(Date of Document
                                          Expire) </span></td>
                                        <td width="29%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input class=boxdefault size=2 name=tl1 maxlength="2"  onKeyUp="return checkDD(tl1,tl2,tl3)">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input class=boxdefault size=2 name=tl2 maxlength="2"  onKeyUp="return checkMM(tl1,tl2,tl3)">
                                              </td>
                                              <td>/</td>
                                              <td>
<input class=boxdefault size=4 name=tl3 maxlength="4"  onKeyUp="return checkYY(tl1,tl2,tl3,'N')">
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr valign="top">
                                        <td width="24%">Tempat Kedatangan Pertama<font face="Verdana" size="2">
                                          </font><font class="asterish">*</font><br>
                                          <span class="linkyellow">(First Place
                                          of Arrival)</span></td>
                                        <td width="22%"><font face="Verdana" size="2">
                                          <b>
 <input class=boxdefault size=22 name=tmpt_dtng_pert maxlength="20" onKeyUp="return tdper()">
                                          </b></font></td>
                                        <td width="2%">&nbsp;</td>
                                        <td width="23%">Tanggal Kedatangan Pertama
                                          <font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(First Date
                                          Place of Arrival)</span></td>
                                        <td width="29%">
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input class=boxdefault size=2 name=ttt1 maxlength="2"  onKeyUp="return checkDD(ttt1,ttt2,ttt3)">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input class=boxdefault size=2 name=ttt2 maxlength="2"  onKeyUp="return checkMM(ttt1,ttt2,ttt3)">
                                              </td>
                                              <td>/</td>
                                                <td>
                                                  <input class=boxdefault size=4 name=ttt3 maxlength="4"  onKeyUp="return checkYY(ttt1,ttt2,ttt3,'Y')">
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
<input class=boxdefault size=22 name=num_stld maxlength="20" onKeyUp="return numstl()">
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
                                        <td><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">
Nama Sponsor<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Sponsor Name)</span></span>
                                        </td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=22 name=nama_spsor maxlength="20" onKeyUp="return namspr()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td><font face="Verdana"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Type
                                          Sponsor</span></font><font face="Verdana" size="2"><span class="linkyellow">
<font color="#000099" class="asterish">*</font></span><br>
                                          <span class="linkyellow">(Type of Sponsor)
                                          </span> </font></td>
                                        <td>:</td>
                                        <td><font face="Verdana" size="2">
<select class="boxdefault" name="tipe_spsor">
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
                                        <td>Alamat&nbsp;Sponsor
<font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Sponsor <span style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" lang="EN-GB">Address</span>)
                                          </span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=22 name=alamat_spsor maxlength="40" onKeyUp="return alspr()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>No. RT<font class="asterish"> </font><font face="Verdana" size="2"><span class="linkyellow"></span></font><br>
                                          <span class="linkyellow">(RT Number<span style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" lang="EN-GB"></span>)</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=4 name=nrt maxlength="3" onKeyUp="return nort()">
                                          </b></td>
                                      </tr>
                                      <tr>
                                        <td>No. RW<br>
                                          <span class="linkyellow">(RW Number<span style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" lang="EN-GB"></span>)</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=4 name=nrw maxlength="3" onKeyUp="return norw()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>Kode Pos<br>
                                          <span class="linkyellow">(Post Code/ZIP)</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=5 name=kpos maxlength="5" onKeyUp="return kodpo()">
                                          </b></td>
                                      </tr>
                                      <tr>
                                        <td>Telepon<br>
                                          <span class="linkyellow">(Telephone)</span></td>
                                        <td>:</td>
                                        <td><b>
<input class=boxdefault size=22 name=tlp maxlength="20" onKeyUp="return tel()">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>Tanggal Pendaftaran <font color="#000099" class="asterish">*</font><br>
                                          <span class="linkyellow">(Date of Registration)</span>
                                        </td>
                                        <td>:</td>
                                        <td>
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>
<input class=boxdefault size=2 name=t4 maxlength="2" onKeyUp="return checkDD(t4,t5,t6)">
                                              </td>
                                              <td>/ </td>
                                              <td>
<input class=boxdefault size=2 name=t5 maxlength="2"  onKeyUp="return checkMM(t4,t5,t6)">
                                              </td>
                                              <td>/</td>
                                              <td>
<input class=boxdefault size=4 name=t6 maxlength="4"  onKeyUp="return checkYY(t4,t5,t6,'Y')">
                                              </td>
                                            </tr>
                                          </table>
                                          <b> </b></td>
                                      </tr>
                                      <tr>
                                          <td>Jabatan pada Kantor/Dinas</td>
                                        <td>:</td>
                                        <td><b>
<%=record.getKabJabatan()%>
<input type="hidden" name=nama_din value="<%=record.getKabJabatan()%>">
</b></td>
<td>&nbsp;</td>
<td>Nama Pejabat</td>
                                        <td>:</td>
                                        <td><b>
<%=record.getKabNamaPej()%>
<input type="hidden" name=nama_kep_din VALUE="<%=record.getKabNamaPej()%>">
                                          </b></td>
                                      </tr>
                                      <tr>
                                          <td>NIP Pejabat</td>
                                        <td>:</td>
                                        <td><b>
<%=record.getKabNipPej()%>
<input type="hidden"  name=nip_din VALUE="<%=record.getKabNipPej()%>">
                                          </b></td>
                                        <td>&nbsp;</td>
                                        <td>Nama Petugas Entri Data <font color="#000099" class="asterish">*</font></td>
                                        <td>:</td>
<td><b><font color="#000066"><%=ned.toString().toUpperCase()%></font></b> </td>
                                      </tr>
                                      <tr>
                                        <td>NIP Petugas Entri Data<font color="#000099" class="asterish">
                                          *</font></td>
                                        <td>:</td>
<td><b> <font color="#000066"><%=niped.toString().toUpperCase()%></font></b></td>
                                        <td>&nbsp;</td>
                                        <td>Tanggal Entri Data <font color="#000099" class="asterish">*</font></td>
                                        <td>:</td>
                                        <td><b><%=dd%> </b>
                                          <table width="100" border="0" cellspacing="3" cellpadding="0">
                                            <tr>
                                              <td>

                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
<input type = hidden name=np value="<%=no_prop%>">
<input type = hidden name=nb value="<%=no_kab%>">
<input type = hidden name=nc value="<%=no_kec%>">
<input type = hidden name=nl value="<%=no_kel%>">
<input type = hidden name=nok value=<%=nokk%>>
<input type = hidden name=nama_kep value="<%=nama_kep%>">
<input type = hidden name=alamat value="<%=alamat%>">
<input type = hidden name=no_rt value=<%=no_rt%>>
<input type = hidden name=no_rw value=<%=no_rw%>>
<input type = hidden name=dusun value=<%=dusun%>>
<input type = hidden name=kodepos value=<%=kodepos%>>
<input type = hidden name=telp value=<%=telp%>>
<input type = hidden name=dd value=<%=dd%>>
<input type = hidden name=niped value=<%=niped%>>
<input type = hidden name=ned value=<%=ned%>>

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
                  <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                    <tr>
                      <td>
                <div align="center"><b>
     <input type="hidden" name="sim" value="SIMPAN">
     <input class=boxstandard disabled type=button value=SIMPAN name="simbtn" onclick="return ValiBioAgt()">
                          </b></div>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=reset value=KELUAR name="button2" onclick="document.location='WNA_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td><font color="#003399"><i>Keterangan : <font class="asterish">*</font></i></font>
                  <i><font color="#003399"> Data harus diisi</font></i></td>
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
<SCRIPT language=JavaScript src="Templates/clo.js">
</SCRIPT>
</HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
%>