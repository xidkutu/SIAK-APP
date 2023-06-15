<%@ page language="java" import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
UserInfo1 record=null;
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
GetCacat recordGetCacat;
String nprop,nkab,nkec,nkel,naprop,nakab,nakec;
Vector result;
String str,strb;
%>

<%
try
  {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
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
         if (confirm("Apakah benar Jumlah Penduduk Menurut Penyandang Cacat ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=6";
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

<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center" width="100">
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
                      <td height="205">
                        <table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Jumlah
                                Penduduk Menurut Penyandang Cacat</span></div>
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
<%
factory=ServiceController.getInstance();
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
remoteList_Wilayah = home.create();
result=remoteList_Wilayah.getTotCacat(nprop,nkab,nkec);
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
                <td valign="top">&nbsp; </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>
<table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="650">
  <tr>
    <td width="0%"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
    <td width="100%"><img src="images/dot.gif" width="1" height="1"></td>
    <td width="0%"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
  </tr>
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
          <td class="C-Fonts" colspan="6">
            <div align="center">Penyandang Cacat (jiwa)</div>
            <div align="center"></div>
          </td>
          <td class="C-Fonts" rowspan="2" width="64">
            <div align="center">Jumlah Penduduk</div>
            <div align="center">(jiwa)</div>
          </td>
        </tr>
        <tr>
          <td class="C-Fonts" width="52">
            <div align="center">Fisik</div>
          </td>
          <td class="C-Fonts" width="64">
            <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Netra</span></div>
          </td>
          <td class="C-Fonts" width="68">
            <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Rungu</span></div>
          </td>
          <td class="C-Fonts" width="64">
            <div align="center">Mental/Jiwa</div>
          </td>
          <td class="C-Fonts" width="64">Fisik/Mental</td>
          <td class="C-Fonts" width="64">
            <div align="center">Lainnya</div>
          </td>
        </tr>
        <%
long tot_jiwa=0;
long tot_fisik=0;
long tot_netra=0;
long tot_rungu=0;
long tot_mtljw=0;
long tot_fskmtl=0;
long tot_lain=0;
long jml_jiwa=0;
long cntr=1;

for(int x=0; x<result.size(); x++)
{
recordGetCacat=(GetCacat) (result.elementAt(x));
tot_jiwa=Long.parseLong(recordGetCacat.getFisik())+Long.parseLong(recordGetCacat.getNetra())+Long.parseLong(recordGetCacat.getRungu())+Long.parseLong(recordGetCacat.getRungu())+Long.parseLong(recordGetCacat.getFisikMental())+Long.parseLong(recordGetCacat.getLainnya());
tot_fisik=tot_fisik+Long.parseLong(recordGetCacat.getFisik());
tot_netra=tot_netra+Long.parseLong(recordGetCacat.getNetra());
tot_rungu=tot_rungu+Long.parseLong(recordGetCacat.getRungu());
tot_mtljw=tot_mtljw+Long.parseLong(recordGetCacat.getRungu());
tot_fskmtl=tot_fskmtl+Long.parseLong(recordGetCacat.getFisikMental());
tot_lain=tot_lain+Long.parseLong(recordGetCacat.getLainnya());
jml_jiwa=jml_jiwa+tot_jiwa;
%>
        <tr>
          <td class="C-Field" width="17"> <%=cntr%></td>
          <td class="C-Field" width="109">
            <div align="left"><%=recordGetCacat.getNamaKel().toString().toUpperCase() %></div>
          </td>
          <td class="C-Field" width="52">
            <div align="center"><%=recordGetCacat.getFisik()%></div>
          </td>
          <td class="C-Field" width="64">
            <div align="center"><%=recordGetCacat.getNetra()%></div>
          </td>
          <td class="C-Field" width="68">
            <div align="center"><%=recordGetCacat.getRungu()%></div>
          </td>
          <td class="C-Field" width="64">
            <div align="center"><%=recordGetCacat.getMentalJiwa()%></div>
          </td>
          <td class="C-Field" width="64">
            <div align="center"><%=recordGetCacat.getFisikMental()%></div>
          </td>
          <td class="C-Field" width="64">
            <div align="center"><%=recordGetCacat.getLainnya()%></div>
          </td>
          <td class="C-Field" width="64">
            <div align="center"><%=tot_jiwa%></div>
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
          <td class="C-Field" width="52" height="15">
            <div align="center"><b><%=tot_fisik%></b></div>
          </td>
          <td class="C-Field" width="64" height="15">
            <div align="center"><b><%=tot_netra%></b></div>
          </td>
          <td class="C-Field" width="68" height="15">
            <div align="center"><b><%=tot_rungu%></b></div>
          </td>
          <td class="C-Field" width="64" height="15">
            <div align="center"><b><%=tot_mtljw%></b></div>
          </td>
          <td class="C-Field" width="64" height="15">
            <div align="center"><b><%=tot_fskmtl%></b></div>
          </td>
          <td class="C-Field" width="64" height="15">
            <div align="center"><b><%=tot_lain%></b></div>
          </td>
          <td class="C-Field" width="64" height="15">
            <div align="center"><b><%=jml_jiwa%></b></div>
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
</BODY></HTML>
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
remoteList_Wilayah.remove();
}
%>
