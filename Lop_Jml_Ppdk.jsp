<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%!
ServiceController factory;
List_WilayahHome home;
List_Wilayah remote;
getJumlah record;
int i,j;
int ii,jj,kk;
Vector b;
String nprop,nkab,nkec,nkel,thu="",naprop,nakab,nakec,nakel;
String a[];
UserInfo1 record1;
%>
<%
record1=(UserInfo1)session.getAttribute("remoteRef");

try{

 if(record1 != null)
  {
%>
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</HEAD>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printLaporan(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Jumlah Penduduk Menurut Struktur Umur,Jenis Kelamin dan Kepemilikan Akta Kelahiran ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=4&screen_code=11";
              window.close();
          }
    }
}
function showPyramid()
{
var path="pyramid.jsp?";

var totallk = parseInt(document.all['tl'].value);
var totalpr = parseInt(document.all['tp'].value);

for(i=0;i<16;i++)
{
var laki = (Math.round(parseInt(document.all['la'+i].value)/totallk * 100))*5;
var perempuan = (Math.round( parseInt(document.all['pa'+i].value)/totalpr * 100))*5;

if(isNaN(laki))
{
laki=0;
}
if(isNaN(perempuan))
{
perempuan=0;
}
path = path +"la"+i+"="+ laki+"&pa"+i+"="+perempuan+"&";
}

path = path.substring(0, path.length-1);
//alert(path);
//document.location=path;
window.open(path,'','fullscreen=no,scrollbars=no,resizable=no,menubar=no,toolbar=no,width=500,height=450');

}
</script>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<form name="form1" method="post" action="">
<%
nprop=request.getParameter("nprop");
nkab=request.getParameter("nkab");
nkec=request.getParameter("nkec");
nkel=request.getParameter("nkel");
naprop=request.getParameter("naprop");
nakab=request.getParameter("nakab");
nakec=request.getParameter("nakec");
nakel=request.getParameter("nakel");

int jmlLaki=0,jmlPerempuan=0,jmlAda=0,jmlTAda=0;
int totalJmlLakiPerempuan=0,totalJmlKumulatif=0;
int totalJmlAda=0, totalJmlTAda=0;
int jmlLakiPerempuan=0,jmlKumulatif=0;

String a[]={"0 - 4","5 - 9","10 - 14","15 - 19","20 - 24","25 - 29","30 - 34","35 - 39","40 - 44","45 - 49","50 - 54","55 - 59","60 - 64","65 - 69","70 - 74","> 75"};

factory=ServiceController.getInstance();
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
remote = home.create();
 b=remote.getTotJumlah(nprop,nkab,nkec,nkel,thu);

if(!b.isEmpty())
{
i=b.size();
System.out.println("Vector b size=  " +i);
%>
 <div align="center">
<table width="100" border="0" cellspacing="2" cellpadding="2">
                              <tr>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printLaporan(this)">
                                    </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button  name="grafik" value="GRAPH" onclick="showPyramid()">
                                   </b></div>
                                </td>
                                <td>
                                  <div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
                                    </b></div>
                                </td>
                              </tr>
                            </table>
                          </div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="380">
      <table width="100%" border="0" cellspacing="5" cellpadding="5">
        <tr>
          <td valign="top" height="337">
              <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td>

                  <table width="480" border="0" cellspacing="3" cellpadding="0" align="center" height="163">
                    <tr>
                      <td height="1">
                        <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                      </td>
                    </tr>
                    <tr>
                      <td height="25">
                        <div align="center"><span ><b>Jumlah Penduduk Menurut
                          Struktur Umur,<br>
                          Jenis Kelamin dan Kepemilikan Akta Kelahiran</b></span></div>
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
                            <td width="171"><b>Nama Provinsi </b></td>
                            <td width="14"> :</td>
<td width="203"><%=nprop%> - <%=naprop.toString().toUpperCase()%> </td>
                          </tr>
                          <tr>
                            <td width="171"><b>Nama Kabupaten/Kota</b> </td>
                            <td width="14"> :</td>
<td width="203"><%=nkab%> - <%=nakab.toString().toUpperCase()%> </td>
                          </tr>
                          <tr>
                            <td width="171"><b>Nama Kecamatan</b> </td>
                            <td width="14"> :</td>
<td width="203"><%=nkec%> - <%=nakec.toString().toUpperCase()%> </td>
                          </tr>
                          <tr>
                            <td width="171"><b>Nama Desa/Kelurahan</b> </td>
                            <td width="14">:</td>
<td width="203"><%=nkel%> - <%=nakel.toString().toUpperCase()%> </td>
                          </tr>
                          <tr>
                              <td width="171"><b>Tanggal</b></td>
                            <td width="14">:</td>
                            <td width="203"><%=record1.getToday()%> </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  </td>
                </tr>
                <tr>
                  <td valign="top">

                  <table border="0" cellspacing="0" cellpadding="0" align="center" width="788">
                    <tr>
                        <td>&nbsp;</td>
                        <td valign="top">

                       <td valign="top">

                    <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="600">
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
                                    <td class="C-Fonts" rowspan="3" width="21">
                                      <div align="center"> No.</div>
                                    </td>
                                    <td class="C-Fonts" rowspan="3" width="103">
                                      <div align="center">Golongan Umur (Tahun)</div>
                                    </td>
                                    <td class="C-Fonts" colspan="4">
                                      <div align="center">Jumlah Penduduk</div>
                                    </td>
                                    <td class="C-Fonts" colspan="2" rowspan="2">
                                      <div align="center">Kepemilikan Akta Kelahiran<br>
                                        (jiwa)</div>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Fonts" colspan="2">
                                      <div align="center">Jenis Kelamin (jiwa)</div>
                                    </td>
                                    <td class="C-Fonts" rowspan="2" width="59">
                                      <div align="center">Total (jiwa)</div>
                                    </td>
                                    <td class="C-Fonts" rowspan="2" width="72">
                                      <div align="center">Jumlah Kumulatif<br>
                                        (jiwa)</div>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="C-Fonts" width="53" nowrap>
                                      <div align="center">Laki-Laki</div>
                                    </td>
                                    <td class="C-Fonts" width="79">
                                      <div align="center">Perempuan</div>
                                    </td>
                                    <td class="C-Fonts" width="76">
                                      <div align="center">Tidak Ada</div>
                                    </td>
                                    <td class="C-Fonts" width="70">
                                      <div align="center">Ada</div>
                                    </td>
                                  </tr>
                                  <%
j=1;

for(int x=0; x<b.size(); x++)
{
record=(getJumlah) (b.elementAt(x));
jmlLaki = jmlLaki + Integer.parseInt(record.getLaki());
jmlPerempuan = jmlPerempuan + Integer.parseInt(record.getPerum());
jmlLakiPerempuan = Integer.parseInt(record.getLaki()) + Integer.parseInt(record.getPerum());
totalJmlLakiPerempuan = totalJmlLakiPerempuan + jmlLakiPerempuan;

jmlKumulatif=jmlKumulatif+Integer.parseInt(record.getLaki())+Integer.parseInt(record.getPerum());
totalJmlKumulatif = totalJmlKumulatif+jmlKumulatif;

totalJmlAda = totalJmlAda + Integer.parseInt(record.getAda());
totalJmlTAda = totalJmlTAda + Integer.parseInt(record.getTAda());

System.out.println("record.getLaki(): "+record.getLaki());
%>
                                  <tr>
                                    <td align="center" class="C-Field" width="21"><%=j%></td>
                                    <td class="C-Field" width="103">
                                      <div align="center"><%=a[x]%></div>
                                    </td>
                                    <td align="center" class="C-Field" width="53">
                                      <div align="center"><%=record.getLaki()%></div>
                                      <input type="hidden" name="la<%=x%>" value="<%=record.getLaki()%>">
                                    </td>
                                    <td class="C-Field" width="79">
                                      <div align="center"><%=record.getPerum()%></div>
                                      <input type="hidden" name="pa<%=x%>" value="<%=record.getPerum()%>">
                                    </td>
                                    <td class="C-Field" width="59"><div align="center"><%=jmlLakiPerempuan%></div></td>
                                    <td class="C-Field" width="72">
                                      <div align="center"><%=jmlKumulatif%></div>
                                    </td>
                                    <td class="C-Field" width="76">
                                      <div align="center"><%=record.getAda()%></div>
                                    </td>
                                    <td class="C-Field" width="70">
                                      <div align="center"><%=record.getTAda()%></div>
                                    </td>
                                  </tr>
                                  <%
j++;
}}
%>
                                  <tr>
                                    <td align="center" class="C-Field" colspan="2">
                                      <div align="center">Jumlah</div>
                                    </td>
                                    <td align="center" class="C-Field" width="53">
                                      <div align="center"><%=jmlLaki%></div>
                                    </td>
                                    <td class="C-Field" width="79">
                                      <div align="center"><%=jmlPerempuan%></div>
                                    </td>
                                    <td class="C-Field" width="59"><div align="center"><%=totalJmlLakiPerempuan%></div></td>
                                    <td class="C-Field" width="72">

                                    </td>
                                    <td class="C-Field" width="76">
                                      <div align="center"><%=totalJmlAda %></div>
                                    </td>
                                    <td class="C-Field" width="70">
                                      <div align="center"><%=totalJmlTAda%></div>
                                    </td>
                                  </tr>
                                </table>
<input type="hidden" name="tl" value="<%=jmlLaki%>">
<input type="hidden" name="tp" value="<%=jmlPerempuan%>">
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
                <tr>
                  <td valign="top">&nbsp;</td>
                </tr>
              </table>
            </td>
        </tr>
      </table>
    </td>
  </tr>
<td height="2">&nbsp;</td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</table>
</form>
</BODY>
</HTML>
<%
  }
else
{
response.sendRedirect("index.jsp");
}
  }
catch(Exception jps)
{
remote.remove();
System.out.print("Error in Jml_Ppdk_UmurSex_Tampl.jsp =" + jps.toString());
jps.printStackTrace();
}
%>

