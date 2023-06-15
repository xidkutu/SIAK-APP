<%@ page import="java.sql.*,java.util.*,javax.rmi.*,javax.naming.*,javax.ejb.*,setupwilayah.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
String nama_prop,nama_kab;
int no_prop,no_kab,i;
String nprop,nkab;
String flag;
%>
<%
try
 {

   no_prop = Integer.parseInt(request.getParameter("no_prop"));
   no_kab = Integer.parseInt(request.getParameter("no_kab"));

   nprop=request.getParameter("nprop");
   nkab=request.getParameter("nkab");

   flag=request.getParameter("flag");

if (session.getAttribute("remoteRef")!=null)
{


%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=javascript src="Templates/validation.js">
</Script>
<SCRIPT language=javascript src="Templates/nokec.js">
</Script>
<SCRIPT language=javascript src="Templates/namakec.js">
</Script>
<SCRIPT language="JavaScript" src="scripts/newwilayah2.js">
</script>
<SCRIPT language=JavaScript >
function op()
{
if(setupkec.no_prop.value=="")
{
setupkec.no_prop.value=0;
}
setupkec.nama_prop.value="  ";
if(setupkec.no_kab.value=="")
{
setupkec.no_kab.value=0;
}
setupkec.nama_kab.value="  ";
setupkec.no_kec.value=0;
setupkec.nama_kec.value="  ";
}
function ex()
{
var v=window.history.length;
history.go(-v);
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000">
<FORM action="SetupKec.jsp" method=post name="setupkec">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
<FORM action="SetupKec.jsp" method=post name="setupkec">
        <tr>
          <td valign="top">
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
                        <div align="center"><span class="subtitle">Setup Wilayah
                          Kecamatan</span></div>
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
                        <table width="450" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td>Kode-Nama Provinsi</td>
                            <td width="10"> :</td>
                            <td width="4">

                              <input
class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
                              <select
onChange="no_prop.value=this.value;nprop.value=this.selectedIndex;pilih_kab_with_textbox(setupkec.no_prop.value, setupkec.no_kab, setupkec.nama_kab, null, null, null, null);"
name=nama_prop boxdefault2 class="boxdefault">
<option>-- Pilih Provinsi --</option>
</select>

                            </td>
                          </tr>
                          <tr>
                            <td>Kode-Nama Kabupaten/Kota</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_kab onFocus="this.blur()" maxlength="2">
                            </td>
                            <td width="80">
                              <select
                  onchange="no_kab.value=this.value;nkab.value=this.selectedIndex;setupkec.T.disabled=false"
                  name=nama_kab boxdefault2 class="boxdefault">
                                <option>-- Pilih Kabupaten/Kota --</option>

                              </select>

<input type="hidden" name="nprop" value="<%=nprop%>">
<input type="hidden" name="nkab" value="<%=nkab%>">
                            </td>
                          </tr>
                          <tr>
                        <td>Kode-Nama Kecamatan</td>
                            <td width="10"> :</td>
                            <td width="4">
                              <input
                                class=boxdefault size=4 name=no_kec maxlength="2" onKeyUp="noke()">
                            </td>
                            <td width="80">
                              <input
                                class=boxdefault size=22 name=nama_kec maxlength="60" onKeyUp="namake()">
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
                              <td><b>
                                <input class=boxstandard type="submit" value=SIMPAN name="SIM" onClick="return validate(no_kec,nama_kec) ">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="submit" value=TAMPILKAN name="T" onclick="op()">
                                </b></td>
                              <td><b>
                                <input class=boxstandard type="button" value=KELUAR name="kel" onclick="ex()">
                                </b></td>
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
<%
if(flag.equals("0"))
{
%>
<Script>alert("Data Sudah Ada !")</Script>
<%
}
%>

<script language="javascript">
pilih_prop_with_textbox(setupkec.no_prop, setupkec.nama_prop, setupkec.no_kab, setupkec.nama_kab, null, null, null, null);
document.all["nama_prop"].selectedIndex=<%=nprop%>
document.all["no_prop"].value="<%=no_prop%>"
pilih_kab(<%=i%>);
setupkec.nama_kab.selectedIndex=setupkec.nkab.value;
document.all["no_kab"].value="<%=no_kab%>"
</script>
</form>
            </table>
           </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</BODY>
<script>
setupkec.no_kec.focus();
</script>
</HTML>
<%
}
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception e)
{
System.out.print("Error in jsp=" + e.toString());
e.printStackTrace();
}
%>
