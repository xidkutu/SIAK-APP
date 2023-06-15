<%@ page language="java" import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*,com.pkrjn.Pkrjn"%>
<%@ include file="Global.jsp"%>

<%
UserInfo1 record1=null;
ServiceController factory=null;
List_WilayahHome home=null;
List_Wilayah remote=null;
GetPekerjaan record=null;
String nprop="",nkab="",nkec="",nkel="",naprop="",nakab="",nakec="";
Hashtable  result=null;
String str="",strb="";
Vector vt_wil=null;
Vector vt_pkrjn=null;
Pkrjn pkr=null;
ListProp pobj=null;
ListKab pkab=null;
ListKec pkec=null;
ListKel pkel=null;
String flag="";
String jum_pddk="";
%>

<%
try
  {
     record1=(UserInfo1)session.getAttribute("remoteRef");

 if(record1 != null)
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
vt_wil=getKabupatenList(nprop);
flag="kb";
}
else if(nkec.trim().equals(""))
{
str="Kecamatan";
strb="Jumlah per Kabupaten";
vt_wil=getKecamatanList(nprop,nkab);
flag="kc";
}
else
{
str="Desa/Kelurahan";
strb="Jumlah per Kecamatan";
vt_wil=getKelurahanList(nprop,nkab,nkec);
flag="kl";
}
vt_pkrjn=getPkrjn();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
//document.oncontextmenu=new Function("return false");
function printKTP(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Jumlah Penduduk Menurut Jenis Pekerjaan ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              window.print();
              window.opener.location="pilihwilayah?route=true&level=3&screen_code=1";
              window.close();
          }
    }
}
</script>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
<table align="center"><tr align="center"><td align="center">
<div align="center"><b>
<input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printKTP(this)">
</b></div></td><td>
<div align="center"><b>
<input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
</b></div></td></tr></table>
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
                                Penduduk Menurut Jenis Pekerjaan</span></div>
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
<b><td>
<%if((nkab!=null) && !nkab.trim().equals(""))
{
%>
<%=nakab.toString().toUpperCase()%>
<%
}
else
out.println("-");
%>
</td></b>
                                </tr>
                                <tr>
                                  <td>KECAMATAN</td>
                                  <td>:</td>
<b><td>
<%if((nkec!=null) && !nkec.trim().equals(""))
{
%>
<%=nakec.toString().toUpperCase()%>
<%
}
else
out.println("-");
%>
</td></b>
                                </tr>

                                <tr>
                                 <td width="40%">
                                   Tanggal
                                  </td>
                                 <td width="2%">:</td>
                                      <b><td><%=record1.getToday()%>
                                 </td>
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
<table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
<tr>
<td width="0%"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
<td width="100%"><img src="images/dot.gif" width="1" height="1"></td>
<td width="0%"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
</tr>
<%
factory=ServiceController.getInstance();
home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
remote = home.create();
result=remote.getTotPekerj(nprop,nkab,nkec,"","");

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
<td class="C-Fonts" rowspan="2" width="17">
<div align="center"> No</div>
</td>
<td class="C-Fonts" rowspan="2" width="109">
<div align="center">Pekerjaan</div>
</td>
<td class="C-Fonts" colspan="<%=vt_wil.size()%>">
<div align="center"><%=str%></div>
</td>
<td class="C-Fonts" rowspan="2" width="64">
<div align="center">Jumlah Penduduk</div>
                              <div align="center">(jiwa)</div>
</td>
                          </tr>
                          <tr>
<%
String no_wil="";
String nama_wil="";
for(int i=0;i<vt_wil.size();i++)
{
if (flag.equals("kb"))
{
pkab=(ListKab)vt_wil.elementAt(i);
no_wil=pkab.getNo_kab();
nama_wil=pkab.getNama_kab();
}
							else if (flag.equals("kc"))

							{
							pkec=(ListKec)vt_wil.elementAt(i);
							no_wil=pkec.getNo_kec();
							nama_wil=pkec.getNama_kec();
							}
							else if(flag.equals("kl"))
							{
							pkel=(ListKel)vt_wil.elementAt(i);
							no_wil=pkel.getNo_kel();
							nama_wil=pkel.getNama_kel();
							}
							%>
                            <td class="C-Fonts">
                              <%=nama_wil%>
                            </td>
							<%
							   }
							%>
                          </tr>
<%
String no_pkr="";
String nama_pkr="";
int cntr=1;
long sub_tot=0;
for (int j=0;j<vt_pkrjn.size();j++)
	{
	   sub_tot=0;
		pkr= (Pkrjn) vt_pkrjn.elementAt(j);
		no_pkr=pkr.getNo();
		nama_pkr=pkr.getDescrip();
%>
                        <tr>
                            <td class="C-Field" width="17"><%=cntr++%></td>
                            <td class="C-Field" width="109">
                              <div align="left"><%=nama_pkr%></div>
                            </td>
<%
Hashtable child=null;
String angka="0";
int k=0;
pkab=null;
pkec=null;
pkel=null;

for (k=0;k<vt_wil.size();k++)
{
angka="0";
no_wil="";
if (flag.equals("kb"))
{
pkab=(ListKab)vt_wil.elementAt(k);
no_wil=pkab.getNo_kab();
}
else if (flag.equals("kc"))
{
pkec=(ListKec)vt_wil.elementAt(k);
no_wil=pkec.getNo_kec();
}
else if (flag.equals("kl"))
{
pkel=(ListKel)vt_wil.elementAt(k);
no_wil=pkel.getNo_kel();
}
try{
String cnt=(no_wil.trim()+no_pkr.trim()).trim();
if  (result.get(cnt)!=null) angka=(String)result.get(cnt);
}
catch(Exception erp)
{
System.out.println(erp);
angka="0";
}
%>
<td class="C-Field">
<%=angka%>
<%
sub_tot=sub_tot+Long.parseLong(angka);
%>
</td>
<%
}
%>
<td class="C-Field">
<%=sub_tot%>
</td>
</tr>
<%
}
%>
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
catch(Exception jps)
{
jps.printStackTrace();
System.out.print("Error in Jml_Pddk_Pekerjaan_Tamp.jsp =" + jps.toString());
}
finally
{
remote.remove();
}
%>
