<%@page import="com.db.connection.ServiceController,java.util.Vector,jmlpddk.paspor.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%!
    UserInfo1 record = null;
String nprop,nkab,nkec,nkel,naprop,nakab,nakec;
Vector result;
String str,strb;
JmlPddkPemilikPaspor jmlPddkObj=null;
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
         if (confirm("Apakah benar Jumlah Penduduk Menurut Kepemilikan Paspor ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=4";
              window.close();
          }
    }

}
</script>
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<p>&nbsp;</p>
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
                                Penduduk Menurut Kepemilikan Paspor</span></div>
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
                    <tr>
                      <td width="0%">&nbsp;</td>
                      <td valign="middle" align="center" width="100%">
                        <table border="0" cellspacing="1" cellpadding="3" class="C-BG" width="100%">
                          <tr>
                            <td class="C-Fonts" rowspan="2" width="20">
                              <div align="center"> No</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="126">
                              <div align="center"><%=str%></div>
                            </td>
                            <td class="C-Fonts" colspan="2">
                              <div align="center">Kepemilikan Paspor (jiwa)</div>
                            </td>
                            <td class="C-Fonts" rowspan="2" width="75">
                              <div align="center">Jumlah Penduduk</div>
                              <div align="center">(jiwa)</div>
                            </td>
                          </tr>
                          <tr>
                            <td class="C-Fonts" width="101">
                              <div align="center">Ada</div>
                            </td>
                            <td class="C-Fonts" width="82">
                              <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Tidak Ada</span></div>
                            </td>
                          </tr>
<%
long cntr=1;
long totada=0;
long tottada= 0;
long total=0;
long totalrow=0;
JmlPddkPemilikPaspor jmlPddkObj = null;
Vector vData = new Vector();
         ServiceController statelessController = ServiceController.getInstance();
         JmlPddkPemilikPasporHome home = (JmlPddkPemilikPasporHome)statelessController.lookup("JmlPddkPemilikPasporBean", JmlPddkPemilikPasporHome.class);

         jmlPddkObj = home.create();
         vData = jmlPddkObj.getDataPenduduk(nprop, nkab, nkec);

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
for(int i=0;i<vData.size();i++)
  {
totalrow=(Long.parseLong(((PasporObject)vData.elementAt(i)).getPaspor_ada()) +  Long.parseLong(((PasporObject)vData.elementAt(i) ).getPaspor_tada()));
total=total+totalrow;
totada=totada+Long.parseLong(((PasporObject)vData.elementAt(i)).getPaspor_ada());
tottada=tottada+Long.parseLong(((PasporObject)vData.elementAt(i)).getPaspor_tada());
%>
                          <tr>
                            <td class="C-Field" width="20">
<div align="center">
<%=cntr%>
</div>
</td>
                            <td class="C-Field" width="126">
                              <div align="left"><%=((PasporObject)vData.elementAt(i) ).getNama_kab()%></div>
                            </td>
                            <td class="C-Field" width="101">
                              <div align="center"><%=((PasporObject)vData.elementAt(i) ).getPaspor_tada()%></div>
                            </td>
                            <td class="C-Field" width="82">
                              <div align="center"><%=((PasporObject)vData.elementAt(i)).getPaspor_ada()%></div>
                            </td>
                            <td class="C-Field" width="75">
                              <div align="center"><%=totalrow%></div>
                            </td>
                          </tr>
<%          cntr++;

        }
%>
                          <tr>
                            <td class="C-Field" colspan="2" height="15">
                              <div align="center"><%=strb%></div>
                            </td>
                            <td class="C-Field" width="101" height="15">
                              <div align="center"><%=tottada%></div>
                            </td>
                            <td class="C-Field" width="82" height="15">
                              <div align="center"><%=totada%></div>
                            </td>
                            <td class="C-Field" width="75" height="15">
                              <div align="center"><%=total%></div>
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
<%
}
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
finally
{
}
%>
