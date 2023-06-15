<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>

<%@ page import="java.util.*,pendaftaran.*,keluargawna.*,com.db.connection.*" %>

<%!
    UserInfo1 record=null;
%>

<%
   record=(UserInfo1)session.getAttribute("remoteRef");
try
   {
if(record != null)
{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/keymapper.js">
</SCRIPT>
<SCRIPT language=JavaScript src="scripts/newwilayah2.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onhelp="doKeyDown(event);"; onKeyDown="callKeyDown()" onload="window.history.forward(1)">
<SCRIPT language="JavaScript">
var firedBefore=false;
</SCRIPT>

<FORM action="Head_Bio_Wna.jsp" method=post name="datakelu">
<input type=hidden name=cur_naprop value="<%=record.getNamaProp()%>">
<input type=hidden name=cur_nakab value="<%=record.getNamaKab()%>">
<input type=hidden name=cur_nakec value="<%=record.getNamaKec()%>">
<input type=hidden name=cur_nakel value="">
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
                                KK Baru WNA</span><br>
                                <span class="linkyellow">Yang Belum Punya NIK</span><br>
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
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah</span></div>
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
                            <td>Kode-Nama Propinsi</td>
                            <td>:</td>
                            <td width="5">
<input class=boxdefault size=4 name=no_prop  maxlength="2" value="<%=record.getNoProp()%>">
                            </td>
                            <td width="33">
<input class=boxdefault size=22 name=nama_prop maxlength="60" value="<%=record.getNamaProp().toString().toUpperCase()%>">
                            </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td>:</td>
                            <td width="8">
<input class=boxdefault size=4 name=no_kab  maxlength="2" value="<%=record.getNoKab()%>">
                            </td>
                            <td width="22">
<input  class=boxdefault size=22 name=nama_kab  maxlength="60" value="<%=record.getNamaKab().toString().toUpperCase()%>">
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                            <td>:</td>
                            <td width="5">
<input  class=boxdefault size=4 name=no_kec  maxlength="2" value="">
                            </td>
                            <td>
<select name="nama_kec"  class="boxdefault" onChange="datakelu.no_kec.value=this.value;document.all['cur_nakec'].value=this.options[this.selectedIndex].text;pilih_kel_with_textbox(datakelu.no_prop.value, datakelu.no_kab.value, datakelu.no_kec.value, datakelu.no_kel, datakelu.nama_kel);">
<option selected value="">-- Pilih Kecamatan --</option>
</select>

                            </td>
                            <td>&nbsp;</td>
                            <td>Kode-Nama Desa/Kelurahan</td>
                            <td>:</td>
                            <td width="8">
<input class=boxdefault size=4 name="no_kel"  maxlength="4" value="">
                            </td>
                            <td width="22">
<select  name="nama_kel"  class="boxdefault" onChange="datakelu.no_kel.value=this.value;document.all['cur_nakel'].value=this.options[this.selectedIndex].text;">
<option selected>-- Pilih Desa/Kelurahan --</option>
                              </select>
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
                  </table>
                </td>
              </tr>
              <tr>
                <td height="238">
                  <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                    <tr>
                      <td><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                      <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td height="241">&nbsp;</td>
                      <td height="241">
                          <table border="0" cellspacing="5" cellpadding="0" align="center" height="100%" class="border" width="100%">
                            <tr>
                            <td valign="top">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" valign="top">
                                    <div align="center"><span class="subtitle">Data
                                      Keluarga</span><font size="2" face="Arial Black" color="#FFFF00"><br>
                                      </font></div>
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
                            <td valign="top" height="172">
                                <table width="100%" border="0" cellspacing="3" cellpadding="2" align="center" height="100%">
                                  <tr>
                                    <td width="134">
                                Nomor Kartu Keluarg<span class="linkyellow">(Family Card Number)</span>
                                    </td>
                                    <td width="5"> :</td>
                                    <td width="164">&lt; Create By System &gt;</td>
                                    <td width="3">&nbsp;</td>
                                    <td width="154">
                                      Nama Kepala Keluarga <font class="asterish">*</font>
                                      <span class="linkyellow">(Family Head Name)</span>
                                    </td>
                                    <td width="5">:</td>
                                    <td width="172">
<input class=boxdefault size=22 name=nama_kep maxlength="60" onKeyUp="return kepa()" >
                                  </td>
                                </tr>
                                <tr>
                                    <td width="134">
                                     Alamat Keluarga <font color="#000099" class="asterish">*</font>
                                      <span class="linkyellow">(Family Address)</span>
                                    </td>
                                    <td width="5">:</td>
                                    <td width="164">
<input class=boxdefault size=22 name=alamat maxlength="60" onKeyUp="return alam()">
                                  </td>
                                    <td width="3">&nbsp;</td>
                                    <td width="154">
                                      No. RT
                                      <span class="linkyellow">(RT Number)</span>
                                    </td>
                                    <td width="5">:</td>
                                    <td width="172">
<input class=boxdefault size=3 name=no_rt maxlength="3" onKeyUp="return rt()" >
                                  </td>
                                </tr>
                                <tr>
                                    <td width="134">No. RW<span class="linkyellow">(RW Number)</span></td>
                                    <td width="5">:</td>
                                    <td width="164">
<input class=boxdefault size=3 name=no_rw maxlength="3" onChange="return rw()">
                                  </td>
                                    <td width="3">&nbsp;</td>
                                    <td width="154">Nama Dusun/Dukuh/Kampung <span class="linkyellow">(Sub Village)</span> </td>
                                    <td width="5">:</td>
                                    <td width="172">
<input class=boxdefault size=20 name=dusun maxlength="60" onKeyUp="return dus()">
                                  </td>
                                </tr>
                                <tr>
                                    <td width="134">Kode Pos
									<span class="linkyellow">(Post Code)</span></td>
                                    <td width="5">:</td>
                                    <td width="164">
<input class=boxdefault size=5 name=kodepos maxlength="5" onChange="return kod()">
                                  </td>
                                    <td width="3">&nbsp;</td>
                                    <td width="154">Telepon <span class="linkyellow">(Telephone)</span></td>
                                    <td width="5">:</td>
                                    <td width="172">
<input class=boxdefault size=20 name=telp maxlength="20" onKeyUp="return tel()">
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td height="241">&nbsp;</td>
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
                      <td valign="bottom">
                          <div align="center"><b>
                            <input class=boxstandard disabled type=submit value=ENTRI name="ENT" onClick="return n_kap()">
                            </b></div>
                      </td>
                      <td height="55" valign="bottom">
                          <div align="center"><b>
                            <input class=boxstandard type="button" value=BATAL name="SIM"  onClick="return c()">
                            </b></div>
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
<script language="javascript">
pilih_kec_with_textbox(datakelu.no_prop.value, datakelu.no_kab.value, datakelu.no_kec, datakelu.nama_kec, datakelu.no_kel, datakelu.nama_kel);
</script>
</form>
</BODY>
<SCRIPT language=javascript src="Templates/kep_vali.js">
</SCRIPT>
</HTML>
<%}
else
{
  response.sendRedirect("index.jsp");
}
     }
catch(Exception ee)
{
System.out.println("Error in DataWilaya"+ee);
     }
%>
