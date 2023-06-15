<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
    UserInfo1 record = null;
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
GetAkhir recordGetAkhir;
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
//System.out.println(1);
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

if (record != null)
        {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
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
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=0";
              window.close();
          }
    }
}
</script>

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
<p>&nbsp;</p><table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center">
  <tr>
    <td>
      <table width="100" border="0" cellspacing="5" cellpadding="5" align="center">
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
                                Penduduk Menurut Pendidikan Akhir(P4B)</span></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
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
<table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="900">
                    <tr>
                      <td width="0%"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                      <td width="0%"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
</tr>
<%
//System.out.println(31);
factory=ServiceController.getInstance();
//System.out.println(32);
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
//System.out.println(33);
remoteList_Wilayah = home.create();
//System.out.println(34);
result=remoteList_Wilayah.getTotAkhirp4b(nprop,nkab,nkec,"","");
//System.out.println(35);
if(result.isEmpty())
{
//System.out.println(36);
%>
<html>
<body onload="window.history.forward(1)">
<div align="center"><b>
<h4><font color=red>Data Belum Ada !</font></h4>
</b></div>
</body>
</html>
<%
}
else
{
//System.out.println(37);
%>
      <tr>
<td width="0%">&nbsp;</td>
<td valign="middle" align="center" width="100%">

    <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
      <tr>
        <td class="C-Fonts" rowspan="2" width="17">
          <div align="center"> No</div>
        </td>
        <td class="C-Fonts" rowspan="2" width="109">
          <div align="center"><%=str%></div>
        </td>
        <td class="C-Fonts" colspan="10">
          <div align="center">Pendidikan Terakhir (jiwa)</div>
          <div align="center"></div>
        </td>
        <td class="C-Fonts" rowspan="2" width="64">
          <div align="center">Jumlah Penduduk</div>
          <div align="center">(jiwa)</div>
        </td>
      </tr>
      <tr>
        <td class="C-Fonts" width="52">
          <div align="center">Tidak/<br>
            Belum Sekolah</div>
        </td>
        <td class="C-Fonts" width="64">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Tidak<br>
            Tamat SD/<br>
            Sederajat</span></div>
        </td>
        <td class="C-Fonts" width="68">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Tamat
            SD/ Sederajat </span></div>
        </td>
        <td class="C-Fonts" width="64">
          <div align="center">SLTP/ Sederajat</div>
        </td>
        <td class="C-Fonts" width="68">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">SLTA/
            Sederajat </span></div>
        </td>
        <td class="C-Fonts" width="57">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Diploma
            I/II </span></div>
        </td>
        <td class="C-Fonts" width="69">
          <div align="center">Akademi/ Diploma III/ S.Muda</div>
        </td>
        <td class="C-Fonts" width="57">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Diploma
            IV/ Strata I</span></div>
        </td>
        <td class="C-Fonts" width="44">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Strata
            II </span></div>
        </td>
        <td class="C-Fonts" width="44">
          <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Strata
            III </span></div>
        </td>
      </tr>
      <%
long  cntr=1;
long jum_pddk=0;

long pddk1=0;
long pddk2=0;
long pddk3=0;
long pddk4=0;
long pddk5=0;
long pddk6=0;
long pddk7=0;
long pddk8=0;
long pddk9=0;
long pddk10=0;
long totaljum=0;//System.out.println(4);
//System.out.println(38);
for(int i=0; i<result.size(); i++)
{
//System.out.println(39);
jum_pddk=0;
   recordGetAkhir=(GetAkhir)(result.elementAt(i)) ;
jum_pddk=jum_pddk+(Long.parseLong(recordGetAkhir.getSekoloh())+Long.parseLong(recordGetAkhir.getSederjat())+
Long.parseLong(recordGetAkhir.getTamat())+Long.parseLong(recordGetAkhir.getSltp())+Long.parseLong(recordGetAkhir.getSlta())
+Long.parseLong(recordGetAkhir.getDip1())+Long.parseLong(recordGetAkhir.getAkademDip1())+
Long.parseLong(recordGetAkhir.getDip1V())+Long.parseLong(recordGetAkhir.getStrata1())+Long.parseLong(recordGetAkhir.getStrata2()));

pddk1=pddk1+Long.parseLong(recordGetAkhir.getSekoloh());
pddk2=pddk2+Long.parseLong(recordGetAkhir.getSederjat());
pddk3=pddk3+Long.parseLong(recordGetAkhir.getTamat());
pddk4=pddk4+Long.parseLong(recordGetAkhir.getSltp());
pddk5=pddk5+Long.parseLong(recordGetAkhir.getSlta());
pddk6=pddk6+Long.parseLong(recordGetAkhir.getDip1());
pddk7=pddk7+Long.parseLong(recordGetAkhir.getAkademDip1());
pddk8=pddk8+Long.parseLong(recordGetAkhir.getDip1V());
pddk9=pddk9+Long.parseLong(recordGetAkhir.getStrata1());
pddk10=pddk10+Long.parseLong(recordGetAkhir.getStrata2());
totaljum=totaljum+jum_pddk;//System.out.println(5);
%>
      <tr>
        <td class="C-Field" width="17"> <%=cntr++%></td>
        <td class="C-Field" width="125">
          <div align="left"><%=recordGetAkhir.getNamaKel().toString().toUpperCase()%>
          </div>
        </td>
        <td class="C-Field" width="52">
          <div align="center"><%=recordGetAkhir.getSekoloh()%></div>
        </td>
        <td class="C-Field" width="64">
          <div align="center"><%=recordGetAkhir.getSederjat()%></div>
        </td>
        <td class="C-Field" width="68">
          <div align="center"><%=recordGetAkhir.getTamat()%></div>
        </td>
        <td class="C-Field" width="64">
          <div align="center"><%=recordGetAkhir.getSltp()%></div>
        </td>
        <td class="C-Field" width="68">
          <div align="center"><%=recordGetAkhir.getSlta()%></div>
        </td>
        <td class="C-Field" width="57">
          <div align="center"><%=recordGetAkhir.getDip1()%></div>
        </td>
        <td class="C-Field" width="69">
          <div align="center"><%=recordGetAkhir.getAkademDip1()%></div>
        </td>
        <td class="C-Field" width="57">
          <div align="center"><%=recordGetAkhir.getDip1V()%></div>
        </td>
        <td class="C-Field" width="44">
          <div align="center"><%=recordGetAkhir.getStrata1()%></div>
        </td>
        <td class="C-Field" width="44">
          <div align="center"><%=recordGetAkhir.getStrata2()%></div>
        </td>
        <td class="C-Field" width="64">
          <div align="center"><%=jum_pddk%></div>
        </td>
      </tr>
      <%
}
%>
      <tr>
        <td class="C-Field" colspan="2"><div align="center"><b><%=strb%></b></div></td>
        <td class="C-Field" width="52"><div align="center"><b><%=pddk1%></b></div></td>
        <td class="C-Field" width="64"><div align="center"><b><%=pddk2%></b></div></td>
        <td class="C-Field" width="68"><div align="center"><b><%=pddk3%></b></div></td>
        <td class="C-Field" width="64"><div align="center"><b><%=pddk4%></b></div></td>
        <td class="C-Field" width="68"><div align="center"><b><%=pddk5%></b></div></td>
        <td class="C-Field" width="57"><div align="center"><b><%=pddk6%></b></div></td>
        <td class="C-Field" width="69"><div align="center"><b><%=pddk7%></b></div></td>
        <td class="C-Field" width="57"><div align="center"><b><%=pddk8%></b></div></td>
        <td class="C-Field" width="44"><div align="center"><b><%=pddk9%></b></div></td>
        <td class="C-Field" width="44"><div align="center"><b><%=pddk10%></b></div></td>
        <td class="C-Field" width="64"><div align="center"><b><%=totaljum%></b></div></td>
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
</BODY></HTML>

<%
}}
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception jps)
{
jps.printStackTrace();
System.out.print("Error in Jml_Pddk_Akhir_Tamp.jsp =" + jps.toString());
}
finally
{
remoteList_Wilayah.remove();
}
%>
