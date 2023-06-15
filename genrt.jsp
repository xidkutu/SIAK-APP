<%@ page import="com.db.connection.*,siaktools.logwriter.*,java.io.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
<style type="text/css">
<!--
.line {  border: thin #CCCCFF solid}
-->
</style>
</HEAD>

<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<form method="post" name="frmrt">
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</script>
<script language="javascript">
function postGenerate(prm)
{
frmrt.action="genrt.jsp?res="+prm
frmrt.submit();
}

</script>
<br>
<br>
<br>
<br>
 <center> Generate RT XML</center><br>
  <table  cellspacing="5" cellpadding="5" align="center" class="line">
    <tr>
      <td  >Provinsi</td>
      <td>
        <select name="prop" class="boxdefault" onchange="pilih_kab_select_only(this, frmrt.kab, kec, kel)">
          <option selected>--Pilih Provinsi--</option>
        </select>
      </td>
    </tr>
    <tr>
      <td  >Kabupaten/Kota</td>
      <td>
        <select name="kab" class="boxdefault" onchange="pilih_kec_select_only(frmrt.prop, this, frmrt.kec, frmrt.kel)">
          <option selected>--Pilih Kabupaten--</option>
        </select>
      </td>
    </tr>
    <tr>
      <td  >Kecamatan</td>
      <td>
        <select name="kec"  class="boxdefault" onchange="pilih_kel_select_only(frmrt.prop, frmrt.kab, this, frmrt.kel)">
          <option selected>--Pilih Kecamatan--</option>
        </select>
      </td>
    </tr>
    <tr>
      <td  >Desa/Kelurahan</td>
      <td>
        <select name="kel"  class="boxdefault">
          <option selected>--Pilih Kelurahan--</option>
        </select>
      </td>
    </tr>
  </table>
  <br>
<br>
<%
try{
String prm=request.getParameter("res");
%>

<div align="center"><b>
<br>
<br>
<br>
<%
String no_prop,no_kab,no_kec,no_kel;
try{
   ServiceController factory=null;
   XmlReader remote;
   XmlReaderHome home;
   factory=ServiceController.getInstance();
   home=(XmlReaderHome)factory.lookup("XmlReader",XmlReaderHome.class);
   remote=home.create();
   if (prm.trim().equals("W"))
{
System.out.println(prm);
    no_prop=request.getParameter("prop");
System.out.println(no_prop);
    no_kab=request.getParameter("kab");
System.out.println(no_kab);
    no_kec=request.getParameter("kec");
System.out.println(no_kec);
    no_kel=request.getParameter("kel");
System.out.println(no_kel);
    remote.writeRumahTangga(no_prop,no_kab,no_kec,no_kel);
}
  else if (prm.trim().equals("A"))
{
     remote.writeRumahTangga();
}
  }catch(Exception err)
  {

  }
%>
<input class=boxstandard type=button value="Berdasarkan Wilayah" name="gen" onclick="postGenerate('W')"> &nbsp;&nbsp;&nbsp;&nbsp;
<input class=boxstandard type=button value="Semua Wilayah" name="gen1" onclick="postGenerate('A')"> &nbsp;&nbsp;&nbsp;&nbsp;
<input class=boxstandard type=button value="Keluar" name="keluar" onclick="document.location='siak_admin.jsp'">
<%
if ((prm!=null) && !prm.trim().equals(""))
{
%>
    <div align="center"  class="boxdefault">File(s) Generated SuccessFully</div>
<%
}
}catch(Exception err)
{
System.out.println(err);
}
%>
</b></div>
 <SCRIPT language=javascript>
  pilih_prop_select_only(frmrt.prop);
</script>
</form>
</body>
</html>
