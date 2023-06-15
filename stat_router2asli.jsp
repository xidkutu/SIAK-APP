<%@page import="java.util.*,java.text.*, pendaftaran.*"%>
<%@include file="Global.jsp"%>
<%!
int level;
UserInfo1 record = null;
String screen_code, title;
String xsl_source="";
%>

<%
try
{
     record=(UserInfo1)session.getAttribute("remoteRef");
if(record != null)
{
       title=(String)request.getAttribute("title");
       screen_code=request.getParameter("screen_code");
       xsl_source=((request.getParameter("xsl_source")!=null)?"&xsl_source="+request.getParameter("xsl_source"):"");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</SCRIPT>
<script>
var oPopup = window.createPopup();
function richToolTip()
{
    var lefter = event.offsetY+0;
    var topper = event.offsetX+15;
    oPopup.document.body.innerHTML = oToolTip.innerHTML;
    oPopup.show(topper, lefter, 170, 120, ttip);
}
</script>
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
<input type=hidden name=cur_nakel value="">
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
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
		   <%
              if (request.getParameter("prefix")!=null)
                  {
		   %>
                <div ID="oToolTip" STYLE="display:none;">
                  <div style="position: absolute; top:0; left:0; width:100%; height:100%; border:1px solid black; font:normal 10pt arial;  filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=gold, EndColorStr=#FFFFFF); padding:10px">
                       Click disini untuk install Adobe Reader sebelum tampilkan
                    </div>
                </div>
                   <p align=right>
                  <a id="ttip" href="AdbeRdr60_enu_full.exe" onmouseover="richToolTip()">download Adobe Acrobat Reader
                 </a>
                  </p>
                <%}%>
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
<select  name=naprop onChange="wilreset(pilwil.nprop,pilwil.nkab,pilwil.nakab,pilwil.nkec,pilwil.nakec,pilwil.nkel,pilwil.nakel);pilwil.nprop.value=this.value;document.all['cur_naprop'].value=this.options[this.selectedIndex].text;ch_kab(pilwil.nprop.value,pilwil.nakab, 'true');" class="boxdefault">
<option value="" selected>-- Pilih Provinsi --</option>
</select>
<%}%>
<%
 if (level==1)
    {
%>
<script language="JavaScript">
   getProps()
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
<select name=nakab onChange="pilwil.nkab.value=this.value;document.all['cur_nakab'].value=this.options[this.selectedIndex].text;pilwil.nkec.value='';pilwil.nakec.length=1;pilwil.nkel.value='';pilwil.nakel.length=1;ch_kec(pilwil.nprop.value,pilwil.nkab.value,pilwil.nakec, 'true');" class="boxdefault">
<option selected value="">-- Pilih Kabupaten/Kota --</option>
</select>
<%}%>
<%if(level==2)
{
%>
<script language="JavaScript">
ch_kab(pilwil.nprop.value,pilwil.nakab, 'false');
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
<select name=nakec onChange="pilwil.nkec.value=this.value;document.all['cur_nakec'].value=this.options[this.selectedIndex].text;pilwil.nkel.value='';pilwil.nakel.length=1;ch_kel(pilwil.nprop.value,pilwil.nkab.value,pilwil.nkec.value,pilwil.nakel);" class="boxdefault">
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
                                  <td width="172" nowrap>Kode-Nama Desa/Kelurahan</td>
                                  <td width="14" nowrap> :</td>
                            <td width="4">
<input   class=boxdefault size=4 name=nkel onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
<% //disable kelurahan?
if (kel_dis.equals("disabled")) {
%>
<input class=boxdefault size=20 name=nakel onFocus="this.blur()" maxlength="30">
<%
}else {
%>
<select name=nakel onChange="pilwil.nkel.value=this.value;document.all['cur_nakel'].value=this.options[this.selectedIndex].text;" class="boxdefault">
<option selected value="">-- Pilih Desa/Kelurahan --</option>
</select>
<%}%>
<% if (!((level==1) || (level==2) || (level==3)))
{
%>
<script language="JavaScript">
ch_kel(pilwil.nprop.value,pilwil.nkab.value,pilwil.nkec.value,pilwil.nakel, "true");
</script>
<%
}
%>
                            </td>
                                </tr>
                          <tr>
                            <td>Tanggal </td>
                            <td width="10">:</td>
                            <td colspan="2">
                            <%=record.getToday()%>
                            </td>
                          </tr>
                        </table>
                      </td>
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
<input class=boxstandard type=button value=KELUAR onClick="document.location='<%=record.getModRefFile()%>'" name="submit222">
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

<SCRIPT language="JavaScript">
function cetak()
{
if(pilwil.naprop.value=="")
{
alert("Nama Provinsi belum Diisi !!");
pilwil.naprop.focus();
return false;
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
if(pilwil.nakel.options[pilwil.nakel.selectedIndex]==0)
{
  document.all['cur_nakel'].value ="";
}

<%
if (request.getParameter("prefix")!=null)
{
%>
var another=window.open("<%=request.getParameter("prefix").trim()%>"+pilwil.nprop.value+pilwil.nkab.value+pilwil.nkec.value+pilwil.nkel.value+".pdf",'','fullscreen=no,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');

<%
}
else
{
%>
window.open("pilihwilayah?screen_code="+<%=screen_code%>+"&level=4&nprop="+pilwil.nprop.value+"&nkab="+pilwil.nkab.value+"&nkec="+pilwil.nkec.value+"&nkel="+pilwil.nkel.value+"&naprop="+document.all['cur_naprop'].value+"&nakab="+document.all['cur_nakab'].value+"&nakec="+document.all['cur_nakec'].value+"&"+"&nakel="+document.all['cur_nakel'].value+"<%=xsl_source%>",'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
<%
}
%>
}
</script>

</form>
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
