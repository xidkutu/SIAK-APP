<%@ page import="com.P4B.*"%>
<%
P4BBioObject wnidata=null;
wnidata= (P4BBioObject)session.getAttribute("wnidata");
%>
<table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                      <tr>
                        <td colspan="3" height="1">
                          <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3" height="25">
                          <div align="center"><span class="subtitle">Data Keluarga</span></div>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3" height="1">
                          <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">Nomor Kartu Keluarga</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b><%= wnidata.getNoKk().toString()%></b>
                        <input type="hidden" name="txtnokk" value="<%=wnidata.getNoKk().toString()%>">
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">Nama Kepala Keluarga</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b> <%=wnidata.getNama_kep().toString().toUpperCase()%>
                          </b>
                          <input type="hidden" name="txtnamakep" class=boxdefault  value="<%=wnidata.getNama_kep().toString().toUpperCase()%>">
                          </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">Alamat</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b> <%=wnidata.getAlamat().toString().toUpperCase()%>
                          </b>
                          <input type="hidden" name="txtalamat" class=boxdefault  value="<%=wnidata.getAlamat().toString().toUpperCase()%>">
                          </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">No.RT</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b> <%=wnidata.getNoRt()%> </b>
                        <input type="hidden" name="txtnort" class=boxdefault  value="<%=wnidata.getNoRt()%>">
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">No.RW</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b> <%=wnidata.getNoRw()%> </b>
                        <input type="hidden" name="txtnorw" class=boxdefault value="<%=wnidata.getNoRw()%>" >
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">Dusun</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"> <b> <%=wnidata.getDusun()%> </b>
                        <input type="hidden" name="txtdusun" class=boxdefault  value="<%=wnidata.getDusun()%>" >
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">Kode Pos</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b> <%=wnidata.getKodePos()%> </b>
                        <input type="hidden" name="txtkodepos" class=boxdefault  value="<%=wnidata.getKodePos()%>">
                        </td>
                      </tr>
                      <tr>
                        <td valign="top">
                          <div align="right">Telepon</div>
                        </td>
                        <td valign="top">:</td>
                        <td valign="top"><b> <%=wnidata.getTelp()%> </b>
                        <input type="hidden" name="txttelpon" class=boxdefault  value="<%=wnidata.getTelp()%>">
                        </td>
                      </tr>
                    </table>

<%
session.removeAttribute("wnidata");
%>