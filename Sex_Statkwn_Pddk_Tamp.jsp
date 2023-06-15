<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_wilayah;
GetPerkawinan recordPerkawinan;
String Sys_Date;
int a,b,g,h,i,j,k,n,o,p,q,r,e,f,XX;
double l,m,YY,Rat;
Vector s;
UserInfo1 record=null;
%>
<%
try
  {
record=(UserInfo1)session.getAttribute("remoteRef");

if (record!=null)
{
Sys_Date=record.getToday();
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
         if (confirm("Apakah benar Jenis Kelamin dan Status PerkawinanPenduduk Indonesia ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="Sex_Statkwn_Pddk.jsp";
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
                              <div align="center"><span class="subtitle">Jenis
                                Kelamin dan Status Perkawinan<br>
                                Penduduk Indonesia</span></div>
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
                              <table width="442" border="0" cellspacing="3" cellpadding="0" align="center">
                                <tr>
                                  <td width="220">
                                    <div align="center">Tanggal</div>
                                  </td>
                                  <td width="1%">:</td>
<td colspan="2" width="196"><%=Sys_Date.toString().toUpperCase()%></td>
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
remoteList_wilayah = home.create();
s=remoteList_wilayah.getPerKawinan();
if(s.isEmpty())
{
%>
<div align="center"><b>
<h4><font color=red>Data Belum Ada !</font></h4>
</b></div>
<%
}
else
{
i=s.size();
}
%>
              <tr>
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="875">
                    <tr>
                      <td><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="C-BG" valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center">
                          <tr>
                            <td class="C-Fonts" rowspan="2" width="21">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="102">
                              <div align="center">Provinsi</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Jenis Kelamin (jiwa)</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="68">
                              <div align="center">Jumlah Penduduk (jiwa)</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="62">
                              <div align="center">Rasio Jenis Kelamin</div>
                            </td>
                            <td class="C-Fonts" colspan="4">
                              <div align="center">Status Perkawinan (jiwa)</div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Kepemilikan Akta</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" width="70">
                              <div align="center">Laki-laki</div>
                            </td>
                            <td class="C-Fonts" width="74">
                              <div align="center">Perempuan</div>
                            </td>
                            <td class="C-Fonts" width="49">
                              <div align="center">Belum Kawin</div>
                            </td>
                            <td class="C-Fonts" width="44">
                              <div align="center">Kawin</div>
                            </td>
                            <td class="C-Fonts" width="44">
                              <div align="center">Cerai Hidup</div>
                            </td>
                            <td class="C-Fonts" width="53">
                              <div align="center">Cerai Mati</div>
                            </td>
                            <td class="C-Fonts" width="86">
                              <div align="center">Perkawinan</div>
                            </td>
                            <td class="C-Fonts" width="82">
                              <div align="center">Perceraian</div>
                            </td>
                          </tr>
<%
j=1;k=0;l=0;m=0;n=0;o=0;p=0;q=0;r=0;e=0;f=0;g=0;h=0;e=0;f=0;
for(int x=0; x<s.size(); x++)
{
recordPerkawinan=(GetPerkawinan) (s.elementAt(x));
%>
                          <tr>
                            <td align="center" class="C-Field" width="21"><%=j%></td>
                            <td class="C-Field" width="102">
                              <div align="left"><%=recordPerkawinan.getNamaProp().toString().toUpperCase()%></div>
                            </td>
                            <td align="center" class="C-Field" width="70">
                              <div align="center"><%=recordPerkawinan.getLaki()%></div>
<%
l=l+Integer.parseInt(recordPerkawinan.getLaki());
%>
                            </td>
                            <td class="C-Field" width="74">
                              <div align="center"><%=recordPerkawinan.getPerempuan()%></div>
                            </td>
<%
m=m+Integer.parseInt(recordPerkawinan.getPerempuan());
%>
                            <td class="C-Field" width="68">
<div align="center"><%=Integer.parseInt(recordPerkawinan.getLaki())+Integer.parseInt(recordPerkawinan.getPerempuan())%></div>
                            </td>
<%
n=n+Integer.parseInt(recordPerkawinan.getLaki())+Integer.parseInt(recordPerkawinan.getPerempuan());
YY=m/l;
Rat=YY*100.0;
%>
                            <td class="C-Field" width="62">
                              <div align="center"><%=Math.round(Rat)%></div>
                            </td>

                            <td class="C-Field" width="49">
                              <div align="center"><%=recordPerkawinan.getBelumKawin()%></div>
                            </td>
<%
o=o+Integer.parseInt(recordPerkawinan.getBelumKawin());
%>
                            <td class="C-Field" width="44">
                              <div align="center"><%=recordPerkawinan.getKawin()%></div>
                            </td>
<%
p=p+Integer.parseInt(recordPerkawinan.getKawin());
%>
                            <td class="C-Field" width="44">
                              <div align="center"><%=recordPerkawinan.getCeraiHidup()%></div>
                            </td>
<%
q=q+Integer.parseInt(recordPerkawinan.getCeraiHidup());
%>
                            <td class="C-Field" width="53">
                              <div align="center"><%=recordPerkawinan.getCeraiMati()%></div>
                            </td>
<%
e=e+Integer.parseInt(recordPerkawinan.getCeraiMati());
%>
                            <td class="C-Field" width="86">
                              <div align="center"><%=recordPerkawinan.getPerkawinan() %></div>
                            </td>
<%
f=f+Integer.parseInt(recordPerkawinan.getPerkawinan());
%>
                            <td class="C-Field" width="82">
                              <div align="center"><%=recordPerkawinan.getPerceraian()%></div>
                            </td>
<%
g=g+Integer.parseInt(recordPerkawinan.getPerceraian());
%>
                          </tr>
<%
j++;
}

%>
                          <tr>
                            <td align="center" class="C-Field" colspan="2">Jumlah
                              Nasional </td>
                            <td align="center" class="C-Field" width="70">
                              <div align="center"><%=Math.round(l)%></div>
                            </td>
                            <td class="C-Field" width="74">
                              <div align="center"><%=Math.round(m)%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=n%></div>
                            </td>
                            <td class="C-Field" width="62">
                              <div align="center"><%=Math.round(Rat)%></div>
                            </td>
                            <td class="C-Field" width="49">
                              <div align="center"><%=o%></div>
                            </td>
                            <td class="C-Field" width="44">
                              <div align="center"><%=p%></div>
                            </td>
                            <td class="C-Field" width="44">
                              <div align="center"><%=q%></div>
                            </td>
                            <td class="C-Field" width="53">
                              <div align="center"><%=e%></div>
                            </td>
                            <td class="C-Field" width="86">
                              <div align="center"><%=f%></div>
                            </td>
                            <td class="C-Field" width="82">
                              <div align="center"><%=g%></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
                      <td><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
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
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception jps)
{
jps.printStackTrace();
}
finally
{
if(remoteList_wilayah!=null) remoteList_wilayah.remove();
}
%>
