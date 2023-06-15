<%@page import="com.db.connection.ServiceController,java.util.*,biodata.wna.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>

<%!
    UserInfo1 record = null;
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");

 if(record != null)
 {
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<% String statusCetak = request.getParameter("radiobutton");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equalsIgnoreCase("Penggantian"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=cetak_biodata_WNA_Lamp.jsp";
              } else {
                self.close();
              }

         </script>
   <%
   } else {

   %>
--%>
<% {
  %>
<html>
<head>
<title>Biodata WNA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
</head>
<script language="javascript">
  document.oncontextmenu=new Function("return false")
function printBiodata(obj)
{
     if (window.print)
     {
          if (confirm("Apakah benar Biodata ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
            window.print();
            window.opener.location="cetak_biodata_WNA.jsp?update=ok&radiobutton=Ulang&param_nik="+document.all["param_nik"].value;
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
<%
       String nama_pej = request.getParameter("nama_pej");
       String nip_pej = request.getParameter("nip_pej");
       String jabatan = request.getParameter("jabatan");
       String nama_kab = request.getParameter("nama_kab");

       String radiobutton = request.getParameter("radiobutton");
       String cb = request.getParameter("cb");

      String param_nik = "";
      Vector vNik = new Vector();

    StringTokenizer st = new StringTokenizer(cb, "|");
    String token = "";

System.out.println("CB view_cetak_biodata_WNA="+cb);
     while (st.hasMoreTokens())
     {
         token = st.nextToken();
         vNik.addElement(token);

        param_nik = param_nik +"|" +token;

      }
     param_nik = param_nik.substring(1);
     int totalPage = vNik.size();
%>

<body bgcolor="#FFFFFF" text="#000000" onKeyDown="alert('Please use the print button')" onload="window.history.forward(1)">
<form name="form1" method="post" action="">
<table width="400" border="0" cellspacing="1" cellpadding="0" align="center">
<tr>
   <td>
      <div align="center">
           <input class="boxstandard" type="button" name="Print" value="Print" onclick="printBiodata(this);">
           <input class="boxstandard" type="button" name="close" value="Close" onclick="window.close();;">
           <input type="hidden" name="totalpage" value=<%=totalPage%>>
           <input type="hidden" name="param_nik" value="<%=param_nik%>">
      </div>
   </td>
</tr>
</table>
<%
          ViewBiodataWNA view = null;
try
{
          ServiceController statefulController = ServiceController.getInstance();
          ViewBiodataWNAHome home = (ViewBiodataWNAHome)statefulController.lookup("ViewBiodataWNA", ViewBiodataWNAHome.class);
          view = home.create();
          Vector vData=null;
          vData=view.retrieveData(vNik);

for(int i =0;i<vData.size();i++)
{
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative;media:printer" onClick="zoom(this.id)">

  <p>&nbsp;</p>
  <table width="100" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor="#2A1F55" bordercolor="#2A3F00">
    <tr>
      <td bgcolor="#FFFFFF" valign="top">
          <table width="100" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
            <tr>
            <td>&nbsp;</td>
            <td valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                      <table width="603" border="0" cellspacing="3" cellpadding="1" align="center">
                        <tr>
                        <td height="50">
                            <table width="35%" border="0" cellspacing="2" cellpadding="0">
                              <tr>
                                <td width="16%" nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>NO.KK
								                    (<i>Family Card Number</i>)</b></font></td>
                                <td width="5%">:</td>
                                <td width="79%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
								<b><%=((BiodataWNAObject)vData.elementAt(i)).getNo_kk()%></b></font></td>
                              </tr>
                              <tr>
                                <td width="16%">
                                  <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>NIK</b>
								  </font></div>
                                </td>
                                <td width="5%">
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">:</font></div>
                                </td>
                                <td width="79%">
                                  <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><%=vNik.elementAt(i)%></b>
								  </font></div>
                                </td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="50">
                          <div align="center"><img border="0" src="images/Garuda.gif" width="70" height="80"></div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                              <td>
                                <div align="center"><u><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">BIODATA
                                  PENDUDUK WARGA NEGARA ASING</font></b></u></div>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="5" cellpadding="0">
                              <tr>
                                <td colspan="2">
                                  <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>DATA
                                    PERSONAL</b></font></div>
                                </td>
                                <td width="2%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">1.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Keluarga <i>(Family Name)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=" "+((BiodataWNAObject)vData.elementAt(i)).getNama_klrga()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">2.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Pertama <i>(First Name)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=" "+((BiodataWNAObject)vData.elementAt(i)).getNama_pertma()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">3.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Jenis
                                  Kelamin<i> (Sex)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=" "+((BiodataWNAObject)vData.elementAt(i)).getJenis_klmin()%></font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">4.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tempat/Tanggal
                                  Lahir <i>(Place of Date Birth)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTmpt_lhr()+", "+((BiodataWNAObject)vData.elementAt(i)).getTgl_lhr()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">5.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Kewarganegaraan
                                  <i>(Nationality) </i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getKwrngrn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">6.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Agama
                                  <i>(Religion) </i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getAgama()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">7.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Golongan
                                  Darah<i> (Blood group)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getGol_drh()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">8.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Pendidikan
                                  Akhir <i>(Last Education)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getPddk_akh()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">9.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Jenis
                                  Pekerjaan<i> (Occupation)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getJenis_pkrjn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">10.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Status
                                  Perkawinan <i>(Marrital status)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getStat_kwn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">11.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Kepala Keluarga <i>(Head of Family)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getNama_kep()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">12.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                  Alamat Tempat Tinggal <i>(Address)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                  <%=((BiodataWNAObject)vData.elementAt(i)).getAlamat()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">&nbsp;</td>
                                <td width="55%">&nbsp;</td>
                                <td width="2%">&nbsp;</td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">RT.<%=((BiodataWNAObject)vData.elementAt(i)).getno_rt()%>&nbsp;RW.<%=((BiodataWNAObject)vData.elementAt(i)).getno_rw()%>&nbsp;
                                  Dusun&nbsp;<%=((BiodataWNAObject)vData.elementAt(i)).getdusun()%></font></td>
                              </tr>
                              <tr>
                                <td width="3%">&nbsp;</td>
                                <td width="55%">&nbsp;</td>
                                <td width="2%">&nbsp;</td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Kel/Desa
                                  &nbsp;<%=((BiodataWNAObject)vData.elementAt(i)).getnama_kel()%>&nbsp;
                                  Kec.<%=((BiodataWNAObject)vData.elementAt(i)).getnama_kec()%></font></td>
                              </tr>
                              <tr>
                                <td width="3%">&nbsp;</td>
                                <td width="55%">&nbsp;</td>
                                <td width="2%">&nbsp;</td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Kab/Kota&nbsp;<%=((BiodataWNAObject)vData.elementAt(i)).getnama_kab()%>&nbsp;Prov.<%=((BiodataWNAObject)vData.elementAt(i)).getnama_prop()%></font></td>
                              </tr>
                              <tr>
                                <td width="3%">&nbsp;</td>
                                <td width="55%">&nbsp;</td>
                                <td width="2%">&nbsp;</td>
                                <td width="40%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Kode Pos <%=((BiodataWNAObject)vData.elementAt(i)).getkodepos()%>&nbsp;Telp.<%=((BiodataWNAObject)vData.elementAt(i)).gettelp()%></font></td>
                              </tr>
                              <tr>
                                <td colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1"><font size="1"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></font></font></font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                              </tr>
                              <tr>
                                <td colspan="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>DATA
                                  KEIMIGRASIAN/IMMIGRATION DATA</b></font></b></td>
                                <td width="2%">
                                  <div align="center"><font size="1"><font size="1"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></font></font></font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">13.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Datang
                                  dari <i>(Coming From)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getDatng_dari()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">14.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tujuan
                                  Kedatangan <span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">(<i>Purposed
                                  Visit</i>)</span></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTujuan_dtng()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">15.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">No.
                                  Paspor <i>(Passport Number)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getNo_paspor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">16.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tgl.
                                  Paspor <i>(Passport Issue)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTgl_paspor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">17.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tgl.
                                  Berakhir Paspor <span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">(<i>Date
                                  of Expire</i>) </span> </font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTgl_akh_paspor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">18.</font></div>
                                </td>
                                <td width="55%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Sponsor (<i>Sponsor Name</i>)</font></span></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getNama_spsor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">19.</font></div>
                                </td>
                                <td width="55%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tipe
                                  Sponsor <i>(Type of Sponsor)</i></font></span></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTipe_spsor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">20.</font></div>
                                </td>
                                <td width="55%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Alamat
                                  Sponsor <i>(Sponsor Address)</i></font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getAlamat_spsor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">21.</font></div>
                                </td>
                                <td width="55%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">No.
                                  KITAP (<i>Register Number</i>)</font></span></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getNo_dok()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">22.</font></div>
                                </td>
                                <td width="55%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tempat
                                  Diterbitkan KITAP (<i>Place of KITAP Issue</i>)</font></span></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTmpt_dtbit()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">23.</font></div>
                                </td>
                                <td width="55%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tgl.
                                  Penerbitan KITAP (<i>Date of KITAP Issue</i>)</font></span></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTgl_dtbit()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">24.</font></div>
                                </td>
                                <td width="55%"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tgl.
                                  Berakhir KITAP (<i>Date of KITAP Expire</i>)</font>
                                  </span></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getTgl_akh_dok()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="3%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">25.</font></div>
                                </td>
                                <td width="55%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span lang="EN-GB" style="mso-bidi-font-size: 12.0pt; mso-fareast-font-family: Times New Roman; mso-bidi-font-family: Times New Roman; mso-ansi-language: EN-GB; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">No.
                                  STLD (<i>Police Report Number</i>) </span> </font></td>
                                <td width="2%">
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                                </td>
                                <td width="40%"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=((BiodataWNAObject)vData.elementAt(i)).getNo_stld()%>&nbsp;</font></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="52%">
                            <table width="100%" border="0" cellspacing="5" cellpadding="0">
                              <tr>
                                <td>
                                  <table width="100%" border="0" cellspacing="2" cellpadding="0">
                                    <tr>
                                      <td>
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Yang
                                          Bersangkutan,</b></font></div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td height="65">
                                  <p><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="1"></font></font></font></p>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                    <u><%=((BiodataWNAObject)vData.elementAt(i)).getNama_pertma()%>&nbsp;<%=((BiodataWNAObject)vData.elementAt(i)).getNama_klrga()%></u>
                                    </font> </div>
                                </td>
                            </table>
                        </td>
                        <td width="48%">
                            <table width="100%" border="0" cellspacing="5" cellpadding="0">
                              <tr>
                                <td>
                                  <table width="100%" border="0" cellspacing="2" cellpadding="0">
                                    <tr>
                                      <td>
                                        <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=nama_kab%>,
                                          <%=((BiodataWNAObject)vData.elementAt(i)).getSys_tgl()%></font></div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div align="center">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><%=jabatan%>
                                      </b></font></p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                  </div>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                    <u><%=nama_pej%></u></font></div>
                                  <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">NIP.
                                    <%=nip_pej%></font></div>
                                </td>
                              </tr>
                              <tr>
                                <td><font face="Verdana, Arial, Helvetica, sans-serif" size="1"></font></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
</table>
</div>
<%if (i<(vData.size()-1))
{
%>
<p style="page-break-before:always">&nbsp; </p>
<%
}
%>
<%   }
}
catch(Exception e)
{
    e.printStackTrace();
}
finally
{
    view.remove();
}
%>
</form>
</body>
</html>
<%}
 }
else
{
response.sendRedirect("index.jsp");
}
%>
