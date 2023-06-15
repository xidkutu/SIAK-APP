<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*"%>
<%!
String no_kk;
Pindah_Wni pindah;
PindahAsalHome home;
PindahAsal remote;
ServiceController factory=null;
int i,j;
Vector vt=null;
String namakep,niplrh,namacmat,nipcmat,namabup,namapetentri,nippetentri,tglentri;
String nprop,nkab,nkec,nkel,namakab,namaprop,namakec,namakel,ang_list="";
%>
<%
try
  {

if (session.getAttribute("remoteRef")!=null)
{

no_kk=request.getParameter("kednumsuda");
namakep=request.getParameter("namalurah");
niplrh=request.getParameter("niplurah");;
namacmat=request.getParameter("namacamat");;
nipcmat=request.getParameter("nipcamat");;
namabup="shiv";
namapetentri=request.getParameter("namapet");;
nippetentri=request.getParameter("nippet");;
tglentri=request.getParameter("tgldate");;
nprop=request.getParameter("noprop");
nkab=request.getParameter("nokab");
nkec=request.getParameter("nokec");
nkel=request.getParameter("nokel");
namaprop=request.getParameter("naprop");
namakab=request.getParameter("nakab");
namakec=request.getParameter("nakec");
namakel=request.getParameter("nakel");

    factory=ServiceController.getInstance();
    home = (PindahAsalHome) factory.lookup("PindahAsal",PindahAsalHome.class);
    remote = home.create();
    if(home!=null)
{
   // pindah=(Pindah_Wni)remote.getPinda_wna(no_kk);
    if(pindah==null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>minduk-3</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<table align="center">
<tr>
<td>
<div align="center">
<h4>
<font color="red">Data Belum Ada !</font>
</h4>
</div>
</td>
</tr>
<tr>
<td>
<input onClick="javascript:history.back()" class=boxstandard type=button value=KELUAR name="button22">
</td>
</tr>
</table>
<%
}
}
%>
<form action="Num_Sudah_Wna.jsp" method="post" name="kedatangan">
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
<div align="center"><span class="subtitle">Keterangan Kedatangan WNA</span><br>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
<% String jsp = "data_wilayah.jsp?level=2&no_prop=" + nprop+ "&nama_prop=" + namaprop +
      "&no_kab=" + nkab + "&nama_kab=" + namakab;
%>
                          <jsp:include page="<%=jsp%>"/>
                  </td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
              </tr>
            </table>
            <table width="752" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
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
                                Daerah Tujuan</span></div>
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
                        <table width="100%" border="0" cellspacing="3" cellpadding="3" align="center">
                          <tr>
                            <td colspan="15"><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF" size="2"><b><img src="../../images/dot.gif" width="1" height="10"></b></font></td>
                          </tr>
                          <tr>
                            <td width="174" valign="top"> Nomor Kartu Keluarga
                              Asal<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>

                            <td valign="top" colspan="13">

<input  value=<%=no_kk%> onFocus="this.blur()" class=boxdefault size=17 name=nokk maxlength="16">
                              <b>
                              </b></td>

                          </tr>
                          <tr>
                            <td valign="top" width="174"> Nama Kepala Keluarga</td>
                            <td valign="top" width="5">:</td>
<td valign="top" colspan="13">
<b><%=pindah.getNamakk().toString().toUpperCase()%></b></td>
                          </tr>

                          <tr>
                            <td valign="top" width="174">NIK Kepala Keluarga</td>
                            <td valign="top" width="5">:</td>
<td valign="top" colspan="13">
<b><%=pindah.getNikk()%></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">Tanggal Kedatangan<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13">
                              <table width="119" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
<input class=boxdefault size=2 onKeyUp="return tglhr1()" name=tgl_datngn maxlength="2">
                                  </td>
                                  <td>/ </td>
                                  <td>
<input class=boxdefault size=2 onKeyUp="return tglhr2()" name=bln_datngn maxlength="2">
                                  </td>
                                  <td>/</td>
                                  <td>
<input class=boxdefault onKeyUp="return tglhr3()" size=4 name=thn_datngn maxlength="4">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="174" valign="top"> Nomor Kartu Keluarga
                              Tujuan<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13">
<input   class=boxdefault size=17 name=num_nokk maxlength="16">
                              <b>
<input disabled class=boxstandard type=submit onClick="return edi()" value=PERIKSA name="nump">
                              </b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">Alamat Tujuan Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="8">
<input type="text" disabled name="alamat_tjpndh" size="40" class="boxdefault" maxlength="120">
                              RT<font color="#000099" class="asterish"> </font>
<input type="text" disabled name="no_rt_tjpndh" size="3" class="boxdefault" maxlength="3">
                              RW
<input type="text" disabled name="no_rw_tjpndh" size="3" class="boxdefault" maxlength="3">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Dusun/Kampung/Dukuh</div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="8">
<input type="text" disabled name="dusun_tjpndh" size="22" class="boxdefault" maxlength="60">
                            </td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Provinsi<span class="asterish">*</span></div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" width="172"><font color="#003366"><b><font color="#003366">
                              <%--<select size="1" name="nama_prop" class="boxdefault">
                                <option selected>-- Pilih Provinsi --</option>
                                <option>1 - Sumatera Selatan</option>
                                <option>2 - Sumatera Utara</option>
                              </select>--%>
<input type="text" disabled  name="namaprop_tjpndh" size="20" class="boxdefault" maxlength="60">
                              </font></b></font></td>
                            <td valign="top" width="100"><font color="#000000">Kabupaten/Kota<span class="asterish">*</span></font></td>
                            <td valign="top" width="5">:</td>
                            <td colspan="10" valign="top" width="218"><b><font color="#003366">
                             <%-- <select size="1" name="nama_kab" class="boxdefault">
                                <option selected>-- Pilih Kab/Kota</option>
                                <option>1. Sukabumi</option>
                              </select>--%>
<input type="text" disabled name="namakab_tjpndh" size="20" class="boxdefault" maxlength="60">
                              </font></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Kecamatan<font color="#000000"><span class="asterish">*</span></font></div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" width="172"><font color="#003366"><b>
                             <%-- <select size="1" name="nama_kec" class="boxdefault">
                                <option selected>-- Pilih Kecamatan --</option>
                                <option>1. perdatam</option>
                              </select>--%>
<input type="text" disabled name="namakec_tjpndh" size="20" class="boxdefault" maxlength="60">
                              </b></font></td>
                            <td valign="top" width="100">Desa/Kelurahan<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td colspan="10" valign="top" width="218"><b><font color="#003366">
                             <%-- <select size="1" name="nama_kel" class="boxdefault">
                                <option selected>-- Pilih Desa/Kel</option>
                                <option>1. saru</option>
                              </select>--%>
<input type="text" disabled name="namakel_tjpndh" size="20" class="boxdefault" maxlength="60">
                              </font></b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="right">Kode Pos</div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" width="172"><b>
<input disabled class=boxdefault size=7 name=kode_pos maxlength="5">
                              </b></td>
                            <td valign="top" width="100">Telepon</td>
                            <td valign="top" width="5">:</td>
                            <td colspan="10" valign="top" width="218"><b>
<input disabled class=boxdefault size=12 name=telpon maxlength="16">
                              </b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">Status Nomor KK Bagi
                              Yang Pindah<span class="asterish">*</span></td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13"><b>
<select name="stat_no_kk_pdh" class="boxdefault" onChange="return ypin()">
<option selected value="0"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">--
                                Pilih Status Nomor KK Bagi Yang Pindah --</font></option>
<option value="1"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">1
                                - Numpang KK</font></option>
<option value="2"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2">2
                                - Membuat KK Baru</font></option>
</select>
                              </b></td>
                          </tr>
                          <tr>
                            <td valign="top" width="174">
                              <div align="left">Keluarga Yang Datang</div>
                            </td>
                            <td valign="top" width="5">:</td>
                            <td valign="top" colspan="13"><b> </b><b> </b></td>
                          </tr>
                          <tr>
                            <td valign="top" colspan="15">
                              <table width="680" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#93BEE2">
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
                                        <td class="C-Fonts" rowspan="2" width="4%">
                                          <div align="center"> No.</div>
                                        </td>
                                        <td class="C-Fonts" rowspan="2" width="19%">
                                          <div align="center">NIK</div>
                                        </td>
                                        <td class="C-Fonts" rowspan="2" width="27%">
                                          <div align="center">Nnama Lengkap</div>
                                        </td>
                                        <td class="C-Fonts" colspan="2">
                                          <div align="center">SHDK dengan KK Tujuan</div>
                                        </td>
                                        <td class="C-Fonts" rowspan="2" width="9%">
                                          <div align="center">Cek</div>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="C-Fonts" width="21%">
                                          <div align="center">Semula</div>
                                        </td>
                                        <td class="C-Fonts" width="20%">
                                          <div align="center">Berubah Menjadi</div>
                                        </td>
                                      </tr>
<%
j=1;
vt=pindah.getAllAnggota();
for(i=0;i<vt.size();i++)
{
Pindah_Anggota record=(Pindah_Anggota)vt.elementAt(i);
%>
                                      <tr>
                                        <td class="C-Field" width="4%">
                                          <div align="center"><%=j%></div>
                                        </td>
                                        <td class="C-Field" width="19%">
<div align="center">
<%=record.getNik()%>  </div>
                                        </td>
                                        <td class="C-Field" width="27%">
  <div align="center">
<%=record.getNamalkg().toString().toUpperCase()%>
</div>
                                        </td>
 <td class="C-Field" width="21%">
<%=record.getStathbkel().toString().toUpperCase()%>
</td>
                                        <td class="C-Field" width="20%">
<select name="stat_hbkel<%=i%>" class="boxdefault" size="1" onChange="setNik(this)">
<option selected value="0">-- Pilih SHDK --</option>
<option value="1">1 - Kepala Keluarga</option>
<option value="2">2 - Suami</option>
<option value="3">3 - Istri</option>
<option value="4">4 - Anak</option>
<option value="5">5 - Menantu</option>
<option value="6">6 - Cucu</option>
<option value="7">7 - OrangTua</option>
<option value="8">8 - Mertua</option>
<option value="9">9 - Famili Lain</option>
<option value="10">10 - Pembantu</option>
<option value="11">11 - Lainnya</option>
</select>
                                        </td>

                                        <td class="C-Field" width="9%">
                                          <div align="center">
<input type=checkbox name=che<%=i%> value="<%=record.getNik()%>#<%=record.getNamalkg()%>">
                                         </div>
                                        </td>
                                      </tr>
<%
j++;
}
%>
<input type=hidden name=sa value="<%=j%>">
<input type=hidden name=suda value="" >
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
                          <tr valign="top">
                            <td width="184">Nama Kepala Desa/ Kelurahan<span class="asterish">*</span></td>
                            <td width="6">:</td>
                            <td colspan="2">
<input value=<%=namakep.toString().toUpperCase()%> class=boxdefault size=22 name=nama_kep_des maxlength="60">
                            </td>
                            <td width="10"><img src="images/dot.gif" width="10" height="1"></td>
                            <td width="112">NIP Lurah</td>
                            <td width="5">:</td>
                            <td colspan="2" width="144">
<input value=<%=niplrh.toString().toUpperCase()%> class=boxdefault size=9 name=nip_lrh maxlength="9">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td width="184">Nama Camat<span class="asterish">*</span></td>
                            <td width="6">:</td>
                            <td colspan="2">
<input value=<%=namacmat.toString().toUpperCase()%> class=boxdefault size=22 name=nama_cmat maxlength="60">
                            </td>
                            <td width="10">&nbsp;</td>
                            <td width="112">NIP Camat<span class="asterish">*</span></td>
                            <td width="5">:</td>
                            <td colspan="2" width="144">
<input value=<%=nipcmat.toString().toUpperCase()%> class=boxdefault size=9 name=nip_cmat maxlength="9">
                            </td>
                          </tr>
                          <tr valign="top">
                            <td width="184">Nama Petugas Entri</td>
                            <td width="6">:</td>
<td colspan="2">
<b><%=namapetentri.toString().toUpperCase()%></b></td>
                            <td width="10">&nbsp;</td>
                            <td width="112">NIP Petugas Entri</td>
                            <td width="5">:</td>
<td colspan="2" width="144">
 <b><%=nippetentri.toString().toUpperCase()%></b></td>
                          </tr>
                          <tr valign="top">
                            <td height="20" width="184"><img src="images/dot.gif" width="1" height="1">Tanggal
                              Entri</td>
                            <td width="6">:</td>
<td colspan="2">
<b><%=tglentri.toString().toUpperCase()%></b> </td>
                            <td width="10">&nbsp;</td>
                            <td width="112">&nbsp;</td>
                            <td width="5">&nbsp;</td>
                            <td colspan="2" width="144">&nbsp;</td>
                          </tr>
                        </table>
                        <p>&nbsp;</p>
                      </td>
                    </tr>
                  </table>
                </td>
                <td>&nbsp;</td>
              </tr>
<input type="hidden" name=nokk value="<%=no_kk%>">
<input type="hidden" name=namakk value="<%=pindah.getNamakk().toString().toUpperCase()%>">
<input type="hidden" name=rectgllam value=<%=pindah.getRenctglpindah()%>>
<input type="hidden" name=alamatlam value="<%=pindah.getAlatjpndh().toString().toUpperCase()%>">
<input type="hidden" name=nortlam value="<%=pindah.getNorttjpndh()%>">
<input type="hidden" name=norwlam value="<%=pindah.getNorwtjpndh()%>">
<!--<input type="hidden" name=dusunlam value="">-->

<input type="hidden" name=kodlam value="<%=pindah.getKodepostjpndh()%>">
<input type="hidden" name=tlplam value="<%=pindah.getTelptjpndh()%>">
<input type="hidden" name=namalurlam value="<%=pindah.getNamakep().toString().toUpperCase()%>">
<input type="hidden" name=namacmatlam value="<%=pindah.getNamacmat().toString().toUpperCase()%>">
<input type="hidden" name=namapetlam value="<%=pindah.getNamapetentri().toString().toUpperCase()%>">
<input type="hidden" name=nippetlam value="<%=pindah.getNippetentri()%>">
<input type="hidden" name=tglentrilam value=<%=pindah.getTglentri().toString().toUpperCase()%>>

<input type="hidden" name=cmatbru value="<%=namacmat.toString().toUpperCase()%>">
<input type="hidden" name=namalurbru value="<%=namakep.toString().toUpperCase()%>">
<input type="hidden" name=namapetbru value="<%=namapetentri.toString().toUpperCase()%>">
<input type="hidden" name=nippetbru value="<%=nippetentri%>">
<input type="hidden" name=tegentribru value="<%=tglentri.toString().toUpperCase()%>">
<input type="hidden" name=ng value="">
              <tr>
                <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
                <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                <td><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
            <table width="449" border="0" cellspacing="5" cellpadding="5" align="center">
              <tr>
                <td>
                  <div align="center"><b>
                    <input class=boxstandard disabled type=submit value=SIMPAN  onClick="return sud()" name="sim">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b> </b></div>
                  <div align="center"><b>
                    <input class=boxstandard type=button value=BATAL name="submit23">
                    </b></div>
                </td>
                <td>
                  <div align="center"><b>
                    <input class=boxstandard type=button value=KELUAR name="submit232" onClick="window.clsoe()">
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
var flag_stat=0;
function ex()
{
var v=window.history.length;
history.go(-v);
}
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/kedsuda.js">
</SCRIPT>
</HTML>
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