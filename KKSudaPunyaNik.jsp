<table width="100" border="0" cellspacing="0" cellpadding="0" align="right">
<%@ page language="java" import="java.util.*,keluargawna.*,pendaftaran.*,com.db.connection.*"%>
<%!
    UserInfo1 record=null;
    String nprop="",nkab="",nkec="";
%>

<%

  record=(UserInfo1)session.getAttribute("remoteRef");

   if(record != null)
   {
     nprop=record.getNoProp();
     nkab=record.getNoKab();
     nkec=record.getNoKec();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/kkbaru.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/lurah.js">
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<style type="text/css">
<!--
.hide { font-family: Verdana; font-size: 12px; font-weight: normal;background-color: #CBE0FA; border: 0px #CBE0FA none}
-->
</style>
<form name=nokksemula action="Daftar_Keluarga.jsp" method=post>
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
                            <td height="45">
                              <div align="center"><span class="submenu">Permohonan
                                KK Baru WNI</span><br>
                                <span class="linkyellow">Yang Sudah Punya NIK</span>
                                <br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                                                <input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
                                                <SCRIPT language="javascript">
                                                   function resetPage(obj) {
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;document.all['namalur'].value=setNamaLurah(obj.selectedIndex);
                                                      return true;
                                                   }
                                                </SCRIPT>
                                             <td>
<% String jsp = "data_wilayah.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
%>
                          <jsp:include page="<%=jsp%>"/>
                                             </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
                          <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="middle">
                                    <div align="center"><span class="subtitle">Data
                                      Permohonan KK Baru WNI</span></div>
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
                              <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                                <tr>
                                  <td colspan="13"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="images/dot.gif" width="1" height="10"></b></font></td>
                                </tr>

                                  <tr valign="top">
                                    <td width="200"> Nomor Kartu Keluarga Semula<span class="asterish">*</span>
                                    </td>
                                    <td>:</td>
                                    <td colspan="11">
                                      <input class=boxdefault size=16 name=no_kk_semula maxlength="16">
                                      <b>
                                      <input class=boxstandard type=submit value=PERIKSA name=PERIK onclick="return suda()">
                                      </b></td>
                                  </tr>

                                  <tr valign="top">
                                    <td> NIK Pemohon KK(sebagai Kepala Keluarga
                                      Baru)<span class="asterish">*</span></td>
                                    <td>:</td>
                                    <td colspan="11">
                                      <input class=boxdefault size=16 name=nik_kep_kel maxlength="16" onFocus="this.blur()">
                                      </td>
                                  </tr>
                                  <tr valign="top">
                                    <td> Nomor Kartu Keluarga Baru</td>
                                    <td>:</td>
                                    <td colspan="11"><b>&lt;create by system&gt;</b></td>
                                  </tr>

                                <tr valign="top">
                                  <td> Nama Lengkap</td>
                                  <td>:</td>
                                  <td colspan="11"><b>&lt;relasional dengan biodata&gt;</b></td>
                                </tr>
                                <tr valign="top">
                                  <td> Alamat KK Pemohon</td>
                                  <td>:</td>
                                  <td colspan="11"> <b><font color="#003366">&lt;relasional
                                    &lt;Alamat&gt; RT &lt;RT&gt; RW &lt;RW&gt;
                                    Dusun &lt;Dusun&gt;&gt;</font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td>Desa/Kelurahan </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366"><b>&lt;Desa/Kelurahan&gt;</b></font></b></font></td>
                                  <td>Kecamatan</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b>&lt;Kecamatan&gt;</b>
                                    </font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kab/Kota </td>
                                  <td>:</td>
                                  <td> <font color="#003366"><b><font color="#003366">&lt;Kab/Kota&gt;</font></b></font></td>
                                  <td>Provinsi</td>
                                  <td>:</td>
                                  <td colspan="6"> <b><font color="#003366"><b><font color="#003366">&lt;Provinsi&gt;<b></b></font></b></font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td colspan="2">&nbsp;</td>
                                  <td> Kode Pos </td>
                                  <td>:</td>
                                  <td><b><font color="#003366">&lt;Kode Pos&gt;
                                    </font></b></td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td colspan="6"><b><font color="#003366">&lt;Telepon&gt;</font></b></td>
                                </tr>
                                <tr valign="top">
                                  <td>Alasan Permohonan </td>
                                  <td>:</td>
                                  <td colspan="11">
                                    <select name="als_prmohon" class="boxdefault">
                                      <option>-- Pilih Alasan Permohonan --</option>
                                      <option value="1">1 - Karena Membentuk Rumah
                                      Tangga Baru</option>
                                      <option value="2">2 - Karena Pindah Tempat
                                      Tinggal</option>
                                      <option value="3">3 - Karena Kartu Keluarga
                                      Hilang/Rusak</option>
                                      <option value="4">4 -Lainnya</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr valign="top">
                                  <td>Jumlah Anggota Keluarga/Pengikut</td>
                                  <td>:</td>
                                  <td colspan="11">
                                    <input
                                class=boxdefault size=2 name=jml maxlength="2">
                                    Orang </td>
                                </tr>
                              </table>
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
                                    <div align="center"><span class="subtitle">Daftar
                                      Keluarga Pemohon</span></div>
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
                                    <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                                      <tr>
                                        <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td valign="middle" align="center">
                                          <table width="100%" border="0" cellspacing="1" cellpadding="3" class="C-BG">
                                            <tr>
                                              <td class="C-Fonts" rowspan="2" width="4%">
                                                <div align="center"> No.</div>
                                              </td>
                                              <td class="C-Fonts" rowspan="2" width="20%">
                                                <div align="center">NIK</div>
                                              </td>
                                              <td class="C-Fonts" rowspan="2" width="31%">
                                                <div align="center">Nama Lengkap</div>
                                              </td>
                                              <td class="C-Fonts" colspan="2">
                                                <div align="center">Status Hubungan
                                                  dalam Keluarga</div>
                                              </td>
                                              <td class="C-Fonts" rowspan="2" width="10%">
                                                <div align="center">Cek</div>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td class="C-Fonts" width="16%">
                                                <div align="center">Semula</div>
                                              </td>
                                              <td class="C-Fonts" width="19%">
                                                <div align="center">Berubah Menjadi</div>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td class="C-Field" width="4%">
                                                <div align="center"> 1</div>
                                              </td>
                                              <td class="C-Field" width="20%">
                                                <div align="center">&lt;get from
                                                  kk&gt; </div>
                                              </td>
                                              <td class="C-Field" width="31%">
                                                <div align="center">&lt;get from
                                                  nik&gt; </div>
                                              </td>
                                              <td class="C-Field" width="16%">&lt;get
                                                from nik&gt;</td>
                                              <td class="C-Field" width="19%">
                                                <select name=select2 boxdefault2 class="boxdefault" size="1">
                                                  <option selected>-- Pilih SHDK
                                                  --</option>
                                                  <option>1. Kepala Keluarga</option>
                                                  <option>2. Suami</option>
                                                  <option>3. Istri</option>
                                                  <option> 4. Anak</option>
                                                  <option>5. Menantu</option>
                                                  <option>6. Cucu</option>
                                                  <option>7. OrangTua</option>
                                                  <option>8. Mertua</option>
                                                  <option>9. Famili Lain</option>
                                                  <option>10. Pembantu</option>
                                                  <option>11. Lainnya</option>
                                                </select>
                                              </td>
                                              <td class="C-Field" width="10%">
                                                <div align="center">
                                                  <input type=checkbox name=ext3222262>
                                                </div>
                                              </td>
                                            </tr>
                                          </table>
                                        </td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td height="1" width="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                                        <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                                        <td width="1" height="1"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="3" cellpadding="2" align="center" width="100%">
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
                                <tr valign="top">
                                  <td width="200">Nama Kepala Desa/ Kelurahan<span class="asterish">*</span>
                                  </td>
                                  <td>:</td>
                                  <td colspan="2">
                                    <p>
<font size=2 face="verdana">
<b>
  <input type="text" class="hide" maxlength="40" name="namalur" onfocus="this.blur()">
</b>
</font>
  </p>
                                    </td>
                                  <td><img src="images/dot.gif" width="10" height="1"></td>
                                  <td>Nama Petugas Entri</td>
                                  <td>:</td>
                                  <td colspan="2"> <b>
         <%=record.getNamaPetugas().toString().toUpperCase()%>
        </b></td>
                                </tr>
                                <tr valign="top">
                                  <td>NIP Petugas Entri</td>
                                  <td>:</td>
                                  <td colspan="2"><b><%=record.getNipPetugas()%></b></td>
                                  <td>&nbsp;</td>
                                  <td>Tanggal Entri</td>
                                  <td>:</td>
                                  <td colspan="2"><b><%=record.getToday().toString().toUpperCase()%></b> </td>
                                </tr>
                                <tr valign="top">
                                  <td height="20"><img src="images/dot.gif" width="1" height="1"></td>
                                  <td>&nbsp;</td>
                                  <td colspan="2">&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td colspan="2">&nbsp;</td>
                                </tr>
                              </table>
                              <p>&nbsp;</p>
                            </td>
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
                  <table width="450" border="0" cellspacing="5" cellpadding="5" align="center">
                    <tr>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=SIMPAN   disabled>
                          </b></div>
                      </td>
                      <td>
                      </td>
                      <td>
                        <div align="center"><b>
                          <input class=boxstandard type=button value=KELUAR   onclick="document.location='WNI_Menu.jsp'">
                          </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                        <div align="center"><font color="#003399"><i>Keterangan
                          : </i></font><i><font color="#000099" class="asterish">*</font><font color="#003399">Data
                          harus Diisi</font> </i></div>
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
</form>
<p class="linkyellow">&nbsp;</p>
</BODY></HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
%>

      </table>