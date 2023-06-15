<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan"%>
<%@ include file="Global.jsp"%>
<%!
    String login=null,pwd=null,select;
    UserInfo1 record = null;
%>


<%
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
<SCRIPT language=JavaScript src="scripts/validation_WNI.js">
</SCRIPT>

<SCRIPT language=JavaScript>
function trim(strText) {
    // this will get rid of leading spaces
    while (strText.substring(0,1) == ' ')
        strText = strText.substring(1, strText.length);

    // this will get rid of trailing spaces
    while (strText.substring(strText.length-1,strText.length) == ' ')
        strText = strText.substring(0, strText.length-1);

   return strText;
}

function edi()
{
var nikwni=trim(form1.nik.value)

if (isNaN(nikwni))
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		form1.nik.value="";
		form1.nik.focus();
		return false;
}

if (nikwni.length!=16)
{
		alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		form1.nik.value="";
		form1.nik.focus();
		return false;
}

for(var i=0; i < form1.nik.value.length; i++)
{
         if(form1.nik.value.charAt(i)=="-")
               {
                 alert("Data Anda Salah, Silahkan Coba Lagi !!" )
		 form1.nik.value="";
                 form1.nik.focus();
	         return false;
               }
}
if(trim(form1.nik.value)=="")
{
                alert("Nomor Induk Kependudukan Belum Diisi!!" )
		form1.nik.focus();
		return false;
}
if (form1.nama_kel.selectedIndex==0)
{
          alert("Nama Kelurahan belum di pilih !");
         form1.nama_kel.focus();
        return false;
}

document.forms[0].action= '<%=request.getParameter("destination")%>'//"Pendaftaran_Biodata_WNI_Edit.jsp"
document.forms[0].submit();
document.all['button2232'].disabled=true;
}
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post">
<%
String alter="N";
if (request.getParameter("alter")!=null) alter="Y";
%>

<input type="hidden" name="alter" value='<%=alter%>'>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <td background="images/v_bg_header.gif">
        <input type="hidden" name="namakel" value="">
		<jsp:include page="top.html"/>
      </td>
  </tr>
  <tr>
    <td>

        <tr>
          <td valign="top">

              <tr>
                <td>

                    <tr>
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                              <td height="44">
                                <div align="center"><span class="submenu">Pendaftaran
                                Perubahan Biodata WNI</span><br>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td valign="top">

                <table width="766" border="0" cellspacing="3" cellpadding="2" align="center">
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

                    <td width="156">Kode-Nama Provinsi</td>

                    <td width="4">:</td>

                    <td width="30">
                      <input
   class=boxdefault size=4 name=no_prop value="<%=record.getNoProp().trim()%>" onFocus="this.blur()" maxlength="2">
     <input type=hidden name='prop' value="<%=record.getNoProp().trim()%>">
                            </td>

                    <td width="120">
                      <input
				class=boxdefault size=22 name=nama_prop value="<%=record.getNamaProp().trim()%>" maxlength="60" onFocus="this.blur()">
                            </td>

                    <td width="1"><img src="images/dot.gif" width="1" height="1"></td>

                    <td width="189">Kode-Nama Kabupaten/Kota</td>

                    <td width="4">:</td>

                    <td width="30">
                      <input
				class=boxdefault size=4 name=no_kab value="<%=record.getNoKab().trim()%>" onFocus="this.blur()" maxlength="2">
				 <input type=hidden name='kab' value="<%=record.getNoKab().trim()%>">
                            </td>

                    <td width="166">
                      <input
				class=boxdefault size=22 name=nama_kab value="<%=record.getNamaKab().trim()%>" onFocus="this.blur()" maxlength="60">
                            </td>
                          </tr>
                          <tr>

                    <td width="156">Kode-Nama Kecamatan</td>

                    <td width="4">:</td>

                    <td width="30">
                      <input
				class=boxdefault size=4 name=no_kec value="<%=record.getNoKec().trim()%>" onFocus="this.blur()" maxlength="2">
				<input type=hidden name='kec' value="<%=record.getNoKec().trim()%>">
                            </td>

                    <td width="120">
                      <input

				class=boxdefault size=22 name=nama_kec value="<%=record.getNamaKec().trim()%>" onFocus="this.blur()" maxlength="60">
                            </td>

                    <td width="1">&nbsp;</td>

                    <td width="189">Kode-Nama Desa/Kelurahan</td>

                    <td width="4">:</td>

                    <td width="30">
                      <input
                                class=boxdefault size=4 name=no_kel onFocus="this.blur()" maxlength="4">
                            </td>

                    <td width="166">
                      <select
                  onChange="form1.no_kel.value=form1.nama_kel.options[this.selectedIndex].value;namakel.value=form1.nama_kel.options[form1.nama_kel.selectedIndex].text"
                  name=nama_kel boxdefault2 class="boxdefault">
<option>-- Pilih Desa/Kelurahan --</option>
<%
Vector vDataKelurahan = new Vector();

         vDataKelurahan = getDataKelurahan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim());

for(int i=0;i<vDataKelurahan.size();i++)
{
%>
<option value="<%=((DataKelurahan)vDataKelurahan.elementAt(i)).getNo_kel()%>"> <%=((DataKelurahan)vDataKelurahan.elementAt(i)).getNama_kel()%></option>
<%
}
%>
			      </select>
                            </td>
                          </tr>


                          <tr>

                    <td height="10" width="156"><img src="images/dot.gif" width="1" height="10"></td>

                    <td width="4">&nbsp;</td>

                    <td width="30">&nbsp;</td>

                    <td width="120">&nbsp;</td>

                    <td width="1">&nbsp;</td>

                    <td width="189">&nbsp;</td>

                    <td width="4">&nbsp;</td>

                    <td width="30">&nbsp;</td>

                    <td width="166">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>

              <td valign="top">
                <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="25">
                              <div align="center"><span class="subtitle">
Data Individu</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>


<table width="550" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="3" height="1">
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" height="1">
                            </td>
                          </tr>

                        <tr>
                              <td valign="top">Nomor Induk Kependudukan<br>
                                    <span class="linkyellow">(Number of Population
                                    Identity)</span></td>
                                  <td valign="top"> :

 <input class=boxdefault size=16 name="nik" maxlength="16">
 <input type="hidden" name="today" value="<%=record.getToday()%>">
</td>

<td valign="top">
      <input class=boxstandard  onClick="return edi()" type=button value=PERIKSA name="button2232" >
                            </td>
<td valign="top">
   <input class=boxstandard onClick="onclick=document.location='WNI_Menu.jsp'"  type=button value=KELUAR >
 </td>
</tr>
<tr>
<td colspan="4">
<div align="center">
<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FF0000">
<%
String msgflag="";
 if ((request.getParameter("n")!=null) && !(request.getParameter("n").trim().equals("")) && !(request.getParameter("n").trim().equals("0")))
      {
           switch(Integer.parseInt(request.getParameter("n")))
                  {
                       case 1:
                       msgflag="Data sudah disimpan !";
                       break;
                       case 2:
                       msgflag="NIK belum terdaftar !";
                       break;
                       case 3:
                       msgflag="Biodata penduduk tidak bisa diubah lagi !";
                       break;
                       case 4:
                       msgflag="Sudah dimutakhirkan !";
                       break;
                       case 5:
                       msgflag="Data belum tersimpan !";
                       break;
                       case 6:
                       msgflag="Silakan coba lagi !";
                       break;
                  }
      }
%>
<b>
<%
if (!msgflag.equals(""))
 {
%>
<%=printError(msgflag)%>
<%
 }
%></b>
</font> </div>
</td>
</tr>
  </table>
</table>
</form>

</BODY></HTML>
<%
msgflag="";
}
else
{
   response.sendRedirect("index.jsp");
}
}catch(Exception e)
{
   e.printStackTrace();
}
%>

