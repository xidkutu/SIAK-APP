<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
    String no_kel,nama_kel,select,id1=null,flag=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;
    Vector v1,v_prop,v_kab,v_kec,v_kel;
    int i,j,k,l1,m1,n1,o,p,q,r,s,t;
%>


<%
   try
   {
     v = new Vector();
     record = (UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
      flag=request.getParameter("n");
%>
<script type="text/javascript" src="Templates/tabpane.js">
</script>
<SCRIPT language=JavaScript src="scripts/Kawin.js">
</SCRIPT>

<script language="text/javaScript">
var tp1;
</script>

<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="topcapil.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20">
                  <div align="center"><span class="submenu">Pencatatan Perkawinan</span><br>
                    <br>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
                       <td>
                          <jsp:include page="data_wilayah.jsp"> <jsp:param name="level" value="2"/>
                            <jsp:param name="no_prop" value="<%=record.getNoProp()%>"/>
                            <jsp:param name="nama_prop" value="<%=record.getNamaProp()%>"/>
                            <jsp:param name="no_kab" value="<%=record.getNoKab()%>"/>
                            <jsp:param name="nama_kab" value="<%=record.getNamaKab()%>"/>
                          </jsp:include>
			</td>
        </tr>
      </table>
    </td>
  </tr>
  <input type="hidden" name="buttondisabled" value="0">
</table width="100%" border="0" cellspacing="5" cellpadding="5">
<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
  <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td valign="top">
                  <div align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                      <tr>
                        <td align="center">
<div class="tab-pane" id="tab-pane-1" style="postion:absolute">

<script type="text/javascript">

    tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);
</script>

  <div class="tab-page" style="postion:absolute"  id="tabPage1">
    <h2 class="tab">Data Suami</h2>

		<script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage1"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="5" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Suami<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_suami" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_suami)" onblur="validateWNSuami(form1.nik_suami)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=pddk_akh_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Tidak Tamat SD/Sederajat</option>
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
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">-</td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">

                                <select
                  name=agama_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="1">1 - Islam</option>
                                  <option value="2">2 - Kristen</option>
                                  <option value="3">3 - Katholik</option>
                                  <option value="4">4 - Hindu</option>
                                  <option value="5">5 - Budha</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_suami1 boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
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
                            </tr>
                            <tr>
                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=ktrunan_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%">- </td>
                            </tr>
                            <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kwn_ke_suami" size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_suami)" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Istri Yang Ke (bagi poligami)</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="istri_ke" size="2" maxlength="2" class="boxdefault"  onKeyUp="return num(form1.istri_ke)" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                          </table>
                        </td>
  </tr>
</table>

   </div>


  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
    <h2 class="tab">Data Ayah dari Suami</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage2"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton" value="Ada" onClick="form1.nik_ayh_dr_suami.disabled=false; form1.nik_ayh_dr_suami.focus();">
                                Ada<br>
                                <input type="radio" name="radiobutton" value="Tidak Ada" onClick="form1.nik_ayh_dr_suami.disabled=true">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ayah dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton1" value="1" >
                                WNI<br>
                                <input type="radio" name="radiobutton1" value="2" >
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh_dr_suami" size="17" class="boxdefault" maxlength="17" disabled onblur="validateWNAyah(form1.nik_ayh_dr_suami,form1.radiobutton1)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh_suami" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select
                  name=agama_ayh_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="1">1 - Islam</option>
                                  <option value="2">2 - Kristen</option>
                                  <option value="3">3 - Katholik</option>
                                  <option value="4">4 - Hindu</option>
                                  <option value="5">5 - Budha</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ayh_suami" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Tanggal Lahir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_suami_dd maxlength="2" disabled >
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_suami_mm maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ayh_suami_yy maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_ayh_suami1 boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
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
                            </tr>
                            <tr>
                              <td width="22%"> Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <input type="text" name="alamat_ayh_suami" size="30" class="boxdefault" maxlength="120" disabled>
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="rt_ayh_suami" size="3" class="boxdefault" maxlength="3" disabled>
                                RW
                                <input type="text" name="rw_ayh_suami" size="3" class="boxdefault" maxlength="3" disabled>
                                Dusun/Kampung/Dukuh
                                <input type="text" name="dusun_ayh_suami" size="22" class="boxdefault" maxlength="40" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ayh_suami" size="5" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ayh_suami" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                   <input type="text" name="nama_prop_ayh_suami" size="30" class="boxdefault" maxlength="60" disabled>
                             </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                          <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ayh_suami" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
<div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
</div>
</td>
<td width="1%">:</td>
<td width="23%">
<input type="text" name="nama_kec_ayh_suami" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ayh_suami" size="30" class="boxdefault" maxlength="60" disabled>
</td>
</tr>
</table>
</td>
      </tr>
    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage3">
    <h2 class="tab">Data Ibu dari Suami</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage3"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" width="100%" cellpadding="2" cellspacing="2" border="0">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ibu dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton2" value="Ada" onClick="form1.nik_ibu_dr_suami.disabled=false; form1.nik_ibu_dr_suami.focus();">
                                Ada<br>
                                <input type="radio" name="radiobutton2" value="Tidak Ada" onClick="form1.nik_ibu_dr_suami.disabled=true">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu dari Suami<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton3" value="1">
                                WNI<br>
                                <input type="radio" name="radiobutton3" value="2">
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu_dr_suami" size="17" class="boxdefault" maxlength="17" onblur="validateWNIbu(form1.nik_ibu_dr_suami, form1.radiobutton3)" disabled>
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu_suami" size="22" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ibu_suami" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="1">1 - Islam</option>
                                  <option value="2">2 - Kristen</option>
                                  <option value="3">3 - Katholik</option>
                                  <option value="4">4 - Hindu</option>
                                  <option value="5">5 - Budha</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ibu_suami" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_suami_dd maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_suami_mm maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ibu_suami_yy maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  name=jenis_pkrjn_ibu_suami1 boxdefault2 class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
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
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%"> Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <input type="text" name="alamat_ibu_suami" size="30" class="boxdefault" maxlength="120" disabled>
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="rt_ibu_suami" size="3" class="boxdefault" maxlength="3" disabled>
                                RW
                                <input type="text" name="rw_ibu_suami" size="3" class="boxdefault" maxlength="3" disabled>
                                Dusun/Kampung/Dukuh
                                <input type="text" name="dusun_ibu_suami" size="22" class="boxdefault" maxlength="40" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ibu_suami" size="5" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ibu_suami" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
</td>
<td width="1%">:</td>
        <td width="23%">
     <input type="text" name="nama_prop_ibu_suami" size="30" class="boxdefault" maxlength="60" disabled>
       </td>
<td width="3%">&nbsp;</td>
<td width="24%">
<div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
</div>
</td>
                              <td width="1%">:</td>
                              <td width="26%">
   <input type="text" name="nama_kab_ibu_suami" size="30" class="boxdefault" maxlength="60" disabled>
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ibu_suami" size="30" class="boxdefault" maxlength="60" disabled>
</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ibu_suami" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage4">
    <h2 class="tab">Data Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage4"));
                </script>
               <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <div align="center"> </div>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Istri<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_istri" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_istri)" onblur="validateWNIstri(form1.nik_istri)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Nama Lengkap</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=pddk_akh_istri boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                  <option value="1">1 - Tidak/Belum Sekolah</option>
                                  <option value="2">2 - Tidak Tamat SD/Sederajat</option>
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
                              </td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">-</td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_istri" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="1">1 - Islam</option>
                                  <option value="2">2 - Kristen</option>
                                  <option value="3">3 - Katholik</option>
                                  <option value="4">4 - Hindu</option>
                                  <option value="5">5 - Budha</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn_istri boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
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
                            </tr>
                            <tr>
                              <td width="22%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="ktrunan_istri" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Status Perkawinan Sebelum Nikah</td>
                              <td width="1%">:</td>
                              <td width="26%">- </td>
                            </tr>
                            <tr>
                              <td width="22%">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kwn_ke_istri" size="2" maxlength="2" class="boxdefault" onKeyUp="return num(form1.kwn_ke_istri)" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Kewarganegaraan</td>
                              <td width="1%">:</td>
                              <td width="26%">- </td>
                            </tr>
                            <tr>
                              <td width="22%">Kebangsaan (Bagi WNA)</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">&nbsp;</td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage5">
    <h2 class="tab">Data Ayah dari Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
                </script>


                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ayah dari Istri<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton4" value="Ada"  onClick="form1.nik_ayh_dr_istri.disabled=false; form1.nik_ayh_dr_istri.focus();">
                                Ada<br>
                                <input type="radio" name="radiobutton4" value="Tidak Ada"  onClick="form1.nik_ayh_dr_istri.disabled=true">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p>Warga Negara Ayah dari Istri<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton5" value="1"  >
                                WNI<br>
                                <input type="radio" name="radiobutton5" value="2"  >
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh_dr_istri" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ayh_dr_istri)" disabled onblur="validateWNAyah(form1.nik_ayh_dr_istri,form1.radiobutton5)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh_istri" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ayh_istri)" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ayh_istri" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="1">1 - Islam</option>
                                  <option value="2">2 - Kristen</option>
                                  <option value="3">3 - Katholik</option>
                                  <option value="4">4 - Hindu</option>
                                  <option value="5">5 - Budha</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ayh_istri" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ayh_istri)" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_istri_dd maxlength="2" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ayh_istri_mm maxlength="2" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ayh_istri_yy maxlength="4" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  name=jenis_pkrjn_ayh_istri1 boxdefault2 class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
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
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ayh_istri" size="30" class="boxdefault" maxlength="120" disabled>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="rt_ayh_istri" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ayh_istri)" disabled>
                                  RW
                                  <input type="text" name="rw_ayh_istri" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ayh_istri)" disabled>
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ayh_istri" size="22" class="boxdefault" maxlength="40" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ayh_istri" size="5" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kpos_ayh_istri)" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ayh_istri" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ayh_istri" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kab_ayh_istri" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ayh_istri" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ayh_istri" size="30" class="boxdefault" maxlength="60" disabled>
</td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage6">
    <h2 class="tab">Data Ibu dari Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="22%">NIK Ibu dari Istri<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="radio" name="radiobutton6" value="Ada" onClick="form1.nik_ibu_dr_istri.disabled=false; form1.nik_ibu_dr_istri.focus();">
                                Ada<br>
                                <input type="radio" name="radiobutton6" value="Tidak Ada" onClick="form1.nik_ibu_dr_istri.disabled=true">
                                Tidak Ada</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p>Warga Negara Ibu dari Istri<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton7" value="1" >
                                WNI<br>
                                <input type="radio" name="radiobutton7" value="2" >
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu_dr_istri" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_ibu_dr_istri)" disabled onblur="validateWNIbu(form1.nik_ibu_dr_istri,form1.radiobutton7)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu_istri" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.nama_ibu_istri)" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <select size="1" name="agama_ibu_istri" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Agama --</option>
                                  <option value="1">1 - Islam</option>
                                  <option value="2">2 - Kristen</option>
                                  <option value="3">3 - Katholik</option>
                                  <option value="4">4 - Hindu</option>
                                  <option value="5">5 - Budha</option>
                                </select>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tmpt_lhr_ibu_istri" size="22" class="boxdefault" maxlength="60" onKeyUp="return char(form1.tmpt_lhr_ibu_istri)" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_istri_dd maxlength="2" onKeyUp="return tab9()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_lhr_ibu_istri_mm maxlength="2" onKeyUp="return tab10()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_lhr_ibu_istri_yy maxlength="4" onKeyUp="return tab11()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select
                  name=jenis_pkrjn_ibu_istri1 boxdefault2 class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Jenis
                                    Pekerjaan --</option>
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
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">
                                  <input type="text" name="alamat_ibu_istri" size="30" class="boxdefault" maxlength="120" disabled>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="rt_ibu_istri" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rt_ibu_istri)" disabled>
                                  RW
                                  <input type="text" name="rw_ibu_istri" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.rw_ibu_istri)" disabled>
                                  Dusun/Kampung/Dukuh
                                  <input type="text" name="dusun_ibu_istri" size="22" class="boxdefault" maxlength="40" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Kode Pos</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <input type="text" name="kpos_ibu_istri" size="5" class="boxdefault" maxlength="5" onKeyUp="return num(form1.kpos_ibu_istri)" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Telepon</div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="tlp_ibu_istri" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Provinsi <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_prop_ibu_istri" size="30" class="boxdefault" maxlength="60" disabled>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">

<input type="text" name="nama_kab_ibu_istri" size="30" class="boxdefault" maxlength="60" disabled>
</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <div align="right">Nama Kecamatan <font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
<input type="text" name="nama_kec_ibu_istri" size="30" class="boxdefault" maxlength="60" disabled>                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <div align="right">Nama Desa/Kelurahan<font color="#000099" class="asterish">*</font>
                                  </div>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
<input type="text" name="nama_kel_ibu_istri" size="30" class="boxdefault" maxlength="60" disabled>                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage7">
    <h2 class="tab">Data Saksi I</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage7"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table cellpadding="2" cellspacing="2" border="0" width="100%" align="center">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi I<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi1" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi1)">
                                </p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat lahir</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%">- </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn1_sksi1 boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
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
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page" name="t1" style="postion:absolute" id="tabPage8">
    <h2 class="tab">Data Saksi II</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage8"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table align="center" cellpadding="2" cellspacing="2" border="0" width="100%">
                            <tr>
                              <td colspan="7"> </td>
                            </tr>
                            <tr>
                              <td colspan="7">
                                <p style="line-height: 100%">
                                <p style="line-height: 100%">
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="23%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_sksi2)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">-</td>
                            </tr>
                            <tr>
                              <td width="22%" valign="top">Alamat</td>
                              <td width="1%" valign="top">:</td>
                              <td colspan="5">-</td>
                            </tr>
                            <tr>
                              <td width="22%">Agama</td>
                              <td width="1%">:</td>
                              <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select
                  name=jenis_pkrjn1_sksi2 boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
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
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>

 </div>

<script type="text/javascript">
setupAllTabs();
form1.nik_suami.focus();
</script>
</tr>

                    </table>
                  </div>
                </td>
                <td>&nbsp;</td>
              </tr>

              <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
 </div>
              </td>
                      </tr>
<br>
<table width="400" border="0" cellspacing="5" cellpadding="5" align="center">
  <tr>
      <td width="130">
        <div align="center"><b>
        <input class=boxstandard type="button" value="KONFIRMASI"  name="kon"  onClick="return kawin()">
        </b></div>
    </td>
      <td width="104">
        <div align="center"><b> </b></div>
      <div align="center"><b>
        <input class=boxstandard type="button" value="SIMPAN" name="sim"  onClick="return simpan()" disabled>
        </b></div>
    </td>
      <td width="97">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KELUAR" name="kel" onclick="document.location='Menu_Capil_KabKota.jsp'">
          </b></div>
    </td>
      <td width="4">
        <div align="center"><b> </b></div>
    </td>
  </tr>
  <tr>
    <td colspan="4">
      <div align="center"><font color="#003399">Keterangan : </font><font color="#000099" class="asterish">*</font><font color="#003399">Data
        harus diisi sesuai kondisi sebenarnya</font></div>
    </td>
  </tr>
</table>

<input type=hidden name="kabtot" value="<%=i%>">
<input type=hidden name="kectot" value="<%=j%>">
<input type=hidden name="keltot" value="<%=k%>">

<input type=hidden name="kabtot1" value="<%=l1%>">
<input type=hidden name="kectot1" value="<%=m1%>">
<input type=hidden name="keltot1" value="<%=n1%>">

<input type=hidden name="kabtot2" value="<%=o%>">
<input type=hidden name="kectot2" value="<%=p%>">
<input type=hidden name="keltot2" value="<%=q%>">

<input type=hidden name="kabtot3" value="<%=r%>">
<input type=hidden name="kectot3" value="<%=s%>">
<input type=hidden name="keltot3" value="<%=t%>">
<input type=hidden name="today" value="<%=record.getToday()%>">


</form>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e){}

%>