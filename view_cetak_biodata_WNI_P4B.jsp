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
                 window.location.href= "step1.jsp?"+"<%=request.getQueryString()%>"+"&file=view_cetak_biodata_WNI_P4B.jsp";
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
<title>Tampilan Biodata P4B</title>
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
            window.opener.location="cetak_biodata_WNI_P4B.jsp?update=ok&radiobutton=Baru&param_nik="+document.all["param_nik"].value + "&no_kel=" + document.all['no_kel'].value + "&selidx=" + document.all['selidx'].value + "&action=none&cursor=none&max_row=6";
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
      Vector vNik =null ;
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
          Vector vData=null;
          vData=view.retrieveDataP4B(vNik);

 for(int i =0;i<vData.size();i++)
{
%>
<div id="divZoom<%=i%>" style="<%if(totalPage==1){%>zoom:100%<%}else{%>zoom:50%<%}%> position:relative;media:printer" onClick="zoom(this.id)">
        <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
          <tr>
            <td>&nbsp;</td>
            <td valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <table width="100%" border="0" cellspacing="2" cellpadding="0" align="center">
                      <tr>
                        <td height="26">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="8%" height="4"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">No.KK</font></td>
                              <td width="3%" height="4">
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">:</font></div>
                              </td>

                          <td width="89%" height="4"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNo_kk()%></b></font></td>
                            </tr>
                            <tr>
                              <td width="8%">
                                <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">NIK</font></div>
                              </td>
                              <td width="3%">
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">:</font></div>
                              </td>
                              <td width="89%">

                            <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><%=vNik.elementAt(i).toString().trim()%></b></font></div>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="50">
                          <div align="center"><img border="0" src="../../images/Garuda.gif" width="70" height="80"></div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                              <td >
                                <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">BIODATA
                                  PENDUDUK WARGA NEGARA INDONESIA</font></b></div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div align="center"><u><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">HASIL
                                  P4B UNTUK DIMUTAKHIRKAN</font></b></u></div>
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

                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td colspan="2" >
                            <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b >DATA
                              PERSONAL</b></font></div>
                          </td>
                          <td width="1%" ><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">1.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nama
                            Lengkap</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNama_lgkp()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">2.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Jenis
                            Kelamin</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getJenis_klmin()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">3.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Tempat
                            Lahir</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getTmpt_lhr()%></font><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">4.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Tanggal
                            Lahir</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getTgl_lhr()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">5.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Golongan
                            Darah</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getGol_drh()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">6.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Agama</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getAgama()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">7.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Status
                            Perkawinan</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getStat_kwn()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">8.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Status
                            Hubungan Dalam Keluarga</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getStat_hbkel()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">9.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kelainan
                            Fisik dan Mental</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <%String temp = null;
                                temp = ((BiodataWNIP4BObject)vData.elementAt(i)).getPnydng_cct();
                              %>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((temp==null || temp.trim().length()<2)?"TIDAK ADA":"ADA")%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">10.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Penyandang
                            Cacat</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getPnydng_cct()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">11.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Pendidikan
                            Akhir</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getPddk_akh()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">12.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Jenis
                            Pekerjaan</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getJenis_pkrjn()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">13.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">NIK
                            Ibu</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNik_ibu()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">14.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nama
                            Ibu</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNama_lgkp_ibu()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">15.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">NIK
                            Ayah</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNik_ayah()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">16.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nama
                            Ayah</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNama_lgkp_ayah()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">17.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Alamat
                            Sebelumnya</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getTmpt_sbl()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">18.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Alamat
                            Sekarang</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getAlamat()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >&nbsp;</td>
                          <td width="45%" >&nbsp;</td>
                          <td width="1%" >&nbsp;</td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">RT.<%=((BiodataWNIP4BObject)vData.elementAt(i)).getNoRt()%>
                            RW.<%=((BiodataWNIP4BObject)vData.elementAt(i)).getNoRw()%>&nbsp;
                            Dusun&nbsp;<%=((BiodataWNIP4BObject)vData.elementAt(i)).getDusun()%>
                            </font></td>
                        </tr>
                        <tr>
                          <td width="7%" >&nbsp;</td>
                          <td width="45%" >&nbsp;</td>
                          <td width="1%" >&nbsp;</td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kel/Desa
                            &nbsp;<%=((BiodataWNIP4BObject)vData.elementAt(i)).getNamaKel()%>&nbsp;
                            Kec.<%=((BiodataWNIP4BObject)vData.elementAt(i)).getNamaKec()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >&nbsp;</td>
                          <td width="45%" >&nbsp;</td>
                          <td width="1%" >&nbsp;</td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kab/Kota&nbsp;<%=((BiodataWNIP4BObject)vData.elementAt(i)).getNamaKab()%>&nbsp;
                            Prov.<%=((BiodataWNIP4BObject)vData.elementAt(i)).getNamaProp()%>
                            </font></td>
                        </tr>
                        <tr>
                          <td width="7%" >&nbsp;</td>
                          <td width="45%" >&nbsp;</td>
                          <td width="1%" >&nbsp;</td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kode
                            Pos <%=((BiodataWNIP4BObject)vData.elementAt(i)).getKodepos()%>&nbsp;
                            Telp.<%=((BiodataWNIP4BObject)vData.elementAt(i)).getTelp()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" ><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                          <td width="1%" >
                            <div align="center"><font face="Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                        </tr>
                        <tr>
                          <td colspan="2" ><b ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">DATA
                            KEPIMILIKAN DOKUMEN</font></b></td>
                          <td width="1%" >
                            <div align="center"><font face="Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">19.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nomor
                            KTP/Nopen</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNo_ktp()%></font><font face="Verdana, Arial, Helvetica, sans-serif"></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">20.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nomor
                            Paspor</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNo_paspor()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">21.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Tanggal
                            Berakhir Paspor</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getTgl_akh_paspor()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">22.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kepemilikan
                            Akta/Surat Kenal Lahir</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <%temp= ((BiodataWNIP4BObject)vData.elementAt(i)).getNo_akta_lhr();%>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((temp==null || temp.trim().length()<2)?"TIDAK ADA":"ADA")%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">23.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">No.
                            Akta/Surat Kenal Lahir</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNo_akta_lhr()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" valign="top" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">24.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kepemilikan
                            Akta Perkawinan/Buku Nikah</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <% temp = ((BiodataWNIP4BObject)vData.elementAt(i)).getTgl_kwn();%>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif"><%=((temp==null || temp.trim().length()<2)?"TIDAK ADA":"ADA")%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">25.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">No
                            Akta Perkawinan/Buku Nikah</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNo_akta_kwn()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">26.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Tanggal
                            Perkawinan</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getTgl_kwn()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">27.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Kepemilikan
                            Akta Perceraian</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <% temp = ((BiodataWNIP4BObject)vData.elementAt(i)).getNo_akta_cerai();%>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif"><%=((temp==null || temp.trim().length()<2)?"TIDAK ADA":"ADA")%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">28.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">No.
                            Akta Perceraian/Surat Cerai</font></td>
                          <td width="1%" >
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">:</font></div>
                          </td>
                          <td width="47%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNo_akta_cerai()%></font></td>
                        </tr>
                        <tr>
                          <td width="7%" >
                            <div align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">29.</font></div>
                          </td>
                          <td width="45%" ><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Tanggal
                            Perceraian</font></td>
                          <td width="1%" >
                            <div align="center">:</div>
                          </td>
                          <td width="47%" >
                            <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=((BiodataWNIP4BObject)vData.elementAt(i)).getTgl_cerai()%></font></div>
                          </td>
                        </tr>
                        <tr>
                          <td width="7%" >&nbsp;</td>
                          <td width="45%" >&nbsp;</td>
                          <td width="1%" >&nbsp;</td>
                          <td width="47%" >&nbsp;</td>
                        </tr>
                      </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td>

                <table width="100%" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center">
                      <table width="150" border="0" cellspacing="1" cellpadding="0">
                        <tr>
                          <td  width="149">
                            <table width="100%" border="0" cellspacing="2" cellpadding="0">
                              <tr>
                                <td>
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Ketua
                                    RT/RW ,</b></font></div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td height="50"  valign="bottom" width="149">
                            <p align="center">&nbsp;</p>
                          </td>
                        </tr>
                        <tr>
                          <td  width="149">
                            <div align="center">
                              <hr>
                              <font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <td>
                      <table width="150" border="0" cellspacing="1" cellpadding="0" align="center">
                        <tr>
                          <td >
                            <table width="100%" border="0" cellspacing="2" cellpadding="0">
                              <tr>
                                <td>
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Petugas
                                    Registrar ,</b></font></div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td height="50"  valign="bottom">
                            <div align="center"></div>
                          </td>
                        </tr>
                        <tr>
                          <td >
                            <hr>
                            <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">NIP.</font></div>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <td>
                      <table width="100%" border="0" cellspacing="1" cellpadding="0" align="center" height="100%">
                        <tr>
                          <td >
                            <table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
                              <tr>
                                <td>
                                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Yang
                                    Bersangkutan,</b></font></div>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td height="50"  valign="bottom">
                            <div align="center"></div>
                          </td>
                        </tr>
                        <tr>
                          <td >
                            <div align="center"><u><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><u><%=((BiodataWNIP4BObject)vData.elementAt(i)).getNama_lgkp()%></u></font></u></div>
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
