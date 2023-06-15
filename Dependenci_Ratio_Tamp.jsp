<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_wilayah;
GetRatio recordRatio;
String Sys_Date;
int a,b,g,h,i,j,k,l,m,n,o,p,q,r,e,f,aa,bb,cc,dd,ee,ff,gg,hh,XX,YY,ZZ,Rat;
Vector s;

    UserInfo1 record = null;

%>
<%
try
  {


Sys_Date=request.getParameter("sysdate");
System.out.println("Date is"+request.getParameter("sysdate"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printBuku(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Struktur Umur dan Angka BebanKetergantungan Penduduk Indonesia  ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="Dependenci_Ratio.jsp";
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
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printBuku(this)">
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
                              <div align="center"><span class="subtitle">Struktur
                                Umur dan Angka Beban<br>
                                Ketergantungan Penduduk Indonesia</span></div>
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
                                  <td width="216">
                                    <div align="center"> Tanggal</div>
                                  </td>
                                  <td width="2%">:</td>
<td colspan="2" width="200"> <%=Sys_Date.toString().toUpperCase()%></td>
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
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="525">
                    <tr>
                      <td><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>
<%
factory=ServiceController.getInstance();
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
remoteList_wilayah = home.create();
s=remoteList_wilayah.getRatio();
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
                      <td>&nbsp;</td>
                      <td class="C-BG" valign="top">
                        <table width="100%" border="0" cellspacing="1" cellpadding="3" align="center">
                          <tr>
                            <td class="C-Fonts" width="30">
                              <div align="center"> No.</div>
                            </td>
                            <td class="C-Fonts" width="175">
                              <div align="center">Struktur Umur (Tahun)</div>
                            </td>
                            <td class="C-Fonts" width="69">
                              <div align="center">Laki-laki (jiwa)</div>
                            </td>
                            <td class="C-Fonts" width="80">
                              <div align="center">Perempuan (jiwa)</div>
                            </td>
                            <td class="C-Fonts" width="85">
                              <div align="center">Laki-laki + Perempuan (jiwa)</div>
                            </td>
                          </tr>
<%
j=1;k=0;l=0;m=0;n=0;o=0;p=0;q=0;r=0;e=0;f=0;g=0;h=0;e=0;f=0;
aa=0;bb=0;cc=0;dd=0;ee=0;ff=0;gg=0;hh=0;
for(int x=0; x<s.size(); x++)
{
recordRatio=(GetRatio) (s.elementAt(x));
%>
                          <tr>
                            <td align="center" class="C-Field" width="30">1.</td>
                            <td class="C-Field" width="175">
                              <div align="center">0 - 4</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL1()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP1()%></div>
                            </td>
                            <td class="C-Field" width="85">
<%
l=Integer.parseInt(recordRatio.getL1())+Integer.parseInt(recordRatio.getP1());
%>
<div align="center"><%=l%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">2.</td>
                            <td class="C-Field" width="175">
                              <div align="center">5 - 9</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL2()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP2()%></div>
                            </td>
<%
m=Integer.parseInt(recordRatio.getL2())+Integer.parseInt(recordRatio.getP2());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=m%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">3.</td>
                            <td class="C-Field" width="175">
                              <div align="center">10 - 14</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL3()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP3()%></div>
                            </td>
<%
n=Integer.parseInt(recordRatio.getL3())+Integer.parseInt(recordRatio.getP3());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=n%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">4.</td>
                            <td class="C-Field" width="175">
                              <div align="center">15 - 19</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL4()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP4()%></div>
                            </td>
<%
o=Integer.parseInt(recordRatio.getL4())+Integer.parseInt(recordRatio.getP4());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=o%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">5.</td>
                            <td class="C-Field" width="175">
                              <div align="center">20 - 24</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL5()%></div>
                            </td>
<%
p=Integer.parseInt(recordRatio.getL5())+Integer.parseInt(recordRatio.getP5());
%>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP5()%></div>
                            </td>
                            <td class="C-Field" width="85">
                              <div align="center"><%=p%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">6.</td>
                            <td class="C-Field" width="175">
                              <div align="center">25 - 29</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL6()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP6()%></div>
                            </td>
<%
q=Integer.parseInt(recordRatio.getL6())+Integer.parseInt(recordRatio.getP6());
%>
                            <td class="C-Field" width="85">
<div align="center"><%=q%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">7.</td>
                            <td class="C-Field" width="175">
                              <div align="center">30 - 34</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL7()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP7()%></div>
                            </td>
<%
e=Integer.parseInt(recordRatio.getL7())+Integer.parseInt(recordRatio.getP7());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=e%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">8.</td>
                            <td class="C-Field" width="175">
                              <div align="center">35 - 39</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL8()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP8()%></div>
                            </td>
<%
f=Integer.parseInt(recordRatio.getL8())+Integer.parseInt(recordRatio.getP8());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=f%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">9.</td>
                            <td class="C-Field" width="175">
                              <div align="center">40 - 44</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL9()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP9()%></div>
                            </td>
<%
aa=Integer.parseInt(recordRatio.getL9())+Integer.parseInt(recordRatio.getP9());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=aa%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">10.</td>
                            <td class="C-Field" width="175">
                              <div align="center">45 - 49</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL10()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP10()%></div>
                            </td>
<%
bb=Integer.parseInt(recordRatio.getL10())+Integer.parseInt(recordRatio.getP10());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=bb%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">11.</td>
                            <td class="C-Field" width="175">
                              <div align="center">50 - 54</div>
                            </td>
                            <td class="C-Field" width="69">
<div align="center"><%=recordRatio.getL11()%></div>
                            </td>
                            <td class="C-Field" width="80">
<div align="center"><%=recordRatio.getP11()%></div>
                            </td>
<%
cc=Integer.parseInt(recordRatio.getL11())+Integer.parseInt(recordRatio.getP11());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=cc%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">12.</td>
                            <td class="C-Field" width="175">
                              <div align="center">55 - 59</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL12()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP12()%></div>
                            </td>
<%
dd=Integer.parseInt(recordRatio.getL12())+Integer.parseInt(recordRatio.getP12());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=dd%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">13.</td>
                            <td class="C-Field" width="175">
                              <div align="center">60 - 64</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL13()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP13()%></div>
                            </td>
<%
ee=Integer.parseInt(recordRatio.getL13())+Integer.parseInt(recordRatio.getP13());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=ee%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" width="30">14.</td>
                            <td class="C-Field" width="175">
                              <div align="center">&gt; 65</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=recordRatio.getL14()%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=recordRatio.getP14()%></div>
                            </td>
<%
ff=Integer.parseInt(recordRatio.getL14())+Integer.parseInt(recordRatio.getP14());
%>
                            <td class="C-Field" width="85">
                              <div align="center"><%=ff%></div>
                            </td>
                          </tr>
<%
k=Integer.parseInt(recordRatio.getL1())+Integer.parseInt(recordRatio.getL2())+Integer.parseInt(recordRatio.getL3())+Integer.parseInt(recordRatio.getL4())+Integer.parseInt(recordRatio.getL5())+Integer.parseInt(recordRatio.getL6())+Integer.parseInt(recordRatio.getL7())+Integer.parseInt(recordRatio.getL8())+Integer.parseInt(recordRatio.getL9())+Integer.parseInt(recordRatio.getL10())+Integer.parseInt(recordRatio.getL11())+Integer.parseInt(recordRatio.getL12())+Integer.parseInt(recordRatio.getL13())+Integer.parseInt(recordRatio.getL14());
r=Integer.parseInt(recordRatio.getP1())+Integer.parseInt(recordRatio.getP2())+Integer.parseInt(recordRatio.getP3())+Integer.parseInt(recordRatio.getP4())+Integer.parseInt(recordRatio.getP5())+Integer.parseInt(recordRatio.getP6())+Integer.parseInt(recordRatio.getP7())+Integer.parseInt(recordRatio.getP8())+Integer.parseInt(recordRatio.getP9())+Integer.parseInt(recordRatio.getP10())+Integer.parseInt(recordRatio.getP11())+Integer.parseInt(recordRatio.getP12())+Integer.parseInt(recordRatio.getP13())+Integer.parseInt(recordRatio.getP14());
XX=l+m+n;
YY=ff;
ZZ=o+p+q+e+f+aa+bb+cc+dd+ee;
System.out.println(XX+"  "+YY+"  "+ZZ);
Rat=((XX+YY)/ZZ)*100;
%>

<%
}
%>

                          <tr>
                            <td align="center" class="C-Field" colspan="2">
                              <div align="center">Jumlah Penduduk</div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=k%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"><%=r%></div>
                            </td>
                            <td class="C-Field" width="85">
                              <div align="center"><%=XX+ZZ+YY%></div>
                            </td>
                          </tr>
                          <tr>
                            <td align="center" class="C-Field" colspan="2">
                              <div align="center">Angka Beban Ketergantungan <i><font color="#307CB6"><b>(Dependency
                                Ratio)</b></font></i></div>
                            </td>
                            <td class="C-Field" width="69">
                              <div align="center"><%=Rat%></div>
                            </td>
                            <td class="C-Field" width="80">
                              <div align="center"></div>
                            </td>
                            <td class="C-Field" width="85">
                              <div align="center"></div>
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
<%
}catch(Exception jps){
System.out.print("Error in Dependenci_Ratio_Tamp.jsp =" + jps.toString());
jps.printStackTrace();
}
finally
{
if(remoteList_wilayah!=null) remoteList_wilayah.remove();
}

%>
