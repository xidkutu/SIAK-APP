<%@page import="java.util.*,java.text.*, pendaftaran.*"%>
<%@include file="Global.jsp"%>

<%!
    UserInfo1 record = null;
%>
<%
   try
   {
record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
%>
<html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<BODY leftMargin=0  topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form  name="pilwil">
<table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
  <tr>
    <td colspan="9" height="1">
      <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
    </td>
  </tr>
  <tr>
    <td colspan="9" height="25">
      <div align="center"><span class="subtitle"> Data Wilayah</span></div>
    </td>
  </tr>
  <tr>
    <td colspan="9" height="1">
      <div align="center"><img src="images/batas_dot.gif" width="461" height="1">
      </div>
    </td>
  </tr>
  <tr>
    <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10"></td>
  </tr>
  <tr>
    <td>Kode-Nama Provinsi</td>
    <td>:</td>
    <td width="5">
	<%=record.getNoProp().trim()%>
      <input   type="hidden"   name=no_prop value="<%=record.getNoProp().trim()%>">
    </td>
    <td width="33">
	<%=record.getNamaProp().trim()%>
      <input type="hidden" name=nama_prop value="<%=record.getNamaProp().trim()%>">
    </td>
    <td><img src="images/dot.gif" width="1" height="1"></td>
    <td>Kode-Nama Kabupaten/Kota</td>
    <td>:</td>
    <td width="8">
	<%=record.getNoKab().trim()%>
      <input  type="hidden" name=no_kab value="<%=record.getNoKab().trim()%>">
        </td>
    <td width="22">
	<%=record.getNamaKab().trim()%>
      <input  type="hidden" name=nama_kab value="<%=record.getNamaKab().trim()%>">
    </td>
  </tr>
  <tr>
    <td>Kode-Nama Kecamatan</td>
    <td>:</td>
    <td width="5"> <%=record.getNoKec().trim()%>
      <input  type="hidden" name=no_kec value="<%=record.getNoKec().trim()%>">
     </td>
    <td> <%=record.getNamaKec().trim()%>
      <input  type="hidden" name=nama_kec value="<%=record.getNamaKec().trim()%>" >
    </td>
    <td>&nbsp;</td>
    <td>Kode-Nama Desa/Kelurahan</td>
    <td>:</td>
    <td width="8">
	 <%=request.getParameter("no_kel")%>
      <input  type="hidden" name=no_kel value='<%=request.getParameter("no_kel")%>'  >

    </td>
    <td width="22">
	<%=request.getParameter("namakel")%>
	     <input   type="hidden" name=nama_kel value='<%=request.getParameter("namakel")%>'>

    </td>
  </tr>
  <tr>
    <td>Kode-Nama Provinsi</td>
    <td>:</td>
    <td width="5">
      <input   class=boxdefault size=4 name=nprop onFocus="this.blur()" maxlength="2">
    </td>
    <td width="33">
<select    class="boxdefault" name="naprop"  onChange="ch_kab(pilwil.nprop.value,pilwil.nakab, 'true');nprop.value=this.options[this.selectedIndex].value;">
<option value="" selected>-- Pilih Provinsi --</option>
<script language="JavaScript">
getProps()
</script>
      </select>
    </td>
    <td><img src="images/dot.gif" width="1" height="1"></td>
    <td>Kode-Nama Kabupaten/Kota</td>
    <td>:</td>
    <td width="8">
      <input
				class=boxdefault size=4 name=nkab  onFocus="this.blur()" maxlength="2">
    </td>
    <td width="22">
      <select                                  class="boxdefault" name="nakab"  onchange="ch_kec(pilwil.nprop.value,pilwil.nkab.value,pilwil.nakec, 'true') ;nkab.value=this.options[this.selectedIndex].value;">
					<option selected value="">-- Pilih Kabupaten/Kota -</option>
      </select>
    </td>
  </tr>
  <tr>
    <td>Kode-Nama Kecamatan</td>
    <td>:</td>
    <td width="5">
      <input
				class=boxdefault size=4 name=nkec  onFocus="this.blur()" maxlength="2">
    </td>
    <td>
      <select       class="boxdefault" name="nakec"  onchange="nkec.value=this.options[this.selectedIndex].value;ch_kel(pilwil.nprop.value,pilwil.nkab.value,pilwil.nkec.value,pilwil.nakel);">
<option selected value="">-- Pilih Kecamatan --</option>
      </select>
    </td>
    <td>&nbsp;</td>
    <td>Kode-Nama Desa/Kelurahan</td>
    <td>:</td>
    <td width="8">
      <input
                                class=boxdefault size=4 name=nkel  maxlength="4" onFocus="this.blur()">
    </td>
    <td width="22">
      <select                  class="boxdefault" name="nakel"  onchange="nkel.value=this.options[this.selectedIndex].value; ">
<option selected value="">-- Pilih Desa/Kelurahan --</option>
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
       </form>
</body>
</html>
<%
}
   }catch(Exception err)
   {
     System.out.println(err);
   }
%>