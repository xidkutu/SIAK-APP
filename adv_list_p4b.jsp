<script language="javascript">
function checkRadioButton(action,cursor)
{
   var vchecked;
   var radio = top.opener.document.formbiodata.radiobutton;
   for (i=0;i<radio.length;i++)
  {
     if (radio[i].checked)
     {
        vchecked = true;
        break;
    }
   }
   if (top.opener.document.all['idnxt'])
      {
          top.opener.document.all['idnxt'].removeNode(true);
          top.opener.document.all['idprv'].removeNode(true);
          top.opener.document.all['prog'].style.visibility="visible";
      }
   top.opener.document.formbiodata.action="cetak_biodata_WNI_P4B.jsp?nama_kel=" + top.opener.document.all["nkel"].value+"&no_kel="+top.opener.document.all["no_kel"].value+"&action="+action+"&cursor=" + cursor + "&nik=" +document.all['nik'].value+"&no_kk=" +document.all['no_kk'].value+"&nama_start=" + document.all['nama_lgkp'].value+"&max_row="+ document.all['max_row'].value;
   top.opener.document.formbiodata.submit();
   top.window.close();
}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY   bgColor=#93BEE2 text="#000000" >
<form method="post" name="tampiladv">
<table  border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" >
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
            <td class="C-Field" colspan="2">
              <div align="center"><b>Pencarian Canggih</b></div>
            </td>
          </tr>
          <tr>
            <td class="C-Field">No.KK</td>
            <td class="C-Field">
              <input   class=boxdefault size=23 name="no_kk">
            </td>
          </tr>
          <tr>
            <td class="C-Field"> NIK </td>
            <td class="C-Field">
              <input   class=boxdefault size=23 name="nik"  maxlength="17" >
            </td>
          </tr>
          <tr>
            <td class="C-Field"> Nama lengkap<br>
            </td>
            <td class="C-Field">
              <input   class=boxdefault size=23 name="nama_lgkp"  maxlength="60">
            </td>
          </tr>
          <tr>
            <td class="C-Field" height="27">Hasil / halaman</td>
            <td class="C-Field" height="27">
              <select name="max_row"   class=boxdefault>
                <option value="3">3</option>
                <option selected value="6">6</option>
                <option value="9">9</option>
                <option value="12">12</option>
                <option value="15">15</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class="C-Field" colspan="2" align="center">
              <input  class=boxstandard  type="button"  value="TAMPILKAN" onclick="checkRadioButton('EXEC','none')">
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
</form>
</BODY>

