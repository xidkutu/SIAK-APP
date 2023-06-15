<%@ page import="javax.naming.*,javax.rmi.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan,com.pkrjn.Pkrjn"%>
<%@ include file="CommonFile.jsp"%>
<%@ include file="Global.jsp"%>
<%
     String nik;
     ServiceController wniedit=null;
     WNIBiodataHome home = null;
     WNIBiodata remote = null;
     BioSiak wnidata = null;
     BioSiak wnipddkn = null;
     UserInfo1 record = null;
     String changeflag="";
	 String tglpenuh="";
	 String tglhari="";
	 String tglbulan="";
	 String tgltahun="";
	 String apatampil="";
%>

<%
   nik = request.getParameter("nik");
if  (request.getParameter("alter")!=null)
   changeflag=request.getParameter("alter");

try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

 if(record != null)
   {
      wniedit = ServiceController.getInstance();
      home = (WNIBiodataHome)wniedit.lookup("WNIBiodata",WNIBiodataHome.class);
      remote = home.create();

//E-Error Raised
//Y-Already Ubah
//N-Still Not Ubah
//F-Not Found

 wnidata = (BioSiak)remote.getBioSiak(record.getNoProp(),record.getNoKab(),record.getNoKec(),request.getParameter("no_kel"),nik);
 wnipddkn = (BioSiak)remote.getBioPdk(nik);
 String wnipdknst="N";
if (wnipddkn.getAcknowldge().toString().trim().equals("F")) {
  System.out.println("wnipddkn F->N data tidak ada--------------");
  wnipdknst="N";
}
else if (wnipddkn.getAcknowldge().toString().trim().equals("N")) {
  System.out.println("wnipddkn N --------------");
  wnipdknst="F";
}
else {
  System.out.println("wnipddkn lain --------------");
}
if (changeflag.equals("Y") &&
    wnidata.getAcknowldge().toString().trim().equals("Y"))
{
      wnidata.setAcknowldge("N");
}

if (wnidata.getAcknowldge().equals("F"))  //Not Found
    {
            %>
          <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="2"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit.jsp"/>
           </jsp:forward>
           <%
   // }
//else if (wnidata.getAcknowldge().toString().trim().equals("Y")) //already changed
  //    {
%>
          <!-- <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="3"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit.jsp"/>
           </jsp:forward>	-->

<%
   }
else if (wnidata.getAcknowldge().toString().trim().equals("E"))  //Error
 {
%>
            <jsp:forward page="Pendaftaran_Biodata_WNI_Edit1.jsp">
           <jsp:param name="n" value="6"/>
           <jsp:param name="destination" value="Pendaftaran_Biodata_WNI_Edit.jsp"/>
           </jsp:forward>

<%
 }
else if (wnidata.getAcknowldge().toString().trim().equals("N") || wnidata.getAcknowldge().toString().trim().equals("Y")) //Not changed but found
 {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/Update_Wni.js">
</SCRIPT>
<script language="javascript">
/*
function isNewNikSubmit()
{
if (document.all['jenis_klmin'].value!=document.all['jenis_kl_tmp'].value)
{
document.all['nik_flag'].value="2";
}

if (document.all['no_akta_lhr_dd'].value!=document.all['lhr_dd_tmp'].value)
{
document.all['nik_flag'].value="2";
}

if (document.all['no_akta_lhr_mm'].value!=document.all['lhr_mm_tmp'].value)
{
document.all['nik_flag'].value="2";
}
if (document.all['no_akta_lhr_yy'].value!=document.all['lhr_yy_tmp'].value)
{
document.all['nik_flag'].value="2";
}
}*/
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Update_Bwni_Pdkn.jsp">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td background="images/v_bg_header.gif">
        <jsp:include page="top.html"/>
      </td>
    </tr>
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="35">
              <div align="center"><span class="submenu">Perubahan Pendidikan Biodata WNI</span><br>
                <br>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
        <input type=hidden name='prop' value="<%=record.getNoProp().trim()%>">
        <input type=hidden name='kab' value="<%=record.getNoKab().trim()%>">
        <input type=hidden name='kec' value="<%=record.getNoKec().trim()%>">
        <% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel")) + "&nama_kel="+ (request.getParameter("namakel")==null?"":request.getParameter("namakel"));
%>
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
              <div align="center"><span class="subtitle">Data Keluarga</span></div>
            </td>
          </tr>
          <tr>
            <td colspan="4" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td valign="top" align="right"> Nomor Kartu Keluarga</td>
            <td></td>
            <td valign="top">: <b><%= wnidata.getNoKk().toString()%></b></td>
          </tr>
          <tr>
            <td valign="top" align="right"> Nama Kepala Keluarga</td>
            <td></td>
            <td valign="top">: <b><%=wnidata.getNama_kep().toString().toUpperCase()%></b></td>
          </tr>
          <tr>
            <td valign="top" align="right"> Alamat</td>
            <td></td>
            <td valign="top">: <b><%=wnidata.getAlamat().toString().toUpperCase()%></b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="5" cellpadding="5">
    <tr>
      <td valign="top">
        <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
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
                    <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
                      <tr>
                        <td valign="top">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="25" valign="top">
                                <div align="center"><span class="subtitle">Data
                                  Individu</span></div>
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
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"> <b><font color="#000066">
                                <%=wnidata.getNik()%>
                                <input type="hidden" name="nik" value="<%=wnidata.getNik().toString().trim()%>">
                                </font></b></td>
                              <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">&nbsp;

                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                <p>Nama Lengkap</p>
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"> <b>
                                <input
				class=boxdefault size=22 name=nama_lgkp maxlength="40"  value="<%=wnidata.getNamaLgkp()%>">
                                </b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Jenis Kelamin</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top"> <b>
                                <select  class="boxdefault" name="jenis_klmin" disabled>
<option value="0">-- Pilih Jenis Kelamin --</option>
<option value="1">1 - Laki-laki</option>
<option value="2">2 - Perempuan</option>
</select>
                                </b></td>
                            </tr>
							<tr>
                              <td valign="top">
                                <p>Pendidikan Akhir</p>
                              </td>
                              <td valign="top"> :</td>
                              <td colspan="2" valign="top"> <b>
                                 <select
		  name=pddk_akh boxdefault2 class="boxdefault">
                                  <option value="0">-- Pilih Pendidikan Terakhir
                                  --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Belum Tamat SD/Sederajat</option>
                                  <option value="3">3 - Tamat SD/Sederajat</option>
                                  <option value="4">4 - SLTP/Sederajat</option>
                                  <option value="5">5 - SLTA/Sederajat</option>
                                  <option value="6">6 - Diploma I/II</option>
                                  <option value="7">7 - Akademi/Diploma III/S.
                                  Muda</option>
                                  <option value="8">8 - Diploma IV/Strata I</option>
                                  <option value="9">9 - Strata II</option>
                                  <option value="10">10 - Strata III</option>
                                </select>
                                </b></td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Perubahan Pendidikan Akhir</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
							  <b>
                                <select
		  name=pddk_akh_lama boxdefault2 class="boxdefault">
                                  <option value="0">-- Pilih Pendidikan Terakhir
                                  --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Belum Tamat SD/Sederajat</option>
                                  <option value="3">3 - Tamat SD/Sederajat</option>
                                  <option value="4">4 - SLTP/Sederajat</option>
                                  <option value="5">5 - SLTA/Sederajat</option>
                                  <option value="6">6 - Diploma I/II</option>
                                  <option value="7">7 - Akademi/Diploma III/S.
                                  Muda</option>
                                  <option value="8">8 - Diploma IV/Strata I</option>
                                  <option value="9">9 - Strata II</option>
                                  <option value="10">10 - Strata III</option>
                                </select>
                                </b>
							  </td>
                            </tr>
                            <tr>
                              <td valign="top" colspan="4">
                                <div align="left">Penambahan Gelar Pendidikan Akhir:</div>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp;

                              </td>
                            </tr>
                            <tr>
                              <td valign="top" height="35">Didepan Nama</td>
                              <td valign="top" height="35">:</td>
                              <td colspan="2" valign="top" height="35">
<% if (wnipdknst.trim().equals("N")) { %>
<input class=boxdefault size=22 name=gelar_dpm maxlength="60"  value=""  onKeyUp="">
<% } else { %>
<input class=boxdefault size=22 name=gelar_dpm maxlength="60"  value="<%=wnipddkn.getB_gelar_dpm()%>"  onKeyUp="">
<% } %>
</td>
<td width="12" height="35">&nbsp;</td>
<td valign="top" height="35">Dibelakang Nama</td>
<td valign="top" height="35">:</td>
<td width="210" valign="top" height="35">
<% if (wnipdknst.trim().equals("N")) { %>
<input class=boxdefault size=22 name=gelar_blk maxlength="60"  value=""  onKeyUp="">
<% } else { %>
<input class=boxdefault size=22 name=gelar_blk maxlength="60"  value="<%=wnipddkn.getB_gelar_blk()%>"  onKeyUp="">
<% } %>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Gelar Dicantumkan Pada KK/KTP</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
				<%apatampil=wnipddkn.getB_gelar_tmp();
				if (apatampil!=null) {
				} else {
				 apatampil="1";
				}
				if (apatampil.trim().equals("1")) {
				%>
                                <input type="radio" name="tmpgelar" value="Y" checked>Ya
				<br>
				<input type="radio" name="tmpgelar" value="T" >
                                Tidak
				<% } else { %>
				<input type="radio" name="tmpgelar" value="Y">Ya
				<br>
				<input type="radio" name="tmpgelar" value="T" checked>
                                Tidak
				<% } %>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp;

                              </td>
                            </tr>
                            <tr>
                              <td valign="top" colspan="4">Dokumen Pendidikan Akhir:</td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td valign="top">&nbsp;</td>
                              <td width="210" valign="top">&nbsp;

                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Nomor  STTB/Ijazah</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
				<% if (wnipdknst.trim().equals("N")) { %>
                                <input	class=boxdefault size=22 name=ijazah_No maxlength="40"  value="">
				<% } else { %>
				<input	class=boxdefault size=22 name=ijazah_No maxlength="40"  value="<%=wnipddkn.getB_ijazah_no()%>">
				<% } %>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Tanggal STTB/Ijazah</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
                                 <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
								  <%
								if (wnipdknst.trim().equals("N")) {
									tglpenuh = "01/01/2005";
								} else {
									if (wnipddkn.getB_ijazah_tgl() != null) {
									tglpenuh = wnipddkn.getB_ijazah_tgl();
									}
									else {
									tglpenuh = "01/01/2005";
                                                                        }
								}
									System.out.println("Tanggal : "+tglpenuh);
									if (tglpenuh.trim().equals(null) || tglpenuh.trim().equals("")) {
									 tglpenuh = "01/01/2005";
									}
									tglhari = tglpenuh.substring(0,2);
									tglbulan = tglpenuh.substring(3,5);
									tgltahun = tglpenuh.substring(6,10);
									%>
                                    <td>
                                      <input
				class=boxdefault size=2 name=ijazah_dd maxlength="2"   value="<%=tglhari%>"  onKeyUp="return tabsd()">
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
				class=boxdefault size=2 name=ijazah_mm maxlength="2"   value="<%=tglbulan%>" onKeyUp="return tabsd1()">
                                    </td>
                                    <td>/</td>
                                    <td>

                                      <input
				class=boxdefault size=4 name=ijazah_yyyy maxlength="4"  value="<%=tgltahun%>"  onKeyUp="return tabsd2()">
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td valign="top">Institusi yang Mengeluarkan Ijazah</td>
                              <td valign="top">:</td>
                              <td colspan="2" valign="top">
				<% if (wnipdknst.trim().equals("N")) { %>
                                <input	class=boxdefault size=22 name=Ijazah_ins maxlength="40" value="">
				<% } else { %>
				<input	class=boxdefault size=22 name=Ijazah_ins maxlength="40" value="<%=wnipddkn.getB_ijazah_ins()%>">
				<% } %>
                              </td>
                              <td width="12">&nbsp;</td>
                              <td valign="top">Nama Penandatangan Ijazah</td>
                              <td valign="top">:</td>
                              <td width="210" valign="top">
				<% if (wnipdknst.trim().equals("N")) { %>
                                <input class=boxdefault size=22 name=Ijazah_ttd maxlength="40" value="">
				<% } else { %>
				<input class=boxdefault size=22 name=Ijazah_ttd maxlength="40" value="<%=wnipddkn.getB_ijazah_ttd()%>">
				<% } %>
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
                                  Administrasi</span></div>
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
                                <table width="100%" border="0" cellspacing="3" cellpadding="2">

                                  <tr>
                                    <td>Nama Petugas Registrar <font color="#000099" class="asterish">*</font></td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=22 name=nama_pet_reg maxlength="60"   value="<%=wnidata.getNamaPetReg()%>" onKeyUp="return char(form1.nama_pet_reg)">
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>NIP Petugas Registrar </td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <input
				class=boxdefault size=9 name=nip_pet_reg maxlength="9"  value="<%=wnidata.getNipPetReg()%>" onKeyUp="return num(form1.nip_pet_reg)">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>Nama Petugas Entri Data</td>
                                    <td>:</td>
                                    <td colspan="2"><b><font color="#000066">
                                      <%=record.getNamaPetugas()%> </font></b></td>
                                    <td>&nbsp;</td>
                                    <td>NIP Petugas Entri Data</td>
                                    <td>:</td>
                                    <td colspan="2"><b><font color="#000066">
                                      <%=record.getNipPetugas()%></font></b> </td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">
                                      <input type="hidden"   maxlength="55" name="nama_pet_entri" value="<%=record.getNamaPetugas().trim()%>">
                                      &nbsp; </td>
                                    <td colspan="2">
                                      <input type="hidden"  maxlength="99" name="nip_pet_entri" value="<%=record.getNipPetugas().trim()%>">
                                      &nbsp; </td>
                                  </tr>
                                  <tr>
                                    <td>Tanggal Entri Data<font color="#000099" class="asterish">
                                      *</font></td>
                                    <td>:</td>
                                    <td colspan="2">
                                      <table width="100" border="0" cellspacing="3" cellpadding="0">
                                        <tr>
                                          <td> <%=record.getToday()%> </td>
                                        </tr>
                                      </table>
                                      <b></b></td>
                                    <td>
                                      <input type="hidden" name="today" value="<%=record.getToday().trim()%>">
                                      &nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
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
              <table width="350" border="0" cellspacing="0" cellpadding="0" align="center" height="55">
                <tr>
                  <td>
                    <div align="center"><b>
                      <input class=boxstandard type="submit" value=SIMPAN name="sim" onClick="return validsd()">
                      </b></div>
                  </td>
                  <td>
                    <div align="center"><b>
                      <input class=boxstandard type="button" value="KELUAR" name="bat" onclick="document.location='WNI_Menu.jsp'">
                      </b></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="catatan" colspan="2"><font color="#000066">Keterangan
                    :</font><span class="asterish"> *</span><span class="catatan"><font color="#000066">Data
                    harus diisi</font></span></td>
    </tr>
     </table>
<input type="hidden" name="jenis_kl_tmp" value="<%=wnidata.getJenisKlmin()%>">
<input type="hidden" name="lhr_dd_tmp" value="<%=wnidata.getDdlahir()%>">
<input type="hidden" name="lhr_mm_tmp" value="<%=wnidata.getMmlahir()%>">
<input type="hidden" name="lhr_yy_tmp" value="<%=wnidata.getYylahir()%>">
<input type="hidden" name="nik_flag" value="1">
 </td>
   </tr>
   </table>
    </tr>
  </table>
<script language="JavaScript">
form1.jenis_klmin.options[<%=wnidata.getJenisKlmin()%>].selected=true
form1.pddk_akh.options[<%=wnidata.getPddkAkh()%>].selected=true
form1.pddk_akh_lama.options[<%=wnidata.getPddkAkh()%>].selected=true
</script>
</form>
</BODY>
</HTML>
<%
}
   }
else
{
   response.sendRedirect("index.jsp");
}

}catch (Exception ne)
    {
     ne.printStackTrace();
     System.out.println("In WNI Edit Exception"+ne);
     response.sendRedirect("index.jsp");
    }
%>
