<%
    String no_prop, nama_prop, no_kab, nama_kab, no_kec, nama_kec;

    no_prop = (request.getParameter("no_prop")==null?"":request.getParameter("no_prop"));
    nama_prop = (request.getParameter("nama_prop")==null?"":request.getParameter("nama_prop"));
    no_kab = (request.getParameter("no_kab")==null?"":request.getParameter("no_kab"));
    nama_kab = (request.getParameter("nama_kab")==null?"":request.getParameter("nama_kab"));
    no_kec = (request.getParameter("no_kec")==null?"":request.getParameter("no_kec"));
    nama_kec = (request.getParameter("nama_kec")==null?"":request.getParameter("nama_kec"));

%>

<table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
              <tr>
                <td colspan="4" height="1">
                  <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                </td>
              </tr>
              <tr>
                <td colspan="4" height="25">
                  <div align="center"><span class="subtitle">Data Wilayah</span></div>
                </td>
              </tr>
              <tr>
                <td colspan="4" height="1">
                  <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                </td>
              </tr>
              <tr>
                <td colspan="4" height="10"><img src="images/dot.gif" width="1" height="1"></td>
              </tr>
              <tr>
                <td width="170">Kode-Nama Provinsi</td>
                <td width="10">:</td>
                <td width="3%">
                  <input class=boxdefault size=2 name=no_prop value="<%=no_prop%>" onFocus="this.blur()" maxlength="2">
                </td>
                <td width="233">
                  <input class=boxdefault size=22 name=nama_prop value="<%=nama_prop%>" onFocus="this.blur()" maxlength="60">
                </td>
              </tr>
              <tr>
                <td height="10" width="170">Kode-Nama Kabupaten/Kota</td>
                <td width="10">:</td>
                <td width="25">
                  <input
                                class=boxdefault size=2 name=no_kab value="<%=no_kab%>" onFocus="this.blur()" maxlength="2">
                </td>
                <td width="233">
                  <input
                                class=boxdefault size=22 name=nama_kab value="<%=nama_kab%>" onFocus="this.blur()" maxlength="60">
                </td>
              </tr>
              <tr>
                <td height="10" width="170"><img src="images/dot.gif" width="1" height="10">Kode-Nama
                  Kecamatan</td>
                <td width="10">:</td>
                <td width="25">
                  <input
                                class=boxdefault size=2 name=no_kec  value="<%=no_kec%>" onFocus="this.blur()" maxlength="2">
                </td>
                <td width="233">
                  <input
                                class=boxdefault size=22 name=nama_kec  value="<%=nama_kec%>" onFocus="this.blur()" maxlength="60">
                </td>
              </tr>
              <tr>
                <td height="10" width="170">&nbsp;</td>
                <td width="10">&nbsp;</td>
                <td width="56">&nbsp;</td>
                <td width="233">&nbsp;</td>
              </tr>
            </table>
