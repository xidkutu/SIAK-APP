<%@ page language="java" import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
UserInfo1 record = null;
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
GetDarah recordGetDarah;
String nprop,nkab,nkec,nkel,naprop,nakab,nakec;
Vector result;
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


     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
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
         if (confirm("Apakah benar Jumlah Penduduk Menurut Golongan Darah ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=3";
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
      <table width="100%" border="0" cellspacing="5" cellpadding="5" align="center">
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
                                Penduduk Menurut Golongan Darah</span></div>
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
                                      <b><td><%=record.getToday()%></td>
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
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="550">
                    <tr>
                      <td width="0%"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="0%"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>

<%

factory=ServiceController.getInstance();
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
remoteList_Wilayah = home.create();
result=remoteList_Wilayah.getTotDarah(nprop,nkab,nkec,"","");

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
                            <td class="C-Fonts" rowspan="2" width="18">
                              <div align="center"> No</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="116">
                              <div align="center"><%=str%></div>
                            </td>
                            <td class="C-Fonts"  colspan="13">
                              <div align="center">Golongan Darah (jiwa)</div>
                              <div align="center"></div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="73">
                              <div align="center">Jumlah Penduduk</div>
                              <div align="center">(jiwa)</div>
                            </td>
                          <tr>
                            <td class="C-Fonts" width="63">
                              <div align="center">A</div>
                            </td>
                            <td class="C-Fonts" width="60">
                              <div align="center">
                <span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">B</span></div>
                            </td>
                            <td class="C-Fonts" width="68">
                              <div align="center">AB</div>
                            </td>
                            <td class="C-Fonts" width="68">
                              <div align="center">O</div>
                            </td>
                            <td class="C-Fonts" width="63">
                              <div align="center">A+</div>
                            </td>
                            <td class="C-Fonts" width="60">
                              <div align="center">A-</div>
                            </td>
                            <td class="C-Fonts" width="72">
                              <div align="center">
                  <span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">B+</span></div>
                            </td>
                            <td class="C-Fonts" width="68">
                              <div align="center">B-</div>
                            </td>
                            <td class="C-Fonts" width="63">
                              <div align="center">AB+</div>
                            </td>
                            <td class="C-Fonts" width="60">
                              <div align="center">
                   <span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">AB-</span></div>
                            </td>
                            <td class="C-Fonts" width="72">
                              <div align="center">
                  <span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">O+</span></div>
                            </td>
                            <td class="C-Fonts" width="68">
                              <div align="center">O-</div>
                            </td>
                            <td class="C-Fonts" width="68">
                              <div align="center">Tdk<br>
                                Tahu </div>
                            </td>
                  </tr>
<%
long cntr=1;
long totjiwa=0;
long jum_totjiwa=0;
long totA=0;
long totB=0;
long totAB=0;
long totO=0;
long totAPlus=0;
long totAMinus=0;
long totBPlus=0;
long totBMins=0;
long totABPlus=0;
long totABMinus=0;
long totOPlus=0;
long totOMinus=0;
long totTdkthu=0;

for(int i=0; i<result.size(); i++)
{
 recordGetDarah=(GetDarah) (result.elementAt(i));
totA=totA+Long.parseLong(recordGetDarah.getA());
totB=totB+Long.parseLong(recordGetDarah.getB());
totAB=totAB+Long.parseLong(recordGetDarah.getAb());
totO=totO+ Long.parseLong(recordGetDarah.getO());
totAPlus=totAPlus+ Long.parseLong(recordGetDarah.getAPlus());
totAMinus=totAMinus+Long.parseLong(recordGetDarah.getAMinus());
totBPlus=totBPlus+Long.parseLong(recordGetDarah.getBPlus());
totBMins=totBMins+Long.parseLong(recordGetDarah.getBMinus());
totABPlus=totABPlus+Long.parseLong(recordGetDarah.getABPlus());
totABMinus=totABMinus+Long.parseLong(recordGetDarah.getABMinus());
totOPlus=totOPlus+Long.parseLong(recordGetDarah.getOPlus());
totOMinus=totOMinus+Long.parseLong(recordGetDarah.getOMinus());
totTdkthu=totTdkthu+Long.parseLong(recordGetDarah.getTidakTahuDong());

totjiwa=(Long.parseLong(recordGetDarah.getA())+Long.parseLong(recordGetDarah.getB())+
Long.parseLong(recordGetDarah.getAb())+
Long.parseLong(recordGetDarah.getO())+Long.parseLong(recordGetDarah.getAPlus())+
Long.parseLong(recordGetDarah.getAMinus())+
Long.parseLong(recordGetDarah.getBPlus())+
Long.parseLong(recordGetDarah.getBMinus())+
Long.parseLong(recordGetDarah.getABPlus())+
Long.parseLong(recordGetDarah.getABMinus())+
Long.parseLong(recordGetDarah.getOPlus())+
Long.parseLong(recordGetDarah.getOMinus())+
Long.parseLong(recordGetDarah.getTidakTahuDong()));
jum_totjiwa=jum_totjiwa+totjiwa;
%>
 <tr>
<td class="C-Field" width="18"> <%=cntr%></td>
<td class="C-Field" width="175">
<div align="left">
<%=recordGetDarah.getNamaKel().toUpperCase()%></div>
</td>
<td class="C-Field" width="63">
<div align="center">
<%=recordGetDarah.getA()%>
</div>
</td>
<td class="C-Field" width="60">
<div align="center"><%=recordGetDarah.getB()%></div>
</td>
                            <td class="C-Field" width="72">
                              <div align="center"><%=recordGetDarah.getAb()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getO()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getAPlus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getAMinus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getBPlus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getBMinus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getABPlus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getABMinus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getOPlus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getOMinus()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=recordGetDarah.getTidakTahuDong()%></div>
                            </td>

                            <td class="C-Field" width="73">
                              <div align="center"><%=totjiwa%></div>
                            </td>
                          </tr>
<%
cntr++;
}
%>
                          <tr>
                            <td class="C-Field" colspan="2" height="15">
                              <div align="center"><%=strb%></div>
                            </td>
                            <td class="C-Field" width="63" height="15">
                              <div align="center"><%=totA%></div>
                            </td>
                            <td class="C-Field" width="60" height="15">
                              <div align="center"><%=totB%></div>
                            </td>
                            <td class="C-Field" width="72" height="15">
                              <div align="center"><%=totAB%></div>
                            </td>
                            <td class="C-Field" width="68" height="15">
                              <div align="center"><%=totO%></div>
                            </td>
                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totAPlus%></div>
                            </td>
                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totAMinus%></div>
                            </td>

                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totBPlus%></div>
                            </td>

                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totBMins%></div>
                            </td>

                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totABPlus%></div>
                            </td>

                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totABMinus%></div>
                            </td>

                            <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totOPlus%></div>
                            </td>

                           <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totOMinus%></div>
                            </td>
                           <td class="C-Field" width="73" height="15">
                              <div align="center"><%=totTdkthu%></div>
                            </td>
                                <td class="C-Field" width="73" height="15">
                              <div align="center"><%=jum_totjiwa%></div>
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
System.out.print("Error in Jml_Gol_Darah_Tamp.jsp =" + jps.toString());
jps.printStackTrace();
}
finally
{
remoteList_Wilayah.remove();

}
%>
