<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
     String s1,s2,s3,s4=null,h5,s5=null,s6=null,s7,no_prop,no_kab,no_kk,no_kl="05",total=no_prop+no_kab+no_kk;
     Vector v = new Vector();
     Vector v1 = new Vector();
     UserInfo record = null;

     WNIBiodataHome home = null;
     WNIBiodata remote = null;
     ServiceController factory;
    String id,no_kel,nama_kel,select,flag=null;
    UserInfo1 record1 = null;

%>

<%
   s3 = request.getParameter("no_kk");
flag = request.getParameter("n");



   try
   {
record1=(UserInfo1)session.getAttribute("remoteRef");

if(record1 != null)
{
     factory=ServiceController.getInstance();
     home=(WNIBiodataHome)factory.lookup("WNIBiodata",WNIBiodataHome.class);
     remote = home.create();

     record=(UserInfo)remote.compare_KKID(s3);

     if(record==null)
     {%>
          <jsp:forward page="WNI_Header.jsp">
          <jsp:param name="tt" value="1"/>
          </jsp:forward>
     <%}
      v = remote.getDataIndividu(record.getNoKk());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>
<SCRIPT language="JavaScript">

function winlist()
{
	window.open("Popup_Wni.jsp?no_kk=<%=request.getParameter("no_kk")%>","my_new_window","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=600,height=600")
}

</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onLoad="winlist();javascript:window.history.forward(1)">
<form name="form1" method="post" action="Pendaftaran_Input_WNI.jsp">
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
			    <td height="35">
			      <div align="center"><span class="submenu">Pendaftaran
				Biodata WNI</span><br>
				<br>
			      </div>
			    </td>
			  </tr>
			</table>
		      </td>
		    </tr>
		    <tr>
                                             <td>
<% String jsp = "data_wilayah.jsp?level=4&sublevel=0&no_prop=" + record1.getNoProp() + "&nama_prop=" + record1.getNamaProp() +
      "&no_kab=" + record1.getNoKab() + "&nama_kab=" + record1.getNamaKab() + "&no_kec=" + record1.getNoKec() + "&nama_kec=" + record1.getNamaKec() +
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
			      <div align="center"><span class="subtitle">Data
				Keluarga</span></div>
			    </td>
			  </tr>
			  <tr>
			    <td colspan="4" height="1">
			      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
			    </td>
			  </tr>
			  <tr>
			    <td valign="top"> Nomor Kartu Keluarga</td>
			    <td valign="top">:</td>
			    <td valign="top"><i>
			      <input
				class=boxdefault size=22 name=no_kk onFocus="this.blur()" value="<%=record.getNoKk().trim()%>">&nbsp;&nbsp;&nbsp;&nbsp;

<%! String new_nokk = null;%>
<%

     new_nokk=request.getParameter("no_kk");
%>			      <b>
			      </b></i></td>
			    <td valign="top"><b> </b></td>
			  </tr>
			  <tr>
			    <td valign="top"> Nama Kepala Keluarga</td>
			    <td valign="top">:</td>
			    <td valign="top" colspan="2"><i><input
				class=boxdefault size=22 name=nama_kk maxlength="30" value="<%=record.getNamaKep()%>" onFocus="this.blur()" >
			      </i></td>
			  </tr>
			  <tr>
			    <td valign="top"> Alamat</td>
			    <td valign="top">:</td>
			          <td valign="top" colspan="2"><i>
                        <input
				class=boxdefault size=22 name=alamat_kk maxlength="30" value="<%=record.getAlamat()%>" onFocus="this.blur()" >
                        <b> </b></i></td>
			  </tr>
			</table>
		      </td>
		    </tr>
		  </table>
		</td>
	      </tr>

	      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
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
				  <td colspan="2" valign="top"> <b><font color="#000066">&lt;
				    creat NIK by sistem &gt;</font></b></td>
				  <td width="12"><img src="images/dot.gif" width="10" height="1"></td>
				                          <td valign="top">Nama Lengkap <font color="#000099" class="asterish">*</font></td>
				  <td valign="top">:</td>
				                          <td width="210" valign="top">
                                            <input
				class=boxdefault size=22 name=nama_lgkp value="<%=request.getParameter("namakep")%>" onFocus="this.blur()" maxlength="60" onKeyUp="return char(form1.nama_lgkp)">
                                            <%
for(int i = 0; i < v.size(); i++)
{%>
                                            <input type="hidden" name="namalgkp" value="<%=v.elementAt(i)%>">
                                            <%}%>
                                            <input type="hidden" name="namalgkp1" value="<%=v.size()%>">
                                          </td>
				</tr>
				<tr>
				                          <td valign="top">
                                            <p>Nomor KTP/Nopen</p>
				  </td>
				  <td valign="top"> :</td>
				                          <td colspan="2" valign="top"> <b>
                                            <input
				class=boxdefault size=22 name=no_ktp maxlength="40">
                                            </b></td>
				  <td width="12">&nbsp;</td>
				                          <td valign="top">Tempat Tinggal Sebelumnya</td>
				  <td valign="top">:</td>
				                          <td width="210" valign="top"><b><font color="#000066">&lt;
                                            history alamat &gt;</font></b> </td>
				</tr>
				<tr>
				  <td valign="top">
				                            <div align="left">Nomor Paspor</div>
				  </td>
				  <td valign="top">:</td>
				                          <td colspan="2" valign="top">
                                            <input
				class=boxdefault size=22 name=no_paspor2 maxlength="40">
                                          </td>
				  <td width="12">&nbsp;</td>
				                          <td valign="top">Tanggal Berakhir Paspor</td>
				  <td valign="top">:</td>
				                          <td width="210" valign="top">
                                            <table width="100" border="0" cellspacing="3" cellpadding="0">
                                              <tr>
                                                <td>
                                                  <input
				class=boxdefault size=2 name=no_akta_lh_dd maxlength="2" onKeyUp="return tab()">
                                                </td>
                                                <td>/ </td>
                                                <td>
                                                  <input
				class=boxdefault size=2 name=no_akta_lh_mon maxlength="2" onKeyUp="return tab1()">
                                                </td>
                                                <td>/</td>
                                                <td>
                                                  <input
				class=boxdefault size=4 name=no_akta_lh_yy maxlength="4" onKeyUp="return tab2()">
                                                </td>
                                              </tr>
                                            </table>
                                          </td>
				</tr>
				<tr>
				  <td valign="top" height="35">Jenis Kelamin<font color="#000099" class="asterish">
				    *</font> </td>
				  <td valign="top" height="35">:</td>
				  <td colspan="2" valign="top" height="35">
				    <select
		  		  class="boxdefault" name="jenis_klmin">
				      <option value="0">-- Pilih Jenis Kelamin --</option>
				      <option value="1">1 - Laki-laki</option>
				      <option value="2">2 - Perempuan</option>
				    </select>
				  </td>
				  <td width="12" height="35">&nbsp;</td>
				  <td valign="top" height="35">Tempat Lahir <font color="#000099" class="asterish">*</font></td>
				  <td valign="top" height="35">:</td>
				  <td width="210" valign="top" height="35">
				    <input
				class=boxdefault size=22 name=tmpt_lhr maxlength="60" onKeyUp="return char(form1.tmpt_lhr)">
				  </td>
				</tr>
				<tr>
				  <td valign="top">Tanggal Lahir<font color="#000099" class="asterish">
				    *</font></td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
				    <table width="100" border="0" cellspacing="3" cellpadding="0">
				      <tr>
					<td>
					  <input
				class=boxdefault size=2 name=no_akta_lhr_dd maxlength="2" onKeyUp="return tab3()">
					</td>
					<td>/ </td>
					<td>
					  <input
				class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2" onKeyUp="return tab4()">
					</td>
					<td>/</td>
					<td>
					  <input
				class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4" onKeyUp="return tab5()">
					</td>
				      </tr>
				    </table>
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Akta Kelahiran/Surat Kenal
				    Lahir<font color="#000099" class="asterish">
				    *</font></td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <select class="boxdefault" name="akta_lhr" onChange="return validate1()">
				      <option value="0">-- Pilih Akta Kelahiran --</option>
				      <option value="1">1 - Ada</option>
				      <option value="2">2 - Tidak Ada</option>
				    </select>
				  </td>
				</tr>
				<tr>
				  <td valign="top">Nomor Akta Kelahiran/<br>
				    Surat Kenal Lahir</td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
				    <input
				class=boxdefault size=22 name=no_akta_lhr maxlength="40">
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Golongan Darah <font color="#000099" class="asterish">*</font></td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <select name=gol_drh class="boxdefault">
				      <option value="0">-- Pilih Golongan Darah --</option>
				      <option value="1">1 - A</option>
				      <option value="2">2 - B</option>
				      <option value="3">3 - AB</option>
				      <option value="4">4 - O</option>
				      <option value="5">5 - A+</option>
				      <option value="6">6 - A-</option>
				      <option value="7">7 - B+</option>
				      <option value="8">8 - B-</option>
				      <option value="9">9 - AB+</option>
				      <option value="10">10 - AB-</option>
				      <option value="11">11 - O+</option>
				      <option value="12">12 - O-</option>
                                      <option value="13">13 - Tidak Tahu-</option>
				    </select>
				  </td>
				</tr>
				<tr>
				  <td valign="top">Agama <font color="#000099" class="asterish">*</font></td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
				    <table width="175" border="0" cellspacing="0" cellpadding="0" align="left">
				      <tr>
				       <td>
				 <select class="boxdefault" name="aga_ma" onChange="return validate2()">

					    <option value="0">-- Pilih Agama --</option>
					    <option value="1">1 - Islam</option>
					    <option value="2">2 - Kristen</option>
					    <option value="3">3 - Katholik</option>
					    <option value="4">4 - Hindu</option>
					    <option value="5">5 - Budha</option>
					    <option value="6">6 - Lainnya</option>
					  </select>
					</td>
					<td>
					  <input
				class=boxdefault size=7 name=agama maxlength="20" disabled>
					</td>
				      </tr>
				    </table>
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Status Perkawinan<font color="#000099" class="asterish">
				    *</font></td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <select name=stat_kwn boxdefault2 class="boxdefault" onChange="akwn.value=akta_kwn.options[akta_kwn.options.selectedIndex].value;return validate3()">
				      <option value="0">-- Pilih Status Perkawinan --</option>
				      <option value="1">1 - Belum Kawin</option>
				      <option value="2">2 - Kawin</option>
				      <option value="3">3 - Cerai Hidup</option>
				      <option value="4">4 - Cerai Mati</option>
				    </select>

				  </td>
				</tr>
				<tr>
				  <td valign="top">Akta Perkawinan/Buku Nikah
				    <font color="#000099" class="asterish">*</font></td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">

<select class="boxdefault" name="akta_kwn" onChange="return validate4()">
				      <option value="0">-- Pilih Akta Perkawinan --</option>
				      <option value="1">1 - Tidak Ada</option>
				      <option value="2">2 - Ada</option>
				    </select>
<input type=hidden name='akwn' value="">
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Nomor Akta Perkawinan/Buku
				    Nikah</td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <input
				class=boxdefault size=22 name=no_akta_kwn maxlength="40">
<input type=hidden name='noakwn' value="0">
				  </td>
				</tr>
				<tr>
				  <td valign="top">Tanggal Perkawinan</td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
				    <table width="100" border="0" cellspacing="3" cellpadding="0">
				      <tr>
					<td>
					  <input
				class=boxdefault size=2 name=tgl_kwn_dd maxlength="2" onKeyUp="return tab6()">
					</td>
					<td>/ </td>
					<td>
					  <input
				class=boxdefault size=2 name=tgl_kwn_mm maxlength="2"  onKeyUp="return tab7()">
					</td>
					<td>/</td>
					<td>
					  <input
				class=boxdefault size=4 name=tgl_kwn_yy maxlength="4"  onKeyUp="return tab8()">
					</td>
				      </tr>
				    </table>
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Akta Perceraian/Surat Cerai<font color="#000099" class="asterish">
				    *</font> </td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <select
		  		  class="boxdefault" name="akta_crai" onChange="return validate6()">
				      <option value="0">-- Pilih Akta Perceraian --</option>
				      <option value="1">1 - Tidak Ada</option>
				      <option value="2">2 - Ada</option>
				    </select>
				  </td>
				</tr>
				<tr>
				  <td valign="top">Nomor Akta Perceraian/Surat
				    Cerai</td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
				    <input
				class=boxdefault size=22 name=no_akta_crai maxlength="40" onFocus="return validate7()" >
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Tanggal Perceraian</td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <table width="100" border="0" cellspacing="3" cellpadding="0">
				      <tr>
					<td>
					  <input
				class=boxdefault size=2 name=tgl_crai_dd maxlength="2"  onKeyUp="return tab9()">
					</td>
					<td>/ </td>
					<td>
					  <input
				class=boxdefault size=2 name=tgl_crai_mm maxlength="2"  onKeyUp="return tab10()">
					</td>
					<td>/</td>
					<td>
					  <input
				class=boxdefault size=4 name=tgl_crai_yy maxlength="4"  onKeyUp="return tab11()">
					</td>
				      </tr>
				    </table>
				  </td>
				</tr>
				<tr>
				  <td valign="top">Status Hubungan dlm Keluarga
				    <font color="#000099" class="asterish">*</font></td>
				  <td valign="top">:</td>
			  <td colspan="2" valign="top">
 <select name="stat_hbkel" boxdefault2 class="boxdefault">
                  <option value="0">-- Pilih Status Hub. dalam Keluarga--</option>
				      <option value="1">1 - Kepala Keluarga</option>

				    </select>

<input type="hidden" name="state" value="0">

				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Kelainan Fisik dan Mental <font color="#000099" class="asterish">*</font>
				  </td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <select
		  		  class="boxdefault" name="klain_fisik" onChange="return validate8()">
				      <option value="0">-- Pilih Kelainan --</option>
				      <option value="1">1 - Tidak Ada</option>
				      <option value="2">2 - Ada</option>
				    </select>
				  </td>
				</tr>
				<tr>
				  <td valign="top">Penyandang Cacat</td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
				    <select
		  name=pnydng_cct boxdefault2 class="boxdefault">
				      <option value="0">-- Pilih Penyandang Cacat --</option>
				      <option value="1">1 - Cacat Fisik</option>
				      <option value="2">2 - Cacat Netra/Buta</option>
				      <option value="3">3 - Cacat Rungu/Wicara</option>
				      <option value="4">4 - Cacat Mental/Jiwa</option>
				      <option value="5">5 - Cacat Fisik dan Mental</option>
				      <option value="6">6 - Cacat Lainnya</option>
				    </select>
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">Pendidikan Terakhir<font color="#000099" class="asterish">
				    *</font> </td>
				  <td valign="top">:</td>
				  <td width="210" valign="top">
				    <select
		  name=pddk_akh boxdefault2 class="boxdefault">
				      <option value="0">-- Pilih Pendidikan Terakhir --</option>
				      <option value="1">1 - Tidak/Belum Sekolah</option>
				      <option value="2">2 - Tidak Tamat SD/Sederajat</option>
				      <option value="3">3 - Tamat SD/Sederajat</option>
				      <option value="4">4 - SLTP/Sederajat</option>
				      <option value="5">5 - SLTA/Sederajat</option>
				      <option value="6">6 - Diploma I/II</option>
				      <option value="7">7 - Akademi/Diploma III/S. Muda</option>
				      <option value="8">8 - Diploma IV/Strata I</option>
				      <option value="9">9 - Strata II</option>
				      <option value="10">10 - Strata III</option>
				    </select>
				  </td>
				</tr>
				<tr>
				  <td valign="top">Jenis Pekerjaan <font color="#000099" class="asterish">*</font></td>
				  <td valign="top">:</td>
				  <td colspan="2" valign="top">
  <select  name=jenis_pkrjn boxdefault2 class="boxdefault" onblur="checkpkrjn(pddk_akh.selectedIndex,jenis_pkrjn.selectedIndex)">
				      <option value="0">-- Pilih Jenis Pekerjaan --</option>
				      <option value="1">1 - Pelajar/Mahasiswa</option>
				      <option value="2">2 - Mengurus Rumah Tangga</option>
				      <option value="3">3 - Pensiunan</option>
				      <option value="4">4 - Belum/Tidak Bekerja</option>
				      <option value="5">5 - Petani/Pekebun</option>
				      <option value="6">6 - Peternak</option>
				      <option value="7">7 - Nelayan/Perikanan</option>
				      <option value="8">8 - Industri</option>
				      <option value="9">9 - Konstruksi</option>
				      <option value="10">10 - Perdagangan</option>
				      <option value="11">11 - Transportasi</option>
				      <option value="12">12 - Pegawai Negeri Sipil</option>
				      <option value="13">13 - Tentara Nasional Indonesia</option>
				      <option value="14">14 - Kepolisian R.I.</option>
				      <option value="15">15 - Jasa Lainnya</option>
				      <option value="16">16 - Lainnya</option>
				    </select>
				  </td>
				  <td width="12">&nbsp;</td>
				  <td valign="top">&nbsp;</td>
				  <td valign="top">&nbsp;</td>
				  <td width="210">&nbsp;</td>
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
				      Orangtua</span></div>
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
				    <table width="650" border="0" cellspacing="3" cellpadding="2">
				      <tr>
					<td>NIK Ibu</td>
					<td>:</td>
					<td>
					  <input
				class=boxdefault size=16 name=nik_ibu maxlength="16" onKeyUp="return num(form1.nik_ibu)">
					</td>
					<td width="8"><b> <i><b>
					  </b></i></b></td>
					<td width="10"><img src="images/dot.gif" width="5" height="1"></td>
					<td>Nama Lengkap Ibu <font color="#000099" class="asterish">*</font>
					</td>
					<td>:</td>
					<td colspan="2">
					  <input
				class=boxdefault size=22 name=nama_lgkp_ibu maxlength="60" onKeyUp="return char(form1.nama_lgkp_ibu)">
					</td>
				      </tr>
				      <tr>
					<td>NIK Ayah</td>
					<td>:</td>
					<td>
					  <input
				class=boxdefault size=16 name=nik_ayh maxlength="16">
					</td>
					<td><b> <i><b>
					  </b></i></b></td>
					<td width="10">&nbsp;</td>
					<td>Nama Lengkap Ayah</td>
					<td>:</td>
					<td colspan="2">
					  <input
				class=boxdefault size=22 name=nama_lgkp_ayh maxlength="60">
					</td>
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
					<td>Nama Ketua RT <font color="#000099" class="asterish"> </font></td>
					<td>:</td>
					<td colspan="2">
					  <input
				class=boxdefault size=22 name=nama_ket_rt maxlength="60" onKeyUp="return char(form1.nama_ket_rt)">
					</td>
					<td><img src="images/dot.gif" width="10" height="1"></td>
					<td>Nama Ketua RW</td>
					<td>:</td>
					<td colspan="2">
					  <input
				class=boxdefault size=22 name=nama_ket_rw maxlength="60" onKeyUp="return char(form1.nama_ket_rw)">
					</td>
				      </tr>
				      <tr>
					<td>Nama Petugas Registrar <font color="#000099" class="asterish">*</font></td>
					<td>:</td>
					<td colspan="2">
					  <input
				class=boxdefault size=22 name=nama_pet_reg maxlength="9" onKeyUp="return char(form1.nama_pet_reg)">
					</td>
					<td>&nbsp;</td>
					<td>NIP Petugas Registrar <font color="#000099" class="asterish">*</font></td>
					<td>:</td>
					<td colspan="2">
					  <input
				class=boxdefault size=22 name=nip_pet_reg maxlength="60" onKeyUp="return num(form1.nip_pet_reg)">
					</td>
				      </tr>
				      <tr>
					<td>Nama Petugas Entri Data</td>
					<td>:</td>
					<td colspan="2"><b><font color="#000066">&lt;
					  relasional dengan user admin&gt;</font></b></td>
					<td>&nbsp;</td>
					<td>NIP Petugas Entri Data</td>
					<td>:</td>
					<td colspan="2"><b><font color="#000066">&lt;
					  relasional dengan user admin&gt;</font></b>
					</td>
				      </tr>
				      <tr>
					<td>Tanggal Entri Data<font color="#000099" class="asterish">
					  *</font></td>
					<td>:</td>
					<td colspan="2">
					  <table width="100" border="0" cellspacing="3" cellpadding="0">
					    <tr>
					      <td>

						<input
				class=boxdefault size=2 name=no_akta_lhr45 maxlength="2" onFocus="this.blur()">
					      </td>
					      <td>/ </td>
					      <td>
						<input
				class=boxdefault size=2 name=no_akta_lhr225 maxlength="2"  onFocus="this.blur()">
					      </td>
					      <td>/</td>
					      <td>
						<input
				class=boxdefault size=4 name=no_akta_lhr325 maxlength="4"  onFocus="this.blur()">
<script language="JavaScript">

 today = new Date();

 month = today.getMonth()+1;

 date=today.getDate();
 year = today.getYear();
form1.no_akta_lhr45.value=date
form1.no_akta_lhr225.value=month
form1.no_akta_lhr325.value=year

</script>
                                          </td>
					    </tr>
					  </table>
					  <b></b></td>
					<td>&nbsp;</td>
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
			  <input class=boxstandard type="submit" name="b" value="SIMPAN" onClick="return validate()">
			  </b></div>
		      </td>
		      <td>
			<div align="center"><b>
			  <input class=boxstandard type="submit" value="BATAL" name="bat">
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
		</td>
	      </tr>
	    </table>
	</tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%
   if(flag.equals("1"))
   {
     out.println("<script language=javascript>alert('Data Sudah disimpan !')</script>");
   }
%>

</form>
<p class="linkyellow">&nbsp;</p>
</BODY></HTML>
<%
}

else
{

   {
      response.sendRedirect("index.jsp");
   }
}
    }
    catch (Exception ne)
    {
      ne.printStackTrace();
    }

%>

