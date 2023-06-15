<%@page import="com.db.connection.ServiceController,java.util.Vector"%>
<%@page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,jmlpddk.agama.ListProp,jmlpddk.agama.ListKab"%>
<%@page import="com.wilayah.*"%>
<%@include file="Global.jsp"%>

<%!
    int level;
    UserInfo1 record = null;
    int kabtot, kectot;
%>

<%
   try
   {

record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript" src="Templates/Wilayah.js">
</SCRIPT>
<script language="javascript">
function displayList()
{
if(demografi.daritahun.options[0].selected==true || demografi.sampaitahun.options[0].selected==true)
{
alert("Tahun Belum Diisi !!");
demografi.daritahun.focus();
return false;
}
if(demografi.no_prop.value=="")
{
alert("Nomor Propinsi Belum Diisi !!");
demografi.no_prop.focus();
return false;
}
else if(demografi.no_kab.value=="")
{
alert("Nomor Kabupaten Belum Diisi !!");
demografi.no_prop.focus();
return false;
}

   window.open("parameter_demografi_listing.jsp?no_prop="+demografi.no_prop.value+"&no_kab="+demografi.no_kab.value+"&nama_prop="+demografi.np.value+"&nama_kab="+demografi.nb.value+"&tahun="+demografi.sampaitahun.options[demografi.sampaitahun.selectedIndex].text,'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" onload="window.history.forward(1)">
<form name=demografi method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
<%
level=Integer.parseInt(record.getLevelId());
setSecureWilayah(level, record);
%>
<input type=hidden name="np" value="">
<input type=hidden name="nb" value="">
<input type=hidden name="nc" value="">
      <td background="images/v_bg_header.gif"><jsp:include page="top.html"/></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
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
                        <div align="center"><span class="subtitle">Parameter Dasar
                          Demografi </span></div>
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
<%
WilayahSettingModule view = null;
String sysdate = "";

try
{
         ServiceController statelessController = ServiceController.getInstance();
         WilayahSettingModuleHome home = (WilayahSettingModuleHome)statelessController.lookup("wilayahsetter", WilayahSettingModuleHome.class);
         view = home.create();
         sysdate = record.getToday();

   if(level==2)
   {
    // setLocalVector(level, view.getListWilayah(nprop));
   }
   else if(level==3)
   {
   //  setLocalVector(level, view.getListWilayah(naprop, nkab));
   }
   else if(level==4)
   {
   //  setLocalVector(level, view.getListWilayah(nprop, nkab, nkec));
   }
   else
   {
    System.out.println("Entered in Level 1 for Pusat");
  //   setLocalVector(level, view.getListWilayah());
   }
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
   view.remove();
}
%>
                          <tr>
                            <td>
                              <table width="450" border="0" cellspacing="3" cellpadding="0" align="center">
                          <tr>
                            <td>Kode-Nama Provinsi </td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2" value="<%=record.getNoProp()%>">
</td>
<td width="80">
<select  name=nama_prop onChange="no_prop.value=this.value;np.value=this.options[this.selectedIndex].text;pilih_kab()" class="boxdefault" <%=prop_dis%>>
<option selected>-- Pilih Provinsi --</option>

<%
 if (level==1)
    {
for(int i=0;i<vProp.size();i++)
{
%>
<option value=<%=((ListProp)vProp.elementAt(i)).getNo_prop()%>> <%=((ListProp)vProp.elementAt(i)).getNama_prop()%></option>

<%
}
    }
else
 {
 %>
   <script language="javascript">
    document.all["nama_prop"].options[0].text="<%=naprop%>"
    document.all["no_prop"].value="<%=nprop%>"
    document.all["np"].value="<%=naprop%>"
  </script>
<%
 }
%>
</select>
    </td>
                          </tr>

                          <tr>
                            <td>Kode-Nama Kabupaten/Kota </td>
                            <td width="10"> :</td>
                            <td width="4">
<input class=boxdefault size=4 name=no_kab onFocus="this.blur()" maxlength="2">
</td>
<td width="80">
<select name=nama_kab onChange="no_kab.value=this.value;nb.value=this.options[this.selectedIndex].text;" class="boxdefault" <%=kab_dis%>>
<option selected>-- Pilih Kabupaten/Kota --</option>
<%
kabtot=0;
if (level==1)
{
System.out.println("LEVEL 1 DI PILIH KABUPATEN");
for(int i=0;i<vKab.size();i++)
{
kabtot++;
%>
<%="<input type=hidden name=kid" + kabtot + " value="+((ListKab)vKab.elementAt(i)).getNo_kab() +">"%>
<%="<input type=hidden name=knama" + kabtot + " value='" +((ListKab)vKab.elementAt(i)).getNama_kab() +"'>"%>
<%="<input type=hidden name=propid" + kabtot + " value=" + ((ListKab)vKab.elementAt(i)).getNo_prop() +">"%>
<%
}
}
else if(level==2)
{
System.out.println("LEVEL 2 DI PILIH KABUPATEN");
for(int i=0;i<vKab.size();i++)
{
kabtot++;
%>
<option value="<%=((ListKab)vKab.elementAt(i)).getNo_kab()%>"> <%=((ListKab)vKab.elementAt(i)).getNama_kab()%></option>
<%
}
}
else
{
 %>
   <script language="javascript">
    document.all["nama_kab"].options[0].text="<%=nakab%>"
    document.all["no_kab"].value="<%=nkab%>"
    document.all["nb"].value="<%=nakab%>"
  </script>
<%
}
%>
</select>
                            </td>
                          </tr>
                                <tr>
                                  <td>
                                    <div align="right">Dari Tanggal</div>
                                  </td>
                                  <td width="10">:</td>
                                  <td colspan="2">
                                    <table width="94" border="0" cellspacing="3" cellpadding="0">
                                      <tr>
                                        <td> 01</td>
                                        <td>/ </td>
                                        <td> 01</td>
                                        <td>/</td>
                                        <td>
                                          <select
                  name=daritahun boxdefault2 class="boxdefault" onchange="demografi.sampaitahun.selectedIndex=this.selectedIndex">
                                            <option value="0" selected>Thn</option>
                                            <option value="1">2003</option>
                                            <option value="2">2004</option>
                                            <option value="3">2005</option>
                                            <option value="4">2006</option>
                                            <option value="5">2007</option>
                                            <option value="6">2008</option>
                                            <option value="7">2009</option>
                                            <option value="8">2010</option>
                                            <option value="9">2011</option>
                                            <option value="10">2012</option>
                                            <option value="11">2013</option>
                                          </select>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td>
                                    <div align="right">Sampai Tanggal</div>
                                  </td>
                                  <td width="10">:</td>
                                  <td colspan="2">
                                    <table width="93" border="0" cellspacing="3" cellpadding="0">
                                      <tr>
                                        <td> 31</td>
                                        <td>/ </td>
                                        <td> 12</td>
                                        <td>/</td>
                                        <td>
                                          <select
                  name=sampaitahun boxdefault2 class="boxdefault" onchange="demografi.daritahun.selectedIndex=this.selectedIndex">
                                            <option value="0" selected>Thn</option>
                                            <option value="1">2003</option>
                                            <option value="2">2004</option>
                                            <option value="3">2005</option>
                                            <option value="4">2006</option>
                                            <option value="5">2007</option>
                                            <option value="6">2008</option>
                                            <option value="7">2009</option>
                                            <option value="8">2010</option>
                                            <option value="9">2011</option>
                                            <option value="10">2012</option>
                                            <option value="11">2013</option>
                                          </select>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
<input type=hidden name="kabtot" value="<%=kabtot%>">
<input type=hidden name="kectot" value="<%=kectot%>">
                          <tr>
                            <td height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr valign="bottom">
                            <td height="45" valign="top">
                              <div align="center"></div>
                              <div align="center"><b> </b>
                                <table width="100" border="0" cellspacing="2" cellpadding="3">
                                  <tr>
                                    <td>
                                      <div align="center"><b>
                                        <input class=boxstandard type=button value=TAMPILKAN name="tampilkan" onclick="return displayList()">
                                        </b></div>
                                    </td>
                                    <td>
                                      <div align="center"><b>
                                        <input class=boxstandard type=button value=KELUAR name="keluar" onclick="document.location='statistik_menu.jsp'">
                                        </b></div>
                                    </td>
                                  </tr>
                                </table>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <p>&nbsp;</p>
                </td>
              </tr>
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
</form>
</BODY></HTML>
<%}
else
{
//Mark1
response.sendRedirect("index.jsp");
}
   }catch(Exception err)
{

}
%>
