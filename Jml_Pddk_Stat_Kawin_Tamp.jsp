<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
ServiceController factory=null;
List_WilayahHome home=null;
List_Wilayah remote=null;
GetKawinan record=null;
UserInfo1 record1=null;
String nprop,nkab,nkec,nkel,naprop,nakab,nakec;
Vector result=null;
String str,strb;
%>

<%
try
  {

   nprop=request.getParameter("nprop");
   nkab=request.getParameter("nkab");
   nkec=request.getParameter("nkec");

naprop=request.getParameter("naprop");
nakab=request.getParameter("nakab");
nakec=request.getParameter("nakec");

if(nkab.trim().equals(""))
{
str="Kota/Kabupaten";
strb="Jumlah per Provinsi";
}
else if(nkec.trim().equals(""))
{
str="Kecamatan";
strb="Jumlah per Kabupaten";
}
else
{
str="Desa/Kelurahan";
strb="Jumlah per Kecamatan";
}

     record1=(UserInfo1)session.getAttribute("remoteRef");

if(record1 != null)
  {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printKTP(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Jumlah Penduduk Menurut Pendidikan Akhir ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=2";
              window.close();
          }
    }
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<table align="center">
  <tr align="center"><td align="center" >
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printKTP(this)">
                                    </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
                                    </b></div>
                                </td>
</tr>
</table>
<p>&nbsp;</p><table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100">
  <tr>
    <td>
      <table width="850" border="0" cellspacing="5" cellpadding="5" align="center">
        <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                  <table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                      <td>
                        <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Jumlah
                                Penduduk Menurut Status Perkawinan<br>
                                dan Kepemilikan Akta Perkawinan</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="10"><img src="images/dot.gif" width="1" height="10"></td>
                          </tr>
                          <tr>
                            <td height="10" colspan="4">
                              <table width="75%" border="0" cellspacing="3" cellpadding="2" align="center">
                                <tr>
                                  <td width="40%">PROVINSI</td>
                                  <td width="2%">:</td>
<b><td><%=naprop.toString().toUpperCase()%></td></b>
                                </tr>
                                <tr>
                                  <td>KABUPTEN/KOTA</td>
                                  <td>:</td>
<b><td><%=nakab.toString().toUpperCase()%></td></b>
                                </tr>
                                <tr>
                                  <td>KECAMATAN</td>
                                  <td>:</td>
<b><td><%=nakec.toString().toUpperCase()%></td></b>
                                </tr>
                                <tr>

                                   <td width="40%">
                                   Tanggal
                                  </td>
                                  <td width="2%">:</td>
                                      <b><td><%=record1.getToday()%></td>
                                     </b>
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
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="900">
                    <tr>
                      <td width="0%"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="0%"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>

<%
factory=ServiceController.getInstance();
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
remote = home.create();
result=remote.getStatPerkawin(nprop,nkab,nkec,"","");

if(result.isEmpty())
{
%>
<div align="center"><b>
<h4><font color=red>Data Belum Ada !</font></h4>
</b></div>
<%
}
else
  {
%>
                    <tr>
                      <td width="0%">&nbsp;</td>
                      <td valign="middle" align="center" width="100%">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                          <tr>
                            <td class="C-Fonts" rowspan="3" width="17">
                              <div align="center"> No</div>
                            </td>
                            <td class="C-Fonts" rowspan="3" width="106">
                              <div align="center"><%=str%></div>
                            </td>
                            <td class="C-Fonts" rowspan="3" width="68">
                              <div align="center">Jumlah Penduduk (jiwa)</div>
                            </td>
                            <td class="C-Fonts" colspan="12">
                              <div align="center">Status Perkawinan (jiwa)</div>
                              <div align="center"></div>
                            </td>
                            <td class="C-Fonts" colspan="4">
                              <div align="center">Jumlah Kepemilikan Akta </div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" colspan="3">
                              <div align="center">Belum Kawin</div>
                            </td>
                            <td class="C-Fonts" colspan="3">
                              <div align="center">Kawin</div>
                            </td>
                            <td class="C-Fonts" colspan="3">
                              <div align="center">Cerai Hidup</div>
                            </td>
                            <td class="C-Fonts" colspan="3">
                              <div align="center">Cerai Mati</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Perkawinan</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Cerai</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" width="27" height="35">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="27" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="39" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="36" height="35">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="36" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="46" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="32" height="35">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="32" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="38" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="31" height="35">
                              <div align="center">Lk</div>
                            </td>
                            <td class="C-Fonts" width="35" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Prp</span></div>
                            </td>
                            <td class="C-Fonts" width="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Total</span></div>
                            </td>
                            <td class="C-Fonts" width="41" height="35">
                              <div align="center">Tidak Ada</div>
                            </td>
                            <td class="C-Fonts" width="33" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Ada</span></div>
                            </td>
                            <td class="C-Fonts" width="40" height="35">
                              <div align="center">Tidak Ada</div>
                            </td>
                            <td class="C-Fonts" width="37" height="35">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Ada</span></div>
                            </td>
                          </tr>
<%
long  cntr=1;
long total_jum_pddk_jiwa=0;
long jum_pddk_jiwa=0;
long lakiblmkwn=0;
long perumblmkwn=0;
long lakikwn=0;
long perumkwn=0;
long lakiceraihdp=0;
long perumceraihdp=0;
long lakiceraimti=0;
long perumceraimti=0;
long aktakwnada=0;
long akdakwntada=0;
long aktacriada=0;
long aktacritada=0;

long lakiperumblmkwn=0;
long  lakiperumkwn=0;
long lakiperumceraihdp=0;
long lakiperumceraimti=0;


for(int i=0; i<result.size(); i++)
     {

record=(GetKawinan) (result.elementAt(i));

lakiblmkwn=lakiblmkwn+Long.parseLong(record.getLakiBlmKwn());
perumblmkwn=perumblmkwn+Long.parseLong(record.getPerumBlmKwn());
lakikwn=lakikwn+Long.parseLong(record.getLakiKwn());
perumkwn=perumkwn+Long.parseLong(record.getPerumKwn());
lakiceraihdp=lakiceraihdp+Long.parseLong(record.getLakiCeraiHidup());
perumceraihdp=perumceraihdp+Long.parseLong(record.getPerumCeraiHidup());
lakiceraimti=lakiceraimti+Long.parseLong(record.getLakiCeraiMati());
perumceraimti=perumceraimti+Long.parseLong(record.getPerumCeraiMati());
//akta
aktakwnada=aktakwnada+Long.parseLong(record.getAktaKwnAda());
akdakwntada=akdakwntada+Long.parseLong(record.getAktaKwnTada());
aktacriada=aktacriada+Long.parseLong(record.getAktaCeraiAda());
aktacritada =aktacritada+Long.parseLong(record.getAktaCeraiTada());

lakiperumblmkwn=(Long.parseLong(record.getLakiBlmKwn())+Long.parseLong(record.getPerumBlmKwn()));
lakiperumkwn=(Long.parseLong(record.getLakiKwn())+Long.parseLong(record.getPerumKwn()));
lakiperumceraihdp=(Long.parseLong(record.getLakiCeraiHidup())+Long.parseLong(record.getPerumCeraiHidup()));
lakiperumceraimti=(Long.parseLong(record.getLakiCeraiMati())+Long.parseLong(record.getPerumCeraiMati()));

jum_pddk_jiwa=lakiperumblmkwn+lakiperumkwn+lakiperumceraihdp+lakiperumceraimti;
total_jum_pddk_jiwa=total_jum_pddk_jiwa+jum_pddk_jiwa;
%>

<tr>
<td class="C-Field" width="17"> <%=cntr%></td>
<td class="C-Field" width="130"><%=record.getNamaWil().toUpperCase() %></td>
<td class="C-Field" width="68">
<div align="center">
<%=jum_pddk_jiwa%>
</div>
                            </td>
                            <td class="C-Field" width="27">
<div align="center"><%=record.getLakiBlmKwn()%></div>
                            </td>
                            <td class="C-Field" width="27">
<div align="center"><%=record.getPerumBlmKwn()%></div>
                            </td>
                            <td class="C-Field" width="39">
<div align="center">
<%=lakiperumblmkwn%></div>
                            </td>
                            <td class="C-Field" width="36">
<div align="center"><%=record.getLakiKwn()%></div>
                            </td>
                            <td class="C-Field" width="36">
<div align="center"><%=record.getPerumKwn()%></div>
                            </td>
                            <td class="C-Field" width="46">
<div align="center">
<%=lakiperumkwn%>
</div>
                            </td>
                            <td class="C-Field" width="32">
<div align="center"><%=record.getLakiCeraiHidup()%></div>
                            </td>
                            <td class="C-Field" width="32">
<div align="center"><%=record.getPerumCeraiHidup()%></div>
                            </td>
                            <td class="C-Field" width="38">
<div align="center">
<%=lakiperumceraihdp%>
</div>
                            </td>
                            <td class="C-Field" width="31">
<div align="center"><%=record.getLakiCeraiMati()%></div>
                            </td>
                            <td class="C-Field" width="35">
<div align="center"><%=record.getPerumCeraiMati()%></div>
                            </td>
                            <td class="C-Field" width="35">
<div align="center">
<%=lakiperumceraimti%>

</div>
                            </td>
                            <td class="C-Field" width="41">
<div align="center"><%=record.getAktaKwnTada()%></div>
                            </td>
                            <td class="C-Field" width="33">
<div align="center"><%=record.getAktaKwnAda()%></div>
                            </td>
                            <td class="C-Field" width="40">
<div align="center"><%=record.getAktaCeraiTada() %></div>
                            </td>
                            <td class="C-Field" width="37">
<div align="center"><%=record.getAktaCeraiAda()%></div>
                            </td>
                          </tr>
<%
cntr++;
}
%>
                          <tr>
                            <td class="C-Field" colspan="2"><b><%=strb%></b></td>
                            <td class="C-Field" width="68">
                              <div align="center"><b><%=total_jum_pddk_jiwa%></b></div>
                            </td>
                            <td class="C-Field" width="27">
                              <div align="center"><b><%=lakiblmkwn%></b></div>
                            </td>
                            <td class="C-Field" width="27">
                              <div align="center"><b><%=perumblmkwn%></b></div>
                            </td>
                            <td class="C-Field" width="39">
                              <div align="center"><b><%=lakiperumblmkwn%></b></div>
                            </td>
                            <td class="C-Field" width="36">
                              <div align="center"><b><%=lakikwn%></b></div>
                            </td>
                            <td class="C-Field" width="36">
                              <div align="center"><b><%=perumkwn%></b></div>
                            </td>
                            <td class="C-Field" width="46">
                              <div align="center"><b><%=lakiperumkwn%></b></div>
                            </td>
                            <td class="C-Field" width="32">
                              <div align="center"><b><%=lakiceraihdp%></b></div>
                            </td>
                            <td class="C-Field" width="32">
                              <div align="center"><b><%=perumceraihdp%></b></div>
                            </td>
                            <td class="C-Field" width="38">
                              <div align="center"><b><%=lakiperumceraihdp%></b></div>
                            </td>
                            <td class="C-Field" width="31">
                              <div align="center"><b><%=lakiceraimti%></b></div>
                            </td>
                            <td class="C-Field" width="35">
                              <div align="center"><b><%=perumceraimti%></b></div>
                            </td>
                            <td class="C-Field" width="35">
                              <div align="center"><b><%=lakiperumceraimti%></b></div>
                            </td>
                            <td class="C-Field" width="41">
                              <div align="center"><b><%=akdakwntada%></b></div>
                            </td>
                            <td class="C-Field" width="33">
                              <div align="center"><b><%=aktakwnada%></b></div>
                            </td>
                            <td class="C-Field" width="40">
                              <div align="center"><b><%=aktacritada%></b></div>
                            </td>
                            <td class="C-Field" width="37">
                              <div align="center"><b><%=aktacriada%></b></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td width="0%">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="0%"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td width="100%"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td width="0%"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
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
</BODY>
</HTML>
<%}
}
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception jps)
{
System.out.print("Error in Jml_Pddk_Cacat_Tamp.jsp =" + jps.toString());
jps.printStackTrace();
}
finally
{
remote.remove();
}
%>
