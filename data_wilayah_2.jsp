<%response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<table width="753" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="9" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="9" height="25">
                              <div align="center"><span class="subtitle">Data
                                Wilayah<br>
                                <font class="linkyellow">(Region data)</font>
                                </span></div>
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
                            <td width="133">Kode-Nama Provinsi<br>
                                <span class="linkyellow">(Code - Province)</span>
                            </td>
                            <td width="5">:</td>
                            <td width="38">
<input class=boxdefault size=4 name=no_prop  maxlength="2" onFocus="this.blur()" value="<%=request.getParameter("no_prop")%>">
                            </td>
                            <td width="164">
<input class=boxdefault size=22 name=nama_prop value="<%=request.getParameter("nama_prop")%>"  maxlength="60">
                            </td>
                            <td width="1"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="167">Kode-Nama Kabupaten/Kota<br>
                                <span class="linkyellow">(Code-Regency/Municipality)</span>
                            </td>
                            <td width="6">:</td>
                            <td width="38">
<input class=boxdefault size=4 name=no_kab  maxlength="2" onFocus="this.blur()" value="<%=request.getParameter("no_kab")%>">
                            </td>
                            <td width="135">
<input class=boxdefault size=22 name=nama_kab value="<%=request.getParameter("nama_kab")%>" onFocus="this.blur()" maxlength="60">
                            </td>
                          </tr>
                          <tr>
                            <td height="10" width="133"><img src="images/dot.gif" width="1" height="10"></td>
                            <td width="5">&nbsp;</td>
                            <td width="38">&nbsp;</td>
                            <td width="164">&nbsp;</td>
                            <td width="1">&nbsp;</td>
                            <td width="167">&nbsp;</td>
                            <td width="6">&nbsp;</td>
                            <td width="38">&nbsp;</td>
                            <td width="135">&nbsp;</td>
                          </tr>
                        </table>