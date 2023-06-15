<%@page import="com.db.connection.ServiceController,java.util.Vector,buku.rekapitulasi.pddk.*,kartukeluarga.DataKelurahan"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
UserInfo1 record = null;
String sysdate = "";
%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");
  }
   catch(Exception e){}

if(record != null)
{
  sysdate=record.getToday();
  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript>
function openListForm()
{
      window.open("buku_rek_pddk_listingpage.jsp?sysdate="+document.all["sysdate"].value+"&nama_prop="+document.all["nama_prop"].value+"&nama_kab="+document.all["nama_kab"].value+"&nama_kec="+document.all["nama_kec"].value+"&no_prop="+document.all["no_prop"].value+"&no_kab="+document.all["no_kab"].value+"&no_kec="+document.all["no_kec"].value,'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form method="post" name="openingform" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif">
        <input type="hidden" name="no_prop" value="<%=record.getNoProp()%>">
        <input type="hidden" name="nama_prop" value="<%=record.getNamaProp()%>">
        <input type="hidden" name="no_kab" value="<%=record.getNoKab()%>">
        <input type="hidden" name="nama_kab" value="<%=record.getNamaKab()%>">
        <input type="hidden" name="no_kec" value="<%=record.getNoKec()%>">
        <input type="hidden" name="nama_kec" value="<%=record.getNamaKec()%>">
		<jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr> </tr>
                    <tr>
                      <td>
                        <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td height="25">
                              <div align="center"><span class="subtitle">Buku
                                Rekapitulasi Penduduk</span></div>
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
                          <tr>
                            <td>
                              <table width="444" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td width="172" nowrap>Kode-Nama Provinsi </td>
                                  <td width="14" nowrap> :</td>
                                  <td width="65" nowrap><%=record.getNoProp()%></td>
                                  <td width="7" nowrap>
                                    <div align="center">-</div>
                                  </td>
                                  <td width="170" nowrap><%=record.getNamaProp()%></td>
                                </tr>
                                <tr>
                                  <td width="172" nowrap>Kode-Nama Kabupaten/Kota
                                  </td>
                                  <td width="14" nowrap> :</td>
                                  <td width="65" nowrap><%=record.getNoKab()%></td>
                                  <td width="7" nowrap>
                                    <div align="center">-</div>
                                  </td>
                                  <td width="170" nowrap><%=record.getNamaKab()%></td>
                                </tr>
                                <tr>
                                  <td width="172" nowrap>Kode-Nama Kecamatan</td>
                                  <td width="14" nowrap>:</td>
                                  <td width="65" nowrap><%=record.getNoKec()%></td>
                                  <td width="7" nowrap>
                                    <div align="center">-</div>
                                  </td>
                                  <td width="170" nowrap><%=record.getNamaKec()%></td>

                                </tr>
                                <tr>
                                  <td width="172" nowrap>
                                    <div align="right">Tanggal</div>
                                  </td>
                                  <td width="14" nowrap>:</td>
                                  <td colspan="3" nowrap><%=sysdate%></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="45" valign="top">
                              <div align="center"></div>
                              <div align="center"><b> </b>
                                <table width="100" border="0" cellspacing="2" cellpadding="3">
                                  <tr>
                                    <td>
                                      <div align="center"><b>
                                        <input class=boxstandard type=button value=TAMPILKAN name="tampilkan" onclick="openListForm()">
                                        </b></div>
                                    </td>
                                    <td>
                                      <div align="center"><b>
                                        <input class=boxstandard type=button value=KELUAR name="exit" onclick="javascript:history.back()">
                                        </b></div>
                                    </td>
                                  </tr>
                                </table>
                              </div>
                            </td>
                          </tr>
                          <tr>
                <td><input type=hidden name="nkel" value="">&nbsp;</td>
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
      </table>
    </td>
  </tr>
  <tr>
    <td><input type="hidden" name="sysdate" value="<%=sysdate%>">&nbsp;</td>
  </tr>
</table>
</form>
</BODY></HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
%>
