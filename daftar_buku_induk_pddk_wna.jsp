<%@page import="com.db.connection.ServiceController,java.util.Vector,bukuinduk.pddktinggaltetap.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>

<%!
ServiceController factory;
    UserInfo1 record = null;
	BukuIndukWna view = null;
	BukuIndukWnaObject obj=null;
%>

<%
   try
   {
     record=(UserInfo1)session.getAttribute("remoteRef");

if(record != null)
	{

     nprop = request.getParameter("nprop");
     nkab = request.getParameter("nkab");
     nkec = request.getParameter("nkec");
     nkel = request.getParameter("nkel");
     naprop = request.getParameter("naprop");
     nakab = request.getParameter("nakab");
     nakec = request.getParameter("nakec");
     nakel = request.getParameter("nakel");
    String sysdate = record.getToday();
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
         if (confirm("Apakah benar Buku Induk Penduduk ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              zoomall();
              window.print();
              window.opener.location="pilihwilayah?route=true&level=4&screen_code=13";
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
<BODY leftMargin=0
topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000"  onKeyDown="alert('Please use the print button')" onload="window.history.forward(1)">
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
        <div align="center"><span class="subtitle">Buku Induk Penduduk WNA</span></div>
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
<td><%=sysdate%></td>
</tr>
</table>
</td>
</tr>
    </table>

<%
  Vector vData=new Vector();
  int tot_rec,sno,tot_page,start,end;
  int index=0;

   factory=ServiceController.getInstance();
   BukuIndukWnaHome home = (BukuIndukWnaHome)factory.lookup("BukuIndukWnaBean", BukuIndukWnaHome.class);
   view = home.create();
   vData = view.getDataBukuIndukPendudukWNA(nprop,nkab,nkec,nkel);

System.out.println("vData.size()"+vData.size());

if(vData.isEmpty())
  {
%>
<%=printError("Data Belum Ada")%>
<%
  }
 else
  {
   tot_rec=vData.size();
   sno=1;
   start=0;
   end=19;
   tot_page=(int)Math.ceil((double)tot_rec/24);

   if (end>tot_rec) end=tot_rec;

%>
<input type="hidden" name="total_page" value="<%=tot_page%>">

<%
      for(int cntr=1;cntr<=tot_page;cntr++)
 	   	 {
%>
<div id="divZoom<%=cntr%>" style="<%if(tot_page==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative; top:1px; left:1px; page-break-after:always" onClick="zoom(this.id)">

<table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA">
                      <tr>
                        <td width="5" height="5"><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                        <td height="1" width="1420"><img src="images/dot.gif" width="1" height="1"></td>
                        <td width="5" height="1"><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                      </tr>
                      <tr>
                        <td width="5">&nbsp;</td>
                        <td valign="middle" align="center" width="1420">
                          <table border="0" cellspacing="1" cellpadding="3" class="C-BG">
                            <tr>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB">No.</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Nama
                                  Lengkap</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">
                                  NIK</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Nomor
                                  KK</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Alamat
                                  Lengkap</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB">Jenis Kelamin</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Kebangsaan</span></div>
                              </td>
                              <td class="C-Fonts" colspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Dokumen
                                  Imigrasi</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Tempat<br>
                                  Lahir</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Tgl/Bln/Th<br>
                                  Lahir</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Agama</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Gol.<br>
                                  Darah</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Status<br>
                                  Perkawinan</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Jenis<br>
                                  Pekerjaan</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Hub
                                  dalam Keluarga</span></div>
                              </td>
                              <td class="C-Fonts" rowspan="2">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Pendidikan
                                  Terakhir</span></div>
                              </td>
                            </tr>

                            <tr>
                              <td class="C-Fonts">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">No.<br>
                                  Paspor</span></div>
                              </td>
                              <td class="C-Fonts">
                                <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">No.
                                  KITAP</span></div>
                              </td>
                            </tr>
<%
     for(index=start; index<end; index++)
		{
   	       obj = (BukuIndukWnaObject)vData.elementAt(index);
  %>
                            <tr>
                              <td class="C-Field"><div align="right"><%=sno%></div></td>
            <td class="C-Field" nowrap>
              <div align="left"><%=obj.getNama_pertma()%></div>
            </td>
                              <td class="C-Field"> <div align="left"><%=obj.getNik()%></div></td>
                              <td class="C-Field"> <div align="left"><%=obj.getNo_kk()%></div></td>
                              <td class="C-Field" nowrap> <div align="left"><%=obj.getAlamat()%></div></td>

            <td class="C-Field" nowrap>
              <div align="left"><%=obj.getJenis_klmin()%></div>
            </td>
                              <td class="C-Field"> <div align="left"><%=obj.getKwrngrn()%></div></td>
                              <td class="C-Field" align="center"> <div align="left"><%=obj.getNo_paspor()%></div></td>
                              <td class="C-Field" align="center"> <div align="left"><%=obj.getNo_kitap()%></div></td>
                              <td class="C-Field"> <div align="left"><%=obj.getTmpt_lhr()%></div></td>
                              <td class="C-Field"> <div align="left"><%=obj.getTgl_lhr()%></div></td>

            <td class="C-Field" nowrap>
              <div align="left"><%=obj.getAgama()%></div>
            </td>
                              <td class="C-Field"> <div align="left"><%=obj.getGol_drh()%></div></td>

            <td class="C-Field" nowrap>
              <div align="left"><%=obj.getStat_kwn()%></div>
            </td>
                              <td class="C-Field"> <div align="left"><%=obj.getJenis_pkrjn()%></div></td>
                              <td class="C-Field"> <div align="left"><%=obj.getStat_hbkel()%></div></td>
                              <td class="C-Field"> <div align="left"><%=obj.getPddk_akh()%></div></td>
                            </tr>
<%
sno++;
	}
                                start=index;
                                if (start>=tot_rec) start=tot_rec;
                                end=end+24;
                                if (end>tot_rec) end=tot_rec;
%>
</table>
</table>

<table align="center">
<tr>
<td>
 <div align="center">
 <font  face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=cntr%></font>
 </div>
</td>
</tr></table>
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
     response.sendRedirect("index.jsp");
   }
  }catch(Exception e)
   {
     response.sendRedirect("index.jsp");
   }
  %>
  <script language="javascript">
   function zoomall()
      {
    for (i=1;i<=document.all["total_page"].value;i++)
    {
      document.all['divZoom'+i].style.zoom="65%";
    }
    }
  </script>
</BODY>
</HTML>