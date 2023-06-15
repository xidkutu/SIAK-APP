<%@page import="com.db.connection.ServiceController,java.util.Vector,jmlpddk.agama.ListProp,jmlpddk.paspor.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" >
<form name=jmlpaspor action="" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
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
                        <table width="475" border="0" cellspacing="2" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Jumlah
                                Penduduk Menurut Kepemilikan Paspor</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="10">&nbsp;</td>
                          </tr>
<%
JmlPddkPemilikPaspor jmlPddkObj = null;
Vector vProp = new Vector();
try
{
         ServiceController statelessController = ServiceController.getInstance();
         JmlPddkPemilikPasporHome home = (JmlPddkPemilikPasporHome)statelessController.lookup("JmlPddkPemilikPasporBean", JmlPddkPemilikPasporHome.class);

         jmlPddkObj = home.create();
         vProp = jmlPddkObj.getDataPropinsi();
}
catch(Exception e)
{
   e.printStackTrace();
}
finally
{
   jmlPddkObj.remove();
}

%>
                          <tr>
                            <td colspan="4" height="10"><img src="images/dot.gif" width="1" height="10">
                              <table width="444" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td width="169">Kode-Nama Provinsi </td>
                                  <td width="5"> :</td>
                                  <td width="38">
                                    <input
                                class=boxdefault size=4 name=no_prop onFocus="this.blur()" maxlength="2">
                                  </td>
                                  <td width="217">
<select  name=nama_prop onChange="no_prop.value=this.value;np.value=this.options[this.selectedIndex].text;" class="boxdefault">
<option selected>-- Pilih Provinsi --</option>
                                <%
for(int i=0;i<vProp.size();i++)
{
%>
<option value=<%=((ListProp)vProp.elementAt(i)).getNo_prop()%>>
 <%=((ListProp)vProp.elementAt(i)).getNama_prop()%></option>
<%
}
%>
</select>
                                  </td>
                                </tr>
                          <tr>
                            <td width="169">
                              <div align="right">Dari Tanggal</div>
                            </td>
                            <td width="5">:</td>
                            <td colspan="2">
                              <table width="90" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
                                    <select name=daritanggal class="boxdefault">
                                      <option value="0" selected>Tgl </option>
                                      <option value="1">01</option>
                                      <option value="2">02</option>
                                      <option value="3">03</option>
                                      <option value="4">04</option>
                                      <option value="5">05</option>
                                      <option value="6">06</option>
                                      <option value="7">07</option>
                                      <option value="8">08</option>
                                      <option value="9">09</option>
                                      <option value="10">10</option>
                                      <option value="11">11</option>
                                      <option value="12">12</option>
                                      <option value="13">13</option>
                                      <option value="14">14</option>
                                      <option value="15">15</option>
                                      <option value="16">16</option>
                                      <option value="17">17</option>
                                      <option value="18">18</option>
                                      <option value="19">19</option>
                                      <option value="20">20</option>
                                      <option value="21">21</option>
                                      <option value="22">22</option>
                                      <option value="23">23</option>
                                      <option value="24">24</option>
                                      <option value="25">25</option>
                                      <option value="26">26</option>
                                      <option value="27">27</option>
                                      <option value="28">28</option>
                                      <option value="29">29</option>
                                      <option value="30">30</option>
                                      <option value="31">31</option>
                                    </select>
                                  </td>
                                  <td>/ </td>
                                  <td>
                                    <select
                  name=daribulan class="boxdefault">
                                      <option value="0" selected>Bln </option>
                                      <option value="1">01</option>
                                      <option value="2">02</option>
                                      <option value="3">03</option>
                                      <option value="4">04</option>
                                      <option value="5">05</option>
                                      <option value="6">06</option>
                                      <option value="7">07</option>
                                      <option value="8">08</option>
                                      <option value="9">09</option>
                                      <option value="10">10</option>
                                      <option value="11">11</option>
                                      <option value="12">12</option>
                                    </select>
                                  </td>
                                  <td>/</td>
                                  <td>
                                    <select
                  name=daritahun class="boxdefault">
                                      <option value="0" selected>Thn</option>
                                      <option value="2003">2003</option>
                                      <option value="2004">2004</option>
                                      <option value="2005">2005</option>
                                      <option value="2006">2006</option>
                                      <option value="2007">2007</option>
                                      <option value="2008">2008</option>
                                      <option value="2009">2009</option>
                                      <option value="2010">2010</option>
                                      <option value="2011">2011</option>
                                      <option value="2012">2012</option>
                                      <option value="2013">2013</option>
                                    </select>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="169">
                              <div align="right">Sampai Tanggal</div>
                            </td>
                            <td width="5">:</td>
                            <td colspan="2">
                              <table width="90" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td>
                                    <select
                  name=sampaitanggal class="boxdefault">
                                      <option value="0" selected>Tgl </option>
                                      <option value="1">01</option>
                                      <option value="2">02</option>
                                      <option value="3">03</option>
                                      <option value="4">04</option>
                                      <option value="5">05</option>
                                      <option value="6">06</option>
                                      <option value="7">07</option>
                                      <option value="8">08</option>
                                      <option value="9">09</option>
                                      <option value="10">10</option>
                                      <option value="11">11</option>
                                      <option value="12">12</option>
                                      <option value="13">13</option>
                                      <option value="14">14</option>
                                      <option value="15">15</option>
                                      <option value="16">16</option>
                                      <option value="17">17</option>
                                      <option value="18">18</option>
                                      <option value="19">19</option>
                                      <option value="20">20</option>
                                      <option value="21">21</option>
                                      <option value="22">22</option>
                                      <option value="23">23</option>
                                      <option value="24">24</option>
                                      <option value="25">25</option>
                                      <option value="26">26</option>
                                      <option value="27">27</option>
                                      <option value="28">28</option>
                                      <option value="29">29</option>
                                      <option value="30">30</option>
                                      <option value="31">31</option>
                                    </select>
                                  </td>
                                  <td>/ </td>
                                  <td>
                                    <select
                  name=sampaibulan class="boxdefault">
                                      <option value="0" selected>Bln </option>
                                      <option value="1">01</option>
                                      <option value="2">02</option>
                                      <option value="3">03</option>
                                      <option value="4">04</option>
                                      <option value="5">05</option>
                                      <option value="6">06</option>
                                      <option value="7">07</option>
                                      <option value="8">08</option>
                                      <option value="9">09</option>
                                      <option value="10">10</option>
                                      <option value="11">11</option>
                                      <option value="12">12</option>
                                    </select>
                                  </td>
                                  <td>/</td>
                                  <td>
                                    <select
                  name=sampaitahun class="boxdefault">
                                      <option value="0" selected>Thn</option>
                                      <option value="2003">2003</option>
                                      <option value="2004">2004</option>
                                      <option value="2005">2005</option>
                                      <option value="2006">2006</option>
                                      <option value="2007">2007</option>
                                      <option value="2008">2008</option>
                                      <option value="2009">2009</option>
                                      <option value="2010">2010</option>
                                      <option value="2011">2011</option>
                                      <option value="2012">2012</option>
                                      <option value="2013">2013</option>
                                    </select>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4"><input type=hidden name="np" value="">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">
                              <table width="100" border="0" cellspacing="2" cellpadding="3" align="center">
                                <tr>
                                  <td>
                                    <div align="center"><b>
                                      <input class=boxstandard type=button value=TAMPILKAN name="tampilkan" onclick="cetak();">
                                      </b></div>
                                  </td>
                                  <td>
                                    <div align="center"><b> </b></div>
                                  </td>
                                  <td>
                                    <div align="center"><b>
                                      <input class=boxstandard type=button value=KELUAR name="exit" onclick="javascript:history.back()">
                                      </b></div>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
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
</BODY>
<SCRIPT language="JavaScript">
function cetak()
{
if(jmlpaspor.no_prop.value=="")
{
alert("Nama Provinsi belum Diisi !!");
jmlpaspor.nama_prop.focus();
return false;
}
if(jmlpaspor.daritahun.options[0].selected==true || jmlpaspor.sampaitahun.options[0].selected==true)
{
alert("Tahun Belum Diisi !!");
jmlpaspor.daritahun.focus();
return false;
}
if(jmlpaspor.daribulan.options[0].selected==true || jmlpaspor.sampaibulan.options[0].selected==true)
{
alert("Bulan Belum Diisi !!");
jmlpaspor.daribulan.focus();
return false;
}
if(jmlpaspor.daritanggal.options[0].selected==true || jmlpaspor.sampaitanggal.options[0].selected==true)
{
alert("Tanggal Belum Diisi !!");
jmlpaspor.daritanggal.focus();
return false;
}

   if( parseInt(jmlpaspor.daritahun.value) > parseInt(jmlpaspor.sampaitahun.value) )
   {
       alert("Entri Sampai Tahun Invalid!");
       return false;
   }
   if( parseInt(jmlpaspor.daritahun.value) == parseInt(jmlpaspor.sampaitahun.value) &&
       parseInt(jmlpaspor.daribulan.value) >  parseInt(jmlpaspor.sampaibulan.value)
     )
   {
       alert("Entri Sampai Bulan Invalid!");
       return false;
   }
   if( parseInt(jmlpaspor.daritahun.value) == parseInt(jmlpaspor.sampaitahun.value) &&
       parseInt(jmlpaspor.daribulan.value) ==  parseInt(jmlpaspor.sampaibulan.value) &&
       parseInt(jmlpaspor.daritanggal.value) >  parseInt(jmlpaspor.sampaitanggal.value)
     )
   {
       alert("Entri Sampai Tanggal Invalid!");
       return false;
   }

   window.open("daftar_jml_pddk_pemilik_paspor.jsp?no_prop="+jmlpaspor.no_prop.value+"&nama_prop="+jmlpaspor.np.value+"&daritanggal="+jmlpaspor.daritanggal.value+"&daribulan="+jmlpaspor.daribulan.value+"&daritahun="+jmlpaspor.daritahun.value+"&sampaitanggal="+jmlpaspor.sampaitanggal.value+"&sampaibulan="+jmlpaspor.sampaibulan.value+"&sampaitahun="+jmlpaspor.sampaitahun.value,'','fullscreen=yes,scrollbars=yes,resizable=yes,menubar=no,toolbar=no');
}
</script>
</HTML>