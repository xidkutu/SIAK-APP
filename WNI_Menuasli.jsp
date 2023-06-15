<%@ page import="javax.naming.*,javax.rmi.*,java.util.*,pendaftaran.*,com.wilayah.*,com.db.connection.*,kartukeluarga.DataKelurahan"%>
<%@ include file="Global.jsp"%>
<%@ page import="siaktools.logwriter.SiakWriter"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.io.*"%>
<%!
    String select,id1=null;
    UserInfo1 record = null;
    Vector v = null;
     static  int i;
    Vector vDataKelurahan = new Vector();
%>

<%
     record=(UserInfo1)session.getAttribute("remoteRef");
try
    {
if(record != null)
        {
        vDataKelurahan = getDataKelurahan(record.getNoProp().trim(),record.getNoKab().trim(),record.getNoKec().trim());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>adminduk SIAK online</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<LINK href="Templates/s.css" rel=stylesheet>
<SCRIPT language=JavaScript src="Templates/ajlib.js">
</SCRIPT>
<SCRIPT language=JavaScript src="Templates/ajmenu.js">
</SCRIPT>
<script language="javascript" src="scripts/util.js">
</script>
<SCRIPT language="JavaScript">
ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#666699', '#CC0000','#ffffff','right');
ajmenu1.cellpadding = 3;
// menu utama
// Warna :	Sorot MenuUtama BG		#DEECFC
//			Hitam					#000000
//			Teks MenuUtama disorot	#CC0000
//			Teks MenuUtama normal	#666699
//			Teks listMenu			#F9FAA7
  ajmenu1.addItems('<font face="Verdana", size="1"></font>', '');
  ajmenu1.addItems('<img src="../images/aa_administrasi.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">UBAH KATA KUNCI</font>', 'UbahPassword.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENANDATANGAN DOKUMEN</font>', 'setup_KTP_KK_Bio_WNI.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">DAFTAR ESTIMASI NIK GANDA</font>', 'estimasi_nik_ganda_WNI_namalgkp.jsp');
  ajmenu1.addItems('<img src="../images/aa_masukan.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA KELUARGA</font>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">DATA INDIVIDU</font>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PINDAH DATANG</font>', '');
  ajmenu1.addItems('<img src="../images/aa_keluaran.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU KELUARGA</font>', 'DaftarKK.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK KARTU TANDA PENDUDUK</font>', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK BIODATA</font>', 'cetak_biodata_WNI.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK BIODATA P4B</font>', 'cetak_biodata_WNI_P4B.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">RIWAYAT TEMPAT TINGGAL</font>', 'riwayat_tempat_tinggal_WNI.jsp?sc=WNI');

//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------------------------------------------------------
//
//                          Pendaftaran Penduduk W N I
//
// -----------------------------------------------------------------------------------

// sub menu Data Keluarga
  ajmenu1 = new subMenu('7','transparent', '#3399CC', '#000066', '#FFFFFF', '../images/bg_menu2.gif');
  ajmenu1.addItems('<font face="Verdana", size="1"> Permohonan KK Baru</font>', "DataKeluarga_WNI_Entity.jsp");
  ajmenu1.addItems('<font face="Verdana", size="1">KK Baru (NIK Sudah Ada)</font>', 'Pen_KKWna_SudapunyaNik.jsp?source=WNI&status=NL'); //switch=1 for SudahPunyaNIk from Menu Directly
  ajmenu1.addItems('<font face="Verdana", size="1">Permohonan Numpang KK</font>', 'NumpangKK_Wna.jsp?source=WNI&status=NL');

// sub menu Data Individu
  ajmenu1 = new subMenu('8', 'transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');


  ajmenu1.addItems('<font face="Verdana", size="1">Biodata</font>', 'WNI_Header.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan Biodata</font>','Pendaftaran_Biodata_WNI_Edit1.jsp?destination=Pendaftaran_Biodata_WNI_Edit.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan Biodata P4B</font>','Pendaftaran_Biodata_WNI_Edit1.jsp?destination=Pendaftaran_Biodata_WNI_Edit_P4B.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan Pendidikan</font>','Perubahan_Pendidikan.jsp?destination=Perubahan_Pendidikan_Edit.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">Perubahan Pekerjaan</font>','Perubahan_Pekerjaan.jsp?destination=Perubahan_Pekerjaan_Edit.jsp');

// sub menu Pindah Datang
   ajmenu1 = new subMenu('9', 'transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Perpindahan (Daerah Asal)</font>', 'Perpindahan_Wna.jsp?source=WNI&status=AL');
   ajmenu1.addItems('<font face="Verdana", size="1">Kedatangan (Daerah Tujuan)</font>','Keda_Tujuan_Wna.jsp?source=WNI&status=TJ');

// sub menu CETAK KTP
   ajmenu1 = new subMenu('12', 'transparent', '#3399CC', '#000066', '#FFFFFF', 'images/bg_menu2.gif');
   ajmenu1.addItems('<font face="Verdana", size="1">Manual</font>','cetak_KTP_wni_mnl.jsp');
   ajmenu1.addItems('<font face="Verdana", size="1">Kertas Security</font>', 'cetak_KTP_WNI.jsp');
   ajmenu1.addItems('<font face="Verdana", size="1">PVC </font>','cetak_KTP_WNI_PVC.jsp');
   ajmenu1.addItems('<font face="Verdana", size="1">Teslin 8</font>','teslin_6.jsp');
   ajmenu1.addItems('<font face="Verdana", size="1">DKI </font>','ktp_dki.jsp');

function openIT(u,W,H,X,Y,n,b,x,m,r) {
	var cU  ='images/close.gif'   //gif for close on normal state.
	var cO  ='images/close.gif'  //gif for close on mouseover.
	var cL  ='images/clock.gif'      //gif for loading indicator.
	var mU  ='images/minimize.gif'     //gif for minimize to taskbar on normal state.
	var mO  ='images/minimize.gif'    //gif for minimize to taskbar on mouseover.
	var xU  ='images/max.gif'     //gif for maximize normal state.
	var xO  ='images/max.gif'    //gif for maximize on mouseover.
	var rU  ='images/restore.gif'     //gif for minimize on normal state.
	var rO  ='images/restore.gif'    //gif for minimize on mouseover.
	var tH  ='<font face=verdana size=2>adminduk SIAK offline</font>'   //title for the title bar in html format.
	var tW  ='adminduk SIAK offline'   //title for the task bar of Windows.
	var wB  ='#6699CC'   //Border color.
	var wBs ='#D5D5FF'   //Border color on window drag.
	var wBG ='#33CCCC'   //Background of the title bar.
	var wBGs='#66CCFF'   //Background of the title bar on window drag.
	var wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0'  //Html parameters for Netscape.
	var fSO ='scrolling=auto noresize'   //Html parameters for main content frame.
	var brd =b||5;   //Extra border size.
	var max =x||false;   //Maxzimize option (true|false).
	var min =m||false;   //Minimize to taskbar option (true|false).
	var res =r||false;   //Resizable window (true|false).
	var tsz =20;   //Height of title bar.
	return chromeless(u,n,W,H,X,Y,cU,cO,cL,mU,mO,xU,xO,rU,rO,tH,tW,wB,wBs,wBG,wBGs,wNS,fSO,brd,max,min,res,tsz)
}
</SCRIPT>
<META content="MSHTML 6.00.2800.1141" name=GENERATOR>
</HEAD>
<body  leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" text="#000000" link="#DEECFC" vlink="#DEECFC" alink="#DEECFC" onload="window.history.forward(1)">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="23" height="23" valign="top" background="images/wni1/meo-sdt-list.gif"><img src="images/wni1/meo-sdt-01.gif" width="23" height="23"></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
          <td valign="top">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td background="images/wni1/meo-header-list-kiri.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%"><img src="images/wni1/dot.gif" width="1" height="100"></td>
          </tr>
        </table>
          </td>
        <td width="100"><div align="right"><img src="images/wni1/meo-globe-anim.gif" width="140" height="140"></div></td>
        <td width="500" height="100"><img src="images/wni1/meo-header-wave.gif" width="672" height="140"></td>
      </tr>
    </table></td>
    <td><img src="images/wni1/meo-header-list-kanan.gif" width="23" height="140"></td>
  </tr>
  <tr>
    <td background="images/wni1/meo-sdt-list.gif">&nbsp;</td>
    <td width="100%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="200" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/wni1/x-head-s1.gif" width="230" height="110"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="9" height="9"><img src="images/wni1/meo-01sdt-01.gif" width="9" height="9"></td>
                <td background="images/wni1/meo-01sdt-up.gif"><img src="images/wni1/dot.gif" width="100%" height="1"></td>
                <td width="9" height="9"><img src="images/wni1/meo-01sdt-02.gif" width="9" height="9"></td>
              </tr>
              <tr>
                <td background="images/wni1/meo-01sdt-left.gif">&nbsp;</td>
                <td background="images/wni1/meo-bg-01.gif"><div align="center">
				<% String jsp = "data_wilayah_wni_klm.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
%>
                          <jsp:include page="<%=jsp%>"/>
				</div></td>
                <td background="images/wni1/meo-01sdt-right.gif">&nbsp;</td>
              </tr>
              <tr>
                <td width="9" height="9" valign="top"><img src="images/wni1/meo-01sdt-04.gif" width="9" height="9"></td>
                <td background="images/wni1/meo-01sdt-dwn.gif">&nbsp;</td>
                <td width="9" height="9" valign="top"><img src="images/wni1/meo-01sdt-03.gif" width="9" height="9"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><img src="images/wni1/me0-KTP-kiri.gif" width="164" height="205"> </td>
          </tr>
        </table></td>
        <td><img src="images/wni1/meo-batas.gif" width="16" height="505"></td>
        <td width="100%">
		<form name="form1" method="post" action="Logout.jsp">
		<TABLE width="90%" border=0 align=center cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR>
              <TD vAlign=top>
			  <input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
                                                <SCRIPT language="javascript">
                                                   function resetPage(obj) {
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
                                                      return true;
                                                   }
                                                </SCRIPT>
			  </TD>
            </TR>
            <TR>
              <TD vAlign=top height=238>
			  <script language=JavaScript>
	createMenu();
	</script>
 <script language=JavaScript>
	displayMenu();
	</script>
			  </TD>
            </TR>
            <TR>
              <TD vAlign=bottom height=35>
                <DIV align=center><B>
                  <INPUT class=boxstandard type=submit value=LOGOUT name=button>
              </B></DIV></TD>
            </TR>
          </TBODY>
        </TABLE>
		</form>
		</td>
      </tr>
    </table></td>
    <td background="images/wni1/meo-sdt-list-kanan.gif">&nbsp;</td>
  </tr>
  <tr>
    <td width="23" height="24" background="images/wni1/meo-sdt-list.gif">&nbsp;</td>
    <td background="images/wni1/meo-bg.gif">&nbsp;</td>
    <td width="23" height="24" background="images/wni1/meo-sdt-list-kanan.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="23"><img src="images/wni1/meo-sdt-02.gif" width="23" height="23"></td>
    <td background="images/wni1/meo-bawah.gif">&nbsp;</td>
    <td height="23"><img src="images/wni1/meo-sdt-03.gif" width="23" height="23"></td>
  </tr>
</table>
</body>
</html>
<%}
//     }
else
{
response.sendRedirect("index.jsp");
}
 }
catch(Exception e)
   {

try{
ResourceBundle res = ResourceBundle.getBundle("siaktools.logwriter.siaklog",
                                             Locale.getDefault());
        SiakWriter wr = new SiakWriter(res.getString("JSP_PATH"));
        wr.writeFile(e, "WNI_Menu.jsp");
}catch(Exception err)
     {

     }
  }
%>