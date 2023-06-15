<%
response.setHeader("Pragma", "No-cache");
response.setDateHeader("Expires", 0);
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "private");
%>
<%@include file="Global.jsp"%>
<%  int level = 0, sublevel = 1;
    String no_prop, nama_prop, no_kab, nama_kab, no_kec, nama_kec, no_kel, nama_kel;

    level = ((request.getParameter("level") == null) ? 0 : Integer.parseInt(request.getParameter("level")));
    sublevel = ((request.getParameter("sublevel") == null) ? 1 : Integer.parseInt(request.getParameter("sublevel")));
    no_prop = (request.getParameter("no_prop")==null?"":request.getParameter("no_prop"));
    nama_prop = (request.getParameter("nama_prop")==null?"":request.getParameter("nama_prop"));
    no_kab = (request.getParameter("no_kab")==null?"":request.getParameter("no_kab"));
    nama_kab = (request.getParameter("nama_kab")==null?"":request.getParameter("nama_kab"));
    no_kec = (request.getParameter("no_kec")==null?"":request.getParameter("no_kec"));
    nama_kec = (request.getParameter("nama_kec")==null?"":request.getParameter("nama_kec"));
    no_kel = (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
    nama_kel = (request.getParameter("nama_kel")==null?"":request.getParameter("nama_kel"));
    int selidx = 0;
    try {
       selidx = Integer.parseInt(request.getParameter("selidx"));
    } catch (Exception ex) {
    }
%>
<SCRIPT language=javaScript src="scripts/newwilayah2.js">
</SCRIPT>
<table width="750" border="0" cellspacing="3" cellpadding="2" align="center">
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
                            <td colspan="9" height="10"><img src="images/dot.gif" width="1" height="10">
    </td>
                          </tr>
						  <%
                       if (level>0) {%>
                          <tr>
                            <td>Kode-Nama Propinsi</td>
                            <td>:</td>
                            <td width="5">

      <input
                                class=boxdefault size=4 name="no_prop"  maxlength="2" value="<%=no_prop%>" onFocus="this.blur()">
                            </td>
                            <td width="33">

      <input
                                class=boxdefault size=22 name=nama_prop value="<%=nama_prop%>" maxlength="60" onFocus="this.blur()">
                            </td>
                            <td><img src="images/dot.gif" width="1" height="1"></td>
                            <td><%if (level>1) {%>Kode-Nama Kabupaten/Kota<%}%></td>
                            <td>:</td>
                            <td width="8">
							<%if (level>1) {%>

      <input
                                class=boxdefault size=4 name="no_kab"  maxlength="2" value="<%=no_kab%>" onFocus="this.blur()">
								<%}%>
                            </td>
                            <td width="22">
							<%if (level>1) {%>
      <input
                                class=boxdefault size=22 name=nama_kab  maxlength="60" value="<%=nama_kab%>" onFocus="this.blur()">
							<%}%>
                            </td>
                          </tr>
						  <%} if (level>2) {%>
                          <tr>
                            <td>Kode-Nama Kecamatan</td>
                            <td>:</td>
                            <td width="5">
<input class=boxdefault size=4 name="no_kec"  maxlength="2" value="<%=no_kec%>" onFocus="this.blur()">
                            </td>
                            <td width="22"> <%if (level>3) {
	                      if (sublevel>=2) {
	%>
      <select   onChange="resetKec(this);" name=nama_kec boxdefault2 class="boxdefault">
        <option>-- Pilih Kecamatan --</option>
      </select>
<script language="JavaScript">
   pilih_kec_with_textbox(document.all['no_prop'].value, document.all['no_kab'].value, document.all['no_kec'], document.all['nama_kec'], document.all['no_kel'], document.all['nama_kel'])
</script>
      <%} else {
	  %>

	  <input
                                class=boxdefault size=22 name=nama_kec maxlength="60" value="<%=nama_kec%>" onFocus="this.blur()">
      <%
	    }
	  }%>
    </td>

                            <td>&nbsp;</td>


    <td>
      <%if (level>3) {%>
      Kode-Nama Desa/Kelurahan
      <%}%>
    </td>
                            <td>:</td>
                            <td width="8">
                            <%if (level>3) {%>
      <input
                                class=boxdefault size=4 name=no_kel  maxlength="4" onFocus="this.blur()" value="<%=no_kel%>">
								<%}%>
                            </td>

    <td width="22"> <%if (level>3) {
	                      if (sublevel>=1) {
	%>
      <select
                  onChange="resetPage(this);"
                  name=nama_kel boxdefault2 class="boxdefault">
        <option>-- Pilih Desa/Kelurahan --</option>
        <%
if (sublevel==1) {
Vector vDataKelurahan = getDataKelurahan(no_prop, no_kab, no_kec);
if (vDataKelurahan==null) vDataKelurahan = new Vector();
for(int i=0;i<vDataKelurahan.size();i++)
{
%>
        <option value="<%=((kartukeluarga.DataKelurahan)vDataKelurahan.elementAt(i)).getNo_kel()%>">
        <%=((kartukeluarga.DataKelurahan)vDataKelurahan.elementAt(i)).getNama_kel()%></option>
        <%
}
}
%>
      </select>
      <%} else if (sublevel==0){
	  %>

	  <input
                                class=boxdefault size=22 name=nama_kel maxlength="60" value="<%=nama_kel%>" onFocus="this.blur()">
      <%
	    }
	  }%>
    </td>
                          </tr>
						  <% } %>
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

<%if (level>3) {
   if (sublevel>0) {

%>
                                                <script language="javascript">
                                                   document.all['nama_kel'].options[<%=selidx%>].selected=true;
                                                </script>
<%}
}
%>