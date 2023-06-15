<%@page import="java.util.*,java.text.*, pendaftaran.*"%>
<%@include file="Global.jsp"%>
<%!
    int level;
    UserInfo1 record = null;
    String screen_code, title, pick_year = "false";
%>
<%

   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
    screen_code=request.getParameter("screen_code");
    title=(String)request.getAttribute("title");
    pick_year = (String)request.getParameter("pick_year");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>

<script language="javascript">
function getText(object)
{
 if (object.selectedIndex!=0) return object.options[object.selectedIndex].text;
return "-";
}
</script>
<input type=hidden name=cur_naprop value="<%=record.getNamaProp()%>">
<input type=hidden name=cur_nakab value="<%=record.getNamaKab()%>">
<input type=hidden name=cur_nakec value="<%=record.getNamaKec()%>">
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form name=pilwil action="" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<%
level=Integer.parseInt(record.getLevelId());
setSecureWilayah(level, record);
%>
<td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
</tr>
  <tr>
    <td height="380">
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top" height="337">
            <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span class="subtitle"><%=title%></span></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>

                    <tr>
                      <td>
                        <table width="400" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td>Kode-Nama Provinsi </td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=nprop onFocus="this.blur()" maxlength="2" value="<%=record.getNoProp()%>">
</td>
<td width="80">
<% //disable propinsi?
if (prop_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=naprop onFocus="this.blur()" maxlength="30" value="<%=record.getNamaProp()%>">
<%
}else {
%>
<select  name=naprop onChange="wilreset2(pilwil.nprop,pilwil.nkab,pilwil.nakab,pilwil.nkec,pilwil.nakec);pilwil.nprop.value=this.value;document.all['cur_naprop'].value=this.options[this.selectedIndex].text;ch_kab(pilwil.nprop.value,pilwil.nakab, 'false');" class="boxdefault">
<option value="" selected>-- Pilih Provinsi --</option>
</select>
<%}%>
<%
 if (level==1)
    {
%>
<script language="javascript">
   getProps();
</script>
<%
    }
else
 {
 %>
   <script language="javascript">
    pilwil.naprop.value="<%=naprop%>"
    pilwil.nprop.value="<%=nprop%>"
  </script>
<%
 }
%>
    </td>
                          </tr>

                          <tr>
                            <td>Kode-Nama Kabupaten/Kota </td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=nkab onFocus="this.blur()" maxlength="2">
</td>
<td width="80">
<% //disable kabupaten
if (kab_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=nakab onFocus="this.blur()" maxlength="30" value="<%=record.getNamaKab()%>">
<%
}else {
%>
<select name=nakab onChange="pilwil.nkab.value=this.value;document.all['cur_nakab'].value=this.options[this.selectedIndex].text;pilwil.nkec.value='';pilwil.nakec.length=1;ch_kec(pilwil.nprop.value,pilwil.nkab.value,pilwil.nakec, 'false');" class="boxdefault">
<option selected value="">-- Pilih Kabupaten/Kota --</option>
</select>
<%}%>
<%if(level==2)
{
%>
<script language="javascript">
ch_kab(pilwil.nprop.value,pilwil.nakab, 'false', 'true');
</script>
<%
}
else if (level!=1)
{
 %>
   <script language="javascript">
    pilwil.nakab.value="<%=nakab%>"
    pilwil.nkab.value="<%=nkab%>"
  </script>
<%
}
%>
                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kecamatan </td>
                            <td width="10"> :</td>
                            <td width="4">
<input  class=boxdefault size=4 name=nkec onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
<% //disable kecamatan?
if (kec_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=nakec onFocus="this.blur()" maxlength="30" value="<%=record.getNamaKec()%>">
<%
}else {
%>
<select name=nakec onChange="nkec.value=this.value;document.all['cur_nakec'].value=this.options[this.selectedIndex].text;" class="boxdefault">
<option selected value="">-- Pilih Kecamatan --</option>
</select>
<%}%>
<% if(level==3)
{
%>
<script language="javascript">
ch_kec(pilwil.nprop.value, pilwil.nkab.value, pilwil.nakec, 'false', 'true');
</script>
<%
}
else if(!((level==1) || (level==2)))
{
 %>
   <script language="javascript">
    pilwil.nakec.value="<%=nakec%>"
    pilwil.nkec.value="<%=nkec%>"
  </script>
<%
}
%>
                            </td>
                          </tr>
                          <tr>
<% if (pick_year!=null) {
%>
<td>
                                    <div align="right">Tahun</div>
                                  </td>
                                  <td width="10">:</td>
                                  <td colspan="2">

                                    <table width="94" border="0" cellspacing="3" cellpadding="0">
                                      <tr>
                                       <td>
   <select name=tahun boxdefault2 class="boxdefault">
 <%
   String selected="";
   int thisYear=Integer.parseInt(record.getToday().substring(6));
   for(int i=2003;i<=thisYear;i++)
                                             {
                                                 selected="";
                                    if (i==thisYear) selected="selected";
                                           %>
                                     <option value=<%=i%> <%=selected%>><%=i%></option>
                                           <%
                                           }
                                           %>
                                          </select>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
<%
} else {%>

                            <td>Tanggal </td>
                            <td width="10">:</td>
                            <td colspan="2">
                            <%=record.getToday()%>
                            </td>
<%}%>
                          </tr>
                        </table></td>
                    </tr>

                    <tr>
                      <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                    </tr>
                    <tr valign="bottom">
                      <td height="45" valign="top">
                        <div align="center"></div>
                        <div align="center"><b> </b>
                          <table width="100" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                              <td>
                                <div align="center"><b>
<input class=boxstandard onClick="return cetak()" type=button value=TAMPILKAN name="button33">
                                  </b></div>
                              </td>
                              <td>
                                <div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="javascript:history.back()"name="submit222">
                                  </b></div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="10">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">&nbsp; </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
<td height="2">&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</form>
<SCRIPT language="JavaScript">
function cetak()
{
<% if (request.getParameter("security_option")==null || !request.getParameter("security_option").equalsIgnoreCase("yes")) {%>
      if(pilwil.nprop.value=="") {
         alert("Nama Provinsi belum Diisi !!");
         pilwil.naprop.focus();
         return false;
      }
<% } %>
var tahun="";
use_tahun = "<%=pick_year%>"
if (use_tahun=="true") {
  tahun="&tahun="+pilwil.tahun.options[pilwil.tahun.selectedIndex].text;
}
<%
if (!kab_dis.equals("disabled")) {
%>
  if(pilwil.nakab.options[pilwil.nakab.selectedIndex]==0)
  {
    document.all['cur_nakab'].value ="";
  }
<%
}

if (!kec_dis.equals("disabled")) {
%>
  if(pilwil.nakec.options[pilwil.nakec.selectedIndex]==0)
  {
    document.all['cur_nakec'].value ="";
  }
<%
}
%>
window.open("pilihwilayah?screen_code="+<%=screen_code%>+"&level=3&nprop="+pilwil.nprop.value+"&nkab="+pilwil.nkab.value+"&nkec="+pilwil.nkec.value+"&naprop="+document.all['cur_naprop'].value+"&nakab="+document.all['cur_nakab'].value+"&nakec="+document.all['cur_nakec'].value+tahun,'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</script>
</BODY>
</HTML>
<%}
else
{
response.sendRedirect("index.jsp");
}
   }
   catch(Exception e)
   {
e.printStackTrace();
   }
%>
