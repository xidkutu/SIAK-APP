<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan,siaktools.logwriter.*"%>
<%@ include file="Global.jsp"%>

<%!
    String login=null,pwd=null,select,id1=null;
    UserInfo1 record = null;
    Vector v = null;
%>

<%
     v = new Vector();

try
   {
   record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
 {
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=javascript src="scripts/kep_vali_wni.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<FORM action="Pendaftaran_Biodata_WNI_Entity.jsp" method=post name="datakelu">
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
                            <td height="45">
                              <div align="center"><span class="submenu">Permohonan
                                KK Baru WNI</span><br>
                                <span class="linkyellow">Yang Belum Punya NIK</span><br>
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
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
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
                        <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100">
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
                              <table width="650" border="0" cellspacing="3" cellpadding="2" align="center">
                                <tr>
                                  <td width="141">Nomor Kartu Keluarga</td>
                                  <td width="2"> :</td>
                                  <td>&lt; Create By System &gt;</td>

                                  <td width="10">&nbsp;</td>
                                  <td>Nama Kepala Keluarga <font class="asterish">*</font></td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=22 name=nama_kep maxlength="60" onKeyUp="return char(datakelu.nama_kep)">
                                  </td>
                                </tr>
                                <tr>
                                  <td>Alamat Keluarga <font color="#000099" class="asterish">*</font>
                                  </td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=22 name=alamat maxlength="60">
                                  </td>
                                  <td width="10">&nbsp;</td>
                                  <td>No. RT <font class="asterish"> </font> </td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=3 name=no_rt maxlength="3" onKeyUp="return num(datakelu.no_rt)">
                                  </td>
                                </tr>
                                <tr>
                                  <td>No. RW</td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=3 name=no_rw maxlength="3" onKeyUp="return num(datakelu.no_rw)">
                                  </td>
                                  <td width="10">&nbsp;</td>
                                  <td>Nama Dusun/Dukuh/Kampung</td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=20 name=dusun maxlength="60" onKeyUp="return char1(datakelu.dusun)">
                                  </td>
                                </tr>
                                <tr>
                                  <td>Kode Pos</td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=5 name=kodepos maxlength="5" onKeyUp="return num(datakelu.kodepos)">
                                  </td>
                                  <td width="10">&nbsp;</td>
                                  <td>Telepon</td>
                                  <td>:</td>
                                  <td>
                                    <input
                                class=boxdefault size=20 name=telp maxlength="20" onKeyUp="return num1(datakelu.telp)">
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
                      <td >
                          <div align="center"><b>
                            <input class=boxstandard type=submit value=ENTRI name="button3"  onClick="return n_kap()">
							 </b></div>
		      </td>
							<td>
			<div align="center"><b>
                            <input class=boxstandard type="button" value="BATAL" name="bat" onClick="confKeluar()">
                            </b></div>
                      </td>
                      <td height="55" valign="bottom">
                          <div align="center"><b> </b></div>
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="bottom" height="25">
                          <div align="center" class="linkyellow"></div>
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

</HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
  {
            System.out.println("Error in DataLuarga_WNi_Entity" + e);
  }

%>

