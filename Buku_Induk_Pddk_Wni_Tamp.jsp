<%@ page language="java" import="java.util.*,laporan.*,com.db.connection.ServiceController,pendaftaran.*"%>
<%@ include file="Global.jsp"%>
<%
ServiceController factory;
List_WilayahHome home;
List_Wilayah remoteList_Wilayah;
GetPenduduk recordGetPenduduk;
String Sys_Date;
UserInfo1 record = null;

try {
   record=(UserInfo1)session.getAttribute("remoteRef");
   if(record != null) {
      Sys_Date=record.getToday(); //request.getParameter("sysdate");
      nprop = (request.getParameter("nprop")==null?"0":request.getParameter("nprop"));
      naprop = (request.getParameter("naprop")==null?"-":request.getParameter("naprop"));
      nkab = (request.getParameter("nkab")==null?"0":request.getParameter("nkab"));
      nakab = (request.getParameter("nakab")==null?"-":request.getParameter("nakab"));
      nkec = (request.getParameter("nkec")==null?"0":request.getParameter("nkec"));
      nakec = (request.getParameter("nakec")==null?"-":request.getParameter("nakec"));
      nkel = (request.getParameter("nkel")==null?"0":request.getParameter("nkel"));
      nakel = (request.getParameter("nakel")==null?"-":request.getParameter("nakel"));

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
         if (confirm("Apakah benar Buku Induk Penduduk ini akan dicetak ?"))
          {
              obj.style.visibility='hidden';
              document.all['Cet'].style.visibility='hidden';
              document.all['KEL'].style.visibility='hidden';
              zoomall();
              window.print();
              window.opener.location="pilihwilayah?route=true&level=4&screen_code=12";
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
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#FFFFFF text="#000000" onLoad="window.history.forward(1)">
  <table align="center">
           <tr align="center">

           <td align="center" >
                   <div align="center"><b>
             <input class=boxstandard type=hidden  name="Cet" value="CETAK" onClick="printPage(this)">
                 </b></div>
           </td>
            <td>
                <div align="center"><b>
            <input class=boxstandard type=hidden value=KELUAR onClick="window.close()" name="KEL">
              </b></div>
           </td>
           </tr>
  </table>

<table width="600" border="0" cellspacing="3" cellpadding="2" align="center">
                          <tr>
                            <td colspan="4" height="1">
                              <div align="center"><img src="images/batas_dot.gif" width="461" height="1"></div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="4" height="25">
                              <div align="center"><span class="subtitle">Buku
                                Induk Penduduk (BIP) WNI - <%=Sys_Date%></span></div>
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
                                  <td width="40%" nowrap>PROVINSI</td>
                                  <td width="2%" nowrap>:</td>
                                  <td nowrap><%=naprop%></td>
                                  <td width="20" nowrap>&nbsp;</td>
                                  <td nowrap>KABUPTEN/KOTA</td>
                                  <td nowrap>:</td>
                                  <td nowrap><%=nakab%></td>
                                </tr>
                                <tr>
                                  <td nowrap>KECAMATAN</td>
                                  <td nowrap>:</td>
                                  <td nowrap><%=nakec%></td>
                                  <td nowrap>&nbsp;</td>
                                  <td nowrap>DESA/KELURAHAN</td>
                                  <td nowrap>:</td>
                                  <td nowrap><%=nakel%></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
</table>

<%
      Vector results=new Vector();
      int tot_rec,sno,tot_page,start,end,tot_page14,rowcntr,curr_page;
      int index=0;
      factory=ServiceController.getInstance();
      home=(List_WilayahHome)factory.lookup("List_Wilayah",List_WilayahHome.class);
      remoteList_Wilayah = home.create();
      results=remoteList_Wilayah.getBukuPenWni(nprop,nkab,nkec,nkel);
      if (results==null) results = new Vector();

      if(results.isEmpty()) {
%>
         <%=printError("Data Belum Ada")%>
<%
      } else {
         tot_rec=results.size();
         sno=1;
         start=0;
         end=11;
		 curr_page=0;
//         tot_page=(int)Math.ceil((double)tot_rec/11);
         tot_page=1;
//         tot_page14=(int)Math.ceil((double)tot_rec/14);

         if (end>tot_rec) end=tot_rec;

%>


<%
         int idx = 0;
         String nokk = "",nokkbaru="";
         boolean printHeader = true;
         long kkcntr=1;
for(int cntr=1;cntr<=tot_page;cntr++) {
curr_page++;
rowcntr=0;
%>
<div id="divZoom<%=cntr%>" style="zoom:65% position:relative; top:1px; left:1px; page-break-after:always; size:11in 8.5in">
<table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" width="1200">
                    <tr>
                      <td><img src="images/v_sdt_kr_up3.gif" width="5" height="5"></td>
                      <td><img src="images/dot.gif" width="1" height="1"></td>
                      <td><img src="images/v_sdt_kn_up3.gif" width="5" height="5"></td>
                    </tr>

                    <tr>
                      <td>&nbsp;</td>
                      <td valign="middle" align="center">
              <table border="0" cellspacing="1" cellpadding="3" class="C-BGBIPWNI" width="100%">
<%
//for(index=start; index<end; index++) {
for(index=start; index<tot_rec; index++) {					//will loop 'till get all rec
recordGetPenduduk=(GetPenduduk)(results.elementAt(index));
  %>

<% //*********************HEAD
    nokk =recordGetPenduduk.getNoKk();

  if (!nokk.equals(nokkbaru))
           {
%>
<tr>
                  <td height="30" class="C-FontsBIPWNI">
                    <div align="center">NUK</div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center">Nomor KK</div>

                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center">Nama Kepala Keluarga</div>

                  </td>

                  <td class="C-FontsBIPWNI" colspan="10">
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Alamat
                      Lengkap </span></div>
                  </td>
                </tr>
                <tr bgcolor="#009999">
                  <td height="30" class="C-FieldBIPWNI"><%=kkcntr%> </td>
                  <td class="C-FieldBIPWNI" >
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB"><%=recordGetPenduduk.getNoKk()%></span></div>

                  </td>
                  <td class="C-FieldBIPWNI" >
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB"><%=recordGetPenduduk.getNamaLgkp()%></span></div>

                  </td>
                  <td class="C-FieldBIPWNI" colspan="10">
                    <div align="left"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB"><%=recordGetPenduduk.getAlamat()%>
                      </span></div>
                  </td>
                </tr>

<tr>
                  <td height="30" class="C-FontsBIPWNI">
                    <div align="center">NO.&nbsp;</div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Nama
                      Lengkap</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">NIK</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">
                      Tempat<br>
                      Lahir</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Tgl/Bln/Th<br>
                      Lahir</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB">Jenis Kelamin</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Status<br>
                      Perkawinan</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span style="mso-bidi-font-size: 12.0pt" lang="EN-GB">Agama</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Pendidikan
                      Terakhir</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Jenis<br>
                      Pekerjaan</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Gol.<br>
                      Darah</span></div>
                  </td>
                  <td class="C-FontsBIPWNI">
                    <div align="center"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt">Hub
                      dalam<br>
                      Keluarga</span></div>
                  </td>
                </tr>
<%
rowcntr=rowcntr+3;
kkcntr=kkcntr+1;
sno=1;
           }
%>
                <tr>
                  <td height="30" class="C-FieldBIPWNI">
                    <div align="right"><%=sno%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getNamaLgkp().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI">
                    <div align="left"><%=recordGetPenduduk.getNik()%></div>
                  </td>
                  <td class="C-FieldBIPWNI">
                    <div align="left"><%=recordGetPenduduk.getTmptLhr().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getTglLhr().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI">
                    <div align="left"><%=recordGetPenduduk.getJenis_Klmin().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getStat_Kwn().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getagama().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getPddk_Akh().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getJenis_Pkrjan().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI" nowrap>
                    <div align="left"><%=recordGetPenduduk.getGol_Drh().toString().toUpperCase()%></div>
                  </td>
                  <td class="C-FieldBIPWNI">
                    <div align="left"><%=recordGetPenduduk.getStat_Hbkel().toString().toUpperCase()%></div>
                  </td>
                </tr>

<%
nokkbaru =recordGetPenduduk.getNoKk();
           sno++;
		   rowcntr++;
		   // jika curr_page = 1 maka
		   if ( curr_page == 1 ) {
		   // 		jika rowcntr > 20 keluar dari loop
		   		if ( rowcntr >= 20 | !nokk.equals(nokkbaru) & rowcntr >= 18 ) break;
		   } 
		   // jika curr_page > 1 maka
		   else if ( curr_page > 1 ) {
		   //		jika rowcntr > 23 keluar dari loop
		   		if ( rowcntr >= 23 | !nokk.equals(nokkbaru) & rowcntr >= 21 ) break;
		   }
    }
         start=index+1;
            if (start>=tot_rec) start=tot_rec;
//            end=end+14;
//            tot_page=(int)Math.ceil((double)tot_rec/14);
//            if (end>tot_rec) end=tot_rec;
%>
<%
      //**********************DETAIL
%>
          </table>
</table>
<tr>
<td>         
 <div align="center">
 <br>
 <table width="100%" border="0">
   <tr>
     <td><div align="left"><em><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;&nbsp;BIP WNI - <%=Sys_Date%>, <%=naprop%> - <%=nakab%> - <%=nakec%> - <%=nakel%></font></em></div></td>
     <td><div align="right"><strong><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Halaman <%=cntr%>&nbsp;&nbsp; </font></strong></div></td>
   </tr>
 </table>
 </div>
</td>
</tr>
</table>
</div>
<%
			if (index < tot_rec) tot_page++;
            if (cntr<tot_page) {
%>
     <p style="page-break-before:auto">&nbsp; </p>
<%
/*				if (index + 1 == tot_rec) {
					tot_page--;
					System.out.println(tot_page);
%>
 	<input type="hidden" name="total_page" value="<%=tot_page%>">		
<%
					break;
				} */
            } 
         }
%>
 	<input type="hidden" name="total_page" value="<%=tot_page%>">		
<%	  
      }
   } else {
     response.sendRedirect("index.jsp");
   }
}catch(Exception e) {
   e.printStackTrace();
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
