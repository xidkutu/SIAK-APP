<html>
<head>
<TITLE>adminduk SIAK online</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="Templates/s.css" type="text/css">
</head>
<%String nama = "";
  nama = request.getParameter("nama_lgkp");
  System.out.println(nama);
%>
<body bgcolor="#93BEE2" text="#93BEE" onload="window.history.forward(1)">

<table width="100%" border="0" cellspacing="3" cellpadding="3">

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
                        
                        <div align="center"><span class="subtitle">Daftar Keluarga WNI</span></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                        <% out.println("<h3><center><font color=red>Data Sudah Ada !.");%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
		<td>
			<table border="0" cellspacing="3" cellpadding="2" align="center">
				<tr>
					<td colspan="3">
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<input class=boxstandard type=button value= KELUAR name="Button2222" onClick="location.href='WNI_Menu.jsp'">
					</td>
				</tr>
				<tr>
					<td colspan="3">
					</td>
				</tr>
			</table>
		</td>
    </tr>
    
    
</body>
</html>