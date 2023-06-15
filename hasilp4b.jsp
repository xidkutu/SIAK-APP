<%@ include file="Global.jsp"%>
<html>
<head>
<title>siakOnline</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>
<body bgcolor="#93BEE2" text="#93BEE" onload="window.history.forward(1)">
 <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr> </tr>
    <tr>
      <td>
        <table border="0" cellspacing="3" cellpadding="2" align="center">
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
           <td colspan="3" height="25">
              <div align="center"><span class="subtitle">Data Individu Hasil Pemutakhiran</span></div>
</td>
          </tr>
          <tr>
            <td colspan="3" height="1">
              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
            </td>
          </tr>
          <tr>
            <td colspan="3" height="10">
              <table border="0" cellspacing="3" cellpadding="0" align="center" width="100%">
                <tr>
                  <td width="193" valign="top">
                    <div align="right"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif">Nomor
                      KK</font></b></font></div>
                  </td>
                  <td width="14" valign="top">
                    <div align="center"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif">:</font></b></font></div>
                  </td>
                  <td colspan="2" valign="top" width="242">
                    <div align="left"><font size="2" color="#FF3F00"><b><font face="Verdana, Arial, Helvetica, sans-serif"><%=request.getParameter("no_kk")%></font></b></font></div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td height="35" valign="bottom">
        <div align="center">
          <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
            <tr>
              <td width="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
              <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
              <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td class="C-BG">
                <table border="0" cellspacing="1" cellpadding="3" align="center">
                  <tr>

                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">NIK</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Nama
                        Lengkap</font></div>
                    </td>
                    <td class="C-Fonts">
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Jenis Kelamin</font></div>
                    </td>
                    <td class="C-Fonts"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" class="C-Fonts">Tempat Lahir </font></td>
                    <td align="center" class="C-Fonts">Tanggal Lahir</td>
                    <td align="center" class="C-Fonts">SHDK</td>
                    <td align="center" class="C-Fonts">NIK Ibu</td>
                    <td align="center" class="C-Fonts">Nama Ibu</td>
                  </tr>
                  <tr>

                    <td class="C-Field">
                      <div align="center">
                        <p><%=request.getParameter("nik")%></p>
                      </div>
                    </td>
                    <td class="C-Field">
                      <div align="center"><%=request.getParameter("nama")%> </div>
                    </td>
                    <td align="center" class="C-Field"><%=request.getParameter("jenis")%> </td>
                    <td align="center" class="C-Field"><%=request.getParameter("tmpt")%></td>
				<td align="center" class="C-Field"><%=request.getParameter("tgl")%></td>
				<td align="center" class="C-Field"><%=request.getParameter("shdk")%></td>
				<td align="center" class="C-Field"><%=request.getParameter("nik_ibu")%></td>
				<td align="center" class="C-Field"><%=request.getParameter("nama_ibu")%></td>
              </tr>
                </table>
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="1"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
              <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
              <td height="5" width="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
            </tr>
          </table>
          <b> </b></div>
      </td>
    </tr>
    <tr>
      <td height="35" valign="bottom">

      <div align="center"><b>
        <h4><font color=red>
          <center>
		  <%=printInfo("Data sudah dimutakhirkan !")%>
          </center>
          </font></h4>
        <input class=boxstandard type=button value="LANJUT" name="kel12" onClick="document.location='Pendaftaran_Biodata_WNI_Edit1.jsp?destination=Pendaftaran_Biodata_WNI_Edit_P4B.jsp'">
        <input class=boxstandard type=button value="KELUAR" name="kel1" onclick="document.location='WNI_Menu.jsp'">
        </b></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</body>
</html>
