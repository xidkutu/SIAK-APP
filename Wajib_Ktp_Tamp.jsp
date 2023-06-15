<%@ page language="java" import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%@ include file="Global.jsp"%>

<%!
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
GetWajib recordGetWajib;
String Sys_Date;
    UserInfo1 record = null;
%>
<%
try
   {
record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
{
Sys_Date=record.getToday(); //request.getParameter("sysdate");
nprop=request.getParameter("nprop");
naprop=request.getParameter("naprop");
nkab=request.getParameter("nkab");
nakab=request.getParameter("nakab");
nkec=request.getParameter("nkec");
nakec=request.getParameter("nakec");
nkel=request.getParameter("nkel");
nakel=request.getParameter("nakel");
   if (nkab.trim().equals("")) nakab="-";
   if (nkec.trim().equals("")) nakec="-";
   if (nkel.trim().equals("")) nakel="-";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language="JavaScript">
document.oncontextmenu=new Function("return false");
function printPage(obj)
{
     if (window.print)
     {
         if (confirm("Apakah benar Buku Penduduk Wajib KTP ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              zoomall();
              window.print();
              window.opener.location="pilihwilayah?route=true&level=4&screen_code=17";
              window.close();
          }
    }
}
function zoom(id)
{
    if(document.all[id].style.zoom=="50%")
    {
       document.all[id].style.zoom="100%";
    }
    else
    {
       document.all[id].style.zoom="50%";
    }
}
</script>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onload="window.history.forward(1)">
  <table align="center">
           <tr align="center">

           <td align="center" >
                   <div align="center"><b>
             <input class=boxstandard type=button  name="Cet" value="CETAK" onclick="printPage(this)">
                 </b></div>
           </td>
            <td>
                <div align="center"><b>
            <input class=boxstandard type=button value=KELUAR onClick="window.close()" name="KEL">
              </b></div>
           </td>
           </tr>
  </table>

<table width="500" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">

      <div align="center"><span class="subtitle">Jumlah Penduduk Wajib KTP<br>
        Tingkat Desa/Kelurahan</span></div>
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
                                  <td><%=naprop%></td>
                                </tr>
                                <tr>
                                  <td>KABUPTEN/KOTA</td>
                                  <td>:</td>
                                  <td><%=nakab%></td>
                                </tr>
                                <tr>
                                  <td>KECAMATAN</td>
                                  <td>:</td>
                                  <td><%=nakec%></td>
                                </tr>
                                <tr>
                                  <td>DESA/KELURAHAN</td>
                                  <td>:</td>
                                  <td><%=nakel%></td>
                                </tr>
                                <tr>
                                  <td>
                                    TANGGAL
                                  </td>
                                  <td>:</td>
                                  <td><%=Sys_Date%></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
    </table>

  <%
  Vector results=new Vector();
  int tot_rec,sno,tot_page,start,end;
   int index=0;
  factory=ServiceController.getInstance();

 home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
 remoteList_Wilayah = home.create();
  results=remoteList_Wilayah.getBukuWajib(nprop,nkab,nkec,nkel);
if(results.isEmpty())
  {
%>
<%=printError("Data Belum Ada")%>
<%
  }
 else
  {
   tot_rec=results.size();
   sno=1;
   start=0;
   end=20;
   tot_page=(int)Math.ceil((double)tot_rec/20);
   if (end>tot_rec) end=tot_rec;
%>

<input type="hidden" name="total_page" value="<%=tot_page%>">

<%
      for(int cntr=1;cntr<=tot_page;cntr++)
 	   	 {
%>
<div id="divZoom<%=cntr%>" style="<%if(tot_page==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:1px; left:1px; page-break-after:always" onClick="zoom(this.id)">
<table border="0" cellspacing="0" cellpadding="0" align="center">
              <tr>
                <td>
                </td>
              </tr>
              <tr>

      <td valign="top">
        <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="800">
          <tr>
            <td height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
            <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
            <td height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td valign="middle" align="center">
              <table border="0" cellspacing="1" cellpadding="3"  width="800" class="C-BG">
                <tr>
                  <td class="C-Fonts" width="26">
                    <div align="center">NO.&nbsp;</div>
                  </td>
                  <td class="C-Fonts" width="202">
                    <div align="center">Nama Wajib KTP</div>
                  </td>
                  <td class="C-Fonts" width="131">
                    <div align="center">NIK Wajib KTP</div>
                  </td>
                  <td class="C-Fonts" width="209">
                    <div align="center">Alamat</div>
                  </td>
                  <td class="C-Fonts" width="85">
                    <div align="center">Jenis Kelamin </div>
                    <div align="center">(Lk/Prp)</div>
                  </td>
                  <td class="C-Fonts" width="104">
                    <div align="center">Kepemilikan<br>
                      KTP SIAK<br>
                      (Sudah/Belum)</div>
                  </td>
                </tr>
<%
for(index=start; index<end; index++)
		{
recordGetWajib=(GetWajib) (results.elementAt(index));
%>
                <tr>
                  <td class="C-Field" width="26">
                    <div align="right"><%=sno%>.</div>
                  </td>
                  <td class="C-Field" width="202">
                    <div align="left"><%=recordGetWajib.getNamaLgkp().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-Field" width="131">
                    <div align="left"><%=recordGetWajib.getNik().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-Field" width="209"><%=recordGetWajib.getAlamat().toString().toUpperCase()%></td>
                  <td class="C-Field" width="85">
                    <div align="center"><%=recordGetWajib.getJenisKlmin().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-Field" width="104">
                    <div align="center"><%=recordGetWajib.getStatKtp().toString().toUpperCase()%></div>
                  </td>
                </tr>
<%
sno++;
	}
                                start=index;
                                if (start>=tot_rec) start=tot_rec;
                                end=end+20;
                                if (end>tot_rec) end=tot_rec;
%>
              </table>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="1"><img src="images/v_sdt_kr_btm3.gif" width="5" height="5"></td>
            <td height="1"><img src="images/dot.gif" width="1" height="1" hspace="1"></td>
            <td height="1"><img src="images/v_sdt_kn_btm3.gif" width="5" height="5"></td>
          </tr>
        </table>
      <tr>
<td>
 <div align="center">
 <font  face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=cntr%></font>
 </div>
</td>
</tr>
</table>
</div>
     <%
       if (cntr<tot_page)
         {
       %>
     <p style="page-break-before:auto">&nbsp; </p>
     <%
         }
         %>
<%
 	   	 }
   }
    }
    else
   {
     response.sendRedirect(record.getModRefFile());
   }
  }catch(Exception e)
   {
  //   System.out.println(e);
     response.sendRedirect(record.getModRefFile());
   }
  %>
  <script language="javascript">
   function zoomall()
      {
    for (i=1;i<=document.all["total_page"].value;i++)
    {
      document.all['divZoom'+i].style.zoom="100%";
    }
    }
  </script>
</BODY>
</HTML>
