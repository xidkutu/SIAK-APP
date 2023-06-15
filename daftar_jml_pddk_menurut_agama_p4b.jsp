<%@ page import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>

<%!
   UserInfo1 record = null;
String nprop,nkab,nkec,nkel,naprop,nakab,nakec;
String str,strb;
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
Vector vData = new Vector();
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
         if (confirm("Apakah benar Jumlah Penduduk Menurut Agama(P4B) ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=5";
              window.close();
          }
    }
}
</script>

<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
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
<p>&nbsp;</p>
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
                                Penduduk Menurut Agama(P4B)</span></div>
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
<%
  factory=ServiceController.getInstance();
  home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
  remoteList_Wilayah = home.create();
  vData=remoteList_Wilayah.getAgamap4b(nprop,nkab,nkec);

if (vData.isEmpty())
 {
%>
<html>
<body>
<div align="center"><b>
<h4><font color=red>Data Belum Ada !</font></h4>
</b></div>
</body>
</html>

<%
 }
else
{
%>
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="575">
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
                              <div align="center">Desa/Kelurahan</div>
                            </td>
                            <td class="C-Fonts" colspan="6">
                              <div align="center">Agama (jiwa)</div>
                              <div align="center"></div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="64">
                              <div align="center">Jumlah Penduduk</div>
                              <div align="center">(jiwa)</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" width="52">
                              <div align="center">Islam</div>
                            </td>
                            <td class="C-Fonts" width="64">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Kristen</span></div>
                            </td>
                            <td class="C-Fonts" width="68">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Katholik</span></div>
                            </td>
                      <td class="C-Fonts" width="64"><div align="center">Hindu</div></td>
                            <td class="C-Fonts" width="64">
                              <div align="center">Budha</div>
                            </td>
                            <td class="C-Fonts" width="64">
                              <div align="center">Lainnya</div>
                            </td>
                          </tr>
<%
   long cntr= 1;
   long jmlIslam=0,jmlKristen=0,jmlKatolik=0,jmlHindu=0,jmlBudha=0,jmlLainnya=0;
   long pddkrow=0;
long total=0;

   for(int i=0;i<vData.size();i++)
   {
       AgamaInfo obj = (AgamaInfo)vData.elementAt(i);

       jmlIslam = jmlIslam + Long.parseLong(obj.getJmlIslam().trim());

       jmlKristen = jmlKristen + Long.parseLong(obj.getJmlKristen().trim());
       jmlKatolik = jmlKatolik + Long.parseLong(obj.getJmlKatolik().trim());
       jmlHindu = jmlHindu + Long.parseLong(obj.getJmlHindu().trim());
       jmlBudha = jmlBudha + Long.parseLong(obj.getJmlBudha().trim());
       jmlLainnya = jmlLainnya + Long.parseLong(obj.getJmlLainnya().trim());
pddkrow=Long.parseLong(obj.getJmlIslam().trim()) +
Long.parseLong(obj.getJmlKristen().trim())
+Long.parseLong(obj.getJmlKatolik().trim())+Long.parseLong(obj.getJmlHindu().trim())
+Long.parseLong(obj.getJmlBudha().trim())+Long.parseLong(obj.getJmlLainnya().trim());

     total = total + pddkrow;
%>
                          <tr>
                            <td class="C-Field" width="17"><%=cntr%></td>
                            <td class="C-Field" width="109">
                              <div align="left"><%=obj.getNama()%></div>
                            </td>
                            <td class="C-Field" width="52">
                              <div align="center"><%=obj.getJmlIslam()%></div>
                            </td>
                            <td class="C-Field" width="64">
                              <div align="center"><%=obj.getJmlKristen()%></div>
                            </td>
                            <td class="C-Field" width="68">
                              <div align="center"><%=obj.getJmlKatolik()%></div>
                            </td>

                            <td class="C-Field" width="68">
                              <div align="center"><%=obj.getJmlHindu()%></div>
                            </td>

                            <td class="C-Field" width="64">
                              <div align="center"><%=obj.getJmlBudha()%></div>
                            </td>
                            <td class="C-Field" width="64">
                              <div align="center"><%=obj.getJmlLainnya()%></div>
                            </td>
                            <td class="C-Field" width="64">
                              <div align="center"><%=pddkrow%></div>
                            </td>
                          </tr>
<%         cntr++;
       }
%>
                          <tr>
                            <td class="C-Field" colspan="2" height="15">
                              <div align="left"><%=strb%></div>
                            </td>
                            <td class="C-Field" width="52" height="15">
                              <div align="center"><b><%=jmlIslam%></b></div>
                            </td>
                            <td class="C-Field" width="64" height="15">
                              <div align="center"><b><%=jmlKristen%></b></div>
                            </td>
                            <td class="C-Field" width="68" height="15">
                              <div align="center"><b><%=jmlKatolik%></b></div>
                            </td>
                            <td class="C-Field" width="64" height="15">
                              <div align="center"><b><%=jmlHindu%></b></div>
                            </td>

                            <td class="C-Field" width="64" height="15">
                              <div align="center"><b><%=jmlBudha%></b></div>
                            </td>
                            <td class="C-Field" width="64" height="15">
                              <div align="center"><b><%=jmlLainnya%></b></div>
                            </td>
                            <td class="C-Field" width="64" height="15">
                              <div align="center"><b><%=total%></b></div>
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
</BODY></HTML>
<%}
 }
else
{
response.sendRedirect("index.jsp");
}
}
catch(Exception e)
{
   e.printStackTrace();
}

%>
