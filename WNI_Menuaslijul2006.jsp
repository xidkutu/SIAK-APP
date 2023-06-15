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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
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
<BODY leftMargin=0 topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0" bgColor=#93BEE2 text="#000000" link="#DEECFC" vlink="#DEECFC" alink="#DEECFC" onload="window.history.forward(1)">
<form name="form1" method="post" action="Logout.jsp">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td background="images/v_bg_header.gif">
   <jsp:include page="topsr.html"/>
      </td>
  </tr>
  <tr>
    <td valign="top">
        <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
          <td valign="top">
            <table width="100%" border="0" cellspacing="3" cellpadding="3">
              <tr>
                <td height="-1">&nbsp; </td>
              </tr>
              <tr>
                                                <input type="hidden" name="namakel" value="<%=(request.getParameter("namakel")==null?"":request.getParameter("namakel"))%>">
                                                <SCRIPT language="javascript">
                                                   function resetPage(obj) {
                                                      document.all['no_kel'].value=obj.value;document.all['namakel'].value=obj.options[obj.selectedIndex].text;
                                                      return true;
                                                   }
                                                </SCRIPT>
                                             <td>
<% String jsp = "data_wilayah_wni.jsp?level=4&no_prop=" + record.getNoProp() + "&nama_prop=" + record.getNamaProp() +
      "&no_kab=" + record.getNoKab() + "&nama_kab=" + record.getNamaKab() + "&no_kec=" + record.getNoKec() + "&nama_kec=" + record.getNamaKec() +
      "&no_kel=" + (request.getParameter("no_kel")==null?"":request.getParameter("no_kel"));
%>
                          <jsp:include page="<%=jsp%>"/>
                                             </td>
              </tr>

            </table>
          </td>
        </tr>
        <tr>
            <td height="238" valign="top">
              <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#CBE0FA" height="25">
              <tr>
                <td width="5" height="5"><img src="images/v_sdt_kr_up.gif" width="5" height="5"></td>
                <td height="1"><img src="images/dot.gif" width="1" height="1"></td>
                <td width="5" height="5"><img src="images/v_sdt_kn_up.gif" width="5" height="5"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <table width="100%" border="0" cellspacing="5" cellpadding="0" align="center" height="100%">
                    <tr>
                      <td>
                        <table width="100" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#DEECFC" height="50">
                          <tr>
                            <td width="5" height="5"><img src="images/v_sdt_kr_up2.gif" width="5" height="5"></td>
                            <td height="1" width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_up2.gif" width="5" height="5"></td>
                          </tr>
                          <tr>
                            <td colspan="3">
                              <table width="90" border="0" cellspacing="0" cellpadding="0">
                                <tr valign="middle">
                                  <td width="15">
                                    <div align="center"><img src="images/dot.gif" width="15" height="8"></div>
                                    </td>
                                  <td height="25">
                                    <div align="center"><b></b></div>
                                    <div align="center">
 <script language=JavaScript>
	createMenu();
	</script>
 <script language=JavaScript>
	displayMenu();
	</script>
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td height="5" width="5"><img src="images/v_sdt_kr_btm2.gif" width="5" height="5"></td>
                            <td><img src="images/dot.gif" width="100%" height="1" hspace="1"></td>
                            <td width="5" height="5"><img src="images/v_sdt_kn_btm2.gif" width="5" height="5"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="5" height="5"><img src="images/v_sdt_kr_btm.gif" width="5" height="5"></td>
				<td height="1" width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                <td width="5" height="5"><img src="images/v_sdt_kn_btm.gif" width="5" height="5"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="35" valign="bottom">
            <div align="center"><b>
              <input class=boxstandard type="submit" value="LOGOUT" name="button">
              </b> </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp; </td>
  </tr>
</table>
<p class="linkyellow">&nbsp;</p>
</form>
</BODY></HTML>
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
