<html>
<head>
<title>Upload Image</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Nik</td>
    <td>
        &nbsp;
</td>
  </tr>
    <tr>
    <td>Photo</td>
<form name="dbphoto1" enctype="multipart/form-data" method="post" action="dbphoto1.jsp">
    <td>
<input class=boxstandard type="file" name="namaphoto1" size="60">
</td>
</form>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
        <div align="center">
          <input type="button" name="Submit" value="button" onClick="javascript:startProcess();">
        </div>
      </td>
  </tr>
</table>
<script language="javascript">
function startProcess()
{
//if (formtrs.namafile.value == "") {
  //alert("File belum dipilih, silahkan pilih file yang akan diproses !")
  //formtrs.namafile.focus()
 //}
//else {
 //progde = new Image();
 //progde.src= "images/wait.gif";
 //document.all['browner'].style.visibility="visible";
 //document.progbar.src=progde.src
 //document.all['formtrs'].action="DkkProsesdataALLON2OFF.jsp"
 //document.all['formtrs'].action="SiakON2OFFFrame.jsp"
 //document.all['formtrs'].action="uploadfileon2off.jsp"

  //document.all['GOTRS'].disabled=true;
   document.all['dbphoto1'].submit();
   //document.all['dbphoto2'].submit();
   //document.all['dbphotoa'].submit();
//}
}
</script>
</body>
</html>
