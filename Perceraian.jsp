<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.db.connection.*"%>

<%!
    String no_kel,nama_kel,select,id1=null,flag=null;
    UserInfo1 record = null;
    Vector v = null;
    ServiceController factory,factory1;

%>

<%
     factory=ServiceController.getInstance();
     flag=request.getParameter("n");

   try
   {
     v = new Vector();
         record = (UserInfo1)session.getAttribute("remoteRef");
%>

<%
if(record != null)
{%>
<script type="text/javascript" src="Templates/tabpane.js"></script>
<SCRIPT language=JavaScript src="scripts/Cerai.js">
</SCRIPT>
<SCRIPT language=JavaScript>
   function simpan() {
     document.all["kon"].disabled = true;
     //document.all["sim"].disabled = true;
     document.all["kel"].disabled = true;
 //       form1.submit();
   }
</SCRIPT>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<link type="text/css" rel="StyleSheet" href="Templates/tab.webfx.css" />
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="PerceraianInput.jsp">

<script language="text/javaScript">
var tp1;
</script>

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
                  <div align="center"><span class="submenu">Pencatatan Perceraian</span><br>
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
    <h2 class="tab">Data Suami</h2>

		<script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage1"));
                </script>

                    <table class="TabSectionVisible" id="HeaderTAB" name="HeaderTAB" width="900">
                      <tr>
                        <td>
                          <table width="875">
                            <tr>
                              <td colspan="7">&nbsp; </td>
                            </tr>
                            <tr>
                              <td width="182">
                                <p style="line-height: 100%">NIK Suami<font color="#000099" class="asterish">*</font></p>
                              </td>
                              <td width="9">:</td>
                              <td width="246">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_suami" size="17" class="boxdefault" maxlength="17"  onKeyUp="return num1(form1.nik_suami)" onblur="validatesuami(form1.nik_suami)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="9">:</td>
                              <td width="200">
                                  <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Nama Lengkap</td>
                              <td width="9">:</td>
                                <td width="246">-</td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <select
                  name=pddk_akh_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="182" valign="top">Alamat</td>
                              <td width="9" valign="top">:</td>
                                <td colspan="5">-</td>
                            </tr>
                            <tr>
                              <td width="182">Agama</td>
                              <td width="9">:</td>
                                <td width="246">- </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <select
                  name=jenis_pkrjn_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Keturunan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <select
                  name=ktrunan_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                </select>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Status Perkawinan Sebelum Nikah<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <select
                  name=stat_kwn_sblm_nkh_suami boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Status Perkawinan
                                  --</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Perceraian Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <input type="text" name="crai_ke_suami" size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <input type="text" name="kwn_ke_suami" size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Istri Yang Ke (bagi poligami)</td>
                              <td width="9">:</td>
                              <td width="246">
                                <input type="text" name="istri_ke" size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Kewarganegaraan</td>
                              <td width="9">:</td>
                                <td width="200">- </td>
                            </tr>
                            <tr>
                              <td width="182">Kebangsaan (Bagi WNA)</td>
                              <td width="9">:</td>
                                <td width="246">-</td>
                              <td width="8">&nbsp;</td>
                              <td width="217">&nbsp;</td>
                              <td width="9">&nbsp;</td>
                              <td width="200">&nbsp;</td>
                            </tr>
                          </table>
                          </td>
  </tr>
</table>
             </div>

 <div class="tab-page" name="t1" style="postion:absolute" id="tabPage2">
    <h2 class="tab">Data Istri</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage2"));
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
                              <td width="182">
                                <p style="line-height: 100%">NIK Istri<font color="#000099" class="asterish">*</font>
                                </p>
                              </td>
                              <td width="9">:</td>
                              <td width="246">
                                <p style="line-height: 100%">
                                  <input type="text" name="nik_istri" size="17" class="boxdefault" maxlength="17" onKeyUp="return num1(form1.nik_istri)" onblur="validateistri(form1.nik_istri)">
                                  <b><b> </b></b></p>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">
                                <p style="line-height: 100%">Nomor Kartu Keluarga</p>
                              </td>
                              <td width="9">:</td>
                              <td width="200">
                                  <p style="line-height: 100%">-</p>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Nama Lengkap</td>
                              <td width="9">:</td>
                                <td width="246">-</td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Pendidikan Terakhir<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <select
                  name=pddk_akh_istri boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Pendidikan
                                  Terakhir --</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="182" valign="top">Alamat</td>
                              <td width="9" valign="top">:</td>
                                <td colspan="5">- </td>
                            </tr>
                            <tr>
                              <td width="182">Agama</td>
                              <td width="9">:</td>
                                <td width="246">- </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Jenis Pekerjaan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <select
                  name=jenis_pkrjn_istri boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Jenis Pekerjaan
                                  --</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Keturunan<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <select size="1" name="ktrunan_istri" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Keturunan
                                  --</option>
                                </select>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Status Perkawinan Sebelum Nikah<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <select
                  name=stat_kwn_sblm_nkh_istri boxdefault2 class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Status Perkawinan
                                  --</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td width="182">Perkawinan Yang Ke<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <input type="text" name="kwn_ke_istri" size="2" maxlength="2" class="boxdefault" disabled>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Jumlah Anak<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="200">
                                <input type="text" name="jml_ank" size="2" maxlength="2" class="boxdefault" disabled>
                                Orang</td>
                            </tr>
                            <tr>
                              <td width="182">Yang Bertanggung Jawab Dalam Pemeliharaan
                                Anak<font color="#000099" class="asterish">*</font></td>
                              <td width="9">:</td>
                              <td width="246">
                                <select size="1" name="yg_btgung_pmel_ank" class="boxdefault" disabled>
                                  <option value="0" selected>-- Pilih Yang Memelihara
                                  Anak --</option>
                                </select>
                              </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">Kewarganegaraan</td>
                              <td width="9">:</td>
                                <td width="200">-</td>
                            </tr>
                            <tr>



                              <td width="182">Kebangsaan (Bagi WNA)</td>
                              <td width="9">:</td>
                                <td width="246">- </td>
                              <td width="8">&nbsp;</td>
                              <td width="217">&nbsp;</td>
                              <td width="9">&nbsp;</td>
                              <td width="200">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
      </tr>
    </table>
</div>
 <div class="tab-page" name="t1" style="postion:absolute" id="tabPage3">

                    <h2 class="tab">Data Pelapor</h2>

                <script type="text/javascript">
                	tp1.addTabPage(document.getElementById("tabPage3"));
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
                                  <input type="text" name="nik_plpor" size="18" class="boxdefault" maxlength="17"   onKeyUp="return num1(form1.nik_plpor)">
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
              </div>
              </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td><input type=hidden name="today" value="<%=record.getToday()%>">&nbsp;</td>
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
      <td width="130">
        <div align="center"><b>
          <input class=boxstandard type="button" value="KONFIRMASI"  name="kon"  onClick=" return suamiistri()" >
          </b></div>
      </td>
      <td width="104">
        <div align="center"><b> </b></div>
        <div align="center"><b>
          <input class=boxstandard type="button" value="SIMPAN" name="sim" onclick="return simpan()" disabled>
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