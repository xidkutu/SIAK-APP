ajmenu1 = new mainMenu('vertical',0, 'transparent', '#DEECFC', '#666699', '#CC0000','#ffffff','right');
 ajmenu1.cellpadding = 4;
// menu utama
// Warna :	Sorot MenuUtama BG		#DEECFC
//			Hitam					#000000
//			Teks MenuUtama disorot	#CC0000
//			Teks MenuUtama normal	#666699
//			Teks listMenu			#F9FAA7

  ajmenu1.addItems('<font face="Verdana", size="1"></font>', '');
  ajmenu1.addItems('<img src="images/aa_administrasi.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">UBAH KATA KUNCI</font>', 'UbahPassword.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENANDATANGAN DOKUMEN/AKTA-AKTA</font>', 'Setup_KTP_KK_Bio_WNA.jsp');

  ajmenu1.addItems('<img src="images/aa_masukan.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN KELAHIRAN</font>', 'Pencatatan_Kabupatein.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN KEMATIAN</font>', 'Kematian_Kabupaten.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN PERKAWINAN</font>', 'Kawin.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">PENCATATAN PERCERAIAN</font>', 'Perceraian.jsp');

  ajmenu1.addItems('<img src="images/aa_keluaran.gif">', '');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK AKTA KELAHIRAN</font>', 'cetak_akta_kelahiran_WNI.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK AKTA KEMATIAN</font>', 'cetak_akta_kematian.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK AKTA PERKAWINAN</font>', 'cetak_akta_perkawinan.jsp');
  ajmenu1.addItems('<font face="Verdana", size="1">CETAK AKTA PERCERAIAN</font>', 'cetak_akta_perceraian.jsp');


//buat panah menu
//ajmenu1.htmlBefore = '&nbsp;<img src="images/tri.gif" border="0">&nbsp;';
// -----------------------------------------------------------------------------------
//
//                         Menu Capil Kabupaten/Kota
//
// -----------------------------------------------------------------------------------
