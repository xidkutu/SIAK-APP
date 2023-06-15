<%@page import="com.db.connection.ServiceController,viewbiodata.*,java.util.*,biodata.*"%>
<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*"%>
<%@ include file="Global.jsp"%>
<%@ include file="CommonFile.jsp"%>
<%!
    String selidx="";
%>

<%
if (session.getAttribute("remoteRef")!=null)
{
%>
<%--
<%@include file="CommonOtorisasi.jsp"%>
<% String statusCetak = request.getParameter("radiobutton");
   System.out.println("statusCetak="+statusCetak);
   if ( (!authorized) && (statusCetak.equalsIgnoreCase("ULANG"))) {
         //otorisasi dialog?
         %>
         <script language="JavaScript">
            if (confirm("Anda belum diotorisasi untuk melakukan cetak ulang, Lakukan Otorisasi?")) {
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=view_cetak_biodata_WNI.jsp";
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
<title>Tampilan Biodata</title>
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
          if (confirm("Apakah benar Biodata P4B ini akan dicetak ?"))
          {
             obj.style.visibility='hidden';
             document.form1.close.style.visibility='hidden';

            for(i=0;i<document.all.totalpage.value;i++)
            {
               document.all['divZoom'+i].style.zoom="100%";
            }
            window.print();
                if (window.opener.document.all['idnxt'])
                   {
          window.opener.document.all['idnxt'].removeNode(true);
          window.opener.document.all['idprv'].removeNode(true);
          window.opener.document.all['prog'].style.visibility="visible";
                   }
            window.opener.location="cetak_biodata_WNI.jsp?update=ok&radiobutton=Baru&param_nik="+document.all["param_nik"].value + "&no_kel=" + document.all['no_kel'].value + "&selidx=" + document.all['selidx'].value + "&action=EXEC&cursor=none&max_row=6";
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
       String nama_kec = request.getParameter("nama_kec");
       no_kel=request.getParameter("no_kel");
       selidx=request.getParameter("selidx");
       String radiobutton = request.getParameter("radiobutton");
       String cb = request.getParameter("cb");
       Vector vNik =null;
      vNik=getParseData(cb,"|");
%>

<body bgcolor="#FFFFFF" text="#000000" onKeyDown="alert('Please use the print button')" onload="window.history.forward(1)">
<form name="form1" method="post" action="">
<input type="hidden" name="param_nik" value="<%=cb%>">
<input type="hidden" name="no_kel" value="<%=no_kel%>">
<input type="hidden" name="selidx" value="<%=selidx%>">
<table width="400" border="0" cellspacing="1" cellpadding="0" align="center">
<tr>
   <td>
      <div align="center">
           <input type="button" class="boxstandard" name="Print" value="Print" onclick="printBiodata(this);">
           <input type="button" class="boxstandard" name="close" value="Close" onclick="window.close();;">
      </div>
   </td>
</tr>
</table>
<%
          int totalPage = vNik.size();
          ViewCetakBiodata view = null;
%>
<%
try
{

          ServiceController statefulController = ServiceController.getInstance();
          ViewCetakBiodataHome home = (ViewCetakBiodataHome)statefulController.lookup("ViewCetakBiodata", ViewCetakBiodataHome.class);
          view = home.create();
          Vector vData = view.retrieveData(vNik);
 for(int i =0;i<vData.size();i++)
{
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative;media:printer" onClick="zoom(this.id)">
    <table width="605" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td bgcolor="#FFFFFF" valign="top" height="600">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
            <tr>
            <td>&nbsp;</td>
            <td valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                      <table width="600" border="0" cellspacing="2" cellpadding="0" align="center">
                        <tr>
                        <td height="50">
                            <table width="100%" border="0" cellspacing="1" cellpadding="0">
                              <tr>
                                <td width="8%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>No.
                                  KK</b></font></td>
                                <td width="3%"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">:</font></div></td>
                                <td width="89%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><%=((BiodataWNIObject)vData.elementAt(i)).getNo_kk()%></b></font></td>
                              </tr>
                              <tr>
                                <td width="8%">
                                  <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>NIK</b></font></div>
                                </td>
                                <td width="3%">
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">:</font></div>
                                </td>
                                <td width="89%">
                                  <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><%=vNik.elementAt(i).toString().trim()%></b></font></div>
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
                                    PENDUDUK WARGA NEGARA INDONESIA</font></b></u></div>
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
                            <table width="100%" border="0" cellspacing="2" cellpadding="0">
                              <tr>
                                <td colspan="2">
                                  <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>DATA
                                    PERSONAL</b></font></div>
                                </td>
                                <td width="4%">&nbsp;</td>
                                <td width="48%">&nbsp;</td>
                              </tr>

                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">1.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Lengkap</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNama_lgkp()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">2.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tempat
                                  Lahir</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getTmpt_lhr()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">3.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tanggal
                                  Lahir</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getTgl_lhr()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">4.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Jenis
                                  Kelamin</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getJenis_klmin()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">5.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Golongan
                                  Darah</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getGol_drh()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">6.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Agama</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getAgama()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">7.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Pendidikan
                                  Akhir</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getPddk_akh()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">8.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Jenis
                                  Pekerjaan</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getJenis_pkrjn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">9.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Penyandang
                                  Cacat</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getPnydng_cct()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">10.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Status
                                  Perkawinan</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getStat_kwn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">11.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Status
                                  Hubungan Dalam Keluarga</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getStat_hbkel()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">12.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">NIK
                                  Ibu</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNik_ibu()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">13.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Ibu</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                  <%=((BiodataWNIObject)vData.elementAt(i)).getNama_lgkp_ibu()%></font>
                                </td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">14.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">NIK
                                  Ayah</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNik_ayah()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">15.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nama
                                  Ayah</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNama_lgkp_ayah()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">16.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Alamat
                                  Sebelumnya</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getTmpt_sbl()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">17.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Alamat
                                  Sekarang</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getAlamat()%>&nbsp;
                                  </font></td>
                              </tr>
                              <tr>
                                <td width="7%">&nbsp;</td>
                                <td width="41%">&nbsp;</td>
                                <td width="4%">&nbsp;</td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">RT.<%=((BiodataWNIObject)vData.elementAt(i)).getNoRt()%>
                                  RW.<%=((BiodataWNIObject)vData.elementAt(i)).getNoRw()%>&nbsp;
                                  Dusun&nbsp;<%=((BiodataWNIObject)vData.elementAt(i)).getDusun()%>
                                  </font></td>
                              </tr>
                              <tr>
                                <td width="7%">&nbsp;</td>
                                <td width="41%">&nbsp;</td>
                                <td width="4%">
                                  <div align="center"></div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Kel/Desa
                                  &nbsp;<%=((BiodataWNIObject)vData.elementAt(i)).getNamaKel()%>&nbsp;
                                  Kec.<%=((BiodataWNIObject)vData.elementAt(i)).getNamaKec()%></font></td>
                              </tr>
                              <tr>
                                <td width="7%">&nbsp;</td>
                                <td width="41%">&nbsp;</td>
                                <td width="4%">
                                  <div align="center"></div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Kab/Kota&nbsp;<%=((BiodataWNIObject)vData.elementAt(i)).getNamaKab()%>&nbsp;
                                  Prov.<%=((BiodataWNIObject)vData.elementAt(i)).getNamaProp()%>
                                  </font></td>
                              </tr>
                              <tr>
                                <td width="7%">&nbsp;</td>
                                <td width="41%">&nbsp;</td>
                                <td width="4%">&nbsp;</td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Kode
                                  Pos <%=((BiodataWNIObject)vData.elementAt(i)).getKodepos()%>&nbsp;
                                  Telp.<%=((BiodataWNIObject)vData.elementAt(i)).getTelp()%></font></td>
                              </tr>
                              <tr>
                                <td colspan="2">&nbsp;</td>
                                <td width="4%">&nbsp;</td>
                                <td width="48%">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">DATA
                                  KEPIMILIKAN DOKUMEN LAINNYA</font></b></td>
                                <td width="4%">
                                  <div align="center"></div>
                                </td>
                                <td width="48%">&nbsp;</td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">18.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Nomor
                                  Paspor</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNo_paspor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">19.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tanggal
                                  Berakhir Paspor</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getTgl_akh_paspor()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">20.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">No.
                                  Akta/Surat Kenal Lahir</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNo_akta_lhr()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">21.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">No
                                  Akta Perkawinan/Buku Nikah</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNo_akta_kwn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">22.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tanggal
                                  Perkawinan</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getTgl_kwn()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">23.</font></div>
                                </td>
                                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">No.
                                  Akta Perceraian/Surat Cerai</font></td>
                                <td width="4%">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getNo_akta_cerai()%>&nbsp;</font></td>
                              </tr>
                              <tr>
                                <td width="7%" height="2">
                                  <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">24.</font></div>
                                </td>
                                <td width="41%" height="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Tanggal
                                  Perceraian</font></td>
                                <td width="4%" height="2">
                                  <div align="center">:</div>
                                </td>
                                <td width="48%" height="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=((BiodataWNIObject)vData.elementAt(i)).getTgl_cerai()%>&nbsp;</font></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                          <td width="51%" height="160">
                            <table width="100%" border="0" cellspacing="2" cellpadding="0" align="center">
                              <tr>
                                <td>
                                  <table width="100%" border="0" cellspacing="2" cellpadding="0">
                                    <tr>
                                      <td>
                                        <div align="center"></div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td height="80">
                                  <div align="center">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Yang Bersangkutan,</b></font></p>
                                                                 </div>
																 <p>&nbsp;</p>
																 <p>&nbsp;</p>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                    <u><%=((BiodataWNIObject)vData.elementAt(i)).getNama_lgkp()%></u></font></div>
                                  <div align="center"></div>
                                </td>
                              </tr>
                            </table>
                          </td>
                          <td width="49%" height="160">
                            <table width="100%" border="0" cellspacing="2" cellpadding="0" align="center">
                              <tr>
                                <td>
                                  <table width="100%" border="0" cellspacing="2" cellpadding="0">
                                    <tr>
                                      <td>
                                        <div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">
                                          <%=nama_kec%>
                                          , <%=((BiodataWNIObject)vData.elementAt(i)).getSystgl()%>
                                          </font></div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td height="80">
                                  <div align="center">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                           <b><%=jabatan%></b></font></p>
                                                                </div>
																<p>&nbsp;</p><p>&nbsp;</p>
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
 <input type="hidden" name="totalpage" value=<%=totalPage%>>
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
