<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>

<%!
    int kk;
    UserInfo1 record;
    ServiceController factory;
    Get_AllWilayahaHome home;
    Get_AllWilayaha remote1;
    Vector v_kel;
    String nprop="",nkab="",nkec="",nkel="";
    String nama_prop="",nama_kab="",nama_kec="",nama_kel="";
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");
    try
     {
    nprop=record.getNoProp();
    nkab=record.getNoKab();
    nkec=record.getNoKec();
    nama_prop=record.getNamaProp();
    nama_kab=record.getNamaKab();
    nama_kec=record.getNamaKec();

    System.out.println("Wni head biodata");

  if  (record != null)
    {
     factory=ServiceController.getInstance();
     home=(Get_AllWilayahaHome)factory.lookup("Get_AllWilayaha",Get_AllWilayahaHome.class);
     remote1 = home.create();
     WIlayahInfo obj=(WIlayahInfo)remote1.getWilayahWna(nprop,nkab,nkec);
     v_kel=obj.getWnakel();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="scripts/lurah.js">
</SCRIPT>

<SCRIPT language=JavaScript>
function ex()
{
var v=window.history.length;
history.go(-v);
}
function edi()
{
if(isNaN(perpindahan.nokk.value))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		perpindahan.nokk.value="";
		perpindahan.nokk.focus();
		return false;
}
for(var i=0; i < perpindahan.nokk.value.length; i++)
{
         if(perpindahan.nokk.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 perpindahan.nokk.value="";
                 perpindahan.nokk.focus();
	         return false;
               }
}
if(perpindahan.nokk.value=="")
{
                alert("Nomor Induk Kependudukan Belum Diisi!!" )
		perpindahan.nokk.value="";
		perpindahan.nokk.focus();
		return false;
}
}
function frmpost()
{
document.forms[0].action="Dis_Per_Wni.jsp";
document.forms[0].submit();
document.all['btnperiksa'].disabled=true;
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=perpindahan method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="45">
                        <div align="center"><span class="subtitle">Keterangan
                          Perpindahan WNI</span><br>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
                    <tr>
                      <td colspan="9" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="9" height="26">
                        <div align="center"><span class="subtitle">Data Wilayah</span></div>
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
                      <td>Kode-Nama Provinsi</td>
                      <td>:</td>
                      <td width="5">
                        <input
                                class=boxdefault size=4 name=no_prop_tmp onFocus="this.blur()" maxlength="2" value="<%=nprop%>">
                      </td>
                      <td width="33">
                        <input  class=boxdefault size=22 name=nama_prop_tmp onFocus="this.blur()" maxlength="60" value="<%=nama_prop%>">
                      </td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td>Kode-Nama Kabupaten/Kota</td>
                      <td>:</td>
                      <td width="8">
                        <input  class=boxdefault size=4 name=no_kab_tmp onFocus="this.blur()" maxlength="2" value="<%=nkab%>">
                      </td>
                      <td width="22">
                        <input class=boxdefault size=22 name=nama_kab_tmp onFocus="this.blur()" maxlength="60" value="<%=nama_kab%>">
                      </td>
                    </tr>
                    <tr>
                      <td>Kode-Nama Kecamatan</td>
                      <td>:</td>
                      <td width="5">
                        <input class=boxdefault size=4 name=no_kec_tmp onFocus="this.blur()" maxlength="2" value="<%=nkec%>">
                      </td>
                      <td>
         <input class=boxdefault size=22 name=nama_kec_tmp onFocus="this.blur()" maxlength="60" value="<%=nama_kec%>">
                      </td>
                      <td>&nbsp;</td>
                      <td>Kode-Nama Desa/Kelurahan</td>
                      <td>:</td>
                      <td width="8">
                        <input   class=boxdefault size=4 name=no_kel_tmp onFocus="this.blur()" maxlength="4">
                      </td>
                      <td width="22">
      <input type="hidden" name="nama_kel_tmp">
  <select name=nama_kel1 boxdefault2 class="boxdefault" onchange="no_kel_tmp.value=this.value;nama_kel_tmp.value=this.options[this.selectedIndex].text;nama_kep_des_tmp.value=setNamaLurah(this.selectedIndex);nip_lrh_tmp.value=setNipLurah(this.selectedIndex);">
                         <option selected>-- Pilih Desa/Kelurahan --</option>
       <%
               for(int n=0;n<v_kel.size();n++)
                {
      %>
              <option value="<%=((GetKel)v_kel.elementAt(n)).getNokel().trim()%>"><%=((GetKel)v_kel.elementAt(n)).getNamakel()%></option>
       <%
                }
         %>
      </select>

<%
for(int n=0;n<v_kel.size();n++)
{
%>
<input type="hidden" name="namapej<%=n%>" value="<%=((GetKel)v_kel.elementAt(n)).getNamaLur()%>">
<input type="hidden" name="nippej<%=n%>" value="<%=((GetKel)v_kel.elementAt(n)).getNipLur()%>">
<%
}
%>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                      <td>&nbsp;</td>
                      <td width="5">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td width="8">&nbsp;</td>
                      <td width="22">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
              </tr>
            </table>
           <table width="80%"  cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" >
              <tr>
                <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100" class="border">
                    <tr>
                      <td valign="top">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" valign="middle">
                              <div align="center"><span class="subtitle">Data
                                Daerah AsaI</span></div>
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
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="8" height="10">
                              <div align="center">
                                <table border="0" cellspacing="3" cellpadding="2" width="100%">
                                  <tr>
                                    <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                                  </tr>

                                    <tr>
                                      <td valign="top" width="24%">Nomor Kartu
                                        Keluarga<span class="asterish">*</span></td>
                                      <td valign="top" width="1%">:</td>
   <td colspan="6" valign="top">
<input class=boxdefault size=16 name=fg maxlength="16">
                                        <b>
<input class=boxstandard type=button value=PERIKSA name="btnperiksa" onclick="return frmpost()">
                                        </b><img src="images/dot.gif" width="10" height="1"></td>
                                    </tr>

                                  <tr>
                                    <td valign="top" width="24%">Nama Kepala Keluarga</td>
                                    <td valign="top" width="1%">:</td>
                                    <td colspan="5" valign="top"><font color="#003366"><b><font color="#003366"><b>&lt;get
                                      from system&gt;</b></font></b></font></td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">Alamat Asal<span class="asterish"></span></td>
                                    <td valign="top" width="1%">:</td>
                                    <td colspan="5" valign="top"> &lt;Alamat &gt;
                                      RT &lt;RT&gt; RW &lt;RW&gt; </td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Dusun/Kampung/Dukuh</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
                                    <td valign="top" colspan="5">&lt;dusun&gt;</td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Provinsi</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
                                    <td valign="top" width="16%"> &lt;provinsi&gt;</td>
                                    <td valign="top" width="6%">&nbsp;</td>
                                    <td valign="top" width="13%">
                                      <div align="right">Kabupaten/Kota</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
                                    <td valign="top" width="38%"> &lt;kab/kota&gt;</td>
                                  </tr>
                                  <tr>
                                    <td valign="top" width="24%">
                                      <div align="right">Kecamatan</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
                                    <td valign="top" width="16%"> &lt;kecamatan&gt;</td>
                                    <td valign="top" width="6%">&nbsp;</td>
                                    <td valign="top" width="13%">
                                      <div align="right">Desa/Kelurahan</div>
                                    </td>
                                    <td valign="top" width="1%">:</td>
                                    <td valign="top" width="38%"> &lt;desa/Kelurahan&gt;</td>
                                  </tr>
                                </table>
                                <img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="25">
                              <div align="center"><span class="subtitle">Data
                                Kepindahan</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="8" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Alasan Kepindahan<span class="asterish">*</span></td>
                            <td valign="top" width="6%">:</td>
                            <td colspan="6" valign="top">
                              <select name="als_pndh" class="boxdefault">
                                <option selected>-- Pilih Alasan Pindah --</option>
                                <option value="1">1 - Pekerjaan</option>
                                <option value="2">2 - Pendidikan</option>
                                <option value="3">3 - Keamanan</option>
                                <option value="4">4 - Kesehatan</option>
                                <option value="5">5 - Perumahan</option>
                                <option value="6">6 - Keluarga</option>
                                <option>7 - Lainnya</option>
                              </select>
                              <img src="images/dot.gif" width="10" height="1"></td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Alamat Tujuan Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="6%">:</td>
                            <td colspan="5" valign="top">
                              <input
                                class=boxdefault size=40 name=alamat_tjpndh maxlength="120">
                              RT<span class="asterish">*</span>
                              <input
                                class=boxdefault size=3 name=no_rt_tjpndh maxlength="3">
                              RW
                              <input
                                class=boxdefault size=3 name=no_rw_tjpndh maxlength="3">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="6%">:</td>
                            <td valign="top" colspan="5">
                              <input
                                class=boxdefault size=22 name=dusun_tjpndh maxlength="60">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">
                              <div align="right">Provinsi<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="6%">:</td>
                            <td valign="top" width="10%">
                              <select   name=nama_prop_ibu boxdefault2 class="boxdefault">
                                <option selected>-- Pilih Provinsi --</option>
                                <option>1. Sumatra</option>
                                <option>2. Jawa</option>
                                <option>3. Kalimantan</option>
                                <option>4. Sulawesi</option>
                                <option>5. -----------------</option>
                              </select>
                            </td>
                            <td valign="top" width="19%">&nbsp;</td>
                            <td valign="top" width="8%">
                              <div align="right">Kabupaten/Kota<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="10%">:</td>
                            <td valign="top" width="16%">
                              <select

                  name=nama_kab_ibu boxdefault2 class="boxdefault">
                                <option selected>-- Pilih Kabupaten/Kota --</option>
                                <option>1. Pasar Minggu</option>
                                <option>2. Cikoko</option>
                                <option>3. Kalibata</option>
                                <option>4. Duren Tiga</option>
                                <option>5. -----------------</option>
                              </select>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">
                              <div align="right">Kecamatan<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="6%">:</td>
                            <td valign="top" width="10%">
                              <select

                  name=nama_kec_ibu boxdefault2 class="boxdefault">
                                <option selected>-- Pilih Kecamatan --</option>
                                <option>1. Nanggalo</option>
                                <option>2. Cikoko</option>
                                <option>3. Kalibata</option>
                                <option>4. Duren Tiga</option>
                                <option>5. -----------------</option>
                              </select>
                            </td>
                            <td valign="top" width="19%">&nbsp;</td>
                            <td valign="top" width="8%">
                              <div align="right">Desa/Kelurahan<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="10%">:</td>
                            <td valign="top" width="16%">
                              <select

                  name=nama_kel_ibu boxdefault2 class="boxdefault">
                                <option selected>-- Pilih Desa/Kelurahan --</option>
                                <option>1. Pasar Minggu</option>
                                <option>2. Cikoko</option>
                                <option>3. Kalibata</option>
                                <option>4. Duren Tiga</option>
                                <option>5. -----------------</option>
                              </select>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Jenis Kepindahan<span class="asterish">*</span></td>
                            <td valign="top" width="6%">:</td>
                            <td colspan="5" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                              <select name="jenis_kpndhn" class="boxdefault">
                                <option selected>-- Pilih Jenis Kepindahan --</option>
                                <option value="1">1 - Kepala Keluarga</option>
                                <option value="2">2 - Kepala Keluarga dan Seluruh
                                Anggota Keluarga</option>
                                <option value="3">3 - Kepala Keluarga dan Sebagian
                                Anggota Keluarga</option>
                                <option value="4">4 - Anggota Keluarga</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Status Nomor KK Bagi
                              Yang Tidak Pindah</td>
                            <td valign="top" width="6%">:</td>
                            <td colspan="2" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">
                              <select name="stat_no_kk_tdkpdh" size="1" class="boxdefault">
                                <option selected>-- Pilih Status Nomor KK Bagi
                                Yang Tidak Pindah --</option>
                                <option value="1">1 - Numpang KK</option>
                                <option value="2">2 - Membuat KK Baru </option>
                                <option value="3">3 - Tidak Ada Anggota Keluarga
                                Yang Tinggal</option>
                                <option value="4">4 - Nomor KK Tetap</option>
                              </select>
<input type="submit" name="Submit432" value="KK Baru" class="boxstandard">
<input type="submit" name="Submit4222" value="KK Numpang" class="boxstandard">
</font></td>

                                           </tr>
                          <tr>
                            <td valign="top" width="11%">Status Nomor KK Bagi
                              Yang Pindah</td>
                            <td valign="top" width="6%">:</td>
                            <td colspan="5" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">
                              <select name="stat_no_kk_pdh" class="boxdefault">
                                <option selected>-- Pilih Status Nomor KK Bagi
                                Yang Pindah --</option>
                                <option value="1">1 - Numpang KK</option>
                                <option value="2">2 - Membuat KK Baru</option>
                                <option>3 - Nama Kepala Keluarga dan Nomor KK
                                Tetap</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Rencana Tanggal Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="6%">:</td>
                            <td colspan="5" valign="top">
                              <table width="100" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
                                    <input
                                class=boxdefault size=2 name=renc_tgl_pindah maxlength="2">
                                  </td>
                                  <td>/ </td>
                                  <td>
                                    <input
                                class=boxdefault size=2 name=renc_bln_pindah maxlength="2">
                                  </td>
                                  <td>/</td>
                                  <td>
                                    <input
                                class=boxdefault size=4 name=renc_thn_pindah maxlength="4">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Klasifikasi Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="6%">:</td>
                            <td valign="top" colspan="5"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                              <select name="klasf_pndh" class="boxdefault">
                                <option selected>-- Pilih Klasifikasi Pindah --</option>
                                <option value="1">1 - Dalam Satu Desa/Kelurahan</option>
                                <option value="2">2 - Antar Desa/Kelurahan</option>
                                <option value="3">3 - Antar Kecamatan</option>
                                <option value="4">4 - Antar Kabupaten/Kota</option>
                                <option value="5">5 - Antar Provinsi</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr>
                            <td valign="top" width="11%">Keluarga Yang Pindah</td>
                            <td valign="top" width="6%">:</td>
                            <td valign="top" colspan="5">&nbsp;</td>
                          </tr>
                          <tr>
                            <td valign="top" colspan="7">
                              <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
                                <tr>
                                  <td width="5" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td width="1" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td valign="middle" align="center">
                                    <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                      <tr>
                                        <td class="C-Fonts" width="4%">
                                          <div align="center"> No.</div>
                                        </td>
                                        <td class="C-Fonts" width="20%">
                                          <div align="center">NIK</div>
                                        </td>
                                        <td class="C-Fonts" width="31%">
                                          <div align="center">Nama Lengkap</div>
                                        </td>
                                        <td class="C-Fonts">
                                          <div align="center">SHDK dengan KK Asal</div>
                                        </td>
                                        <td class="C-Fonts" width="10%">
                                          <div align="center">Pilih</div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="C-Field" width="4%">
                                          <div align="center"> 1</div>
                                        </td>
                                        <td class="C-Field" width="20%">
                                          <div align="center">&lt;get from kk&gt;
                                          </div>
                                        </td>
                                        <td class="C-Field" width="31%">
                                          <div align="center">&lt;get from nik&gt;
                                          </div>
                                        </td>
                                        <td class="C-Field" width="19%">
                                          <div align="center"> &lt;get from nik&gt;</div>
                                        </td>
                                        <td class="C-Field" width="10%">
                                          <div align="center">
                                            <input type=checkbox name=ext32222622>
                                          </div>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td height="1" width="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                                  <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                  <td width="1" height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">
                        <table border="0" cellspacing="3" cellpadding="2" width="100%">
                          <tr>
                            <td colspan="9" height="10">
                              <div align="center"><img src="images/dot.gif" width="8" height="11" hspace="5"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Administrasi</span></div>
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
                            <td valign="top" width="30%">Nama Kepala Desa/ Kelurahan<span class="asterish">*</span>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top">
                <input class=boxdefault size=22 name=nama_kep_des_tmp maxlength="60" onfocus="this.blur()">
                            </td>
                            <td width="1%"><img src="images/dot.gif" width="10" height="1"></td>
                            <td valign="top" width="15%">NIP Lurah</td>
                            <td valign="top" width="2%">:</td>
                            <td colspan="2" valign="top" width="28%">
                              <input   class=boxdefault size=9 name=nip_lrh_tmp maxlength="9" onfocus="this.blur()">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="30%">Nama Camat<span class="asterish">*</span>
                            </td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top">
                              <input  class=boxdefault size=22 name=nama_cmat_tmp maxlength="60" value="<%=record.getKecNamaPej()%>" onfocus="this.blur()">
                            </td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="15%"> NIP Camat <span class="asterish">*</span>
                            </td>
                            <td valign="top" width="2%">:</td>
                            <td colspan="2" valign="top" width="28%">
                              <input  class=boxdefault size=9 name=nip_cmat_tmp maxlength="9" value="<%=record.getKecNipPej()%>" onfocus="this.blur()">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="14%">Nama Petugas Entri</td>
                            <td valign="top" width="1%">:</td>
                            <td colspan="2" valign="top"><b><%=record.getNamaPetugas()%></b>
                             <input type="hidden" name="nama_pet_tmp" value="<%=record.getNamaPetugas()%>">
 </td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="15%">NIP Petugas Entri</td>
                            <td valign="top" width="2%">:</td>
                              <td colspan="2" valign="top" width="28%"> <b><%=record.getNipPetugas()%></b>
                             <input type="hidden" name="nip_pet_tmp" value="<%=record.getNipPetugas()%>">

</td>
                          </tr>
                          <tr>
                            <td valign="top" width="30%"><img src="images/dot.gif" width="1" height="1">Tanggal
                              Entri</td>
                            <td valign="top" width="1%">:</td>
                            <input type="hidden" name="today" value="<%=record.getToday()%>">
                            <td colspan="2" valign="top"> <b><%=record.getToday()%> </b></td>
                            <td valign="top" width="1%">&nbsp;</td>
                            <td valign="top" width="23%">&nbsp;</td>
                            <td valign="top" width="2%">&nbsp;</td>
                            <td colspan="2" valign="top" width="28%">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">&nbsp;</td>
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
            <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b>
                    <input class=boxstandard disabled type=button value=SIMPAN name="submit222">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                </td>
                <td>
           <div align="center"><b>
         <input class=boxstandard type=button value=KELUAR name="submit2322" onClick="document.location='WNI_Menu.jsp'">
           </b></div>
                </td>
              </tr>
              <tr>
                <td colspan="3">
                  <div align="center"><font color="#003399"><i>Keterangan : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                    harus Diisi</font></i></div>
                </td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
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
<p class="linkyellow">&nbsp;</p>
</BODY></HTML>
<%
}
else
  {
response.sendRedirect("index.jsp");
  }
 }catch(Exception err)
{
    System.out.println("Error in Perpindahan_Wni.jsp" + err.toString());
}
%>
