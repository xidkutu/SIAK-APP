<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>
<%@ include file="Global.jsp"%>
<%!
    String select,id1=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;
%>

<%   Vector errMsg;
     String infoMsg;
     errMsg = new Vector();
     infoMsg = null;
     factory=ServiceController.getInstance();

   try
   {
     v = new Vector();

     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
%>
<html>

<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="Pencatatan_Kabupaten_Edit.jsp">

<script language="text/javaScript">
var tp1;
</script>

<script language="javaScript" src="Templates/tabpane.js"></script>
<script type="javascript" src="Templates/webfxlayout.js"></script>
<SCRIPT language=JavaScript src="scripts/KabupatenNik.js">
</SCRIPT>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK type="text/css" href="Templates/s.css" rel=stylesheet>

<link id="webfx-tab-style-sheet" type="text/css" rel="stylesheet" href="Templates/tab.webfx.css"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>

      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20">
                  <div align="center"><span class="submenu">Pencatatan Kelahiran</span><br>
                    <br>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
                <td>
<% String jsp = "data_wilayah.jsp?level=2&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab();
%>
                          <jsp:include page="<%=jsp%>"/>
                  </td>
        </tr>
		   <%    Vector errors = (Vector) request.getAttribute("errors");
                         if (errors!=null) {
                           for (int i=0; i<errors.size(); i++)  {
                   %>
                           <tr><td><%=printError(errors.elementAt(i).toString(), "left")%></td></tr>
                   <%
                           }
                           request.removeAttribute("errors");
    		         }
                    %>
      </table>
    </td>
  </tr>
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
                          <div align="center">
<div class="tab-pane" id="tab-pane-1" style="postion:absolute">

<script type="text/javascript">

tp1 = new WebFXTabPane(document.getElementById("tab-pane-1"),false);

</script>

  <div class="tab-page" style="postion:absolute"  id="tabPage1">
                    <h2 class="tab">Data Bayi</h2>

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
                              <td width="21%">
                                <p style="line-height: 100%">NIK Bayi<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                    <input type="text" name="nik_bayi" size="18" class="boxdefault" maxlength="17"  onKeyUp="return num1(form1.nik_bayi)" value="<%=(request.getParameter("nik_bayi")==null || request.getParameter("nik_bayi").equals("")?"":request.getParameter("nik_bayi"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Jenis Kelamin</p>

                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Dilahirkan<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="tmpt_dilhr" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Tempat Dilahirkan
                                    --</option>
                                    <option value="1">1 - RS/RB</option>
                                    <option value="2">2 - Puskesmas</option>
                                    <option value="3">3 - Polindes</option>
                                    <option value="4">4 - Rumah</option>
                                    <option value="5">5 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tempat Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">- </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Hari Lahir&nbsp;</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Pukul<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="pukul_lhr1" size="2" class="boxdefault" maxlength="2" onKeyUp="return tab()" disabled>
                                    <b>:</b>
                                    <input type="text" name="pukul_lhr2" size="2" class="boxdefault" maxlength="2" onKeyUp="return tab1()" disabled>
                                    <select size="1" name="wkt_pkl_lhr" class="boxdefault" disabled>
                                      <option value="0" selected>-- Pilih Waktu --</option>
                                      <option value="1">1 - WIB</option>
                                      <option value="2">2 - WITA</option>
                                      <option value="3">3 - WIT</option>
                                    </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Jenis Kelahiran<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_klahir" class="boxdefault" disabled>
                                    <option  value="0" selected>-- Pilih Jenis Kelahiran
                                    --</option>
                                    <option value="1">1 - Tunggal</option>
                                    <option value="2">2 - Kembar 2</option>
                                    <option value="3">3 - Kembar 3</option>
                                    <option value="4">4 - Kembar 4</option>
                                    <option value="5">5 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Anak ke<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="anak_ke_lhr" size="2" class="boxdefault" maxlength="2" onKeyUp="return num(form1.anak_ke_lhr)" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Penolong Kelahiran<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="pnlng_klahir" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Penolong Kelahiran
                                    --</option>
                                    <option value="1">1 - Dokter</option>
                                    <option value="2">2 - Bidan/Perawat</option>
                                    <option value="3">3 - Dukun</option>
                                    <option value="4">4 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Berat Bayi</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                    <input type="text" name="brt_bayi" size="5" class="boxdefault" maxlength="5"  onKeyUp="return tab2()" disabled>
                                  Kg</p>
                              </td>
                            </tr>
                          </table>
                        </td>
  </tr>
</table>

   </div>

                    <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
                      <h2 class="tab">Data Ibu </h2>

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
                              <td width="21%">NIK Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton" value="Ada" onClick="return radioValid3()">
                                Ada<br>
                                <input type="radio" name="radiobutton" value="Tidak Ada" onClick="return radioValid4()">
                                Tidak Ada</td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">Warga Negara Ibu<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="radio" name="radiobutton1" value="1">
                                WNI<br>
                                <input type="radio" name="radiobutton1" value="2">
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ibu" size="18" class="boxdefault" maxlength="17" disabled  onKeyUp="return num1(form1.nik_ibu)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ibu" size="27" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd maxlength="2" onKeyUp="return tab3()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm maxlength="2"  onKeyUp="return tab4()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy maxlength="4"  onKeyUp="return tab5()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <select
                  name=jenis_pkrjn_ibu1 boxdefault2 class="boxdefault" disabled >
                                      <option value="0" selected>-- Pilih Jenis Pekerjaan
                                      --</option>
                                    </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <input type="text" name="alamat_ibu" size="30" class="boxdefault" maxlength="120" disabled>
                                RT<font color="#000099" class="asterish"> </font>
                                <input type="text" name="no_rt_ibu" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ibu)" disabled>
                                RW
                                <input type="text" name="no_rw_ibu" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ibu)" disabled>
                                Ds/Kpng/Dukuh </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ibu" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Kode Pos</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ibu" size="7" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Telepon</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ibu" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Provinsi<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">
     <input class="boxdefault" size=30 name="nama_prop_ibu" maxlength="60" onKeyUp="" disabled>

<input type="hidden" name="no_prop_ibu" value="<%if(request.getParameter("no_prop_ibu")!=null){out.print(request.getParameter("no_prop_ibu"));}%>">
                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

     <input class="boxdefault" size=30 name="nama_kab_ibu" maxlength="60" onKeyUp="" disabled>

                                </td>
<input type="hidden" name="no_kab_ibu" value="">
                            </tr>
                            <tr>
                                <td width="21%" height="40">
                                  <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%" height="40">:</td>
                                <td width="26%" height="40">

     <input class="boxdefault" size=30 name="nama_kec_ibu" maxlength="60" onKeyUp="" disabled>

                                </td>

<input type="hidden" name="no_kec_ibu" value="">
                              <td width="1%" height="40">&nbsp;</td>
                                <td width="24%" height="40">
                                  <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%" height="40">:</td>
                                <td width="26%" height="40">

     <input class="boxdefault" size=30 name="nkelibu" maxlength="60" onKeyUp="" disabled>

<input type="hidden" name="no_kel_ibu" value="">
</td>
                            </tr>
                            <tr>
                                <td width="21%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ketrunan_ibu" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Kebangsaan (Bagi
                                  WNA)</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="bangsa_ibu" size="22" class="boxdefault" maxlength="40" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Pencatatan
                                  Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ibu_dd maxlength="2"  onKeyUp="return tab6()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ibu_mm maxlength="2"  onKeyUp="return tab7()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_ctt_kwn_ibu_yy maxlength="4"  onKeyUp="return tab8()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">&nbsp;
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"  id="tabPage3">
                    <h2 class="tab">Data Ayah</h2>

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
                                <td width="21%" height="43">NIK Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton3" value="Ada"  onClick="return radioValid5()" >
                                Ada<br>
                                <input type="radio" name="radiobutton3" value=" Tidak Ada"  onClick="return radioValid6()" >
                                Tidak Ada</td>
                                <td width="1%" height="43">&nbsp;</td>
                                <td width="24%" height="43">Warga Negara Ayah<font color="#000099" class="asterish">*</font></td>
                                <td width="1%" height="43">:</td>
                                <td width="26%" height="43">
                                  <input type="radio" name="radiobutton4" value="1">
                                WNI<br>
                                <input type="radio" name="radiobutton4" value="2">
                                WNA</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Nomor Induk Kependudukan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_ayh" size="18" class="boxdefault" maxlength="17" disabled  onKeyUp="return num1(form1.nik_ayh)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nama_ayh" size="27" class="boxdefault" maxlength="60" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <table width="100" border="0" cellspacing="3" cellpadding="0">
                                    <tr>
                                      <td>
                                        <input
                                class=boxdefault size=2 name=no_akta_lhr_dd1 maxlength="2" onKeyUp="return tab9()" disabled>
                                      </td>
                                      <td>/ </td>
                                      <td>
                                        <input
                                class=boxdefault size=2 name=no_akta_lhr_mm1 maxlength="2" onKeyUp="return tab10()" disabled>
                                      </td>
                                      <td>/</td>
                                      <td>
                                        <input
                                class=boxdefault size=4 name=no_akta_lhr_yy1 maxlength="4" onKeyUp="return tab11()" disabled>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select

                  name=jenis_pkrjn_ayh1 boxdefault2 class="boxdefault" disabled >
                                     <option value="0" selected>-- Pilih Jenis Pekerjaan
                                      --</option>
                                  </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat<font color="#000099" class="asterish">*</font></td>
                              <td width="1%">:</td>
                              <td colspan="3">
                                <div align="left">
                                  <input type="text" name="alamat_ayh" size="30" class="boxdefault" maxlength="120" disabled>
                                  RT<font color="#000099" class="asterish"> </font>
                                  <input type="text" name="no_rt_ayh" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rt_ayh)" disabled>
                                  RW
                                  <input type="text" name="no_rw_ayh" size="3" class="boxdefault" maxlength="3" onKeyUp="return num(form1.no_rw_ayh)" disabled>
                                  Ds/Kpng/Dukuh</div>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">
                                <input type="text" name="dusun_ayh" size="22" class="boxdefault" maxlength="60" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Kode Pos</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="kodepos_ayh" size="7" class="boxdefault" maxlength="5" disabled>
                              </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Telepon</div>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="telp_ayh" size="20" class="boxdefault" maxlength="20" disabled>
                              </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Provinsi<font color="#000099" class="asterish"></font><font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">
     <input class="boxdefault" size=30 name="nama_prop_ayh" maxlength="60" onKeyUp="" disabled>

<input type="hidden" name="no_prop_ayh" value="<%if(request.getParameter("no_prop_ayh")!=null){out.print(request.getParameter("no_prop_ayh"));}%>">
                                </td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Kabupaten/Kota<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

     <input class="boxdefault" size=30 name="nama_kab_ayh" maxlength="60" onKeyUp="" disabled>

<input type="hidden" name="no_kab_ayh" value="">

                                </td>
                            </tr>
                            <tr>
                                <td width="21%">
                                  <div align="left">Nama Kecamatan<font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

     <input class="boxdefault" size=30 name="nama_kec_ayh" maxlength="60" onKeyUp="" disabled>

<input type="hidden" name="no_kec_ayh" value="">
</td>
                              <td width="1%">&nbsp;</td>
                                <td width="24%">
                                  <div align="left">Nama Desa/Kelurahan <font color="#000099" class="asterish">*</font></div>
                                </td>
                              <td width="1%">:</td>
                                <td width="26%">

     <input class="boxdefault" size=30 name="nama_kel_ayh" maxlength="60" onKeyUp="" disabled>

                                </td>
<input type="hidden" name="no_kel_ayh" value="">
                            </tr>
                            <tr>
                              <td width="21%">Keturunan</td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <select size="1" name="ketrunan_ayh" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan --</option>
                                  <option value="1">1 - Eropa</option>
                                  <option value="2">2 - Cina/Timur Asing Lainnya</option>
                                  <option value="3">3 - Pribumi Nasrani</option>
                                  <option value="4">4 - Pribumi Non Nasrani</option>
                                  <option value="5">5 - Lainnya</option>
                                </select>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">Kebangsaan (Bagi WNA)</td>

                              <td width="1%">:</td>
                              <td width="26%">
                                <input type="text" name="bangsa_ayh" size="22" class="boxdefault" maxlength="40" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Pencatatan
                                  Perkawinan</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ayh_dd maxlength="2" onKeyUp="return tab12()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=tgl_ctt_kwn_ayh_mm maxlength="2" onKeyUp="return tab13()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=tgl_ctt_kwn_ayh_yy maxlength="4" onKeyUp="return tab14()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"   id="tabPage4">
                    <h2 class="tab">Data Pelapor</h2>

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
                              <td width="21%">
                                <p style="line-height: 100%">NIK Pelapor<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_plpor" size="18" class="boxdefault" maxlength="17"   onKeyUp="return num1(form1.nik_plpor)" disabled>
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%"> Jenis Pekerjaan<font color="#000099" class="asterish">*</font></p>
                                </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">
                                    <select
                     name=jenis_pkrjn_plpor boxdefault2 class="boxdefault" disabled>
                                      <option value="0" selected>-- Pilih Jenis
                                      Pekerjaan --</option>
                                    </select>
                                  </p>
                                  </td>
                            </tr>
                            <tr>
                              <td width="21%">Alamat</td>
                              <td width="1%">:</td>
                                <td colspan="5">-</td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tanggal Melapor<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <table width="100" border="0" cellspacing="3" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_dd2 maxlength="2"  onKeyUp="return tab15()" disabled>
                                    </td>
                                    <td>/ </td>
                                    <td>
                                      <input
                                class=boxdefault size=2 name=no_akta_lhr_mm2 maxlength="2" onKeyUp="return tab16()" disabled>
                                    </td>
                                    <td>/</td>
                                    <td>
                                      <input
                                class=boxdefault size=4 name=no_akta_lhr_yy2 maxlength="4" onKeyUp="return tab17()" disabled>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="26%">&nbsp; </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"  id="tabPage5" >
                    <h2 class="tab">Data Saksi I</h2>

               <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage5"));
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
                                    <input type="text" name="nik_sksi1" size="17" class="boxdefault" maxlength="17" value="<%=(request.getParameter("nik_sksi1")==null || request.getParameter("nik_sksi1").equals("")?"":request.getParameter("nik_sksi1"))%>">
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
                              <td width="22%">Tempat Lahir</td>
                              <td width="1%">:</td>
                                <td width="23%">-</td>
                              <td width="3%">&nbsp;</td>
                              <td width="24%">Tanggal Lahir</td>
                              <td width="1%">:</td>
                              <td width="26%">&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="22%">
                                <p style="line-height: 100%">Alamat</p>
                              </td>
                              <td width="1%">:</td>
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
                                   name=jenis_pekerjaan_saksi1 boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan --</option>
                                </select>
                              </td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
  </div>
  <div class="tab-page"  id="tabPage6">
                    <h2 class="tab">Data Saksi II</h2>
                <script type="javascript">
                	tp1.addTabPage(document.getElementById("tabPage6"));
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
                                  <p style="line-height: 100%">NIK Saksi II<font color="#000099" class="asterish">*</font>
                                  </p>
                                </td>
                                <td width="1%">:</td>
                                <td width="23%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="nik_sksi2" size="17" class="boxdefault" maxlength="17" value="<%=(request.getParameter("nik_sksi2")==null || request.getParameter("nik_sksi2").equals("")?"":request.getParameter("nik_sksi2"))%>">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Nama Lengkap</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Jenis Kelamin</p>

                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tempat Dilahirkan<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="tmpt_dilhr" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Tempat Dilahirkan
                                    --</option>
                                    <option value="1">1 - RS/RB</option>
                                    <option value="2">2 - Puskesmas</option>
                                    <option value="3">3 - Polindes</option>
                                    <option value="4">4 - Rumah</option>
                                    <option value="5">5 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Tempat Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">- </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Tanggal Lahir</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">&nbsp;</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Hari Lahir&nbsp;</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                  <p style="line-height: 100%">-</p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Pukul<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                                <td width="26%">
                                  <p style="line-height: 100%">
                                    <input type="text" name="pukul_lhr1" size="2" class="boxdefault" maxlength="2" onKeyUp="return tab()" disabled>
                                    <b>:</b>
                                    <input type="text" name="pukul_lhr2" size="2" class="boxdefault" maxlength="2" onKeyUp="return tab1()" disabled>
                                    <select size="1" name="wkt_pkl_lhr" class="boxdefault" disabled>
                                      <option value="0" selected>-- Pilih Waktu --</option>
                                      <option value="1">1 - WIB</option>
                                      <option value="2">2 - WITA</option>
                                      <option value="3">3 - WIT</option>
                                    </select>
                                  </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Jenis Kelahiran<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="jenis_klahir" class="boxdefault" disabled>
                                    <option  value="0" selected>-- Pilih Jenis Kelahiran
                                    --</option>
                                    <option value="1">1 - Tunggal</option>
                                    <option value="2">2 - Kembar 2</option>
                                    <option value="3">3 - Kembar 3</option>
                                    <option value="4">4 - Kembar 4</option>
                                    <option value="5">5 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Anak ke<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <input type="text" name="anak_ke_lhr" size="2" class="boxdefault" maxlength="2" onKeyUp="return num(form1.anak_ke_lhr)" disabled>
                                </p>
                              </td>
                            </tr>
                            <tr>
                              <td width="21%">
                                <p style="line-height: 100%">Penolong Kelahiran<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                  <select size="1" name="pnlng_klahir" class="boxdefault" disabled>
                                    <option value="0" selected>-- Pilih Penolong Kelahiran
                                    --</option>
                                    <option value="1">1 - Dokter</option>
                                    <option value="2">2 - Bidan/Perawat</option>
                                    <option value="3">3 - Dukun</option>
                                    <option value="4">4 - Lainnya</option>
                                  </select>
                                </p>
                              </td>
                              <td width="1%">&nbsp;</td>
                              <td width="24%">
                                <p style="line-height: 100%">Berat Bayi</p>
                              </td>
                              <td width="1%">:</td>
                              <td width="26%">
                                <p style="line-height: 100%">
                                    <input type="text" name="brt_bayi" size="5" class="boxdefault" maxlength="5"  onKeyUp="return tab2()" disabled>
                                  Kg</p>
                              </td>
                            </tr>
                          </table>
                        </td>
  </tr>
</table>

   </div>



  </div>

<script language="javascript">
setupAllTabs();
form1.nik_bayi.focus()
</script>

              </div>
              </td>
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

<br>
<table width="400" border="0" cellspacing="5" cellpadding="5" align="center">
  <tr>
      <td width="120">
        <div align="center"><b>
        <input class=boxstandard type="submit" value="KONFIRMASI"  name="kon" onClick="return konfirmasi()">
        </b></div>
    </td>
      <td width="110">
        <div align="center"><b> </b></div>
      <div align="center"><b>
        <input class=boxstandard type="submit" value="SIMPAN" name="sim" disabled >
        </b></div>
    </td>
      <td width="98">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KELUAR" name="kel" onclick="document.location='<%=record.getModRefFile()%>'">
          </b></div>
    </td>
      <td width="7">
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
</form>
</BODY></HTML>
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